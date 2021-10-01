Feature: Customer Certification
 #Genkin
  Scenario Outline: Create and update a customer
    Given create a new customer
      | name      | <name>      |
      | address   | <address>   |
      | city      | <city>      |
      | avatar    | <avatar>    |
      | ages      | <ages>      |
      | createdAt | <createdAt> |
      | updateAt  | <updateAt>  |
      | ranking   | <ranking>   |
    #  | images    | <images>    |

    When response return status code matching 200
    And the response has key "name" matching value "<name>"
    And the response has key "address" matching value "<address>"
    And the response has key "city" matching value "<city>"
    And the response has key "avatar" matching value "<avatar>"
    And the response has key "ages" matching value "<ages>"
    And the response has key "createdAt" matching value "<createdAt>"
    And the response has key "updateAt" matching value "<updateAt>"
    And the response has key "ranking" matching value "<ranking>"
    #And the response has key "images" matching value "<images>"

    #Get check list customer with data created
    Given a list of customer are available following attribute
      | name      | <name>      |
      | address   | <address>   |
      | city      | <city>      |
      | avatar    | <avatar>    |
      | ages      | <ages>      |
      | createdAt | <createdAt> |
      | updateAt  | <updateAt>  |
      | ranking   | <ranking>   |
  #  | images    | <images>    |
    When response return status code matching 200
    Then view a customer just created
    And customer is  existing in list
   # And the response has json path "$.[0].name" contains "<name>" elements

    #Put update a customer
    Given update an existing customer full attribute
      | name      | <name_updated>      |
      | address   | <address_updated>   |
      | city      | <city_updated>      |
      | avatar    | <avatar_updated>    |
      | ages      | <ages_updated>      |
      | createdAt | <createdAt_updated> |
      | updateAt  | <updateAt_updated>  |
      | ranking   | <ranking_updated>   |
    #  | images    | <images_updated>    |

    When response return status code matching 200
    And the response has key "name" matching value "<name_updated>"
    And the response has key "address" matching value "<address_updated>"
    And the response has key "city" matching value "<city_updated>"
    And the response has key "avatar" matching value "<avatar_updated>"
    And the response has key "ages" matching value "<ages_updated>"
    And the response has key "createdAt" matching value "<createdAt_updated>"
    And the response has key "updateAt" matching value "<updateAt_updated>"
    And the response has key "ranking" matching value "<ranking_updated>"
    #And the response has key "images" matching value "<images_updated>"

    #Get check data of customer with name
    And view a customer just created
    And the response has key "name" matching value "<name_updated>"
    And the response has key "address" matching value "<address_updated>"
    And the response has key "city" matching value "<city_updated>"
    And the response has key "avatar" matching value "<avatar_updated>"
    And the response has key "ages" matching value "<ages_updated>"
    And the response has key "createdAt" matching value "<createdAt_updated>"
    And the response has key "updateAt" matching value "<updateAt_updated>"
    And the response has key "ranking" matching value "<ranking_updated>"
    #And the response has key "images" matching value "<images_updated>"


    #Detele customer - clean data
    When remove a customer
    Then response return status code matching 200
    #Get customer just remove
    And view a customer just removed
    And response return status code matching 404


    Examples:
      | name        | name_updated | address               | address_updated      | city                | city_updated | avatar                                                     | avatar_updated                                   | ages | ages_updated | createdAt                | createdAt_updated        | updateAt                         | updateAt_updated         | ranking_updated | ranking | images | images_updated |
      | Hieu Nguyen | Roy          | 123 hoang dieu        | 789 hoang dieu       | Ondrickashire       | Indo         | https://cdn.fakercloud.com/avatars/vijaykarthik_128.jpg    | c                                                | 35   | 36           | 2021-06-01T19:32:31.714Z | 2021-05-23T10:18:37Z     | 2021-12-12T05:32:31.123Z         | 2021-11-11T10:21:15.147Z | 2               | 1       | null   | random         |
