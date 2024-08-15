{config, pkgs, ...}:
{
		environment.systemPackages = with pkgs; [
			openconnect_openssl
			networkmanager-openconnect
			globalprotect-openconnect
		];
}
