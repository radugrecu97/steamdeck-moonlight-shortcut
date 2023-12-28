#!/bin/bash

MOONLIGHT_PATH="/home/deck/Downloads/Moonlight.AppImage"
HOST_NAME="ALPACA"

# Strings to exclude from processing
EXCLUDE_APPS=("Desktop" "PlayNite FullScreen App" "Steam Big Picture")
CMD="$MOONLIGHT_PATH list $HOST_NAME"

function prompt_yes_or_no()
{
    local prompt="$1"

    while true; do
        read -p "$prompt (y/n): " answer
        answer_lowercase=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

        case "$answer_lowercase" in
            y)
                return 0  # Success, continue
                ;;
            n)
                return 1  # Failure, abort
                ;;
            *)
                echo "Invalid response. Please enter 'y' or 'n'."
                ;;
        esac
    done
}


function print_command_info()
{
    echo "Command \"$CMD\" output:"
    echo "$1" | while IFS= read -r line; do
        echo "    $line"
    done

    echo
    echo "Excluded applications:"
    # Loop through the array and echo each element on a new line
    for element in "${EXCLUDE_APPS[@]}"; do
        echo "    $element"
    done
}


function get_final_application_list()
{
    echo "$1" | while IFS= read -r line; do
        exclude_line=false
        for exclude_app in "${EXCLUDE_APPS[@]}"; do
            if [[ $(echo "$line" | tr '[:upper:]' '[:lower:]') == *$(echo "$exclude_app" | tr '[:upper:]' '[:lower:]')* ]]; then
                exclude_line=true
                break
            fi
        done

        # Skip processing if the line matches any excluded string
        if [ "$exclude_line" = true ]; then
            continue
        fi

        echo "$line"
    done
}


function get_moonlight_app_list()
{
    output="$($CMD)"

    # Check if the string contains "Failed to connect to"
    if [[ "$output" == *"Failed to connect to"* ]]; then
        echo "Make sure that your client device where you're running this script from (e.g. Steam Deck) can connect to the host normally through Moonlight"
        exit 1
    fi

    echo "$output"
}


function process_applications() {
    echo
    while IFS= read -r app <&3 || [[ -n "$app" ]]; do
        output=$(./steamtinkerlaunch/steamtinkerlaunch getexe "$app")
        last_line=$(echo "$output" | tail -n 1)

        if [[ $last_line == *"->"* && $last_line != *"No executable"* ]]; then
            echo
            echo "An existing shortcut with the name $app exists."
            echo "$last_line"
            prompt_yes_or_no "Do you want to create another shortcut with the same name?" || continue
        fi

        echo "Created Steam shortcut for $app"
    done 3<<< "$1"
}


app_list=$(get_moonlight_app_list)

echo
print_command_info "$app_list"

echo
list=$(get_final_application_list "$app_list")
echo "The script will create shortcuts for the following applications:"
echo "$list"

echo
echo "Verify the command output; it should be a list of applications."
echo "IF YOU PROCEED WHEN THE OUTPUT IS NOT A LIST,
IT WILL CREATE BAD SHORTCUTS THAT YOU'LL HAVE TO MANUALLY DELETE"

prompt_yes_or_no "Do you want to continue?" || exit 1

echo
echo "Processing application list"
process_applications "$list"
