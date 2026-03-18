# การแบ่งงานทีม - Final Lab Set 2

## ข้อมูลกลุ่ม
- **กลุ่มที่**: 14
- **รายวิชา**: ENGSE207 Software Architecture
- **โปรเจค**: Final Lab Set 2 - ระบบจัดการงานแบบ Microservices

## รายชื่อสมาชิก
- **67543210044-3** ภานุวัฒน์ ต๋าคำ
- **67543210050-0** เอกพันธ์ ทศทิศรังสรรค์

![Team Structure](screenshots/01.png)

## การแบ่งงานหลัก

### สมาชิกคนที่ 1: ภานุวัฒน์ ต๋าคำ (67543210044-3)
รับผิดชอบงานหลักดังต่อไปนี้:

#### การพัฒนา Backend Services
- **Auth Service**: ระบบยืนยันตัวตนและจัดการ JWT token
  - Endpoints สำหรับการสมัครสมาชิกและเข้าสู่ระบบ
  - การสร้างและตรวจสอบ JWT token
  - การเข้ารหัสรหัสผ่านด้วย bcryptjs
  - การรวม activity logging
- **Task Service**: ระบบจัดการงาน
  - การดำเนินการ CRUD สำหรับงาน
  - Authorization middleware
  - การควบคุมการเข้าถึงตามบทบาท
  - Cross-service activity events

![Backend Services](screenshots/02.png)

#### การออกแบบและจัดการฐานข้อมูล
- ออกแบบ database schema สำหรับทุก services
- สร้าง init.sql scripts สำหรับการเริ่มต้นฐานข้อมูล
- จัดการความสัมพันธ์และข้อจำกัดของฐานข้อมูล
- Database migration และความสอดคล้องของข้อมูล

#### ความปลอดภัยและการยืนยันตัวตน
- สถาปัตยกรรมการยืนยันตัตนแบบ JWT
- การอนุญาตตามบทบาท (member/admin)
- ความปลอดภัยของรหัสผ่านและการเข้ารหัส
- การรวมความปลอดภัยข้าม service

### สมาชิกคนที่ 2: เอกพันธ์ ทศทิศรังสรรค์ (67543210050-0)
รับผิดชอบงานหลักดังต่อไปนี้:

#### การพัฒนา Frontend
- **เว็บแอปพลิเคชัน**: Single Page Application ด้วย vanilla JavaScript
  - ส่วนติดต่อผู้ใช้สำหรับเข้าสู่ระบบ/สมัครสมาชิก
  - Dashboard การจัดการงาน
  - การแสดง activity timeline
  - การออกแบบแบบ responsive และ CSS ทันสมัย
- **การจัดการ Configuration**: การตั้งค่า frontend service
  - การตั้งค่า API endpoints
  - การตั้งค่าเฉพาะ environment

![Frontend Development](screenshots/03.png)

#### Activity Service และ Logging
- **Activity Service**: ระบบติดตาม activity แบบรวมศูนย์
  - การรวบรวมเหตุการณ์ข้าม service
  - Activity timeline API
  - การเข้าถึง activity ตามบทบาท
  - การบันทึก activity แบบ real-time
- **สถาปัตยกรรม Logging**: ออกแบบกลยุทธ์ logging
  - Local service logs
  - การติดตามเหตุการณ์ข้าม service
  - การเชื่อมโยงและ timeline ของ activity

#### การ Deploy และ DevOps
- **Railway Deployment**: การตั้งค่าการ deploy บน cloud
  - การ deploy และตั้งค่า service
  - การจัดการ environment variables และ secrets
  - การจัดเตรียมฐานข้อมูล
  - การจัดเส้นทาง URL และจัดการ domain
- **การตั้งค่า Docker**: การตั้งค่า containerization
  - การปรับปรุง Dockerfile
  - การจัดการ multi-service orchestration
  - การเตรียมการ deploy production

![Deployment](screenshots/04.png)

## งานที่ดำเนินการร่วมกัน

### การออกแบบสถาปัตยกรรมระบบ
- ออกแบบสถาปัตยกรรม microservices
- กำหนด service boundaries และ communication patterns
- ออกแบบ API contracts ระหว่าง services
- สถาปัตยกรรมฐานข้อมูลและการออกแบบ data flow

