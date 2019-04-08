---
layout: page
title: Developer Experience
permalink: /developer-experience/
nav_order: 2
---

# Developer Experience
- Add potentially useful endpoints
  - factory by Id (Get)
  - warehouses by id (Get)
  - Machines by Id (Get)
  - Inventory by id (POST, PATCH)
- Api semantic versioning, major should be the only one in the url because it will indicate when a breaking change is present.  All other changes are non-breaking.
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

