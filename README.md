Lab Week 4 - Flutter Exercises

Bài tập thực hành tuần 4 môn Lập trình di động (Flutter), bao gồm các kiến thức về ListView, GridView, Shared Preferences, Asynchronous Programming và Isolates.

📂 Cấu trúc dự án

Dự án bao gồm các màn hình chức năng chính tương ứng với các bài tập:

- **lib/contacts_list.dart**: Bài tập 1 (List View)
- **lib/grid_view_screen.dart**: Bài tập 2 (Grid View)
- **lib/shared_prefs_screen.dart**: Bài tập 3 (Shared Preferences)
- **lib/async_screen.dart**: Bài tập 4 (Asynchronous)
- **lib/isolate_screen.dart**: Bài tập 5 (Isolates)
  
<img width="434" height="1002" alt="image" src="https://github.com/user-attachments/assets/2c60c197-b1f8-4304-8b8c-f73fb6c3b220" />

## 📝 Chi tiết bài tập

### 1. List View Exercise
Tạo một danh sách danh bạ có khả năng cuộn.
- **Yêu cầu:** Mỗi liên hệ bao gồm một hình ảnh đại diện (avatar placeholder).
- **Trạng thái:** ✅ Hoàn thành

<img width="424" height="994" alt="image" src="https://github.com/user-attachments/assets/e856add2-6af8-4bc7-8542-3357df6d98d3" />

### 2. Grid View Exercise
Màn hình hiển thị thư viện gồm 12 hình ảnh/icon sử dụng 2 loại GridView khác nhau.

#### Phần 1: GridView.count()
- **Title:** Fixed Column Grid
- **Cấu hình:** 3 cột, khoảng cách hàng/cột là 8, tỷ lệ khung hình 1.

#### Phần 2: GridView.extent()
- **Title:** Responsive Grid
- **Cấu hình:** Max cross-axis extent 150, khoảng cách hàng/cột là 10, tỷ lệ khung hình 0.8.

**Yêu cầu chung:**
- Container có màu và bo tròn góc.
- Icon/Ảnh canh giữa.
- Label text bên dưới mỗi item (ví dụ: "Item 1").

<img width="425" height="1004" alt="image" src="https://github.com/user-attachments/assets/cf453dfe-5c47-47e2-8760-268c39d14dc0" />

### 3. Shared Preferences Exercise
Ứng dụng lưu trữ dữ liệu cục bộ đơn giản.

- **Chức năng chính:**
  - Nhập tên vào TextField.
  - Nút **"Save Name"**: Lưu tên vào SharedPreferences.
  - Nút **"Show Name"**: Lấy và hiển thị tên đã lưu.
  - Xử lý trường hợp không có dữ liệu.
- **Tính năng nâng cao (Bonus):**
  - Nút **Clear** để xóa dữ liệu.
  - Lưu thêm các trường: Tuổi, Email.
  - Hiển thị thời gian lưu cuối cùng (Timestamp).
<img width="429" height="990" alt="image" src="https://github.com/user-attachments/assets/cfb609aa-37bb-4697-a949-238208e70244" />

### 4. Asynchronous Programming Exercise
Ứng dụng mô phỏng quy trình tải dữ liệu bất đồng bộ.
1. Hiển thị "Loading user...".
2. Chờ 3 giây (mô phỏng delay).
3. Cập nhật giao diện thành "User loaded successfully!".

<img width="432" height="1006" alt="image" src="https://github.com/user-attachments/assets/dc4cb56b-df3d-448a-900e-d2890d98f326" />

<img width="430" height="995" alt="image" src="https://github.com/user-attachments/assets/a7fa014f-0a57-4635-9b1f-d7ab24f9d4f1" />

### 5. Isolate Exercises
Xử lý các tác vụ nặng đa luồng để không chặn UI.

#### Challenge 1: Tính giai thừa (Factorial)
- Tính giai thừa của một số lớn (ví dụ: 30,000!).
- Sử dụng `compute` để chạy trong background isolate.
- Hiển thị Loading/Progress trên UI trong khi tính toán.
- Hiển thị kết quả khi hoàn tất.

#### Challenge 2: Background Isolate (Console Logic)
- Main isolate sinh ra một background isolate.
- Background isolate gửi số ngẫu nhiên mỗi giây.
- Main isolate nhận và cộng dồn.
- Khi tổng > 100, Main isolate gửi lệnh dừng và Worker isolate thoát bằng `Isolate.exit()`.

<img width="438" height="994" alt="image" src="https://github.com/user-attachments/assets/e0c84d58-37dd-4ccd-9908-ff7c0d6fba68" />

