---
date: 2022-09-24T23:59
tags:
  - rest/rest-naming
---

# Rest: Resource naming

[Reference](https://restfulapi.net/resource-naming/)


## What is a Resource?

**Singleton** and **Collection**

Example
- Singleton: `/customer/{id}`
- Collection: `/customers`


## Collection and Sub-collection

A resource may contain sub-collection resources also.

Example
- `/customers/{customerId}/accounts`
- `/customers/{customerId}/accounts/{accountId}`


## URI

REST APIs use Uniform Resource Identifiers (URIs) to address resources. 

## Best Practices

Use nouns to represent resources

- http://api.example.com/device-management/managed-devices 
- http://api.example.com/device-management/managed-devices/{device-id} 
- http://api.example.com/user-management/users
- http://api.example.com/user-management/users/{id}

document


- http://api.example.com/device-management/managed-devices/{device-id}
- http://api.example.com/user-management/users/{id}
- http://api.example.com/user-management/users/admin

collection

- http://api.example.com/device-management/managed-devices
- http://api.example.com/user-management/users
- http://api.example.com/user-management/users/{id}/accounts

store

- http://api.example.com/song-management/users/{id}/playlists

controller

- http://api.example.com/cart-management/users/{id}/cart/checkout http://api.example.com/song-management/users/{id}/playlist/play

## Consistency is the key

Use consistent resource naming conventions and URI formatting for minimum ambiguity and maximum readability and maintainability. You may implement the below design hints to achieve consistency:

## Use forward slash (/) to indicate hierarchical relationships

The forward-slash (/) character is used in the path portion of the URI to indicate a hierarchical relationship between resources. e.g.

- http://api.example.com/device-management
- http://api.example.com/device-management/managed-devices
- http://api.example.com/device-management/managed-devices/{id}
- http://api.example.com/device-management/managed-devices/{id}/scripts
- http://api.example.com/device-management/managed-devices/{id}/scripts/{id}

## Use query component to filter URI collection

Often, you will encounter requirements where you will need a collection of resources sorted, filtered, or limited based on some specific resource attribute.

For this requirement, do not create new APIs – instead, enable sorting, filtering, and pagination capabilities in resource collection API and pass the input parameters as query parameters. e.g.

- http://api.example.com/device-management/managed-devices
- http://api.example.com/device-management/managed-devices?region=USA
- http://api.example.com/device-management/managed-devices?region=USA&brand=XYZ
- http://api.example.com/device-management/managed-devices?region=USA&brand=XYZ&sort=installation-date


