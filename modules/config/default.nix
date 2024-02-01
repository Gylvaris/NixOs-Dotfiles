{inputs, username, ...}: {
  imports =
       [(import ./gaming)]
    ++ [(import ./kitty)]
    ++ [(import ./packages)]
    ++ [(import ./hyprland)]
    ++ [(import ./git)]
    ++ [(import ./waybar)]
    ++ [(import ./micro)]
    ++ [(import ./gtk)]
    ++ [(import ./firefox)]
    ++ [(import ./btop)]
    ++ [(import ./bat)];
}