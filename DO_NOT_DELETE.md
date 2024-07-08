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
