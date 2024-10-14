#!/usr/bin/env bash

# Write a script to create the "Hello, World!" script, hw, in "$HOME/bpl/bin",
# make it executable, and then execute it

file="/$HOME/bpl/bin/hw"

[ -f "$file" ] || touch "$file"

[ -s "$file" ] || echo -e '#!/usr/bin/env bash \n\n printf "Hello, World!"' > "$file"

chmod u+x $file

$file

# ##################################################### -> GPT

mkdir -p "$(dirname "$file")" || { echo "Failed to create directory"; exit 1; }
echo -e '#!/usr/bin/env bash\n\nprintf "Hello, World!"' > "$file" || { echo "Failed to write to $file"; exit 1; }
chmod u+x "$file" || { echo "Failed to make $file executable"; exit 1; }
"$file"

# ##################################################### -> GPT


# Create the "Hello, World!" script in "$HOME/bpl/bin" and execute it
file="$HOME/bpl/bin/hw"

mkdir -p "$(dirname "$file")"
echo -e '#!/usr/bin/env bash\n\nprintf "Hello, World!"' > "$file"
chmod u+x "$file"

"$file"
