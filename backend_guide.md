# Wildlife Conservation App - Backend API Guide

## Overview
This document outlines all the API endpoints required for the Wildlife Conservation mobile app. The app supports two types of users: regular users who report injured animals and wildlife center staff who manage these reports.

## Authentication System

### User Authentication
**Base URL:** `/api/auth`

#### 1. User Registration
- **Endpoint:** `POST /api/auth/user/register`
- **Description:** Register a new user account
- **Request Body:**
```json
{
  "name": "string",
  "email": "string",
  "password": "string"
}
```
- **Response:** User object with JWT token
- **Status Codes:** 201 (Created), 400 (Bad Request), 409 (Email exists)

#### 2. User Login
- **Endpoint:** `POST /api/auth/user/login`
- **Description:** Authenticate user credentials
- **Request Body:**
```json
{
  "email": "string",
  "password": "string"
}
```
- **Response:** JWT token and user data
- **Status Codes:** 200 (OK), 401 (Unauthorized)

#### 3. Send User OTP
- **Endpoint:** `POST /api/auth/user/send-otp`
- **Description:** Send OTP for email verification
- **Request Body:**
```json
{
  "email": "string"
}
```
- **Response:** Success message
- **Status Codes:** 200 (OK), 400 (Bad Request)

#### 4. Verify User OTP
- **Endpoint:** `POST /api/auth/user/verify-otp`
- **Description:** Verify OTP code
- **Request Body:**
```json
{
  "email": "string",
  "otp": "string"
}
```
- **Response:** Verification status
- **Status Codes:** 200 (OK), 400 (Invalid OTP)

### Wildlife Center Authentication
**Base URL:** `/api/auth/center`

#### 5. Center Registration
- **Endpoint:** `POST /api/auth/center/register`
- **Description:** Register a new wildlife center
- **Request Body:**
```json
{
  "centerName": "string",
  "email": "string",
  "phone": "string",
  "address": "string",
  "licenseNumber": "string"
}
```
- **Response:** Center object with temporary access
- **Status Codes:** 201 (Created), 400 (Bad Request), 409 (Email exists)

#### 6. Center Login
- **Endpoint:** `POST /api/auth/center/login`
- **Description:** Authenticate center credentials with passcode
- **Request Body:**
```json
{
  "email": "string",
  "password": "string",
  "passcode": "string"
}
```
- **Response:** JWT token and center data
- **Status Codes:** 200 (OK), 401 (Unauthorized), 403 (Invalid passcode)

#### 7. Send Center OTP
- **Endpoint:** `POST /api/auth/center/send-otp`
- **Description:** Send OTP for center email verification
- **Request Body:**
```json
{
  "email": "string"
}
```
- **Response:** Success message
- **Status Codes:** 200 (OK), 400 (Bad Request)

#### 8. Verify Center OTP
- **Endpoint:** `POST /api/auth/center/verify-otp`
- **Description:** Verify center OTP code
- **Request Body:**
```json
{
  "email": "string",
  "otp": "string"
}
```
- **Response:** Verification status and center activation
- **Status Codes:** 200 (OK), 400 (Invalid OTP)

## Injured Animal Reports

### User Endpoints
**Base URL:** `/api/reports`

#### 9. Submit Animal Report
- **Endpoint:** `POST /api/reports`
- **Description:** Submit a new injured animal report
- **Authentication:** Required (User JWT)
- **Request Body:** Form data (multipart/form-data)
```
species: string (Bird|Mammal|Reptile|Unknown)
condition: string (Limping|Not moving|Bleeding|Tangled|Orphaned)
distance: string (0–10 yards|10–25|25–50|50+)
photo: file (optional, image file)
latitude: number
longitude: number
timestamp: string (ISO 8601)
```
- **Response:** Report object with ID
- **Status Codes:** 201 (Created), 400 (Bad Request), 401 (Unauthorized)

#### 10. Get User's Reports
- **Endpoint:** `GET /api/reports/user`
- **Description:** Get reports submitted by current user
- **Authentication:** Required (User JWT)
- **Query Parameters:** `page`, `limit`, `status`
- **Response:** Array of user's reports
- **Status Codes:** 200 (OK), 401 (Unauthorized)

