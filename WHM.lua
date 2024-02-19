local profile = {}

local ElementalStaffTable = {
    Fire = "Fire Staff",
    Earth = "Earth Staff",
    Water = "Water Staff",
    Wind = "Water Staff",
    Ice = "Aquilo\'s Staff",
    Thunder = "Thunder Staff",
    Light = "Apollo\'s Staff",
    Dark = "Pluto\'s Staff",
}

local sets = {
    idle = {
        main = ElementalStaffTable["Earth"],
        ammo = "Fortune Egg",
        head = "",
        neck = "Evasion Torque",
        ear1 = "Merman's earring",
        ear2 = "Merman's earring",
        body = "",
        hands = "",
        Ring1 = "Merman's Ring",
        Ring2 = "Merman's Ring",
        back = "",
        waist = "",
        legs = "",
        feet = ""
    },

    resting = {
        main = ElementalStaffTable["Dark"],
        head = "",
        ear1 = "Relaxing Earring",
        neck = "Checkered Scarf",
        body = "Errant Hpl.",
        hands = "Serpentes Cuffs",
        ring1 = "Sheltered Ring",
        ring2 = "Paguroidea Ring",
        waist = "Duelist's Belt",
        legs = "Baron's Slops",
        feet = "Chelona Boots +1"
    },

    precast = {
        ear1 = "Loquacious Earring",
        feet = "Cure Clogs"
    },

    cure = {
        main = ElementalStaffTable["Light"],
        sub = "None",
        Head = 'Dls. Chapeau +1',
        neck = "Justice Badge",
        ear1 = "Novia Earring",
        ear2 = "Loquacious Earring",
        body = "Duelist's Tabard",
        hands = "Duelist's Gloves",
        ring1 = "Thunder Ring",
        ring2 = "San d'Orian Ring",
        back = "Altruistic Cape",
        waist = "Duelist's Belt",
        legs = "Warlock's Tights",
        feet = "Duelist's Boots +1"
    },

    enhancing = {
        body = "Glamor Jupon",
        hands = "Duelist's Gloves",
        legs = "Warlock's Tights",
    },

    Dilation = {
        body = "Glamor Jupon",
        hands = "Dls. Gloves +1",
        ring1 = "Dilation Ring",
        legs = "Warlock's Tights",
    },
    stoneskin = {
        Main = "Mythic Wand",
        Sub = "Numinous Shield",
        Head = "Warlock's Chapeau",
        Neck = "Justice Badge",
        Body = "Errant Hpl.",
        Hands = "Dls. Gloves +1",
        Back = "Rainbow Cape",
        Waist = "Hierarch Belt",
        Legs = "Warlock's Tights",
        Feet = "Errant Pigaches"
    },

    haste = {
        hands = "Dusk gloves",
        waist = "Swift belt"
    },

    enfeebling = {
        Head = "Dls. Chapeau +1",
        Neck = "Enfeebling Torque",
        Body = "Warlock's Tabard",
        Hands = "Mst.Cst. Bracelets",
        Ear1 = "Abyssal Earring",
        Ear2 = "Morion Earring",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Back = "Altruistic Cape",
        Legs = "Nashira Seraweels",
        Feet = "Wise Pigaches"
    },

    enfeebling_mnd = {
        Head = 'Dls. Chapeau +1',
        Neck = 'Faith Torque',
        Body = 'Warlock\'s Tabard',
        Hands = 'Mst.Cst. Bracelets',
        Waist = "Duelist's Belt",
        Back = 'Altruistic Cape',
        Legs = 'Nashira Seraweels',
        Feet = "Duelist's Boots+1",
    },
    enfeebling_int = {
        Head = 'Dls. Chapeau +1',
        Neck = 'Prudence Torque',
        Body = 'Warlock\'s Tabard',
        Hands = 'Mst.Cst. Bracelets',
        Ear1 = "Abyssal Earring",
        Ear2 = "Morion Earring",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Waist = "Duelist's Belt",
        Back = 'Altruistic Cape',
        Legs = 'Nashira Seraweels',
        Feet = 'Wise Pigaches',
    },
    dark = {
        main = "",
        sub = "",
        ammo = "",
        head = "",
        neck = "Prudence Torque",
        ear1 = "Abyssal Earring",
        ear2 = "Psystorm Earring",
        body = "Glamor Jupon",
        hands = "Crimson fng. gnt.",
        ring1 = "Snow Ring",
        ring2 = "Overlord's Ring",
        back = "Rainbow Cape",
        waist = "Duelist's Belt",
        legs = "Errant Slops",
        feet = "Wise Pigaches"
    },

    nuke = {
        Ammo = "Phtm. Tathlum",
        Head = "Warlock's Chapeau",
        Neck = "Prudence Torque",
        Ear1 = "Abyssal Earring",
        Ear2 = "Moldavite Earring",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Body = "Errant Hpl.",
        Hands = "Zenith Mitts",
        Back = "Rainbow Cape",
        Waist = "Duelist's Belt",
        Legs = "Duelist's Tights",
        Feet = "Dls. Boots +1"
    },
}

