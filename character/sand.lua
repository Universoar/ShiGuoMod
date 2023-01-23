sand_module = {}

sand_module.sand = {
    DAMAGE = 0.05,
    SPEED = 0,
    SHOTSPEED = 0,
    TEARHEIGHT = 0,
    MaxFireDelay = 1.35,
    TEARRANGE = 100, -- 40 is +1 tearrange
    TEARFALLINGSPEED = 0,
    LUCK = 0,
    FLYING = false,
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(255, 255, 255, 255, 76, 0, 0)
}


----Sand Stats----
sand_module.sandDMG = 0
sand_module.sandSpeed = 0
function sand_module.sand:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "Sand" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 0.7 + sand_module.sand.DAMAGE + sand_module.sandDMG
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + sand_module.sand.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - sand_module.sand.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + sand_module.sand.TEARFALLINGSPEED
            player.TearRange = player.TearRange + sand_module.sand.TEARRANGE
        end
        if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
            player.MaxFireDelay = player.MaxFireDelay * sand_module.sand.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + sand_module.sand.SPEED + sand_module.sandSpeed
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + sand_module.sand.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and sand_module.sand.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | sand_module.sand.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = sand_module.sand.TEARCOLOR
        end
    end
end

--- Sand gains 0.5 dmg everytime a room is cleared with Fire Candle ---
function sand_module.dmgGainSandCandle()
    local player = Isaac.GetPlayer(0)
    local room = Game():GetRoom()
    if player:GetName() == "Sand"
        and player:HasCollectible(CollectibleType.COLLECTIBLE_RED_CANDLE)
        and room:IsClear() == false then
        player.Damage = player.Damage + 0.2
        sand_module.sandDMG = sand_module.sandDMG + 0.2
    end
end

--- Sand gains 0.01 speed when moms bra is used, plays ice sound ---
function sand_module.dmgGainSandMomBra()
    SFXManager():Play(Isaac.GetSoundIdByName("ice"))
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "Sand" then
        player.MoveSpeed = player.MoveSpeed + 0.01
        sand_module.sandSpeed = sand_module.sandSpeed + 0.01
    end
end

--- Replaces Sand's random starting trinket with Blessed Penny
function sand_module.unNameFunction1(_, mpgsc)
    local player = Isaac.GetPlayer(0)
    local roomEntities = Isaac.GetRoomEntities()
    if player:GetName() == "Sand" then
        for i, entity in pairs(roomEntities) do
            if entity.Type == EntityType.ENTITY_PICKUP
                and entity.Variant == PickupVariant.PICKUP_TRINKET then
                entity:Remove()
                Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_BLESSED_PENNY,
                    entity.Position, Vector(0, 0), nil)
            end
        end
    end
end

return sand_module
