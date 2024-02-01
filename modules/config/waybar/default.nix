{...}: let
custom = {
    font = "JetBrainsMono Nerd Font";
    fontSize = "12";
    opacity = "0.9";
};
in {
  _module.args = {inherit custom;};
  imports =
       [(import ./waybar.nix)];
}