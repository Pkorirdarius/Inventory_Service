# INVENTORY_SERVICE

> **Empowering Seamless Inventory, Accelerating Business Growth**

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python&logoColor=white)
![Flask](https://img.shields.io/badge/Flask-Web%20Framework-green?logo=flask&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-Database-orange?logo=mysql&logoColor=white)

A lightweight, containerized Flask REST API service for inventory management, designed to streamline and automate inventory processes for businesses of all sizes.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Docker Deployment](#docker-deployment)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

**INVENTORY_SERVICE** is a REST API service built with Flask that provides core inventory management functionality. It enables organizations to track stock levels, manage product information, and optimize inventory workflows through a simple and efficient API interface.

## ✨ Features

- **Product Management**: Add and retrieve product information
- **Stock Tracking**: Monitor inventory levels in real-time
- **RESTful API**: Clean and intuitive API endpoints
- **Containerized**: Docker support for easy deployment
- **Database Integration**: MySQL database for persistent storage
- **Lightweight**: Minimal overhead with Flask framework

## 🛠 Tech Stack

- **Backend**: Python 3.10, Flask
- **Database**: MySQL
- **Containerization**: Docker
- **Environment**: Python 3.10 Slim (Debian Bullseye)

## 📋 Prerequisites

Before running this application, ensure you have the following installed:

- **Python 3.8+** - [Download Python](https://www.python.org/downloads/)
- **Docker** - [Install Docker](https://docs.docker.com/get-docker/)
- **MySQL** - [Install MySQL](https://dev.mysql.com/downloads/) (if running locally)
- **Git** - [Install Git](https://git-scm.com/downloads)

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd INVENTORY_SERVICE
```

### 2. Set Up Python Environment

```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

### 3. Database Setup

Create a MySQL database and table:

```sql
CREATE DATABASE inventory_db;
USE inventory_db;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    stock INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## ⚙️ Configuration

### Database Configuration

Update the database configuration in `app.py`:

```python
db_config = {
    'user': 'your_username',
    'password': 'your_password',
    'host': 'your_host',  # 'localhost' for local development
    'database': 'inventory_db'
}
```

### Environment Variables (Recommended)

For production, use environment variables:

```bash
export DB_USER=your_username
export DB_PASSWORD=your_password
export DB_HOST=your_host
export DB_NAME=inventory_db
```

## 🎯 Usage

### Running Locally

```bash
# Activate virtual environment
source venv/bin/activate  # or venv\Scripts\activate on Windows

# Run the application
python app.py
```

The application will be available at `http://localhost:5002`

### Running with Flask CLI

```bash
export FLASK_APP=app.py
export FLASK_ENV=development  # Optional: enables debug mode
flask run --host=0.0.0.0 --port=5002
```

## 🔌 API Endpoints

### Get All Products

```http
GET /products
```

**Response:**
```json
[
    {
        "id": 1,
        "name": "Sample Product",
        "stock": 100,
        "price": 29.99,
        "created_at": "2024-01-01 12:00:00"
    }
]
```

### Add New Product

```http
POST /products
Content-Type: application/json
```

**Request Body:**
```json
{
    "name": "New Product",
    "stock": 50,
    "price": 19.99
}
```

**Response:**
```json
{
    "message": "Product added"
}
```

### Example Usage with cURL

```bash
# Get all products
curl -X GET http://localhost:5002/products

# Add a new product
curl -X POST http://localhost:5002/products \
  -H "Content-Type: application/json" \
  -d '{"name": "Laptop", "stock": 10, "price": 999.99}'
```

## 🐳 Docker Deployment

### Build and Run with Docker

```bash
# Build the Docker image
docker build -t inventory-service .

# Run the container
docker run -p 5000:5000 --name inventory-app inventory-service
```

### Docker Compose (Recommended)

Create a `docker-compose.yml` file:

```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "5000:5000"
    environment:
      - FLASK_ENV=production
    depends_on:
      - db
  
  db:
    image: mysql:8.0
    environment:
      MYSQL_ROOT_PASSWORD: rootpassword
      MYSQL_DATABASE: inventory_db
    ports:
      - "3306:3306"
    volumes:
      - mysql_data:/var/lib/mysql

volumes:
  mysql_data:
```

Run with:
```bash
docker-compose up -d
```

## 📁 Project Structure

```
INVENTORY_SERVICE/
├── app.py                 # Main Flask application
├── Dockerfile            # Docker configuration
├── requirements.txt      # Python dependencies
├── package-lock.json     # Node.js lock file (if applicable)
├── README.md            # Project documentation
└── .gitignore           # Git ignore rules (recommended)
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 Development Notes

- The application runs on port 5002 by default (configurable)
- Debug mode is enabled for development
- Database credentials should be externalized for production use
- Consider adding input validation and error handling for production deployment

## 🔒 Security Considerations

- **Database Credentials**: Use environment variables instead of hardcoded passwords
- **Input Validation**: Add proper input validation for API endpoints
- **SQL Injection**: The current implementation uses parameterized queries to prevent SQL injection
- **CORS**: Consider adding CORS headers if accessed from web applications

## 📊 Future Enhancements

- [ ] Add authentication and authorization
- [ ] Implement product update and delete endpoints
- [ ] Add inventory alerts and notifications
- [ ] Include data validation and error handling
- [ ] Add unit tests and integration tests
- [ ] Implement logging and monitoring
- [ ] Add API documentation with Swagger/OpenAPI

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Built with ❤️ for efficient inventory management**
