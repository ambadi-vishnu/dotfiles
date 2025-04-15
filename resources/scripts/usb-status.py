#!/usr/bin/env python

import pyudev
import subprocess
import json
import time

ICON_FILE = "/tmp/usb_icon.json"
MOUNT_BASE = "/media/usb"

context = pyudev.Context()
monitor = pyudev.Monitor.from_netlink(context)
monitor.filter_by(subsystem="block")

def get_mount_path(device):
    """Retrieve the mount path of the USB device."""
    time.sleep(0.5) 
    try:
        output = subprocess.check_output(["findmnt", "-n", "-o", "TARGET", device], text=True).strip()
        return output if output else None
    except subprocess.CalledProcessError:
        return None

def update_waybar(icon_data):
    """Write Waybar JSON output to a file."""
    with open(ICON_FILE, "w") as f:
        json.dump(icon_data, f)

def handle_device_event(device, action):
    """Handle USB events for Waybar."""
    if action == "add":
        mount_path = get_mount_path(device.device_node)
        device_node = device.device_node  # Capture device node
        command = f"udisksctl unmount -b {device_node}; udisksctl power-off -b {device_node}"
        update_waybar({
            "text": "\uf287", 
            "tooltip": f"USB: {mount_path}" if mount_path else "USB Connected",  # Show device name instead
            "class": "usb", 
            "onclick": f"dolphin {mount_path}" if mount_path else "dolphin", 
            "onclickright": command
        })
    elif action == "remove":
        update_waybar({})  # Clears the icon

# Monitor USB events
for device in iter(monitor.poll, None):
    if "ID_BUS" in device.properties and device.properties["ID_BUS"] == "usb":
        handle_device_event(device, device.action)
