--[[

Title: Audio Manager Module
Author: Sebastian Maj

Functions:
-playMusic(filename, fadeinNum, loopNum)	+Plays a music file
-playSound(filename)						+Plays a sound file
-stopSound(channelNum)						+Stops a specific channel
-setMusicVolume(volumeNum)					+Changes the music volume
-setSoundVolume(volumeNum)					+Changes the sound volume

--]]

local AudioManager = {}

--Reserve first 2 channels for music
audio.reserveChannels(2)

--Music / Background Sounds Function
function AudioManager:playMusic(filename, fadeinNum, loopNum)
	--Check Music Channels
	local isChannel1Active = audio.isChannelActive(1)
	local isChannel2Active = audio.isChannelActive(2)

	--If No Parameter For loopNum then Loop the song
	if loopNum == nil then loopNum = -1 end

	--Load Music
	local musicToPlay = audio.loadStream(filename)

	--Play Sound on an Available Channel
	if isChannel1Active == false then
		local musicPlay = audio.play(musicToPlay, {channel=1, loops=loopNum, fadein=fadeinNum})
		print("Playing music on Channel 1")
	elseif isChannel1Active == true and isChannel2Active == false then
		local musicPlay = audio.play(musicToPlay, {channel=2, loops=loopNum, fadein=fadeinNum})
		print("Playing music on Channel 2")
	else
		print("No Music Channels are free!")
	end
end

--Sound Effect Function
function AudioManager:playSound(filename)
	--Load Sound
	local soundToPlay = audio.loadSound(filename)
	--Play Sound then Dispose of it
	local soundPlay = audio.play(soundToPlay, {onComplete = function(e)
			audio.dispose(e.handle)
			e.handle = nil
		end
	});
end

--Stop Channel Function
function AudioManager:stopSound(channelNum)
	--Stops The Channel From Playing
	audio.stop(channelNum)
end

--Music Volume Adjustment Function
function AudioManager:setMusicVolume(volumeNum)
	--Mutes the 2 Music Channels
	for i=1,2 do
		audio.setVolume(volumeNum, {channel = i})
	end
end

--Sound Volume Adjustment Function
function AudioManager:setSoundVolume(volumeNum)
	--Mutes all the sound channels
	for i=3,32 do
		audio.setVolume(volumeNum, {channel = i})
	end
end

return AudioManager
