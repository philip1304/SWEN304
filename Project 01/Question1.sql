-- DROP tables first if they exist
DROP TABLE IF EXISTS Accomplices, HasAccounts, HasSkills, Plans, Robberies, Robbers, Skills, Banks CASCADE;

-- Banks
CREATE TABLE Banks (
    BankName TEXT NOT NULL,
    City TEXT NOT NULL,
    NoAccounts INT NOT NULL CHECK (NoAccounts >= 0),
    Security TEXT NOT NULL,
    PRIMARY KEY (BankName, City)
);

-- Robbers
CREATE TABLE Robbers (
    RobberId SERIAL PRIMARY KEY,
    Nickname TEXT NOT NULL,
    Age INT NOT NULL CHECK (Age > 0),
    NoYears INT NOT NULL CHECK (NoYears >= 0 AND NoYears <= Age)
);

-- Skills
CREATE TABLE Skills (
    SkillId SERIAL PRIMARY KEY,
    Description TEXT UNIQUE NOT NULL
);

-- HasSkills
CREATE TABLE HasSkills (
    RobberId INT NOT NULL,
    SkillId INT NOT NULL,
    Preference INT NOT NULL CHECK (Preference >= 1),
    Grade TEXT NOT NULL,
    PRIMARY KEY (RobberId, SkillId),
    FOREIGN KEY (RobberId) REFERENCES Robbers(RobberId) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SkillId) REFERENCES Skills(SkillId) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- HasAccounts
CREATE TABLE HasAccounts (
    RobberId INT NOT NULL,
    BankName TEXT NOT NULL,
    City TEXT NOT NULL,
    PRIMARY KEY (RobberId, BankName, City),
    FOREIGN KEY (RobberId) REFERENCES Robbers(RobberId) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BankName, City) REFERENCES Banks(BankName, City) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Robberies
CREATE TABLE Robberies (
    BankName TEXT NOT NULL,
    City TEXT NOT NULL,
    Date DATE NOT NULL,
    Amount INT NOT NULL CHECK (Amount >= 0),
    PRIMARY KEY (BankName, City, Date),
    FOREIGN KEY (BankName, City) REFERENCES Banks(BankName, City) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Plans
CREATE TABLE Plans (
    BankName TEXT NOT NULL,
    City TEXT NOT NULL,
    PlannedDate DATE NOT NULL,
    NoRobbers INT NOT NULL CHECK (NoRobbers >= 1),
    PRIMARY KEY (BankName, City, PlannedDate),
    FOREIGN KEY (BankName, City) REFERENCES Banks(BankName, City) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Accomplices
CREATE TABLE Accomplices (
    RobberId INT NOT NULL,
    BankName TEXT NOT NULL,
    City TEXT NOT NULL,
    Date DATE NOT NULL,
    Share INT NOT NULL CHECK (Share >= 0),
    PRIMARY KEY (RobberId, BankName, City, Date),
    FOREIGN KEY (RobberId) REFERENCES Robbers(RobberId) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BankName, City, Date) REFERENCES Robberies(BankName, City, Date) ON DELETE CASCADE ON UPDATE CASCADE
);