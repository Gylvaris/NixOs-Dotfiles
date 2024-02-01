{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "Gylvaris";
    userEmail = "bellaantoni21@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
    };
  };

  home.packages = [ pkgs.gh ];
}