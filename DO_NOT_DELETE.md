# Changelog

## v1.0.0

- First official release

## v1.0.1

- BST - Fix dependency errors

## v1.1.0

- THF - Add Bloody Bolt Handling
- THF - Add TH on /ra
- THF - Fix an issue with TAWS / SATAWS potentially not equipping AF+1 hands
- DRG - Add Warlock Mantle
- RDM - Allow RDM +MS while engaged
- BLM - Fix /mode m.acc equipment priorities
- gcmage - Add republic_gold_medal
- gcmelee - Add fenrirs_earring
- shorterhand - Add tonko handling (/i me will use tonko)
- Breaking Change - Removed custom keybinds (users should do this in scripts or per lua themselves)
- Breaking Change - Variable sorcerors_tonban in gcmage.lua changed to string to allow +1
- Breaking Change - Add ConserveMP set to all Mage jobs.

## v1.1.1

- BLM - Fix shorterhand not registering RDM spells

## v1.1.2

- THF - Add TP_NIN and Fix timing edge cases for SATA

## v1.1.3

- BST - Add TP_NIN
- WHM - Add TP Lock identical to RDM
- BRD - Add TP Lock identical to RDM

## v1.1.4

- PLD - Use Haste set over Hate when Sentinel is active

## v1.1.5

- RNG - Added additional protection for using up special ammo for Unlimited shot
- BLM - Fixed Republic Circlet logic
- BLM - Add Opuntia Hoop logic
- Breaking Change - PLD - Change cover to use a set

## v1.1.6

- Defaulting to not using shorterhand as shorthand config can do 99% of the same thing

### v1.2.0

- Stripped Shorterhand entirely in favour of using shorthand and aliases out of box

### v1.2.1

- Removed unused files and FallbackSub set which has been deprecated for quite a while but never removed from the job luas

### v1.2.2

- Breaking Change - PLD - Add missing valor_surcoat variable - How has no one told me this is missing until now...
- PLD - Add Cure set

### v1.2.3

- PLD - Prevent Chivalry from swapping gear at all to ensure TP is not lost on usage
- RDM/BLM - Fix Master Caster Bracelet usage on stat insensitive debuffs

### v1.2.4

- RNG - Fix syntax errors on print lines

### v1.2.5

- Fix some collisions in shorthand causing commands such as /item to not work
- Fix /lag command which was never actually tested until now

### v1.2.6

- Breaking Change - PLD - Added Rampart set and removed superfluous booleans for Cover and Rampart
- SMN - Added Carbuncles Cuffs and Evokers Boots vars for Precast
- MNK - Added Hundred Fists set
- Fix /dps toggling
- Add /mode for dps jobs

### v1.2.7

- RNG - Add preshot set for RNG
- All DD - Fixed Fenrir's Earring for Idle Handling

### v1.2.8
- All DD - Fixed Fenrir's Earring - Added WS Handling
- WHM - Add Cure V set for WHM
- Add all races custom purgonurgo warp tunic

### v1.2.9
- BLM - Add explicit Stun set

### v1.2.10
- SMN - Add additional sets for Magical, Hybrid and Physical BPs

### v1.2.11
- All Jobs - Delay equipping resting gear for 16 seconds to maximize regen / refresh type effects
- DRK - Fix bugs

### v1.2.12
- BLM - Automatically disable Yellow set when weakened
- THF - Add set for Hide

### v1.3.0
- Add horizonmode. To be perfectly Horizon legal using the Horizon Mode setting in LuAshitacast, you can use this alias to manually trigger HandleDefault logic instead.

### v1.3.2
- Add Engaged check to TP_NIN for BST and THF
- BRD - Change Sing_Default to actually be used as the base set for all songs
- BRD - Use Sing_Buff set on Ballads, Mazurka and Paeon as a base set
- BRD - Add explicit Large and Small Ballad sets
- BRD - Add explicit Large and Small Horde Lullaby sets
- BRD - Add /srecast toggle

### v1.3.3
- WHM - Add Medicine Ring

### v1.3.4
- WAR - Implements the job

### v1.3.5
- Fix the conquest packet being sent on Horizon that causes it to constantly poll until you zone or check status menu

### v1.3.6
- Fix Stun set behaviour

### v1.3.7
- Adds an additional set and toggle for BLM for HNMs

### v1.3.8
- Fix fenrirs earring logic

### v1.3.9
- Add StunACC set for RDM

### v1.3.10
- Fix bug on mage melee attempting to use fenrirs earring

### v1.3.11
- BRD - Split BRD Mazurka and Paeon sets
- PLD - Add Cure 3 HP Up Set

### v1.3.12
- BST - Add Call Beast set
- BRD - Update song spellcasting time
- BLM - Fix Aspir and Diabolos Ring logic

### v1.3.13
- Update HP thresholds on max mp sets
- PLD - Add Arco de Velocidad logic
- BLM - Remove flooring on Yellow set logic (i.e. makes it slightly more accurate)
- Alter Melee Job SIRD priority order to prioritize MDT and Elemental Resist sets
- BST / MNK - Fix Muscle Belt logic
- WAR - Add SAM set for Attila's Earring
- NIN - Tidy up Tables
- MNK - Add regen gear

### v1.3.14
- WAR - Adds Aggressor logic
- BRD - Fixes the bug with BRD always using singing gear on all spells

### v1.3.15
- PLD - Add warlock cape handling if /rdm
- NIN - Add elemental obis, basic ranged set, some additional night time evasion item handling
- NIN - Added Dark Magic for NIN. Changes NIN to always swap to staves if possible
- BLM - Added YellowHNM set for BLM

