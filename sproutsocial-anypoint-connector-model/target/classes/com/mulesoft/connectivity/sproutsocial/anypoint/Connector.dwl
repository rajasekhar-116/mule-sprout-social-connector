%dw 2.8

import MuleConnectorElement from com::mulesoft::connectivity::mule::Metadata

import anypoint_O_v1__customerId__metadata_customer_get from com::mulesoft::connectivity::sproutsocial::anypoint::operations::O_v1__customerId__metadata_customer_get

import anypoint_O_v1_metadata_client_get from com::mulesoft::connectivity::sproutsocial::anypoint::operations::O_v1_metadata_client_get

import BearerAuth, test from com::mulesoft::connectivity::sproutsocial::connections::Connections

@MuleConnectorElement()
var connector = {
  name: "sproutsocial",
  displayName: "sproutsocial",
  version: "1.0.0-SNAPSHOT",
  releaseStatus: "PILOT",
  description: "conenct to sprout social platform",
  icons: [
    {
      name: "sproutsocial",
      alternateText: "sproutsocial",
      resource: "icon/icon.svg",
      size: 1,
      dimensions: "0x0"
    }
  ],
  vendor: "NexGen Architects",
  category: "SELECT",
  connections: {
    BearerAuth: BearerAuth
  },
  testConnection: test,
  operations: {
    getCustomerIds: anypoint_O_v1_metadata_client_get,
    getCustomerProfiles: anypoint_O_v1__customerId__metadata_customer_get
  },
  valueProviders: {},
  metadataProviders: {}
}

