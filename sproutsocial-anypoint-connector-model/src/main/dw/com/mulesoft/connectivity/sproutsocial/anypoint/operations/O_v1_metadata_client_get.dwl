%dw 2.8

import OperationElement from com::mulesoft::connectivity::Metadata

import alwaysMapsTo, extractRequestBody, fromMapping, withTransformer from com::mulesoft::connectivity::codegen::Transformation

import O_v1_metadata_client_get, O_v1_metadata_client_get_Type from com::mulesoft::connectivity::sproutsocial::operations::O_v1_metadata_client_get

type anypoint_O_v1_metadata_client_get_request = Object

var anypoint_O_v1_metadata_client_get_mapping = [
  {} alwaysMapsTo "query",
  {} alwaysMapsTo "headers",
  {} alwaysMapsTo "cookie"
]

@OperationElement()
var anypoint_O_v1_metadata_client_get = O_v1_metadata_client_get withTransformer {
  in: fromMapping<anypoint_O_v1_metadata_client_get_request, O_v1_metadata_client_get_Type.request>(anypoint_O_v1_metadata_client_get_mapping),
  out: extractRequestBody
}

