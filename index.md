---
layout: home
---

# Introduction


## Developer Experience
- Add potentially useful endpoints
  - factory by Id (Get)
  - warehouses by id (Get)
  - Machines by Id (Get)
  - Inventory by id (POST, PATCH)

- Document Error Responses
- Make available swagger yaml and Consider adding additional documentation around using swagger yaml
- API Model property names
- Security
  - HTTPS only
  - Oauth2 with client apps and scoping
- Consider adding update_at and created_at ISO time stamps
- Consider Pagination
- Query Parameters
- Consider using uuid instead of integers for id
- Consider using strings for item Skus
- Give examples for the Names and descriptions
- Domain Driven Considerations
  - Separate ERP and CRM APIs

## Next Steps
- Operational Concerns
  - Monitoring
  - Rate limiting
  - Client management
- API as a Product
  - Build, Measure, Learn
- Resources
  - https://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api#envelope
  - https://swagger.io/tools/swagger-editor/
  - https://swagger.io/tools/swagger-ui/
  - https://martinfowler.com/bliki/BoundedContext.html
  - https://martinfowler.com/bliki/UbiquitousLanguage.html

