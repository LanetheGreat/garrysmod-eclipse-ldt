-------------------------------------------------------------------------------
-- The navigation mesh library. To be used with **CNavArea**.  
-- The navigation mesh is used by **NextBot** to calculate path to its target.
-- @module navmesh

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Add this position and normal to the list of walkable positions, used before
-- map generation with **navmesh.BeginGeneration**.
-- @function [parent=#navmesh] AddWalkableSeed
-- @param  #Vector pos The terrain position.
-- @param  #Vector dir The normal of this terrain position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Starts the generation of a new navmesh.
-- 
-- **Note**: _This process is highly resource intensive and it's not wise to use during normal gameplay._
-- @function [parent=#navmesh] BeginGeneration

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Clears all the walkable positions, used before calling **navmesh.BeginGeneration**.
-- @function [parent=#navmesh] ClearWalkableSeeds

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Creates a new **CNavArea**.
-- @function [parent=#navmesh] CreateNavArea
-- @param  #Vector corner The first corner of the new **CNavArea**.
-- @param  #Vector opposite_corner The opposite (diagonally) corner of the new **CNavArea**.
-- @return #CNavArea The new **CNavArea** or nil if we failed for some reason.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a bunch of areas within distance, used to find hiding spots by
-- **NextBots** for example.
-- @function [parent=#navmesh] Find
-- @param  #Vector pos The position to search around.
-- @param  #number radius Radius to search within.
-- @param  #number stepdown Maximum stepdown(fall distance) allowed.
-- @param  #number stepup Maximum stepup(jump height) allowed.
-- @return #table A table of **CNavArea**'s.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns an integer indexed table of all **CNavArea**'s on the current map. If the
-- map doesn't have a navmesh generated then this will return an empty table.
-- @function [parent=#navmesh] GetAllNavAreas
-- @return #table A table of all the **CNavArea**'s on the current map.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the position of the edit cursor when nav_edit is set to 1.
-- @function [parent=#navmesh] GetEditCursorPosition
-- @return #Vector The position of the edit cursor.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Finds the closest standable ground at, above, or below the provided position.
-- 
-- **Note**: _The ground must have at least 32 units of empty space above it to
-- be considered by this function, unless 16 layers are tested without finding
-- valid ground._
-- @function [parent=#navmesh] GetGroundHeight
-- @param  #Vector pos Position to find the closest ground for.
-- @return #number, #Vector The height and normal of the ground layer.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the currently marked **CNavArea**, for use with editing console commands.
-- @function [parent=#navmesh] GetMarkedArea
-- @return #CNavArea The currently marked **CNavArea**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the currently marked **CNavLadder**, for use with editing console commands.
-- @function [parent=#navmesh] GetMarkedLadder
-- @return #CNavLAdder The currently marked **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the Nav Area contained in this position that also satisfies the
-- elevation limit.
-- @function [parent=#navmesh] GetNavArea
-- @param  #Vector pos The position to search for.
-- @param  #number beneathLimit The elevation limit at which the Nav Area will be searched.
-- @return #CNavArea The nav area.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a CNavArea by the given ID.
-- 
-- **Note**: _Avoid calling this function every frame, as internally it does a
-- lookup trough all the **CNavArea**'s, call this once and store the result._
-- @function [parent=#navmesh] GetNavAreaByID
-- @param  #number id ID of the CNavArea to get. Starts with 1.
-- @return #CNavArea The **CNavArea** with given ID.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the highest ID of all nav areas on the map. While this can be used
-- to get all nav areas, this number may not actually be the actual number of
-- nav areas on the map.
-- @function [parent=#navmesh] GetNavAreaCount
-- @return #number The highest ID of all nav areas on the map.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a **CNavLadder** by the given ID.
-- @function [parent=#navmesh] GetNavLadderByID
-- @param  #number id ID of the CNavLadder to get. Starts with 1.
-- @return #CNavLadder The CNavLadder with given ID.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the closest **CNavArea** to given position at the same height, or beneath it.
-- @function [parent=#navmesh] GetNearestNavArea
-- @param  #Vector pos The position to look from.
-- @param  #boolean anyZ This argument is ignored and has no effect. _(Default: false)_
-- @param  #number maxDist This is the maximum distance from the given position that the function will look for a **CNavArea**.
-- @param  #boolean checkLOS If this is set to true then the function will internally do a **util.TraceLine** from the starting position to each potential **CNavArea** with a MASK\_NPCSOLID\_BRUSHONLY **MASK\_Enums**. If the trace fails then the **CNavArea** is ignored.
-- If this is set to false then the function will find the closest **CNavArea** through anything, including the world.
-- @param  #boolean checkGround If checkGround is true then this function will internally call **navmesh.GetNavArea** to check if there is a **CNavArea** directly below the position, and return it if so, before checking anywhere else.
-- @param  #number team This will internally call **CNavArea:IsBlocked** to check if the target **CNavArea** is not to be navigated by the given team. Currently this appears to do nothing.
-- @return #CNavArea The closest **CNavArea** found with the given parameters.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the classname of the player spawn entity.
-- @function [parent=#navmesh] GetPlayerSpawnName
-- @return #string The classname of the spawn point entity. By default returns "info\_player\_start".

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Whether we're currently generating a new navmesh with **navmesh.BeginGeneration**.
-- @function [parent=#navmesh] IsGenerating
-- @return #boolean Whether we're generating a nav mesh or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if a navmesh has been loaded when loading the map.
-- @function [parent=#navmesh] IsLoaded
-- @return #boolean Whether a navmesh has been loaded when loading the map.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Loads a new navmesh from the .nav file for current map discarding any
-- changes made to the navmesh previously.
-- @function [parent=#navmesh] Load

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Deletes every **CNavArea** and **CNavLadder** on the map without saving the changes.
-- @function [parent=#navmesh] Reset

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Saves any changes made to navmesh to the .nav file.
-- @function [parent=#navmesh] Save

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the **CNavArea** as marked, so it can be used with editing console commands.
-- @function [parent=#navmesh] SetMarkedArea
-- @param  #CNavArea area The **CNavArea** to set as the marked area.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the **CNavLadder** as marked, so it can be used with editing console commands.
-- @function [parent=#navmesh] SetMarkedLadder
-- @param  #CNavLAdder The **CNavLadder** to set as the marked ladder.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the classname of the default spawn point entity, used before generating
-- a new navmesh with **navmesh.BeginGeneration**.
-- @function [parent=#navmesh] SetPlayerSpawnName
-- @param  #string spawnPointClass The classname of what the player uses to spawn, automatically adds it to the walkable positions during map generation.

return nil
