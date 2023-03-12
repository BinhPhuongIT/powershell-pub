Để đóng gói một ứng dụng Python thành một ứng dụng chạy nền trên Windows, có nhiều công cụ khác nhau như PyInstaller, cx_Freeze, py2exe. Trong hướng dẫn này, chúng ta sẽ sử dụng PyInstaller để đóng gói ứng dụng.

Bước 1: Cài đặt PyInstaller

Sử dụng pip để cài đặt PyInstaller:

Copy code
pip install pyinstaller
Bước 2: Chuẩn bị tệp cấu hình

Tạo một tệp cấu hình cho PyInstaller bằng cách tạo một tệp văn bản và lưu trữ nó với phần mở rộng .spec. Ví dụ, nếu tên tệp của bạn là myapp.py, thì tệp cấu hình sẽ là myapp.spec.

Sử dụng lệnh sau để tạo tệp cấu hình cho tệp Python của bạn:

css
Copy code
pyinstaller --name=myapp --onefile myapp.py
Bước 3: Xây dựng ứng dụng

Sử dụng PyInstaller để xây dựng ứng dụng từ tệp cấu hình:

Copy code
pyinstaller myapp.spec
Sau khi xây dựng xong, các tệp được tạo ra sẽ nằm trong thư mục dist.

Bước 4: Kiểm tra ứng dụng

Chạy tệp thực thi của ứng dụng từ thư mục dist để kiểm tra xem ứng dụng đã hoạt động đúng chưa.

Lưu ý: Bạn có thể phải cài đặt các gói phụ thuộc của ứng dụng của mình trên máy tính mà bạn muốn chạy ứng dụng