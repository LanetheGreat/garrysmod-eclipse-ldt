-------------------------------------------------------------------------------
-- The team library gives you access to the team system built into the Source
-- engine, and allows you to create custom teams and get information about them.
-- @module team

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Increases the score of the given team.
-- @function [parent=#team] AddScore
-- @param  #number index Index of the team.
-- @param  #number increment Amount to increase the team's score by.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the team index of the team with the least players.
-- Falls back to TEAM_UNASSIGNED.
-- @function [parent=#team] BestAutoJoinTeam
-- @return #number Team index.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table consisting of information on every defined team.
-- @function [parent=#team] GetAllTeams
-- @return #table Team info.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the selectable classes for the given team. This can be added to with team/SetClass.
-- @function [parent=#team] GetClass
-- @param  #number index Index of the team.
-- @return #table Table of selectable classes.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the team's color.
-- @function [parent=#team] GetColor
-- @param  #number teamIndex The team index.
-- @return #table The team's color as a **Color structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the name of the team.
-- @function [parent=#team] GetName
-- @param  #number teamIndex The team index.
-- @return #string The team name. If the team is not defined, returns an empty string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table with all player of the specified team.
-- @function [parent=#team] GetPlayers
-- @param  #number teamIndex The team index.
-- @return #table A table of **Player**'s that belong to the requested team.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the score of the team.
-- @function [parent=#team] GetScore
-- @param  #number teamIndex The team index.
-- @return #number The indexed teams current score.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of valid spawnpoint classes the team can use. These are set
-- with **team.SetSpawnPoint**.
-- @function [parent=#team] GetSpawnPoint
-- @param  #number index Index of the team.
-- @return #table Valid spawnpoint classes.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of valid spawnpoint entities the team can use. These are set
-- with **team.SetSpawnPoint**.
-- @function [parent=#team] GetSpawnPoints
-- @param  #number index Index of the team.
-- @return #table Valid spawnpoint entities.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if a team is joinable or not. This is set in **team.SetUp**.
-- @function [parent=#team] Joinable
-- @param  #number index The index of the team.
-- @return #boolean True if the team is joinable. False otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the amount of players in a team.
-- @function [parent=#team] NumPlayers
-- @param  #number teamIndex The team index.
-- @return #number Count of players on a team.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets valid classes for use by a team. Classes can be created using
-- **player_manager.RegisterClass**.
-- @function [parent=#team] SetClass
-- @param  #number index Index of the team.
-- @param  #any classes A class ID or table of class IDs.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the team's color.
-- @function [parent=#team] SetColor
-- @param  #number teamIndex The team index.
-- @param  #table color The team's new color as a **Color structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- 
-- @function [parent=#team] Sets the score of the given team.
-- @param  #number index Index of the team.
-- @param  #number score The team's new score.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets valid spawnpoint classes for use by a team.
-- 
-- **Note**: _**GM.TeamBased** must be set to true for this to work._
-- @function [parent=#team] SetSpawnPoint
-- @param  #number index Index of the team.
-- @param  #any classes A spawnpoint classname or table of spawnpoint classnames.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a new team.
-- @function [parent=#team] SetUp
-- @param  #number teamIndex The team index.
-- @param  #string teamName The team name.
-- @param  #table teamColor The team color. Uses the **Color structure**.
-- @param  #boolean isJoinable Whether the team is joinable or not. _(Default: true)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the sum of deaths of all players of the team.
-- @function [parent=#team] TotalDeaths
-- @param  #number teamIndex The team index.
-- @return #number Sum of all the team members death counts.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Get's the total frags in a team.
-- @function [parent=#team] TotalFrags
-- @param  #Entity Entity or number Entity or number.
-- @return #number index

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the given team index is valid.
-- @function [parent=#team] Valid
-- @param  #number index Index of the team.
-- @return #boolean Is index valid.

return nil
