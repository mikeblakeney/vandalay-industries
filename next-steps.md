---
layout: page
title: Next Steps
permalink: /next-steps/
nav_order: 3
---

# Next Steps
{: .no_toc  }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}


## Operational Concerns

### API Health
{: .no_toc  }

The api should have a health check endpoint that an operations team (and clients) can use to determine if the api is generally responsive.  The api should be considered generally healthy if it is meeting the criteria defined in Service Level Objectives (SLO).  These are the internal objectives that define the health of the api.  It can be as simple as "the average api response time over a 5 minute period should be no more than 10 seconds".  In this case the the objective is clearly defined such that a measurable indicator, a Service Level Indicator (SLI), is defined: "average api response time over a 5 minute period".  Monitoring should then be configured to track the SLI.  Ideally the process of reviewing the SLO is automated trigger alerts when an SLO is violated.  Client Service Level Agreements (SLA) are defined with the SLO in mind.  In this case an SLA could be something like "the average response time over a 5 minute period will be no more than 30 seconds".  The health check can then be used to indicate to end users if the service is degraded or in a failure state.

**Example relationship of SLI, SLO, and SLA**
-  SLO - "the average api response time over a 5 minute period should be no more than 10 seconds"
-  SLI - "the average api response time over a 5 minute period"
-  SLA - "the average api response time over a 5 minute period should be no more than 30 seconds"

Also consider adding a link the SLA or Terms of Service to the Swagger API documentation.

### Client Management
{: .no_toc  }

Working with internal and external clients really makes client management critical.  Good client management will keep the access and ability of internal clients different than external clients.  Rate limiting ( definitely recomended for external clients) will help control resource consumption and utilization, however internal clients might be rate limited differently than internal clients.  Another example is with managing the access secrets for client apps and the respective scopes they have permissions to utilize.

## API as a Product

### Reducing Friction
{: .no_toc  }
Reducing friction is just as important in using an API as it is in an online marketplace.  The less difficult it is for customers to find and complete a purchase the more likely the sale will actually take place and result in a returning customer.  In the case of the API, the customer is the developer using the API.  This means friction can come in a number of forms.  One type of friction is speed to making the first API call.  Clear documentation and simple examples on common tasks will help developers grow comfortable with the API sooner.  Consider documenting how to use the Swagger code generator and make a first api call using the most common languages among clients.  A second form of friction is hidden in the language used in the API.  Drawing from Domain Driven Development (DDD) concepts, identifying ubiquitous or common language around how resources described will not only reduce friction for the developer in learning the API, but also with how the developer communicates with their organization and thus development speed.  For example, do factory managers use the term machines or capital equipment?  A lot of confustion can be avoided when a developer is discussing progress or asking questions with their organization, if the factory manager and the developer are using the same term and agree on its definition.  As the planning for the api progresses consider identigying and using ubiquitous language in the api definitions.


### Build, Measure, Learn
{: .no_toc  }
Minimize wasted work by taking a lean approach to developing the api as a product.  Start with a hypothesis that describes the impact that a api feature or change will make on the key performance indicators or service level objectives.  Develop the feature and roll it out to a subset of the user base and measure the results.  If the results support the hypothesis then roll it out to the greater audience and collect additional feedback directly from those users.  Repeating this process for each new feature or update for the api will not only keep the work on the api pushing indicators in the right direction, but will also help eliminate wasted time and effort by avoiding developing full fledged features before their impact is really known.  For example, there may be suggestions that by adding a query parameter for searching for inventory items by SKUs the number of clients using the api would increase.  The reasoning behind this may be a variety of reasons for this, such as searching for SKUs is mostly what clients use to integrate with their systems.  The next step would be to develop a beta version of the new feature and release it to a subset of customers using the api and to those who have not adopted the API.  By watching the KPIs around number of queries and number of customers who convert to adopters will most likely indicate whether or not the new feature brings the desired value and is worth continuing the development effort.
