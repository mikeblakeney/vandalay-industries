---
layout: page
title: Developer Experience
permalink: /developer-experience/
nav_order: 2
---

# Developer Experience
{: .no_toc  }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## API Model Design

### Consolidate the inventory model
{: .no_toc  }
There are multiple definitions of the inventory model.  This will most likely be confusing to developers.  For example, the current model describing what is used with the warehouse inventory PATCH shows a model with different properties than that used by the inventory item.  Reducing inventory model to a single model will give a clearer more consistent experience to developers using the API.   This is particularly helpful if clients are expected to only access inventory with a specific warehouse.  Use the endpoint description to communicate if specific properties are required for the operation.

### Model Properties
{: .no_toc  }
Adding ISO standard timestamps for when resources were created and updated would be very helpful for developers.  Adding `created_at` and `updated_at` to the resource models will help developers build richer user experiences in their fronted applications and assist in searching for relevant data in results such as executing client side logic to find all of the returned items that were created in the last day.

Using strings instead of integers in your api model definition will give flexibility to migrate to a different id type in the future (uuid for example).  The documentation seems a bit ambiguous as to which should be used because the path parameters are of type string and the model ids are integers.  Similarly, using strings for Skus will yield greater flexibility.  In both of these instances, the use of an integer for these types seems to be more for indicating uniqueness rather than mathematical meaning.

Many of the model property names are prefixed with the model.  For example, `warehouseId` for the id of the warehouse.  In the cases where the property is refering the model it is bound to, the prefix is not needed and will probably lead to overhead during development.  Remove these prefixes so for example `warehouseId` becomes `id`.

## Endpoint Design

### Model Properties
{: .no_toc  }
Swagger for the endpoint definitions are not consistently documented.  For example, the PATCH and POST operations for inventory by warehouse id have summaries but do not have descriptions.  Consider adding descriptions for these endpoints with more detail and relevant information.  Including descriptions of the returned resources, constraints on the operation like return limits, and even details about the physical objects that are a part of the operation, can all enhance the use of the api for clients.

### Suggested Additional Endpoints
{: .no_toc  }
Adding these additional endpoints should only be done where it fits the business use cases.  For example, adding full CRUD operations for the inventory resource may not be desired if the domain model expects inventory to always be used with a related warehouse.  In this case, making developers use a valid warehouse id when interacting with inventory items will enforce the desired constraint.  Here are some endpoints that might be useful to consider:

  - GET `/warehouses/{warehouseId}`
  - POST `/warehouses/{warehouseId}`
  - PATCH `/warehouses/{warehouseId}`
  - DELETE `/warehouses/{warehouseId}`
  - GET `/warehouses/{warehouseId}/inventory/{inventoryId}`
  - GET `/factories/{factoryId}`
  - POST `/factories/{factoryId}`
  - PATCH `/factories/{factoryId}`
  - DELETE `/factories/{factoryId}`
  - GET `/factories/{factoryId}/machines/{machineId}`
  - POST `/factories/{factoryId}/machines`
  - PATCH `/factories/{factoryId}/machines/{machineId}`
  - DELETE `/factories/{factoryId}/machines/{machineId}`

Additionally, pay especially close attention to the desired domain model when considering these
  - Full CRUD for inventory
  - Full CRUD for machines

## API Versioning
  Making sure the api is versioned will greatly help developers by allowing them to choose when to upgrade their client applications.  One approach is to use semantic versioning.  When using semantic versioning, only use the major version number in the url because it will indicate when a breaking change is present.  All other changes are non-breaking and really have no direct impact on the functionality from the client's perspective.  Additionally, using a 410 status code with deprecated endpoints will bring furthe clarity to clients using the API.

## Document Error Responses
Documenting what to expect when things go wrong is just as important as documenting intended usage of the API. Here's a list of suggested status codes to consider and what they mean in an rest API:

`304 Not Modified` - Used when HTTP caching headers are in play

`400 Bad Request` - The request is malformed, such as if the body does not parse

