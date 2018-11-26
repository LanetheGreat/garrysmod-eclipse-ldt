-------------------------------------------------------------------------------
-- The engine library provides functions to access various features in the
-- game's engine, most are related to the demo and save systems.
-- @module engine

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the name of the currently running gamemode.
-- @function [parent=#engine] ActiveGamemode
-- @return #string The active gamemode's name. This is the name of the gamemode's folder.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Closes the server and completely exits.  
-- This is only functional when running in server test mode (launch option
-- -systemtest). Server test mode is used internally at Facepunch as part of
-- the build process to make sure that the dedicated servers aren't crashing on startup.
-- @function [parent=#engine] CloseServer

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a list of addons the player have subscribed to on the workshop.
-- @function [parent=#engine] GetAddons
-- @return #table A table with 6 keys. (downloaded, models, title, file, mounted, wsid)

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- When starting playing a demo, **engine.GetDemoPlaybackTick** will be reset and
-- its old value will be added to this functions return value.
-- @function [parent=#engine] GetDemoPlaybackStartTick
-- @return #number

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Current tick of currently loaded demo.  
-- If not playing a demo, it will return amount of ticks since last demo playback.
-- @function [parent=#engine] GetDemoPlaybackTick
-- @return #number The amount of ticks of currently loaded demo.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns time scale of demo playback. If not during demo playback, returns 1.
-- @function [parent=#engine] GetDemoPlaybackTimeScale
-- @return #number The time scale of demo playback, value of demo_timescale console variable.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns total amount of ticks of currently loaded demo. If not playing a
-- demo, returns 0 or the value of last played demo.
-- @function [parent=#engine] GetDemoPlaybackTotalTicks
-- @return #number Total amount of ticks of currently loaded demo.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a table containing info for all installed gamemodes.
-- @function [parent=#engine] GetGamemodes
-- @return #table A list of gamemodes.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns an array of tables corresponding to all games from which Garry's Mod
-- supports mounting content.
-- 
-- The "mounted" and "installed" values currently do not work correctly
-- serverside on dedicated servers. Some games will always report true while
-- others will always report false.
-- @function [parent=#engine] GetGames
-- @return #table A table of tables containing all mountable games.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._  
-- _Used internally for in-game menus, may be merged in the future into **engine.GetAddons**._
-- 
-- Returns the UGC (demos, saves and dupes) the player have subscribed to on
-- the workshop.
-- @function [parent=#engine] GetUserContent
-- @return #table Returns a table with 6 keys. (title, type, tags, wsid, timeadded)

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns true if we're currently playing a demo.  
-- You will notice that there's no server-side version of this. That's because
-- there is no server when playing a demo. Demos are both recorded and played
-- back purely clientside.
-- @function [parent=#engine] IsPlayingDemo
-- @return #boolean Whether the game is currently playing a demo or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns true if the game is currently recording a demo file (.dem) using gm_demo.
-- @function [parent=#engine] IsRecordingDemo
-- @return #boolean Whether the game is currently recording a demo or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- This is a direct binding to the function "engine->LightStyle". This function
-- allows you to change the default light style of the map - so you can make
-- lighting lighter or darker. You'll need to call **render.RedownloadAllLightmaps**
-- clientside to refresh the lightmaps to this new color.
-- @function [parent=#engine] LightStyle
-- @param  #number lightstyle The lightstyle to edit. 0 to 63. If you want to edit map lighting, you want to set this to 0.
-- @param  #string pattern The pattern to change the lightstyle to. "a" is the darkest, "z" is the brightest.
-- You can use stuff like "abcxyz" to make flashing patterns. The normal brightness for a map is "m". Values over "z" are allowed, "~" for instance.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Loads a duplication from the local filesystem.
-- @function [parent=#engine] OpenDupe
-- @param  #string dupeName Name of the file. _e.g, **engine.OpenDupe**("dupes/8b809dd7a1a9a375e75be01cdc12e61f.dupe")_
-- @return #string Compressed dupeData. Use **util.JSONToTable** to make it into a format useable by the duplicator tool.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns an estimate of the server's performance. Equivalent to calling
-- FrameTime from the server, according to source code.
-- @function [parent=#engine] ServerFrameTime
-- @return #number, #number The Frame time and the Server Framerate Standard Deviation.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Sets the mounting options for mountable content.
-- @function [parent=#engine] SetMounted
-- @param  #string depotID The depot id of the game to mount.
-- @param  #boolean doMount The mount state, true to mount, false to unmount.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the number of ticks since the game server started.
-- @function [parent=#engine] TickCount
-- @return #number Number of ticks since the game server started.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the number of seconds between each gametick.
-- @function [parent=#engine] TickInterval
-- @return #number Number of seconds between each gametick.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns video recording settings set by **video.Record**. Used by Demo-To-Video feature.
-- @function [parent=#engine] VideoSettings
-- @return #table The video recording settings, see **VideoData structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Saves a duplication as a file.
-- @function [parent=#engine] WriteDupe
-- @param  #string dupe Dupe table, encoded by **util.TableToJSON** and compressed by **util.Compress**.
-- @param  #string jpeg The dupe icon, created by **render.Capture**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stores savedata into the game. (Can be loaded using the LoadGame menu)
-- @function [parent=#engine] WriteSave
-- @param  #string saveData Data generated by **gmsave.SaveMap**.
-- @param  #string name Name the save will have.
-- @param  #number time When the save was saved during the game. (Put CurTime here)
-- @param  #string map The map the save is used for.

return nil
