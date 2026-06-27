local profile = {}

local fastCastValue = 0.02 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local petActionEquipmentDelay = 1.00 -- Approx. 2.0 to 2.5 seconds for a Ready to be executed. Do not increase this value beyond ~1.65 to allow for packet delay and the 0.25 sec loop delay on HandleDefault execution.

-- The following is provided as a convenient saved setting over using the /sethp command. HP will fluctuate with SJ and usage of the command for this is required.
local max_hp_in_idle_with_regen_gear_equipped = 0 -- Set this to 0 if you do not wish to ever use regen gear.

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local gaudy_harness = {
    Body = 'Gaudy Harness',
}

local sets = {
    Idle = {
        Head = 'Darksteel Cap +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {},
    Resting = {
        Neck = { Name = 'Pch. Collar', Priority = 70 },
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Sanative Earring',
        Body = 'Nomad\'s Tunica',
        Hands = 'Shep. Bracers',
        Legs = 'Mst. Trousers +1',
        Feet = 'Nomad\'s Boots',
    },
    Town = {},
    Movement = {},
    Movement_TP = {
        Hands = { Name = 'Alkyoneus\'s Brc.', Priority = 60 },
        Feet = { Name = 'Ogre Ledelsens +1', Priority = 50 },
    },

    DT = {
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    MDT = {
        Head = 'Coral Visor +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Cor. Scale Mail +1',
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Merman\'s Ring',
        Legs = 'Coral Cuisses +1',
        Feet = 'Coral Greaves +1',
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    LightningRes_NoBarthunder = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},
    Override = { -- An additional override set explicitly to be used for sets such as crafting, HELM, fishing, or any other special sets such as DRK 2HR, MNK Counter etc. n.b. Any unused Resist or Evasion set can be used similarly.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
    },
    SIRD = { -- Override sets (Resistance / Evasion) take precedence if in use.
        Head = 'Darksteel Cap +1',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Magnetic Earring', Priority = 50 }, -- 8
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Shadow Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 60 },
        Back = 'Shadow Mantle',
        Waist = { Name = 'Powerful Rope', Priority = 70 },
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Head = 'Panther Mask +1',
        Ear1 = { Name = 'Loquac. Earring', Priority = 50 },
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring2 = 'Blitz Ring',
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },

    TP_LowAcc = {
        Head = 'Panther Mask +1',
        Neck = 'Temp. Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = 'Armada Hauberk',
        Hands = { Name = 'Dusk Gloves +1', Priority = 60 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Blitz Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {
        Hands = 'Armada Mufflers',
    },
    TP_HighAcc = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Hands = 'Armada Mufflers',
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Back = 'Settler\'s Cape',
        Waist = 'Life Belt',
        Feet = 'Armada Sollerets',
    },
    TP_NIN = { -- Equips iff using 1h weapon in Sub
        Ear2 = 'Stealth Earring',
    },

    Weapon_Loadout_1 = {
        Main = 'Martial Axe',
        Sub = 'Maneater',
        Ammo = { Name = 'Tiphia Sting', Priority = -20 },
    },
    Weapon_Loadout_2 = {
        Main = 'Maneater',
        Sub = 'Temperance Axe',
        Ammo = 'Virtue Stone',
    },
    Weapon_Loadout_3 = {
        Main = 'Maneater',
        Sub = 'Tatami Shield',
        Ammo = { Name = 'Tiphia Sting', Priority = -20 },
    },

    WS = {
        Head = { Name = 'Hecatomb Cap +1', Priority = 60 },
        Neck = 'Temp. Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Assault Earring',
        Body = 'Armada Hauberk',
        Hands = { Name = 'Hct. Mittens +1', Priority = 60 },
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Hct. Subligar +1', Priority = 60 },
        Feet = { Name = 'Hct. Leggings +1', Priority = 60 },
    },
    WS_HighAcc = {
        Ring1 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Ring2 = { Name = 'Toreador\'s Ring', Priority = 60 },
        Legs = 'Byakko\'s Haidate',
    },
    WS_Rampage = {
        Legs = 'Byakko\'s Haidate',
    },
    WS_Decimation = {
        Hands = 'Alkyoneus\'s Brc.',
        Legs = { Name = 'Bst. Trousers +1', Priority = 60 },
    },

    Charm = {
        Head = { Name = 'Monster Helm', Priority = 70 },
        Neck = 'Temp. Torque',
        Ear1 = 'Melody Earring +1',
        Ear2 = 'Melody Earring +1',
        Body = { Name = 'Monster Jackcoat +1', Priority = 60 },
        Hands = { Name = 'Monster Gloves', Priority = 60 },
        Ring1 = 'Heavens Ring',
        Ring2 = 'Heavens Ring',
        Back = 'Lyricist\'s Gonnelle ',
        Waist = 'Ryl.Kgt. Belt',
        Legs = { Name = 'Bst. Trousers +1', Priority = 60 },
        Feet = { Name = 'Monster Gaiters', Priority = 60 },
    },
    Reward = {
        Head = { Name = 'Bison Warbonnet', Priority = 50 },
        Neck = 'Faith Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = { Name = 'Kirin\'s Osode', Priority = 50 },
        Hands = { Name = 'Ogre Gloves +1', Priority = 50 },
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Ryl. Army Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Magic Cuisses',
        Feet = { Name = 'Monster Gaiters', Priority = 60 },
    },
    Reward_Status_1 = { -- Paralyze, Poison, Blind
        Body = { Name = 'Monster Jackcoat +1', Priority = 60 },
    },
    Reward_Status_2 = { -- Weight, Slow, Silence
        Body = { Name = 'Monster Jackcoat +1', Priority = 60 },
    },
    Ready_Physical = {
        Head = { Name = 'Shep. Bonnet', Priority = 60 },
        Body = 'Shep. Doublet',
        Feet = 'Shep. Boots',
    },
    Ready_Magic = {
        Head = { Name = 'Beast Helm +1', Priority = 60 },
        Body = 'Shep. Doublet',
        Feet = 'Shep. Boots',
    },
    Call_Beast = {
        Hands = { Name = 'Monster Gloves', Priority = 60 },
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    VileElixir = {
        Head = { Name = 'Genbu\'s Kabuto', Priority = 60 },
        Neck = { Name = 'Shield Pendant', Priority = 20 },
        Ear1 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Ear2 = { Name = 'Pigeon Earring +1', Priority = 60 },
        Body = { Name = 'Ogre Jerkin +1', Priority = 60 },
        Hands = { Name = 'Seiryu\'s Kote', Priority = 60 },
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 60 },
        Ring2 = { Name = 'Bloodbead Ring', Priority = 40 },
        Back = { Name = 'Gigant Mantle', Priority = 60 },
        Waist = { Name = 'Powerful Rope', Priority = 60 },
        Legs = { Name = 'Dusk Trousers +1', Priority = 60 },
        Feet = { Name = 'Dusk Ledelsens +1', Priority = 60 },
    },
}

profile.SetMacroBook = function()
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

sets.gaudy_harness = gaudy_harness
sets.muscle_belt = muscle_belt
sets.presidential_hairpin = presidential_hairpin
sets.dream_ribbon = dream_ribbon
profile.Sets = gcmelee.AppendSets(sets)

local pets = T{'sheep','lizard','crab','tiger','rabbit','mandy','flytrap'}

local PetTable1 = {
    [1] = 'Sheep',
    [2] = 'Lizard',
    [3] = 'Crab',
    [4] = 'Tiger',
    [5] = 'Rabbit',
    [6] = 'Mandy',
    [7] = 'Flytrap'
}
local PetTable2 = {
    ['sheep'] = 1,
    ['lizard'] = 2,
    ['crab'] = 3,
    ['tiger'] = 4,
    ['rabbit'] = 5,
    ['mandy'] = 6,
    ['flytrap'] = 7
}

local PetMagicAttack = T{'Gloom Spray','Fireball','Acid Spray','Molting Plumage','Cursed Sphere','Nectarous Deluge','Charged Whisker','Nepenthic Plunge'}
local PetMagicAccuracy = T{'Toxic Spit','Acid Spray','Leaf Dagger','Venom Spray','Venom','Dark Spore','Sandblast','Dust Cloud','Stink Bomb','Slug Family','Intimidate','Gloeosuccus','Spider Web','Filamented Hold','Choke Breath','Blaster','Snow Cloud','Roar','Palsy Pollen','Spore','Brain Crush','Choke Breath','Silence Gas','Chaotic Eye','Sheep Song','Soporific','Predatory Glare','Sudden Lunge','Numbing Noise','Jettatura','Bubble Shower','Spoil','Scream','Noisome Powder','Acid Mist','Rhinowrecker','Swooping Frenzy','Venom Shower','Corrosive Ooze','Spiral Spin','Infrasonics','Hi-Freq Field','Purulent Ooze','Foul Waters','Sandpit','Infected Leech','Pestilent Plume'}

local petActionDelay = 0

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local player = gData.GetPlayer()
    local action = gData.GetAction()

    if (action.Name == 'Charm') then
        gFunc.EquipSet(sets.Charm)
    elseif (action.Name == 'Reward') then
        gFunc.EquipSet(sets.Reward)

        local hasStatus1 = gData.GetBuffCount('Paralyze') > 0 or gData.GetBuffCount('Poison') > 0 or gData.GetBuffCount('Blind') > 0
        if (hasStatus1) then
            gFunc.EquipSet(sets.Reward_Status_1)
        end
        local hasStatus2 = gData.GetBuffCount('Weight') > 0 or gData.GetBuffCount('Slow') > 0 or gData.GetBuffCount('Silence') > 0
        if (hasStatus2) then
            gFunc.EquipSet(sets.Reward_Status_2)
        end

        if (player.MainJobSync >= 72) then
            gFunc.Equip('Ammo', 'Pet Food Zeta')
        elseif (player.MainJobSync >= 60) then
            gFunc.Equip('Ammo', 'Pet Fd. Epsilon')
        elseif (player.MainJobSync >= 48) then
            gFunc.Equip('Ammo', 'Pet Food Delta')
        elseif (player.MainJobSync >= 36) then
            gFunc.Equip('Ammo', 'Pet Fd. Gamma')
        elseif (player.MainJobSync >= 24) then
            gFunc.Equip('Ammo', 'Pet Food Beta')
        else
            gFunc.Equip('Ammo', 'Pet Food Alpha')
        end
    elseif (action.Name == 'Call Beast') then
        gFunc.EquipSet(sets.Call_Beast)
        local pet = gcdisplay.GetCycle('Pet')
        if (pet == 'Sheep') then
            if (player.MainJobSync >= 43) then
                gFunc.Equip('Ammo', 'S. Herbal Broth')
            elseif (player.MainJobSync >= 23) then
                gFunc.Equip('Ammo', 'Herbal Broth')
            else
                print(chat.header('Ashitacast'):append(chat.message('Level too low...')))
            end
        elseif (pet == 'Lizard') then
            if (player.MainJobSync >= 53) then
                gFunc.Equip('Ammo', 'C. Carrion Broth')
            elseif (player.MainJobSync >= 33) then
                gFunc.Equip('Ammo', 'Carrion Broth')
            else
                print(chat.header('Ashitacast'):append(chat.message('Level too low...')))
            end
        elseif (pet == 'Crab') then
            if (player.MainJobSync >= 23) then
                gFunc.Equip('Ammo', 'Fish Oil Broth')
            else
                print(chat.header('Ashitacast'):append(chat.message('Level too low...')))
            end
        elseif (pet == 'Tiger') then
            if (player.MainJobSync >= 51) then
                gFunc.Equip('Ammo', 'W. Meat Broth')
            elseif (player.MainJobSync >= 28) then
                gFunc.Equip('Ammo', 'Meat Broth')
            else
                print(chat.header('Ashitacast'):append(chat.message('Level too low...')))
            end
        elseif (pet == 'Rabbit') then
            if (player.MainJobSync >= 43) then
                gFunc.Equip('Ammo', 'F. Carrot Broth')
            else
                print(chat.header('Ashitacast'):append(chat.message('Level too low...')))
            end
        elseif (pet == 'Mandy') then
            if (player.MainJobSync >= 23) then
                gFunc.Equip('Ammo', 'Alchemist Water')
            else
                print(chat.header('Ashitacast'):append(chat.message('Level too low...')))
            end
        elseif (pet == 'Flytrap') then
            if (player.MainJobSync >= 53) then
                gFunc.Equip('Ammo', 'N. Grass. Broth')
            elseif (player.MainJobSync >= 28) then
                gFunc.Equip('Ammo', 'Grasshopper Broth')
            else
                print(chat.header('Ashitacast'):append(chat.message('Level too low...')))
            end
        end
    elseif (action.Type == 'Ready') then
        petActionDelay = os.clock()
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gcmelee.DoPreshot(sets.Preshot, gFunc.Combine(sets.Preshot, sets.Ranged), snapShotValue)
end

profile.HandleMidshot = function()
    gcmelee.DoMidshot(sets, gFunc.Combine(sets.Preshot, sets.Ranged))
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()
end

profile.OnLoad = function()
    gcinclude.SetAlias(pets)
    gcinclude.SetAlias(T{'nextpet'})
    gcdisplay.CreateCycle('Pet', PetTable1)
    gcmelee.Load(3.00)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(pets)
    gcinclude.ClearAlias(T{'nextpet'})
end

profile.HandleCommand = function(args)
    if (pets:contains(args[1])) then
        gcdisplay.SetCycleIndex('Pet', PetTable2[args[1]])
        gcinclude.Message('Pet', gcdisplay.GetCycle('Pet'))
    elseif (args[1] == 'nextpet') then
        gcdisplay.AdvanceCycle('Pet')
        gcinclude.Message('Pet', gcdisplay.GetCycle('Pet'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

local MPJobs = T{ 'RDM','BLM','WHM','SMN' }

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local player = gData.GetPlayer()
    if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        local sub = gData.GetEquipment().Sub
        if (sub ~= nil) then
            if (sub.Resource.Slots == 3) then -- if this is a 1h weapon
                gFunc.EquipSet('TP_NIN')
            end
        end
    end

    local isMPSJ = MPJobs:contains(player.SubJob)
    if (player.MP < 50 and isMPSJ) then
        gFunc.EquipSet('gaudy_harness')
    end

    gcmelee.DoDefaultOverride()

    local petAction = gData.GetPetAction()
    if (petAction ~= nil and os.clock() - petActionDelay > petActionEquipmentDelay) then
        gFunc.EquipSet(sets.Ready_Physical)
        if (PetMagicAttack:contains(petAction) or PetMagicAccuracy:contains(petAction)) then
            gFunc.EquipSet(sets.Ready_Magic)
        end
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
