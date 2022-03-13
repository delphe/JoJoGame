# JoJoGame
Orion's JoJo [Roblox](https://www.roblox.com/) Game.

Feel free to borrow any of the code you see here if you find it useful.

[Create your own game](https://www.roblox.com/develop) using Roblox Studio.

## Rojo
I'm using [Rojo](https://rojo.space/docs/) and [Visual Studio Code](https://code.visualstudio.com/) to edit scripts.

After creating scripts in Roblox Studio, I saved my Roblox place to a rbxlx file and used [rbxlx-to-rojo](https://github.com/rojo-rbx/rbxlx-to-rojo) to port the game files for Rojo.

**Note:** "Save to File as" is not an option if you are using the "Team Create" option for collaborative development of a game. Instead, use "Download a Copy." Some times that's also greyed out but there are [other work-arounds](https://devforum.roblox.com/t/save-as-tries-to-publish-the-game-instead-of-saving-it-as-a-file/1480675).

### Installation
I used the [install from GitHub](https://rojo.space/docs/installation/#from-github) option for the CLI (adding the exe to my path environment variables) and then installed the [Roblox plugin](https://www.roblox.com/library/4048317704/Rojo-6-0-0-Release-Candidate-1).

### Running Rojo
- Navigate to the folder where "default.project.json" resides (made using [rbxlx-to-rojo](https://github.com/rojo-rbx/rbxlx-to-rojo)) and execute `rojo server`
- Go to the Plugins tab of Roblox Studio, select Rojo and Connect.

Once connected to Rojo, you can edit the files in an IDE such as Visual Studio Code and the changes will automatically show up in Roblox Studio.
