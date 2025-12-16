%dw 2.8 
 
import * from com::mulesoft::connectivity::sproutsocial::operations::O_v1_metadata_client_get 

fun V_v1_metadata_client_get_request() : O_v1_metadata_client_get_Type.request = 
{
    query: {
        // No query parameters required for /v1/metadata/client endpoint
        // This endpoint only requires authentication via Bearer token
    },
    headers: {
        // Additional headers can be added here if needed
        // Authentication is handled by the connection provider
        "Accept": "application/json",
        "User-Agent": "MuleSoft-SproutSocial-Connector/1.0.0"
    },
    cookie: {
        // No cookies required for this endpoint
    }
}
