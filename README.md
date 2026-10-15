| Name                 | NRP  |
|-------------------------|:-----:|
| Ahmad Farras Favian A        | 5025251005  |



# Student Management — Relational CRUD & User Management

A PHP (procedural MySQLi) + Bootstrap 5 web app for managing students, built for the Web Programming course (Session 6).

## Features
- One-to-many relationship: `majors` (1) → `students` (many) with a `FOREIGN KEY` (`ON DELETE RESTRICT`)
- Student dashboard using `JOIN`
- Create / edit / delete students, with the major dropdown loaded from the database
- Prepared statements (`mysqli_prepare`) against SQL injection
- Output escaping (`htmlspecialchars`) against XSS
- Login with `password_hash()` / `password_verify()` and `$_SESSION`
- Role-based access (admin / staff), enforced on the server side
- Admin-only user management page

## Roles
| Action                  | admin | staff |
|-------------------------|:-----:|:-----:|
| View dashboard          | Yes   | Yes   |
| Add / edit students     | Yes   | Yes   |
| Delete students         | Yes   | No    |
| Manage users            | Yes   | No    |

## Requirements
- XAMPP (PHP 8.1+, Apache, MySQL/MariaDB)

## Setup
1. Copy this folder to `C:\xampp\htdocs\student-app` (or your XAMPP `htdocs` path).
2. Start **Apache** and **MySQL** in the XAMPP Control Panel.
3. Open phpMyAdmin → **Import** → choose `database.sql` → Go.
4. Check the DB settings in `config.php` (defaults: host `localhost`, user `root`, empty password, database `db_school`).
5. Open `http://localhost/student-app/seed_admin.php` **once** to create the first admin, then **delete `seed_admin.php`**.
6. Open `http://localhost/student-app/` and log in.

Default admin (created by the seed script): `admin` / `admin123` — change it for any real use.

## Project structure
```
student-app/
├── config.php        # database connection
├── database.sql      # schema + sample data
├── seed_admin.php    # creates first admin (run once, then delete)
├── auth.php          # login guard + role helpers
├── navbar.php        # shared navbar
├── login.php
├── logout.php
├── users.php         # admin-only user management
├── index.php         # dashboard (JOIN)
├── create.php
├── edit.php
└── delete.php        # admin-only
```
