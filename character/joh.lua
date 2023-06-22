joh_module = {}


--- Remove school bag for Joh ---
function joh_module.johRemoveBag()
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "John" then
        if player:HasCollectible(534) then
            player:RemoveCollectible(534)
            player:AnimateSad()
            SFXManager():Play(Isaac.GetSoundIdByName("oof"))
        end
    end
end

--- Disables Joh's katana if heart is larger than 4 ---
function joh_module.johDisableActive()
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "John" and player:GetMaxHearts() > 8 then
        player:DischargeActiveItem()
    end
end

--- Joh cannot change his active item to anything else ---
local hadChanged = false
local currentFrame = 0
function joh_module.johChangeActive()
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "John" and player:GetActiveItem() == 0 then
        player:RemoveCollectible(player:GetActiveItem())
        player:AddCollectible(705)

        local roomEntities = Isaac.GetRoomEntities()
        for i, entity in pairs(roomEntities) do --- Remove katana pickup
            if entity.Type == EntityType.ENTITY_PICKUP
                and entity.Variant == PickupVariant.PICKUP_COLLECTIBLE
                and entity.SubType == 705 then
                entity:Remove()
            end
        end
    else
        if player:GetName() == "John" and player:GetActiveItem() ~= 705 and not hadChanged then
            player:RemoveCollectible(player:GetActiveItem())
            player:AddCollectible(705)
            hadChanged = true
            currentFrame = Game():GetFrameCount()
            player:AnimateSad()
            SFXManager():Play(Isaac.GetSoundIdByName("oof"))

            local roomEntities = Isaac.GetRoomEntities()
            for i, entity in pairs(roomEntities) do --- Remove katana pickup
                if entity.Type == EntityType.ENTITY_PICKUP
                    and entity.Variant == PickupVariant.PICKUP_COLLECTIBLE
                    and entity.SubType == 705 then
                    entity:Remove()
                end
            end
        end
    end
    if player:GetName() == "John" and Game():GetFrameCount() > currentFrame + 120 then
        hadChanged = false
    end
end

--- Remove Joh's trinket at the start of the game ---
function joh_module.unNameFunction1(_, mpgsc)
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "John" then
        if (not mpgsc) then
            player:TryRemoveTrinket(TrinketType.TRINKET_CHILDS_HEART)
        end
    end
end

return joh_module
