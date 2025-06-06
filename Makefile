HOME_SRC_DIR := ~/.config
HOME_DEST_DIR := home/locmai/.config

DIRS := waybar hypr gtk-3.0 gtk-4.0 rofi nvim dunst kitty yazi

default:
	sudo nixos-rebuild --flake './nixos/#x1carbon' switch

sync-local:
	cp -rf home/locmai/.config/* ~/.config/
	cp home/locmai/.zshrc ~/.zshrc
	cp home/locmai/.p10k.zsh ~/.p10k.zsh

sync-remote:
	@rm -rf $(HOME_DEST_DIR)
	@for dir in $(DIRS); do \
        	echo "Copying $$dir from $(HOME_SRC_DIR) to $(HOME_DEST_DIR)"; \
			  mkdir -p $(HOME_DEST_DIR)/$$dir; \
        	cp -r $(HOME_SRC_DIR)/$$dir $(HOME_DEST_DIR); \
    	done
	@echo "Copying zsh"	
	@cp ~/.zshrc home/locmai/.zshrc
	@cp ~/.p10k.zsh home/locmai/.p10k.zsh
	@cp ~/.sh_functions home/locmai/.sh_functions
	@cp ~/.gnupg/gpg-agent.conf home/locmai/.gnupg/gpg-agent.conf
	@mkdir -p home/locmai/.config/Cursor/User
	@cp ~/.config/Cursor/User/keybindings.json home/locmai/.config/Cursor/User/keybindings.json
	@cp ~/.config/Cursor/User/settings.json home/locmai/.config/Cursor/User/settings.json

update:
	nix flake update --flake ./nixos/

verify-nix-store:
	sudo nix-store --verify --check-contents --repair
