
- get some sort of meta currency from kills
	- track it on a ui somewhere, a bar along the top?
- have second ui button thing open a submenu to spend them
- have this spending permanently increase your attack/speed/health


- ~~have a resourcemanager~~
- ~~have a class called "resource" which has a stringname and an icon, and later other things like minimums and maximums and time limits etc~~
- ~~have a global list of "resources" which are just a stringname match~~
- ~~when you should get a resource anywhere in the game, signal "gain resource"~~
- manager hears
	- increment the resource internally, game logic wise
	- check if i have already made a resourcetracker for this resource
	- if not, instantiate a new one, to an @export ui location (specific for each resource, eg. @export var bones_tracker_control:Control)
	- now there is a tracker, and thus call tracker.ui_update(resource)