#      | Thuy Linh   | Lyn          | 12/3/34/8/5 duong so1 | 28911 Dickens Shoals | Cali                | Malay        | https://albertaugustin/20/20.jpg                           | https://cdn.fakercloud.com/sdfsfntfblog_128.jpg  | 22   | 23           | 2021-09-29T10:10:49.541Z | 2021-03-01T22:32:31.465Z | 2021-02-03T00:02:12.314Z.0239508 | 2021-06-01T19:32:31.174Z | 3               | 2       | null   | random         |
#      | Bich Ngoc   | Gem          | 2930 ben van don      | 2930 nguyen trai     | hcm                 | Bali         | https://cdn.fakercloud.com/avatars/bartoszdawydzik_128.jpg | https://avatars/noc_128.jpg                      | 20   | 19           | 2021-02-03T00:02:12.314Z | 2021-04-09T10:19:56.649Z | 2021-06-30T19:32:31.956Z         | 2021-09-29T10:10:49.541Z | 1               | 3       | null   | random         |
#      | Mika        | Elsa         | 43/5 abc              | 2399 Salma Coves     | North Cleoraborough | Lao          | https://albertaugustin_128.jpg                             | https://cdn.fakercloud.com/avatars/dog_128.jpg   | 6    | 22           | 2021-05-23T10:18:11.37Z  | 2021-06-01T19:32:31.174Z | 2021-11-11T10:21:15.147Z         | 2021-03-01T22:32:31.465Z | 7               | 4       | null   | random         |
#      | Gau         | Iris         | 12 tran hung dao      | 1 khanh hoi          | hcm                 | Paris        | https://bartoszdawydzik_128.jpg                            | https://cdn.fakercloud.com/simple_1.jpg          | 4    | 0            | 2021-04-09T12:19:56.649Z | 2021-09-29T10:10:49.541Z | 2021-09-29T10:25:28.595Z         | 2021-04-09T10:19:56.649Z | 4               | 5       | null   | random         |
#      | Lu          | Mabel        | duong 41              | 621 Giovanni Groves  | Korean              | England      | https://cdn.fakercloud.com/avatars/goddardlewis_128.jpg    | https://cdn.fakercloud.com/avatars/vxvsd_2.jpg   | 3    | 50           | 2021-11-11T10:21:15.147Z | 2021-12-12T05:32:31.123Z | 2021-05-23T10:18:37Z.0239508     | 2021-09-29T10:25:28.595Z | 8               | 6       | null   | random         |
#      | Bun         | Melanie      | duongso 2             | 1 Lake Earl          | Indo                | France       | https://cdn.fakercloud.com/avatars/agustincruiz_128.jpg    | https://cdn.fakercloud.com/avatars/ntfblog_0.jpg | 3    | 27           | 2021-06-01T19:32:31.174Z | 2021-06-30T19:32:31.956Z | 2021-03-01T22:32:31.465Z         | 2021-12-12T05:32:31.123Z | 5               | 7       | null   | random         |
#      | Json        | Butterfly    | duongso 10            | ngo 3 ha tay         | HaNoi               | Italy        | https://cdn.fakercloud.com/avatars/ntfblog_128.jpg         | https://cdn.fakercloud.com/jvhdfj_8.jpg          | 18   | 30           | 2021-12-12T05:32:31.123Z | 2021-02-03T00:02:12.314Z | 2021-04-09T10:19:56.649Z         | 2021-05-23T10:18:37Z     | 10              | 8       | null   | random         |
#      | lavender    | Donna        | duongso 5             | 501 Gracie Springs   | Thailand            | Canada       | https://cat_12.jpg                                         | https://cdn.fakercloud.com/dfgsdjk_9.jpg         | 120  | 98           | 2021-03-01T22:32:31.465Z | 2021-09-29T10:25:28.595Z | 2021-06-01T19:32:31.174Z         | 2021-06-30T19:32:31.956Z | 9               | 9       | null   | random         |
#      | hi          | BaLoo        | 99/14/25              | 774 Metz Track       | Lake Earl           | Brazil       | https://cdn.fakercloud.com/avatars/jwalter14_128.jpg       | https://cdn.fakercloud.com/bchjdsgfjaf_11.jpg    | 0    | 2            | 2021-06-30T19:32:31.956Z | 2021-11-11T10:21:15.147Z | 2021-09-29T10:10:49.541Z         | 2021-02-03T00:02:12.314Z | 6               | 10      | null   | random         |
#
#







