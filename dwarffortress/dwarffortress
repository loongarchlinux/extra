#!/bin/bash
DIRECTORY="${XDG_DATA_HOME:-$HOME/.local/share}/dwarffortress"

if [[ ! -d "$DIRECTORY" ]]; then
    echo "Setting up $DIRECTORY"
    mkdir "$DIRECTORY"
    ln -s /opt/dwarffortress/data "$DIRECTORY/data"
    # Setting LD_LIBRARY_PATH doesn't seem to work,
    # so we copy the shared objects
    ln -s /opt/dwarffortress/*.so* "$DIRECTORY/"
fi

cd "$DIRECTORY"
DF_DIR=/opt/dwarffortress
LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}${DF_DIR}" $DF_DIR/dwarfort "$@" # Go, go, go! :)
