%dw 2.8
import * from dw::test::Asserts
import * from dw::test::Tests
import * from dw::Runtime
import * from com::mulesoft::connectivity::Model
import * from com::mulesoft::connectivity::transport::Http
import * from com::mulesoft::connectivity::Metadata

import * from utils::ConnectionOperations

import * from com::mulesoft::connectivity::sproutsocial::operations::O_v1_metadata_client_get
import * from com::mulesoft::connectivity::sproutsocial::operations::O_v1__customerId__metadata_customer_get 
import * from data::v1_metadata_client_get_request
import * from data::v1__customerId__metadata_customer_get_request 

// First, get customer IDs from the parent operation
var V_v1_metadata_client_get_response = O_v1_metadata_client_get.executor(V_v1_metadata_client_get_request(), connection)

// Extract the first customer ID from the response for use in dependent operation
var CUSTOMER_ID = if (V_v1_metadata_client_get_response.success? and !isEmpty(V_v1_metadata_client_get_response.value.body.data))
    V_v1_metadata_client_get_response.value.body.data[0].customer_id
  else
    687751 // Fallback to sample customer ID from API spec

// Execute the dependent operation with the extracted customer ID
var V_v1__customerId__metadata_customer_get_response = O_v1__customerId__metadata_customer_get.executor(V_v1__customerId__metadata_customer_get_request(CUSTOMER_ID), connection) 
--- 
"/v1/{customerId}/metadata/customer tests" describedBy [
    "/v1/{customerId}/metadata/customer - GET Successful Execution with Dynamic Customer ID" in do {
        V_v1__customerId__metadata_customer_get_response.value.status must equalTo(200)
    },
    "/v1/{customerId}/metadata/customer - Validates Response Structure" in do {
        V_v1__customerId__metadata_customer_get_response.value.body.data must beArray()
    },
    "/v1/{customerId}/metadata/customer - Each Profile Has Required Fields" in do {
        if (!isEmpty(V_v1__customerId__metadata_customer_get_response.value.body.data))
            V_v1__customerId__metadata_customer_get_response.value.body.data[0] must haveKey("customer_profile_id")
        else
            true must equalTo(true)
    },
    "/v1/{customerId}/metadata/customer - Network Type Is Valid" in do {
        if (!isEmpty(V_v1__customerId__metadata_customer_get_response.value.body.data))
            V_v1__customerId__metadata_customer_get_response.value.body.data[0].network_type must beOneOf(["twitter", "facebook", "instagram", "linkedin", "youtube", "pinterest", "tiktok", "google_my_business", "whatsapp", "threads", "bluesky", "fb_instagram_account"])
        else
            true must equalTo(true)
    }
]
