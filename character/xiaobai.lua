xiaobai_module = {}

xiaobai_module.xiaobai = {
    DAMAGE = 0.7,
    SPEED = -0.6,
    SHOTSPEED = -0.3,
    TEARHEIGHT = 0,
    MaxFireDelay = 2.5,
    TEARRANGE = 0, -- 40 is +1 tearrange
    TEARFALLINGSPEED = 0,
    LUCK = 0,
    FLYING = false,
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0)
}

----XiaoBai Stats----
function xiaobai_module.xiaobai:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "XiaoBai" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage + xiaobai_module.xiaobai.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + xiaobai_module.xiaobai.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - xiaobai_module.xiaobai.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + xiaobai_module.xiaobai.TEARFALLINGSPEED
            player.TearRange = player.TearRange * 0.75 + xiaobai_module.xiaobai.TEARRANGE
        end
        if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
            player.MaxFireDelay = player.MaxFireDelay * xiaobai_module.xiaobai.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + xiaobai_module.xiaobai.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + xiaobai_module.xiaobai.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and xiaobai_module.xiaobai.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | xiaobai_module.xiaobai.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = xiaobai_module.xiaobai.TEARCOLOR
        end
    end
end

--- No Gold Pill spawns for XiaoBai ---
function xiaobai_module.removeGoldPillXiaoBai()
    local player = Isaac.GetPlayer(0)
    local roomEntities = Isaac.GetRoomEntities()
    if player:GetName() == "XiaoBai" then
        for i, entity in pairs(roomEntities) do
            if entity.Type == EntityType.ENTITY_PICKUP
                and entity.Variant == PickupVariant.PICKUP_PILL
                and entity.SubType == PillColor.PILL_GOLD then
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_PILL, PillEffect.PILLEFFECT_I_FOUND_PILLS,
                    entity.Position, Vector(0, 0), nil)
                entity:Remove()
            end
        end
    end
end

--- Removes Gold Pill's effect for Xiaobai ---
function xiaobai_module.removeGoldPillEffectXiaoBai()
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "XiaoBai"
        and player:GetPill(0) == PillColor.PILL_GOLD then
        player:SetPill(0, PillColor.PILL_BLUE_BLUE)
    end
end

return xiaobai_module
