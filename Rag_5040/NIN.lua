local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local shinobi_ring = true
local shinobi_ring_slot = 'Ring2'

local koga_tekko = false
local koga_tekko_plus_one = true

local NinDebuffs = T{ 'Kurayami: Ni', 'Hojo: Ni', 'Jubaku: Ichi', 'Dokumori: Ichi' }
local DrkDebuffs = T{ 'Bind', 'Sleep', 'Poison' }
local NinElemental = T{ 'Hyoton: Ni', 'Katon: Ni', 'Huton: Ni', 'Doton: Ni', 'Raiton: Ni', 'Suiton: Ni' }

local sets = {
    Idle = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Kirin\'s Osode',
        Hands = 'Seiryu\'s kote',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Sniper\'s Ring +1',
        Back = 'Amemet Mantle +1',
        Waist = 'Koga Sarashi',
        Legs = 'Koga Hakama',
        Feet = 'Ninja Kyahan',
    },
    IdleALT = {
    },
    Resting = {
    },
    Town = {},
    Movement = {
        Feet = 'Ninja Kyahan',
    },

    DT = {
        Main = 'Earth Staff',
        Sub = '',
        Range = '',
        Ammo = 'Happy Egg',
        Head = 'Arh. Jinpachi +1',
        Neck = 'Evasion Torque',
        Ear1 = 'Ethereal earring',
        Ear2 = 'Suppanomimi',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Arhat\'s Hakama +1',
        Feet = 'Koga Kyahan',
    },
    MDT = { -- Shell IV provides 23% MDT
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar',
        Hands = 'Denali Wristbands',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
    },
    FireRes = {
        Main = 'Water Staff', -- 15
        Sub = '',
        Range = '',
        Ammo = 'Happy Egg',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Triumph Earring', -- 11
        Ear2 = 'Ethereal Earring',
        Body = 'Republic Harness', -- 5
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Ruby Ring', -- 10
        Ring2 = 'Ruby Ring', -- 10
        Back = 'Dino Mantle',
        Waist = 'Water Belt', -- 0
        Legs = 'Raptor Trousers', -- 3
        Feet = 'Suzaku\'s Sune-Ate', -- 50
    },
    IceRes = {
        Main = 'Vulcan\'s Staff', -- 20
        Sub = '',
        Range = '',
        Ammo = 'Happy Egg',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Crimson Earring', -- 10
        Ear2 = 'Crimson Earring', -- 10
        Ring1 = 'Diamond Ring', -- 9
    },
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {
        Range = '',
        Ammo = 'Happy Egg',
        Head = 'Optical Hat', -- 10
        Neck = 'Evasion Torque', -- 7
        Ear1 = 'Ethereal Earring', -- 3
        Ear2 = 'Suppanomimi', -- 3
        Body = 'Scorpion Harness', -- 10
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Breeze Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Scouter\'s Rope', -- 4
        Legs = 'Koga Hakama', -- 10
        Feet = 'Dance Shoes',
    },

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi cooldown
        Head = 'Panther Mask',
        Hands = 'Dusk Gloves',
        Ring1 = 'Shinobi Ring',
        Waist = 'Koga Sarashi',
        Feet = 'Fuma Sune-Ate',
        Neck = 'Harmonia\'s Torque',
        Body = 'Arhat\'s Gi +1',
        Ring2 = 'Bomb Queen Ring',
    },

    Hate = {
        Head = 'Arh. Jinpachi +1',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Ethereal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Arhat\'s Gi +1',
        Hands = 'Dusk Gloves',
        Ring2 = 'Mermaid Ring',
        Waist = 'Warwolf Belt',
        Legs = 'Arhat\'s Hakama',
    },
    NinDebuff = {
        Head = 'Ninja Hatsuburi',
        Neck = 'Ninjutsu Torque',
        Body = 'Kirin\'s Osode',
        Hands = 'Dusk Gloves',
        Waist = 'Warwolf Belt',
        Feet = 'Koga Kyahan',
    },
    NinElemental = {
        Head = 'Koga Hatsuburi',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Moldavite Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Dusk Gloves',
        Waist = 'Warwolf Belt',
        Feet = 'Koga Kyahan',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Panther Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Suppanomimi',
        Body = 'Ninja Chainmail',
        Hands = 'Dusk Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Sniper\'s Ring +1',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },
    TP_HighAcc = {},
    WS = {
        Head = 'Shr.Znr.Kabuto',
        Neck = 'Peacock Amulet',
        Ear1 = 'Suppanomimi',
        Ear2 = 'Brutal Earring',
        Body = 'Haubergeon',
        Hands = 'Bandomusha Kote',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Flame Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Warwolf Belt',
        Legs = 'Ryl.Kgt Breeches',
        Feet = 'Luisant Sollerets',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

profile.HandleAbility = function()
    gFunc.EquipSet(sets.Hate);
end

profile.HandleItem = function()
    -- You may add logic here
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    local environment = gData.GetEnvironment()
    if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
        gFunc.Equip('Hands', 'Koga Tekko')
    end
    if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
        gFunc.Equip('Hands', 'Kog. Tekko +1')
    end
end

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (player.Status == 'Engaged') then
        if (shinobi_ring and player.HPP <= 75 and player.TP <= 1000) then
            gFunc.Equip(shinobi_ring_slot, 'Shinobi Ring')
        end
        if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Hands', 'Koga Tekko')
        end
        if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Hands', 'Kog. Tekko +1')
        end
    end

    gcmelee.DoDefaultOverride()
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()

    if (action.Skill == 'Ninjutsu') then
        if (NinDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.NinDebuff);
        elseif (NinElemental:contains(action.Name)) then
            gFunc.EquipSet(sets.NinElemental);
        end
    elseif (action.Skill == 'Enfeebling Magic') then
        if (DrkDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate);
        end
    end
end

return profile
