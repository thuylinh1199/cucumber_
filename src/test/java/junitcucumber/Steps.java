package junitcucumber;
import java.util.List;
import java.util.Map;

import io.cucumber.core.gherkin.vintage.internal.gherkin.deps.com.google.gson.Gson;
import io.cucumber.java.en.And;
import io.restassured.specification.ResponseSpecification;
import org.junit.Assert;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Steps {
    private static final String BASE_URL = "https://vg0t09u4h5.execute-api.ap-southeast-2.amazonaws.com";
    private static Response response;
    private static String jsonString;
    private String customerId;
    private RequestSpecification request;
    public Steps() {
        request = ((ResponseSpecification)((RequestSpecification)RestAssured.with()
                .urlEncodingEnabled(false).log().everything()).response().log().everything()).request();
        request.baseUri(BASE_URL);
    }

    @Given("create a new customer")
    public void createANewCustomer(Map<String, String> map) {
        request.header("Content-Type", "application/json");
        request.header("Accept","application/json");
        Gson gson = new Gson();

        response = request.body(gson.toJson(map))
                .post("/v1/customers");

        customerId = response.jsonPath().get("id");
    }

    @When("response return status code matching {int}")
    public void responseReturnStatusCodeMatching(int expectedCode) {
        int statusCode = response.getStatusCode();
        Assert.assertEquals(expectedCode, statusCode);
    }

    @Given("a list of customer are available following attribute")
    public void listOfCustomerAreAvailable(Map<String, String > expectedItems) {
        response = request.body("").get("/v1/customers");
        jsonString = response.asString();
        System.out.println(response.statusCode());
        System.out.println(jsonString);
        Assert.assertEquals(200, response.getStatusCode());
        List<Map<String, String >> list = response.jsonPath().getList("customers");
        for (Map<String , String > items : list ) {
            if (items.get("id").equals(customerId)) {
                for (String key : expectedItems.keySet()) {
                    Assert.assertEquals(expectedItems.get(key), items.get(key));
                }
                break;
            }
        }
    }

    @Then("view a customer just created")
    public void view() {
        RestAssured.baseURI = BASE_URL;
        RequestSpecification request = RestAssured.given();
        response = request.body("").get("/v1/customers/"+ customerId );
        request.header("Content-Type", "application/json");
    }

    @And("customer is  existing in list")
    public void customerIsExistingInList() {
    }

    @Given("update an existing customer full attribute")
    public void updateACustomerName(Map<String, String> map) {
        request.header("Content-Type", "application/json");
        request.header("Accept","application/json");
        Gson gson = new Gson();

        response = request.body(gson.toJson(map))
                .put("/v1/customers/" + customerId);
        customerId = response.jsonPath().get("id");

    }

    @And("the response has key {string} matching value {string}")
    public void theResponseHasKeyMatchingValue(String key, String expectedValue) {
        Assert.assertEquals(expectedValue, response.jsonPath().get(key));
    }

    @And("view a customer just updated")
    public void viewUpdate() {
        RestAssured.baseURI = BASE_URL;
        RequestSpecification request = RestAssured.given();
        response = request.body("").get("/v1/customers/"+ customerId );
        request.header("Content-Type", "application/json");

    }

    @Given("remove a customer")
    public void removeACustomerById() {
        request.header("Content-Type", "application/json");
        response = request.delete("v1/customers/" + customerId );

    }

    @And("view a customer just removed")
    public void theCustomerIsRemoved() {
        RestAssured.baseURI = BASE_URL;
        RequestSpecification request = RestAssured.given();
        response = request.body("").get("v1/customer/" + customerId);
        request.header("Content-Type", "application/json");
    }

}
