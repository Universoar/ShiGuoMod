helper_module = {}

helper_module.randomChance = 0

function helper_module.randomChanceGenerate()
	local RECOMMENDED_SHIFT_IDX = 35
	local rng = RNG()
	rng:SetSeed(math.random(4294967295), RECOMMENDED_SHIFT_IDX)
	helper_module.randomChance = rng:RandomFloat()
	return helper_module.randomChance
end

return helper_module
