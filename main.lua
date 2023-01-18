local Mod = RegisterMod("SHIGUO 2023", 1) -- Change the part in quotes to match your mod name
local game = Game()
 
local shand = { -- Change everywhere to match your character. No spaces!
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
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0)  -- Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) is default
}

local otto = { 
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

local xiaobai = { 
    DAMAGE = 0.7, 
    SPEED = -0.6,
    SHOTSPEED = -0.3,
    TEARHEIGHT = 0,
	MaxFireDelay = 2.5,
	TEARRANGE = 0,   -- 40 is +1 tearrange
    TEARFALLINGSPEED = 0,
    LUCK = 0, 
    FLYING = false,                                  
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) 
}

local sand = { 
    DAMAGE = 0.05, 
    SPEED = 0,
    SHOTSPEED = 0,
    TEARHEIGHT = 0,
	MaxFireDelay = 1.35,
	TEARRANGE = 100,  -- 40 is +1 tearrange
    TEARFALLINGSPEED = 0,
    LUCK = 0, 
    FLYING = false,                                  
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(255, 255, 255, 255, 76, 0, 0) 
}

local back = { 
    DAMAGE = -3.5, 
    SPEED = 0,
    SHOTSPEED = 0,
    TEARHEIGHT = 0,
	MaxFireDelay = 1, --1 is defaut
	TEARRANGE = 0.8,  --1 is defaut
    TEARFALLINGSPEED = 0,
    LUCK = 0, 
    FLYING = false,                                  
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) 
}

local todd = { 
    DAMAGE = -3.2, 
    SPEED = 0,
    SHOTSPEED = 0,
    TEARHEIGHT = 0,
	MaxFireDelay = 1, --1 is defaut
	TEARRANGE = 1,  --1 is defaut
    TEARFALLINGSPEED = 0,
    LUCK = 0, 
    FLYING = false,                                  
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) 
}

local peach = { 
    DAMAGE = 1, 
    SPEED = -0.25,
    SHOTSPEED = 0.7,
    TEARHEIGHT = -0.15,
	MaxFireDelay = 1.35, --1 is defaut
	TEARRANGE = 0.7,  --1 is defaut
    TEARFALLINGSPEED = 0,
    LUCK = 0, 
    FLYING = false,                                  
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) 
}

local cardList = {}

local win8 = { 
    DAMAGE = 0, 
    SPEED = 0.1,
    SHOTSPEED = 0,
    TEARHEIGHT = 0,
	MaxFireDelay = 1.1, --1 is defaut
	TEARRANGE = 1,  --1 is defaut
    TEARFALLINGSPEED = 0,
    LUCK = 0, 
    FLYING = false,                                  
    TEARFLAG = 0, -- 0 is default
    TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0) 
}


	----ShanD Stats----
function shand:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "ShanD" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage*0.7 + shand.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + shand.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - shand.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + shand.TEARFALLINGSPEED
			player.TearRange = player.TearRange * shand.TEARRANGE
        end
		if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
			player.MaxFireDelay = player.MaxFireDelay + shand.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + shand.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + shand.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and shand.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | shand.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = shand.TEARCOLOR
        end
    end
end

	----Otto Stats----
function otto:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "otto" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage*0.85 + otto.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + otto.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - otto.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + otto.TEARFALLINGSPEED
			player.TearRange = player.TearRange * otto.TEARRANGE
		end
		if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
			player.MaxFireDelay = player.MaxFireDelay + otto.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + otto.SPEED * 0.8
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + otto.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and otto.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | otto.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = otto.TEARCOLOR
        end
    end
end
 
	----XiaoBai Stats----
function xiaobai:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "XiaoBai" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage + xiaobai.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + xiaobai.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - xiaobai.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + xiaobai.TEARFALLINGSPEED
			player.TearRange = player.TearRange*0.75 + xiaobai.TEARRANGE
		end
		if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
			player.MaxFireDelay = player.MaxFireDelay * xiaobai.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + xiaobai.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + xiaobai.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and xiaobai.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | xiaobai.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = xiaobai.TEARCOLOR
        end
    end
end

	----Sand Stats----
local sandDMG = 0
local sandSpeed = 0
function sand:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "Sand" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage*0.7 + sand.DAMAGE + sandDMG
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + sand.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - sand.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + sand.TEARFALLINGSPEED
			player.TearRange = player.TearRange + sand.TEARRANGE
		end
		if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
			player.MaxFireDelay = player.MaxFireDelay * sand.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + sand.SPEED + sandSpeed
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + sand.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and sand.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | sand.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = sand.TEARCOLOR
        end
    end
end

    ----Back Stats----
function back:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "Back" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage*1.1 + back.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + back.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - back.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + back.TEARFALLINGSPEED
			player.TearRange = player.TearRange * back.TEARRANGE
		end
		if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
			player.MaxFireDelay = player.MaxFireDelay * back.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + back.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + back.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and back.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | back.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = back.TEARCOLOR
		end
    end
end

    ----Todd Stats----
function todd:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "Todd" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage + todd.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + todd.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - todd.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + todd.TEARFALLINGSPEED
			player.TearRange = player.TearRange * todd.TEARRANGE
		end
		if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
			player.MaxFireDelay = player.MaxFireDelay * todd.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + todd.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + todd.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and todd.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | todd.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = todd.TEARCOLOR
        end
	end
