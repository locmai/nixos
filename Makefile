HOME_SRC_DIR := ~/.config
HOME_DEST_DIR := home/locmai

DIRS := waybar hypr

default:
	@for dir in $(DIRS); do \
        	echo "Copying $$dir from $(HOME_SRC_DIR) to $(HOME_DEST_DIR)"; \
        	cp -r $(HOME_SRC_DIR)/$$dir $(HOME_DEST_DIR); \
    	done
	
	@echo "Copying /etc/nixos"
	@cp -r /etc/nixos/* nixos/
