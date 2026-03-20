# Rag's LuAshitacast

A combined LuAshitacast for Lvl 75 era that was originally based off of https://github.com/GetAwayCoxn/Luashitacast-Profiles

The intention for these luas is to comprehensively cover all required game mechanics for 75-era endgame content as almost every other lua I have found either does not implement or poorly implements functionality such as pdt / mdt / resist sets, spell interruption rate down (SIRD) / midcast delay, or different set toggling.

Jobs use the corresponding templates to automatically implement functionality that is shared across all of them.

- e.g. All jobs are able to type /fres which will automatically swap your idle gear sets to the Fire Resist set.
- e.g. All melee jobs are able to type /tp to switch between Low Accuracy and High Accuracy TP sets.
- e.g. All mage jobs are able to type /mode to switch between Magic Potency vs Magic Accuracy sets.

While these luas were originally designed for HorizonXI, these luas should still work on other 75-era private servers so long as HorizonXI custom equipment is appropriately commented out / disabled.

# How to Use

- Download the entire directory From Code > Download ZIP or from Releases to the right.
- Paste the **contents only** of the luashitacast-master folder (or luashitacast-1.0.0 etc.) into ..\\Game\\**config**\\addons\\luashitacast\\
- Note that **config** in the path. there may not be a luashitacast directory there if you have never used it before - just create one.
- Rename the Rag_5040 folder to [Your_Character_Name]_[Your_Character_ID]
- [Your_Character_ID] may be obtained from another plugin such as MobDB or by creating a blank lua using /lac newlua and then replacing the created folder.
- Edit Equipment Sets in [JOB].lua.
- Edit Elemental Staves (NQ vs HQ), Obis and other conditional gear in ..\\common\\gcmage.lua if you are using these luas for mage jobs.
- Edit Fenrir's Earring in ..\\common\\gcmelee.lua if you are using these luas for melee jobs.
- Edit Aketons and Dream gear etc. and turn on or off additional logging and other settings in ..\\common\\gcinclude-rag.lua.
- Set the i_can_read_and_follow_instructions_test boolean settings to true within gcmage.lua, gcmelee.lua, and gcinclude-rag.lua to confirm you actually read this and didn't waste other people's time.
- Make sure you fill out the fastcastValue etc. correctly in your [JOB].lua if you are using any Fast Cast gear etc. in the Precast set.
- Make sure you fill out the maxMP values correctly in your [JOB].lua if you are using these luas for mage jobs.
- The midcast delay assumes you use the PacketFlow plugin. If you don't use PacketFlow, adjust the values in gcmage.lua (or gcmelee.lua for melee jobs).
- If you define a specific mainhand in regular sets, it will still equip the correct staff if you have them listed in gcmage.lua
- If you have followed all these instructions and are experiencing crashes when loading the game or changing jobs, check out the Troubleshooting Crashes section below.

# How to Update

The luas were written so that updating your own copy to later versions that may have newer features should be minimal work. Search for the following marker in your existing files:

```
--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]
```

Copy everything above this line over to the new files. It is highly suggested that you do this set by set to avoid accidentally overwriting any new functionality placed in this section.

This will work 99% of the time unless you have added your own logic and therefore presumably know what you're doing already.

# Troubleshooting Crashes

- Make sure you are using the latest version of LuAshitacast: https://github.com/ThornyFFXI/LuAshitacast

- If your game is crashing (especially while switching jobs or zoning), turn off alias messages. You can change aliases.silent to 1 within the boot config to suppress them. The file is located at: ..\\Game\\config\\boot\\ashita.ini

# Note on Resting gear

The Resting set is equipped after 16 seconds of starting resting. This is to allow maximum regen or refresh ticks to take place before hMP or hHP gear is equipped.

 # Note on Level Sync

LuAshitacast provides functionality to automatically equip Level Sync gear. This LuAshitacast intentionally does NOT make use of this functionality to make it easier for first time users to be able to copy paste their own gear sets in place of mine. Adding this functionality will make it quite difficult for users on older versions of this LuAshitacast to update and so is not planned to ever be added. 

It is highly suggested that you do not attempt to add Level Sync functionality to these luas as it will cause you to be unable to update to newer versions easily among several other reasons.

# Set Composition

To make full use of this lua, it is important to understand how set composition works conceptually within LuAshitacast. i.e. "Base Sets", gFunc.Combine() or however you wish to call it.

See [Composition](Composition.md)

# Commands:

For a full list of all of the /commands available per Job:

See [Commands](Commands.md)

# Contact Me

Do NOT /tell me in game asking for help. You will be ignored. I only respond to Discord Messages.

If it's clear you have not bothered to read through this README, you will be ignored.

I will also as a rule ignore you as per https://nohello.net/ and https://dontasktoask.com/

Bug Reports, Missing Functionality or Feature Requests are best done through GitHub's Issue Tracker though feel free to DM me on Discord to discuss these as well.
