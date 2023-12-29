# steamdeck-moonlight-shortcut
A bash script to easily create Steam shortcuts to your Moonlight applications based on the available entries on the Host machine.
The main target are non-Steam games -> Epic Games Store, GoG, emulated games

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

1. Make sure you have a host added in your Moonlight client otherwise the script won't work.

2. Switch Steam Deck to desktop mode

3. Open a terminal (i.e. Konsole) and enter chosen directory(i.e. Documents):

    `cd /home/deck/Documents/`

4. Clone this repo:

    `git clone https://github.com/radugrecu97/steamdeck-moonlight-shortcut.git
    cd steamdeck-moonlight-shortcut`

5. Open `create-shortcuts.sh` using nano or regular file editor through Dolphin(the file manager) and set your PC name as it appears in Moonlight client:

    `HOST_NAME="<REPLACE_ME>"`
    
7. By default, the script will use FlatPak Moonlight. If you're using the AppImage set

    `USING_FLATPAK=0`

   and set paths for:

   `MOONLIGHT_EXE="<REPLACE_ME>"
    MOONLIGHT_PATH="<REPLACE_ME>"`

8. Pull steamtinkerlaunch submodule:

    `git submodule update --init --recursive`

9. Add SteamGridDB key to steamtinkerlaunch

    `./steamtinkerlaunch/steamtinkerlaunch set SGDBAPIKEY global <replace_me_with_key>`

10. Make script executable:

    `chmod +x create-shortcuts.sh`

11. **!!! IMPORTANT !!!** Quit steam application, or the shortcuts won't be created

12. Run script:

   `./chmod create-shortcuts.sh`

11. Start steam to confirm that shortcuts are there. Then proceed playing, it will work in Gaming Mode of course

# Other info

Moonlight nightly AppImage (with HDR support at the time of writing)
https://github.com/FrogTheFrog/com.moonlight_stream.Moonlight


Further artwork customization can be done with the decky plugin since it's random.

# Troubleshooting and notes 

Steamtinkerlaunch will create many notifications, it's alright. They will also report errors if it fails to create a shortcut.