end

    ----Peach Stats----
function peach:onCache(player, cacheFlag) -- I do mean everywhere!
    if player:GetName() == "Peach" then -- Especially here!
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage + peach.DAMAGE
        end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed + peach.SHOTSPEED
        end
        if cacheFlag == CacheFlag.CACHE_RANGE then
            player.TearHeight = player.TearHeight - peach.TEARHEIGHT
            player.TearFallingSpeed = player.TearFallingSpeed + peach.TEARFALLINGSPEED
			player.TearRange = player.TearRange * peach.TEARRANGE
		end
		if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
			player.MaxFireDelay = player.MaxFireDelay * peach.MaxFireDelay
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed + peach.SPEED
        end
        if cacheFlag == CacheFlag.CACHE_LUCK then
            player.Luck = player.Luck + peach.LUCK
        end
        if cacheFlag == CacheFlag.CACHE_FLYING and peach.FLYING then
            player.CanFly = true
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | peach.TEARFLAG
        end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
            player.TearColor = peach.TEARCOLOR
		end
		if cacheFlag == CacheFlag.CACHE_SIZE then
            player.SpriteScale = player.SpriteScale * 1.2500623464584
		end
    end
end

    ----Win8 Stats----
	function win8:onCache(player, cacheFlag) -- I do mean everywhere!
		if player:GetName() == "Win8" then -- Especially here!
			if cacheFlag == CacheFlag.CACHE_DAMAGE then
				player.Damage = player.Damage + win8.DAMAGE
			end
			if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
				player.ShotSpeed = player.ShotSpeed + win8.SHOTSPEED
			end
			if cacheFlag == CacheFlag.CACHE_RANGE then
				player.TearHeight = player.TearHeight - win8.TEARHEIGHT
				player.TearFallingSpeed = player.TearFallingSpeed + win8.TEARFALLINGSPEED
				player.TearRange = player.TearRange * win8.TEARRANGE
			end
			if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
				player.MaxFireDelay = player.MaxFireDelay * win8.MaxFireDelay
			end
			if cacheFlag == CacheFlag.CACHE_SPEED then
				player.MoveSpeed = player.MoveSpeed + win8.SPEED
			end
			if cacheFlag == CacheFlag.CACHE_LUCK then
				player.Luck = player.Luck + win8.LUCK
			end
			if cacheFlag == CacheFlag.CACHE_FLYING and win8.FLYING then
				player.CanFly = true
			end
			if cacheFlag == CacheFlag.CACHE_TEARFLAG then
				player.TearFlags = player.TearFlags | win8.TEARFLAG
			end
			if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
				player.TearColor = win8.TEARCOLOR
			end
		end
	end

function randomChanceGenerate()
	local RECOMMENDED_SHIFT_IDX = 35
	local rng = RNG()
	rng:SetSeed(math.random(4294967295), RECOMMENDED_SHIFT_IDX)
	randomChance = rng:RandomFloat()
	return randomChance
end

	--- Replaces coins as fly bombs for Back ---
local dropBombState = 0
local currentFrame = 0
function dropBombBack()
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
					Isaac.Spawn(EntityType.ENTITY_FLY_BOMB, 0, 0, entityPosition, Vector(0,0), nil)
					SFXManager():Play(Isaac.GetSoundIdByName("obunga"))
				end
			end
		end
		if isCoinRemoved == true or coinCount == 0 then
			dropBombState = 0
		end
	end
end

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, dropBombBack)

	--- Replaces blue heart and black heart with rock spiders for Sir Peach ---
local dropHeartState = 0
function dropHeartSirPeach()
	local player = Isaac.GetPlayer(0)
	local roomEntities = Isaac.GetRoomEntities()
	if player:GetName() == "Sir_Peach" then
		local isHeartRemoved = false
		local heartCount = 0
		for i, entity in pairs(roomEntities) do
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.Variant == PickupVariant.PICKUP_HEART then
				heartCount = heartCount + 1
				if dropHeartState == 0 then
					currentFrame = game:GetFrameCount()
					dropHeartState = 1
				end
				if game:GetFrameCount() == currentFrame + 60 then
					if entity.SubType == HeartSubType.HEART_SOUL then
						local entityPosition = entity.Position
						entity:Remove()
						isHeartRemoved = true
						Isaac.Spawn(EntityType.ENTITY_ROCK_SPIDER, 1, 0, entityPosition, Vector(0,0), nil)
						SFXManager():Play(Isaac.GetSoundIdByName("rock_spider"))
					end
					if entity.SubType == HeartSubType.HEART_BLACK then
						local entityPosition = entity.Position
						entity:Remove()
						isHeartRemoved = true
						Isaac.Spawn(EntityType.ENTITY_ROCK_SPIDER, 0, 0, entityPosition, Vector(0,0), nil)
						SFXManager():Play(Isaac.GetSoundIdByName("rock_spider"))
					end
				end
			end
		end
		if isHeartRemoved == true or heartCount == 0 then
			dropHeartState = 0
		end
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, dropHeartSirPeach)

	--- No Gold Pill spawns for XiaoBai ---
function removeGoldPillXiaoBai()
	local player = Isaac.GetPlayer(0)
	local roomEntities = Isaac.GetRoomEntities()
	if player:GetName() == "XiaoBai" then
		for i, entity in pairs(roomEntities) do
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.Variant == PickupVariant.PICKUP_PILL 
				and entity.SubType == PillColor.PILL_GOLD then
				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_PILL, PillEffect.PILLEFFECT_I_FOUND_PILLS, entity.Position, Vector(0,0), nil)
				entity:Remove()
			end
		end
	end
