# Rag's RDM / BLM luashitacast

A combined RDM / BLM luashitacast for HorizonXI based off of https://github.com/GetAwayCoxn/Luashitacast-Profiles

# How to Use

- Edit Equipment Sets in RDM.lua or BLM.lua
- Edit Elemental Staves (NQ vs HQ), Obis and some conditional gear in gcmage.lua
- Turn On / Off Additional Commands and Logging in gcincluderag.lua

- If you define a specific mainhand in regular sets, it will still equip the correct stave if you have them listed in gcmage.lua
- FallbackNukeSub and FallbackEnfeeblingSub sets are used only if you wish to define a Sub due to not having a complete set of Elemental Staves.

## Default Commands:
```
/dt     - toggles DT set on/off
/kite   - toggles Kite set on/off
/nuke   - toggles Elemental Magic between regular DMG and MACC sets
/warpme - equips a warp cudgel and uses it after 30 seconds
/vert   - equips the Convert set and locks equipment. use /lock to unlock again.
/lock   - locks or unlocks equipment.
/fight  - equips the TP set and locks weapon and sub (or unlocks weapon and sub).
```

## Additional Commands (Shorterhand):

If you enable the Shorterhand setting in gcincluderag.lua, additional /commands will work.

- shorterhand.lua is effectively just a pass through to shorthand you can define your own /commands in
- using shorterhand syntax like 'me' or partial names will work. e.g. "/i me" will cast invisible on yourself.

```
/c4 - Cure IV
/c3 - Cure III
/c2 - Cure II
/c  - Cure
/i  - Invisible
/s  - Sneak
/ss - Stoneskin
/b  - Blink
/a  - Aquaveil
```
