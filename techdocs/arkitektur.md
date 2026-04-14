# Systemarkitektur
---
Oversikt
---
Dette systemet er en enkel webapplikasjon bygget med Node.js, Express og MariaDB. Applikasjonen består av en frontend (HTML/JavaScript), en backend (API-server) og en database for lagring av brukerdata.

Systemet er designet for å:

- Hente brukerdata fra en database
- Vise brukere i nettleseren
- Muliggjøre filtrering av brukere basert på rolle
- Levere en personvernerklæring-side

---
Arkitekturdiagram (logisk nivå)
---
```
[ Nettleser / Frontend ]
          |
          | HTTP (GET /api/users)
          v
[ Express Backend / API ]
          |
          | SQL (SELECT ...)
          v
[ MariaDB Database ]
```
---
Komponenter
---
***
**3.1 Frontend**
***

Frontend består av statiske HTML-filer:
```
index.html
pe_ekstern.html
```

Frontend bruker JavaScript (fetch) for å kommunisere med backend via HTTP.

*Funksjonalitet:*

- Sender forespørsel til API 
- Hente informasjon /GET
- Legge til informasjon fra brukere til databasen /POST

*Teknologier:*
- HTML5
- JavaScript (Fetch API)

---
**3.2 Backend (API-server)**
---

Backend er implementert med Express i Node.js og fungerer som et mellomledd mellom frontend og databasen.

*Fil:*
- server.js

*Ansvar:*
- Motta HTTP-forespørsler
- Hente data fra databasen
- Returnere JSON-respons
- Håndtere feil
- Servere statiske HTML-filer

*API-endepunkter:*
```
GET /
```
*Returnerer hovedsiden:*
```
index.html

GET /pe_ekstern.html
```
Returnerer personvernerklæringen.
```
GET /api/users
```
Henter alle brukere fra databasen.

*SQL-spørring:*
```
SELECT navn, epost, role, status FROM users

(Planlagt) GET /filter
```
Filtrerer brukere basert på rolle.

Eksempel:
```
/filter?role=elev
```
***
**3.3 Database**
***
Databasen er en MariaDB-database som lagrer brukerdata.

*Tabeller:*
```
users
projects
project_members
messages
notifications
process_log
attachments
```

***users***
```
user_id
navn
epost
role
linje
trinn
status
bio
feide_id
login_token
token_expiry
is_blocked
created_at
```
Databaseforbindelsen håndteres via en connection pool.

Konfigurasjon hentes fra miljøvariabler (.env).

Eksempel:
```
DB_HOST=
DB_USER=
DB_PASS=
DB_DATABASE=
DB_LIMIT=5
```
---
Dataflyt
---
Scenario: Hent alle brukere

Bruker åpner nettsiden

Frontend sender HTTP-forespørsel

GET /api/users

Backend mottar forespørselen

Backend kobler til databasen

SQL-spørring kjøres

Resultat returneres som JSON

Frontend viser data i nettleseren

5. Sikkerhet

Følgende sikkerhetstiltak er implementert eller anbefalt:

Implementert

Bruk av miljøvariabler (.env) for databasepassord

Feilhåndtering i API

Parameterisert SQL (i filter-endepunktet)

Anbefalt forbedring

Input-validering

Autentisering (login)

Autorisasjon (rollebasert tilgang)

HTTPS

Rate limiting

Logging

6. Skalerbarhet

Systemet kan skaleres ved å:

Øke connectionLimit i databasen

Deploye flere backend-instanser

Bruke reverse proxy (f.eks. Nginx)

Flytte frontend til egen statisk hosting

7. Distribusjon (Deployment)

Serveren startes med:

node server.js

Applikasjonen kjører på:

http://localhost:3003

Mulige produksjonsmiljøer:

Linux server

Docker container

Cloud (Azure, AWS, GCP)

8. Mappe-struktur (eksempel)

project/
│
├── server.js
├── package.json
├── .env
│
├── index.html
├── pe_ekstern.html
│
└── node_modules/

9. Fremtidige forbedringer

Implementere /filter endpoint fullt ut

Lage egen frontend-fil for visning av brukere

Bruke innerHTML mer kontrollert (unngå DOM-overskriving)

Legge til REST-standard (POST, PUT, DELETE)

Lage API-dokumentasjon

Implementere autentisering (JWT / session)

10. Arkitekturstil

Systemet følger en:

3-lags arkitektur (Three-tier architecture)

Lag:

Presentasjonslag (Frontend)

Applikasjonslag (Backend / API)

Datalag (Database)

Dette gir:

Separasjon av ansvar

Enklere vedlikehold

Bedre skalerbarhet

