local varhelper = gFunc.LoadFile("common/varhelper.lua");
local profile = {};
local sets = {
    TP = {
        ['Standard'] = {
            Ammo = "Silver Bullet",
            Head = "Optical Hat",
            Neck = "Faith Torque",
            Ear1 = "Bushinomimi",
            Ear2 = "Hollow Earring",
            Body = "Kirin\'s Osode",
            Hands = "Blood Fng. Gnt.",
            Ring1 = "Rajas Ring",
            Ring2 = "Merman\'s Ring",
            Back = "Amemet Mantle +1",
            Waist = "Scout\'s Belt",
            Legs = "Scout\'s Braccae",
            Feet = "Sct. Socks +1",
        },
        ['Accuracy'] = {
            Ammo = "Silver Bullet",
            Head = "Optical Hat",
            Neck = "Peacock Amulet",
            Ear1 = "Hollow Earring",
            Ear2 = "Drone Earring",
            Body = "Hunter\'s Jerkin",
            Hands = "Seiryu\'s Kote",
            Ring1 = "Rajas Ring",
            Ring2 = "Merman\'s Ring",
            Back = "Amemet Mantle +1",
            Waist = "Scout\'s Belt",
            Legs = "Scout\'s Braccae",
            Feet = "Sct. Socks +1",
        },
        ['Enmity'] = {
            Ammo = "Silver Bullet",
            Head = "Scout\'s Beret",
            Neck = "Faith Torque",
            Ear1 = "Bushinomimi", -- FIXME: Put Novia Here when you get it
            Ear2 = "Hollow Earring",
            Body = "Scout\'s Jerkin",
            Hands = "Blood Fng. Gnt.",
            Ring1 = "Rajas Ring",
            Ring2 = "Merman\'s Ring",
            Back = "Amemet Mantle +1",
            Waist = "Scout\'s Belt",
            Legs = "Scout\'s Braccae",
            Feet = "Sct. Socks +1",
        },
    },
    ['Idle'] = {
        Head = "Coral Visor +1",
        Neck = "Evasion Torque",
        Ear1 = "Merman\'s Earring",
        Ear2 = "Merman\'s Earring",
        Body = "Cor. Scale Mail +1",
        Hands = "Coral Fng. Gnt. +1",
        Ring1 = "Merman\'s Ring",
        Ring2 = "Merman\'s Ring",
        Back = "Resentment Cape",
        Legs = "Coral Cuisses +1",
        Feet = "Coral Greaves +1",
    },
    ['Slug'] = {
        Ammo = "Silver Bullet",
        Head = "Wyvern Helm",
        Neck = "Aqua Gorget",
        Ear1 = "Bushinomimi",
        Ear2 = "Triumph earring",
        Body = "Kirin\'s Osode",
        Hands = "Seiryu\'s Kote",
        Ring1 = "Rajas Ring",
        Ring2 = "Merman\'s Ring",
        Back = "Amemet Mantle +1",
        Waist = "Scout\'s Belt",
        Legs = "Scout\'s Braccae",
        Feet = "Savage gaiters",
    },
    ['SlugAccuracy'] = {
        Ammo = "Silver Bullet",
        Head = "Optical hat",
        Neck = "Aqua Gorget",
        Ear1 = "Hollow Earring",
        Ear2 = "Drone Earring",
        Body = "Kirin\'s Osode",
        Hands = "Seiryu\'s Kote",
        Ring1 = "Rajas Ring",
        Ring2 = "Merman\'s Ring",
        Back = "Amemet Mantle +1",
        Waist = "Scout\'s Belt",
        Legs = "Scout\'s Braccae",
        Feet = "Savage gaiters",
    },
    ['HeavyShotDetonator'] = {
        Ammo = "Silver Bullet",
        Head = "Wyvern Helm",
        Neck = "Peacock Amulet", -- FIXME: Put elemental torque here if you have it
        Ear1 = "Bushinomimi",
        Ear2 = "Triumph earring",
        Body = "Kirin\'s Osode",
        Hands = "Seiryu\'s Kote",
        Ring1 = "Rajas Ring",
        Ring2 = "Merman\'s Ring",
        Back = "Amemet Mantle +1",
        Waist = "Scout\'s Belt",
        Legs = "Scout\'s Braccae",
        Feet = "Savage gaiters",
    },
    ['HeavyShotDetonatorAccuracy'] = {
        Ammo = "Silver Bullet",
        Head = "Optical hat",
        Neck = "Peacock Amulet", -- FIXME: Put elemental torque here if you have it
        Ear1 = "Hollow Earring",
        Ear2 = "Drone Earring",
        Body = "Kirin\'s Osode",
        Hands = "Seiryu\'s Kote",
        Ring1 = "Merman\'s Ring",
        Ring2 = "Merman\'s Ring",
        Back = "Amemet Mantle +1",
        Waist = "Scout\'s Belt",
        Legs = "Scout\'s Braccae",
        Feet = "Savage gaiters",
    },
    ['Barrage'] = {
        Ammo = "Silver Bullet",
        Head = "Optical Hat",
        Neck = "Peacock Amulet",
        Ear1 = "Hollow Earring",
        Ear2 = "Drone Earring",
        Body = "Hunter\'s Jerkin",
        Hands = "Htr. Bracers +1",
        Ring1 = "Merman\'s Ring",
        Ring2 = "Merman\'s Ring",
        Back = "Amemet Mantle +1", -- FIXME: Put Jaeger Mantle here if you have it
        Waist = "Scout\'s Belt",
        Legs = "Scout\'s Braccae",
        Feet = "Sct. Socks +1",
    },
    ['UnlimitedShot'] = {
        Ammo = "Carapace Bullet", -- Put Unlimited Shot ammo here
    },
    ['StandardAmmo'] = {
        Ammo = "Silver Bullet",
    },
    ['EagleEyeShot'] = {          -- On Horizon, this ability can't miss, so we can stack a ton of ranged attack and we don't care about - R.ACC. I believe r.atk is more important than str
        Ammo = "Silver Bullet",
        Head = "Htr. beret +1",   -- TODO: Replace with Skadi Visor/Zha'Go's barbut when available
        Neck = "Faith Torque",
        Ear1 = "Bushinomimi",     -- TODO: Replace with Ladybug Earring+1 when available
        Ear2 = "Triumph earring", -- TODO: Replace with Ladybug Earring+1 when available
        Body = "Archer\'s Jupon",
        Hands = "Blood Fng. Gnt.",
        Ring1 = "Rajas Ring",      -- TODO: Replace with Jalzhran's Ring, Cerberus Ring, or AV Ring when available
        Ring2 = "Crossbowman Ring",
        Back = "Amemet Mantle +1", -- TODO: Replace with Gunner's Mantle
        Waist = "Scout\'s Belt",
        Legs = "Scout\'s Braccae", -- TODO: Replace with Skadi Legs when available
        Feet = "Sct. Socks +1",
    },
    ['Gathering'] = {
        Body = "Field Tunica",
        Hands = "Worker Gloves",
        Legs = "Worker Hose",
        Feet = "Worker Boots"
    },
    ['Crafting'] = {
        Body = "Carpenter\'s Apron",
        Hands = "Carpenter\'s Gloves",
        Legs = "Blood Cuisses"
    }
};
profile.Sets = sets;

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    varhelper.Initialize();

    varhelper.CreateCycle("Mode", { [1] = "Standard", [2] = "Accuracy" });
    varhelper.CreateCycle("Aux", { [1] = "None", [2] = "Gathering", [3] = "Crafting" });

    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F9 /lac fwd advance Mode");
    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F10 /lac fwd advance Aux");
