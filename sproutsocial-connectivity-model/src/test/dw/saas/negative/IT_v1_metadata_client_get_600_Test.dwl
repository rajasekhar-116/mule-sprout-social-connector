%dw 2.8
import * from dw::test::Asserts
import * from dw::test::Tests
import * from dw::Runtime
import * from com::mulesoft::connectivity::Model
import * from com::mulesoft::connectivity::transport::Http
import * from com::mulesoft::connectivity::Metadata

import * from utils::ConnectionOperations



import * from utils::MockNegativeConnectionProvider

import * from com::mulesoft::connectivity::sproutsocial::operations::O_v1_metadata_client_get 


var V_v1_metadata_client_get_request : O_v1_metadata_client_get_Type.request = 


{
    query:     {
    },
    headers: {},
    cookie: {},
}


var V_v1_metadata_client_get_response = O_v1_metadata_client_get.executor(V_v1_metadata_client_get_request, connection600) 


--- 
"/v1/metadata/client tests" describedBy [
    "/v1/metadata/client - GET Successful Execution" in do {
        V_v1_metadata_client_get_response.error.value.status must equalTo(600)
    },

]