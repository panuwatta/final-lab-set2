# Final Lab Set 2 - ระบบจัดการงานแบบ Microservices

## 📋 ภาพรวมโครงการ

ระบบจัดการงาน (Task Management) แบบ Microservices ที่สมบูรณ์ พร้อมการติดตาม Activity สร้างด้วย Node.js, PostgreSQL และ deploy บน Railway

## 🏗️ สถาปัตยกรรมระบบ

### Services ต่างๆ
- **Auth Service**: การยืนยันตัวตนและจัดการ JWT token
- **Task Service**: การจัดการงาน CRUD พร้อมระบบอนุญาต
- **Activity Service**: การบันทึก activity ข้าม service และ timeline
- **Frontend**: เว็บแอปพลิเคชันแบบ static ด้วย Nginx

### ฐานข้อมูล
- **auth-db**: บัญชีผู้ใช้และ authentication logs
- **task-db**: งานต่างๆ และ task-related logs  
- **activity-db**: Activity timeline และ events

## 🚀 URLs ที่ Deploy แล้ว

### Production Services
- **Auth Service**: https://auth-service-production-a03d.up.railway.app
- **Task Service**: https://task-service-production-201e.up.railway.app
- **Activity Service**: https://activity-service-production-527d.up.railway.app
- **Frontend**: https://final-lab-set2-production-c9xx.up.railway.app

![Railway Deployment](screenshots/railway.png)

## 🔧 API Endpoints

### Auth Service (`/api/auth`)
- `POST /register` - สมัครสมาชิกใหม่
- `POST /login` - เข้าสู่ระบบ (คืนค่า JWT)
- `GET /verify` - ตรวจสอบ JWT token
- `GET /me` - ดูข้อมูลผู้ใช้ปัจจุบัน
- `GET /health` - ตรวจสอบสถานะ service

### Task Service (`/api/tasks`)
- `GET /` - ดูรายการงาน (ของตัวเองหรือทั้งหมดถ้าเป็น admin)
- `POST /` - สร้างงานใหม่
- `PUT /:id` - แก้ไขงาน
- `DELETE /:id` - ลบงาน
- `GET /health` - ตรวจสอบสถานะ service

### Activity Service (`/api/activity`)
- `GET /me` - ดู activities ของผู้ใช้
- `GET /all` - ดู activities ทั้งหมด (admin เท่านั้น)
- `POST /internal` - endpoint ภายในสำหรับ cross-service events
- `GET /health` - ตรวจสอบสถานะ service

## 🧪 การทดสอบระบบ

### ขั้นตอนการทดสอบแบบสมบูรณ์

![Testing Flow](screenshots/01.png)

```bash
# ตั้งค่า URLs
AUTH_URL="https://auth-service-production-a03d.up.railway.app"
TASK_URL="https://task-service-production-201e.up.railway.app"
ACTIVITY_URL="https://activity-service-production-527d.up.railway.app"

# สมัครสมาชิกใหม่
curl -X POST $AUTH_URL/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"username":"testuser","email":"test@example.com","password":"123456"}'

# เข้าสู่ระบบและรับ token
TOKEN=$(curl -s -X POST $AUTH_URL/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"123456"}' \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['token'])")

# สร้างงานใหม่
curl -X POST $TASK_URL/api/tasks \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"title":"งานทดสอบ","priority":"high"}'

# ดู activities
curl $ACTIVITY_URL/api/activity/me -H "Authorization: Bearer $TOKEN"
```

## 🔐 การยืนยันตัวตนและอนุญาต

- **การยืนยันตัวตนแบบ JWT** ข้ามทุก services
- **การควบคุมการเข้าถึงตามบทบาท** (member/admin)
- **JWT secret ที่ใช้ร่วมกัน** สำหรับการตรวจสอบ token
- **การบันทึก activity ข้าม service**

![Authentication Flow](screenshots/02.png)

## 📊 ระบบติดตาม Activity

ระบบจะติดตามเหตุการณ์เหล่านี้โดยอัตโนมัติ:
- การสมัครสมาชิกและเข้าสู่ระบบของผู้ใช้
- การสร้าง อัปเดต และลบงาน
- การเปลี่ยนสถานะพร้อมข้อมูลรายละเอียด
- การเชื่อมโยงเหตุการณ์ข้าม service

![Activity Tracking](screenshots/03.png)

## 🛠️ เทคโนโลยีที่ใช้

- **Backend**: Node.js, Express.js
- **ฐานข้อมูล**: PostgreSQL
- **การยืนยันตัวตน**: JWT (jsonwebtoken)
- **การเข้ารหัสรหัสผ่าน**: bcryptjs
- **Frontend**: Vanilla JavaScript, HTML, CSS
- **Web Server**: Nginx
- **การ Deploy**: Railway
- **Containerization**: Docker

## 📁 โครงสร้างโปรเจค

