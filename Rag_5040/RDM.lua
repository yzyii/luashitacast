local profile = {};

local sets = {
    Idle = {
        Head = 'Duelist\'s Chapeau',
        Main = 'Terra\'s Staff',
        Legs = 'Blood Cuisses',
        Ring2 = 'Sattva Ring',
		Ear1 = 'Loquac. Earring',
        Ear2 = 'Ethereal Earring',
		Back = 'Umbra Cape',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Feet = 'Dst. Leggings +1',
	},
    Resting = {
        Head = 'Duelist\'s Chapeau',
	    Main = 'Pluto\'s Staff',
        Body = 'Mahatma Hpl.',
		Waist = 'Duelist\'s Belt',
        Legs = 'Baron\'s Slops',
	},
    Town = {
        Body = 'Mahatma Hpl.',
	},
    Dt = {
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
	},
    Movement = {
	},

    Precast = {
        Head = 'Warlock\'s Chapeau',
		Ear1 = 'Loquac. Earring',
	},

    Cure = {
        Head = 'Errant Hat',
        Neck = 'Healing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Errant Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Errant Pigaches',
    },
    Cursna = { -- Healing Magic
        Legs = 'Warlock\'s Tights',
	},
	
    Enhancing = {
        Main = 'Mythic Wand +1',
        Sub = 'Numinous Shield',
        Head = 'Errant Hat',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'Errant Pigaches',
    },
    Stoneskin = { -- Enhancing Skill and MND
	},

    Enfeebling = {
        Head = 'Duelist\'s Chapeau',
        Neck = 'Enfeebling Torque',
		Body = 'Warlock\'s Tabard',
        Hands = 'Nashira Gages',
        Back = 'Errant Cape',
        Waist = 'Swift Belt',
        Legs = 'Mahatma Slops',
        Feet = 'Errant Pigaches',
    },
    EnfeeblingMND = {
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
    },
    EnfeeblingINT = {
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Feet = 'Wise Pigaches',
    },
    FallbackEnfeeblingSub = {}, -- Used only when you do not have complete staff sets

    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Morion Earring +1',
        Body = 'Mahatma Hpl.',
        Hands = 'Nashira Gages',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Wise Pigaches',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Elemental Torque',
        Ear1 = 'Abyssal Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Mahatma Hpl.',
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Wise Pigaches',
    },
    NukeACC = { -- Also used for Elemental DoTs
        Legs = 'Duelist\'s Tights',
	};
	FallbackNukeSub = {}, -- Used only when you do not have complete staff sets

	BLMSJ = { -- Used for additional MACC when NukeACC is being used
        Ear2 = 'Wizard\'s Earring',
	};
	WHMSJ = { -- Used for -enmity on Curing
        Ear2 = 'Healer\'s Earring',
	};
	
	TP = {
        Main = 'Martial Anelace',
        Sub = 'Numinous Shield',
	},
	
	Convert = { -- Type /vert to equip this set and /lock your gear at the same time.
        Main = 'Apollo\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Faerie Hairpin',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Geist Earring',
        Body = 'Black Cotehardie',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Astral Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Errant Pigaches',
	},
};
profile.Sets = sets;

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcdisplay = gFunc.LoadFile('common\\gcdisplayrag.lua');
gcinclude = gFunc.LoadFile('common\\gcincluderag.lua');
gcmage = gFunc.LoadFile('common\\gcmage.lua');

profile.OnLoad = function()
    gcinclude.Load();
	profile.SetMacroBook();
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.DoCommands(args);
end

profile.HandleDefault = function()
    gcinclude.DoDefault();
end

profile.HandlePrecast = function()
    gcmage.DoPrecast();
end

profile.HandleMidcast = function()
    gcmage.DoMidcast();
end

return profile;
