from microsoftgraph.client import Client
from microsoftgraph.credentials import DeviceCodeAuthProvider
import os

# Cấu hình client ID và client secret của ứng dụng trên Azure Active Directory
CLIENT_ID = '<YOUR_CLIENT_ID>'
CLIENT_SECRET = '<YOUR_CLIENT_SECRET>'

# Tạo đối tượng DeviceCodeAuthProvider để đăng nhập vào tài khoản OneDrive SharePoint của bạn
auth_provider = DeviceCodeAuthProvider(CLIENT_ID, scopes=['Sites.ReadWrite.All'])

# Tạo đối tượng Client để truy cập vào OneDrive SharePoint
client = Client(auth_provider=auth_provider)

# Thiết lập đường dẫn đến file cần copy
source_file_path = r'C:\Users\<YOUR_USERNAME>\Desktop\file.txt'

# Thiết lập đường dẫn đến thư mục trên OneDrive SharePoint mà bạn muốn copy file đến
# Ví dụ: /sites/<SITE_NAME>/<LIBRARY_NAME>/<FOLDER_NAME>
target_folder_path = '/sites/<SITE_NAME>/<LIBRARY_NAME>/<FOLDER_NAME>'

# Lấy tên file từ đường dẫn
filename = os.path.basename(source_file_path)

# Tạo đường dẫn đến file trên OneDrive SharePoint
target_file_path = target_folder_path + '/' + filename

# Đọc nội dung file cần copy
with open(source_file_path, 'rb') as f:
    file_contents = f.read()

# Upload file lên OneDrive SharePoint
client.sites[target_folder_path].drive.root.children[target_file_path].content.upload(file_contents)
