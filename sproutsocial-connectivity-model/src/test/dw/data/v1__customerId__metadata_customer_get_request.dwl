%dw 2.8 
 
import * from com::mulesoft::connectivity::sproutsocial::operations::O_v1__customerId__metadata_customer_get 

fun V_v1__customerId__metadata_customer_get_request(CUSTOMERID) : O_v1__customerId__metadata_customer_get_Type.request = 
{
    query: {
        // No query parameters required for /v1/{customerId}/metadata/customer endpoint
        // This endpoint uses path parameter for customer ID and requires authentication
    },
    headers: {
        // Additional headers for better API interaction
        "Accept": "application/json",
        "User-Agent": "MuleSoft-SproutSocial-Connector/1.0.0",
        "Content-Type": "application/json"
    },
    cookie: {
        // No cookies required for this endpoint
    },
    uri: {
        // Customer ID obtained from /v1/metadata/client endpoint response
        // Must be a valid integer customer ID that the authenticated user has access to
        customerId: CUSTOMERID
    }
}
