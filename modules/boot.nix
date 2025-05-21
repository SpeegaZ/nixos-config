{
    boot.loader = {
	grub = { 
	    enable = true;
	    efiSupport = true;
	    device = "nodev";
	    efiInstallAsRemovable = false;
	    useOSProber = true;
	};
	efi = {
	    efiSysMountPoint = "/boot/efi";
	    canTouchEfiVariables = true;
	};
}