end

profile.OnUnload = function()
    varhelper.Destroy();
end

profile.HandleCommand = function(args)
    if (args[1] == "advance") then -- /lac fwd advance Mode, or F9
        varhelper.AdvanceCycle(args[2]);
    end
end

local isDaytime = function()
    local environment = gData.GetEnvironment();
    return (environment.Time > 6 and environment.Time < 18);
end

profile.HandleDefault = function()
    local aux = varhelper.GetCycle("Aux");
    local player = gData.GetPlayer();

    -- if (player.Status == "Engaged") then
    --     local Mode = varhelper.GetCycle("Mode");
    --     gFunc.EquipSet(profile.Sets.TP[Mode]);
    -- else
    --     gFunc.EquipSet(profile.Sets.Idle);
    -- end
    if (aux == "Gathering") then
        gFunc.EquipSet(profile.Sets.Gathering);
    elseif (aux == "Crafting") then
        gFunc.EquipSet(profile.Sets.Crafting);
    else
        gFunc.EquipSet(profile.Sets.Idle);
    end


    -- Danger Low HP (This might not be okay for Horizon so disable it to be safe)
    if (player.HPP < 25 and player.TP < 1000) then
        gFunc.Equip("ear2", "Tracker\'s Earring")
    end

    -- Move Speed (This requires player input, so it should be okay to use on Horizon)
    if (player.IsMoving == true) then
        gFunc.Equip("legs", "Blood Cuisses");
    end

    -- Opo-opo necklace (Disable this for Horizon as it is against the rules)
    local asleep = gData.GetBuffCount("Sleep");
    if (asleep > 0) then
        gFunc.Equip("neck", "Opo-opo Necklace");
    end

    -- If health isn't max throw on regen items
    if (player.HPP < 99 and isDaytime() and aux ~= "Gathering" and aux ~= "Crafting") then
        gFunc.Equip("hands", "Garden Bangles");
    end

    -- TODO: Aketon in town

    -- TODO: Crafting gear before craft (Detect synth support?)

    -- TODO: Prevent unequipping of items with enchantments (warp cudgel, treat staff, deadeye earring, etc)
