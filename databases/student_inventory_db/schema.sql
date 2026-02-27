CREATE TABLE students (

    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(120) UNIQUE,
    department VARCHAR(80),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE staff_users(

    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(60) UNIQUE,
    role ENUM('admin','staff') DEFAULT 'staff'

);

CREATE TABLE inventory_items (

    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(120),
    category VARCHAR(60),
    total_quantity INT CHECK(total_quantity >=0),
    damaged_quantity INT DEFAULT 0,
    deleted BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

CREATE TABLE borrow_transactions(

 transaction_id INT AUTO_INCREMENT PRIMARY KEY,

 student_id INT,
 item_id INT,

 quantity INT CHECK(quantity>0),

 borrow_date DATE,
 due_date DATE,
 return_date DATE,

 penalty DECIMAL(6,2) DEFAULT 0,

 status ENUM(
 'borrowed',
 'returned',
 'late'
 ) DEFAULT 'borrowed',

 FOREIGN KEY(student_id)
 REFERENCES students(student_id),

 FOREIGN KEY(item_id)
 REFERENCES inventory_items(item_id)

);

CREATE TABLE audit_logs(

 log_id INT AUTO_INCREMENT PRIMARY KEY,

 action_type VARCHAR(50),
 table_name VARCHAR(50),

 record_id INT,

 performed_by INT,

 action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);