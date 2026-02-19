CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    department_id INT REFERENCES departments(id)
);

CREATE TABLE devices (
    id SERIAL PRIMARY KEY,
    hostname VARCHAR(100) NOT NULL UNIQUE,
    mac_address VARCHAR(50) NOT NULL UNIQUE,
    os_version VARCHAR(100),
    last_patch_date DATE,
    risk_level VARCHAR(20) DEFAULT 'LOW',
    status VARCHAR(20) DEFAULT 'ACTIVE',
    user_id INT REFERENCES users(id)
);

CREATE TABLE ip_assignments (
    id SERIAL PRIMARY KEY,
    device_id INT REFERENCES devices(id) ON DELETE CASCADE,
    ip_address INET NOT NULL,
    vlan VARCHAR(50),
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE maintenance_logs (
    id SERIAL PRIMARY KEY,
    device_id INT REFERENCES devices(id) ON DELETE CASCADE,
    action TEXT,
    performed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);