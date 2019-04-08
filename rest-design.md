---
layout: page
title: Rest Design
permalink: /rest-design/
nav_order: 1
---

# Rest Design
{: .no_toc  }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Swagger Yaml Fixes
The original swagger definition file had a few typos that were corrected to bring it back to conforming to proper swagger.  Recomend using the [swagger editor](https://swagger.io/tools/swagger-editor/) and [swagger ui](https://swagger.io/tools/swagger-editor/) tools to validate that the swagger is proper.

# Top Level Entities
The factory and warehouse entities are described as "top level", so those were moved two top level entities instead of the original groupings which had them spread througout several top level entity definitions.

# Inventory Deletes
The inventory PATCH verb uses a `itemDelete` boolean to delete inventory items.  The DELETE verb should be used instead.

Additionally, there should be clarity added to exactly what is being deleted by the inventory DELETE.  Is it the entire inventory for that item or is it just some quantity since there is a quantity property on the original item.

# Status Codes
Proper usage of status codes adheres to rest conventions just as the appropriate usage of HTTP verbs like DELETE.  Here are some of the status codes that were not aligned with rest conventions:

none 204 --> Delete inventory
201  200 --> Patch inventory
