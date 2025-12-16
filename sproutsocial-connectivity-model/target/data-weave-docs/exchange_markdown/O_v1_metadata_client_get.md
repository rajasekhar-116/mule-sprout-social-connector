#### _com::mulesoft::connectivity::sproutsocial::operations::O_v1_metadata_client_get_
__________________________________________



# Index


### Variables
| Name | Description|
|------|------------|
| [O_v1_metadata_client_get](#o_v1_metadata_client_get-index ) | |



### Types
| Name | Description|
|------|------------|
|[O_v1_metadata_client_get_Type](#o_v1_metadata_client_get_type-index ) | |






__________________________________________





# Variables

## **O_v1_metadata_client_get** [↑↑](#index )





__________________________________________

# Types

### **O_v1_metadata_client_get_Type** [↑↑](#index )




#### Definition

```dataweave
{ "200": HttpResponse<{ data?: Array<{ customer_id: @Description(value = "The customer ID used by Sprout to identify this customer")
Integer, name: @Description(value = "The name of the customer/business")
String }> }>, "401": HttpResponse<{ error?: String }>, "403": HttpResponse<{ error?: String }>, "429": HttpResponse<{ error?: String }>, "500": HttpResponse<{ error?: String }>, errorResponse: ResultFailure<O_v1_metadata_client_get_Type."401", Error<"401", "CLIENT_ERROR">> | ResultFailure<O_v1_metadata_client_get_Type."403", Error<"403", "CLIENT_ERROR">> | ResultFailure<O_v1_metadata_client_get_Type."429", Error<"429", "CLIENT_ERROR">> | ResultFailure<O_v1_metadata_client_get_Type."500", Error<"500", "SERVER_ERROR">> | ResultFailure<HttpResponse<Any>, UnexpectedError>, request: HttpRequestType<{| query: Object, headers: Object, cookie: Object |}>, response: O_v1_metadata_client_get_Type."200" }
```