end

	--- Removes Gold Pill's effect for Xiaobai ---
function removeGoldPillEffectXiaoBai()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "XiaoBai" 
	and player:GetPill(0) == PillColor.PILL_GOLD then
		player:SetPill(0, PillColor.PILL_BLUE_BLUE)
	end
end

	--- Removes items in angel room for Peach, except key pieces ---
function peachAngelRoomItem()
	local room = Game():GetRoom()
	local roomEntities = Isaac.GetRoomEntities()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" 
		and room:GetType() == RoomType.ROOM_ANGEL then
		for i, entity in pairs(roomEntities) do
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.SubType ~= 238 
				and entity.SubType ~= 239 then
					entity:Remove()
			end
		end
	end
end

	--- Peach loses 1 luck when sacrificed, chances to gain half heart when hurt for peach ---
function peachHeal()
	local room = Game():GetRoom()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" then
		local RECOMMENDED_SHIFT_IDX = 35
		local rng = RNG()
		rng:SetSeed(math.random(4294967295), RECOMMENDED_SHIFT_IDX)
		randomChance = rng:RandomFloat() + (player.Luck * 0.02)
		if randomChance < 0.25 and randomChance > 0 
			and player:HasFullHeartsAndSoulHearts() == false then
			player:AddHearts(1)
			SFXManager():Play(Isaac.GetSoundIdByName("ohhh"))
		end
		if room:GetType() == RoomType.ROOM_SACRIFICE then
			player.Luck = player.Luck - 1
		end
	end
end

local peachHeart = 8
	--- Peach speed cannot surpass 0.75 ---
function setPeachStats()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" then
		if player.MoveSpeed > 0.65 then
			player.MoveSpeed = 0.65
		end
		peachHeart = player:GetMaxHearts()
		if peachHeart ~= player:GetMaxHearts() then
			player:AddMaxHearts(peachHeart - 2)
		end
	end
end

function setPeachHeart()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" 
	and sirPeachEnable == 0 then
		player:AddMaxHearts(peachHeart - 2)
	end
end

	--- Remove pound of flesh for peach ---
function removeFleshPeach()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" 
	and player:HasCollectible(672) then
		player:RemoveCollectible(672)
		player:AnimateSad()
		SFXManager():Play(Isaac.GetSoundIdByName("oof"))
	end
end

--- Remove pound of flesh for peach ---
function removeFleshPeach()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" 
	and player:HasCollectible(672) then
		player:RemoveCollectible(672)
		player:AnimateSad()
		SFXManager():Play(Isaac.GetSoundIdByName("oof"))
	end
end

	--- Give sir peach 5 coins, 1 key and Pound Meat
local sirPeachEnable = 0
function sirPeachBuff()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Sir_Peach" 
		and sirPeachEnable == 0 then
		player:AddCoins(5)
		player:AddKeys(1)
		player:RemoveCollectible(214)
		if player:HasCollectible(672) == false then
			player:AddCollectible(672)
		end
		sirPeachEnable = 1
	end
