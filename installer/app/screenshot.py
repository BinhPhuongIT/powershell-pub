import os
import datetime
import time
from PIL import ImageGrab

# Get hostname
hostname = os.environ['COMPUTERNAME']

root_path = "C:/Windows/screenshots/"
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

    # Screenshot and save
    screenshot = ImageGrab.grab()
    screenshot.save(screenshot_filename)
    
    # sleep 5s
    time.sleep(5)
