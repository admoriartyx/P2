alias file_remove='function _file_remove() {
    if [ -d "$1" ]; then
        echo "Removing all .bin files in directory: $1"
        find "$1" -maxdepth 1 -type f -name "*.bin" -exec rm -v {} \;
    else
        echo "Error: Directory $1 does not exist."
    fi
}; _file_remove'
