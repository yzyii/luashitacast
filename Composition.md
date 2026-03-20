# Set Composition

Sets within this collection of LuAshitacast profiles are typically grouped logically and equipped TOP DOWN by category.

This results in a user being able to specify shared items across multiple sets without having to repeat themselves but also allows a reduced number of sets to be specified through logical composition when multiple options are combined.

e.g. On THF, Accuracy Mode (Low/High)\[2], Sneak Attack (On/Off)\[2], Trick Attack (On/Off)\[2], and specific Weapon Skill (Dancing Edge, Evisceration, Shark Bite, Mercy Stroke)\[4] could potentially result in 2 x 2 x 2 x 4 = 32 different weapon skill sets for every single permutation.

This lua condenses these options for this particular scenario (as well as covering other generic weapon skills) down into ~11 sets that cover all real endgame scenarios in 75-cap endgame.

While not all examples are this extreme, an understanding of how this works is required to fully configure these profiles correctly.

## Example 1

If you cast Paralyze:

The general Enfeebling set is equipped first, and given Paralyze uses MND as a modifier, the EnfeeblingMND set is then equipped on top of it.

If the Magic Accuracy mode is being used, then the EnfeeblingACC set is then equipped over the top of all of this.

i.e. Given the following example sets:
```lua
    Enfeebling = {
        Body = 'Mahatma Hpl.',
        Legs = 'Mahatma Slops',
    },
    EnfeeblingMND = {
        Neck = 'Faith Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
    },
    EnfeeblingACC = {
        Neck = 'Enfeebling Torque',
        Legs = 'Nashira Seraweels',
    },
```

The final composition of all these sets would result in the following set being equipped when casting Paralyze with the Magic Accuracy mode being used:
```lua
    Final_Set = {
        Body = 'Mahatma Hpl.',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Legs = 'Nashira Seraweels',
    },
```

Note how the Neck and Legs from EnfeeblingACC set overwrite the Neck from the EnfeeblingMND set and the Legs from the Enfeebling set.

## Example 2

While TP-ing on a potentially dual wielding Job while /NIN. e.g. RDM, WAR, THF:

```lua
    TP_LowAcc = {
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Waist = 'Sonic Belt',
    },
    TP_HighAcc = {
        Ear1 = 'Hollow Earring',
        Waist = 'Life Belt',
    },
    TP_NIN = {
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
    },
```

The final composition of all these sets would result in the following set being equipped when /NIN and if the HighAcc tp mode is being used:
```lua
    Final_Set = {
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
        Waist = 'Life Belt',
    },
```

Note how the Waist from the TP_HighAcc set overwrites the Waist from the TP_LowAcc set.

Note how the Ear2 from the TP_NIN set overwrites the Ear2 from TP_LowAcc set.

Finally, also note how the Ear1 on the TP_NIN set overwrites the Ear1 from the TP_HighAcc set.

This is undesirable if the goal was to equip accuracy alongside the Stealth Earring.

## Example 2 (Fixed)
The following sets fix the issue pointed out previously:
```lua
    TP_LowAcc = {
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Waist = 'Sonic Belt',
    },
    TP_HighAcc = {
        Ear1 = 'Hollow Earring', -- Let's ignore that this is conditional and assume it always gives 3 ACC.
        Waist = 'Life Belt',
    },
    TP_NIN = {
        Ear2 = 'Stealth Earring',
    },
```

The final composition of all these sets would result in the following set being equipped when /NIN and if the HighAcc tp mode is being used:
```lua
    Final_Set = {
        Ear1 = 'Hollow Earring',
        Ear2 = 'Stealth Earring',
        Waist = 'Life Belt',
    },
```

Note how if HighACC tp mode were turned off, the final composition would still instead result in the following desired set for LowAcc tp mode when /NIN:
```lua
    Final_Set = {
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
        Waist = 'Sonic Belt',
    },
```


