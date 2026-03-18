# รายงานรายบุคคล - เอกพันธ์ ทศทิศรังสรรค์

## ข้อมูลผู้จัดทำ
- **ชื่อ-นามสกุล**: เอกพันธ์ ทศทิศรังสรรค์
- **รหัสนักศึกษา**: 67543210050-0
- **กลุ่ม**: 14

![Individual Report](screenshots/01.png)

## ขอบเขตงานที่รับผิดชอบ

### Frontend Development
- **เว็บแอปพลิเคชัน**: Single Page Application ด้วย vanilla JavaScript
- **User Interface**: ส่วนติดต่อผู้ใช้สำหรับเข้าสู่ระบบ/สมัครสมาชิก
- **Task Dashboard**: การแสดงและจัดการงาน
- **Responsive Design**: ส่วนติดต่อที่เป็นมิตรกับมือถือ, การจัดแต่ง CSS ทันสมัย

### Activity Service & Logging
- **Activity Service**: ระบบติดตาม activity แบบรวมศูนย์
- **Activity Timeline**: การแสดง activity timeline และการโต้ตอบของผู้ใช้
- **Cross-service Events**: การรวบรวมเหตุการณ์ข้าม service
- **Logging Architecture**: ออกแบบกลยุทธ์ logging และ event tracking

### Infrastructure & Deployment
- **Railway Deployment**: การ deploy service บน cloud, การตั้งค่า environment
- **Docker Configuration**: การทำ containerization, การจัดการ multi-service orchestration
- **Environment Management**: การจัดการ environment variables และ secrets
- **URL Routing**: การจัดเส้นทาง URL และจัดการ domain

![Responsibilities](screenshots/02.png)

## สิ่งที่ได้ดำเนินการด้วยตนเอง

### การพัฒนา Frontend Application
- พัฒนา Single Page Application ด้วย vanilla JavaScript
- สร้างส่วนติดต่อผู้ใช้สำหรับการเข้าสู่ระบบและสมัครสมาชิก
- ออกแบบ task management dashboard
- จัดการการรวม API และการจัดการข้อผิดพลาด
- ใช้ responsive design สำหรับการใช้งานบนอุปกรณ์ต่างๆ

### การพัฒนา Activity Service
- สร้าง Activity Service สำหรับติดตาม activity แบบรวมศูนย์
- พัฒนา API endpoints สำหรับการบันทึกและดึงข้อมูล activity
- รับ activity events จาก auth และ task services
- สร้าง activity timeline API สำหรับการแสดงผล
- ใช้ role-based access control สำหรับการเข้าถึง activity

![Technical Implementation](screenshots/03.png)

### การจัดการ Deployment บน Railway
- ตั้งค่าการ deploy ทุก services บน Railway platform
- จัดการ environment variables และ database connections
- แก้ไขปัญหาการเชื่อมต่อระหว่าง services
- ตั้งค่า production URLs และ domain routing
- ทดสอบการ deploy และ production readiness

### การพัฒนา Docker Configuration
- ปรับปรุง Dockerfile สำหรับทุก services
- จัดการ multi-service orchestration
- ตั้งค่า container networking และ dependencies
- ปรับปรุง build process สำหรับ production deployment

![Infrastructure Implementation](screenshots/04.png)
## ปัญหาที่พบและวิธีการแก้ไข

### ปัญหาที่ 1: การตั้งค่าการ Deploy บน Railway
**ปัญหา**: Services deploy ไม่สำเร็จเพราะ environment variables และ dependencies

![Deployment Problem](screenshots/05.png)

**วิธีแก้ไข**:
- ศึกษากระบวนการ deploy ของ Railway platform
- จัดการ environment variables อย่างเป็นระบบ
- แก้ไข Dockerfile และ service dependencies
- ทดสอบการ deploy ทีละ service
- ตั้งค่า database connections และ service URLs

**สิ่งที่ได้เรียนรู้**: การ deploy บน cloud platform ต้องพิจารณา service dependencies และการจัดการ configuration อย่างรอบคอบ

### ปัญหาที่ 2: Cross-service Activity Tracking
**ปัญหา**: Activity events จาก services อื่นไม่ถูกส่งมาที่ Activity Service

![Activity Problem](screenshots/06.png)

**วิธีแก้ไข**:
- ออกแบบ event-driven architecture สำหรับ activity tracking
- สร้าง HTTP endpoints สำหรับรับ activity events
- ทดสอบการส่ง events จาก auth และ task services
- จัดการ error handling และ retry mechanisms
- ใช้ async processing สำหรับ activity logging

