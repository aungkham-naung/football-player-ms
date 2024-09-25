INSERT INTO coachBio (coach_id, coach_firstname, coach_lastname, coach_age, coach_dob_country, coach_nationality) VALUES
('C001', 'John', 'Smith', 45, 'England', 'British'),
('C002', 'Maria', 'Garcia', 50, 'Spain', 'Spanish'),
('C003', 'Alex', 'Johnson', 40, 'USA', 'American');

INSERT INTO owner (owner_id, owner_firstname, owner_lastname, owner_nationality) VALUES
('O001', 'Alice', 'Brown', 'British'),
('O002', 'Carlos', 'Martinez', 'Spanish'),
('O003', 'Linda', 'Clark', 'American');

INSERT INTO team (team_id, team_name, coach_id, owner_id, stadium_id, estd_date, wins, draws, loss) VALUES
('T001', 'Raptors', 'C001', 'O001', 'S001', '1990-03-15', 20, 5, 10),
('T002', 'Falcons', 'C002', 'O002', 'S002', '1985-07-12', 25, 8, 7),
('T003', 'Wolves', 'C003', 'O003', 'S003', '2000-01-30', 18, 10, 12);

INSERT INTO playerBio (player_id, player_firstname, player_lastname, player_age, player_dob_country, player_nationality, player_position, coach_id, team_id) VALUES
('P001', 'Michael', 'Roberts', 25, 'USA', 'American', 'MF', 'C001', 'T001'),
('P002', 'Luis', 'Gomez', 22, 'Spain', 'Spanish', 'FW', 'C002', 'T002'),
('P003', 'David', 'Taylor', 28, 'England', 'British', 'DF', 'C003', 'T003');

INSERT INTO playerStats (player_id, minutes, goals, assists, cleansheets, saves, succ_tackles, fouls, yellow_cards, red_cards) VALUES
('P001', 2020, 5, 7, 0, 0, 18, 12, 3, 0),
('P002', 1800, 11, 4, 0, 0, 20, 10, 5, 1),
('P003', 2200, 2, 5, 15, 0, 25, 8, 2, 0);

INSERT INTO playerFinancial (player_id, wage, fee, contract_date, contract_exp) VALUES
('P001', 50000, 1000000, '2021-08-01', '2024-07-31'),
('P002', 45000, 800000, '2022-01-15', '2025-01-14'),
('P003', 55000, 1200000, '2020-06-30', '2023-06-29');
