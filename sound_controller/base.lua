sound_base_module = {}

local sand_module = require("character.sand")

--- Pauses music when hourglass is used and plays barking sfx ---
local musicState = true
function sound_base_module.noBarking()
    MusicManager():Pause()
    SFXManager():Play(Isaac.GetSoundIdByName("bark"))
    musicState = false
end

--- Resumes music when enters new room ---
function sound_base_module.playMusic()
    local player = Isaac.GetPlayer(0)
    if player:HasCollectible(CollectibleType.COLLECTIBLE_HOURGLASS) and musicState == false then
        MusicManager():Resume()
    end
end

function sound_base_module.resetGlobalValues()
    sand_module.sandDMG = 0
    sand_module.sandSpeed = 0
    musicState = true
end

------------------------ Sound Effects ------------------------

--- Plays liproll sound when butter bean is used ---
function sound_base_module.liproll()
    SFXManager():Stop(37)
    SFXManager():Play(Isaac.GetSoundIdByName("liproll"))
end

--- Replaces sound that randomly triggers ----
function sound_base_module.replaceSoundRandom(ID, newSound)
    if SFXManager():IsPlaying(ID)
        and SFXManager():IsPlaying(Isaac.GetSoundIdByName(newSound)) == false then
        SFXManager():AdjustVolume(ID, 0)
        SFXManager():Play(Isaac.GetSoundIdByName(newSound))
    end
end

--- Replaces sound that is triggered by conditions ----
function sound_base_module.replaceSoundStop(ID, newSound)
    if SFXManager():IsPlaying(ID) then
        SFXManager():Stop(ID)
        SFXManager():Play(Isaac.GetSoundIdByName(newSound))
    end
end

--- Mutes a sound ----
function sound_base_module.soundMute(ID)
    if SFXManager():IsPlaying(ID) then
        SFXManager():AdjustVolume(ID, 0)
    end
end

--- replace sound using sprite events ---
function sound_base_module.replaceSoundSprite(sprite, event, soundName)
    if sprite:IsEventTriggered(event) then
        SFXManager():Play(Isaac.GetSoundIdByName(soundName))
    end
end

--- replace sound using sprite events, also stops original sound ---
function sound_base_module.replaceSoundSpriteID(sprite, event, ID, soundName)
    if sprite:IsEventTriggered(event) then
        SFXManager():Stop(ID)
        SFXManager():Play(Isaac.GetSoundIdByName(soundName))
    end
end

--- Replaces all Isaac (boss) sfx to Kid's ---
-- local kidSoundCounter = 0
function sound_base_module.kidSound()
    local roomEntities = Isaac.GetRoomEntities()
    sound_base_module.replaceSoundRandom(143, "kid_sound") --- sound 143 is triggered randomly when Isaac is in the room
    sound_base_module.replaceSoundStop(54, "kid_charge")
    sound_base_module.replaceSoundStop(267, "kid_shoot")
    sound_base_module.replaceSoundStop(268, "kid_jump")
    SFXManager():Stop(266) --- Stop sound Superholy completely, playing sounds by events
    for i, entity in pairs(roomEntities) do
        if entity.Type == EntityType.ENTITY_ISAAC then
            local sprite = entity:GetSprite()
            sound_base_module.replaceSoundSprite(sprite, "Evolve", "IWBTG")
            sound_base_module.replaceSoundSprite(sprite, "Death", "guy_death")
            sound_base_module.replaceSoundSprite(sprite, "Explosion", "guy_explosion")
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

--- Replaces moms heart in and out with Spamton sfx ---
function sound_base_module.spamtonSound()
    sound_base_module.replaceSoundStop(212, "spamtonin")
    sound_base_module.replaceSoundStop(213, "spamtonout")
end

--- Replaces dingle sfx with Situ ---
function sound_base_module.situSound()
    local roomEntities = Isaac.GetRoomEntities()
    for i, entity in pairs(roomEntities) do
        if entity.Type == EntityType.ENTITY_DINGLE
            and entity.Variant == 0 then
            sound_base_module.replaceSoundStop(301, "situ_laugh")
            sound_base_module.replaceSoundRandom(315, "situ_whistle")
            sound_base_module.replaceSoundStop(303, "situ_shoot")
        end
    end
end

--- Replaces adversary sfx with wither ---
function sound_base_module.mcDarkOneSound()
    sound_base_module.soundMute(116) --- sound 116 is triggered every render for unknown reason, therefore it cannot be replaced
    sound_base_module.replaceSoundStop(118, "wither_roar")
    sound_base_module.replaceSoundStop(112, "wither_grunt")
    sound_base_module.replaceSoundStop(48, "wither_stomp")
    sound_base_module.replaceSoundStop(122, "wither_yell")
end

--- Replaces darkone sfx with the twins ---
function sound_base_module.trDarkOneSound()
    sound_base_module.replaceSoundStop(104, "tr_grunt")
    sound_base_module.replaceSoundStop(119, "tr_roar")
    sound_base_module.replaceSoundStop(115, "tr_roar")
end

--- Adds tr slimes death sounds ---
function sound_base_module.slimeDeathSound()
    sound_base_module.replaceSoundStop(207, "slime_gel")
end

