{ pkgs, ... }: 
{
  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.80";  
      window_padding_width = 10;
    };
  };
}