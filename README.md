# steamdeck-moonlight-shortcut
A bash script to easily create Moonlight shortcuts based on the available game entries on the Host machine

# Instructions

Switch Steam Deck to desktop mode

Open a terminal (i.e. Konsole) and enter chosen directory(i.e. Documents):
    cd /home/deck/Documents/

Clone this repo:
    git clone https://github.com/radugrecu97/steamdeck-moonlight-shortcut.git
    cd steamdeck-moonlight-shortcut

Pull steamtinkerlaunch submodule:
    git submodule update --init --recursive

Make script executable:
    chmod +x create-shortcuts.sh

!!! IMPORTANT !!!
Quit steam application

Run script:
    ./chmod create-shortcuts.sh

Start steam to confirm that shortcuts are there. Then proceed playing, it will work in Gaming Mode of course

# Other info

Moonlight nightly AppImage (with HDR support at the time of writing)
https://github.com/FrogTheFrog/com.moonlight_stream.Moonlight


Further artwork customization can be done with the decky plugin since it's random.
