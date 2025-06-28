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
