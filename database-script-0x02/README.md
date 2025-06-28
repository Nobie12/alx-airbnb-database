# 🌱 Airbnb Clone - Database Seeding Script

This file contains the SQL script to populate the **Airbnb Clone** database with realistic sample data. It is intended for development and testing purposes.

---

## 📄 Overview

The seeding script inserts records into all main tables: `User`, `Property`, `Booking`, `Payment`, `Review`, and `Message`. This helps simulate a real-world environment and test application features like:

- User roles and relationships  
- Property listings and bookings  
- Payment processing  
- Messaging and reviews

> ⚠️ **Important:** This script should be run **after** executing `schema.sql`.

---

## 📁 What It Does

### 1. 🧹 Clears Existing Data

Before inserting fresh data, the script deletes all existing rows (optional but recommended for clean runs):

```sql
DELETE FROM Message;
DELETE FROM Review;
DELETE FROM Payment;
DELETE FROM Booking;
DELETE FROM Property;
DELETE FROM "User";
```

### 2. 👤 Inserts Sample Users

Adds four users with different roles:

- 2 Hosts: John Doe, Sam Jones

- 1 Guest: Jane Smith

- 1 Admin: Admin User

Each user has a UUID and a role (guest, host, or admin).

### 3. 🏡 Inserts Sample Properties

Three properties are added, each linked to a host:

- Cozy Beachfront Cottage (Malibu)

- Modern Downtown Loft (New York)

- Rustic Mountain Cabin (Aspen)

### 4. 📅 Inserts Sample Bookings

Two bookings are added for the guest:

One confirmed booking for the Malibu property

One pending booking for the Aspen property

### 5. 💳 Inserts Sample Payments

A payment is added for the confirmed booking using a credit card.

### 6. 🌟 Inserts Sample Reviews

A 5-star review is added by the guest for the completed stay at the beach cottage.

### 7. 💬 Inserts Sample Messages

Two messages simulate a conversation between:

- The guest (Jane Smith)

- The host (John Doe)

- This confirms check-in time and other details.

### ▶️ How to Use

Ensure you've already created the schema by running schema.sql.

Run the seed script using the PostgreSQL CLI:

```bash
psql -U your_username -d airbnb_clone -f seed.sql
Replace your_username with your actual PostgreSQL user.
```

### 🛠️ UUID Notes

This script uses hardcoded UUIDs for consistency and to ensure correct relationships across tables.

To generate new UUIDs:

Use an online UUID generator, or

Use PostgreSQL’s built-in function (if uuid-ossp extension is enabled):

```bash
SELECT uuid_generate_v4();
```

📬 Contact
For questions, feel free to fork the repo or open an issue or pull request.
