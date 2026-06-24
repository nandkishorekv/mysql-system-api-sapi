# Salesforce System Api Sapi

**MuleSoft Integration Project Documentation**

Last updated: 2026-06-20

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
  - [Upload APIs](#upload-apis)
  - [Health APIs](#health-apis)
- [Upload - Data Mapping Specification](#upload---data-mapping-specification)
  - [Create / Update Upload Mapping](#create-update-upload-mapping)
  - [Read Upload Response Mapping](#read-upload-response-mapping)
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

API-led Connectivity integrating Anypoint Mq, Object Store


### API Layers

- **System API**: System-of-record adapter — integrates with Anypoint Mq, Object Store to expose data operations as REST APIs


### Connectors Used

- **HTTP**: listener, response, headers, error-response, body, request, request-config, request-connection, listener-config, listener-connection
- **Anypoint Mq**: connection, subscriber
- **Object Store**: object-store, remove, retrieve




---

## Key Features

- Create operations
- Read/Retrieve operations
- RESTful API endpoints
- Integration using HTTP Connector, Anypoint Mq, Object Store
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
- Salesforce Connector
- MUnit Testing Framework
- Anypoint Mq
- Object Store
- APIKit Router
- Secure Properties




---

## API Operations Summary

### Upload APIs

| Operation | Method | Endpoint |
|-----------|--------|----------|
| Create Upload | POST | /salesforce-system-api/files/upload |


### Health APIs

| Operation | Method | Endpoint |
|-----------|--------|----------|
| List Health | GET | /health |




---

## Upload - Data Mapping Specification

### Create / Update Upload Mapping

| Source Field (API Request) | Target Field | Type | Mandatory | Notes |
|---------------------------|--------------|------|-----------|-------|
| correlationId | correlationId | String | Yes | - |
| batchId | batchId | String | Yes | - |
| files | files | Array | Yes | - |


### Read Upload Response Mapping

| Source Field (Target System) | API Response Field | Type | Notes |
|------------------------------|-------------------|------|-------|
| correlationId | correlationId | String | - |
| batchId | batchId | String | - |
| filesSent | filesSent | Number | - |
| filesUploaded | filesUploaded | Number | - |
| filesUpserted | filesUpserted | Number | - |
| filesUploadedToKnowledge | filesUploadedToKnowledge | Number | - |
| uploadedFiles | uploadedFiles | Array | - |
| upsertedFiles | upsertedFiles | Array | - |
| failedFiles | failedFiles | Array | - |
| processingTimestamp | processingTimestamp | String | - |
| errors | errors | Array | - |




---

## Error Handling

| Scenario | Error Code | Message |
|----------|------------|----------|
| Anypoint Mq — acking error | 500 | Internal server error |
| Anypoint Mq — retry exhausted error | 500 | Internal server error |
| Os — connectivity error | 503 | Downstream service unavailable |
| Http — timeout error | 503 | Downstream service unavailable |
| Http — connectivity error | 503 | Downstream service unavailable |
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




---

## Deployment & Monitoring

- Deployed to CloudHub via CI/CD pipeline
- Runtime Monitoring enabled
- Logs sent to centralized logging system
- Health check endpoints configured




---

