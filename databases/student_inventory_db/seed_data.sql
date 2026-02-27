INSERT INTO students (full_name,email,department) VALUES
('Ali Hassan','ali.hassan@uni.edu','Information Technology'),
('Sara Ahmed','sara.ahmed@uni.edu','Medicine'),
('Omar Khaled','omar.khaled@uni.edu','Law'),
('Zainab Karim','zainab.karim@uni.edu','Business Administration'),
('Mustafa Ali','mustafa.ali@uni.edu','Civil Engineering'),
('Huda Abbas','huda.abbas@uni.edu','Architecture'),
('Yusuf Mahdi','yusuf.mahdi@uni.edu','Pharmacy'),
('Fatima Noor','fatima.noor@uni.edu','Psychology'),
('Hassan Raad','hassan.raad@uni.edu','Mechanical Engineering'),
('Mariam Adil','mariam.adil@uni.edu','English Literature'),
('Ahmed Saif','ahmed.saif@uni.edu','Economics'),
('Rana Sami','rana.sami@uni.edu','Dentistry'),
('Haider Kareem','haider.kareem@uni.edu','Physics'),
('Noor Salman','noor.salman@uni.edu','Mathematics'),
('Laith Hamid','laith.hamid@uni.edu','Political Science'),
('Aya Tariq','aya.tariq@uni.edu','Education'),
('Karrar Ali','karrar.ali@uni.edu','Chemistry'),
('Zahra Nabil','zahra.nabil@uni.edu','Fine Arts'),
('Aliyah Fares','aliyah.fares@uni.edu','Biology'),
('Mahmood Hasan','mahmood.hasan@uni.edu','History'),
('Rasha Kareem','rasha.kareem@uni.edu','Geography'),
('Haidar Salman','haidar.salman@uni.edu','Accounting'),
('Noor Ali','noor.ali@uni.edu','Marketing'),
('Taha Abbas','taha.abbas@uni.edu','Nursing'),
('Sajjad Karim','sajjad.karim@uni.edu','Statistics'),
('Zena Mohammed','zena.mohammed@uni.edu','Translation Studies'),
('Adnan Saleh','adnan.saleh@uni.edu','Electrical Engineering'),
('Rahaf Omar','rahaf.omar@uni.edu','Public Administration'),
('Murtadha Ali','murtadha.ali@uni.edu','Sociology'),
('Dina Khalid','dina.khalid@uni.edu','Environmental Science');



INSERT INTO staff_users (username,role) VALUES
('admin_main','admin'),
('inventory_admin','admin'),
('staff_ahmed','staff'),
('staff_lina','staff'),
('staff_yousef','staff'),
('staff_sara','staff');



INSERT INTO inventory_items
(item_name,category,total_quantity,damaged_quantity)
VALUES

('Laptop Dell Latitude','Computers',20,1),
('Laptop HP Elitebook','Computers',15,0),
('Desktop Workstation','Computers',10,2),

('Arduino Starter Kit','Electronics',30,2),
('Raspberry Pi 4','Electronics',18,1),
('Breadboard Kit','Electronics',50,4),

('Oscilloscope Tektronix','Lab Equipment',8,0),
('Digital Multimeter','Lab Equipment',25,3),
('Signal Generator','Lab Equipment',6,1),

('Cisco Router','Networking',12,0),
('Cisco Switch 24 Port','Networking',14,1),
('Ethernet Cable 5m','Networking',200,10),
('Ethernet Cable 10m','Networking',120,6),
('Fiber Optic Patch Cable','Networking',80,3),

('VR Headset','AI Lab',5,0),
('GPU RTX Training Unit','AI Lab',4,0),

('Projector Epson','Classroom',9,1),
('Wireless Presenter','Classroom',40,2),
('Webcam HD','Classroom',35,1),
('USB Microphone','Classroom',22,0);



INSERT INTO borrow_transactions
(student_id,item_id,quantity,borrow_date,due_date,return_date,status,penalty)
VALUES

(1,1,1,'2026-02-01','2026-02-08','2026-02-07','returned',0),
(2,4,2,'2026-02-03','2026-02-10','2026-02-14','late',6.00),
(3,10,1,'2026-02-05','2026-02-12',NULL,'borrowed',0),
(4,7,1,'2026-02-06','2026-02-13','2026-02-12','returned',0),
(5,12,10,'2026-02-02','2026-02-09',NULL,'borrowed',0),
(6,2,1,'2026-02-04','2026-02-11','2026-02-18','late',10.50),
(7,8,2,'2026-02-01','2026-02-08','2026-02-06','returned',0),
(8,14,5,'2026-02-07','2026-02-14',NULL,'borrowed',0),
(9,16,1,'2026-02-08','2026-02-15','2026-02-20','late',7.50),
(10,5,1,'2026-02-09','2026-02-16',NULL,'borrowed',0),
(11,3,1,'2026-02-01','2026-02-08','2026-02-05','returned',0),
(12,18,3,'2026-02-03','2026-02-10',NULL,'borrowed',0),
(13,19,2,'2026-02-04','2026-02-11','2026-02-13','late',3.00),
(14,6,4,'2026-02-06','2026-02-13','2026-02-12','returned',0),
(15,11,1,'2026-02-05','2026-02-12',NULL,'borrowed',0),
(16,17,1,'2026-02-02','2026-02-09','2026-02-08','returned',0),
(17,9,1,'2026-02-07','2026-02-14','2026-02-19','late',7.50),
(18,13,8,'2026-02-08','2026-02-15',NULL,'borrowed',0),
(19,15,1,'2026-02-03','2026-02-10','2026-02-09','returned',0),
(20,20,2,'2026-02-04','2026-02-11',NULL,'borrowed',0),
(21,6,3,'2026-02-10','2026-02-17',NULL,'borrowed',0),
(22,4,1,'2026-02-11','2026-02-18','2026-02-19','late',1.50),
(23,8,2,'2026-02-09','2026-02-16','2026-02-15','returned',0),
(24,1,1,'2026-02-08','2026-02-15',NULL,'borrowed',0),
(25,12,6,'2026-02-12','2026-02-19',NULL,'borrowed',0),
(26,3,1,'2026-02-05','2026-02-12','2026-02-12','returned',0),
(27,9,1,'2026-02-13','2026-02-20',NULL,'borrowed',0),
(28,18,4,'2026-02-14','2026-02-21',NULL,'borrowed',0),
(29,7,1,'2026-02-10','2026-02-17','2026-02-22','late',7.50),
(30,5,2,'2026-02-11','2026-02-18',NULL,'borrowed',0);