### Center Endpoints
**Base URL:** `/api/reports/center`

#### 11. Get Assigned Reports
- **Endpoint:** `GET /api/reports/center`
- **Description:** Get reports assigned to the center (based on location proximity)
- **Authentication:** Required (Center JWT)
- **Query Parameters:** `page`, `limit`, `status`, `priority`
- **Response:** Array of assigned reports
- **Status Codes:** 200 (OK), 401 (Unauthorized)

#### 12. Update Report Status
- **Endpoint:** `PUT /api/reports/center/{reportId}/status`
- **Description:** Update the status of a report
- **Authentication:** Required (Center JWT)
- **Request Body:**
```json
{
  "status": "string", // pending|assigned|in_progress|completed|cancelled
  "notes": "string" // optional
}
```
- **Response:** Updated report object
- **Status Codes:** 200 (OK), 400 (Bad Request), 401 (Unauthorized), 403 (Forbidden), 404 (Not Found)

#### 13. Get Report Details
- **Endpoint:** `GET /api/reports/{reportId}`
- **Description:** Get detailed information about a specific report
- **Authentication:** Required (User or Center JWT)
- **Response:** Complete report object with photos and status history
- **Status Codes:** 200 (OK), 401 (Unauthorized), 403 (Forbidden), 404 (Not Found)

## Wildlife Clinics

**Base URL:** `/api/clinics`

#### 14. Get Clinics List
- **Endpoint:** `GET /api/clinics`
- **Description:** Get list of wildlife clinics with basic info
- **Query Parameters:** `latitude`, `longitude`, `radius`, `page`, `limit`
- **Response:** Array of clinic objects
- **Status Codes:** 200 (OK)

#### 15. Get Clinic Details
- **Endpoint:** `GET /api/clinics/{clinicId}`
- **Description:** Get detailed information about a specific clinic
- **Response:** Complete clinic object
- **Status Codes:** 200 (OK), 404 (Not Found)

#### 16. Search Clinics
- **Endpoint:** `GET /api/clinics/search`
- **Description:** Search clinics by name, location, or services
- **Query Parameters:** `query`, `latitude`, `longitude`, `radius`
- **Response:** Array of matching clinics
- **Status Codes:** 200 (OK)

## User Profile Management

**Base URL:** `/api/user`

#### 17. Get User Profile
- **Endpoint:** `GET /api/user/profile`
- **Description:** Get current user's profile information
- **Authentication:** Required (User JWT)
- **Response:** User profile object
- **Status Codes:** 200 (OK), 401 (Unauthorized)

#### 18. Update User Profile
- **Endpoint:** `PUT /api/user/profile`
- **Description:** Update user profile information
- **Authentication:** Required (User JWT)
- **Request Body:**
```json
{
  "name": "string",
  "email": "string",
  "phone": "string" // optional
}
```
- **Response:** Updated user profile
- **Status Codes:** 200 (OK), 400 (Bad Request), 401 (Unauthorized)

#### 19. Get User Settings
- **Endpoint:** `GET /api/user/settings`
- **Description:** Get user preferences and settings
- **Authentication:** Required (User JWT)
- **Response:** User settings object
- **Status Codes:** 200 (OK), 401 (Unauthorized)

#### 20. Update User Settings
- **Endpoint:** `PUT /api/user/settings`
- **Description:** Update user preferences
- **Authentication:** Required (User JWT)
- **Request Body:**
```json
{
  "notifications": boolean,
  "locationSharing": boolean,
  "language": "string"
}
```
- **Response:** Updated settings
- **Status Codes:** 200 (OK), 400 (Bad Request), 401 (Unauthorized)

## Center Profile Management

**Base URL:** `/api/center`

#### 21. Get Center Profile
- **Endpoint:** `GET /api/center/profile`
- **Description:** Get current center's profile information
- **Authentication:** Required (Center JWT)
- **Response:** Center profile object
- **Status Codes:** 200 (OK), 401 (Unauthorized)

