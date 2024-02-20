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
            Ring1 = "Merman\'s Ring",
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
        Body = "Coral Scale Mail +1",
        Hands = "Cor. Fng. Gaunt. +1",
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
        Ring1 = "Merman\'s Ring",
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
        Ammo = "Silver Bullet", -- Put Unlimited Shot ammo here
    },
    ['StandardAmmo'] = {
        Ammo = "Silver Bullet",
    },

};
profile.Sets = sets;

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    varhelper.Initialize();

    varhelper.CreateCycle("Mode", { [1] = "Standard", [2] = "Accuracy" });
    -- varhelper.CreateCycle("Mode", {[1] = "Standard", [2] = "Enmity'});


    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F9 /lac fwd advance Mode");
    -- AshitaCore:GetChatManager():QueueCommand(-1, "/bind F10 /lac fwd advance Mode");
end

profile.OnUnload = function()
    varhelper.Destroy();
end

profile.HandleCommand = function(args)
    if (args[1] == "advance") then -- /lac fwd advance Mode, or F9
        varhelper.AdvanceCycle(args[2]);
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    -- if (player.Status == "Engaged") then
    --     local Mode = varhelper.GetCycle("Mode");
    --     gFunc.EquipSet(profile.Sets.TP[Mode]);
    -- else
    --     gFunc.EquipSet(profile.Sets.Idle);
    -- end
    gFunc.EquipSet(profile.Sets.Idle);

    -- Danger Low HP
    if (player.HPP < 25 and player.TP < 1000) then
        gFunc.equip("ear2", "Tracker\'s Earring")
    end

    -- Move Speed
    if (player.IsMoving == true) then
        gFunc.Equip("legs", "Blood Cuisses");
    end
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
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
    gFunc.equip("ear2", "Loquac. Earring");
end

profile.HandleMidcast = function()
    -- TODO: Spell Interruption/Haste
end

profile.HandlePreshot = function()
    local us = gData.GetBuffCount("Unlimited Shot");

    if (us == 1) then
        gFunc.EquipSet("UnlimitedShot");
    end

    gFunc.Equip("body", "Scout\'s Jerkin");
    gFunc.Equip("head", "Htr. Beret +1");
end

profile.HandleMidshot = function()
    local barr = gData.GetBuffCount("Barrage");
    local us = gData.GetBuffCount("Unlimited Shot");

    if (barr == 1) then
        gFunc.EquipSet("Barrage");
    else
        local Mode = varhelper.GetCycle("Mode");
        gFunc.EquipSet(profile.Sets.TP[Mode]);
    end

    if (us == 1) then
        gFunc.EquipSet("UnlimitedShot");
    else
        -- This will cause the shot to abort I believe - but that is a good thing, we don't want to lose the ammo
        -- This can happen if a dispel occurs or UnlimitedShot wears off
        gFunc.EquipSet("StandardAmmo");
    end
end

profile.HandleWeaponskill = function()
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
end

return profile;
