# A few questions (CS50x Edition)

#### Video Demo:  https://youtu.be/lRetz1wq8xA

#### Game:  https://aireavix.itch.io/a-few-questions-remastered

#### Original game (Unmastered version):  https://aireavix.itch.io/afewquestions

#### Description: A short narrative video game about interrogating suspect in a murder

## CS50x Final project
This final project was born out a desire to remake and remaster a short video game i made earlier for a game jam, a competition in which one has to create a video based a around a theme in a limit set of time, usually less than 72 hours. The original game "a few questions" was made in 2021 for the Godot Wild jam #30 (2021) in just 7 days.

## Game Engine
This Remastered version of a few questions was created using the Godot Game engine, a free and open source game engine, version 3.5.1 stable.
All the systems were written in GDScript - a Python like language with Variable Typing.

## Whats new?
This remastered version Expands on the first by reworking all the core systems from the ground up using all the new knowledge i have gained through the CS50x Course. All systems were entirely rewritten to meet the high standards of CS50.

### Remastered Change log:
1. 3 new endings added!
2. Screen size increased to 720p
3. Completely redesigned file and evidence system
4. Improved interrogation system and heartrate monitor
5. improved font readability
6. Added Volume settings
7. Added background music
8. Added volume controls in interrogation scene
9. Added psychological assessments in interrogation

## Game Structure
the Godot uses a Tree / Node based system for organizing the Game files and Assets.
A collection of Nodes are organized in a hierarchical tree and can be saved together as scenes which can added to the tree as and where needed.

### Main Scene
The Highest Node in the Tree is the Main Scene; Which is the root node from which all other nodes are subjective to and handles the transition between the other key scenes in the game; The main menu scene, the Desktop Scene, the Interrogation scene and the Ending Scene.

### Globals
In addition to the variable and parameters stored in the Main Scene, Other Data regarding the Characters in the game (The Suspects) Are stored in a Additional Global Scene which is theoretically outside of the tree hierarchy as it can be accessed by any scene or node in the game via global call variable but technically sits aside the Main scene and is loaded at runtime. The setting for the game (Volume, Background music mute and typewriter speed) are also stored in a global script.

### Title Scene (Main Menu)
Handle the main interactions of main menu including starting the game, changing the game settings and viewing the credits

### Desktop Scene (aka Case Scene in project)
This is the primary game play scene where the player can view the files about each suspect and call them to be interrogated.

#### Files Scene
Each files on the suspect is a identical blank template on to which the details are imposed on top of. this allows this Scene to be reused by multiple assets  and allows for easy addition of more suspects and / or different cases. The system to click on to highlight a file and drag to move around functionality was coded entirely by myself as the Godot engine does not include this functionality built-in to the engine itself.

### Interrogation Scene
Like the File Scene, The interrogation scene is a single scene that can be loaded in to with various information (in this case, the details of the suspects) allowing a single scene to be reused with an infinite amount of suspects. No data is stored in the scene. once the interrogation is finished, relevant data is stored in the appropriate global variable and the scene is removed from the game as to not use needless memory. It can then be reloaded in with the next suspect.

### Ending Scene
A very Simple Scene that plays the ending according to which of the suspects you choose to charge with murder.


# Thanks
A big thank you is due to David J. Malan and Derek Yu plus everyone invloved in CS50x - it was a pleasure and a honour to have been able to do this amazing Course!



