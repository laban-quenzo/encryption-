CREATE DATABASE sms_encryptor;
USE sms_encryptor;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE,
  password VARCHAR(255) DEFAULT "",
  is_admin BOOLEAN DEFAULT false,
  is_active BOOLEAN DEFAULT false,
  last_active TIMESTAMP NULL,
  refresh_token TEXT NULL
);

CREATE TABLE messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sender_id INT NOT NULL,
  receiver_id INT,
  message TEXT,
  is_encrypted BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES users(id)
);

UPDATE users SET is_admin = true WHERE username = 'laban';

INSERT INTO users (username, password, is_admin, is_active) VALUES ('laban', '$2a$10$oe.mmD8qvmVB105rjIHY9Oqoa5UGCaQr2lRCY7K6b6g5K343K432S', true, true);

ALTER TABLE users ADD COLUMN refresh_token TEXT NULL;

