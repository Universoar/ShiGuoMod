peach_module = {}

peach_module.peach = {
	DAMAGE = 1,
	SPEED = -0.25,
	SHOTSPEED = 0.7,
	TEARHEIGHT = -0.15,
	MaxFireDelay = 1.35, --1 is defaut
	TEARRANGE = 0.7, --1 is defaut
	TEARFALLINGSPEED = 0,
	LUCK = 0,
	FLYING = false,
	TEARFLAG = 0, -- 0 is default
	TEARCOLOR = Color(1.0, 1.0, 1.0, 1.0, 0, 0, 0)
}

local game = Game()

----Peach Stats----
function peach_module.peach:onCache(player, cacheFlag) -- I do mean everywhere!
	if player:GetName() == "Peach" then -- Especially here!
		if cacheFlag == CacheFlag.CACHE_DAMAGE then
			player.Damage = player.Damage + peach_module.peach.DAMAGE
		end
		if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
			player.ShotSpeed = player.ShotSpeed + peach_module.peach.SHOTSPEED
		end
		if cacheFlag == CacheFlag.CACHE_RANGE then
			player.TearHeight = player.TearHeight - peach_module.peach.TEARHEIGHT
			player.TearFallingSpeed = player.TearFallingSpeed + peach_module.peach.TEARFALLINGSPEED
			player.TearRange = player.TearRange * peach_module.peach.TEARRANGE
		end
		if (cacheFlag == CacheFlag.CACHE_FIREDELAY) then
			player.MaxFireDelay = player.MaxFireDelay * peach_module.peach.MaxFireDelay
		end
		if cacheFlag == CacheFlag.CACHE_SPEED then
			player.MoveSpeed = player.MoveSpeed + peach_module.peach.SPEED
		end
		if cacheFlag == CacheFlag.CACHE_LUCK then
			player.Luck = player.Luck + peach_module.peach.LUCK
		end
		if cacheFlag == CacheFlag.CACHE_FLYING and peach_module.peach.FLYING then
			player.CanFly = true
		end
		if cacheFlag == CacheFlag.CACHE_TEARFLAG then
			player.TearFlags = player.TearFlags | peach_module.peach.TEARFLAG
		end
		if cacheFlag == CacheFlag.CACHE_TEARCOLOR then
			player.TearColor = peach_module.peach.TEARCOLOR
		end
		if cacheFlag == CacheFlag.CACHE_SIZE then
			player.SpriteScale = player.SpriteScale * 1.2500623464584
		end
	end
end

local currentFrame = 0
--- Replaces blue heart and black heart with rock spiders for Sir Peach ---
local dropHeartState = 0
function peach_module.dropHeartSirPeach()
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
						Isaac.Spawn(EntityType.ENTITY_ROCK_SPIDER, 1, 0, entityPosition, Vector(0, 0), nil)
						SFXManager():Play(Isaac.GetSoundIdByName("rock_spider"))
					end
					if entity.SubType == HeartSubType.HEART_BLACK then
						local entityPosition = entity.Position
						entity:Remove()
						isHeartRemoved = true
						Isaac.Spawn(EntityType.ENTITY_ROCK_SPIDER, 0, 0, entityPosition, Vector(0, 0), nil)
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

--- Removes items in angel room for Peach, except key pieces ---
function peach_module.peachAngelRoomItem()
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
function peach_module.peachHeal()
	local room = Game():GetRoom()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" then
		local RECOMMENDED_SHIFT_IDX = 35
		local rng = RNG()
		rng:SetSeed(math.random(4294967295), RECOMMENDED_SHIFT_IDX)
		helper_module.randomChance = rng:RandomFloat() + (player.Luck * 0.02)
		if helper_module.randomChance < 0.25 and helper_module.randomChance > 0
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
function peach_module.setPeachStats()
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

function peach_module.setPeachHeart()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach"
		and peach_module.sirPeachEnable == 0 then
		player:AddMaxHearts(peachHeart - 2)
	end
end

--- Remove pound of flesh for peach ---
function peach_module.removeFleshPeach()
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
function peach_module.sirPeachBuff()
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
function peach_module.getPeachHeart()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" then
		sirPeachMaxHeartCache = player:GetMaxHearts()
		peachDeath = true
	end
end

function peach_module.setSirPeachHeart()
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Sir_Peach"
		and player:GetMaxHearts() > 2 then
		player:AddMaxHearts(-player:GetMaxHearts() + 2)
	end
end

--- Set sirPeach when its enabled for the current level ---
function peach_module.setSirPeach()
	sirPeachEnable = 0
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach"
		and player:GetMaxHearts() ~= 8
		and peachDeath == true then
		player:AddMaxHearts(sirPeachMaxHeartCache - 2)
		peachDeath = false
	end
end

function peach_module.unNameFunction1(_, mpgsc)
	local player = Isaac.GetPlayer(0)
	if player:GetName() == "Peach" then
		if (not mpgsc) then
			player:AddCollectible(604)
			if player:HasCollectible(214) then
				player:RemoveCollectible(214)
			end
		end
	end
end

return peach_module
