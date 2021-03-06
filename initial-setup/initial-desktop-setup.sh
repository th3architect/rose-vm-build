#!/bin/bash
# Initial desktop setup
echo -e "\n\n*****************************"
echo -e "\n-Initial desktop setup"


HOME_DIR=$HOME
WORKSPACE_DIR="$HOME_DIR/workspace"
ROSE_SYS_DIR="$HOME_DIR/.rose"

ROSE_VM_DESKTOP_FILE_NAME_PREFIX="ROSE-v"


echo "HOME=$HOME"
echo "HOME_DIR=$HOME_DIR"
echo "WORKSPACE_DIR=$WORKSPACE_DIR"

cd "$ROSE_SYS_DIR"/rose-vm-build/initial-setup/ || { echo "Failure"; exit 1; }

cp Desktop/exo-terminal-emulator.desktop "$HOME_DIR/Desktop"
chmod 755 "$HOME_DIR/Desktop/exo-terminal-emulator.desktop"

sudo cp icons-images/xubuntu-focal-rose.png /usr/share/xfce4/backdrops/

cp xfce4-desktop.xml "$HOME_DIR/.config/xfce4/xfconf/xfce-perchannel-xml/"

cp Desktop/update.desktop "$HOME_DIR/Desktop"
chmod +x "$HOME_DIR/Desktop/update.desktop"

cp Desktop/check-status.desktop "$HOME_DIR/Desktop"
chmod +x "$HOME_DIR/Desktop/check-status.desktop"

cp Desktop/wireshark.desktop "$HOME_DIR/Desktop"
chmod +x "$HOME_DIR/Desktop/wireshark.desktop"

cd "$HOME_DIR" || { echo "Failure"; exit 1; }

ln -s "$WORKSPACE_DIR/rose-vm/vm-docs/ROSE-VM-README.txt" "$HOME_DIR/Desktop/README.txt"
find "$WORKSPACE_DIR/rose-vm/vm-docs/" -type f -name "$ROSE_VM_DESKTOP_FILE_NAME_PREFIX*" -exec cp {} "$HOME_DIR/Desktop/" \;

# TODO : go icon
#cp $WORKSPACE_DIR/Mantoo-scripts-and-readme/VM-Desktop/go-v2.desktop $HOME_DIR/Desktop/

# TODO (?) : stop icon
#cp $WORKSPACE_DIR/Mantoo-scripts-and-readme/VM-Desktop/stop-v2.desktop $HOME_DIR/Desktop/
