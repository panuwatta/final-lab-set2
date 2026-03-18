# รายงานรายบุคคล - ภานุวัฒน์ ต๋าคำ

## ข้อมูลผู้จัดทำ
- **ชื่อ-นามสกุล**: ภานุวัฒน์ ต๋าคำ
- **รหัสนักศึกษา**: 67543210044-3
- **กลุ่ม**: 14

![Individual Report](screenshots/01.png)

## ขอบเขตงานที่รับผิดชอบ

### Backend Services
- **Auth Service**: การยืนยันตัวตนของผู้ใช้, การจัดการ JWT token, ความปลอดภัยรหัสผ่าน
- **Task Service**: การดำเนินการ CRUD สำหรับงาน, authorization middleware, การควบคุมการเข้าถึงตามบทบาท

### Database Design & Management
- **Database Schema**: ออกแบบ schema สำหรับทุก services
- **Data Relationships**: จัดการความสัมพันธ์และข้อจำกัดของฐานข้อมูล
- **Migration Scripts**: สร้าง init.sql scripts สำหรับการเริ่มต้นฐานข้อมูล

### Security & Authentication
- **JWT Implementation**: สถาปัตยกรรมการยืนยันตัวตนแบบ JWT
- **Role-based Authorization**: การอนุญาตตามบทบาท (member/admin)
- **Password Security**: การเข้ารหัสรหัสผ่านด้วย bcryptjs
- **Cross-service Security**: การรวมความปลอดภัยข้าม service

![Responsibilities](screenshots/02.png)

## สิ่งที่ได้ดำเนินการด้วยตนเอง

### การพัฒนา Auth Service
- เขียน authentication routes สำหรับการสมัครสมาชิกและเข้าสู่ระบบ
- พัฒนา JWT middleware สำหรับการตรวจสอบ token
- ใช้ bcryptjs สำหรับการเข้ารหัสรหัสผ่าน
- รวม activity logging เข้ากับ authentication flow

### การพัฒนา Task Service
- สร้าง CRUD API endpoints สำหรับการจัดการงาน
- พัฒนา authorization middleware สำหรับการควบคุมการเข้าถึง
- ใช้ role-based access control (member/admin)
- ส่ง activity events ไปยัง Activity Service

![Technical Implementation](screenshots/03.png)

### การออกแบบฐานข้อมูล
- ออกแบบ database schema สำหรับ auth, task และ activity services
- สร้าง init.sql scripts สำหรับการเริ่มต้นฐานข้อมูล
- จัดการความสัมพันธ์ระหว่างตารางต่างๆ
- แก้ไขปัญหาการซิงค์ข้อมูลระหว่าง services

### การพัฒนา Security Architecture
- ออกแบบ JWT-based authentication flow
- สร้าง shared JWT secret สำหรับ cross-service authentication
- พัฒนา role-based authorization system
- ใช้ bcryptjs สำหรับการเข้ารหัสรหัsผ่าน

![Security Implementation](screenshots/04.png)
## ปัญหาที่พบและวิธีการแก้ไข

### ปัญหาที่ 1: การซิงค์ฐานข้อมูล
**ปัญหา**: Task service ไม่สามารถ JOIN กับตาราง users ได้เพราะแต่ละ service ใช้ฐานข้อมูลแยกกัน

![Database Problem](screenshots/05.png)

**วิธีแก้ไข**: 
- วิเคราะห์ trade-off ระหว่าง shared database กับ separate databases
- เลือกใช้ separate databases เพื่อความเป็นอิสระของ service
- สร้างตาราง users ในทุกฐานข้อมูลที่ต้องใช้
- ออกแบบกลยุทธ์การซิงค์ข้อมูล

**สิ่งที่ได้เรียนรู้**: การออกแบบฐานข้อมูลใน microservices ต้องพิจารณาความสอดคล้องของข้อมูลกับความเป็นอิสระของ service

### ปัญหาที่ 2: การยืนยันตัวตนข้าม Service
**ปัญหา**: JWT token ที่สร้างจาก auth-service ใช้ไม่ได้กับ services อื่น

![Authentication Problem](screenshots/06.png)

**วิธีแก้ไข**:
- ตรวจสอบ JWT_SECRET ให้เหมือนกันทุก service
- ออกแบบ shared authentication middleware
- ทดสอบการตรวจสอบ token ข้าม services
- จัดการการหมดอายุและการรีเฟรช token

