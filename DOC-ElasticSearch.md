```js
//show all index
GET
http://127.0.0.1:9200/_cat/indices?v

//create Index Shop
PUT
http://127.0.0.1:9200/shop

//delete Index Shop
DELETE
http://127.0.0.1:9200/shop

//create document
POST
http://127.0.0.1:9200/shop/_doc
{
  "id":"123",
  "name":"java",
  "price":"1000"
}

//get document
GET
http://127.0.0.1:9200/shop/_doc/${id}

//get all document
GET
http://127.0.0.1:9200/shop/_search

//drop and create doc
PUT
http://127.0.0.1:9200/shop/_doc/${id}

//update doc
POST
http://127.0.0.1:9200/shop/_update/${id}

//delete
DELETE
http://127.0.0.1:9200/shop/_doc/${id}
```
