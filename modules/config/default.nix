{inputs, username, ...}: {
  imports =
       [(import ./gaming)]
    ++ [(import ./kitty)]
    ++ [(import ./packages)]
    ++ [(import ./hyprland)]
    ++ [(import ./git)]
    ++ [(import ./waybar)];
}