Output mojo.gif

# Set up a 1200x600 terminal with 24px font.
Set FontSize 24
Set Width 1200
Set Height 600

# Type a command in the terminal.
Type "echo Welcome to Mojo playground! 🔥"
Sleep 2s
Enter

Type "docker-compose build -q"
Sleep 1s
Enter
Sleep 1s

Type "docker-compose up -d"
Sleep 1s
Enter
Sleep 500ms

Type "docker-compose exec mojo bash"
Sleep 1s
Enter
Sleep 500ms

Type "mojo"
Sleep 1s
Enter
Sleep 500ms

Type 'print("Hello, world!")'
Sleep 2s
Enter
Sleep 200ms
Enter

# Admire the output for a bit.
Sleep 5s
