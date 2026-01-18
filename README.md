# Rag's LuAshitacast

A combined LuAshitacast for HorizonXI (Lvl 75 era) that was originally based off of https://github.com/GetAwayCoxn/Luashitacast-Profiles

All jobs are fully implemented.

The intention for these luas is to comprehensively cover all required game mechanics for 75-era content as almost every other lua I have found either does not implement or poorly implements functionality such as pdt / mdt / resist sets, spell interruption rate down (SIRD) / midcast delay, or different set toggling.

Jobs use the corresponding templates to automatically implement functionality that is shared across all of them.

- e.g. All jobs are able to type /fres which will automatically swap your idle gear sets to the Fire Resist set.
- e.g. All melee jobs are able to type /tp to switch between Low Accuracy and High Accuracy TP sets.
- e.g. All mage jobs are able to type /mode to switch between Magic Potency vs Magic Accuracy sets.

These luas were designed to be used in HorizonXI and therefore features such as automatically using opo-opo necklace when asleep or automatically cancelling shadows for Utsusemi: Ichi are not included.

These luas will still work on other 75-era private servers so long as Horizon custom equipment is appropriately commented out / disabled.

# How to Use

- Download the entire directory From Code > Download ZIP or from Releases to the right.
- Paste the **contents only** of the luashitacast-master folder (or luashitacast-1.0.0 etc.) into ..\\Game\\**config**\\addons\\luashitacast\\
- Note that **config** in the path. there may not be a luashitacast directory there if you have never used it before - just create one.
- Rename the Rag_5040 folder to [Your_Character_Name]_[Your_Character_ID]
- [Your_Character_ID] may be obtained from another plugin such as MobDB or by creating a blank lua using /lac newlua and then replacing the created folder.
- Edit Equipment Sets in [JOB].lua.
- Edit Elemental Staves (NQ vs HQ), Obis and other conditional gear in ..\\common\\gcmage.lua if you are using these luas for mage jobs.
- Edit Fenrir's Earring in ..\\common\\gcmelee.lua if you are using these luas for melee jobs.
- Edit Aketons and Dream gear etc. and turn on or off additional logging in ..\\common\\gcinclude-rag.lua.
- Set the i_can_read_and_follow_instructions_test boolean settings to true within gcmage.lua, gcmelee.lua, and gcinclude-rag.lua to confirm you actually read this and didn't waste other people's time.
- Make sure you fill out the fastcastValue correctly in your [JOB].lua if you are using any Fast Cast gear in the Precast set.
- Make sure you fill out the maxMP values correctly in your [JOB].lua if you are using these luas for mage jobs.
- The midcast delay assumes you use the PacketFlow plugin. If you don't use PacketFlow, adjust the values in gcmage.lua (or gcmelee.lua for melee jobs).
- If you define a specific mainhand in regular sets, it will still equip the correct staff if you have them listed in gcmage.lua
- If you have followed all these instructions and are experiencing crashes when loading the game or changing jobs, check out the Troubleshooting Crashes section on the bottom of this page.

# Note on Resting gear

The Resting set is equipped after 16 seconds of starting resting. This is to allow maximum regen or refresh ticks to take place before hMP or hHP gear is equipped.

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

/horizonmode - if you wish to use Horizon Mode in LuAshitacast to be 100% horizon approved,
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
/hate   - causes your cures, sleeps, blinds, dispels and binds to equip +enmity set on cast.

[Special Sets]
These commands and sets were created before /lockset was implemented and do the same thing.
/vert   - equips the Convert set and locks equipment.
          use /lock to unlock again.
/csstun - equips the Stun set and locks equipment.
          use /lock to unlock again.
          Note that this is not actually required and only still here for legacy reasons.
          Luashitacast works correctly with chainspell by default now.
```

## Additional Commands for BLM:
```
/yellow - equips gear to lower HP before finishing casts to trigger Sorcerer's Ring.
          This is on by default.
/mb     - equips gear that gives bonuses to magic burst damage when casting nukes.
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
/yellow - equips gear to lower HP before finishing casts to trigger Medicine Ring.
          This is off by default.
```

## Additional Commands for BRD:
```
/shorde  - switches to using the default foe lullaby set to reduce AOE in favour of Acc.
/sballad - switches to using a wind instrument over string to reduce AOE.
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
/th - Forces you to equip TH gear when TP-ing in case you have a tinfoil hat.
      Will also force you to equip TH gear when using a ranged attack and ability.

All of the following toggles set what bolt ammo will be used.
/aacid
/asleep
/abloody
/ablind
/avenom

Alternatively, use /ammo to cycle through them.
```

## Additional Commands for PLD / NIN / DRK:
```
/dps - used to turn on or off DPS LowAcc / HighAcc TP set behaviour.
       i.e. forces you to act more like a tank or a dps.
       By default PLD is set to false while DRK and NIN are set to true.
       Technically can be used by all melee jobs in order to use Earth Staff etc.
```

## Additional Commands for NIN:
```
/nuke  - toggles between 2 different elemental accuracy sets for Ninjutsu nuking.
/staff - toggles between always switching to staff for spells or not.
```

# Troubleshooting Crashes

- Make sure you are using the latest version of LuAshitacast: https://github.com/ThornyFFXI/LuAshitacast

- If your game is crashing (especially while switching jobs or zoning), turn off alias messages. You can change aliases.silent to 1 within the boot config to suppress them. The file is located at: ..\\Game\\config\\boot\\ashita.ini

 # Additional Notes

- LuAshitacast provides functionality to automatically equip Level Sync gear. This LuAshitacast intentionally does NOT make use of this functionality to make it easier for first time users to be able to copy paste their own gear sets in place of mine. Adding this functionality will make it quite difficult for users on older versions of this LuAshitacast to update and so is not planned to ever be added. It is highly suggested that you do not attempt to add Level Sync functionality to these luas as it will not work completely unless you know exactly what you're doing and will cause you to be unable to update to newer versions easily. Level Sync content is a joke anyway. Just throw on some garbage gear full time and clear it.

- Horizon's rules on what is legal or not in LuAshitacast is poorly explained and will vary depending on what admin or GM you talk to anyway. This LuAshitacast attempts to abide by the spirit of their rules. Short of any explicit guidance from a GM / Horizon Staff, functionality will not be changed to cater for you.

# Contact Me

Do NOT /tell me in game asking for help. You will be ignored. I only respond to Discord Messages.

If it's clear you have not bothered to read through this README, you will be ignored.

I will also as a rule ignore you as per https://nohello.net/ and https://dontasktoask.com/

Bug Reports, Missing Functionality or Feature Requests are best done through GitHub's Issue Tracker though feel free to DM me on Discord to discuss these as well. I am easily found in the HorizonXI or Ashita Discords.
