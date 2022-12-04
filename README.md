![](https://img.shields.io/badge/Rails-5.2.8-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Ruby-2.7.4-orange)
# Wedding Website - BE
The RESTful API for M + M Wedding Website

***

## Local Setup
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate}`

<details>
  <summary><b> Database Schema </b></summary>
  <img width="667" alt="Database Schema" src="https://user-images.githubusercontent.com/16493270/205514059-34bb0093-bc6a-44e3-bc2e-6e788d43f40f.png">
</details>

<details>
  <summary><b> Create, Drop, and Seed the Database </b></summary>

After Local Setup is complete:

- type `rails db:create` to create the database
- type `rails db:migrate` to create the database
- type `rails db:drop` to drop the database
- type `rails db:seed` to seed the database
</details>

<details>
  <summary><b> Testing </b></summary>

After Local Setup is complete:

- type `bundle exec rspec` to run tests

</details>

***

## Endpoints

<details>
  <summary><b> List of all guests </b> </summary>
  
```shell
Get https://wedding-backend.fly.dev/guests/
```
---
```
[
  {
      "id": 2,
      "first_name": "Sung",
      "last_name": "Deckow",
      "email": "lavon_boyer@dare.info",
      "rsvp": "yes",
      "diet": "Et est natus aut.",
      "meals": "MyText",
      "payment_method": 1,
      "arrival_date": "friday",
      "party_count": 1,
      "plus_one_count": 0,
      "comments": "Rerum autem dolores provident.",
      "lodging_id": 10,
      "team_id": 1,
      "created_at": "2022-12-04T20:04:16.933Z",
      "updated_at": "2022-12-04T20:04:16.933Z",
      "kids": [],
      "plus_ones": []
  },
  {
      "id": 3,
      "first_name": "Ethan",
      "last_name": "Bartell",
      "email": "delmer@ruecker.org",
      "rsvp": "yes",
      "diet": "Ut esse dignissimos velit.",
      "meals": "MyText",
      "payment_method": 1,
      "arrival_date": "saturday",
      "party_count": 1,
      "plus_one_count": 1,
      "comments": "Laborum voluptatum et perspiciatis.",
      "lodging_id": 3,
      "team_id": 1,
      "created_at": "2022-12-04T20:04:16.936Z",
      "updated_at": "2022-12-04T20:04:16.936Z",
      "kids": [
          {
              "id": 2,
              "name": "Renea Nolan",
              "age": 5,
              "lodging_id": 2,
              "team_id": 1
          }
      ],
      "plus_ones": [
          {
              "id": 2,
              "name": "Avelina Nitzsche",
              "lodging_id": 5,
              "team_id": 1
          }
      ]
  },
  {
      "id": 4,
      "first_name": "Jimmie",
      "last_name": "Reilly",
      "email": "ferdinand.gerlach@turcotte.net",
      "rsvp": "no",
      "diet": "Sed ut dolores aut.",
      "meals": "MyText",
      "payment_method": 1,
      "arrival_date": "saturday",
      "party_count": 1,
      "plus_one_count": 0,
      "comments": "Qui deserunt et veritatis.",
      "lodging_id": 10,
      "team_id": 1,
      "created_at": "2022-12-04T20:04:16.943Z",
      "updated_at": "2022-12-04T20:04:16.943Z",
      "kids": [],
      "plus_ones": []
  } 
]
```

</details>

<details>
<summary><b> Show one guest </b> </summary>

```shell
Get https://wedding-backend.fly.dev/guests/1/
```
---
```
{
  "id": 1,
  "first_name": "Kacy",
  "last_name": "Lueilwitz",
  "email": "terrilyn@schneider.biz",
  "rsvp": "yes",
  "diet": "Voluptatem et molestiae blanditiis.",
  "meals": "MyText",
  "payment_method": 1,
  "arrival_date": "saturday",
  "party_count": 2,
  "plus_one_count": 1,
  "comments": "Facilis harum assumenda mollitia.",
  "lodging_id": 8,
  "team_id": 1,
  "created_at": "2022-12-04T20:04:16.903Z",
  "updated_at": "2022-12-04T20:06:34.873Z",
  "kids": [
      {
          "id": 1,
          "name": "Deanna Okuneva Ret.",
          "age": 0,
          "lodging_id": 8,
          "team_id": 1
      }
  ],
  "plus_ones": [
      {
          "id": 1,
          "name": "Alvina Padberg DVM",
          "lodging_id": 8,
          "team_id": 1
      }
  ]
}
```
  
</details>

<details>
  <summary><b>List of lodgings with occupants</b></summary>
  
```shell
GET https://wedding-backend.fly.dev/lodgings
```
```
[
  {
      "id": 1,
      "name": "Mercury",
      "lodging_type": "rv",
      "capacity": 6,
      "url": "brown.com",
      "description": "Voluptas ab iusto sed.",
      "created_at": "2022-12-04T20:04:16.858Z",
      "updated_at": "2022-12-04T20:04:16.858Z",
      "guests": [
          {
              "first_name": "Rupert",
              "last_name": "Klocko"
          },
          {
              "first_name": "Liz",
              "last_name": "Douglas"
          }
      ],
      "kids": [
          {
              "name": "Neva Mosciski"
          },
          {
              "name": "Pamelia Bartoletti"
          }
      ],
      "plus_ones": [
          {
              "name": "Bobby Stehr"
          }
      ]
  },
  {
      "id": 2,
      "name": "Venus",
      "lodging_type": "coed",
      "capacity": 6,
      "url": "mcdermott-dickinson.net",
      "description": "Dolorem magnam occaecati modi.",
      "created_at": "2022-12-04T20:04:16.860Z",
      "updated_at": "2022-12-04T20:04:16.860Z",
      "guests": [
          {
              "first_name": "Lilla",
              "last_name": "Becker"
          },
          {
              "first_name": "Orval",
              "last_name": "Renner"
          }
      ],
      "kids": [
          {
              "name": "Renea Nolan"
          },
          {
              "name": "Trula Purdy III"
          }
      ],
      "plus_ones": [
          {
              "name": "Gov. Cesar Wuckert"
          },
          {
              "name": "Quentin Bradtke"
          }
      ]
  }
]
```

</details>

<details>
  <summary><b>Edit Guest</b></summary>
  
```shell
PATCH https://wedding-backend.fly.dev/guests/1/
Content-Type: application/json
Accept: application/json
body:
{
  "first_name": "John"
  "last_name": "Doe"
  "email": "Example@email.com"
  "rsvp": ["no" / "yes" / "pending"]
  "diet": "Allegy: Peanut"
  "meals": "Not Implemented dont use"
  "payment_method":  "Not Implemented use integer"
  "arrival_date": "Friday"
  "plus_one_count": 0
  "comments": "Can't Wait!"
  "lodging_id": 1
  "team_id": 1
}
```

</details>

***

## Created by:
  - **Michael Bonini** - *Software Engineer* - [GitHub Profile](https://github.com/mkbonini) - [LinkedIn](https://www.linkedin.com/in/michael-bonini-187157131/)
