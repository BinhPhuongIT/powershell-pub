from flask import Flask, request, send_file
import os
import time

root_path = "C:/data/"

# Create folder if not exit
if not os.path.exists(root_path):
    os.makedirs(root_path)
    
app = Flask(__name__)

# Save image with hostname
@app.route('/upload', methods=['POST'])
def upload():
    hostname = request.form['hostname']
    date = request.form['date']
    client_folder = os.path.join(root_path, hostname, date)
    if not os.path.exists(client_folder):
        os.makedirs(client_folder)
    f = request.files['file']
    f.save(os.path.join(client_folder, f.filename))
    return 'Upload successful!', 200


# Truy cập ảnh theo đường dẫn /screenshot/hostname/filename
@app.route('/screenshot/<hostname>/<filename>')
def screenshot(hostname, date, filename):
    return send_file(os.path.join(hostname, date, filename), mimetype='image/jpeg')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
