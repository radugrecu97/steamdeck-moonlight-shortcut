# steamdeck-moonlight-shortcut
A bash script to easily create Moonlight shortcuts based on the available game entries on the Host machine.

# Features
* Automatic SteamGridDB artwork (API key needed)
* Detect existing Steam shortcuts with the same name
* Moonlight FlatPak and AppImage support
* App exclusion suggestions for quicker reruns in the future

# To-do
* Improve speed because steamtinkerlaunch tries to update on every.single.execution...
* Default option for adding additional shortcuts or not when duplicate name is encountered
* Add to collection (not sure if there's an easy way at the moment)
* Add steamtinkerlaunch error handling 


# Instructions

Make sure you have a host added in your Moonlight client otherwise the script won't work.

Switch Steam Deck to desktop mode

Open a terminal (i.e. Konsole) and enter chosen directory(i.e. Documents):
    cd /home/deck/Documents/

Clone this repo:
    git clone https://github.com/radugrecu97/steamdeck-moonlight-shortcut.git
    cd steamdeck-moonlight-shortcut

Pull steamtinkerlaunch submodule:
    git submodule update --init --recursive

Add SteamGridDB key to steamtinkerlaunch
    ./steamtinkerlaunch/steamtinkerlaunch set SGDBAPIKEY global <replace_me_with_key>

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

# Troubleshooting and notes 

Steamtinkerlaunch will create many notifications, it's alright. They will also report errors if it fails to create a shortcut.