CREATE TABLE Users (
    user_id INT,
    full_name varchar(20),
    email varchar(50),
    role varchar(15),
    phone_number varchar(20),
    
  CONSTRAINT pk_user PRIMARY KEY (user_id),
  CONSTRAINT unq_email UNIQUE (email),
  CONSTRAINT chck_role CHECK (role IN('Ticket Manager', 'Football Fan'))
);


CREATE TABLE Matches (
    match_id INT,
    fixture VARCHAR(80),
    tournament_category VARCHAR(50),
    base_ticket_price DECIMAL(10,2),
    match_status VARCHAR(30),
    
    CONSTRAINT pk_matchid PRIMARY KEY (match_id),
    CONSTRAINT chck_price CHECK (base_ticket_price >= 0 ),
    CONSTRAINT chck_status CHECK (match_status IN ('Available', 'Selling Fast', 'Sold Out', 'Postponed'))
);

CREATE TABLE Bookings (
    booking_id INT,
    user_id INT,
    match_id INT,
    seat_number VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost DECIMAL(10,2),

  CONSTRAINT pk_bkingId PRIMARY KEY (booking_id),
  CONSTRAINT fk_userId FOREIGN KEY (user_id) REFERENCES users(user_id),
  CONSTRAINT fk_matchId FOREIGN KEY (match_id) REFERENCES matches(match_id),
  CONSTRAINT chck_cost CHECK (total_cost >= 0),
  CONSTRAINT chch_status CHECK (payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded'))
);


INSERT INTO users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);

INSERT INTO matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');

INSERT INTO bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);
(505, 3, 102, 'C-20', 'PFSending', 120.00);
drop table users
