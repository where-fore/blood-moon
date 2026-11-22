## combat options:
just he-is-coming, turn based barebones: hp & attack, triggers (wounded, first attack)
full ATB: like neverend, time then decision
slot ATB: oaken tower & ilk, each item has a cooldown & effect (can also just use this for 1 or 2 items, the big ones)

i kinda like slot ATB - choosing one defining weapon and then all sorts of trinkets to buff it. i really liked the choose-one-unique-item-at-the-start-of-the-game, and this is the same idea - choose a class essentially. one big particularly splashy item that you really feel, lots of little stat boost rings or something, and really impactful armors or necklaces or something

the turn based is of course totally fine and was fun, and works for he is coming, sorta.

i think i want to try the slot ATB


## assorted




blood moon brainstorm
"The sun has set, for the final time, on Nahuatl. The moon rises: The Blood Moon"

he is coming - like ui. main screen, with a horizontal and vertical side bar. vertical for your build, horizontal for information
come upon doors and choose your challenge (could move to a map at some point for sure)
dither fade to combat screen

gameplay loop is
quick combats
pick a power up: finding synergies, balancing scaling/stabalizing
choose a foe: find synergies (avoid counters), estimate scaling/stabalization
	notably this can be granualar, fork in the road each combat - or more about choosing paths filled with hard or easy enemies, then with quick combats
loop until checkpoint/yardstick boss
final boss is very hard and a goal to work towards
	what blocks you from getting lucky early? meta progression? knowledge checks? deep strategy? - look at ftl for that

should you have lives? if the game is estimating correctly, then a wrong move is death right? the tension is "do i risk it for biscuit? am i strong enough here?" and the strategy is "finding synergies with stats"

style:
largely 1 bit, dither fades for ui, purple and black with red accents
sparse colours for icons - stats and items, to make them pop and feel cool
largely pixel art with crt filter, but not strictly perfect pixel - some fx non-pixel and non-grid are totally fine, as are fonts.
	not sure the exact size, tiny rogues and he is coming look good, can use those as a base
	definitely fractional scaling


combat:
i kinda want to keep it non-real-time, more he is coming than tiny rogues
i do like the atb stuff, i could definitely enjoy that was a vector for different vibes and interactions
i do find he is coming a little shallow
i suppose i should start with what i have, and throw in the atb style later
what about the cooldown abilities? 5 room cooldowns? have to use before combat? preparation rituals? leans into the whole "estimate before venturing"


balance:
expect to get 1 power per combat
easy rooms give 0.8, hard rooms give 1.2 -> 50% more should feel good, and added up over time one will win
not sure on persistent resource/hp bar - the whole hp bar ala slay the spire seems cool, but removes a lot of options in combats/requires you to be able to defend
	some sort of hybrid "per fight stamina" & "overall health" where once stamina is depleted you take health damage?
	certain number of lives?
	lieutenant rules: rout when you lose, collecting no (or 0.2) resources, until final bosses who are lethal?
boss stretch - easy combats, hard combats, boss
difficult combats represent different challenges - burst damage (enemy enrages), burst survival (enemy starts enraged then exhausts), sustained damage (scaling enemy with lots of hp), sustained defence (long fight with constant damage), certain damage types (armors/resistances)
can spend resources to choose enemy - or sacrifice resources to reroll enemy, or something of the sort?



so my problem:
autobattler seems like too little meat. i like tiny rogues because you can see how you could possibly beat the final boss, but also see how impossible it is, and you can feel how the upgrades get you there. these largely-uninteractive autobattlers feel like playing against a balance spreadsheet, not a challenge to be overcome.
my initial conceit was: he is coming is almost good, but the reward structures are broken. the gameplay loop is solid, and there's enough meat, there just isn't enough meaningful choice.
i still think that's true, i don't really need a complicated system to be fun.
i don't think that's true, i need some amount of complication to have meaningful choices
so what's the minimum required complication? he is coming does it with just turns, hp/armor, damage, triggers, bosses with unique conceits
i don't enjoy the buildmaking in that game, but i think that's more to do with the reward structures than the meat of the combat. the buildmaking can be fun



idea: set bonuses that are standard, but also some that are randomly generated: "gear of saint viscount" which have no inherent synergy but provide a set bonus - can you make a build work with these random items, and you get rewarded for it. neat

could do the ol ttrpg thing, the endless combat is the dungeon and there's an overworld with some different structures. scope creep for sure but it is a cool concept
overworld you choose strategy (train a class/skill/combat style, choose what type of dungeon skeleton/beast/cultist, venture for legendary artifacts or humble consistent power) - the dungeon you choose tactics in the atb combat




okay so the tldr is i want something that is still enjoyable to work on, a clear goal to work towards
rehashing the same problems as before is not it
so what separates this from lieutenant
	- focused on my designs, not richards
		- meaning i can pivot whenever, work towards whatever i think is best
		- focused on things i can do, no waiting for the pipeline to flow
			- meaning i can tackle every single obstacle
	- not art focused, meaning i can do the gameplay and iterate on it since that's most of what there is
	
okay so why this autobattler combat thing instead of any of the other ideas, the alchemy city builder, oh heck, etc
	- there's a good skeleton in there, the item/aura/combatant system, which i understand and works well
	- i really like the original problem statement - can an autobattler be fun? i feel like starting with near-bare-minimum and seeing what needs to be added is a cool challenge
		- i would love if this game is good, that's a kind of game i love and want more of
	- it's got the most popular following at least, has had the best reviews of any of the other prototypes
		- it's also got by far the most screen time, so could definitely be a trick of the stats
	
okay these seem like good reasons. i believe in the vision and my capability to produce it, i've already got some of it made, and it's got popular approval. it excites me



so: the first big thing - make it playable
-strip out richard's art
-strip out the map system, back to infinite combat
	-this is the time cycle and everything too

so the question is do i make from scratch, or just rip out
starting from scratch:
	- there's a lot of code in those item/aura/combatant systems. i suppose i can just port them over? probably not that easy
	- get to easily use the new godot version, awesome
	- no richard's touch at all

rip out:
	- no need to redo any repos or discord bots or github pages or anything, it's just version 3.0
	- all the code is in place, just move the triggers
	- will end up with lots of vestigial stuff, probably
	- have to mess with lots of project settings

they seem about equally daunting it seems
it seems more idealisitic to start from scratch, would let me refocus the design only on what matters
might be some busy work distracting me from the real work

i've learnt a lot of programming principles, i want to utilize those and start from scratch again. new ui in 4.7, component stuff, the works

okay so what programming core am i going to work from
- godot best practices, static typing, the works from: https://docs.godotengine.org/en/stable/tutorials/best_practices/index.html
- readability: what's the objective, what are the obstacles, what do the stats do, how does the combat resolve. nice looking tooltips, icons, ui/ux work
- good elevator pitch (ideally with the web game)
- good feedback: button presses, level up flashes, combat animations
https://www.reddit.com/r/IndieDev/comments/1uzpb17/we_playtested_over_2000_indie_games_here_are_the/



so it sounds like fresh start is the way
