Prerequisites
===================

 - [Docker and docker-compose](https://docs.docker.com/engine/installation)

----------

Installation
-------------
 1. Start docker installed previously

 2. Clone the repository code
 3. Navigate to the source code folder and type: `$ docker-compose build`
 4. `$ docker-compose up`

The API is ready on address [http://localhost:4000/api](http://localhost:4000/api)

----------
Tests
-------------
**1. Create a PDV - POST - [http://localhost:4000/api/pdvs](http://localhost:4000/api/pdvs)**

```json
{
 "trading_name": "Adega da Cerveja - Pinheiros",
 "owner_name": "Zé da Silva",
 "document": "81355398000180",
 "coverage_area": { 
  "type": "MultiPolygon", 
  "coordinates": [
	  [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
	  [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
   ]
  },
 "address": { 
  "type": "Point",
  "coordinates": [-46.57421, -21.785741]
 }
}
```    
  
  **2. Get a PDV - GET - [http://localhost:4000/api/pdvs/{id}](http://localhost:4000/api/pdvs)**


  **3. Search PDV - GET - [http://localhost:4000/api/pdvs?lat={lat}&lng={lng}](http://localhost:4000/api/pdvs)**
