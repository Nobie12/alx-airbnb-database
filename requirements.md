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

1. User ↔ Property
- A User (host) can have many Properties

- A Property belongs to one User

🧠 Relationship: 1 User → 0.. Properties*

📄 Attribute: host_id is a foreign key in Property

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
