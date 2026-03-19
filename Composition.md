# Set Composition

Sets within this collection of LuAshitacast profiles are typically grouped logically and equipped TOP DOWN by category.

This results in a user being able to specify shared items across multiple sets without having to repeat themselves but also allows logical composition of more than 2 sets solely through specifying sets properly.

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
        Ear1 = 'Diabolos\'s Earring', -- Let's ignore that this is conditional and assume it always gives 3 ACC.
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
        Ear1 = 'Diabolos\'s Earring', -- Let's ignore that this is conditional and assume it always gives 3 ACC.
        Waist = 'Life Belt',
    },
    TP_NIN = {
        Ear2 = 'Stealth Earring',
    },
```

The final composition of all these sets would result in the following set being equipped when /NIN and if the HighAcc tp mode is being used:
```lua
    Final_Set = {
        Ear1 = 'Brutal Earring',
        Ear1 = 'Diabolos\'s Earring',
        Waist = 'Life Belt',
    },
```
