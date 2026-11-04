# PowerPost Backend

Backend khởi tạo bằng Java 21, Spring Boot 3.5, Maven và MySQL. Các dependency ban đầu gồm REST, Spring Data JPA, Spring Security/OAuth2 Resource Server, validation và WebSocket.

## Chạy local

1. Cài JDK 21 và chạy MySQL, tạo database `powerpost` (hoặc cấu hình `DB_URL`).
2. Đặt thông tin kết nối nếu khác mặc định:

```powershell
$env:DB_URL = "jdbc:mysql://localhost:3306/powerpost"
$env:DB_USERNAME = "root"
$env:DB_PASSWORD = "your-password"
```

3. Từ thư mục `powerpost/backend`, chạy:

```powershell
.\mvnw.cmd spring-boot:run
```

Backend mặc định chạy tại `http://localhost:8080`.

## Cấu trúc package dự kiến

- `auth`, `user`, `friendship`, `presence`
- `conversation`, `message`
- `call`, `signaling`, `notification`
- `common` cho cấu hình, bảo mật, response và exception dùng chung
