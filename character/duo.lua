duo_module = {}

--- Give Duo a starting item 721 ---
local isEasterEgg = false
function duo_module.unNameFunction1(_, mpgsc)
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "Duo" then
        if (not mpgsc) then
            local duoChance = math.random()
            if duoChance < 0 then 
                if player:HasCollectible(721) == false then
                    player:AddCollectible(721)
                end
            else        
                isEasterEgg = true
                local easterEggChance = math.random()
                if easterEggChance <= 0.5 and easterEggChance > 0 then --- Easter egg: give Duo 妈刀+硫磺火+剖腹产+科技X
                    player:AddCollectible(114)
                    player:AddCollectible(118)
                    player:AddCollectible(395)
                    player:AddCollectible(678)
                    player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/duo_hairs/character_009_edenhair32.anm2"))
                    player:AnimateHappy()
                    SFXManager():Play(Isaac.GetSoundIdByName("bigbrain"))
                elseif easterEggChance <= 1 and easterEggChance > 0.5 then --- Easter egg: give Duo 鞭子 化身为Van
                    player:AddCollectible(722)
                    player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/duo_hairs/character_009_edenhair25.anm2"))
                    player:AnimateHappy()
                    SFXManager():Play(Isaac.GetSoundIdByName("bigbrain"))
                end
            end
        end
    end
end

--- Changes Duo's costume randomly everytime enterings a room ---
function duo_module.duoSpriteChange()
    local player = Isaac.GetPlayer(0)
    if player:GetName() == "Duo" and isEasterEgg == false then
        player:RemoveSkinCostume()
        local hairNumber = math.ceil(math.random(40))
        player:AddNullCostume(Isaac.GetCostumeIdByPath("gfx/characters/duo_hairs/character_009_edenhair" .. hairNumber .. ".anm2"))
    end
end

return duo_module
