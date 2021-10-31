local allowCountdown = false
local allowDialogue = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)
		allowCountdown = true
		seenCutscene = false
		return Function_Stop
	end

	return Function_Continue
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast')
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

local cutsceneDone = false
function onEndSong()
	-- cutscene
	if isStoryMode and not cutsceneDone then
		makeLuaSprite('blackScreen', '', -500, -350);
		makeGraphic('blackScreen', screenWidth * 2, screenHeight * 2, '000000');
		setScrollFactor('blackScreen', 0, 0);
		setObjectCamera('blackScreen', 'hud');
		addLuaSprite('blackScreen', true);
		startVideo('rulerGoByeByeLOL')
		cutsceneDone = true
		return Function_Stop
	end
	return Function_Continue
end 