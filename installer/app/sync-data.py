import paramiko

# thông tin đăng nhập máy tính đích
host = "192.168.1.2"
port = 22
username = "username"
password = "password"

# tạo kết nối ssh đến máy tính đích
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(host, port, username, password)

# đồng bộ file từ máy tính hiện tại đến máy tính đích
local_path = "/path/to/local/file"
remote_path = "/path/to/remote/file"
sftp = ssh.open_sftp()
sftp.put(local_path, remote_path)
sftp.close()
