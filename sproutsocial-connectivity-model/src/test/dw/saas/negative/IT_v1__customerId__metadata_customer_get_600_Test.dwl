%dw 2.8
import * from dw::test::Asserts
import * from dw::test::Tests
import * from dw::Runtime
import * from com::mulesoft::connectivity::Model
import * from com::mulesoft::connectivity::transport::Http
import * from com::mulesoft::connectivity::Metadata

import * from utils::ConnectionOperations



import * from utils::MockNegativeConnectionProvider

import * from com::mulesoft::connectivity::sproutsocial::operations::O_v1__customerId__metadata_customer_get 


var V_v1__customerId__metadata_customer_get_request : O_v1__customerId__metadata_customer_get_Type.request = 


{
    query:     {
    },
    headers: {},
    cookie: {},
    uri:     {
        customerId: 1
    }
}


var V_v1__customerId__metadata_customer_get_response = O_v1__customerId__metadata_customer_get.executor(V_v1__customerId__metadata_customer_get_request, connection600) 


--- 
"/v1/{customerId}/metadata/customer tests" describedBy [
    "/v1/{customerId}/metadata/customer - GET Successful Execution" in do {
        V_v1__customerId__metadata_customer_get_response.error.value.status must equalTo(600)
    },

]