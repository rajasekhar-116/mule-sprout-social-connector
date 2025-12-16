%dw 2.8
import * from dw::test::Asserts
import * from dw::test::Tests
import * from dw::Runtime

import * from com::mulesoft::connectivity::Model
import * from com::mulesoft::connectivity::transport::Http

import * from com::mulesoft::connectivity::Metadata

type BearerConnection = {
    baseUri: String,
    token: String
}

var bearerConnectionConfig = {
	baseUri: "https://api.sproutsocial.com",
    token: "MjYyODQ0MnwxNzUwMTU5ODI0fGJkZGEyNDI2LTI5Y2QtNDQ0Zi05MmYzLWU4MTFhOGFkNmYzOA=="
}

@ConnectionElement()
var bearerAuthConnection = defineBearerHttpConnectionProvider<BearerConnection>(
	(parameter: BearerConnection) -> {token: parameter.token},
	(parameter: BearerConnection) ->  {baseUri: parameter.baseUri}
)

var connection = bearerAuthConnection.connect(bearerConnectionConfig)