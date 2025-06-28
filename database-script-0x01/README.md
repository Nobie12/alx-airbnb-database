# 🏠 Airbnb Clone - Database Schema Script

## 📄 Overview

This directory contains the SQL script for creating the **database schema** of the Airbnb Clone project. The schema is designed to be:

- **Robust** – Supports core Airbnb features
- **Normalized** – Avoids data redundancy
- **Efficient** – Optimized for performance with indexing

---

## 📁 Files

### `schema.sql`

This is the main SQL **DDL (Data Definition Language)** script. It performs the following actions:

1. **Creates Custom Types**  
   Defines `ENUM` types for:
   - User roles (e.g., `guest`, `host`, `admin`)
   - Booking statuses (e.g., `pending`, `confirmed`)
   - Payment methods (e.g., `card`, `paypal`)  
   > 🧠 This ensures data consistency across related columns.

2. **Creates Tables**  
   Builds all the necessary tables:
   - `User`
   - `Property`
   - `Booking`
   - `Payment`
   - `Review`
   - `Message`

3. **Defines Constraints**  
   Applies strict data integrity rules:
   - `PRIMARY KEY`, `FOREIGN KEY`
   - `UNIQUE`, `NOT NULL`, and `CHECK`

4. **Creates Indexes**  
   Adds indexes on frequently queried columns (e.g., `user_id`, `email`, `property_id`) to improve query performance.

---

## ▶️ How to Use

To set up the schema in a **PostgreSQL** database, run the script using the `psql` command-line tool:

```bash
psql -U your_username -d your_database_name -f schema.sql
