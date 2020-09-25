# author: Ashish H. Shetty
# licanse: MIT

from infi.systray import SysTrayIcon
import os

hover_text = "Power Tray: power plan switcher"

def high_performance(sysTrayIcon):
    #sysTrayIcon.update(icon='./icons/tick.ico')
    cmd = 'powercfg -SETACTIVE 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c'
    res = os.system(cmd)
    display('./icons/high_performance.ico')

def balanced(sysTrayIcon):
    cmd = 'powercfg -SETACTIVE 381b4222-f694-41f0-9685-ff5bb260df2e'
    res = os.system(cmd)
    display('./icons/balanced.ico')

def power_saver(sysTrayIcon):
    cmd = 'powercfg -SETACTIVE a1841308-3541-4fab-bc81-f71556f20b4a'
    res = os.system(cmd)
    display('./icons/power_saver.ico')

menu_options = (
                ('High performance', "./icons/high_performance.ico", high_performance),
                ('Balanced', "./icons/balanced.ico", balanced),
                ('Power saver', "./icons/power_saver.ico", power_saver)
            )
sysTrayIcon = SysTrayIcon("./icons/main.ico", hover_text, menu_options, default_menu_index=2)
sysTrayIcon.start()

def display(icon):
    sysTrayIcon.update(icon=icon)
