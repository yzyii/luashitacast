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
- Do NOT create new sets. These profiles already contain all functionality that is required to play the game.
- Do NOT make changes or edits to these profiles at all outside of editing the contents of sets unless you have very good reason to (you probably don't).
- If functionality is missing, the correct thing to do is raise an issue as per the [README](README.md)

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

## Deleting Items / Commenting Out

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

## Example Gear

The luas have been filled out with BiS gear for CoP era.

The restrictions and assumptions made while doing so are as follows:

- For the purposes of HP and MP considerations, the player is assumed to be a Hume with 8/8 HP merits.
- No Divine Might earrings.
- CoP ring is assumed to be Sattva unless Rajas is required for Store TP requirements. Some jobs may still use Sattva even if a Store TP build exists.
- Apoc Nigh earring is be assumed to be Magnetic except for Ethereal on DRG.
- No Relic Weapons, Defending Ring, Ancient Adamantoise Egg, Ridill, though some Relic WS sets are filled out as an example.
- No HQ+1 Resistance Earrings / Rings
- Some NQ items instead of HQ where the HQ makes little to no difference e.g. Dalmatica.
- No RSE items.
- Generally, there is a preference for non-custom items. i.e. no Begrudging Rings, Dream Collars etc.
- No attention has been paid to calculating any actually useful Accuracy thresholds. HighAcc sets exist purely to demonstrate some options and [Composition](Composition.md).

While a fair amount of effort has been made to ensure this is accurate, reporting any discrepancies would be appreciated.

## Priority

Some items pre-filled out for you contain syntax regarding "Priority". This dictates the equip order of items where items with a higher priority are equipped first. By default, all items have a priority of 0.

e.g. The Dls. Chapeau +1 in this example has a priority of 70, the Hierarch Belt has a priority of 50, and the Jeweled Collar +1 has a priority of 0. The Dls. Chapeau is equipped first, the Hierarch Belt is equipped second, and the Jeweled Collar is equipped last.
```lua
        Head = { Name = 'Dls. Chapeau +1', Priority = 70 },
        Neck = 'Jeweled Collar +1',
        Waist = { Name = 'Hierarch Belt', Priority = 50 },
```

This functionality is generally not required except for power users that know what they are doing and are attempting to optimize preserving HP and MP totals across equipment swaps.

If you are not a power user, you may ignore it as well as the rest of this file and return back to the original [README](README.md).

The default Schema for equipment swaps that have been pre-filled out within these profiles is as follows:
- if it has +HP and +MP, priority = 70
- if it has +HP, priority = 60
- if it has +MP, priority = 50
- if it has +HP and -MP and the value of the HP is more than the MP, priority = 40
- if it has +MP and -HP and the value of the MP is more than the HP, priority = 30
- if it has Convert MP to HP, priority = 20
- if it has Convert HP to MP, priority = 10
- if it has -MP, priority = -10
- if it has -HP, priority = -20
- Special cases should be marked as priority = 1, 100 or -100. e.g. going from a -HP item in Precast to an item with no HP or MP at all.

Barely any special cases will have been identified for you. Reporting of any would be appreciated.
