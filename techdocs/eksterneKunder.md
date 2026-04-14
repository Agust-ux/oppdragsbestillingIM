# EKSTERNE KUNDER
---
LANDINGSSIDE
---
Components:

- Sende oppdrag knapp
- Oppdrag status
- Status kort:
    Active Orders
    Action Required
    Waiting for Response
    Unread Messages

---
BESTILLINGSSKJEMA
---

FRA OPPDRAGSGIVER:

- company_name (string)
- organization_number (string)

KONTAKTPERSON:

- contact_name (string) *
- email (email) *
- phone_number (string)

OPPDRAGSINFORMASJON:

- request_type (string) *
- title (string)
- description (textarea) *
- deadline (date) * 
- target_audience (string) *
- special_requirements (textarea)
- budget (number)
- notes (textarea)

SYSTEM:

On submit:

- Validate required fields
- Create order
- Set status = NEW
- Send confirmation email