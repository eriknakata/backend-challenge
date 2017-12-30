Prerequisites
===================

 - [Docker and docker-compose](https://docs.docker.com/engine/installation)

----------

Installation
-------------
 1. Start docker installed previously

 2. Clone the repository code
 3. Navigate to the source code folder and type: `$ docker-compose build`
 4. `$ docker-compose up -d postgres`
 5. `$ docker-compose run phoenix mix ecto.create`
 6. `$ docker-compose run phoenix mix ecto.migrate`
 7. `$ docker-compose run phoenix`

The API is ready on address [http://localhost:4000/api](http://localhost:4000/api)

> **Note:**

> - In a production environment the CI server is responsible for run the migration before run the app, so the steps above would be simple such as `docker-compose up`

----------
Tests
-------------
**1. Create a PDV - POST - [http://localhost:4000/api/pdvs](http://localhost:4000/api/pdvs)**

	 {
        "tradingName": "Adega da Cerveja - Pinheiros",
        "ownerName": "Zé da Silva",
        "document": "14321321238910001",
        "coverageArea": { 
          "type": "MultiPolygon", 
          "coordinates": [
            [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
            [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
          ]
        },
        "address": { 
          "type": "Point",
          "coordinates": [-46.57421, -21.785741]
        },
    }
  
  **2. Get a PDV - GET - [http://localhost:4000/api/pdvs/{id}](http://localhost:4000/api/pdvs)**


  **3. Search PDV - GET - [http://localhost:4000/api/pdvs?lat={lat}&lng={lng}](http://localhost:4000/api/pdvs)**

	 {
		"id": 1,
        "tradingName": "Adega da Cerveja - Pinheiros",
        "ownerName": "Zé da Silva",
        "document": "14321321238910001",
        "coverageArea": { 
          "type": "MultiPolygon", 
          "coordinates": [
            [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
            [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
          ]
        },
        "address": { 
          "type": "Point",
          "coordinates": [-46.57421, -21.785741]
        },
    }