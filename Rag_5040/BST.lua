local profile = {}

local fastCastValue = 0.00 -- 0% from gear

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
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_HighAcc = {},

    WS = {},

    Charm = {},
    Reward = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

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
        local pet = gcdisplay.GetCycle('Pet')
        if (pet == 'Sheep') then
            if (player.MainJobSync >= 43) then
                gFunc.Equip('Ammo', 'S.Herbal Broth')
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
        end
    end
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
end

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

local pets = T{'sheep','lizard','crab','tiger'}

local PetTable1 = {
    [1] = 'Sheep',
    [2] = 'Lizard',
    [3] = 'Crab',
    [4] = 'Tiger'
}
local PetTable2 = {
    ['sheep'] = 1,
    ['lizard'] = 2,
    ['crab'] = 3,
    ['tiger'] = 4
}

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()

    gcinclude.SetAlias(pets)
    local function createCycle()
        gcdisplay.CreateCycle('Pet', PetTable1)
    end
    createCycle:once(2)
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(pets)
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)
    if (pets:contains(args[1])) then
        gcdisplay.SetCycleIndex('Pet', PetTable2[args[1]])
        gcinclude.Message('Pet', gcdisplay.GetCycle('Pet'))
    else
        gcmelee.DoCommands(args)
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()
    gcmelee.DoDefaultOverride()

    local player = gData.GetPlayer()
    if (player.MP < 50 and (player.SubJob == 'WHM' or player.SubJob == 'BLM' or player.SubJob == 'RDM')) then
        if (gaudy_harness) then
            gFunc.Equip('Body', 'Gaudy Harness')
        end
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
