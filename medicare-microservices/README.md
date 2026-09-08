# MediCare Microservices — Config Server

Hệ thống quản lý y tế MediCare sử dụng **Spring Cloud Config Server** để quản lý cấu hình tập trung cho 5 Microservice.

## 🏗️ Kiến trúc hệ thống

```
┌─────────────────────────────────────────────────────────┐
│                  Config Server (8888)                    │
│          Spring Cloud Config - Native Profile            │
│                                                         │
│  config-repo/                                           │
│  ├── patient-service.yml        (port 8081, DB patient) │
│  ├── doctor-service.yml         (port 8082, DB doctor)  │
│  ├── appointment-service.yml    (port 8083, DB appt)    │
│  ├── medical-record-service.yml (port 8084, DB medical) │
│  └── pharmacy-service.yml       (port 8085, DB pharmacy)│
└─────────────────────────────────────────────────────────┘
         ↑           ↑          ↑          ↑          ↑
         │           │          │          │          │
   Patient(8081) Doctor(8082) Appt(8083) MedRec(8084) Pharmacy(8085)
```

## 📁 Cấu trúc thư mục

```
medicare-microservices/
├── config-server/
│   └── src/main/resources/
│       ├── application.yml
│       └── config-repo/
│           ├── patient-service.yml
│           ├── doctor-service.yml
│           ├── appointment-service.yml
│           ├── medical-record-service.yml
│           └── pharmacy-service.yml
├── patient-service/
├── doctor-service/
├── appointment-service/
├── medical-record-service/
├── pharmacy-service/
├── build.gradle
└── settings.gradle
```

## 🚀 Thứ tự khởi động (QUAN TRỌNG)

> ⚠️ **Bắt buộc khởi động Config Server TRƯỚC**, sau đó mới chạy các Microservice.

### Bước 1 — Khởi động Config Server

```bash
cd medicare-microservices
./gradlew :config-server:bootRun
```

Đợi đến khi thấy log:
```
Started ConfigServerApplication in X.XXX seconds
```

### Bước 2 — Xác nhận Config Server hoạt động

Truy cập trên trình duyệt:
- http://localhost:8888/patient-service/default
- http://localhost:8888/doctor-service/default
- http://localhost:8888/appointment-service/default
- http://localhost:8888/medical-record-service/default
- http://localhost:8888/pharmacy-service/default

### Bước 3 — Khởi động các Microservice

Mở terminal riêng cho từng service:

```bash
# Terminal 2
./gradlew :patient-service:bootRun

# Terminal 3
./gradlew :doctor-service:bootRun

# Terminal 4
./gradlew :appointment-service:bootRun

# Terminal 5
./gradlew :medical-record-service:bootRun

# Terminal 6
./gradlew :pharmacy-service:bootRun
```

## 🗄️ Chuẩn bị Database MySQL

Chạy các script SQL để khởi tạo database:

```sql
-- Chạy từng file trong thư mục sql/ của mỗi service
source patient-service/sql/init.sql
source doctor-service/sql/init.sql
source appointment-service/sql/init.sql
source medical-record-service/sql/init.sql
source pharmacy-service/sql/init.sql
```

**Thông tin kết nối MySQL:**
- Host: `localhost:3306`
- Username: `root`
- Password: `root`

## 🔌 API Endpoints

### Patient Service (port 8081)
| Method | URL | Mô tả |
|--------|-----|--------|
| GET | `/api/patients` | Lấy danh sách bệnh nhân |
| GET | `/api/patients/{id}` | Lấy bệnh nhân theo ID |
| POST | `/api/patients` | Tạo bệnh nhân mới |
| PUT | `/api/patients/{id}` | Cập nhật bệnh nhân |
| DELETE | `/api/patients/{id}` | Xóa bệnh nhân |

