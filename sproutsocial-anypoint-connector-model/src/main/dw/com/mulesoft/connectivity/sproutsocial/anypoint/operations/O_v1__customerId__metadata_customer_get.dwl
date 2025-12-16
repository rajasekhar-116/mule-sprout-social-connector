%dw 2.8

import OperationElement from com::mulesoft::connectivity::Metadata

import alwaysMapsTo, extractRequestBody, fromMapping, mapsTo, withTransformer from com::mulesoft::connectivity::codegen::Transformation

import O_v1__customerId__metadata_customer_get, O_v1__customerId__metadata_customer_get_Type from com::mulesoft::connectivity::sproutsocial::operations::O_v1__customerId__metadata_customer_get

type anypoint_O_v1__customerId__metadata_customer_get_request = {
  customerId: O_v1__customerId__metadata_customer_get_Type.request.uri.customerId
}

var anypoint_O_v1__customerId__metadata_customer_get_mapping = [
  "customerId" mapsTo "uri.customerId",
  {} alwaysMapsTo "query",
  {} alwaysMapsTo "headers",
  {} alwaysMapsTo "cookie"
]

@OperationElement()
var anypoint_O_v1__customerId__metadata_customer_get = O_v1__customerId__metadata_customer_get withTransformer {
  in: fromMapping<anypoint_O_v1__customerId__metadata_customer_get_request, O_v1__customerId__metadata_customer_get_Type.request>(anypoint_O_v1__customerId__metadata_customer_get_mapping),
  out: extractRequestBody
}

