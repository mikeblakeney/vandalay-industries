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

## Swagger Yaml Fixes
The original swagger definition file had a few typos that were corrected to bring it back to conforming to proper swagger.  Recommend using the [swagger editor](https://swagger.io/tools/swagger-editor/) and [swagger ui](https://swagger.io/tools/swagger-editor/) tools to validate that the swagger is proper.

## Top Level Entities
The factory and warehouse entities are described as "top level", so those were moved two top level entities instead of the original groupings which had them spread througout several top level entity definitions.

## Inventory Patch and Deletes
The inventory PATCH verb uses a `itemDelete` boolean to delete inventory items.  The DELETE verb should be used instead.  When implementing, consider whether it is more suitable to express the endpoint as one or both of `/inventory/{id}` or `/warehouse/warehouseId/inventory/inventoryId`.  The first should run delete an inventory item with `id`.  The second, will remove an inventory item with `inventoryId` that is in the warehouse with id of `warehouseId`.  If the concept of inventory is usually thought of with a warehouse, then it might be more suitable to use the second option since there is relationship enforcement of the inventory with the specific warehouse.

The inventory PATCH should include the inventoryId of the inventory item that is being patched.  Also, instead of the response for the patched resource returning an array, it should return the inventory item that was updated (same observation for the POST).  Finally, there should be clarity added to exactly what is being deleted by the inventory DELETE.  Is it the entire inventory for that item or is it just some quantity since there is a quantity property on the original item.

## Status Codes
Proper usage of status codes adheres to rest conventions just as the appropriate usage of HTTP verbs like DELETE.  Here are some of the status codes that were not aligned with rest conventions:

### 204 for Delete inventory
{: .no_toc  }
In the original swagger definition, deletes were part of the patch and returned a 201.  The 201 status code is for creates.  Use a 204 status code to indicate successful completion of the request with no body to return.

### 200 for Patch inventory
{: .no_toc  }
The PATCH method returns a 201 which should be used when a new resource is created.  A PATCH should return status code 200.
