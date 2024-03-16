local profile = {}

local ElementalStaffTable = {
    Fire = "Fire Staff",
    Earth = "Earth Staff",
    Water = "Water Staff",
    Wind = "Water Staff",
    Ice = "Ice Staff",
    Thunder = "Thunder Staff",
    Light = "Light Staff",
    Dark = "Dark Staff"
}

local sets = {
    idle = {
        range = "Mary\'s Horn"
    },
    -- idle = {
    --     main = ElementalStaffTable["Earth"],
    --     ranged = "Hamelin Flute",
    --     head = "Darksteel Cap +1",
    --     neck = "Evasion Torque",
    --     ear1 = "Merman's earring",
    --     ear2 = "Merman's earring",
    --     body = "Dst. Harness +1",
    --     hands = "Dst. Mittens +1",
    --     Ring1 = "Merman's Ring",
    --     Ring2 = "Merman's Ring",
    --     back = "Umbra Cape",
    --     waist = "Survival Belt",
    --     legs = "Dst. Subligar +1",
    --     feet = "Dst. Leggings +1"
    -- },

    resting = {
        -- main = ElementalStaffTable["Dark"],
        -- head = "",
        -- ear1 = "Relaxing Earring",
        -- neck = "Checkered Scarf",
        -- body = "Errant Hpl.",
        -- hands = "Serpentes Cuffs",
        -- ring1 = "Sheltered Ring",
        -- ring2 = "Paguroidea Ring",
        -- waist = "Duelist's Belt",
        -- legs = "Baron's Slops",
        -- feet = "Chelona Boots +1"
    },

    precast = {
        -- ear1 = "Loquacious Earring",
        -- feet = "Rostrum Pumps"
    },

    cure = {
        -- main = ElementalStaffTable["Light"],
        -- sub = "None",
        -- Head = 'Dls. Chapeau +1',
        -- neck = "Justice Badge",
        -- ear1 = "Novia Earring",
        -- ear2 = "Loquacious Earring",
        -- body = "Duelist's Tabard",
        -- hands = "Duelist's Gloves",
        -- ring1 = "Thunder Ring",
        -- ring2 = "San d'Orian Ring",
        -- back = "Altruistic Cape",
        -- waist = "Duelist's Belt",
        -- legs = "Warlock's Tights",
        -- feet = "Duelist's Boots +1"
    },

    enhancing = {
        -- body = "Glamor Jupon",
        -- hands = "Duelist's Gloves",
        -- legs = "Warlock's Tights"
    },

    stoneskin = {
        -- Main = "Mythic Wand",
        -- Sub = "Numinous Shield",
        -- Head = "Warlock's Chapeau",
        -- Neck = "Justice Badge",
        -- Body = "Errant Hpl.",
        -- Hands = "Dls. Gloves +1",
        -- Back = "Rainbow Cape",
        -- Waist = "Hierarch Belt",
        -- Legs = "Warlock's Tights",
        -- Feet = "Errant Pigaches"
    },

    haste = {
        -- hands = "Dusk gloves",
        -- waist = "Swift belt"
    }
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
    local action = gData.GetAction();
    local player = gData.GetPlayer();

    gFunc.Equip('main', ElementalStaffTable[action.Element]);

    if (string.match(action.Name, 'Lullaby')) then
        gFunc.equip('ranged', 'Mary\'s Horn');
    elseif (string.match(action.Name, 'Minuet')) then
        gFunc.equip('ranged', 'Cornette +1');
    elseif (string.match(action.Name, 'March')) then
        gFunc.equip('ranged', 'Kingdom Horn');
    elseif (string.match(action.Name, 'Madrigal')) then
        gFunc.equip('ranged', 'Traversiere +2');
    elseif (string.match(action.Name, 'Elegy')) then
        gFunc.equip('ranged', 'Horn +1');
    end

    if string.match(action.Name, 'Cure') or string.match(action.Name, 'Curaga') then
        gFunc.EquipSet(sets.cure);
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.enhancing);
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.stoneskin);
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
