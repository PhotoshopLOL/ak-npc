
<h1 align='center'>Akina NPC</h1>
<p align='center'>akina-npc is a FiveM resource that adds interactable NPCs to the world</p>


## Dependencies

* <a href='https://github.com/brentN5/bt-target'> bt-target </a>
* <a href='https://github.com/mkafrin/PolyZone'> PolyZone </a>

## Usage

```lua
exports['akina-npc']:BuildNPC(hash, coords, heading, events, jobs, drawDistance, animDict, anim)

```
this returns the ped handle so you could do:


```lua
local NPC = exports['akina-npc']:BuildNPC(hash, coords, heading, events, jobs, drawDistance, animDict, anim)

TaskPlayAnim(NPC, ......)
--and whatever you want to do with the ped

```
