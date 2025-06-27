USE airbnb_clone;

-- --------------------------------------------------
-- 1. Insert Users (5 total)
-- --------------------------------------------------
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('1a2b3c4d-0000-0000-0000-111122223333', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', '0712345678', 'host'),
  ('2b3c4d5e-0000-0000-0000-222233334444', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', '0723456789', 'guest'),
  ('3c4d5e6f-0000-0000-0000-333344445555', 'Clara', 'Ngugi', 'clara@example.com', 'hashed_pw_3', '0734567890', 'host'),
  ('4d5e6f7g-0000-0000-0000-444455556666', 'David', 'Otieno', 'david@example.com', 'hashed_pw_4', '0745678901', 'guest'),
  ('5e6f7g8h-0000-0000-0000-555566667777', 'Eve', 'Wangari', 'eve@example.com', 'hashed_pw_5', '0756789012', 'admin');

-- --------------------------------------------------
-- 2. Insert Properties (3 properties hosted by Alice and Clara)
-- --------------------------------------------------
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('prop-0001-0000-0000-0000-aaaa1111bbbb', '1a2b3c4d-0000-0000-0000-111122223333', 'Cozy Apartment', 'A lovely 2-bedroom apartment in Nairobi.', 'Nairobi, Kenya', 45.00),
  ('prop-0002-0000-0000-0000-aaaa2222bbbb', '3c4d5e6f-0000-0000-0000-333344445555', 'Modern Studio', 'Minimalist studio with smart appliances.', 'Mombasa, Kenya', 60.00),
  ('prop-0003-0000-0000-0000-aaaa3333bbbb', '1a2b3c4d-0000-0000-0000-111122223333', 'Beach House', 'A beautiful oceanfront home.', 'Diani Beach, Kenya', 120.00);

-- --------------------------------------------------
-- 3. Insert Bookings (3 bookings made by Bob and David)
-- --------------------------------------------------
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('book-0001-0000-0000-0000-cccc1111dddd', 'prop-0001-0000-0000-0000-aaaa1111bbbb', '2b3c4d5e-0000-0000-0000-222233334444', '2025-07-01', '2025-07-03', 90.00, 'confirmed'),
  ('book-0002-0000-0000-0000-cccc2222dddd', 'prop-0002-0000-0000-0000-aaaa2222bbbb', '4d5e6f7g-0000-0000-0000-444455556666', '2025-07-05', '2025-07-07', 120.00, 'pending'),
  ('book-0003-0000-0000-0000-cccc3333dddd', 'prop-0003-0000-0000-0000-aaaa3333bbbb', '2b3c4d5e-0000-0000-0000-222233334444', '2025-08-01', '2025-08-04', 360.00, 'confirmed');

-- --------------------------------------------------
-- 4. Insert Payments
-- --------------------------------------------------
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('paym-0001-0000-0000-0000-eeee1111ffff', 'book-0001-0000-0000-0000-cccc1111dddd', 90.00, 'credit_card'),
  ('paym-0002-0000-0000-0000-eeee2222ffff', 'book-0002-0000-0000-0000-cccc2222dddd', 120.00, 'paypal'),
  ('paym-0003-0000-0000-0000-eeee3333ffff', 'book-0003-0000-0000-0000-cccc3333dddd', 360.00, 'stripe');

-- --------------------------------------------------
-- 5. Insert Reviews
-- --------------------------------------------------
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('revi-0001-0000-0000-0000-gggg1111hhhh', 'prop-0001-0000-0000-0000-aaaa1111bbbb', '2b3c4d5e-0000-0000-0000-222233334444', 5, 'Amazing apartment! Very cozy and clean.'),
  ('revi-0002-0000-0000-0000-gggg2222hhhh', 'prop-0002-0000-0000-0000-aaaa2222bbbb', '4d5e6f7g-0000-0000-0000-444455556666', 4, 'Modern space and great amenities.'),
  ('revi-0003-0000-0000-0000-gggg3333hhhh', 'prop-0003-0000-0000-0000-aaaa3333bbbb', '2b3c4d5e-0000-0000-0000-222233334444', 5, 'Absolutely loved the beach view!');

-- --------------------------------------------------
-- 6. Insert Messages
-- --------------------------------------------------
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('mess-0001-0000-0000-0000-iiii1111jjjj', '2b3c4d5e-0000-0000-0000-222233334444', '1a2b3c4d-0000-0000-0000-111122223333', 'Hi Alice, is your apartment available next weekend?'),
  ('mess-0002-0000-0000-0000-iiii2222jjjj', '4d5e6f7g-0000-0000-0000-444455556666', '3c4d5e6f-0000-0000-0000-333344445555', 'Hello Clara, I have a question about the studio.'),
  ('mess-0003-0000-0000-0000-iiii3333jjjj', '2b3c4d5e-0000-0000-0000-222233334444', '1a2b3c4d-0000-0000-0000-111122223333', 'Thanks Alice, I really enjoyed the stay!');
