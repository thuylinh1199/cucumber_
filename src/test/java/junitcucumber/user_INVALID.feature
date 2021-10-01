Feature: Customer Certification
 #Genkin
  Scenario Outline: Create and update a customer didnt pass
    Given create a new customer
      | name      | null        |
      | address   | <address>   |
      | city      | <city>      |
      | avatar    | <avatar>    |
      | ages      | <ages>      |
      | createdAt | <createdAt> |
      | updateAt  | <updateAt>  |
      | ranking   | <ranking>   |
      | images    | <images>    |

    When response return status code matching 200

    #Get check list customer with data created
    Given a list of customer are available following attribute
      | name      | null        |
      | address   | <address>   |
      | city      | <city>      |
      | avatar    | <avatar>    |
      | ages      | <ages>      |
      | createdAt | <createdAt> |
      | updateAt  | <updateAt>  |
      | ranking   | <ranking>   |
      | images    | <images>    |
    When response return status code matching 200
    Then view a customer just created

    #Get check list customer is exist
    And customer is  existing in list
    #Get check list customer not found

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
      | images    | <images_updated>    |

    When response return status code matching 400

    #Get check data of customer with name
    And view a customer just created

    #Detele customer - clean data
    When remove a customer
    Then response return status code matching 400
    #Get customer just remove
    And view a customer just removed
    And response return status code matching 404


    Examples:
      | name          | name_updated | address                  | address_updated             | city          | city_updated | avatar                                                     | avatar_updated                                   | ages | ages_updated | createdAt                | createdAt_updated        | updateAt                  | updateAt_updated         | ranking_updated | ranking | images                               | images_updated                      |
      | null          | Roy          | 123 Hoang Dieu           | 789 hoang dieu              | Ondrickashire | Indo         | https://cdn.fakercloud.com/avatars/vijaykarthik_128.jpg    | c                                                | 35   | 36           | 2021-06-01T19:32:31.714Z | 2021-05-23T10:18:37Z     | 2021-12-12T05:32:31.123Z  | 2021-11-11T10:21:15.147Z | 2               | 1       | http://placeimg.com/640/480/abstract | http://juice.com/640/480/abstract   |
