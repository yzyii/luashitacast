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