local profile = {}

local fastCastValue = 0.02 -- 0% from gear listed in Precast set
local snapShotValue = 0.00 -- 0% from gear listed in Preshot set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local gaudy_harness = {
    -- Body = 'Gaudy Harness',
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
        Ring2 = 'Sattva Ring',
        Back = 'Shadow Mantle',
        Waist = 'Ocean Rope',
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 },
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {},
    Resting = {
        Neck = 'Paisley Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Sanative Earring',
        -- Hands = 'Shep. Bracers',
        Legs = 'Mst. Trousers',
        -- Feet = 'Shep. Boots',
    },
    Town = {},
    Movement = {},
    Movement_TP = {
        Hands = 'Dst. Mittens +1',
        Feet = 'Dst. Leggings +1',
    },

    DT = {},
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},
    Override = { -- Toggled with either /override or /or. Overrides idle set. Used for sets such as crafting, HELM, fishing, virtue stone, and more.
        Body = 'Field Tunica',
        Hands = 'Field Gloves',
        Legs = 'Field Hose',
        Feet = 'Field Boots'
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
    },
    SIRD = { -- Only used for Idle sets and not while Override sets are active
        Neck = 'Willpower Torque',
        Ear2 = 'Magnetic Earring',
        Feet = 'Mountain Gaiters',
    },
    Haste = { -- Used for Utsusemi cooldown
        Head = 'Panther Mask +1',
        Ear1 = 'Loquac. Earring',
        Hands = 'Dusk Gloves +1',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Panther Mask +1',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon +1',
        Hands = 'Dusk Gloves +1',
        -- Ring1 = 'Toreador\'s Ring',
        Ring1 = 'Begrudging Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens +1',
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {
        Head = 'Maat\'s Cap',
        Ring1 = 'Toreador\'s Ring',
        Waist = 'Life Belt',
    },
    TP_NIN = {
        Ear2 = 'Stealth Earring',
    },

    WS = {
        Head = 'Maat\'s Cap',
        -- Neck = 'Breeze Gorget',
        Neck = 'Temp. Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Hecatomb Harness',
        -- Hands = 'Alkyoneus\'s Brc.',
        Hands = 'Hecatomb Mittens',
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        -- Legs = 'Bst. Trousers +1',
        Legs = 'Dusk Trousers',
        Feet = 'Hct. Leggings',
    },
    WS_HighAcc = {
        Neck = 'Peacock Amulet',
        Hands = 'Hecatomb Mittens',
        -- Ring1 = 'Toreador\'s Ring',
        Ring1 = 'Begrudging Ring',
        Ring2 = 'Toreador\'s Ring',
        Waist = 'Life Belt',
        Legs = 'Byakko\'s Haidate',
    },

    Charm = {
        Head = 'Monster Helm',
        Neck = 'Temp. Torque',
        Body = 'Monster Jackcoat +1',
		Hands = 'Monster Gloves',
        Ring1 = 'Heavens Ring',
        Ring2 = 'Heavens Ring',
        Waist = 'Ryl.Kgt. Belt',
        -- Legs = 'Bst. Trousers +1',
        Feet = 'Monster Gaiters',
    },
    Reward = {
        -- Head = 'Bison Warbonnet',
        Neck = 'Faith Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Ogre Gloves +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        -- Back = 'Ryl. Army Mantle',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Magic Cuisses',
        Feet = 'Monster Gaiters',
    },
    Reward_Status_1 = { -- Paralyze, Poison, Blind
        Body = 'Monster Jackcoat +1',
    },
    Reward_Status_2 = { -- Weight, Slow, Silence
        Body = 'Monster Jackcoat +1',
    },
    Ready_Physical = {
        -- Head = 'Shep. Bonnet',
        -- Body = 'Shep. Doublet',
        -- Feet = 'Shep. Boots',
    },
    Ready_Magic = {
        Head = 'Beast Helm +1',
        -- Body = 'Shep. Doublet',
        -- Feet = 'Shep. Boots',
    },
    Call_Beast = {
		Hands = 'Monster Gloves',
    },

    Weapon_Loadout_1 = {
		Main = 'Martial Axe',
		Sub = 'Maneater',
        Ammo = 'Tiphia Sting',
    },
    Weapon_Loadout_2 = {
		Main = 'Maneater',
		Sub = 'Temperance Axe',
        Ammo = 'Virtue Stone',
    },
    Weapon_Loadout_3 = {
		Main = 'Maneater',
		-- Sub = 'Tatami Shield',
        Ammo = 'Tiphia Sting',
    },

    Preshot = {}, -- This set is pointless until ToAU+ when Snapshot on equipment is available
    Ranged = {
        Ammo = 'Pebble',
    },

    VileElixir = {},
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
    gcmelee.Load()
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
    if (petAction ~= nil) then
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