#      | Thuy Linhhhhh | Lyn          | 12/3/34/8/5 Duong so1    | 28911 Dickens Shoals        | Cali          | Malay        | https://albertaugustin/20/20.jpg                           | https://cdn.fakercloud.com/sdfsfntfblog_128.jpg  | 22   | 23           | 2021-09-29T10:10:49.541Z | 2021-03-01T22:32:31.465Z | 2021-02-03T00:02:12.314Z  | 2021-06-01T19:32:31.174Z | 3               | 2       | http://hi.com/640/480/his            | http://water.com/640/480/abstract   |
#      | B             | Gem          | 2930 Ben Van Don         | 2930 nguyen trai            | hcm           | Bali         | https://cdn.fakercloud.com/avatars/bartoszdawydzik_128.jpg | https://avatars/noc_128.jpg                      | 20   | 19           | 2021-02-03T00:02:12.314Z | 2021-04-09T10:19:56.649Z | 2021-06-30T19:32:31.956Z  | 2021-09-29T10:10:49.541Z | 1               | 3       | http://smile.com/640/480/smiles      | http://lap.com/640/480/abstract     |
#      | Mika          | Elsa         | 43/5 abc                 | 2399 Salma Coves            | null          | Lao          | https://albertaugustin_128.jpg                             | https://cdn.fakercloud.com/avatars/dog_128.jpg   | 6    | 22           | 2021-05-23T10:18:11.37Z  | 2021-06-01T19:32:31.174Z | 2021-11-11T10:21:15.147Z  | 2021-03-01T22:32:31.465Z | 7               | 4       | http://baby.com/640/480/babies       | http://ring.com/640/480/abstract    |
#      | Gau           | Iris         | Tinh Tien Giang          | 1 khanh hoi                 | hcm           | Paris        | https://bartoszdawydzik_128.jpg                            | https://cdn.fakercloud.com/simple_1.jpg          | 4    | 0            | 2021-04-09T12:19:56.649Z | 2021-09-29T10:10:49.541Z | 2021-09-29T10:25:28.595Z  | 2021-04-09T10:19:56.649Z | 4               | 5       | http://bambom.com/640/480/her        | http://glass.com/640/480/abstract   |
#      | Lu            | Mabel        | 123/43/2/45/5/6/7/864    | 621 Giovanni Groves         | Korean        | England      | https://cdn.fakercloud.com/avatars/goddardlewis_128.jpg    | https://cdn.fakercloud.com/avatars/vxvsd_2.jpg   | 3    | 50           | 2021-11-11T10:21:15.147Z | 2021-12-12T05:32:31.123Z | 2021-05-23T10:18:23.372Z  | 2021-09-29T10:25:28.595Z | 8               | 6       | http://apple.com/640/480/apples      | http://bag.com/640/480/abstract     |
#      | Bun           | Melanie      | Duong so 2               | 1 Lake Earl                 | Indo          | France       | https://cdn.fakercloud.com/avatars/agustincruiz_128.jpg    | https://cdn.fakercloud.com/avatars/ntfblog_0.jpg | 3    | 27           | 2021-06-01T19:45:31.174Z | 2021-06-30T19:32:31.956Z | 2021-03-01T22:32:31.465Z  | 2021-12-12T05:32:31.123Z | 5               | 7       | http://city.com/640/480/cities       | http://house.com/640/480/abstract   |
#      | Json          | Butterfly    | 1 cat tiennnnnnnnnnnn    | ngo 3 ha tay                | HaNoi         | Italy        | https://cdn.fakercloud.com/avatars/ntfblog_128.jpg         | https://cdn.fakercloud.com/jvhdfj_8.jpg          | 18   | 30           | 2021-12-12T05:34:56.123Z | 2021-02-03T00:02:12.314Z | 2021-04-09T10:19:56.649Z  | 2021-05-23T10:18:37Z     | 10              | 8       | http:/page.com/640/480/pages         | http://balo.com/640/480/abstract    |
#      | lavender      | Donna        | Duong so 5               | 501 Gracie Springs          | Thailand      | Canada       | https://cat_12.png                                         | https://cdn.fakercloud.com/dfgsdjk_9.jpg         | 120  | 98           | 2021-03-01T22:55:45.465Z | 2021-09-29T10:25:28.595Z | 2021-06-01T19:32:31.174Z  | 2021-06-30T19:32:31.956Z | 9               | 9       | http://phone.com/640/480/phone       | http://hair.com/640/480/abstract    |
#      | hi            | BaLoo        | 119/7 Duong so 7         | 119/7/2/3 Duong so 7        | hcm           | Brazil       | https://avatars/jwalter14_128/10000/10000.jpg              | https://avatars/cook_1.jpg                       | 19   | 20           | 2021-05-30T19:22:34.956Z | 2021-11-11T10:21:15.147Z | 2021-09-29T10:10:49.541Z  | 2021-02-03T00:02:12.314Z | 19              | 10      | http://skin.com/640/480/skin         | http://sticker.com/640/480/abstract |
#      | Bernie        | Alan         | 185 Le Quang Dinh        | 7185 Le Quang Dinh          | hcm           | Hoi An       | https://cdn.fakercloud.com/avatars/sgg_1.jpg               | https://avatars/l_2.jpg                          | 20   | 21           | T00:46:31.456Z           | 2021-06-01T19:32:31.714Z | 2021-08-30T19:12:34.896Z  | 2021-06-01T19:32:31.714Z | 14              | 11      | http://a.com/640/480/banana          | http://l.com/640/480/abstract       |
#      | Clinton       | Kenneth      | 10 Au Duong Lan          | 11 Au Duong Lan             | Thu Duc       | Viet Tri     | https://cdn.fakercloud.com/avatars/dssf_2.jpg              | https://avatars/q_3.jpg                          | 21   | 23           | 2222-07-10T20:34:56.276Z | 2021-04-09T12:19:56.649Z | 2021-09-29T10:10:49.541Z  | 2021-04-09T12:19:56.649Z | 16              | 12      | http://b.com/640/480/watermelon      | http://m.com/640/480/abstract       |
#      | Corbin        | Andrew       | 298 No Gia Tu            | 289 No Gia Tu               | Da Nang       | Thai Nguyen  | https://cdn.fakercloud.com/avatars/dsfdvcx_3.jpg           | https://avatars/w_4.jpg                          | 22   | 34           | 2021-08-30               | 2021-09-29T10:25:28.595Z | 2021-08-30T19:12:34.896Z  | 2021-09-29T10:25:28.595Z | 10              | 13      | http://c.com/640/480/avocado         | http://n.com/640/480/abstract       |
#      | Finn          | Chad         | 282a Nguyen Tri Phuong   | 282 Nguyen Tri Phuong       | Can Tho       | Cam Ranh     | https://cdn.fakercloud.com/avatars/etwet_4.jpg             | https://avatars/e_4.jpg                          | 23   | 17           | 2021-09-90T07:23:21.346Z | 2021-11-11T10:21:15.147Z | 2021-09-29T10:10:49.541Z  | 2021-12-12T05:32:31.123Z | 18              | 15      | http://d.com/640/480/skin.png        | http://o.com/640/480/abstract       |
#      | Basil         | Leon         | 521/14 Cach Mang Thang 8 | 521/14/25 Cach Mang Thang 8 | Vinh          | Thanh Hoa    | https://cdn.fakercloud.com/avatars/trggds_4.jpg            | https://avatars/r_6.jpg                          | 44   | 45           | 2021-01-12T09:76:34.666Z | 2021-05-23T10:18:11.37Z  | 2021-01-12T09:76:34.666Z  | 2021-02-03T00:02:12.314Z | 6               | 14      | http://e.com/1450000/120000/orange   | http://p.com/640/480/abstract       |
#      | Edsel         | Vincent      | 193 Nguyen Tieu La       | 19 Nguyen Tieu La           | Nha Trang     | Hai Phong    | https://cdn.fakercloud.com/avatars/rgdfdf_6.jpg            | https://avatars/t_9.jpg                          | 34   | 36           | 2021-12-12T05:32:43.123Z | 021-02-03T00:02:12.314Z  | 2021-12-12T05:32:31.123Z  | 2021-09-90T07:23:21.346Z | 13              | -16     | http://f.com/640/480/mandarin        | http://w.com/640/480/abstract       |
#      | Elmer         | William      | 99 To Hien Thanh         | 9 To Hien Thanh             | Da Lat        | Tam Ki       | https://cdn.fakercloud.com/avatars/fgdre_5.jpg             | https://avatars/j_32.jpg                         | 54   | 56           | 2021-11-11T10:21:54.147Z | 2021-11-11T10:21:15.147Z | 2021-11-11T10:21:15.147Z  | 2021-01-12T09:76:34.666Z | 17              | 1200    | http://g.com/640/480/lime            | http://v.com/640/480/abstract       |
#      | Magnus        | Henry        | 235/1 Bach Dang          | 235/1 Bach Dang             | Quy Nhon      | Vinh Yen     | https://cdn.fakercloud.com/avatars/jretert_7.jpg           | https://avatars/i_789.jpg                        | 65   | 55           | 2021-09-29T10:25:52.595Z | 2021-08-30T19:12:34.896Z | 2021-09-29T10:25:28.595Z  | 2021-08-30T19:12:34.896Z | 11              | 18.98   | http://j.com/640/480/cherry          | http://t.com/640/480/abstract       |
#      | Nolan         | Raymond      | Cau vuot                 | 2 Bai Trang                 | Vung Tau      | Ha tinh      | https://cdn.fakercloud.com/avatars/wefdssdf_8.jpg          | https://avatars/k_70.jpg                         | 200  | 89           | 2021-04-09T12:19:11.649Z | 2021-01-12T09:76:34.666Z | 2021-04-09T12:19:56.649Z  | 2021-02-03T00:02:12.314Z | 12              | 19      | http://h.com/640/480/sugar           | http://q.com/640/480/abstract       |
#      | Lagan         | Roy          | Cau Da                   | 12 Cau Da                   | Ha Tien       | Long An      | https://cdn.fakercloud.com/avatars/fdgfdg_9.jpg            | https://avatars/m_6.jpg                          | 0    | 77           | 2021-06-01T19:32:44.714Z | 2021-09-90T07:23:21.346Z | 22021-06-01T19:32:31.714Z | 2021-09-29T10:10:49.541Z | 15              | 20      | http://i.com/640/480/peach           | http://z.com/640/480/abstract       |
#    #  |             |              |                          |                             |                     |              |











