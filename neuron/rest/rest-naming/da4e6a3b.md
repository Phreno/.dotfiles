---
date: 2022-09-24T23:59
tags:
  - rest/rest-naming
---

# Rest: Resource naming

<img src="./static/rest/rest-resource-naming.png"/>

$~$

[Reference](https://restfulapi.net/resource-naming/)


## 1 What is a Resource?

<img src="https://images.pexels.com/photos/159751/book-address-book-learning-learn-159751.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"/>

$~$

**Singleton** and **Collection**

Example
- Singleton: `/customer/{id}`
- Collection: `/customers`


## 2 Collection and Sub-collection

<img src="https://images.pexels.com/photos/12647200/pexels-photo-12647200.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"/>

$~$

A resource may contain sub-collection resources also.

Example
- `/customers/{customerId}/accounts`
- `/customers/{customerId}/accounts/{accountId}`


## 3 URI

<img src="https://images.pexels.com/photos/1157151/pexels-photo-1157151.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"/>

$~$

REST APIs use Uniform Resource Identifiers (URIs) to address resources. 

## 4 Best Practices

<img src="https://images.pexels.com/photos/7925859/pexels-photo-7925859.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"/>

$~$


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

- http://api.example.com/cart-management/users/{id}/cart/checkout 
- http://api.example.com/song-management/users/{id}/playlist/play

## 5 Consistency is the key

<img src="https://images.pexels.com/photos/7978767/pexels-photo-7978767.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"/>

$~$


Use consistent resource naming conventions and URI formatting for minimum ambiguity and maximum readability and maintainability. You may implement the below design hints to achieve consistency:

## 6 Use forward slash (/) to indicate hierarchical relationships

<img src="https://images.pexels.com/photos/7202788/pexels-photo-7202788.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"/>

$~$


The forward-slash (/) character is used in the path portion of the URI to indicate a hierarchical relationship between resources. e.g.

- http://api.example.com/device-management
- http://api.example.com/device-management/managed-devices
- http://api.example.com/device-management/managed-devices/{id}
- http://api.example.com/device-management/managed-devices/{id}/scripts
- http://api.example.com/device-management/managed-devices/{id}/scripts/{id}

## 7 Use query component to filter URI collection

<img src="https://images.pexels.com/photos/5480759/pexels-photo-5480759.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"/>

$~$


Often, you will encounter requirements where you will need a collection of resources sorted, filtered, or limited based on some specific resource attribute.

For this requirement, do not create new APIs – instead, enable sorting, filtering, and pagination capabilities in resource collection API and pass the input parameters as query parameters. e.g.

- http://api.example.com/device-management/managed-devices
- http://api.example.com/device-management/managed-devices?region=USA
- http://api.example.com/device-management/managed-devices?region=USA&brand=XYZ
- http://api.example.com/device-management/managed-devices?region=USA&brand=XYZ&sort=installation-date


