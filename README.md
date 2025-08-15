# Oddscast

โปรเจกต์ **Oddscast** เป็นเว็บแอปพลิเคชันที่พัฒนาด้วย **Ruby on Rails**  

## ฟีเจอร์หลัก
- ระบบจัดการบทความ (Article Management)
- ระบบผู้ใช้ (User Management)
- ระบบผู้ดูแล (Admin Management)
- รองรับการรันเทสต์ด้วย RSpec

## การติดตั้ง

### 1. Clone โปรเจกต์
```bash
git clone https://github.com/Kwanpeemai/oddscast.git

cd oddscast

code .
```

### 2. ติดตั้ง dependencies
```bash
bundle install
```

### 3. สร้างฐานข้อมูลและรัน migrations
```bash
rails db:migrate
```

### 4. สร้าง Admin User
```bash
rails c
```

#### จากนั้นรันคำสั่งใน console:

```bash
User.create!(
  email_address: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  admin: true
)
```

### 5. รันโปรเจกต์
```bash
bin/dev
```

## การรันเทสต์
```bash
bundle exec rspec spec
```
