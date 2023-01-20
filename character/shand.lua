shand_module = {}

shand_module.shand = { -- Change everywhere to match your character. No spaces!
    DAMAGE = 0.05, -- These are all relative to Isaac's base stats.
    SPEED = 0,
    SHOTSPEED = -0.15,
    TEARHEIGHT = 0,
    MaxFireDelay = 1.1,
    TEARRANGE = 0.9,
    TEARFALLINGSPEED = 0,
    LUCK = 0,
    FLYING = false,
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) -- Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) is default
}

----ShanD Stats----
function shand_module.shand:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "ShanD" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 0.7 + shand_module.shand.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + shand_module.shand.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - shand_module.shand.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + shand_module.shand.TEARFALLINGSPEED
            player.TearRange = player.TearRange * shand_module.shand.TEARRANGE
        end
        if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
            player.MaxFireDelay = player.MaxFireDelay + shand_module.shand.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + shand_module.shand.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + shand_module.shand.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and shand_module.shand.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | shand_module.shand.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = shand_module.shand.TEARCOLOR
        end
    end
end

function shand_module.unNameFunction1(_, mpgsc)
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "ShanD" then
        if (not mpgsc) then
            if player:HasCollectible(105) then
                player:RemoveCollectible(105)
                player:AddCollectible(CollectibleType.COLLECTIBLE_BUTTER_BEAN, 2)
            end
        end
    end
end

return shand_module
