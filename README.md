# 📚 Library Management System (Java Web Project)

A full-featured Library Management System built using **Java Servlets**, **JSP**, and **MySQL**, designed to manage library operations such as user management, book inventory, borrowing, and returns. This is a **mini-project for learning and academic purposes**, following **MVC architecture**.

---

## 🚀 Features

### ✅ User Management
- Admin, Librarian, and Member Roles
- User Registration and Login with session management
- Role-based access to features

### ✅ Book Management
- Add, Edit, Delete Books (Admin & Librarian)
- Book details: Title, Author, Genre, ISBN, Year, Copies, Cover Image
- Search & Filter Books by Title, Author, Genre, Availability

### ✅ Borrow & Return System
- Members can borrow available books
- Due date tracking and fines for late returns
- Borrow history for each member
- Prevent deletion of books with borrow history

### ✅ Additional Functionalities
- Dashboard for each user type
- Image upload for book covers
- Fine calculation on late returns
- Fully styled UI with CSS animations for better UX

---

## 🛠️ Technologies Used
- **Backend:** Java (Servlets, JSP)
- **Frontend:** JSP, HTML, CSS, Bootstrap, Vanilla JS
- **Database:** MySQL
- **Tools:** Apache Tomcat, Eclipse IDE / IntelliJ, Maven

---

## ⚙️ Project Structure
/Library-Management-System
│
├── src/com/library/ # Java source files (Servlets, DAO, Models)
├── WebContent/ # Web resources (JSPs, CSS, Images)
│ ├── admin/ # Admin JSPs
│ ├── librarian/ # Librarian JSPs
│ ├── member/ # Member JSPs
│ ├── uploads/ # Book cover uploads
│ └── css/ # Custom CSS files
├── sql/library_db.sql # Database schema & sample data

## 🗃️ Database Setup

1. Install MySQL.
2. Create a database:

```sql
CREATE DATABASE library_db;
private static final String URL = "jdbc:mysql://localhost:3306/library_db";
private static final String USER = "your_db_username";
private static final String PASS = "your_db_password";
```
How to Run

   1 Clone the repository:
       git clone https://github.com/your-username/library-management-system.git
   2 Import the project into Eclipse / IntelliJ as Dynamic Web Project or Maven Project.
   3 Set up the Tomcat server in your IDE.
   4 Deploy the project to Tomcat.
   5 Access via browser:
       http://localhost:8080/Library-Management-System/


