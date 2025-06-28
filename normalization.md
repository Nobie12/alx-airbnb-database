# 🗃️ Database Normalization Report for Airbnb Clone Project

## 📖 Introduction

This document outlines the **normalization process** and confirms that the **database schema** for the **Airbnb Clone project** adheres to the principles of **Third Normal Form (3NF)**.

The goal of normalization is to:
- ✅ Reduce data redundancy  
- ✅ Prevent data anomalies (insertion, update, and deletion)  
- ✅ Ensure data integrity  

Our database was designed from the outset to comply with these principles.

---

## 1️⃣ First Normal Form (1NF)

### 🧾 Rule:
A table is in **1NF** if:
- All columns contain **atomic (indivisible) values**
- Each record is **unique**(there must a primary key)
- There are **no repeating groups** of columns

### 🛠 Application:
All tables in our schema satisfy **1NF**:
- Each cell holds a **single piece of information**  
  _e.g., `first_name` and `last_name` are stored in separate columns, not a combined `full_name`._
- Each table has a **unique Primary Key**  
  _e.g., `user_id`, `property_id` ensure every row is distinct._

---

## 2️⃣ Second Normal Form (2NF)

### 🧾 Rule:
A table is in **2NF** if:
- It is already in **1NF**
- All non-key attributes are **fully functionally dependent** on the **entire primary key**

This mainly applies to tables with **composite primary keys**.

### 🛠 Application:
All tables in our schema satisfy **2NF**:
- All primary keys are **single-column** (e.g., `user_id`, `property_id`, `booking_id`)
- Therefore, there are **no partial dependencies**
- Each non-key attribute depends entirely on its table’s primary key

---

## 3️⃣ Third Normal Form (3NF)

### 🧾 Rule:
A table is in **3NF** if:
- It is already in **2NF**
- It has **no transitive dependencies**  
  _(i.e., non-key attributes do not depend on other non-key attributes)_

### 🛠 Application:
All tables in our schema satisfy **3NF**:
- All non-key attributes depend **directly and only** on the primary key
  _e.g., in the `Property` table, fields like `name`, `location`, and `price_per_night` all describe `property_id`_
- We’ve eliminated transitive dependencies by:
  - Separating entities like `User`, `Property`, `Booking`, etc.
  - Using foreign keys (e.g., `host_id`) instead of duplicating data

---

## ✅ Conclusion

The **Airbnb Clone database schema** is fully normalized to **Third Normal Form (3NF)**.

This ensures:
- 🔁 Minimal data duplication  
- ⚙️ High data integrity  
- 🚀 Scalable design for production systems

---
> 🛠️ Built as part of the ALX Backend Engineering Program

