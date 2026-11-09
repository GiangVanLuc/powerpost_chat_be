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

## Cấu trúc package

Luồng xử lý chính: `controller -> service -> repository -> entity/database`. Các package còn lại hỗ trợ trao đổi dữ liệu, cấu hình và bảo mật.

- `controller`: nhận và trả HTTP request/response.
- `service`: khai báo service; `service.impl` chứa lớp `@Service` triển khai nghiệp vụ.
- `repository`: các Spring Data repository thông thường.
- `repository.custom`: repository fragment cho truy vấn tùy chỉnh; lớp triển khai dùng hậu tố `Impl`.
- `entity`: ánh xạ các bảng MySQL thành Java entity.
- `dto.request` / `dto.response`: dữ liệu API nhận vào và trả ra.
- `config`: cấu hình Spring, CORS và WebSocket.
- `security`: xác thực, phân quyền và xử lý JWT.
- `exception`: xử lý lỗi tập trung.
- `mapper`: chuyển đổi giữa Entity và DTO.
- `enums`: các trạng thái cố định của hệ thống.
- `util`: tiện ích dùng chung.

`service.impl` phù hợp khi tách interface và implementation. `repository.custom` chỉ cần dùng khi query method thông thường chưa đáp ứng yêu cầu; Spring Data ghép custom fragment interface với lớp triển khai có hậu tố `Impl`.
