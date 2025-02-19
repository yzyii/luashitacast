local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local gaudy_harness = true

-- Replace these with '' if you do not have them
local muscle_belt = ''

local sets = {
    Idle = {},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_HighAcc = {},
    TP_NIN = {},
    TP_Mjollnir_Haste = {},

    WS = {},
    WS_HighAcc = {},

    Charm = {},
    Reward = {},
    Ready_Physical = {},
    Ready_Magic = {},
    Call_Beast = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 5')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

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
    local player = gData.GetPlayer()
    local action = gData.GetAction()

    if (action.Name == 'Charm') then
        gFunc.EquipSet(sets.Charm)
    elseif (action.Name == 'Reward') then
        gFunc.EquipSet(sets.Reward)
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
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()
end

profile.OnLoad = function()
    gcinclude.SetAlias(pets)
    gcdisplay.CreateCycle('Pet', PetTable1)
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(pets)
end

profile.HandleCommand = function(args)
    if (pets:contains(args[1])) then
        gcdisplay.SetCycleIndex('Pet', PetTable2[args[1]])
        gcinclude.Message('Pet', gcdisplay.GetCycle('Pet'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (player.Status == 'Idle' and player.HPP < 50 and muscle_belt ~= '') then
        gFunc.Equip('Waist', muscle_belt)
    end
    if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        gFunc.EquipSet('TP_NIN')
    end

    gcmelee.DoDefaultOverride()

    if (player.MP < 50 and (player.SubJob == 'WHM' or player.SubJob == 'BLM' or player.SubJob == 'RDM')) then
        if (gaudy_harness) then
            gFunc.Equip('Body', 'Gaudy Harness')
        end
    end

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