end

profile.HandleAbility = function()
    local action = gData.GetAction();

    if (action.Name == "Scavenge") then
        gFunc.Equip("feet", "Hunter\'s Socks");
    end

    if (action.Name == "Sharpshot") then
        gFunc.Equip("legs", "Hunter\'s Braccae");
    end

    if (action.Name == "Shadowbind") then
        gFunc.Equip("hands", "Htr. Bracers +1");
    end

    if (action.Name == "Eagle Eye Shot") then
        gFunc.EquipSet("EagleEyeShot")
    end

    if (action.Name == "Camouflage") then
        gFunc.Equip("body", "Hunter\'s Jerkin");
    end

    -- This prevents us from accidentally shooting a special bullet with Shadowbind or Eagle Eye Shot
    gFunc.EquipSet("StandardAmmo");
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.Equip("ear2", "Loquac. Earring");
end

profile.HandleMidcast = function()
    -- TODO: Spell Interruption/Haste
end

profile.HandlePreshot = function()
    local us = gData.GetBuffCount("Unlimited Shot");

    if (us == 1) then
        gFunc.EquipSet("UnlimitedShot");
    else
        gFunc.EquipSet("StandardAmmo");
    end

    gFunc.Equip("body", "Scout\'s Jerkin");
    gFunc.Equip("head", "Htr. Beret +1");
end

profile.HandleMidshot = function()
    local barr = gData.GetBuffCount("Barrage");
    local us = gData.GetBuffCount("Unlimited Shot");
    local player = gData.GetPlayer();

    if (barr == 1) then
        gFunc.EquipSet("Barrage");
    else
        local Mode = varhelper.GetCycle("Mode");
        gFunc.EquipSet(profile.Sets.TP[Mode]);
    end

    -- Opo-opo necklace (Disable this for Horizon as it is against the rules)
    local asleep = gData.GetBuffCount("Sleep");
    if (asleep > 0) then
        gFunc.EquipSet(profile.Sets.Idle);
        gFunc.Equip("neck", "Opo-opo Necklace");
    end

    -- Danger Low HP (This might not be okay for Horizon so disable it to be safe)
    if (player.HPP < 25 and player.TP < 1000) then
        gFunc.Equip("ear2", "Tracker\'s Earring")
    end

    -- TODO: We don't need to wear Rajas Ring for every shot, if we have 6XX TP and not a flat 600, we can wear Merman's Ring
    -- Code out the charts to see when we can wear something else
    if (us == 1) then
        gFunc.EquipSet("UnlimitedShot");
    else
        -- This will cause the shot to abort I believe - but that is a good thing, we don't want to lose the ammo
        -- This can happen if a dispel occurs or UnlimitedShot wears off
        gFunc.EquipSet("StandardAmmo");
    end
end

profile.HandleWeaponskill = function()
    local us = gData.GetBuffCount("Unlimited Shot");
    local Mode = varhelper.GetCycle("Mode");
    local Action = gData.GetAction();

    if (Action.Name == "Detonator" or Action.Name == "Heavy Shot" or Action.Name == "Arching Arrow" or Action.Name == "Empyreal Arrow") then
        if (Mode == "Accuracy") then
            gFunc.EquipSet("HeavyShotDetonatorAccuracy");
        else
            gFunc.EquipSet("HeavyShotDetonator");
        end
    end

    if (Action.Name == "Slug Shot" or Action.Name == "Sidewinder") then
        if (Mode == "Accuracy") then
            gFunc.EquipSet("SlugAccuracy");
        else
            gFunc.EquipSet("Slug");
        end
    end

    if (us == 1) then
        gFunc.EquipSet("UnlimitedShot");
    else
        gFunc.EquipSet("StandardAmmo");
    end
end

return profile;
