---
layout: page
title: Vandalay API
permalink: /vandalay-api/
nav_order: 4
---

<link rel="stylesheet" type="text/css" href="/swagger-ui.css" >

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

<script src="/swagger-ui-bundle.js"> </script>
<script src="/swagger-ui-standalone-preset.js"> </script>
<script>
window.onload = function() {
  // Begin Swagger UI call region
  const ui = SwaggerUIBundle({
    url: "/vandalay-api-swagger.yaml",
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
