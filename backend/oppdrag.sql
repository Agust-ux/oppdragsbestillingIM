-- Dette er en test fil på koden og info som blir lagt inn i databasen.
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(100) NOT NULL,
    epost VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(20) NOT NULL CHECK (role IN ('elev','lærer','ekstern')),
    linje VARCHAR(10) CHECK (linje IN ('IT','MP') OR linje IS NULL),
    trinn VARCHAR(5) CHECK (trinn IN ('VG1','VG2','VG3') OR trinn IS NULL),
    status VARCHAR(15) DEFAULT 'tilgjenglig' CHECK (status IN ('tilgjenglig','opptatt','kanskje')),    
    bio TEXT,
    feide_id VARCHAR(50) NULL,
    login_token VARCHAR(100) NULL,
    token_expiry TIMESTAMP NULL,
    is_blocked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- (Hentet fra ChatGPT) Betingelser
    CHECK (
        NOT (role = 'ekstern' AND feide_id IS NOT NULL)
    ),
    CHECK (
        NOT ((role = 'elev' OR role = 'lærer') AND login_token IS NOT NULL)
    )
);

INSERT INTO users (navn, epost, role, linje, trinn, status)
VALUES 
('Kritika','kritika@test.no','elev','IT','VG2','tilgjenglig'),
('Jonas','jonas@test.no','lærer',NULL,NULL,'opptatt'),
('Emma','emma@test.no','ekstern',NULL,NULL, NULL);

CREATE TABLE projects {
    projects_id INT AUTO_INCREMENT PRIMARY KEY,
    
}