back_module = {}

back_module.back = {
    DAMAGE = -3.5,
    SPEED = 0,
    SHOTSPEED = 0,
    TEARHEIGHT = 0,
    MaxFireDelay = 1, --1 is defaut
    TEARRANGE = 0.8, --1 is defaut
    TEARFALLINGSPEED = 0,
    LUCK = 0,
    FLYING = false,
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0)
}

local game = Game()

----Back Stats----
function back_module.back:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "Back" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage * 1.1 + back_module.back.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + back_module.back.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - back_module.back.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + back_module.back.TEARFALLINGSPEED
            player.TearRange = player.TearRange * back_module.back.TEARRANGE
        end
        if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
            player.MaxFireDelay = player.MaxFireDelay * back_module.back.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + back_module.back.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + back_module.back.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and back_module.back.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | back_module.back.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = back_module.back.TEARCOLOR
        end
    end
end

--- Replaces coins as fly bombs for Back ---
local dropBombState = 0
local currentFrame = 0
function back_module.dropBombBack()
    local player = Isaac.GetPlayer(0)
    local roomEntities = Isaac.GetRoomEntities()
    if player:GetName() == "Back" then
        local isCoinRemoved = false
        local coinCount = 0
        for i, entity in pairs(roomEntities) do
            if entity.Type == EntityType.ENTITY_PICKUP
                and entity.Variant == PickupVariant.PICKUP_COIN then
                coinCount = coinCount + 1
                if dropBombState == 0 then
                    currentFrame = game:GetFrameCount()
                    dropBombState = 1
                end
                if game:GetFrameCount() == currentFrame + 60 then
                    local entityPosition = entity.Position
                    entity:Remove()
                    isCoinRemoved = true
                    Isaac.Spawn(EntityType.ENTITY_FLY_BOMB, 0, 0, entityPosition, Vector(0, 0), nil)
                    SFXManager():Play(Isaac.GetSoundIdByName("obunga"))
                end
            end
        end
        if isCoinRemoved == true or coinCount == 0 then
            dropBombState = 0
        end
    end
end

return back_module
