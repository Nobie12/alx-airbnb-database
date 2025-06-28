# 📋 Project Requirements: ALX Airbnb Database Design

## 🧠 Overview

This project is a database schema design for an **Airbnb-like platform**. It models the core entities and relationships needed for managing:
- Users (guests, hosts, admins)
- Property listings
- Bookings and payments
- User reviews
- Messaging between users

The goal is to design a **normalized, relational database** that supports essential operations like property listing, booking, payments, reviews, and user messaging.

---

## 🧱 Entities and Key Attributes

### 🧑‍💼 User
- `user_id` (PK)
- `first_name`, `last_name`, `email`
- `password_hash`, `phone_number`
- `role`: guest, host, or admin
- `created_at`

### 🏠 Property
- `property_id` (PK)
- `host_id` (FK → User)
- `name`, `description`, `location`, `pricepernight`
- `created_at`, `updated_at`

### 📅 Booking
- `booking_id` (PK)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `start_date`, `end_date`, `total_price`, `status`
- `created_at`

### 💳 Payment
- `payment_id` (PK)
- `booking_id` (FK → Booking)
- `amount`, `payment_date`, `payment_method`

### ⭐ Review
- `review_id` (PK)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `rating` (1 to 5), `comment`, `created_at`

### ✉️ Message
- `message_id` (PK)
- `sender_id` (FK → User)
- `recipient_id` (FK → User)
- `message_body`, `sent_at`

---

## Relationships Between Entities (with Explanation)

### 1. User ↔ Property
- A User (host) can have many Properties

- A Property belongs to one User

> 🧠 Relationship: 1 User → 0.. Properties*

> 📄 Attribute: host_id is a foreign key in Property

### 2. User ↔ Booking
- A User (guest) can make many Bookings

- Each Booking is made by one User

> 🧠 Relationship: 1 User → 0.. Bookings*

> 📄 user_id is a foreign key in Booking

### 3. Property ↔ Booking
- A Property can be booked many times

- Each Booking is for one Property

> 🧠 Relationship: 1 Property → 0.. Bookings*

> 📄 property_id in Booking is a foreign key to Property


### 4. Booking ↔ Payment
- A Booking has one Payment

- Each Payment is linked to one Booking

> 🧠 Relationship: 1 Booking → 1 Payment

> 📄 booking_id in Payment references Booking

### 5. User ↔ Review
- A User can write many Reviews

- Each Review is written by one User

> 🧠 Relationship: 1 User → 0.. Reviews*

> 📄 user_id in Review

### 6. Property ↔ Review
- A Property can have many Reviews

- Each Review is for one Property

> 🧠 Relationship: 1 Property → 0.. Reviews*

> 📄 property_id in Review

### 7. User ↔ Message ↔ User
- A User can send many Messages

- A User can also receive many Messages

> 🧠 Relationship: M:N between Users, but represented via Message entity*

> sender_id and recipient_id both refer to User.user_id
---

## 🗂️ ER Diagram

The ER diagram is included in the repository under:
./ER.png


It visually represents all entities, primary/foreign keys, and relationships using crow’s foot (Hench) notation.

---

## 🛠️ Tools & Assumptions

- Designed for **relational databases** (e.g. MySQL, PostgreSQL)
- UUIDs used as primary keys
- Timestamps use standard SQL formats
- Enum types for roles, payment methods, and statuses
- Designed for **3NF (Third Normal Form)** to avoid redundancy

---

## ✅ To Do (optional)
- Add SQL `CREATE TABLE` scripts
- Add sample seed data or fixtures
- Document constraints and indexing strategy

---

> Built as part of the **ALX Backend Engineering Program** — focused on real-world database schema modeling.
