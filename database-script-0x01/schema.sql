-- Create the database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS airbnb_clone_database;
USE airbnb_clone_database;

-- --------------------------------------------------
-- USERS TABLE
-- --------------------------------------------------
CREATE TABLE User (
  user_id CHAR(36) PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  role ENUM('guest', 'host', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index on email (for login/search optimization)
CREATE INDEX idx_user_email ON User(email);

-- --------------------------------------------------
-- PROPERTIES TABLE
-- --------------------------------------------------
CREATE TABLE Property (
  property_id CHAR(36) PRIMARY KEY,
  host_id CHAR(36) NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(255) NOT NULL,
  price_per_night DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- --------------------------------------------------
-- BOOKINGS TABLE
-- --------------------------------------------------
CREATE TABLE Booking (
  booking_id CHAR(36) PRIMARY KEY,
  property_id CHAR(36) NOT NULL,
  user_id CHAR(36) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- Index on property_id (foreign key)
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- --------------------------------------------------
-- PAYMENTS TABLE
-- --------------------------------------------------
CREATE TABLE Payment (
  payment_id CHAR(36) PRIMARY KEY,
  booking_id CHAR(36) NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- Index on booking_id (foreign key)
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- --------------------------------------------------
-- REVIEWS TABLE
-- --------------------------------------------------
CREATE TABLE Review (
  review_id CHAR(36) PRIMARY KEY,
  property_id CHAR(36) NOT NULL,
  user_id CHAR(36) NOT NULL,
  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
  UNIQUE (user_id, property_id)
);

-- --------------------------------------------------
-- MESSAGES TABLE
-- --------------------------------------------------
CREATE TABLE Message (
  message_id CHAR(36) PRIMARY KEY,
  sender_id CHAR(36) NOT NULL,
  recipient_id CHAR(36) NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE,
  FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
);