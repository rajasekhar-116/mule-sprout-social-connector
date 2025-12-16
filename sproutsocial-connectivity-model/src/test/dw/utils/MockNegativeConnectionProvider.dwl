%dw 2.8
import * from dw::test::Asserts
import * from dw::test::Tests
import * from dw::Runtime

import * from com::mulesoft::connectivity::Model
import * from com::mulesoft::connectivity::transport::Http

import * from com::mulesoft::connectivity::Metadata

var mockConnectionProvider600: HttpConnectionProvider<Object, { "type": "custom" }> = {
    authenticationType: { "type": "custom" },
    connect: (parameter) -> (httpRequest: HttpRequester) -> do {
            var mockResponse = {
              contentType: "application/json",
              status: 600,
              headers: {},
              cookies: {},
              body: {
    error: "sample_value"
}
            }
            ---
            mockResponse
          }
  }
var connection600= mockConnectionProvider600.connect({})