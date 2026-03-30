# Default Commands:
```
[Regular Toggles]
/lock   - locks or unlocks all equipment.
/kite   - toggles Kite set on/off.
          /kite always takes precedence over any other set overrides active.
          e.g. if you have /kite and /fireres toggled on,
          it will equip the kite set instead of or on top of the fire resistance set.
          this allows you to gain 12% move speed while keeping most of your fire resistance.

/weapon /wl - toggles between using Weapon_Loadout sets.
              can be used to specify different weapon loadouts. e.g. virtue stones etc.
              there is no UI element for this.

[Idle Sets] (Changes your idle set to use these sets instead)
/idle           - toggles between using 2 different idle sets
                  i.e. Normal and Alternate / Idle and IdleALT.
/dt /pdt        - toggles DT set on/off.
/mdt            - toggles MDT set on/off.

/iceres /ires /bres       - toggles Ice Resistance set on/off.
/fireres /fres            - toggles Fire Resistance set on/off.
/earthres /eres /sres     - toggles Earth Resistance set on/off.
/windres /ares /wires     - toggles Wind Resistance set on/off.
/waterres /wres /wares    - toggles Water Resistance set on/off.
/lightningres /lres /tres - toggles Lightning Resistance set on/off.

/evasion /eva   - toggles Evasion set on/off.
                  you could also use this set for special sets
                  such as a MNK Counter set, a DRK Zerg set, Virtue Stone sets etc.
                  as it will simply override your default idle / TP gear.

[Special Commands]
/warpme           - equips a warp cudgel and uses it after 30 seconds and locks equipment.
                    use /lock to unlock again.
/lockset [number] - equips the given lockset and locks equipment
                    use /lock to unlock again.
                    This is primarily provided as a shortcut way to define some VERY basic
                    level sync functionality or for use in conjunction with /lockstyle on.

/lag - removes midcast delays and yellow set delays for when a zone is lagging
       to give ashitacast the maximum chance of actually equipping the correct gear on cast.
       interim equip sets will no longer work when this is enabled.

/horizonmode - if you wish to use Horizon Mode in LuAshitacast to be 100% HorizonXI approved,
               you can then use this alias to manually trigger a handle default gear equip
               using a key press!
               i.e. You could push this 4 times a second just to mimic exactly what
               LuAshitacast would do for you automatically.
```

## Additional Commands for All Mage Jobs:
```
/addmp [number] - adds a set amount of MP to decide usage of the IdleMaxMP set.
                  this can be used when eating food or for other +MP effects.
                  type /addmp without a number to display the current value.
/setmp [number] - sets the mp at which your idle sets will automatically transition
                  to using your IdleMaxMP set.
                  this will override the values defined for /NIN /WHM /RDM /BLM as well.
                  /addmp will still work as per normal in conjunction with this.
                  type /setmp without a number to display the current value.
/resetmp        - resets addmp and setmp values to 0

[RDM / WHM / BLM]
/mode           - toggles Elemental & Enfeebling Magic between Potency (Normal) and
                  Accuracy sets.

[RDM / WHM / BRD / SMN]
/tp             - cycles TP set between being Off or a LowAcc and HighAcc set.
                  Using TP modes will cause spells / songs to no longer use staves etc.
                  as your weapons etc. will be locked to retain TP.
/tptoggle       - toggles between the last used TP set and Off.
```

## Additional Commands for All Melee Jobs:
```
/tp /tpset /mode - toggles TP set between a LowAcc and HighAcc set.
                   this will be overwritten if you have a DT or resistance set etc. enabled.
                   this is disabled for PLD in favour of using Idle sets by default.
```

## Additional Commands for RDM:
```
[Regular Toggles]
/hate   - causes your cures, sleeps, blinds, dispels etc. to equip +enmity set on cast.
/fring  - toggles usage of Fencer's Ring.

[Special Sets]
These commands and sets were created before /lockset was implemented and do the same thing.
/vert   - equips the Convert set and locks equipment.
          use /lock to unlock again.
/csstun - equips the Stun set and locks equipment.
          use /lock to unlock again.
          Note that this is not actually required and only still here for legacy reasons
          and peace of mind.
```

## Additional Commands for BLM:
```
/yellow - equips gear to lower HP before finishing casts to trigger Sorcerer's Ring.
          This is on by default.
/mb     - equips gear that gives bonuses to magic burst damage when casting nukes.
/hnm    - equips the HNM relevant nuking sets (typically -enmity nuke sets).
/extra  - Uses NukeExtra and StoneskinExtra sets when above a given MP threshold.
          Threshold is defined by the varable: "nukeExtraThreshold".
          This is intended for nuking with a MaxMP set giving an extra -ga3 or T4 nuke
          per max MP bar.
          Override sets such as MDT/PDT/FireRes etc. will not work in InterimMidcast
          with this enabled.
          This command is not intended to be used in conjunction with Accuracy /mode
          or /hnm sets etc.
```

## Additional Commands for WHM:
```
/hate   - causes your cures, sleeps, blinds, dispels etc. to equip +enmity set on cast.
/yellow - equips gear to lower HP before finishing casts to trigger Medicine Ring.
          This is off by default.
```

## Additional Commands for BRD:
```
/shorde  - switches to using the default foe lullaby set to reduce AOE in favour of Acc.
/sballad - switches to using a wind instrument over string to reduce AOE.
/srecast - toggles using the Sing_Recast set on Lullaby songs.
```

## Additional Commands for SMN:
```
/cring  - toggles usage of Conjurer's Ring.
```

## Additional Commands for BST:
```
All of the following toggles set what jug Call Beast will use.
/sheep
/lizard
/crab
/tiger
/rabbit
/mandy
/flytrap

Alternatively, use /nextpet to cycle through them.
```

## Additional Commands for THF:
```
/th - forces you to equip TH gear when TP-ing in case you have a tinfoil hat.
      Will also force you to equip TH gear when using a ranged attack and ability.

All of the following toggles set what bolt ammo will be used.
/aacid
/asleep
/abloody
/ablind
/avenom
/anone

Alternatively, use /ammo to cycle through them.
```

## Additional Commands for PLD / NIN / DRK:
```
/dps - used to turn on or off DPS LowAcc / HighAcc TP set behaviour.
       i.e. forces you to act more like a tank or a dps.
       By default PLD is set to false while DRK and NIN are set to true.
       Technically can be used by all melee jobs in order to use Earth Staff etc.
```

## Additional Commands for DRK:
```
/hate - Causes spells to equip the Hate set for tanking purposes.
```

## Additional Commands for NIN:
```
/nuke  - toggles between 2 different elemental accuracy sets for Ninjutsu nuking.
/staff - toggles between always switching to staff for spells or not.
         This is typically used in conjunction with the /dps command to result in
         staff tanking even while engaged.
/sring - toggles usage of Shinobi Ring.
/bat   - forces bat earring to equip if /evasion is already toggled on.
         this command is only available in horizon_safe_mode as this is already
         automatically done for you if horizon_safe_mode is set to false.
```

## Additional Commands for RNG:
```
/ranged - switches Ranged Attacks between Attack and Accuracy modes / sets.
```
