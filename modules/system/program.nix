{ pkgs, ... }: 
{
    programs.mtr.enable = true;
    programs.seahorse.enable = true;
    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };
}