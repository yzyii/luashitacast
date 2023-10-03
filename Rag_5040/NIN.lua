--[[
    This is provided purely as an example template. Only very basic sanity testing has been done.
]]

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
        Main = '',
        Sub = '',
        Ammo = 'Bomb core',
        Head = 'Panther Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Haubergeon +1',
        Hands = 'Kog. Tekko +1',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Ninja Kyahan',
	},
    IdleALT = {
		Main = '',
        Sub = '',
        Ammo = 'Happy Egg',
        Head = 'Arhat\'s Jinpachi',
        Neck = 'Evasion Torque',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Pigeon Earring',
        Body = 'Arhat\'s Gi',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Ninja Kyahan',
	},
    Resting = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = 'Koga Hatsuburi',
        Neck = 'Evasion Torque',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Pigeon Earring',
        Body = 'War Shinobi Gi',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Koga Sarashi',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Ninja Kyahan',
	},
    Town = {},
    Movement = {
		Feet = 'Ninja Kyahan',
	},

    DT = {
	    Main = 'Earth Staff',
        Sub = '',
        Ammo = 'Happy Egg',
        Head = 'Arhat\'s Jinpachi',
        Neck = 'Evasion Torque',
        Ear1 = 'Pigeon Earring',
        Ear2 = 'Pigeon Earring',
        Body = 'Arhat\'s Gi',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Suzaku\'s Sune-Ate',
	},
    MDT = { -- Shell IV provides 23% MDT
		Main = 'Earth Staff',
        Head = 'Green Ribbon +1',
        Neck = 'Elemental Charm',
    },
    FireRes = {
		Main = 'Water Staff', -- 15
		Ammo = 'Happy Egg',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Elemental Charm', -- 6
        Ear1 = 'Ruby Earring', -- 10
        Ear2 = 'Ruby Earring', -- 10
		Body = 'Bastokan Harness', -- 5
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Jelly Ring', -- 0
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Gigant Mantle',
        Waist = 'Warwolf Belt', -- 0
		Legs = 'Raptor Trousers', -- 3
        Feet = 'Suzaku\'s Sune-Ate', -- 50
	},
    IceRes = {
	    Main = 'Fire Staff', -- 15
		Ammo = 'Happy Egg',
        Head = 'Ninja Hatsuburi', -- 10
        Neck = 'Elemental Charm', -- 6
        Ear1 = 'Ruby Earring', -- 10
        Ear2 = 'Ruby Earring', -- 10
		Body = 'Northern Jerkin', -- 6
		Hands = 'Seiryu\'s Kote',
        Ring1 = 'Diamond Ring', -- 9
        Ring2 = 'Diamond Ring', -- 9
        Back = 'Gigant Mantle',
        Waist = 'Warwolf Belt', -- 0
		Legs = 'Tiger Trousers', -- 4
		Feet = 'Suzaku\'s Sune-Ate',
	},
    LightningRes = {
	    Main = 'Earth Staff', -- 15
		Ammo = 'Happy Egg',
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Elemental Charm', -- 6
        Ear1 = 'Pigeon Earring', -- 0
        Ear2 = 'Pigeon Earring', -- 0
		Body = 'Arhat\'s Gi', -- 0
		Hands = 'Seiryu\'s Kote',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Warwolf Belt', -- 0
		Legs = 'Byakko\'s Haidate', -- 50
		Feet = 'Ninja Kyahan',	
	},
    EarthRes = {},
    WindRes = {},
	Evasion = {
		Main = 'Wind Staff', -- 10
		Ammo = 'Happy Egg',
        Head = 'Optical Hat', -- 10
        Neck = 'Evasion Torque', -- 7
        Ear1 = 'Dodge Earring', -- 3
        Ear2 = 'Dodge Earring', -- 3
		Body = 'Scorpion Harness', -- 10
		Hands = 'Seiryu\'s Kote',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Koga Sarashi', -- 4
		Legs = 'Koga Hakama', -- 10
		Feet = 'Fuma Sune-ate',
	},

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi cooldown
	    Head = 'Panther Mask',
        Hands = 'Dusk Gloves',
        Ring1 = 'Shinobi Ring',
        Waist = 'Koga Sarashi',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
        Neck = 'Evasion Torque',
        Ear1 = 'Eris\' Earring',
        Ear2 = 'Eris\' Earring',
        Body = 'Arhat\'s Gi',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
    },

	Hate = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = 'Arhat\'s Jinpachi',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Eris\' Earring',
        Ear2 = 'Eris\' Earring',
        Body = 'Arhat\'s Gi',
        Hands = 'Arhat\'s Tekko',
        Ring1 = '',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Arhat\'s Hakama',
        Feet = 'Yasha Sune-Ate',
    },
	NinDebuff = {
        Main = '',
        Sub = '',
        Ammo = '',
        Head = 'Ninja Hatsuburi',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Eris\' Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Arhat\'s Gi',
        Hands = 'Dusk Gloves',
        Ring1 = 'Shinobi Ring',
        Ring2 = 'Bomb Queen Ring',
        Waist = 'Koga Sarashi',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Koga Kyahan',
	},
	NinElemental = {
        Main = '',
        Head = 'Koga Hatsuburi',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Eris\' Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Arhat\'s Gi',
        Hands = 'Kog. Tekko +1',
        Ring1 = 'Diamond Ring',
        Ring2 = 'Diamond Ring',
        Waist = 'Koga Sarashi',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Koga Kyahan',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

	TP_LowAcc = {
        Main = '',
        Sub = '',
        Ammo = 'Bomb core',
        Head = 'Panther Mask',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Ninja Chainmail',
        Hands = 'Dusk Gloves',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },
    TP_HighAcc = {
        Main = '',
        Sub = '',
        Ammo = 'Bomb core',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Haubergeon +1',
        Hands = 'Dusk Gloves',
        Ring1 = 'Sniper\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },
	WS = {
        Main = '',
        Sub = '',
        Ammo = 'Bomb core',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Spike Earring',
        Body = 'Haubergeon +1',
        Hands = 'Ninja Tekko',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Life Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fed. Kyahan',
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

	if (koga_tekko and environment.Time < 6 and environment.Time >= 18) then
		gFunc.Equip('Hands', 'Koga Tekko')
	end
	if (koga_tekko_plus_one and environment.Time < 7 and environment.Time >= 17) then
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
		if (koga_tekko and environment.Time < 6 and environment.Time >= 18) then
			gFunc.Equip('Hands', 'Koga Tekko')
		end
		if (koga_tekko_plus_one and environment.Time < 7 and environment.Time >= 17) then
			gFunc.Equip('Hands', 'Kog. Tekko +1')
		end
	end
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
