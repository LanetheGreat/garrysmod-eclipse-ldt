-------------------------------------------------------------------------------
-- The physenv library allows you to control the physics environment created by
-- the engine, and lets you modify constants such as gravity and maximum velocity.
-- @module physenv

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds surface properties to the game's physics environment.
-- 
-- **Note**: _The game has a limit of 128 surface properties - this includes
-- properties loaded automatically from surfaceproperties.txt. Due to this,
-- there's only a small amount of open slots that can be registered with GMod's
-- provided surfaceproperties.txt._
-- @function [parent=#physenv] AddSurfaceData
-- @param  #string properties The properties to add.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the air density.
-- @function [parent=#physenv] GetAirDensity
-- @return #number The current air density.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the global gravity.
-- @function [parent=#physenv] GetGravity
-- @return #Vector The direction of gravity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the current performance settings in table form.
-- @function [parent=#physenv] GetPerformanceSettings
-- @return #table Performance settings. See **PhysEnvPerformanceSettings structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the air density.
-- @function [parent=#physenv] SetAirDensity
-- @param  #number airDensity The new air density.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the directional gravity, does not work on players.
-- @function [parent=#physenv] SetGravity
-- @param  #Vector gravity The new gravity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the performance settings.
-- @function [parent=#physenv] SetPerformanceSettings
-- @param  #table performanceSettings The new performance settings. See **PhysEnvPerformanceSettings structure**.

return nil