```
final-lab-set2/
├── auth-service/          # Authentication microservice
│   ├── src/
│   │   ├── routes/auth.js
│   │   ├── db/db.js
│   │   ├── middleware/jwtUtils.js
│   │   └── index.js
│   ├── Dockerfile
│   ├── package.json
│   └── init.sql
├── task-service/          # Task management microservice
│   ├── src/
│   │   ├── routes/tasks.js
│   │   ├── db/db.js
│   │   ├── middleware/
│   │   └── index.js
│   ├── Dockerfile
│   ├── package.json
│   └── init.sql
├── activity-service/      # Activity tracking microservice
│   ├── src/
│   │   └── index.js
│   ├── Dockerfile
│   ├── package.json
│   └── init.sql
├── frontend/              # Web application
│   ├── index.html
│   ├── activity.html
│   ├── logs.html
│   ├── config.js
│   └── Dockerfile
├── docker-compose.yml     # Local development
├── README.md
└── TEAM_SPLIT.md
```

## 🚀 การพัฒนาในเครื่อง

1. **Clone repository**
```bash
git clone <repository-url>
cd final-lab-set2
```

2. **ตั้งค่า environment variables**
```bash
cp .env.example .env
# แก้ไข .env ตามการตั้งค่าของคุณ
```

3. **เริ่ม services**
```bash
docker-compose up -d
```

4. **เข้าถึงแอปพลิเคชัน**
- Frontend: http://localhost:80
- Auth Service: http://localhost:3001
- Task Service: http://localhost:3002
- Activity Service: http://localhost:3003

![Local Development](screenshots/04.png)

## 🔧 Environment Variables

### จำเป็นสำหรับทุก services:
- `JWT_SECRET` - Secret ที่ใช้ร่วมกันสำหรับ JWT tokens
- `DATABASE_URL` - PostgreSQL connection string
- `NODE_ENV` - Environment (development/production)

### เฉพาะ Service:
- `ACTIVITY_SERVICE_URL` - URL สำหรับ activity service (auth & task services)
- `PORT` - Port ของ service (ค่าเริ่มต้น: auth:3001, task:3002, activity:3003)

## 📈 ฟีเจอร์ต่างๆ

### ✅ ที่ทำเสร็จแล้ว
- การสมัครสมาชิกและยืนยันตัวตน
- การอนุญาตแบบ JWT
- การจัดการงาน CRUD
- การควบคุมการเข้าถึงตามบทบาท
- การบันทึก activity ข้าม service
- Activity timeline แบบ real-time
- ส่วนติดต่อผู้ใช้แบบ responsive
- Docker containerization
- การ deploy บน cloud ด้วย Railway

![Features](screenshots/05.png)

### 🔄 Activity Events ที่ติดตาม
- `USER_REGISTERED` - การสมัครสมาชิกใหม่
- `USER_LOGIN` - การยืนยันตัวตนของผู้ใช้
- `TASK_CREATED` - การสร้างงานใหม่
- `TASK_STATUS_CHANGED` - การอัปเดตสถานะงาน
- `TASK_DELETED` - การลบงาน

![Activity Events](screenshots/06.png)

## 🏆 ข้อมูลทีม

ดูรายละเอียดการแบ่งงานและความรับผิดชอบของสมาชิกทีมใน [TEAM_SPLIT.md](TEAM_SPLIT.md)

## 📝 รายงานรายบุคคล

รายงานการมีส่วนร่วมรายบุคคลมีอยู่ใน:
- `INDIVIDUAL_REPORT_[studentid].md`

## 🐛 การแก้ไขปัญหา

### ปัญหาที่พบบ่อย:

![Troubleshooting](screenshots/07.png)

1. **ข้อผิดพลาด "Invalid token"**
   - ตรวจสอบให้แน่ใจว่า JWT_SECRET เหมือนกันในทุก services
   - ตรวจสอบการหมดอายุของ token (ค่าเริ่มต้น 1 ชั่วโมง)

2. **ข้อผิดพลาดการเชื่อมต่อฐานข้อมูล**
   - ตรวจสอบ DATABASE_URL environment variables
   - ตรวจสอบให้แน่ใจว่าฐานข้อมูลทำงานและเข้าถึงได้

3. **ปัญหา CORS**
   - Services ถูกตั้งค่าให้อนุญาตทุก origins
   - ตรวจสอบการเชื่อมต่อเครือข่ายระหว่าง services

4. **"Server error" ในการจัดการงาน**
   - ตรวจสอบให้แน่ใจว่าตาราง users มีอยู่ใน task-db
   - ตรวจสอบความสอดคล้องของข้อมูลผู้ใช้ระหว่างฐานข้อมูล

![Error Handling](screenshots/08.png)

## 📸 Screenshots ที่แนบมา

![Screenshot 1](screenshots/09.png)
*หน้าจอการเข้าสู่ระบบและสมัครสมาชิก*

![Screenshot 2](screenshots/10.png)
*Dashboard การจัดการงานและ Activity Timeline*

