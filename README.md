Tig-Save-all-components
=======================

This saves all components - including nested ones - into a folder in the Model's folder.
Components that are entirely nested are put into folders with the parent's name.
Unacceptable characters are gsub'd as _0, if this makes duplicate names they are next'd as ..._1 etc
The code needs to go into a .rb that loads from Plugins.
It runs by TIG.save_all_components in the Ruby Console but of course you can easily add a menu/toolbar...

http://sketchucation.com/forums/viewtopic.php?f=15&t=58236&sid=37f35121d438b5e389a3bf268463a5ff&p=530283#p530283
