CREATE DATABASE IF NOT EXISTS dental_clinic;
USE dental_clinic;

-- Surveys Table with surveyId as Primary Key
CREATE TABLE IF NOT EXISTS surveys (
    survey_id VARCHAR(255) PRIMARY KEY,  -- Using surveyId from CSV as the primary key
    name VARCHAR(255),
    email VARCHAR(255),
    survey_date DATE,
    appointment_date DATE NULL
);

-- Providers Table
CREATE TABLE IF NOT EXISTS providers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE
);

-- Responses Table
CREATE TABLE IF NOT EXISTS responses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    survey_id VARCHAR(255),
    provider_id INT,
    comment TEXT,
    FOREIGN KEY (survey_id) REFERENCES surveys(survey_id) ON DELETE CASCADE,
    FOREIGN KEY (provider_id) REFERENCES providers(id) ON DELETE SET NULL,
    UNIQUE (survey_id, provider_id)
);

-- Questions Table
CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text VARCHAR(255) UNIQUE
);

-- Response Details Table
CREATE TABLE IF NOT EXISTS response_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    response_id INT,
    question_id INT,
    response VARCHAR(255),
    FOREIGN KEY (response_id) REFERENCES responses(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE (response_id, question_id)
);