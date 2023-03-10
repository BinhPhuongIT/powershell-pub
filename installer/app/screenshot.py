import os
import datetime

now = datetime.datetime.now()
filename = now.strftime("%Y-%m-%d_%H-%M-%S.png")
from PIL import ImageGrab

# Get path
save_path = os.path.join(os.path.join(os.environ['USERPROFILE']), 'appdata\\screenshot')

# Create folder if not exit
if not os.path.exists(save_path):
    os.makedirs(save_path)

# Create path file
screenshot_filename = os.path.join(save_path, filename )

# Screenshot and save
screenshot = ImageGrab.grab()
screenshot.save(screenshot_filename)
