#!/bin/bash

# Function to separate files into odd and even directories
separate_files() {
    # Check if the target directory exists
    if [ ! -d "$1" ]; then
        echo "Error: Target directory $1 does not exist."
        exit 1
    fi

    # Define the target directory
    target_dir="$1"

    # Create the 'odd' and 'even' directories if they do not exist
    mkdir -p "$target_dir/odd"
    mkdir -p "$target_dir/even"

    # Loop through all files in the target directory
    for file in "$target_dir"/*; do
        # Extract the index number from the file name using regex
        if [[ "$file" =~ _index_([0-9]+)\.bin$ ]]; then
            index="${BASH_REMATCH[1]}"
            
            # Check if the index is odd or even
            if (( index % 2 == 0 )); then
                mv "$file" "$target_dir/even/"
                echo "Moved $file to $target_dir/even/"
            else
                mv "$file" "$target_dir/odd/"
                echo "Moved $file to $target_dir/odd/"
            fi
        fi
    done
}

# Call the function with the first argument
separate_files "$1"
