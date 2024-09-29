local profile = {}

local fastCastValue = 0.07 -- 7% from gear

local parade_gorget = true

local hercules_ring = true
local hercules_ring_slot = 'Ring1'

-- Replace these with '' if you do not have them
local gallant_leggings = 'Glt. Leggings +1'
local valor_leggings = 'Vlr. Leggings +1'

local arco_de_velocidad = true

local warlocks_mantle = true -- Don't add 2% to fastCastValue to this as it is SJ dependant

local sets = {
    Idle = {
        Main = 'Durandal',
        -- Sub = 'Master Shield',
        Sub = 'Palmerin\'s Shield',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'displaced',
        Body = 'Royal Cloak',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Merman\'s Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 },
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'displaced',
        Body = 'Royal Cloak',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Merman\'s Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 },
        Feet = 'Dst. Leggings +1',
    },
    IdleDT = {
        Main = 'Durandal',
        -- Sub = 'Master Shield',
        Sub = 'Palmerin\'s Shield',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = { Name = 'Shield Torque', Priority = 100 },
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Hands = 'Heavy Gauntlets', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 }, -- 3
        Feet = { Name = 'Glt. Leggings +1', Priority = 90 },
    },
    IdleALTDT = {
        Main = 'Terra\'s Staff', -- 20
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Heavy Gauntlets', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 }, -- 3
        Feet = 'Dst. Leggings +1', -- 2
    },
    Resting = {
        Main = 'Pluto\'s Staff',
        Sub = '',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
    },
    Town = {
        Main = 'Justice Sword',
        Sub = 'Koenig Shield',
        Head = 'Darksteel Cap +1',
        Body = 'Haubergeon',
        Hands = 'Homam Manopolas',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    Movement = {
        Legs = 'Blood Cuisses',
    },

    DT = {
        Main = 'Terra\'s Staff', -- 20
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Hands = 'Heavy Gauntlets', -- 2
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Dst. Subligar +1', Priority = 10 }, -- 3
        Feet = 'Dst. Leggings +1', -- 2
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Durandal',
        -- Sub = 'Master Shield',
        Sub = 'Palmerin\'s Shield', -- 2
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Darksteel Cap +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Cor. Scale Mail +1', -- 4
        Hands = 'Coral Fng. Gnt. +1', -- 2
        Ring1 = 'Merman\'s Ring', -- 4
        Ring2 = { Name = 'Sattva Ring', Priority = 100 }, -- 5
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Warwolf Belt',
        Legs = 'Coral Cuisses +1', -- 3
        Feet = 'Coral Greaves +1', -- 2
    },
    FireRes = { -- 150
        Main = 'Durandal',
        Sub = 'Nms. Shields +1', -- 15
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = { -- 153
        Main = 'Vulcan\'s Staff', -- 20
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Ram Mantle +1', -- 6
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
    },
    LightningRes = { -- 151
        Main = 'Durandal',
        Sub = 'Nms. Shields +1', -- 15
        Range = 'Lightning Bow +1', -- 7
        Ammo = '',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Gaia Mantle +1', -- 12
        Waist = 'Earth Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Dst. Leggings +1',
    },
    EarthRes = { -- 156
        Main = 'Auster\'s Staff', -- 20
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Gaia Mantle +1', -- 10
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
    },
    WindRes = { -- 136
        Main = 'Aquilo\'s Staff', -- 20
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Ice Belt', -- 20
        Legs = 'Coral Cuisses +1',
        Feet = 'Blood Greaves', -- 21
    },
    WaterRes = { -- 146
        Main = 'Jupiter\'s Staff', -- 20
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1', -- 4
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Lightning Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Coral Greaves +1', -- 4
    },
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Legs = 'Homam Cosciales',
    },
    SIRD = {
        Main = 'Durandal',
        -- Sub = 'Master Shield',
        Sub = 'Palmerin\'s Shield',
        Head = 'Koenig Schaller',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Magnetic Earring', -- 8
        Ear2 = 'Knightly Earring', -- 9
        Body = 'Dst. Harness +1',
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Merman\'s Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Vlr. Breeches +1', -- 10
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = {
        Main = 'Capricorn Staff', -- 5
        Sub = 'remove',
        Head = 'Homam Zucchetto', -- 3
        Neck = 'Willpower Torque',
        Ear1 = 'Loquac. Earring', -- FC
        Ear2 = 'Magnetic Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dusk Gloves +1', -- 4
        Ring1 = 'Blitz Ring', -- 1
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt', -- 6
        Legs = 'Homam Cosciales', -- 3
        Feet = 'Homam Gambieras', -- 3
    },
    Haste_Ichi = { -- Optional, provided here only if you wish to mix in SIRD or other stats over max haste
    },

    Hate = {
        Main = 'Durandal',
        Sub = 'Koenig Shield',
        Head = 'Aegishjalmr',
        -- Head = 'Bahamut\'s Mask',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hades Earring +1',
        Ear2 = { Name = 'Bloodbead Earring', Priority = 100 },
        Body = { Name = 'Hydra Haubert', Priority = -100 },
        Hands = { Name = 'Hydra Moufles', Priority = -100 },
        Ring1 = 'Hercules\' Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Hydra Brayettes', Priority = -100 },
        Feet = 'Vlr. Leggings +1',
    },
    Hate_Flash = { -- Optional, provided here only if you wish to mix in haste or other stats over max +enmity
        Main = 'Durandal',
        Sub = 'Koenig Shield',
        Head = 'Homam Zucchetto',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Hades Earring +1',
        Body = { Name = 'Hydra Haubert', Priority = -100 },
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Hercules\' Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Sonic Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    Cheat_C3HPDown = {
        Main = 'Durandal',
        -- Sub = 'Master Shield',
        Sub = 'Palmerin\'s Shield',
        Range = 'Lightning Bow +1',
        Ammo = '',
        Head = 'Faerie Hairpin',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Magnetic Earring', -- 8
        Ear2 = 'Knightly Earring', -- 9
        Body = 'Hydra Haubert',
        Hands = 'Hydra Moufles',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Vlr. Breeches +1', -- 10
        Feet = 'Mountain Gaiters', -- 5
    },
    Cheat_C3HPUp = {
        Main = 'Apollo\'s Staff',
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Aegishjalmr',
        -- Head = 'Bahamut\'s Mask',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Hades Earring +1',
        Body = { Name = 'Hydra Haubert', Priority = -100 },
        Hands = { Name = 'Hydra Moufles', Priority = -100 },
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = { Name = 'Hydra Brayettes', Priority = -100 },
        Feet = 'Vlr. Leggings +1',
    },
    Cheat_C4HPDown = {
        Main = 'Durandal',
        -- Sub = 'Master Shield',
        Sub = 'Palmerin\'s Shield',
        Range = 'Lightning Bow +1',
        Ammo = '',
        Head = 'Faerie Hairpin',
        Neck = 'Star Necklace',
        Ear1 = 'Magnetic Earring', -- 8
        Ear2 = 'Knightly Earring', -- 9
        Body = 'Hydra Haubert',
        Hands = 'Hydra Moufles',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Hydra Brayettes',
        Feet = 'Mountain Gaiters', -- 5
    },
    Cheat_C4HPUp = {
        Main = 'Apollo\'s Staff',
        Sub = '',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Aegishjalmr',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Hades Earring +1',
        Body = 'Vlr. Surcoat +1',
        Hands = 'Vlr. Gauntlets +1',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Vlr. Breeches +1',
        Feet = 'Vlr. Leggings +1',
    },

    LockSet1 = {
        Main = 'Justice Sword',
        Sub = 'Koenig Shield',
        Head = 'Darksteel Cap +1',
        Body = 'Haubergeon',
        Hands = 'Homam Manopolas',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Main = 'Joyeuse',
        Sub = 'Koenig Shield',
        Range = '',
        Ammo = 'Tiphia Sting',
        Head = 'Homam Zucchetto',
        Neck = 'Fortitude Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    TP_HighAcc = {},

    WS = {
        Head = 'Optical Hat',
        Neck = 'Soil Gorget',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon',
        -- Hands = 'Alkyoneus\'s Brc.',
        Hands = 'Tarasque Mitts +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Sonic Belt',
        Legs = 'Vlr. Breeches +1',
        Feet = 'Rutter Sabatons',
    },
    WS_Spirits = {},

    Cover = {
        Head = 'Gallant Coronet',
        Body = 'Vlr. Surcoat +1',
    },
    Cure = {
        Main = 'Apollo\'s Staff',
        Ear1 = 'Hospitaler Earring',
    },
    Rampart = { -- Rampart gives VIT x2 damage shield in era
        Main = 'Durandal',
        Sub = 'Koenig Shield',
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Koenig Schaller',
        Neck = 'Fortitude Torque',
        Ear1 = 'Robust Earring',
        Ear2 = 'Robust Earring',
        Body = 'Gaia Doublet',
        Hands = 'Kng. Handschuhs',
        Ring1 = 'Robust Ring',
        Ring2 = { Name = 'Sattva Ring', Priority = 100 },
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Warwolf Belt',
        Legs = 'Beak Trousers +1',
        Feet = 'Power Sandals',
    },
    ShieldBash = {
        Ear2 = 'Knightly Earring',
        Hands = 'Vlr. Gauntlets +1',
    },
    Enhancing = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //shieldbash')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //holy')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Chivalry') then
        return
    end

    gFunc.EquipSet(sets.Hate)

    if (action.Name == 'Holy Circle' and gallant_leggings ~= '') then
        gFunc.Equip('Legs', gallant_leggings)
    elseif (action.Name == 'Rampart') then
        gFunc.EquipSet(sets.Rampart)
    elseif (action.Name == 'Shield Bash' and valor_gauntlets ~= '') then
        gFunc.EquipSet(sets.ShieldBash)
    elseif (action.Name == 'Sentinel' and valor_leggings ~= '') then
        gFunc.Equip('Legs', valor_leggings)
    elseif (action.Name == 'Cover') then
        gFunc.EquipSet(sets.Cover)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    gcmelee.DoFenrirsEarring()

    local action = gData.GetAction()
    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    gcmelee.SetIsDPS(false)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

local utsuBuffs = T{
    [66] = 1,
    [444] = 2,
    [445] = 3,
    [446] = 4,
}

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (player.SubJob == 'NIN') then
        local function GetShadowCount()
            for buffId, shadowCount in pairs(utsuBuffs) do
                if (gData.GetBuffCount(buffId) > 0) then
                    return shadowCount
                end
            end

            return 0
        end
        if (GetShadowCount() == 0) then
            gFunc.EquipSet('IdleDT')
            if (gcdisplay.IdleSet == 'Alternate') then gFunc.EquipSet('IdleALTDT') end
        end
    end

    local cover = gData.GetBuffCount('Cover')
    if (cover >= 1) then
        gFunc.EquipSet(sets.Cover)
    end

    if (arco_de_velocidad) then
        local environment = gData.GetEnvironment()
        if (environment.Time >= 6 and environment.Time < 18 and player.HPP < 100) then
            gFunc.Equip('Range', 'Arco de Velocidad')
        end
    end

    if (parade_gorget and player.HPP >= 85) then
        gFunc.Equip('Neck', 'Parade Gorget')
    end

    if (hercules_ring and player.HPP <= 50) then
        gFunc.Equip(hercules_ring_slot, 'Hercules\' Ring')
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == "RDM" and warlocks_mantle) then
        gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.Equip('Back', 'Warlock\'s Mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    if (action.Skill ~= 'Ninjutsu') then
        local sentinel = gData.GetBuffCount('Sentinel')
        if (sentinel >= 1) then
            gFunc.EquipSet(sets.Haste)
        else
            gFunc.EquipSet(sets.Hate)
            if (action.Name == 'Flash') then
                gFunc.EquipSet(sets.Hate_Flash)
            end
        end

        if (action.Skill == 'Healing Magic') then
            gFunc.EquipSet(sets.Cure)
        end
    else
        if (action.Name == 'Utusemi: Ichi') then
            gFunc.EquipSet(sets.Haste_Ichi)
        elseif (action.Name == 'Stoneskin' or action.Name == 'Phalanx') then
            gFunc.EquipSet(sets.Enhancing)
        end
    end

    if (target.Name == me) then
        if (action.Name == 'Cure III') then
            gFunc.InterimEquipSet(sets.Cheat_C3HPDown)
            gFunc.EquipSet(sets.Cheat_C3HPUp)
        elseif (action.Name == 'Cure IV') then
            gFunc.InterimEquipSet(sets.Cheat_C4HPDown)
            gFunc.EquipSet(sets.Cheat_C4HPUp)
        end
    end
end

return profile
