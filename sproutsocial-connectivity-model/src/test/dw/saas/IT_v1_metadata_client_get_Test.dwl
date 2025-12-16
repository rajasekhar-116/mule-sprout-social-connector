%dw 2.8
import * from dw::test::Asserts
import * from dw::test::Tests
import * from dw::Runtime
import * from com::mulesoft::connectivity::Model
import * from com::mulesoft::connectivity::transport::Http
import * from com::mulesoft::connectivity::Metadata

import * from utils::ConnectionOperations

import * from com::mulesoft::connectivity::sproutsocial::operations::O_v1_metadata_client_get 
import * from data::v1_metadata_client_get_request 

var V_v1_metadata_client_get_response = O_v1_metadata_client_get.executor(V_v1_metadata_client_get_request(), connection) 
--- 
"/v1/metadata/client tests" describedBy [
    "/v1/metadata/client - GET Successful Execution" in do {
        V_v1_metadata_client_get_response.value.status must equalTo(200)
    },
    "/v1/metadata/client - Response Contains Data Array" in do {
        V_v1_metadata_client_get_response.value.body.data must beArray()
    },
    "/v1/metadata/client - Each Customer Has Required Fields" in do {
        if (!isEmpty(V_v1_metadata_client_get_response.value.body.data))
            V_v1_metadata_client_get_response.value.body.data[0] must haveKey("customer_id")
        else
            true must equalTo(true)
    },
    "/v1/metadata/client - Customer Has Name Field" in do {
        if (!isEmpty(V_v1_metadata_client_get_response.value.body.data))
            V_v1_metadata_client_get_response.value.body.data[0] must haveKey("name")
        else
            true must equalTo(true)
    },
    "/v1/metadata/client - Customer ID Is Integer" in do {
        if (!isEmpty(V_v1_metadata_client_get_response.value.body.data))
            V_v1_metadata_client_get_response.value.body.data[0].customer_id must beNumber()
        else
            true must equalTo(true)
    },
    "/v1/metadata/client - Customer Name Is String" in do {
        if (!isEmpty(V_v1_metadata_client_get_response.value.body.data))
            V_v1_metadata_client_get_response.value.body.data[0].name must beString()
        else
            true must equalTo(true)
    }
]
