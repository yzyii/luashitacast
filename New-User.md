# New User Guide

If you have never used LuAshitacast before, read the following, then go back to the [README](README.md) and continue following the instructions there.

## Syntax Highlighting

It is highly suggested that you utilize a decent text editor which supports Syntax Highlighting while editing or working with .lua files.

Here are the 2 most popular options:
- Visual Studio Code (preferred): https://code.visualstudio.com/
- Notepad++: https://notepad-plus-plus.org/

## Boolean Settings

Some settings within these profiles must be configured as part of setup.

The following is such a setting:
```lua
local load_stylist = true -- Set to true to just load stylist on game start.
```

Setting this to false would disable the described behaviour. e.g.
```lua
local load_stylist = false -- Set to true to just load stylist on game start.
```

## Sets

These LuAshitacast profiles consist of blocks indented to the same level that define a set of equipment items to be equipped.

e.g. The following defines a single "set" named "Idle".
```lua
    Idle = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'Arco de Velocidad',
        Ammo = 'displaced',
        Head = { Name = 'Dls. Chapeau +1', Priority = 30 },
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = { Name = 'Hierarch Belt', Priority = 10 },
        Legs = { Name = 'Blood Cuisses', Priority = 30 },
        Feet = 'Dst. Leggings +1',
    },
```

e.g. The following defines another single "set" named "blue_cotehardie_plus_one".
```lua
local blue_cotehardie_plus_one = {
    Body = 'Blue Cotehard. +1',
}
```

Ignore the fact that one set has local at the front. This is Lua syntax that you do not need to understand.

While setting up these profiles:
- Do NOT change the names of these sets.
- Do NOT create new sets (unless you know what you are doing in which case you would not be reading this anyway).

It is not necessary to create new sets as these profiles should already contain all functionality that is required to play the game.

It is highly recommended that you do not make changes or edits to these profiles unless you have very good reason to (you don't).

## Entering Items into Sets

In order to populate the contents of sets, you may type the items manually into them.

Note that item names MUST be exact as per the name of the item in your in-game inventory.

i.e. The following is correct.
```lua
        Body = 'Dst. Harness +1',
```

The following is incorrect.
```lua
        Body = 'Darksteel Harness +1',
```

Note that the line **ends** with a comma.

## Entering Items into Sets (cont.)

If you wish to populate sets directly from the game rather than typing them out manually, the following command can be used to add what is equipped on your character to a set.

```
/lac addset <setname>
```

If using this to populate your profiles, it is suggested that you delete the contents of the Idle set, and populate all other sets first before populating the Idle set.

Alternatively, use the "/lock" command or "/lac disable all" to prevent equipment swaps while you populate sets.

Sets with "local" prefixed in front of their name cannot be populated this way.

Populating sets this way will cause them to look slightly different from the examples given previously. This does not matter.

e.g.
```lua
    ['Idle'] = {
        Main = 'Terra\'s Staff',
        Sub = 'displaced',
        Range = 'Arco de Velocidad',
        etc...
    },
```

## Commenting Out

If you wish to not equip an item, either delete the entire line or "comment out" the line using two dashes i.e. "--". (https://en.wikipedia.org/wiki/Comment_(computer_programming))

e.g. If I have the following set named "Movement" and wish to remove the Blood Cuisses:
```lua
    Movement = {
        Head = 'Dls. Chapeau +1',
        Legs = 'Blood Cuisses',
    },
```

Either of the following two examples are correct:
```lua
    Movement = {
        Head = 'Dls. Chapeau +1',
    },
```
```lua
    Movement = {
        Head = 'Dls. Chapeau +1',
        -- Legs = 'Blood Cuisses',
    },
```

The following is incorrect:
```lua
    Movement = {
        Head = 'Dls. Chapeau +1',
        Legs = '',
    },
```

## Priority

Some items pre-filled out for you contain Syntax regarding "Priority". This dictates the equip order of items where items with a higher priority are equipped first. By default, all items have a priority of 0.

e.g. The Dls. Chapeau +1 in this example has a priority of 30 while the Jeweled Collar +1 has a priprity of 0. Since 30 > 0, the Chapeau will be equipped first.
```lua
        Head = { Name = 'Dls. Chapeau +1', Priority = 30 },
        Neck = 'Jeweled Collar +1',
```

This functionality is generally not required except for power users that know what they are doing and are attempting to optimize preserving HP and MP totals across equipment swaps.

If you are not a power user, you may ignore it as well as the rest of this file and return back to the original README.md

### Following is not accurate yet but will be at some point

The default Schema for equipment swaps that have been pre-filled out within these profiles is as follows:
- if it has +HP and +MP, priority +30
- if it has +HP, priority +20
- if it has +MP, priority +10
- if it has -HP or -MP, priority -5. 
- if the value of it's -HP/MP is lower than the value of it's +HP/MP, priority +3
- Special cases are +2 or -2. e.g. If a set had a -HP item equipped and the current set that would be swapped to after would remove that penalty, +2, or -2 for the opposite scenario.