### Doctor Service (port 8082)
| Method | URL | Mô tả |
|--------|-----|--------|
| GET | `/api/doctors` | Lấy danh sách bác sĩ |
| GET | `/api/doctors/{id}` | Lấy bác sĩ theo ID |
| GET | `/api/doctors/available` | Lấy bác sĩ đang rảnh |
| GET | `/api/doctors/specialization/{spec}` | Lọc theo chuyên khoa |
| POST | `/api/doctors` | Tạo bác sĩ mới |
| PUT | `/api/doctors/{id}` | Cập nhật bác sĩ |
| DELETE | `/api/doctors/{id}` | Xóa bác sĩ |

### Appointment Service (port 8083)
| Method | URL | Mô tả |
|--------|-----|--------|
| GET | `/api/appointments` | Lấy tất cả lịch hẹn |
| GET | `/api/appointments/{id}` | Lấy lịch hẹn theo ID |
| GET | `/api/appointments/patient/{patientId}` | Lịch hẹn của bệnh nhân |
| GET | `/api/appointments/doctor/{doctorId}` | Lịch hẹn của bác sĩ |
| POST | `/api/appointments` | Tạo lịch hẹn mới |
| PUT | `/api/appointments/{id}` | Cập nhật lịch hẹn |
| PATCH | `/api/appointments/{id}/cancel` | Hủy lịch hẹn |
| DELETE | `/api/appointments/{id}` | Xóa lịch hẹn |

### Medical Record Service (port 8084)
| Method | URL | Mô tả |
|--------|-----|--------|
| GET | `/api/medical-records` | Lấy tất cả hồ sơ |
| GET | `/api/medical-records/{id}` | Lấy hồ sơ theo ID |
| GET | `/api/medical-records/patient/{patientId}` | Hồ sơ của bệnh nhân |
| GET | `/api/medical-records/doctor/{doctorId}` | Hồ sơ của bác sĩ |
| POST | `/api/medical-records` | Tạo hồ sơ bệnh án |
| PUT | `/api/medical-records/{id}` | Cập nhật hồ sơ |
| DELETE | `/api/medical-records/{id}` | Xóa hồ sơ |

### Pharmacy Service (port 8085)
| Method | URL | Mô tả |
|--------|-----|--------|
| GET | `/api/medicines` | Lấy danh sách thuốc |
| GET | `/api/medicines/{id}` | Lấy thuốc theo ID |
| GET | `/api/medicines/active` | Thuốc đang hoạt động |
| GET | `/api/medicines/category/{category}` | Lọc theo danh mục |
| POST | `/api/medicines` | Thêm thuốc mới |
| PUT | `/api/medicines/{id}` | Cập nhật thuốc |
| DELETE | `/api/medicines/{id}` | Xóa thuốc |

## 🔍 Xác nhận Config Client hoạt động

Khi khởi động một Microservice, log sẽ hiển thị:
```
Fetching config from server at: http://localhost:8888
Located environment: name=patient-service, profiles=[default], label=null, ...
```

Đây là bằng chứng service đang lấy config từ Config Server.

## ⚙️ Yêu cầu hệ thống

- **Java**: 17+
- **MySQL**: 8.0+
- **Gradle**: 8.x (hoặc dùng Gradle Wrapper `./gradlew`)
- **Spring Boot**: 3.2.5
- **Spring Cloud**: 2023.0.1

## 🧩 Nguyên lý hoạt động

1. **Config Server** đọc file YAML từ `classpath:/config-repo/` (native profile)
2. Khi Microservice khởi động, nó đọc `spring.application.name` từ `application.yml` cục bộ
3. Microservice gọi API `GET http://localhost:8888/{application.name}/default`
4. Config Server trả về cấu hình tương ứng (datasource, port, logging, v.v.)
5. Microservice áp dụng cấu hình và tiếp tục khởi động với đầy đủ thông tin

## 📝 So sánh trước và sau khi dùng Config Server

| | Trước (application.yml cục bộ) | Sau (Config Server) |
|--|--|--|
| Thay đổi DB password | Sửa 5 file, build lại 5 service | Chỉ sửa 1 file trong config-repo |
| Quản lý cấu hình | Phân tán, khó kiểm soát | Tập trung, dễ quản lý |
| `application.yml` mỗi service | ~25 dòng config | ~4 dòng (chỉ tên + URL config server) |