--- Replaces monstro2 and gish sfx with shuodedaoli and mc slime ---
function sound_base_module.shuoDeDaoLiSound()
    local roomEntities = Isaac.GetRoomEntities()
    for i, entity in pairs(roomEntities) do
        if entity.Type == EntityType.ENTITY_MONSTRO2
            and entity.Variant == 0 then
            sound_base_module.replaceSoundStop(14, "daoli_jump")
            sound_base_module.replaceSoundStop(16, "daoli_roar")
        end
        if entity.Type == EntityType.ENTITY_MONSTRO2
            and entity.Variant == 1 then --- Gish is a variant of Monstro 2
            sound_base_module.replaceSoundStop(14, "slime_jump")
            sound_base_module.replaceSoundStop(48, "slime_fall")
            sound_base_module.replaceSoundStop(16, "slime_shoot")
        end
    end
end

function sound_base_module.bungeeZombieSound()
    sound_base_module.replaceSoundStop(16, "bungee_zombie")
end

function sound_base_module.yibaikuaiSound()
    sound_base_module.replaceSoundStop(311, "yibai_puke")
    sound_base_module.replaceSoundStop(303, "yibai_shoot")
    sound_base_module.replaceSoundStop(302, "yibai_grunt")
end

function sound_base_module.squashSound()
    local roomEntities = Isaac.GetRoomEntities()
    for i, entity in pairs(roomEntities) do
        if entity.Type == EntityType.ENTITY_MONSTRO
            and entity.SubType == 0 then
            sound_base_module.replaceSoundStop(14, "squash_hmm")
        end
        if entity.Type == EntityType.ENTITY_MONSTRO
            and entity.SubType == 1 then --- Slime Queen
            sound_base_module.replaceSoundStop(14, "queen_jump")
            sound_base_module.replaceSoundStop(16, "queen_puke")
        end
        if entity.Type == EntityType.ENTITY_MONSTRO
            and entity.SubType == 2 then --- Goo
            sound_base_module.replaceSoundStop(14, "goo_jump")
            sound_base_module.replaceSoundStop(16, "goo_puke")
        end
    end
end

function sound_base_module.skeletronSound()
    local roomEntities = Isaac.GetRoomEntities()
    for i, entity in pairs(roomEntities) do
        if entity.Type == EntityType.ENTITY_WIDOW
            and entity.Variant == 1 then --- The Wretched is a variant of Widow
            sound_base_module.replaceSoundStop(158, "tr_grunt")
            sound_base_module.replaceSoundStop(185, "tr_explode")
        end
    end
end

function sound_base_module.vagrantSound()
    local roomEntities = Isaac.GetRoomEntities()
    for i, entity in pairs(roomEntities) do
        if entity.Type == EntityType.ENTITY_RAINMAKER then
            local sprite = entity:GetSprite()
            sound_base_module.replaceSoundSprite(sprite, "Lightning", "wandering_flower")
            sound_base_module.replaceSoundSprite(sprite, "Explosion", "vargant_death")
            sound_base_module.replaceSoundStop(486, "vargant_bullet")
            sound_base_module.replaceSoundRandom(25, "wandering")
        end
    end
end

function sound_base_module.xianbeiSound()
	local roomEntities = Isaac.GetRoomEntities()
	for i, entity in pairs(roomEntities) do 
		if entity.Type == EntityType.ENTITY_CHUB
			and entity.Variant == 1 then --- CHAD is a variant of Chub
            sound_base_module.replaceSoundStop(115, "xianbei_AAA")
			sound_base_module.replaceSoundStop(116, "xianbei_roar")
			sound_base_module.replaceSoundStop(117, "xianbei_death")
			sound_base_module.replaceSoundStop(265, "xianbei_chew")
		end
	end
end

function sound_base_module.xushengSound()
    local roomEntities = Isaac.GetRoomEntities()
	for i, entity in pairs(roomEntities) do 
		if entity.Type == EntityType.ENTITY_BUMBINO then
            sound_base_module.replaceSoundStop(719, "xusheng_death")
			sound_base_module.replaceSoundStop(720, "xusheng_lebusishu")
			sound_base_module.replaceSoundStop(721, "xusheng_jiusha")
			sound_base_module.soundMute(722)
            sound_base_module.replaceSoundStop(723, "xusheng_sha")
            sound_base_module.replaceSoundStop(724, "xusheng_juedou")
            sound_base_module.replaceSoundStop(725, "xusheng_pozhi")
            sound_base_module.replaceSoundStop(726, "xusheng_wuxiekeji")
            sound_base_module.soundMute(303)
		end
	end
end

function sound_base_module.xushengAppear()
    SFXManager():Play(Isaac.GetSoundIdByName("xusheng_appear"))
end


------------ Miniboss Sfx ------------
function sound_base_module.playMinibossSound(soundName, soundNameUltra, miniboss)
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

function sound_base_module.aaSound()
    sound_base_module.playMinibossSound("aa", "aa_ultra", EntityType.ENTITY_SLOTH)
end

function sound_base_module.markSound()
    sound_base_module.playMinibossSound("mark", "mark_ultra", EntityType.ENTITY_GLUTTONY)
end

function sound_base_module.saoSound()
    SFXManager():Play(Isaac.GetSoundIdByName("sao"))
end

function sound_base_module.lustSound()
    sound_base_module.playMinibossSound("nzm", "nmsl", EntityType.ENTITY_LUST)
end

return sound_base_module
