INSERT INTO departments (name) VALUES
('IT'), ('HR'), ('Finance');

INSERT INTO users (full_name, email, department_id) VALUES
('Max Mustermann', 'max@company.local', 1),
('Anna Schmidt', 'anna@company.local', 2);

INSERT INTO devices (hostname, mac_address, os_version, last_patch_date, user_id)
VALUES
('WS-IT-01', 'AA:BB:CC:DD:EE:01', 'Windows 10', '2025-12-01', 1),
('WS-HR-01', 'AA:BB:CC:DD:EE:02', 'Windows 10', '2025-09-01', 2);

INSERT INTO ip_assignments (device_id, ip_address, vlan)
VALUES
(1, '192.168.10.15', 'IT-VLAN'),
(2, '192.168.20.25', 'HR-VLAN');