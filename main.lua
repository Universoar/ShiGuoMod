local Mod = RegisterMod("SHIGUO 2023", 1)
local game = Game()

local back_module = require("character.back")
local otto_module = require("character.otto")
local peach_module = require("character.peach")
local sand_module = require("character.sand")
local shand_module = require("character.shand")
local todd_module = require("character.todd")
local win8_module = require("character.win8")
local xiaobai_module = require("character.xiaobai")
local duo_module = require("character.duo")
local sound_base_module = require("sound_controller.base")
local helper_module = require("helper")

	------------------------ Back ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, back_module.dropBombBack)

	------------------------ Win8 ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, win8_module.winPickupReplace)

Mod:AddCallback(ModCallbacks.MC_INPUT_ACTION, win8_module.winCardForge, 0, InputHook.IS_ACTION_Pressed,
	ButtonAction.ACTION_BOMB)

Mod:AddCallback(ModCallbacks.MC_USE_ITEM, win8_module.winUseCardDeck, CollectibleType.COLLECTIBLE_DECK_OF_CARDS)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, win8_module.winChargeCardDeck)

Mod:AddCallback(ModCallbacks.MC_POST_RENDER, win8_module.winShowCard)

Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, win8_module.winDropCardEmperor)

Mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, win8_module.winDropCardFool)

Mod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, win8_module.winDropCardDeath, PickupVariant.PICKUP_REDCHEST)

Mod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, win8_module.winDropCardStar, PickupVariant.PICKUP_LOCKEDCHEST)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, win8_module.winDropCardTower)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, win8_module.winDropCardDevil)

Mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, win8_module.winDropCardShop)

Mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, win8_module.resetRoomCount)

Mod:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, win8_module.winDropCardMagician, PickupVariant.PICKUP_HEART)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, win8_module.resetCardMatrix)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
	win8_module.unNameFunction1)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
	win8_module.unNameFunction2)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
	win8_module.unNameFunction3)

	------------------------ Sand ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, sand_module.dmgGainSandCandle)

Mod:AddCallback(ModCallbacks.MC_USE_ITEM, sand_module.speedGainSandMomBra, CollectibleType.COLLECTIBLE_MOMS_BRA)

Mod:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, sand_module.sandReplaceSoul, PickupVariant.PICKUP_HEART)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
	sand_module.unNameFunction1)

	------------------------ Todd ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, todd_module.randomCoinTodd)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, todd_module.maxCoinTodd)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
	todd_module.unNameFunction1)

	------------------------ Xiaobai ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, xiaobai_module.removeGoldPillXiaoBai)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, xiaobai_module.removeGoldPillEffectXiaoBai)


	------------------------ Peach ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, peach_module.dropHeartSirPeach)

Mod:AddCallback(ModCallbacks.MC_POST_ENTITY_KILL, peach_module.getPeachHeart, EntityType.ENTITY_PLAYER)
	
Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, peach_module.setSirPeachHeart)
	
Mod:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, peach_module.setSirPeach)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, peach_module.peachAngelRoomItem)

Mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, peach_module.peachHeal, EntityType.ENTITY_PLAYER)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, peach_module.removeFleshPeach)

Mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, peach_module.setPeachStats)

Mod:AddCallback(ModCallbacks.MC_POST_UPDATE, peach_module.sirPeachBuff)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
	peach_module.unNameFunction1)

	------------------------ Shand ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
	shand_module.unNameFunction1)

	------------------------ Duo ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, duo_module.duoSpriteChange)

Mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED,
	duo_module.unNameFunction1)


	------------------------ SFX Callbacks ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_GAME_END, sound_base_module.resetGlobalValues)

Mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, sound_base_module.resetGlobalValues)
	
Mod:AddCallback(ModCallbacks.MC_USE_ITEM, sound_base_module.liproll, CollectibleType.COLLECTIBLE_BUTTER_BEAN)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.kidSound, EntityType.ENTITY_ISAAC)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.spamtonSound, EntityType.ENTITY_MOMS_HEART)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.situSound, EntityType.ENTITY_DINGLE)

Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.mcDarkOneSound, EntityType.ENTITY_ADVERSARY)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.trDarkOneSound, EntityType.ENTITY_DARK_ONE)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.slimeDeathSound, EntityType.ENTITY_BLASTOCYST_BIG)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.slimeDeathSound, EntityType.ENTITY_BLASTOCYST_MEDIUM)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.slimeDeathSound, EntityType.ENTITY_BLASTOCYST_SMALL)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.slimeDeathSound, EntityType.ENTITY_EMBRYO)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.shuoDeDaoLiSound, EntityType.ENTITY_MONSTRO2)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.bungeeZombieSound, EntityType.ENTITY_DADDYLONGLEGS)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.yibaikuaiSound, EntityType.ENTITY_MEGA_FATTY)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.squashSound, EntityType.ENTITY_MONSTRO)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.skeletronSound, EntityType.ENTITY_WIDOW)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.vagrantSound, EntityType.ENTITY_RAINMAKER)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.xianbeiSound, EntityType.ENTITY_CHUB)

Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.xushengSound, EntityType.ENTITY_BUMBINO)

Mod:AddCallback(ModCallbacks.MC_POST_NPC_INIT, sound_base_module.xushengAppear, EntityType.ENTITY_BUMBINO)

Mod:AddCallback(ModCallbacks.MC_POST_NPC_RENDER, sound_base_module.heishouSound, EntityType.ENTITY_BIG_HORN)

Mod:AddCallback(ModCallbacks.MC_POST_NPC_INIT, sound_base_module.heishouAppear, EntityType.ENTITY_BIG_HORN)

Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.heishouDeath, EntityType.ENTITY_BIG_HORN)

Mod:AddCallback(ModCallbacks.MC_USE_ITEM, sound_base_module.noBarking, CollectibleType.COLLECTIBLE_HOURGLASS)
	
Mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, sound_base_module.playMusic)
	

------------------------ Miniboss SFX Callbacks ----------------------------
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.aaSound, EntityType.ENTITY_SLOTH)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.markSound, EntityType.ENTITY_GLUTTONY)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.saoSound, EntityType.ENTITY_ENVY)
	
Mod:AddCallback(ModCallbacks.MC_POST_NPC_DEATH, sound_base_module.lustSound, EntityType.ENTITY_LUST)


	------------------------ Player Starting Stats ----------------------------
Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, shand_module.shand.onCache)

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, otto_module.otto.onCache)

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, xiaobai_module.xiaobai.onCache)

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, sand_module.sand.onCache)

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, back_module.back.onCache)

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, todd_module.todd.onCache)

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, peach_module.peach.onCache)

Mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, win8_module.win8.onCache)