**สิ่งที่ได้เรียนรู้**: Shared secrets และการจัดการ token เป็นสิ่งสำคัญใน distributed systems

### ปัญหาที่ 3: Role-based Authorization
**ปัญหา**: การควบคุมการเข้าถึงตามบทบาทไม่ทำงานอย่างถูกต้องข้าม services

![Authorization Problem](screenshots/07.png)

**วิธีแก้ไข**:
- ออกแบบ consistent role system ข้าม services
- สร้าง shared authorization middleware
- ทดสอบ permission checks ในแต่ละ endpoint
- จัดการ role inheritance และ permission mapping

**สิ่งที่ได้เรียนรู้**: Authorization ใน microservices ต้องมีความสอดคล้องและ centralized policy

## สิ่งที่ได้เรียนรู้จากงานนี้

### เชิงเทคนิค (Technical Learning)
- **JWT Authentication**: การใช้ JWT สำหรับ stateless authentication ใน microservices
- **Database Design**: การออกแบบ database schema สำหรับ distributed systems
- **API Security**: การใช้ middleware สำหรับ authentication และ authorization
- **Password Hashing**: การใช้ bcryptjs สำหรับการเข้ารหัสรหัสผ่านอย่างปลอดภัย
- **Cross-service Communication**: การสื่อสารระหว่าง services อย่างปลอดภัย
- **Error Handling**: การจัดการข้อผิดพลาดใน distributed systems

![Technical Learning](screenshots/08.png)

### เชิงสถาปัตยกรรม (Architectural Learning)
- **Microservices Patterns**: การแยก service boundaries อย่างเหมาะสม
- **Data Consistency**: การจัดการความสอดคล้องของข้อมูลใน distributed systems
- **Security Architecture**: การออกแบบความปลอดภัยข้าม services
- **Service Independence**: การรักษาความเป็นอิสระของแต่ละ service
- **Shared Resources**: การจัดการ shared secrets และ configuration

### เชิงการทำงานร่วมกัน (Collaboration Learning)
- **API Contract Design**: การออกแบบ API contracts ที่ชัดเจน
- **Code Review Process**: การ review โค้ดเพื่อประกันคุณภาพ
- **Integration Testing**: การทดสอบการเชื่อมต่อระหว่าง services
- **Documentation**: การจัดทำเอกสารทางเทคนิคที่ครอบคลุม
- **Problem Solving**: การแก้ไขปัญหาร่วมกันในทีม

![Collaboration Learning](screenshots/09.png)

## แนวทางการพัฒนาต่อไปใน Set 2

### การปรับปรุง Authentication
- **OAuth2/OIDC**: อัปเกรดเป็น standard authentication protocols
- **Multi-factor Authentication**: เพิ่ม MFA สำหรับความปลอดภัยเพิ่มเติม
- **Session Management**: เพิ่มการจัดการ session และ token refresh
- **Audit Logging**: เพิ่ม detailed audit logs สำหรับ authentication events

### การปรับปรุง Database Architecture
- **Event Sourcing**: ใช้ event sourcing สำหรับ data consistency
- **CQRS Pattern**: แยก read และ write operations
- **Data Replication**: เพิ่ม data replication สำหรับ high availability
- **Database Sharding**: เพิ่ม sharding สำหรับ scalability

### การปรับปรุงความปลอดภัย
- **API Rate Limiting**: เพิ่ม rate limiting และ DDoS protection
- **Encryption**: เพิ่ม data encryption at rest และ in transit
- **Certificate Management**: ใช้ proper certificate management
- **Security Monitoring**: เพิ่ม security monitoring และ alerting

![Future Development](screenshots/10.png)

## บทสรุป

การทำงานใน Backend Services ของ Final Lab Set 2 ให้ประสบการณ์ที่มีค่าในการพัฒนา authentication และ authorization systems ใน microservices architecture การแก้ไขปัญหาเรื่องการซิงค์ฐานข้อมูลและ cross-service authentication เป็นความท้าทายที่สำคัญที่ทำให้เข้าใจ distributed systems มากขึ้น ความรู้ที่ได้จะเป็นพื้นฐานสำคัญสำหรับการพัฒนาระบบที่มีความปลอดภัยและ scalable ในอนาคต