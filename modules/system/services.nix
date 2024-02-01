{ ... }:
{
    services = {
        openssh.enable = true;
        gvfs.enable = true;
        gnome.gnome-keyring.enable = true;
        dbus.enable = true;
    };
}