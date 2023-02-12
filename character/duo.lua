duo_module = {}

--- Give Duo a starting item 721 ---
function duo_module.unNameFunction1(_, mpgsc)
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "Duo" then
        if (not mpgsc) then
            local duoChance = math.random()
            if duoChance > 0.05 then 
                if player:HasCollectible(721) == false then
                    player:AddCollectible(721)
                end
            else        --- Easter egg: give Duo 妈刀+硫磺火+剖腹产+科技X
                player:AddCollectible(114)
                player:AddCollectible(118)
                player:AddCollectible(395)
                player:AddCollectible(678)
            end
        end
    end
end

--- Changes Duo's costume randomly everytime enterings a room ---
function duo_module.duoSpriteChange()
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "Duo" then
        player:RemoveSkinCostume()
        local hairNumber = math.ceil(math.random(40))
        player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/character_009_edenhair" .. hairNumber .. ".anm2"))
    end
end

return duo_module