`401 Unauthorized` - When no or invalid authentication details are provided. Also useful to trigger an auth popup if the API is used from a browser

`403 Forbidden` - When authentication succeeded but authenticated user doesn't have access to the resource

`404 Not Found` - When a non-existent resource is requested

`405 Method Not Allowed` - When an HTTP method is being requested that isn't allowed for the authenticated user

`410 Gone` - Indicates that the resource at this end point is no longer available. Useful as a blanket response for old API versions

`415 Unsupported Media Type` - If incorrect content type was provided as part of the request

`422 Unprocessable Entity` - Used for validation errors

`429 Too Many Requests` - When a request is rejected due to rate limiting

**References:**
- [Status Code RFC](https://tools.ietf.org/html/rfc2616)
- [REST Interpretation](https://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api#http-status)


## Developer SDK
  One of the advantages to defining an API using the OpenAPI specification (Swagger) is the tooling around generating SDK clients.  This can be a powerful enablement for getting clients ramped up and using the API in their prefered development language.  Swagger UI is another great tool for visualizing and trying out an API.  Tools like these depend on access to the swagger yaml file.  Consider making this file available to your clients for read access so they can leverage the great ecosystem around Swagger.
  - [Swagger Editor](https://swagger.io/tools/swagger-editor/)
  - [Swagger UI](https://swagger.io/tools/swagger-ui/)
  - [Swagger Codegen](https://swagger.io/tools/swagger-codegen/)

## Query Parameters
  Adding query parameters to the api would allow clients to query specifically for the resources they might be looking for.  As an example, a client could look up all of the warehouses in a specific city, state, or country.  There really should be careful planning before going forward with adding query parameters.  When adding query parameters keep in mind the implications on the data store ensuring proper indexes are created.  Planning for the types of operations is critical as well.  For example, searching for inventory items created in the last 24 hours, or for all names that start with letter 'A'.  Depending on the domain's data model, querying for a specific property may invoke long running queries.  Additionally, there may not even be enough volume from clients to warrant the effort in adding the query parameter.

## Pagination
  Pagination will not only improve the developer experience but it will also help optimize database queries and response times by limiting the number of results returned at one time.  Consider following the pattern of how the [Github API](https://developer.github.com/v3/#pagination) and [Zendesk API](https://develop.zendesk.com/hc/en-us/articles/360001068607-Paginating-through-lists) paginate their results.  They are both examples of using [Web Link](https://tools.ietf.org/html/rfc5988#page-6).  Allowing the API to create the pagination links helps the client to focus more on the actual process of pagination rather than on creating links with correct location in the data set.

## Security

  Web security standards would suggest the api should only respond to https requests.  The api could forward http requests to https or outright reject the http request.

  Because the intended clients are internal and external, the api should implement some authentication and authorization method.  One suggestion is the oAuth2 standard.  The oAuth2 standard has a number of qualities that make it a good candidate for the api.  The first is the use of Json Web Tokens (JWT).  A client's access to the api is carried with JWT not the use of sessions or cookies.  Typically with oAuth2, an client application is registered with the oAuth provider.  The oAuth provider will define what scopes are available to the client app.  These scopes can map to resources and actions such as the ability to write inventory, delete inventory, or the ability to read the inventory.  When a client app requests a new JWT, the request will include desired scopes.  If the desired scopes are allowed, the client is granted a set tokens through one of the allowed flows.  Thus enabling the ability to give internal clients access to different sets of endpoints than external clients.  Some of the results of implementing oAuth2 is client authentication, finer grained access controls to endpoints, and improved identity management for the api.

Lastly, with the right kind of client identity management in place, steps can be taken to begin enhancing the API with audit trails.  Tracking when an item changes, who made the change, and what was changed can serve a variety of use cases in the security and compliance arena.

**References**
  - [oAuth 2 Standard](https://oauth.net/2/)
  - [Json Web Tokens](https://tools.ietf.org/html/rfc7519)

