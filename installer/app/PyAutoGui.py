import pyautogui
import time

# Thư mục lưu trữ ảnh
folder_path = "C:/screenshots/"

# Vòng lặp vô hạn
while True:
        # Chụp màn hình và lưu vào thư mục
        screenshot_name = time.strftime("%Y-%m-%d %H-%M-%S") + ".png"
        screenshot_path = folder_path + screenshot_name
        pyautogui.screenshot(screenshot_path)

        # Chờ 5 giây trước khi chụp màn hình tiếp theo
        time.sleep(5)
