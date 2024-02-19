local varhelper = gFunc.LoadFile('common/varhelper.lua');
local profile = {};
local sets = {
    TP = {
        ['Standard'] = {
            Ammo = 'Silver Bullet',
            Head = 'Optical Hat',
            Neck = 'Faith Torque',
            Ear1 = 'Bushinomimi',
            Ear2 = 'Hollow Earring',
            Body = 'Kirin\'s Osode',
            Hands = 'Blood Fng. Gnt.',
            Ring1 = 'Rajas Ring',
            Ring2 = 'Merman\'s Ring',
            Back = 'Amemet Mantle +1',
            Waist = 'Scout\'s Belt',
            Legs = 'Scout\'s Braccae',
            Feet = 'Sct. Socks +1',
        },
        ['Accuracy'] = {
            Ammo = 'Silver Bullet',
            Head = 'Optical Hat',
            Neck = 'Peacock Amulet',
            Ear1 = 'Hollow Earring',
            Ear2 = 'Drone Earring',
            Body = 'Hunter\'s Jerkin',
            Hands = 'Seiryu\'s Kote',
            Ring1 = 'Merman\'s Ring',
            Ring2 = 'Merman\'s Ring',
            Back = 'Amemet Mantle +1',
            Waist = 'Scout\'s Belt',
            Legs = 'Scout\'s Braccae',
            Feet = 'Sct. Socks +1',
        },
        ['Enmity'] = {
            Ammo = 'Silver Bullet',
            Head = 'Optical Hat',
            Neck = 'Faith Torque',
            Ear1 = 'Bushinomimi',
            Ear2 = 'Hollow Earring',
            Body = 'Kirin\'s Osode',
            Hands = 'Blood Fng. Gnt.',
            Ring1 = 'Rajas Ring',
            Ring2 = 'Merman\'s Ring',
            Back = 'Amemet Mantle +1',
            Waist = 'Scout\'s Belt',
            Legs = 'Scout\'s Braccae',
            Feet = 'Sct. Socks +1',
        },
    },
    ['Slug'] = {
        Ammo = 'Silver Bullet',
        Head = 'Optical hat',
        Neck = 'Aqua Gorget',
        Ear1 = 'Bushinomimi',
        Ear2 = 'Triumph earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Scout\'s Belt',
        Legs = 'Scout\'s Braccae',
        Feet = 'Savage gaiters',
    },
    ['Barrage'] = {
        Ammo = 'Silver Bullet',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Hollow Earring',
        Ear2 = 'Drone Earring',
        Body = 'Hunter\'s Jerkin',
        Hands = 'Htr. Bracers +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Scout\'s Belt',
        Legs = 'Scout\'s Braccae',
        Feet = 'Sct. Socks +1',
    },
    ['SlugAccuracy'] = {
        Ammo = 'Silver Bullet',
        Head = 'Optical hat',
        Neck = 'Aqua Gorget',
        Ear1 = 'Hollow Earring',
        Ear2 = 'Drone Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Scout\'s Belt',
        Legs = 'Scout\'s Braccae',
        Feet = 'Savage gaiters',
    },
    ['UnlimitedShot'] = { -- Put Unlimited Shot ammo here
        Ammo = 'Silver Bullet',
    },
    ['StandardAmmo'] = { -- Put Unlimited Shot ammo here
        Ammo = 'Silver Bullet',
    },

};
profile.Sets = sets;

profile.Packer = {
};

profile.OnLoad = function()
    gSettings.AllowAddSet = true;
    varhelper.Initialize();

    varhelper.CreateCycle('Mode', { [1] = 'Standard', [2] = 'Accuracy' });
    -- varhelper.CreateCycle('Mode', {[1] = 'Standard', [2] = 'Enmity'});


    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 /lac fwd advance Mode');
    -- AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 /lac fwd advance Mode');
end

profile.OnUnload = function()
    varhelper.Destroy();
end

profile.HandleCommand = function(args)
    if (args[1] == 'advance') then -- /lac fwd advance Mode, or F9
        varhelper.AdvanceCycle(args[2]);
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();

    if (player.Status == "Engaged") then
        local Mode = varhelper.GetCycle('Mode');
        gFunc.EquipSet(profile.Sets.TP[Mode]);
        -- else
        -- 	local Mode = varhelper.GetCycle('Mode');
        -- 	gFunc.EquipSet(profile.Sets.TP[Mode]);
    end

    -- if (player.IsMoving == true) then
    -- gFunc.Equip('feet', 'Strider Boots');
    -- end
end

profile.HandleAbility = function()
    local action = gData.GetAction();
    if (action.Name == 'Scavenge') then
        gFunc.Equip('feet', 'Hunter\'s Socks');
    end

    if (action.Name == 'Sharpshot') then
        gFunc.Equip('legs', 'Hunter\'s Braccae');
    end

    if (action.Name == 'Shadowbind') then
        gFunc.Equip('hands', 'Htr. Bracers +1');
    end
end

profile.HandleItem = function()
end

profile.HandlePrecast = function()
end

profile.HandleMidcast = function()
end

profile.HandlePreshot = function()
    local us = gData.GetBuffCount('Unlimited Shot');

    if (us == 1) then
        gFunc.EquipSet('UnlimitedShot');
    end

    gFunc.Equip('body', 'Scout\'s Jerkin');
    gFunc.Equip('head', 'Htr. Beret +1');
end

profile.HandleMidshot = function()
    local barr = gData.GetBuffCount('Barrage');
    local us = gData.GetBuffCount('Unlimited Shot');

    if (barr == 1) then
        gFunc.EquipSet('Barrage');
    else
        local Mode = varhelper.GetCycle('Mode');
        gFunc.EquipSet(profile.Sets.TP[Mode]);
    end

    if (us == 1) then
        gFunc.EquipSet('UnlimitedShot'); -- This is already handled in the pre-shot but Mabo says it needs to be both
    else
        -- This will cause the short to abort I believe - but that is a good thing, we don't want to lose the ammo
        -- This can happen if a dispel occurs or UnlimitedShot wears off
        gFunc.EquipSet('StandardAmmo');
    end
end

profile.HandleWeaponskill = function()
    local Mode = varhelper.GetCycle('Mode');

    if (Mode == 'Accuracy') then
        gFunc.EquipSet('SlugAccuracy');
    else
        gFunc.EquipSet('Slug');
    end
end

return profile;
