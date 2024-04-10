# Rag's LuAshitacast

A combined LuAshitacast for HorizonXI (Lvl 75 era) that was originally based off of https://github.com/GetAwayCoxn/Luashitacast-Profiles

All jobs are fully implemented to my knowledge except for WAR however implementation should be trivial. DRK is implemented but untested.

Jobs use the corresponding templates to automatically implement functionality that is shared across all of them.

- e.g. All jobs are able to type /fres which will automatically swap your idle gear sets to the Fire Resist set.
- e.g. All melee jobs are able to type /tp to switch between Low Accuracy and High Accuracy TP sets.
- e.g. All mage jobs are able to type /mode to switch between Magic Potency vs Magic Accuracy sets.

These luas were designed to be used in HorizonXI and therefore features such as automatically using opo-opo necklace when asleep or automatically cancelling shadows for Utsusemi: Ichi are not included.

# How to Use

- Download the entire directory From Code > Download ZIP or from Releases to the right.
- Paste the **contents only** of the luashitacast-master folder (or luashitacast-1.0.0 etc.) into ..\\Game\\**config**\\addons\\luashitacast\\
- Note that **config** in the path. there may not be a luashitacast directory there if you have never used it before - just create one.
- Rename the Rag_5040 folder to [Your_Character_Name]_[Your_Character_ID]
- [Your_Character_ID] may be obtained from another plugin such as MobDB.
- Edit Equipment Sets in [JOB].lua. You may delete any of these if you're only looking for a lua one of the jobs.
- Edit Elemental Staves (NQ vs HQ), Obis and some conditional gear in gcmage.lua if you are using these luas for mage jobs.
- Edit Fenrir's Earring in gcmelee.lua if you are using these luas for melee jobs.
- Edit Aketons and Dream gear etc. and turn on or off additional logging in gcincluderag.lua.
- Make sure you fill out the fastcastValue correctly in your [JOB].lua if you are using any Fast Cast gear in the Precast set.
- The midcast delay assumes you use the PacketFlow plugin. If you don't use PacketFlow, adjust the values in gcmage.lua (or gcmelee.lua for melee jobs).
- If you define a specific mainhand in regular sets, it will still equip the correct stave if you have them listed in gcmage.lua

# How to Update

The luas were written so that updating your own copy to later versions that may have newer features should be minimal work. Search for the following marker in your existing files:

```
--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]
```

Copy everything above this line over to the new files.

This will work 99% of the time unless you have added your own logic and therefore presumably know what you're doing already.

# Default Commands:
```
[Regular Toggles]
/lock   - locks or unlocks all equipment.
/kite   - toggles Kite set on/off.
          /kite always takes precedence over any other set overrides active.
          e.g. if you have /kite and /fireres toggled on,
          it will equip the kite set instead of or on top of the fire resistance set.
          this allows you to gain 12% move speed while keeping most of your fire resistance.

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
                  such as a MNK Counter set, a DRK Zerg set etc.
                  as it will simply override your default idle / TP gear.

[Special Commands]
/warpme           - equips a warp cudgel and uses it after 30 seconds and locks equipment.
                    use /lock to unlock again.
/lockset [number] - equips the given lockset and locks equipment
                    use /lock to unlock again.

/lag - removes midcast delays and yellow set delays for when a zone is lagging
       to give ashitacast the maximum chance of actually equipping the correct gear on cast.
       interim equip sets will no longer work when this is enabled.
```

# Additional Commands for All Mage Jobs:
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
/mode           - toggles Elemental & Enfeebling Magic between Potency (Normal) and
                  Accuracy sets.
```

# Additional Commands for All Melee Jobs:
```
/tpset /tp - toggles TP set between a LowAcc and HighAcc set.
             this will be overwritten if you have a DT or Fire Resistance etc. set enabled.
             this is disabled for PLD in favour of just always using Idle sets instead.
/dps       - used for PLD to turn on DPS LowAcc / HighAcc TP set behaviour.
/locktp    - locks or unlocks Main, Sub, Ranged and Ammo slots.
```

## Additional Commands for RDM:
```
[Regular Toggles]
/hate   - causes your cures, sleeps, blinds, dispels and binds to equip +enmity set on cast.
/fight  - used to turn off TP set.
          this is automatically used for you when disengaging if your TP is 0.

[Special Sets]
/vert   - equips the Convert set and locks equipment.
          use /lock to unlock again.
/csstun - equips the Stun set and locks equipment.
          use /lock to unlock again.
          Note that this is not actually required and only still here for legacy reasons.
          Luashitacast works correctly with chainspell by default now.
```

## Additional Commands for BLM:
```
[Regular Toggles]
/yellow - equips gear to lower HP before finishing casts to trigger Sorcerer's Ring.
          This is on by default.
/mb     - equips gear that gives bonuses to magic burst damage when casting nukes.
```

## Additional Commands for WHM
```
[Regular Toggles]
/fight  - used to turn off TP set.
          this is automatically used for you when disengaging if your TP is 0.
```

## Additional Commands for BRD:
```
[Regular Toggles]
/shorde  - switches to using the default foe lullaby set to reduce AOE in favour of Acc.
/sballad - switches to using a wind instrument over string to reduce AOE.
/fight  - used to turn off TP set.
          this is automatically used for you when disengaging if your TP is 0.
```

## Additional Commands for BST:
```
[Regular Toggles]
/sheep  - All of these toggles set what jug Call Beast will use.
/lizard
/crab
/tiger
/rabbit
/mandy
/flytrap
```

## Additional Commands for THF:
```
[Regular Toggles]
/th - Forces you to equip TH gear when TP-ing in case you have a tinfoil hat.
```

## Additional Notes / Troubleshooting Crashes

- LuAshitacast provides functionality to automatically equip Level Sync gear. This LuAshitacast intentionally does NOT make use of this functionality to make it easier for first time users to be able to copy paste their own gear sets in place of mine. Adding this functionality will make it quite difficult for users on older versions of this LuAshitacast to update and so is not planned to ever be added. Level Sync content is a joke anyway. Just throw on some garbage gear full time and clear it. 

- If LuAshitacast is crashing your game, chances are you are using an old version of it. Update to the latest version of it at https://github.com/ThornyFFXI/LuAshitacast

- If your game is still crashing and you are using these on HorizonXI, make sure you are launching the game from the correct launcher. This is a bug with earlier HorizonXI launcher versions which opened an older version of the launcher. Assuming you installed to the default path, delete the shortcut on your desktop and make a new one pointing to: ..\\AppData\\Local\\HorizonXI_Launcher\\HorizonXI-Launcher.exe

- If your game is still crashing at this point, some users have reported that turning off alias messages has worked for them. You can change aliases.silent to 1 within the boot config to suppress these messages. The file is located at: ..\\Game\\config\\boot\\ashita.ini
