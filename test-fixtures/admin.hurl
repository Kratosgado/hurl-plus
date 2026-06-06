# Admin – full operation coverage
# Run: hurl --variables-file vars/dev.env admin.hurl
#      hurl --variables-file vars/staging.env admin.hurl


# --- 1. Login -------------------------------------------------

POST {{base}}/auth/login
Content-Type: application/json

{
  "email": "admin@gmail.com",
  "password": "28935617Aa@"
}

HTTP 200
[Captures]
admincookies: header "Set-Cookie"
orgId: jsonpath "$.data.extra.orgId"


# --- 2. Logout ------------------------------------------------

POST {{base}}/auth/logout
Cookie: {{admincookies}}

HTTP 200
[Captures]
admincookies: header "Set-Cookie"


# --- 3. Create slot pattern -----------------------------------

POST {{base}}/appointments/slot-pattern
Content-Type: application/json
Cookie: {{admincookies}}

{
  "startDate": "2025-03-23",
  "recurrence": "FREQ=WEEKLY;BYDAY=MO,WE,FR;INTERVAL=1",
  "duration": 45,
  "type": "visit",
  "startTime": "08:00",
  "endTime": "08:50"
}

HTTP 200


# --- 4. Get slot patterns -------------------------------------

GET {{base}}/appointments/slot-patterns
Cookie: {{admincookies}}

HTTP 200


# --- 5. Get slots ---------------------------------------------

GET {{base}}/appointments/slots
Cookie: {{admincookies}}

HTTP 200
[Captures]
slotId: jsonpath "$.data.rows[1].id"


# --- 6. Create slot exception ---------------------------------

POST {{base}}/appointments/slot-exception
Content-Type: application/json
Cookie: {{admincookies}}

{
  "type": "modification",
  "date": "2025-03-01",
  "patternId": "e658d918-32ab-4cb9-a1bf-3543497c319a",
  "reason": "dfhdf dkfjr"
}

HTTP 200


# --- 7. Update org --------------------------------------------

PATCH {{base}}/orgs/
Content-Type: application/json
Cookie: {{admincookies}}

{
  "name": "Wisoky and Brothers",
  "regularFee": 8.8
}

HTTP 200


# --- 8. Get hospitals -----------------------------------------

GET {{base}}/common/orgs
Cookie: {{admincookies}}

HTTP 200
[Captures]
hospitalId: jsonpath "$.data.rows[0].id"


# --- 9. Find pending doctors ----------------------------------

GET {{base}}/doctors?status=pending
Cookie: {{admincookies}}

HTTP 200
[Captures]
fDoctorId: jsonpath "$.data.rows[0].id"


# --- 10. Decline doctor ---------------------------------------

DELETE {{base}}/admins/verify-doctor/{{fDoctorId}}
Cookie: {{admincookies}}

HTTP 200


# --- 11. Verify doctor ----------------------------------------

PATCH {{base}}/admins/verify-doctor/{{fDoctorId}}
Cookie: {{admincookies}}

HTTP 200


# --- 12. Find slots for doctor --------------------------------

GET {{base}}/appointments/slots?doctorId={{fDoctorId}}
Cookie: {{admincookies}}

HTTP 200


# --- 13. Find appointments ------------------------------------

GET {{base}}/appointments
Cookie: {{admincookies}}

HTTP 200


# --- 14. Appointment stats ------------------------------------

GET {{base}}/appointments/stats
Cookie: {{admincookies}}

HTTP 200


# --- 15. Find pending appointment requests --------------------

GET {{base}}/appointments/requests?status=pending
Cookie: {{admincookies}}

HTTP 200


# --- 16. Accept appointment request ---------------------------

POST {{base}}/appointments/request-accept/685cb187-c757-4725-a60a-352b8333f7ef
Cookie: {{admincookies}}

HTTP 200


# --- 17. Get specialties --------------------------------------

GET {{base}}/doctors/specialties
Cookie: {{admincookies}}

HTTP 200


# --- 18. Get banks --------------------------------------------

GET {{base}}/payments/banks?perPage=1
Cookie: {{admincookies}}

HTTP 200


# --- 19. Add payment method -----------------------------------

POST {{base}}/payments/methods
Content-Type: application/json
Cookie: {{admincookies}}

{
  "accountNumber": "0599439271",
  "type": "mobile_money",
  "reference": "Kratos",
  "bankCode": "MTN"
}

HTTP 200


# --- 20. Get current admin ------------------------------------

GET {{base}}/admins/me
Cookie: {{admincookies}}

HTTP 200


# --- 21. Invite doctor ----------------------------------------

POST {{base}}/admins/invite-doctor
Content-Type: application/json
Cookie: {{admincookies}}

{
  "password": "28935617Aa@",
  "firstName": "Kratos",
  "lastName": "Gado",
  "email": "kratosgado@gmail.com",
  "orgId": "{{orgId}}"
}

HTTP 200