todd_module = {}

todd_module.todd = {
    DAMAGE = -3.2,
    SPEED = 0,
    SHOTSPEED = 0,
    TEARHEIGHT = 0,
    MaxFireDelay = 1, --1 is defaut
    TEARRANGE = 1, --1 is defaut
    TEARFALLINGSPEED = 0,
    LUCK = 0,
    FLYING = false,
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0)
}

----Todd Stats----
function todd_module.todd:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "Todd" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage + todd_module.todd.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + todd_module.todd.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - todd_module.todd.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + todd_module.todd.TEARFALLINGSPEED
            player.TearRange = player.TearRange * todd_module.todd.TEARRANGE
        end
        if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
            player.MaxFireDelay = player.MaxFireDelay * todd_module.todd.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + todd_module.todd.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + todd_module.todd.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and todd_module.todd.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | todd_module.todd.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = todd_module.todd.TEARCOLOR
        end
    end
end

--- Set Todd's max coin to 95 ---
function todd_module.maxCoinTodd()
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "Todd"
        and player:GetNumCoins() == 99 then
        player:AddCoins(-4)
    end
end

--- Reduces Todd's coin for every pickup ---
local toddCoin = 95
local toddKeys = 1
local toddBombs = 1
function todd_module.randomCoinTodd()
    local player = Isaac.GetPlayer(0)

    local RECOMMENDED_SHIFT_IDX = 35
    local rng = RNG()
    rng:SetSeed(math.random(4294967295), RECOMMENDED_SHIFT_IDX)
    helper_module.randomChance = rng:RandomFloat() + (player.Luck * 0.02)
    helper_module.randomAmount = rng:RandomInt(3)

    if player:GetName() == "Todd" then
        if helper_module.randomChance < 0.4 and helper_module.randomChance > 0 then
            if player:GetNumCoins() - toddCoin == 1
                or player:GetNumCoins() - toddCoin == 2 then
                player:AddCoins(-helper_module.randomAmount)
            end
            if player:GetNumCoins() - toddCoin == 5 then
                player:AddCoins(-3)
            end
            if player:GetNumCoins() - toddCoin == 10 then
                player:AddCoins(-5)
            end
        end

        if player:GetNumKeys() - toddKeys == 1
            or player:GetNumKeys() - toddKeys == 2 then
            player:AddCoins(-helper_module.randomAmount)
        end
        if player:GetNumBombs() - toddBombs == 1
            or player:GetNumBombs() - toddBombs == 2 then
            player:AddCoins(-1)
        end
    end
    toddCoin = player:GetNumCoins()
    toddKeys = player:GetNumKeys()
    toddBombs = player:GetNumBombs()
end

--- Replaces Todd's starting item as hourglass and removes starting trinket ---
function todd_module.unNameFunction1(_, mpgsc)
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "Todd" then
        if (not mpgsc) then
            if player:HasCollectible(349) then
                player:RemoveCollectible(349)
                player:AddCollectible(CollectibleType.COLLECTIBLE_HOURGLASS, 2)
                player:TryRemoveTrinket(TrinketType.TRINKET_STORE_KEY)
            end
        end
    end
end

return todd_module