**สิ่งที่ได้เรียนรู้**: Event-driven architecture ต้องมีการออกแบบ communication patterns ที่ชัดเจนและ robust error handling

### ปัญหาที่ 3: Frontend API Integration
**ปัญหา**: CORS issues และ authentication flow ไม่ทำงานระหว่าง frontend และ backend services

![Frontend Problem](screenshots/07.png)

**วิธีแก้ไข**:
- ตั้งค่า CORS headers ใน backend services
- จัดการ JWT token storage และ transmission
- ใช้ proper error handling สำหรับ API calls
- ทดสอบ authentication flow แบบ end-to-end
- ปรับปรุง user experience สำหรับ error states

**สิ่งที่ได้เรียนรู้**: Frontend-backend integration ต้องพิจารณา security policies และ user experience อย่างครอบคลุม

## สิ่งที่ได้เรียนรู้จากงานนี้

### เชิงเทคนิค (Technical Learning)
- **Frontend Development**: การพัฒนา SPA ด้วย vanilla JavaScript และ modern CSS
- **API Integration**: การเชื่อมต่อ frontend กับ multiple backend services
- **Event-driven Architecture**: การออกแบบ activity tracking system
- **Cloud Deployment**: การ deploy microservices บน Railway platform
- **Docker & Containerization**: การจัดการ multi-service containers
- **Environment Management**: การจัดการ configuration ข้าม environments

![Technical Learning](screenshots/08.png)

### เชิงสถาปัตยกรรม (Architectural Learning)
- **Microservices Communication**: การสื่อสารระหว่าง services ผ่าน HTTP APIs
- **Activity Logging Patterns**: การออกแบบ centralized logging system
- **Frontend Architecture**: การจัดโครงสร้าง SPA สำหรับ microservices
- **Deployment Strategies**: การ deploy และ manage multiple services
- **Service Dependencies**: การจัดการ dependencies ระหว่าง services

### เชิงการทำงานร่วมกัน (Collaboration Learning)
- **API Contract Coordination**: การประสานงาน API interfaces กับทีม backend
- **Integration Testing**: การทดสอบการเชื่อมต่อระหว่าง frontend และ backend
- **Deployment Coordination**: การประสานงานการ deploy services ต่างๆ
- **Problem Solving**: การแก้ไขปัญหาข้าม technology stack
- **Documentation**: การจัดทำเอกสารสำหรับ deployment และ configuration

![Collaboration Learning](screenshots/09.png)

## แนวทางการพัฒนาต่อไปใน Set 2

### การปรับปรุง Frontend
- **Modern Framework**: อัปเกรดเป็น React หรือ Vue.js สำหรับ better state management
- **Real-time Updates**: เพิ่ม WebSocket สำหรับ real-time notifications
- **Progressive Web App**: เพิ่ม PWA features สำหรับ mobile experience
- **Performance Optimization**: เพิ่ม code splitting และ lazy loading

### การปรับปรุง Activity System
- **Real-time Activity Feed**: ใช้ WebSocket สำหรับ live activity updates
- **Activity Analytics**: เพิ่ม analytics และ reporting features
- **Event Sourcing**: ใช้ event sourcing pattern สำหรับ better data consistency
- **Activity Search**: เพิ่ม search และ filtering capabilities

### การปรับปรุง Infrastructure
- **CI/CD Pipeline**: เพิ่ม automated testing และ deployment pipeline
- **Monitoring & Observability**: เพิ่ม application monitoring และ health checks
- **Load Balancing**: เพิ่ม load balancer สำหรับ high availability
- **Container Orchestration**: ใช้ Kubernetes สำหรับ production deployment

### การปรับปรุง User Experience
- **Responsive Design**: ปรับปรุง mobile-first design
- **Accessibility**: เพิ่ม accessibility features สำหรับ inclusive design
- **Internationalization**: เพิ่ม multi-language support
- **Offline Support**: เพิ่ม offline capabilities ด้วย service workers

![Future Development](screenshots/10.png)

## บทสรุป

การทำงานใน Frontend Development และ Activity Service ของ Final Lab Set 2 ให้ประสบการณ์ที่หลากหลายตั้งแต่การพัฒนา user interface ไปจนถึงการจัดการ deployment บน cloud platform การแก้ไขปัญหาเรื่อง CORS, authentication flow และ cross-service communication เป็นความท้าทายที่สำคัญที่ทำให้เข้าใจ full-stack development ใน microservices architecture มากขึ้น ความรู้และประสบการณ์ที่ได้จะเป็นพื้นฐานสำคัญสำหรับการพัฒนาระบบที่ user-friendly และ scalable ในอนาคต