end

	--- Cache Peach`s Heart before he died ---
local sirPeachMaxHeartCache = 8
local peachDeath = false
function getPeachHeart()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" then
		sirPeachMaxHeartCache = player:GetMaxHearts()
		peachDeath = true
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_ENTITY_KILL, getPeachHeart, EntityType.ENTITY_PLAYER)

function setSirPeachHeart()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Sir_Peach" 
	and player:GetMaxHearts() > 2 then
		player:AddMaxHearts(-player:GetMaxHearts() + 2)
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, setSirPeachHeart)

	--- Set sirPeach when its enabled for the current level ---
function setSirPeach()
	sirPeachEnable = 0
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" 
	and player:GetMaxHearts() ~= 8
	and peachDeath == true then
		player:AddMaxHearts(sirPeachMaxHeartCache - 2)
		peachDeath = false
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, setSirPeach)

	--- Sand gains 0.5 dmg everytime a room is cleared with Fire Candle ---
function dmgGainSandCandle()
	local player = Isaac.GetPlayer(0)
	local room = Game():GetRoom()
	if player:GetName() == "Sand" 
	and player:HasCollectible(CollectibleType.COLLECTIBLE_RED_CANDLE)
	and room:IsClear() == false then
		player.Damage = player.Damage + 0.2
		sandDMG = sandDMG + 0.2
	end
end

	--- Sand gains 0.01 speed when moms bra is used, plays ice sound --- 
function dmgGainSandMomBra()
	SFXManager():Play(Isaac.GetSoundIdByName("ice"))
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Sand" then
		player.MoveSpeed = player.MoveSpeed + 0.01
		sandSpeed = sandSpeed + 0.01
	end
end


	--- Set Todd's max coin to 95 ---
function maxCoinTodd()
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
function randomCoinTodd()
	local player = Isaac.GetPlayer(0)
	
	local RECOMMENDED_SHIFT_IDX = 35
	local rng = RNG()
	rng:SetSeed(math.random(4294967295), RECOMMENDED_SHIFT_IDX)
	randomChance = rng:RandomFloat() + (player.Luck * 0.02)
	randomAmount = rng:RandomInt(3)
	
	if player:GetName() == "Todd" then 
		if randomChance < 0.4 and randomChance > 0 then
			if player:GetNumCoins() - toddCoin == 1
			or player:GetNumCoins() - toddCoin == 2 then
				player:AddCoins(-randomAmount)
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
			player:AddCoins(-randomAmount)
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

	--- replaces all bombs to batteries for win8, then replaces all non-normal tarot cards to normal tarot cards ---
function winBatteryDrop()
	local player = Isaac.GetPlayer(0)
	local itemPool = game:GetItemPool()
	local roomEntities = Isaac.GetRoomEntities()
	if player:GetName() == "Win8" then
		for i, entity in pairs(roomEntities) do
			local entityPosition = entity.Position
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.Variant == PickupVariant.PICKUP_BOMB
				and entity.SubType == BombSubType.BOMB_NORMAL then
				entity:Remove()
				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_MICRO, entityPosition, Vector(0,0), nil)
			end
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.Variant == PickupVariant.PICKUP_BOMB
				and entity.SubType == BombSubType.BOMB_DOUBLEPACK then
				entity:Remove()
				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_NORMAL, entityPosition, Vector(0,0), nil)
			end
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.Variant == PickupVariant.PICKUP_BOMB
				and entity.SubType == BombSubType.BOMB_GOLDEN then
				entity:Remove()
				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, BatterySubType.BATTERY_GOLDEN, entityPosition, Vector(0,0), nil)
			end
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.Variant == PickupVariant.PICKUP_COLLECTIBLE
				and entity.SubType == itemPool:GetCollectible(ItemPoolType.POOL_BOMB_BUM, false, Random(), entity.SubType) then
				entity:Remove()
				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, itemPool:GetCollectible(ItemPoolType.POOL_TREASURE), entityPosition, Vector(0,0), nil)
			end
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.Variant == PickupVariant.PICKUP_TAROTCARD
				and entity.SubType > 22 
				and entity.SpawnerType == 0 then
				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, math.ceil(math.random(1, 22)), entityPosition, Vector(0,0), nil)
				entity:Remove() 
			end
		end
		if player:GetNumBombs() > 0 then
			player:AddBombs(-99)
		end 
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, winBatteryDrop)


	--- Win8 merges two cards in the slot together when pressed bomb button, if mergable ---
local cardMatrix = {}
function winCardForge()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Win8" 
	and player:GetCard(0) * player:GetCard(1) ~= 0 
	and player:GetCard(0) < 23 
	and player:GetCard(1) < 23 
	and Input.IsActionPressed(ButtonAction.ACTION_BOMB, 0) then
		local row = player:GetCard(0)
		local col = player:GetCard(1)
		if cardMatrix[player:GetCard(0)][player:GetCard(1)] ~= 0 then
			player:SetCard(1, 0)
			player:SetCard(0, cardMatrix[row][col])
			player:AnimateCard(player:GetCard(0))
			SFXManager():Play(Isaac.GetSoundIdByName("card_merge"))
		elseif cardMatrix[player:GetCard(1)][player:GetCard(0)] ~= 0 then
			player:SetCard(1, 0)
			player:SetCard(0, cardMatrix[col][row])
			player:AnimateCard(player:GetCard(0))
			SFXManager():Play(Isaac.GetSoundIdByName("card_merge"))
		end
	end
end
-- Mod:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, winCardForge, CollectibleType.COLLECTIBLE_DECK_OF_CARDS)
Mod:AddCallback(ModCallbacks.MC_INPUT_ACTION, winCardForge, 0, InputHook.IS_ACTION_Pressed, ButtonAction.ACTION_BOMB)

	--- Win8 only gets a normal tarot card when using card deck ---
function winUseCardDeck()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Win8" then
		player:SetCard(0, math.ceil(math.random(1, 22)))
	end
end
Mod:AddCallback(ModCallbacks.MC_USE_ITEM, winUseCardDeck, CollectibleType.COLLECTIBLE_DECK_OF_CARDS)

	--- Win8's initial charge for card deck will always be 3 ---
function winChargeCardDeck()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Win8" 
	and player:HasCollectible(85) then
		for i = 0, 1 do
			if player:GetActiveItem(i) == CollectibleType.COLLECTIBLE_DECK_OF_CARDS 
			and player:GetActiveCharge(i) == 0 then
				player:SetActiveCharge(3)
			end
		end
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, winChargeCardDeck)

	--- Renders text on screen to show what cards can be merged into for Win8, if possible ---
function winShowCard()	
	local f = Font()
	f:Load("font/teammeatfont10.fnt") 
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Win8" 
	and player:GetCard(0) * player:GetCard(1) ~= 0 
	and player:GetCard(0) < 23 
	and player:GetCard(1) < 23 then
		local row = player:GetCard(0)
		local col = player:GetCard(1)
		if cardMatrix[player:GetCard(0)][player:GetCard(1)] ~= 0 then
			f:DrawString(cardList[cardMatrix[row][col]], 170,280,KColor(1,1,1,1,0,0,0),0,true)
		elseif cardMatrix[player:GetCard(1)][player:GetCard(0)] ~= 0 then
			f:DrawString(cardList[cardMatrix[col][row]], 170,280,KColor(1,1,1,1,0,0,0),0,true)
		end
	end	
end
Mod:AddCallback(ModCallbacks.MC_POST_RENDER, winShowCard)

-- function winDropCardDevil()
-- 	local player = Isaac.GetPlayer(0)
-- 	local roomEntities = Isaac.GetRoomEntities()
-- 	if player:GetName() == "Win8" then
-- 		for i, entity in pairs(roomEntities) do
-- 			if entity:IsBoss() == true then
-- 				local entityPosition = entity.Position
-- 				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_DEVIL, entityPosition, Vector(0,0), nil)
-- 			end
-- 		end
-- 	end
-- end
-- Mod:AddCallback(ModCallbacks.MC_POST_ENTITY_KILL, winDropCardDevil)

-- function winDropCardDeath(chest, player)
-- 	player = Isaac.GetPlayer(0)
-- 	local roomEntities = Isaac.GetRoomEntities()
-- 	local chance = randomChanceGenerate()
-- 	if player:GetName() == "Win8" then
-- 		for i, entity in pairs(roomEntities) do
-- 			if entity.SubType == ChestSubType.CHEST_OPENED then
-- 				print(entity.SubType)
-- 				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, Card.CARD_DEATH, player.Position, Vector(0,0), nil)
-- 			end
-- 		end
-- 	end
-- end
-- Mod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, winDropCardDeath, PickupVariant.PICKUP_REDCHEST)

	--- Pauses music when hourglass is used and plays barking sfx ---
local musicState = true
function noBarking()
	MusicManager():Pause()
	SFXManager():Play(Isaac.GetSoundIdByName("bark"))
	musicState = false
end

	--- Resumes music when enters new room ---
function playMusic()
	local player = Isaac.GetPlayer(0)
	if player:HasCollectible(CollectibleType.COLLECTIBLE_HOURGLASS) and musicState == false then
		MusicManager():Resume()
	end
end

function resetGlobalValues()
	sandDMG = 0
	sandSpeed = 0
	musicState = true
end
Mod:AddCallback(ModCallbacks.MC_POST_GAME_END, resetGlobalValues)
Mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, resetGlobalValues)

------------------------ Sound Effects ------------------------

	--- Plays liproll sound when butter bean is used ---
function liproll()
	SFXManager():Stop(37)
	SFXManager():Play(Isaac.GetSoundIdByName("liproll"))
end
Mod:AddCallback(ModCallbacks.MC_USE_ITEM, liproll, CollectibleType.COLLECTIBLE_BUTTER_BEAN)

	--- Replaces sound that randomly triggers ----
function replaceSoundRandom(ID, newSound)
	if SFXManager():IsPlaying(ID)
		and SFXManager():IsPlaying(Isaac.GetSoundIdByName(newSound)) == false then
		SFXManager():AdjustVolume(ID, 0)
		SFXManager():Play(Isaac.GetSoundIdByName(newSound))
	end
end

	--- Replaces sound that is triggered by conditions ----
function replaceSoundStop(ID, newSound)
	if SFXManager():IsPlaying(ID) then
		SFXManager():Stop(ID)
		SFXManager():Play(Isaac.GetSoundIdByName(newSound))
	end
end

	--- Mutes a sound ----
function soundMute(ID)
	if SFXManager():IsPlaying(ID) then
		SFXManager():AdjustVolume(ID, 0)
	end
end

	--- replace sound using sprite events ---
function replaceSoundSprite(sprite, event, soundName)
	if sprite:IsEventTriggered(event) then
		SFXManager():Play(Isaac.GetSoundIdByName(soundName))
	end
end

	--- replace sound using sprite events, also stops original sound ---
function replaceSoundSpriteID(sprite, event, ID, soundName)
	if sprite:IsEventTriggered(event) then
		SFXManager():Stop(ID)
		SFXManager():Play(Isaac.GetSoundIdByName(soundName))
	end
end

	--- Replaces all Isaac (boss) sfx to Kid's ---
local kidSoundCounter = 0
function kidSound()
	local roomEntities = Isaac.GetRoomEntities()
	replaceSoundRandom(143, "kid_sound") --- sound 143 is triggered randomly when Isaac is in the room
	replaceSoundStop(54, "kid_charge")
	replaceSoundStop(267, "kid_shoot")
	replaceSoundStop(268, "kid_jump")
	SFXManager():Stop(266) --- Stop sound Superholy completely, playing sounds by events
	for i, entity in pairs(roomEntities) do 
		if entity.Type == EntityType.ENTITY_ISAAC then
			local sprite = entity:GetSprite()
			replaceSoundSprite(sprite, "Evolve", "IWBTG")
			replaceSoundSprite(sprite, "Death", "guy_death")
			replaceSoundSprite(sprite, "Explosion", "guy_explosion")
		end
	end
	-- if SFXManager():IsPlaying(266) 
	-- and kidSoundCounter == 0
	-- and SFXManager():IsPlaying(Isaac.GetSoundIdByName("IWBTG")) == false then 
		-- SFXManager():Stop(266)
		-- SFXManager():Play(Isaac.GetSoundIdByName("IWBTG"))
		-- kidSoundCounter = 1
	-- end
			
	-- if SFXManager():IsPlaying(266) 
	-- and kidSoundCounter > 0 
	-- and SFXManager():IsPlaying(Isaac.GetSoundIdByName("guy_death")) == false then 
		-- SFXManager():Stop(266)
		-- SFXManager():Play(Isaac.GetSoundIdByName("guy_death"))	
	-- end
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, kidSound, EntityType.ENTITY_ISAAC)

	--- Replaces moms heart in and out with Spamton sfx ---
function spamtonSound()
	replaceSoundStop(212, "spamtonin")
	replaceSoundStop(213, "spamtonout")
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, spamtonSound, EntityType.ENTITY_MOMS_HEART)

	--- Replaces dingle sfx with Situ ---
function situSound()
	local roomEntities = Isaac.GetRoomEntities()
	for i, entity in pairs(roomEntities) do 
		if entity.Type == EntityType.ENTITY_DINGLE
			and entity.Variant == 0 then 
			replaceSoundStop(301, "situ_laugh")
			replaceSoundRandom(315, "situ_whistle")
			replaceSoundStop(303, "situ_shoot")
		end
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, situSound, EntityType.ENTITY_DINGLE)

	--- Replaces adversary sfx with wither ---
function mcDarkOneSound()
	soundMute(116) --- sound 116 is triggered every render for unknown reason, therefore it cannot be replaced
	replaceSoundStop(118, "wither_roar")
	replaceSoundStop(112, "wither_grunt")
	replaceSoundStop(48, "wither_stomp")
	replaceSoundStop(122, "wither_yell")
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, mcDarkOneSound, EntityType.ENTITY_ADVERSARY)

	--- Replaces darkone sfx with the twins ---
function trDarkOneSound()
	replaceSoundStop(104, "tr_grunt")
	replaceSoundStop(119, "tr_roar")
	replaceSoundStop(115, "tr_roar")
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, trDarkOneSound, EntityType.ENTITY_DARK_ONE)

	--- Adds tr slimes death sounds ---
function slimeDeathSound()
	replaceSoundStop(207, "slime_gel")
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, slimeDeathSound, EntityType.ENTITY_BLASTOCYST_BIG)
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, slimeDeathSound, EntityType.ENTITY_BLASTOCYST_MEDIUM)
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, slimeDeathSound, EntityType.ENTITY_BLASTOCYST_SMALL)
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, slimeDeathSound, EntityType.ENTITY_EMBRYO)

	--- Replaces monstro2 and gish sfx with shuodedaoli and mc slime ---
function shuoDeDaoLiSound()
	local roomEntities = Isaac.GetRoomEntities()
	for i, entity in pairs(roomEntities) do 
		if entity.Type == EntityType.ENTITY_MONSTRO2
			and entity.Variant == 0 then 
			replaceSoundStop(14, "daoli_jump")
			replaceSoundStop(16, "daoli_roar")
		end
		if entity.Type == EntityType.ENTITY_MONSTRO2
			and entity.Variant == 1 then --- Gish is a variant of Monstro 2
			replaceSoundStop(14, "slime_jump")
			replaceSoundStop(48, "slime_fall")
			replaceSoundStop(16, "slime_shoot")
		end
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, shuoDeDaoLiSound, EntityType.ENTITY_MONSTRO2)

function bungeeZombieSound()
	replaceSoundStop(16, "bungee_zombie")
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, bungeeZombieSound, EntityType.ENTITY_DADDYLONGLEGS)

function yibaikuaiSound()
	replaceSoundStop(311, "yibai_puke")
	replaceSoundStop(303, "yibai_shoot")
	replaceSoundStop(302, "yibai_grunt")
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, yibaikuaiSound, EntityType.ENTITY_MEGA_FATTY)

function squashSound()
	local roomEntities = Isaac.GetRoomEntities()
	for i, entity in pairs(roomEntities) do 
		if entity.Type == EntityType.ENTITY_MONSTRO
			and entity.SubType == 0 then 
			replaceSoundStop(14, "squash_hmm")
		end
		if entity.Type == EntityType.ENTITY_MONSTRO
			and entity.SubType == 1 then --- Slime Queen
			replaceSoundStop(14, "queen_jump")
			replaceSoundStop(16, "queen_puke")
		end
		if entity.Type == EntityType.ENTITY_MONSTRO
			and entity.SubType == 2 then --- Goo
			replaceSoundStop(14, "goo_jump")
			replaceSoundStop(16, "goo_puke")
		end
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, squashSound, EntityType.ENTITY_MONSTRO)

function skeletronSound()
	local roomEntities = Isaac.GetRoomEntities()
	for i, entity in pairs(roomEntities) do 
		if entity.Type == EntityType.ENTITY_WIDOW
			and entity.Variant == 1 then --- The Wretched is a variant of Widow
			replaceSoundStop(158, "tr_grunt")
			replaceSoundStop(185, "tr_explode")
		end
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, skeletronSound, EntityType.ENTITY_WIDOW)

function vagrantSound()
	local roomEntities = Isaac.GetRoomEntities()
	for i, entity in pairs(roomEntities) do 
		if entity.Type == EntityType.ENTITY_RAINMAKER then
			local sprite = entity:GetSprite()
			replaceSoundSprite(sprite, "Lightning", "wandering_flower")
			replaceSoundSprite(sprite, "Explosion", "vargant_death")
			replaceSoundStop(486, "vargant_bullet")
			replaceSoundRandom(25, "wandering")
		end
	end
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, vagrantSound, EntityType.ENTITY_RAINMAKER)

	------------ Miniboss Sfx ------------
function playMinibossSound(soundName, soundNameUltra, miniboss)
	local roomEntities = Isaac.GetRoomEntities()
	for i, entity in pairs(roomEntities) do 
		if entity.Type == miniboss 
			and entity.Variant == 0 then
			SFXManager():Play(Isaac.GetSoundIdByName(soundName))
		end
		if entity.Type == miniboss 
			and entity.Variant == 1 then
			SFXManager():Play(Isaac.GetSoundIdByName(soundNameUltra))
		end
	end
end	

function aaSound()
	playMinibossSound("aa", "aa_ultra", EntityType.ENTITY_SLOTH)
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, aaSound, EntityType.ENTITY_SLOTH)

function markSound()
	playMinibossSound("mark", "mark_ultra", EntityType.ENTITY_GLUTTONY)
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, markSound, EntityType.ENTITY_GLUTTONY)

function saoSound()
	SFXManager():Play(Isaac.GetSoundIdByName("sao"))
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, saoSound, EntityType.ENTITY_ENVY)

function lustSound()
	playMinibossSound("nzm", "nmsl", EntityType.ENTITY_LUST)
end
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, lustSound, EntityType.ENTITY_LUST)

--- dmgGainSandCandle ---
Mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, dmgGainSandCandle)
--- dmgGainSandMomBra ---
Mod:AddCallback(ModCallbacks.MC_USE_ITEM, dmgGainSandMomBra, CollectibleType.COLLECTIBLE_MOMS_BRA)
--- randomCoinTodd ---
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, randomCoinTodd)
--- maxCoinTodd ---
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, maxCoinTodd)
--- noBarking ---
Mod:AddCallback(ModCallbacks.MC_USE_ITEM, noBarking, CollectibleType.COLLECTIBLE_HOURGLASS)
Mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, playMusic)
--- dropBombBack ---
-- Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, dropBombBack)
-- Mod:AddCallback(ModCallbacks.MC_POST_ENTITY_REMOVE, dropBombBack)
--- removeGoldPillXiaoBai ---
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, removeGoldPillXiaoBai)
--- removeGoldPillEffectXiaoBai ---
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, removeGoldPillEffectXiaoBai)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, peachAngelRoomItem)

Mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, peachHeal, EntityType.ENTITY_PLAYER)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, removeFleshPeach)

Mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, setPeachStats)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, sirPeachBuff)
	--- Replaces Sand's random starting trinket with Blessed Penny
Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
function(_,mpgsc) 
	local player = Isaac.GetPlayer(0)
	local roomEntities = Isaac.GetRoomEntities()
	if player:GetName() == "Sand" then
		for i, entity in pairs(roomEntities) do
			if entity.Type == EntityType.ENTITY_PICKUP
				and entity.Variant == PickupVariant.PICKUP_TRINKET then
				entity:Remove()
				Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, TrinketType.TRINKET_BLESSED_PENNY, entity.Position, Vector(0,0), nil)
			end
		end
	end
end)

	--- Replaces Todd's starting item as hourglass and removes starting trinket ---
Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
function(_,mpgsc) 
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Todd" then
		if(not mpgsc) then 
			if player:HasCollectible(349) then
				player:RemoveCollectible(349)
				player:AddCollectible(CollectibleType.COLLECTIBLE_HOURGLASS, 2)
				player:TryRemoveTrinket(TrinketType.TRINKET_STORE_KEY)
			end
		end 
	end
end)

	--- Replaces ShanD's starting item as ButterBean ---
Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
function(_,mpgsc) 
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "ShanD" then
		if(not mpgsc) then 
			if player:HasCollectible(105) then
				player:RemoveCollectible(105)
				player:AddCollectible(CollectibleType.COLLECTIBLE_BUTTER_BEAN, 2)
			end
		end 
	end
end)

	--- Removes peach's starting item ---
Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
function(_,mpgsc) 
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" then
		if(not mpgsc) then 
			player:AddCollectible(604)
			if player:HasCollectible(214) then
				player:RemoveCollectible(214)
			end
		end 
	end
end)

--- Removes peach's starting item ---
Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
function(_,mpgsc) 
	local player = Isaac.GetPlayer(0)
	local roomEntities = Isaac.GetRoomEntities()
	if player:GetName() == "Win8" then
		if(not mpgsc) then 
			player:SetCard(0, 0)
			for i, entity in pairs(roomEntities) do
				if entity.Type == EntityType.ENTITY_PICKUP
					and entity.Variant == PickupVariant.PICKUP_TAROTCARD then
					entity:Remove()
				end
			end
		end 
	end
end)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
function(_,mpgsc) 
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Win8" then
		if(not mpgsc) then 
			for i = 1, 22 do --- Initialise matrix
				cardMatrix[i] = {}     -- create a new row
				 for j = 1, 22 do
					cardMatrix[i][j] = 0
				 end
			 end
			 for i = 1, 22 do
				cardMatrix[i][i] = 55 + i
			 end
			 cardMatrix[17][17] = 42
			 cardMatrix[1][6] = 35
			 cardMatrix[1][14] = 91
			 cardMatrix[1][17] = 72
			 cardMatrix[1][22] = 53
			 cardMatrix[2][3] = 50
			 cardMatrix[2][10] = 93
			 cardMatrix[2][13] = 80
			 cardMatrix[2][17] = 23
			 cardMatrix[3][10] = 38
			 cardMatrix[3][14] = 41
			 cardMatrix[4][7] = 30
			 cardMatrix[5][16] = 88
			 cardMatrix[5][19] = 78
			 cardMatrix[5][20] = 51
			 cardMatrix[6][3] = 96
			 cardMatrix[7][6] = 26
			 cardMatrix[8][12] = 52
			 cardMatrix[8][14] = 39
			 cardMatrix[8][17] = 32
			 cardMatrix[9][2] = 55
			 cardMatrix[9][10] = 28
			 cardMatrix[9][18] = 49
			 cardMatrix[10][18] = 25
			 cardMatrix[11][2] = 40
			 cardMatrix[11][10] = 24
			 cardMatrix[11][14] = 89
			 cardMatrix[11][17] = 27
			 cardMatrix[12][3] = 86
			 cardMatrix[12][7] = 82
			 cardMatrix[12][17] = 84
			 cardMatrix[12][21] = 87
			 cardMatrix[13][3] = 92
			 cardMatrix[13][5] = 97
			 cardMatrix[13][19] = 47
			 cardMatrix[13][22] = 36
			 cardMatrix[13][23] = 54
			 cardMatrix[14][13] = 95
			 cardMatrix[15][2] = 44
			 cardMatrix[15][4] = 85
			 cardMatrix[16][14] = 46
			 cardMatrix[18][3] = 94
			 cardMatrix[18][16] = 31
			 cardMatrix[19][15] = 34
			 cardMatrix[20][7] = 79
			 cardMatrix[20][10] = 43
			 cardMatrix[20][18] = 29
			 cardMatrix[21][11] = 48
			 cardMatrix[21][18] = 37
			 cardMatrix[21][19] = 83
			 cardMatrix[22][9] = 33
			 cardMatrix[22][11] = 90
			 cardMatrix[22][17] = 45
			 cardMatrix[22][18] = 81
		end 
	end
end)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
function(_,mpgsc) 
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Win8" then
		if(not mpgsc) then 
			for i=23, 98 do
				cardList[i] = ""
			end
			cardList[23] = "2 of Clubs"
			cardList[24] = "2 of Diamonds"
			cardList[25] = "2 of Spades"
			cardList[26] = "2 of Hearts"
			cardList[27] = "Ace of Clubs"
			cardList[28] = "Ace of Diamonds"
			cardList[29] = "Ace of Spades"
			cardList[30] = "Ace of Hearts"
			cardList[31] = "Joker"
			cardList[32] = "Hagalaz"
			cardList[33] = "Jera"
			cardList[34] = "Ehwaz"
			cardList[35] = "Dagaz"
			cardList[36] = "Ansuz"
			cardList[37] = "Perthro"
			cardList[38] = "Berkano"
			cardList[39] = "Algiz"
			cardList[40] = "Blank Rune"
			cardList[41] = "Black Rune"
			cardList[42] = "Chaos Card"
			cardList[43] = "Credit Card"
			cardList[44] = "Rules Card"
			cardList[45] = "A Card Against Humanity"
			cardList[46] = "Suicide King"
			cardList[47] = "Get Out of Jail Free Card"
			cardList[48] = "? Card"
			cardList[49] = "Dice Shard"
			cardList[50] = "Emergency Contact"
			cardList[51] = "Holy Card"
			cardList[52] = "Huge Growth"
			cardList[53] = "Ancient Recall"
			cardList[54] = "Sonic"
			cardList[55] = "Rune Shard"
			cardList[56] = "The Fool?"
			cardList[57] = "The Magician?"
			cardList[58] = "Dave's Pan?"
			cardList[59] = "The Empress?"
			cardList[60] = "The Hierophant?"
			cardList[61] = "The Lovers?"
			cardList[62] = "The Chariot?"
			cardList[63] = "The Justice?"
			cardList[64] = "The Hermit?"
			cardList[65] = "Wheel of Fortune?"
			cardList[66] = "Justice?"
			cardList[67] = "Strength?"
			cardList[68] = "The Hanged Man?"
			cardList[69] = "Death?"
			cardList[70] = "Temperance?"
			cardList[71] = "The Devil?"
			cardList[72] = "The Tower?"
			cardList[73] = "The Stars?"
			cardList[74] = "The Moon?"
			cardList[75] = "The Sun?"
			cardList[76] = "Judgement?"
			cardList[77] = "The World?"
			cardList[78] = "Cracked Key"
			cardList[79] = "Queen of Hearts"
			cardList[80] = "Wild Card"
			cardList[81] = "Soul of Isaac"
			cardList[82] = "Soul of Magdalene"
			cardList[83] = "Soul of Cain"
			cardList[84] = "Soul of Judas"
			cardList[85] = "Soul of ???"
			cardList[86] = "Soul of Eve"
			cardList[87] = "Soul of Samson"
			cardList[88] = "Soul of Azazel"
			cardList[89] = "Soul of Lazarus"
			cardList[90] = "Soul of Eden"
			cardList[91] = "Soul of the Lost"
			cardList[92] = "Soul of Lilith"
			cardList[93] = "Soul of the Keeper"
			cardList[94] = "Soul of Apollyon"
			cardList[95] = "Soul of Forgotten"
			cardList[96] = "Soul of Bethany"
			cardList[97] = "Soul of Jacob and Esau"
		end
	end
end)


--- Player starting stats ----
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, shand.onCache)
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, otto.onCache)
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, xiaobai.onCache)
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, sand.onCache)
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, back.onCache)
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, todd.onCache)
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, peach.onCache)
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, win8.onCache)