#### 22. Update Center Profile
- **Endpoint:** `PUT /api/center/profile`
- **Description:** Update center profile information
- **Authentication:** Required (Center JWT)
- **Request Body:**
```json
{
  "centerName": "string",
  "email": "string",
  "phone": "string",
  "address": "string",
  "licenseNumber": "string",
  "services": "string",
  "hours": "string",
  "description": "string"
}
```
- **Response:** Updated center profile
- **Status Codes:** 200 (OK), 400 (Bad Request), 401 (Unauthorized)

#### 23. Get Center Settings
- **Endpoint:** `GET /api/center/settings`
- **Description:** Get center preferences and settings
- **Authentication:** Required (Center JWT)
- **Response:** Center settings object
- **Status Codes:** 200 (OK), 401 (Unauthorized)

#### 24. Update Center Settings
- **Endpoint:** `PUT /api/center/settings`
- **Description:** Update center preferences
- **Authentication:** Required (Center JWT)
- **Request Body:**
```json
{
  "autoAssignReports": boolean,
  "notificationRadius": number,
  "workingHours": "string"
}
```
- **Response:** Updated settings
- **Status Codes:** 200 (OK), 400 (Bad Request), 401 (Unauthorized)

## File Upload

**Base URL:** `/api/files`

#### 25. Upload Image
- **Endpoint:** `POST /api/files/upload`
- **Description:** Upload image file (for reports)
- **Authentication:** Required
- **Request Body:** Form data (multipart/form-data)
```
file: image file (JPEG, PNG, max 10MB)
type: string (report_photo)
```
- **Response:** File URL and metadata
- **Status Codes:** 201 (Created), 400 (Bad Request), 401 (Unauthorized)

## Data Models

### User Model
```json
{
  "id": "string",
  "name": "string",
  "email": "string",
  "phone": "string",
  "createdAt": "date",
  "isVerified": boolean
}
```

### Center Model
```json
{
  "id": "string",
  "centerName": "string",
  "email": "string",
  "phone": "string",
  "address": "string",
  "licenseNumber": "string",
  "services": "string",
  "hours": "string",
  "description": "string",
  "rating": number,
  "latitude": number,
  "longitude": number,
  "isVerified": boolean,
  "createdAt": "date"
}
```

### Report Model
```json
{
  "id": "string",
  "userId": "string",
  "species": "string",
  "condition": "string",
  "distance": "string",
  "photoUrl": "string",
  "latitude": number,
  "longitude": number,
  "timestamp": "date",
  "status": "string", // pending|assigned|in_progress|completed|cancelled
  "assignedCenterId": "string",
  "notes": "string",
  "createdAt": "date",
  "updatedAt": "date"
}
```

### Clinic Model
```json
{
  "id": "string",
  "name": "string",
  "phone": "string",
  "address": "string",
  "hours": "string",
  "services": "string",
  "rating": number,
  "description": "string",
  "latitude": number,
  "longitude": number
}
```

## Security Considerations

1. **JWT Authentication:** All protected endpoints require valid JWT tokens
2. **Role-based Access:** Different permissions for users vs centers
3. **Input Validation:** Validate all inputs on both client and server
4. **File Upload Security:** Restrict file types and sizes
5. **Rate Limiting:** Implement rate limiting on authentication endpoints
6. **HTTPS Only:** All API calls must use HTTPS
7. **Location Privacy:** Handle user location data carefully

## Additional Requirements

1. **Geolocation Services:** Implement location-based report assignment to nearest centers
2. **Push Notifications:** For report status updates and new assignments
3. **Image Processing:** Resize and optimize uploaded images
4. **Audit Logging:** Log all report status changes and user actions
5. **Data Backup:** Regular backups of all report and user data
6. **GDPR Compliance:** Implement data deletion and export features

## Implementation Priority

**Phase 1 (Core Authentication):**
- Endpoints 1-8 (Authentication system)

**Phase 2 (Basic Functionality):**
- Endpoints 9-16 (Reports and Clinics)

**Phase 3 (Profile Management):**
- Endpoints 17-24 (User and Center profiles)

**Phase 4 (Enhancements):**
- Endpoint 25 (File uploads)
- Advanced features (search, filtering, notifications)