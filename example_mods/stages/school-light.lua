function onCreate()
	-- background shit
	makeLuaSprite('back', 'stages/school-light/bg', -600, -150);
	setScrollFactor('back', 1, 1);
	addLuaSprite('back', false);
	
	makeAnimatedLuaSprite('bumpersLeft', 'stages/school-light/BGBumpers', -575, 50);
	setScrollFactor('bumpersLeft', 1, 1);
	addAnimationByPrefix('bumpersLeft', 'bump', 'LeftBoppers', 24, false);
	objectPlayAnimation('bumpersLeft', 'bump');
	addLuaSprite('bumpersLeft', false); -- false = add behind characters, true = add over characters
	
	makeAnimatedLuaSprite('bumpersRight', 'stages/school-light/BGBumpers', 1325, 125 );
	setScrollFactor('bumpersRight', 1, 1);
	addAnimationByPrefix('bumpersRight', 'bump', 'RightBoppers', 24, false);
	objectPlayAnimation('bumpersRight', 'bump');
	addLuaSprite('bumpersRight', false); -- false = add behind characters, true = add over characters
	
	-- makeLuaSprite('front', 'ground-morning', -650, 600);
	-- setScrollFactor('front', 1, 1);
	-- scaleObject('front', 1.1, 1.1);
	-- addLuaSprite('front', false);

	-- set baldimong us death animation because this is the most practical way

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-baldimong'); --Character json file for the death animation
	
	-- UNUSED - Sound Effects (MODIFY LOSS SOUND IN THE FUTURE)
	-- setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	-- setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	-- setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
	
	-- close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

-- Gameplay interactions
function onBeatHit()
	-- Triggered 4 times per section.
	objectPlayAnimation('bumpersLeft', 'bump');
	objectPlayAnimation('bumpersRight', 'bump');
end