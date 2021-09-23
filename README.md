# scss-folder-struct
This script creates scss folders / files following the BEM model

You can add the script to your package.json if you want to run it from there. This assumes you are putting the script in your root project folder.

"build:sass": "powershell -NoProfile -ExecutionPolicy Unrestricted -Command ./create_scss.ps1"

What does it do?

It prompts you to select a folder using the Windows FolderOpenDialog. Once you've selected a folder, it will check to see if your folder contains a sass folder. This is based on the direction of the Udemy course Advanced CSS and Sass: Flexbox, Grid, Animations and More.