### v1.3.16
- BRD - Fix fight disabling Range slot
- Mages - Use obis when in accuracy mode when appropriate
- NIN - Use obis for spells

### v1.3.17
- BLM - Remove elemental resist sets equipping opuntia ring
- DRG - Use DT set when below Healing Breath HP threshold when /mage and fix pdt/mdt/resist set priority
- DRK - Fix 2H Zerg set logic
- MNK - Fix default gear priority logic
- PLD - Fix Parade and Hercules Ring logic

### v1.3.18
- Mages - Add Fenrir's Earring to WHM, BRD and RDM
- BRD - Fix broken file that was broken in 1.3.17 due to merge
- MNK - Fix spam flickering between equips when using regen gear with +hp idle gear

### v1.3.19
- DRG - Fix weakened check on DRG DT

### v1.3.20
- RDM - Add Evisceration WS set
- Mages - Allow max mp sets to be used when in /fight mode if not engaged
- Mages - Remove max mp buffer values (better accuracy on swapping to max mp gear)
- Mages - Add Rep.Gold Medal to resting max mp logic
- THF - Make TH only override while engaged. Make TH equip on ability use

### v1.3.21
- Melee - Allow switching to Kite set when moving and engaged
- All Jobs - Allow switching to Kite set when moving and engaged with Evasion set
- DRK - Fix missing obi tables for spellcasting
- RDM - Add HQ Blue Cotehardie behaviour
- Removes background from UI Display, Switches Font and Colour to better match HXUI
- RDM - Add a DRK SJ MP constant for convenience

### v1.3.22
- BRD - Add a set for HP Down that equips before Precast for songs
- DRK - Add tanking logic
- WHM - Fix order on precast to fix cure clogs
- THF - Add TH set to magic

### v1.3.23
- DRK - Fix Dark Magic Obi usage
- Mages - Fix Dark and Light Obi usage
- NIN - Re-Add tp lock to NIN (will still lock range and ammo slots)
- NIN - Add DT set behaviour to idle sets
- Renamed dark_and_abyssal_earrings variable
- Add Group 2 Merit Spells

### v1.3.24
- Add Handling for Nil player.MainJob() on initial load
- Mages - Add ConserveMP set usage to MaxMP sets when below 95% MP

### v1.3.25
- Fix Faulty Logic for IdleDT set for NIN that was causing spam on DD jobs
- PLD - Add Shadow Mantle for Rampart

### v1.3.26
- PLD/RDM - Switch Cure Cheats to ForceEquipSet for marginally better performance
- RNG - Fix Unlimited Shot logic

### v1.3.27
- NIN - Fixes idle set usage
- WHM - Prevents usage of Master Caster Brc. as WHM have relic hands

### v1.3.28
- PLD - Adds a delay to cure cheating to minimize the cure window. This comes at the expense of 1 second of SIRD gear.
- BLM - Fixes weakness check when nuking with yellow set and disables sorc ring automatically if weakened
- WHM - Adds Barspell set for Cleric's Pantaloons etc.

### v1.3.29
- DRG - Adds a non-mage breath set
- Melee - Adds cast delay handling for Hasso and Seigan
- DRK - Adds fenrir's stone

### v1.3.30
- BLM - Implements /extra command toggle, NukeExtra and StoneskinExtra sets to be able to nuke with a max mp-ish set.

### v1.3.31
- WHM - Add Virology Ring

### v1.4.0
- WHM - Implements a Yellow toggle for Medicine Ring
- WHM - Implements Mjollnir / Asklepios
- WHM/RDM/BRD - Implements TP LowAcc and HighAcc sets
- All Jobs - Implements a Mjollnir Haste Buff set
- RNG - Changes Ranged_ATK set to EagleEyeShot and actually implements Ranged_ATK as a toggle to change midshot equipment
- NIN - Adds Nuke Accuracy modes
- PLD - Add Divine Magic set
- All Melee - Adds WS_HighAcc set
- DRG - Implements accuracy modes for jumps

### v1.4.1
- WHM - Fixed Virology Ring typo

### v1.4.2
- BRD - Updated Preludes to 4000 because Horizon can't get their client DATs right still...
- SMN - Remove pointless toggles from SMN

### v1.4.3
- PLD - Make Enfeebling and Enhancing spells not equip enmity set

### v1.4.4
- THF - Implements auto TH tracking

### v1.4.5
- Melee - Fixed broken Precast

### v1.4.6
- NIN - Add Warlock Mantle
- NIN - Use Shinobi Ring on casts by default (primarily for Utsusemi)
- SMN - Fix Light Spirit using carbuncle gear
- SMN - Implements TP modes for SMN
- SMN - Implements an optional Perpetuation set for Penance Robe

### v1.4.7
- BRD - Allow Ranged swaps for melee (Horizon+)
- NIN - Add Koga Tekko +1 to utsusemi / default casting gear
- SMN - Keep Carbuncle's Cuffs / Evoker's Boots equipped on midcast due to Horizon wonkiness with spirits
- MNK - Fix Kampfer Ring / Earring usage from being overridden by DT set

### v1.4.8
- PLD - Fix Enhancing Magic set usage
- NIN - Add Enhancing / Cure set
- THF - Add nil check for /ra when not using bows / xbow

### v1.4.9
- WHM - Use Cure5 set for Curaga IV
- THF - Fix behaviour of automatic TH tagging
- Mages - Blink on Ability use with displayhead

### v1.4.10
- DRK - Fix Tanking Sets
- PLD - Remove /lock calls out of Shield Bash
- Increases interim set buffer times to 0.4s from 0.25s for higher consistency in lagged zones
- BRD - Remove Minstrel's Earring