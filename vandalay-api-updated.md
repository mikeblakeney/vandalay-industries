---
layout: page
title: Updated Vandalay API
permalink: /vandalay-api-updated/
nav_order: 5
---

<link rel="stylesheet" type="text/css" href="/swagger-assets/swagger-ui.css" >

<style>
  html
  {
    box-sizing: border-box;
    overflow: -moz-scrollbars-vertical;
    overflow-y: scroll;
  }
  *,
  *:before,
  *:after
  {
    box-sizing: inherit;
  }
  body
  {
    margin:0;
    background: #fafafa;
  }
  .swagger-ui .topbar {
    background-color: #61affe;
  }
</style>
<div id="swagger-ui"></div>

<script src="/swagger-assets/swagger-ui-bundle.js"> </script>
<script src="/swagger-assets/swagger-ui-standalone-preset.js"> </script>
<script>
window.onload = function() {
  // Begin Swagger UI call region
  const ui = SwaggerUIBundle({
    url: "/swagger/vandalay-api-swagger-updated.yaml",
    dom_id: '#swagger-ui',
    deepLinking: true,
    presets: [
      SwaggerUIBundle.presets.apis,
      SwaggerUIStandalonePreset
    ],
    plugins: [
      SwaggerUIBundle.plugins.DownloadUrl
    ],
    layout: "StandaloneLayout"
  })
  // End Swagger UI call region
  window.ui = ui
}
</script>