profile.Packer = {}

profile.OnLoad = function()
    gSettings.AllowAddSet = true

    -- AshitaCore:GetChatManager():QueueCommand(1, "/macro book 2")
    -- AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
    -- AshitaCore:GetChatManager():QueueCommand(1, "/lockstyleset 1")
end

profile.OnUnload = function()
end

profile.HandleCommand = function(args)
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()

    -- if player.Status == "Engaged" then
    --     if player.SubJob == "NIN" then
    --         gFunc.EquipSet(sets.TP_DW)
    --     elseif player.SubJob == "WHM" or player.SubJob == "BLM" or player.SubJob == "DRK" or player.SubJob == "THF" then
    --         gFunc.EquipSet(sets.TP)
    --     end
    -- end

    if player.Status == "Resting" then
        gFunc.EquipSet(sets.resting)
    end

    if player.Status == "Idle" then
        -- if player.SubJob == "NIN" then
        --     gFunc.EquipSet(sets.idle)
        -- elseif player.SubJob == "WHM" or player.SubJob == "BLM" or player.SubJob == "DRK" or player.SubJob == "THF" then
        gFunc.EquipSet(sets.idle)
        -- end
    end
end

profile.HandleAbility = function()
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.EquipSet(sets.precast)
end

profile.HandleMidcast = function()
    local MndDebuffs = T { 'Slow', 'Paralyze', 'Slow II', 'Paralyze II', 'Addle', 'Addle II' };
    local ElementalDebuffs = T { 'Burn', 'Rasp', 'Drown', 'Choke', 'Frost', 'Shock' };
    local action = gData.GetAction();
    local player = gData.GetPlayer();

    if (action.Skill == 'Enfeebling Magic') then
        -- if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.enfeebling);
        -- end
        if (MndDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.enfeebling_mnd);
        else
            gFunc.EquipSet(sets.enfeebling_int);
        end
        gFunc.Equip('main', ElementalStaffTable[action.Element]);
    elseif (action.Skill == 'Elemental Magic') then
        if (ElementalDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.ElementalDebuff);
        else
            gFunc.EquipSet(sets.nuke);
        end
        gFunc.Equip('main', ElementalStaffTable[action.Element]);
    elseif (action.Skill == 'Dark Magic') then
        if (action.Name == 'Stun') then
            gFunc.EquipSet(sets.Stun);
        else
            gFunc.EquipSet(sets.dark);
        end
        gFunc.Equip('main', ElementalStaffTable[action.Element]);
    elseif string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga') then
        gFunc.EquipSet(sets.cure);
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.enhancing);
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.stoneskin);
        end
        if string.match(action.Name, 'Refresh') or string.match(action.Name, 'Haste') then
            gFunc.EquipSet(sets.Dilation);
        end
    else
        gFunc.EquipSet(sets.haste)
    end
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    -- local action = gData.GetAction()

    -- if action.Name == "Savage Blade" then
    --     gFunc.EquipSet(sets.Savageblade)
    -- elseif action.Name == "Spirits Within" then
    --     gFunc.EquipSet(sets.SpiritsWithin)
    -- else
    --     gFunc.EquipSet(sets.WS)
    -- end
end

return profile
