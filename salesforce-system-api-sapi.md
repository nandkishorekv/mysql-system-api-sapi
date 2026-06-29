# Salesforce System Api Sapi

**MuleSoft Integration Project Documentation**

Last updated: 2026-06-19

##  Table of Contents

- [Project Overview](#project-overview)
  - [Project Name](#project-name)
  - [Objective](#objective)
  - [Scope](#scope)
- [High-Level Architecture](#high-level-architecture)
  - [Architecture Style](#architecture-style)
  - [API Layers](#api-layers)
  - [Connectors Used](#connectors-used)
- [Key Features](#key-features)
- [Technologies Used](#technologies-used)
- [API Operations Summary](#api-operations-summary)
  - [Upload Batch APIs](#upload-batch-apis)
  - [Health APIs](#health-apis)
- [Upload Batch - Data Mapping Specification](#upload-batch---data-mapping-specification)
  - [Create / Update Upload Batch Mapping](#create-update-upload-batch-mapping)
- [Error Handling](#error-handling)
- [Logging & Monitoring](#logging-monitoring)
  - [Custom Logging Framework](#custom-logging-framework)
- [Security](#security)
- [Deployment & Monitoring](#deployment-monitoring)


---

## Project Overview

### Project Name

Salesforce System Api Sapi


### Objective

Design and implement RESTful APIs for seamless data exchange


### Scope

- Expose REST APIs
- Perform CRUD operations
- Validate request payloads
- Handle errors and provide meaningful responses
- Log request and response details for monitoring




---

## High-Level Architecture

### Architecture Style

API-led Connectivity integrating Amazon, Object Store, Validation


### API Layers

- **System API**: System-of-record adapter — integrates with Amazon, Object Store, Validation to expose data operations as REST APIs


### Connectors Used

- **HTTP**: listener, response, headers, error-response, body, request, request-config, request-connection, listener-config, listener-connection
- **Amazon**: send-message
- **Object Store**: object-store, remove, contains, retrieve, store, value
- **Validation**: is-true




---

## Key Features

- Create operations
- Read/Retrieve operations
- RESTful API endpoints
- Integration using HTTP Connector, Amazon, Object Store, Validation
- Error handling using Global Error Handlers
- Reusable DataWeave transformations
- Secure credential management
- Comprehensive logging for audit and troubleshooting




---

## Technologies Used

- MuleSoft Anypoint Studio 7.21
- Mule Runtime 4.9.0
- DataWeave 2.0
- HTTP Connector
- Objectstore Connector
- Amazon Sqs Connector
- Salesforce Connector
- MUnit Testing Framework
- Amazon
- Object Store
- Validation
- APIKit Router
- Secure Properties




---

## API Operations Summary

### Upload Batch APIs

| Operation | Method | Endpoint |
|-----------|--------|----------|
| Create Upload batch | POST | /files/upload-batch |


### Health APIs

| Operation | Method | Endpoint |
|-----------|--------|----------|
| List Health | GET | /health |




---

## Upload Batch - Data Mapping Specification

### Create / Update Upload Batch Mapping

| Source Field (API Request) | Target Field | Type | Mandatory | Notes |
|---------------------------|--------------|------|-----------|-------|
| id | id | String | No | Unique identifier (system-generated) |
| name | name | String | Yes | - |
| status | status | String | No | Current status |
| createdDate | createdDate | Date | No | ISO 8601 date format |




---

## Error Handling

| Scenario | Error Code | Message |
|----------|------------|----------|
| Os — connectivity error | 503 | Downstream service unavailable |
| Http — timeout error | 503 | Downstream service unavailable |
| Http — connectivity error | 503 | Downstream service unavailable |
| Validation — rejected error | 400 | Invalid request payload |
| Mule — expression error | 500 | Internal server error |
| Mule — connectivity error | 503 | Downstream service unavailable |
| Unhandled error (catch-all) | 500 | Unexpected error during request processing |




---

## Logging & Monitoring

#### Custom Logging Framework

- Standardized logging using `common_logger.xml` framework
- Correlation ID tracking across all flows and external requests
- Trace point tracking (`REQUEST_RECEIVED`, `FLOW_ENTRY`, `PROCESS_INFO`, `BEFORE_OUTBOUND`, `AFTER_OUTBOUND`, `FLOW_COMPLETE`, `RESPONSE_RETURNED`, `ERROR`)
- Dynamic log levels based on environment properties (`priority.debug`, `priority.info`, `priority.error`)




---

## Security

- Encrypted configuration values resolved at runtime
- CloudHub load balancer terminates TLS for inbound traffic




---

## Deployment & Monitoring

- Deployed to CloudHub via CI/CD pipeline
- Runtime Monitoring enabled
- Logs sent to centralized logging system
- Health check endpoints configured




---

