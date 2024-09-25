CREATE TABLE coachBio (
    coach_id INT PRIMARY KEY,
    coach_firstname VARCHAR(40),
    coach_lastname VARCHAR(40), 
    coach_age int,
    coach_dob_country VARCHAR(30),
    coach_nationality VARCHAR(30)
);

CREATE TABLE owner (
    owner_id int PRIMARY KEY,
    owner_firstname VARCHAR(40),
    owner_lastname VARCHAR(40),
    owner_nationality VARCHAR(30)
);

CREATE TABLE team (
    team_id int PRIMARY KEY,
    team_name VARCHAR(30),
    coach_id int,
    owner_id int,
    stadium_id int,
    estd_date DATE,
    wins int,
    draws int,
    loss int,
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id),
    FOREIGN KEY (coach_id) REFERENCES coachBio(coach_id)
);

CREATE TABLE playerBio (
    player_id int PRIMARY KEY,
    player_firstname VARCHAR(40),
    player_lastname VARCHAR(40), 
    player_age int,
    player_dob_country VARCHAR(30),
    player_nationality VARCHAR(30),
    player_position VARCHAR(2),
    coach_id int,
    team_id int,
    FOREIGN KEY (team_id) REFERENCES team(team_id),
    FOREIGN KEY (coach_id) REFERENCES coachBio(coach_id)
);

CREATE TABLE playerStats (
    player_id int PRIMARY KEY,
    minutes int,
    goals int,
    assists int,
    cleansheets int,
    saves int,
    succ_tackles int,
    fouls int,
    yellow_cards int,
    red_cards int,
    FOREIGN KEY (player_id) REFERENCES playerBio(player_id)
);

CREATE TABLE playerFinancial (
    player_id int PRIMARY KEY,
    wage int,
    fee int,
    contract_date DATE,
    contract_exp DATE,
    FOREIGN KEY (player_id) REFERENCES playerBio(player_id)
);
