otto_module = {}

otto_module.otto = {
    DAMAGE = 0,
    SPEED = 0.3,
    SHOTSPEED = 0,
    TEARHEIGHT = 0,
    MaxFireDelay = 1.3,
    TEARRANGE = 0.8,
    TEARFALLINGSPEED = 0,
    LUCK = 0,
    FLYING = false,
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0)
}

----Otto Stats----
function otto_module.otto:onCache(player, cacheFlag)
    if player:GetName() == "otto" then
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 0.85 + otto_module.otto.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + otto_module.otto.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - otto_module.otto.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + otto_module.otto.TEARFALLINGSPEED
            player.TearRange = player.TearRange * otto_module.otto.TEARRANGE
        end
        if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
            player.MaxFireDelay = player.MaxFireDelay + otto_module.otto.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + otto_module.otto.SPEED * 0.8
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + otto_module.otto.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and otto_module.otto.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | otto_module.otto.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = otto_module.otto.TEARCOLOR
        end
    end
end

return otto_module
