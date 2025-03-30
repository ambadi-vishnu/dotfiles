import gi
import os
import subprocess

gi.require_version("Gtk", "4.0")
from gi.repository import Gtk, Gio, Gdk, GdkPixbuf

class MyWindow(Gtk.Window):
    def __init__(self):
        super().__init__(title="Image Thumbnails")
        self.set_default_size(800, 600)
        self.connect("destroy", self.on_destroy)

        # Create a HeaderBar and set it as the titlebar
        header_bar = Gtk.HeaderBar.new()
        header_bar.set_title_widget(Gtk.Label(label="Select Wallpaper"))
        self.set_titlebar(header_bar)

        # Create a ScrolledWindow
        scrolled_window = Gtk.ScrolledWindow()
        self.set_child(scrolled_window)

        # Create a FlowBox and add it to the ScrolledWindow
        self.flowbox = Gtk.FlowBox()
        self.flowbox.set_valign(Gtk.Align.START)
        self.flowbox.set_max_children_per_line(5)
        self.flowbox.set_selection_mode(Gtk.SelectionMode.NONE)
        scrolled_window.set_child(self.flowbox)

        self.load_thumbnails("/home/vishnu/resources/backgrounds")

    def on_destroy(self, window):
        app = self.get_application()
        if app:
            app.quit()

    def load_thumbnails(self, folder_path):
        images = [f for f in os.listdir(folder_path) if f.endswith(('.jpg', '.jpeg', '.png'))]
        thumbnail_width = 250
        thumbnail_height = 140
        for image in images:
            image_path = os.path.join(folder_path, image)
            thumbnail = self.create_thumbnail(image_path, thumbnail_width, thumbnail_height)
            image_widget = Gtk.Picture.new_for_paintable(Gdk.Texture.new_for_pixbuf(thumbnail))
            image_widget.set_size_request(thumbnail_width, thumbnail_height)
            image_widget.set_margin_start(10)
            image_widget.set_margin_end(10)
            image_widget.set_margin_top(10)
            image_widget.set_margin_bottom(10)

            # Create a click gesture and connect it to the callback
            click_gesture = Gtk.GestureClick.new()
            click_gesture.connect("pressed", self.on_thumbnail_click, image)
            image_widget.add_controller(click_gesture)

            self.flowbox.insert(image_widget, -1)

    def on_thumbnail_click(self, gesture, n_press, x, y, image_name):
        imagename = image_name
        command1 = f'swww img "/home/vishnu/resources/backgrounds/{imagename}"'
        command2 = 'notify-send -t 3000 -i /home/vishnu/.config/swaync/icons/picture.png "Wallpaper Selected" "Updating Selected Wallpaper"'
        subprocess.run(command1, shell=True)
        subprocess.run(command2, shell=True)
        print(f"Image {imagename} clicked and commands executed.")

        # Close the application window
        self.close()

    def create_thumbnail(self, image_path, width, height):
        pixbuf = GdkPixbuf.Pixbuf.new_from_file(image_path)
        scaled_pixbuf = pixbuf.scale_simple(width, height, GdkPixbuf.InterpType.BILINEAR)

        # Create a new GdkPixbuf to serve as the thumbnail
        thumbnail = GdkPixbuf.Pixbuf.new(GdkPixbuf.Colorspace.RGB, True, 8, width, height)
        thumbnail.fill(0x00000000)

        # Calculate the offset to center the image in the thumbnail
        src_width = scaled_pixbuf.get_width()
        src_height = scaled_pixbuf.get_height()
        offset_x = (width - src_width) // 2
        offset_y = (height - src_height) // 2

        # Composite the scaled image onto the transparent thumbnail
        scaled_pixbuf.composite(thumbnail, offset_x, offset_y, src_width, src_height, offset_x, offset_y, 1.0, 1.0, GdkPixbuf.InterpType.BILINEAR, 255)
        return thumbnail

def main():
    app = Gtk.Application(application_id='com.example.GtkApplication')
    app.connect("activate", on_activate)
    app.run(None)

def on_activate(app):
    win = MyWindow()
    win.set_application(app)
    win.present()

if __name__ == "__main__":
    main()
