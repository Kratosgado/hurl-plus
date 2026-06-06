GET https://fake-json-api.mock.beeceptor.com/users

HTTP 200

GET https://fake-json-api.mock.beeceptor.com/users

HTTP 200
[Asserts]
jsonpath "$[0].id" exists
jsonpath "$[0].id" == 5