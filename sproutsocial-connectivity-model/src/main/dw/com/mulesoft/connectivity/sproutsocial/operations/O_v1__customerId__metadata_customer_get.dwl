%dw 2.8

import OperationElement from com::mulesoft::connectivity::Metadata

import Error, Result, ResultFailure, UnexpectedError, failure, success, unexpectedFailure from com::mulesoft::connectivity::Model

import Integer from com::mulesoft::connectivity::Types

import Description from com::mulesoft::connectivity::decorator::Annotations

import HttpConnection, HttpRequestType, HttpResponse from com::mulesoft::connectivity::transport::Http

import serializeCookies, serializeHeaders, serializeUriParams, withSerializationConfig from com::mulesoft::connectivity::transport::Serialization

type O_v1__customerId__metadata_customer_get_Type = {
  "200": HttpResponse<{ data?: Array<{ customer_profile_id: @Description(value = "The customer profile ID used by Sprout to identify this social network profile")
  Integer, network_type: @Description(value = "The type of social network (X, Facebook, Instagram, etc.)")
  "twitter" | "facebook" | "instagram" | "linkedin" | "youtube" | "pinterest" | "tiktok" | "google_my_business" | "whatsapp" | "threads" | "bluesky", name: @Description(value = "The human-facing name of the social network profile")
  String, native_name: @Description(value = "The user name, screen name, page URL, etc. the social network uses to identify a unique profile")
  String, native_id: @Description(value = "The ID used by the social network to identify a unique profile")
  String, groups?: @Description(value = "An array of group IDs this profile belongs to")
  Array<Integer> }> }>,
  "400": HttpResponse<{ error?: String }>,
  "401": HttpResponse<{ error?: String }>,
  "403": HttpResponse<{ error?: String }>,
  "404": HttpResponse<{ error?: String }>,
  "429": HttpResponse<{ error?: String }>,
  "500": HttpResponse<{ error?: String }>,
  errorResponse: ResultFailure<O_v1__customerId__metadata_customer_get_Type."400", Error<"400", "CLIENT_ERROR">> | ResultFailure<O_v1__customerId__metadata_customer_get_Type."401", Error<"401", "CLIENT_ERROR">> | ResultFailure<O_v1__customerId__metadata_customer_get_Type."403", Error<"403", "CLIENT_ERROR">> | ResultFailure<O_v1__customerId__metadata_customer_get_Type."404", Error<"404", "CLIENT_ERROR">> | ResultFailure<O_v1__customerId__metadata_customer_get_Type."429", Error<"429", "CLIENT_ERROR">> | ResultFailure<O_v1__customerId__metadata_customer_get_Type."500", Error<"500", "SERVER_ERROR">> | ResultFailure<HttpResponse<Any>, UnexpectedError>,
  request: HttpRequestType<{| uri: {| customerId: Integer |}, query: Object, headers: Object, cookie: Object |}>,
  response: O_v1__customerId__metadata_customer_get_Type."200"
}

@OperationElement()
var O_v1__customerId__metadata_customer_get = {
  name: "getCustomerProfiles",
  displayName: "getCustomerProfiles",
  executor: (parameter: O_v1__customerId__metadata_customer_get_Type.request, connection: HttpConnection): Result<O_v1__customerId__metadata_customer_get_Type.response, O_v1__customerId__metadata_customer_get_Type.errorResponse> -> do {
      var uri = serializeUriParams(parameter.uri, {})
      var query = parameter.query default {} withSerializationConfig {}
      var headers = serializeHeaders(parameter.headers default {}, {})
      var cookie = serializeCookies(parameter.cookie default {}, {})
      var response = connection({
        method: "GET",
        path: "/v1/$(uri.customerId)/metadata/customer",
        queryParams: query,
        headers: headers,
        cookie: cookie
      })
      var statusCode = response.status as String
      ---
      if (response.status == 200 and response is O_v1__customerId__metadata_customer_get_Type."200")
        success(response)
      else if (response.status == 400 and response is O_v1__customerId__metadata_customer_get_Type."400")
        failure(response, {
          kind: "400",
          categories: ["CLIENT_ERROR"]
        }, "Bad Request - The request is malformed")
      else if (response.status == 401 and response is O_v1__customerId__metadata_customer_get_Type."401")
        failure(response, {
          kind: "401",
          categories: ["CLIENT_ERROR"]
        }, "Unauthorized - Invalid or expired access token")
      else if (response.status == 403 and response is O_v1__customerId__metadata_customer_get_Type."403")
        failure(response, {
          kind: "403",
          categories: ["CLIENT_ERROR"]
        }, "Forbidden - Access to customer or profile data not allowed")
      else if (response.status == 404 and response is O_v1__customerId__metadata_customer_get_Type."404")
        failure(response, {
          kind: "404",
          categories: ["CLIENT_ERROR"]
        }, "Not Found - The requested endpoint does not exist")
      else if (response.status == 429 and response is O_v1__customerId__metadata_customer_get_Type."429")
        failure(response, {
          kind: "429",
          categories: ["CLIENT_ERROR"]
        }, "Too Many Requests - Rate limit exceeded")
      else if (response.status == 500 and response is O_v1__customerId__metadata_customer_get_Type."500")
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
