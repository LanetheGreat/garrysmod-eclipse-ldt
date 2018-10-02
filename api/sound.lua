-------------------------------------------------------------------------------
-- Used primarily for adding new soundscript entries.
-- @module sound

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a sound script. It can also override sounds, which seems to only
-- work when set on the server.
-- @function [parent=#sound] Add
-- @param  #table soundData The sounds properties. See **SoundData structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Overrides sounds defined inside of a txt file; typically used for adding map-specific sounds.
-- @function [parent=#sound] AddSoundOverrides
-- @param  #string filepath Path to the script file to load.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a sound from a function.
-- @function [parent=#sound] Generate
-- @param  #string identifier An unique identified for the sound. You cannot override already existing ones.
-- @param  #number samplerate The sample rate of the sound. Must be 11025, 22050 or 44100.
-- @param  #number length The length in seconds of the sound to generate.
-- @param  #function callback A function which will be called to generate every sample on the sound.
-- This function gets the current sample number passed as the first argument.
-- The return value must be between -1.0 and 1.0. Other values will wrap back to the -1 to 1 range and basically clip.
-- There are 65535 possible quantifiable values between -1 and 1.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns properties of the soundscript.
-- @function [parent=#sound] GetProperties
-- @param  #string name The name of the sound script.
-- @return #table The properties of the soundscript. See **SoundData structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a list of all registered sound scripts.
-- @function [parent=#sound] GetTable
-- @return #table The list/array of all registered sound scripts. (No other information is provided)

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Plays a sound from the specified position in the world. If you want to play
-- a sound without a position, such as a UI sound, use **surface.PlaySound** instead.
-- @function [parent=#sound] Play
-- @param  #string Name A string path to the sound.
-- @param  #Vector Pos A vector describing where the sound should play.
-- @param  #number Level Sound level in decibels. 75 is normal. Ranges from 20 to 180, where 180 is super loud. This affects how far away the sound will be heard.
-- @param  #number Pitch An integer describing the sound pitch. Range is from 0 to 255. 100 is normal pitch.
-- @param  #number Volume A float ranging from 0-1 describing the output volume of the sound.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Plays a file from GMod directory. You can find a list of all error codes **here**.  
-- For external file/stream playback, see **sound.PlayURL**.
-- @function [parent=#sound] PlayFile
-- @param  #string path The path to the file to play. Unlike other sound functions and structures, the path is relative to garrysmod/ instead of garrysmod/sound/.
-- @param  #string flags Flags for the sound.
-- Can be one or more of following, separated by a space (" "):
-- 
-- * 3d - Makes the sound 3D, so you can set its position.
-- * mono - Forces the sound to have only one channel.
-- * noplay - Forces the sound not to play as soon as this function is called.
-- * noblock - Disables streaming in blocks. It is more resource-intensive, but it is required for **IGModAudioChannel:SetTime**.
-- 
-- If you don't want to use any of the above, you can just leave it as "".
-- @param  #function callback Callback function that is called as soon as the the stream is loaded.
-- It has next arguments:
-- 
-- * _#IGModAudioChannel soundchannel_ : The sound channel. Will be nil if an error occured.
-- * _#number errorID_ : ID of an error if an error has occured. Will be nil, otherwise.
-- * _#string errorName_ : Name of an error if an error has occured. Will be nil, otherwise.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Allows you to play external sound files, as well as online radio streams.
-- You can find a list of all error codes **here**. For offline file playback,
-- see **sound.PlayFile**.
-- @function [parent=#sound] PlayURL
-- @param  #string url The URL of the sound to play.
-- @param  #string flags Flags for the sound.
-- Can be one or more of following, separated by a space (" "):
-- 
-- * 3d - Makes the sound 3D, so you can set its position.
-- * mono - Forces the sound to have only one channel.
-- * noplay - Forces the sound not to play as soon as this function is called.
-- * noblock - Disables streaming in blocks. It is more resource-intensive, but it is required for **IGModAudioChannel:SetTime**.
-- 
-- If you don't want to use any of the above, you can just leave it as "".
-- @param  #function callback Callback function that is called as soon as the the stream is loaded.
-- It has next arguments:
-- 
-- * _#IGModAudioChannel soundchannel_ : The sound channel. Will be nil if an error occured.
-- * _#number errorID_ : ID of an error if an error has occured. Will be nil, otherwise.
-- * _#string errorName_ : Name of an error if an error has occured. Will be nil, otherwise.


return nil
