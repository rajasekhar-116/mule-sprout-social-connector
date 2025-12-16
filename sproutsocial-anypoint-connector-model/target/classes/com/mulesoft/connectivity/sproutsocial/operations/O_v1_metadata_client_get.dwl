%dw 2.8

import OperationElement from com::mulesoft::connectivity::Metadata

import Error, Result, ResultFailure, UnexpectedError, failure, success, unexpectedFailure from com::mulesoft::connectivity::Model

import Integer from com::mulesoft::connectivity::Types

import Description from com::mulesoft::connectivity::decorator::Annotations

import HttpConnection, HttpRequestType, HttpResponse from com::mulesoft::connectivity::transport::Http

import serializeCookies, serializeHeaders, withSerializationConfig from com::mulesoft::connectivity::transport::Serialization

type O_v1_metadata_client_get_Type = {
  "200": HttpResponse<{ data?: Array<{ customer_id: @Description(value = "The customer ID used by Sprout to identify this customer")
  Integer, name: @Description(value = "The name of the customer/business")
  String }> }>,
  "401": HttpResponse<{ error?: String }>,
  "403": HttpResponse<{ error?: String }>,
  "429": HttpResponse<{ error?: String }>,
  "500": HttpResponse<{ error?: String }>,
  errorResponse: ResultFailure<O_v1_metadata_client_get_Type."401", Error<"401", "CLIENT_ERROR">> | ResultFailure<O_v1_metadata_client_get_Type."403", Error<"403", "CLIENT_ERROR">> | ResultFailure<O_v1_metadata_client_get_Type."429", Error<"429", "CLIENT_ERROR">> | ResultFailure<O_v1_metadata_client_get_Type."500", Error<"500", "SERVER_ERROR">> | ResultFailure<HttpResponse<Any>, UnexpectedError>,
  request: HttpRequestType<{| query: Object, headers: Object, cookie: Object |}>,
  response: O_v1_metadata_client_get_Type."200"
}

@OperationElement()
var O_v1_metadata_client_get = {
  name: "getCustomerIds",
  displayName: "getCustomerIds",
  executor: (parameter: O_v1_metadata_client_get_Type.request, connection: HttpConnection): Result<O_v1_metadata_client_get_Type.response, O_v1_metadata_client_get_Type.errorResponse> -> do {
      var query = parameter.query default {} withSerializationConfig {}
      var headers = serializeHeaders(parameter.headers default {}, {})
      var cookie = serializeCookies(parameter.cookie default {}, {})
      var response = connection({
        method: "GET",
        path: "/v1/metadata/client",
        queryParams: query,
        headers: headers,
        cookie: cookie
      })
      var statusCode = response.status as String
      ---
      if (response.status == 200 and response is O_v1_metadata_client_get_Type."200")
        success(response)
      else if (response.status == 401 and response is O_v1_metadata_client_get_Type."401")
        failure(response, {
          kind: "401",
          categories: ["CLIENT_ERROR"]
        }, "Unauthorized - Invalid or expired access token")
      else if (response.status == 403 and response is O_v1_metadata_client_get_Type."403")
        failure(response, {
          kind: "403",
          categories: ["CLIENT_ERROR"]
        }, "Forbidden - Access to customer or profile data not allowed")
      else if (response.status == 429 and response is O_v1_metadata_client_get_Type."429")
        failure(response, {
          kind: "429",
          categories: ["CLIENT_ERROR"]
        }, "Too Many Requests - Rate limit exceeded")
      else if (response.status == 500 and response is O_v1_metadata_client_get_Type."500")
        failure(response, {
          kind: "500",
          categories: ["SERVER_ERROR"]
        }, "Internal Server Error - Server had an issue processing the request")
      else
        unexpectedFailure(response, {
          kind: statusCode,
          categories: []
        })
    }
}