![System Architecture](screenshots/05.png)

### การรวมและทดสอบ
- การทดสอบระบบแบบ end-to-end
- การทดสอบการรวมข้าม service
- การทดสอบและตรวจสอบ API
- การทดสอบการ deploy production

### การจัดทำเอกสารและการจัดการโปรเจค
- README.md และเอกสารทางเทคนิค
- เอกสาร API และตัวอย่างการใช้งาน
- การจัดระเบียบโครงสร้างโปรเจค
- การ review โค้ดและการประกันคุณภาพ

### การแก้ปัญหาและ Debugging
- การ debug และแก้ไขปัญหาข้าม service
- ปัญหาการซิงค์ฐานข้อมูล
- การ debug authentication flow
- ปัญหาการ deploy production

![Problem Solving](screenshots/06.png)

## เหตุผลในการแบ่งงาน

การแบ่งงานตาม **service boundaries** และ **ความเชี่ยวชาญทางเทคนิค**:

### การแยก Backend กับ Frontend
- **ภานุวัฒน์**: มีความเชี่ยวชาญด้าน backend development, database design และความปลอดภัย
- **เอกพันธ์**: มีความถนัดด้าน frontend development, UI/UX design และการ deployment

### ทักษะที่เสริมกัน
- **Authentication & Security** (ภานุวัฒน์) + **User Interface** (เอกพันธ์) = ประสบการณ์ผู้ใช้ที่สมบูรณ์
- **Data Management** (ภานุวัฒน์) + **Activity Tracking** (เอกพันธ์) = ระบบ logging ที่ครอบคลุม
- **Core Services** (ภานุวัฒน์) + **Deployment** (เอกพันธ์) = ระบบที่พร้อมใช้งาน production

### ภาระงานที่สมดุล
- แต่ละคนรับผิดชอบ services ที่มีความซับซ้อนใกล้เคียงกัน
- งานที่ต้องประสานกันมีการกำหนดไว้ชัดเจน
- มีการ cross-review เพื่อประกันคุณภาพ

![Work Balance](screenshots/07.png)

## สรุปการเชื่อมโยงงานของสมาชิก

### จุดการรวม (Integration Points)
1. **Authentication Flow**: Auth Service (ภานุวัฒน์) ↔ Frontend (เอกพันธ์)
2. **Task Management**: Task Service (ภานุวัฒน์) ↔ Frontend (เอกพันธ์)
3. **Activity Tracking**: All Services (ภานุวัฒน์) → Activity Service (เอกพันธ์)
4. **Database Integration**: Database Design (ภานุวัฒน์) ↔ Deployment (เอกพันธ์)

![Integration Points](screenshots/08.png)

### การสื่อสารและการประสานงาน
- **Daily Standups**: ประสานงานความคืบหน้าและปัญหาที่พบ
- **API Contract Reviews**: ตรวจสอบ API interfaces ร่วมกัน
- **Integration Testing**: ทดสอบการเชื่อมต่อระหว่าง services
- **Code Reviews**: Review โค้ดของกันและกันเพื่อประกันคุณภาพ

### การจัดการ Dependency
- Frontend ต้องรอ API endpoints จาก backend services
- Activity Service ต้องรับ events จาก auth และ task services
- Deployment ต้องรอ services ทั้งหมดพร้อมใช้งาน
- Database schema ต้องสอดคล้องกับความต้องการของ service

### เกณฑ์ความสำเร็จ
- ✅ ทุก services ถูก deploy และทำงานได้บน Railway
- ✅ User flow ที่สมบูรณ์จากการสมัครสมาชิกถึงการจัดการงาน
- ✅ Cross-service activity tracking ทำงานได้ถูกต้อง
- ✅ Role-based authorization ทำงานได้ครบถ้วน
- ✅ ระบบพร้อมใช้งาน production พร้อมเอกสาร

![Success Metrics](screenshots/09.png)

## บทสรุป

การแบ่งงานของทีมเน้นการใช้ประโยชน์จากจุดแข็งของแต่ละคนในขณะที่รักษาความสมดุลของภาระงาน การประสานงานที่ดีและการสื่อสารที่ชัดเจนทำให้โปรเจคสำเร็จตามเป้าหมายที่วางไว้

![Team Success](screenshots/10.png)