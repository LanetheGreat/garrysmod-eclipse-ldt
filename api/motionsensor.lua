-------------------------------------------------------------------------------
-- Functions related to Kinect for Windows usage in GMod.
-- @module motionsensor

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- @function [parent=#motionsensor] BuildSkeleton
-- @param  #table translator
-- @param  #Player player
-- @param  #Angle rotation
-- @return #Vector, #Angle, #sensor The position, angle, and sensor for the mapped player.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- @function [parent=#motionsensor] ChooseBuilderFromEntity
-- @param  #Entity ent Entity to choose builder for.
-- @return #string Chosen builder.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the depth map material.
-- @function [parent=#motionsensor] GetColourMaterial
-- @return #IMaterial The material.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- @function [parent=#motionsensor] GetSkeleton

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Return whether a kinect is connected - and active (ie - Start has been called).
-- @function [parent=#motionsensor] IsActive
-- @return #boolean Connected and active or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns true if we have detected that there's a kinect connected to the PC.
-- @function [parent=#motionsensor] IsAvailable
-- @return #boolean Connected or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- @function [parent=#motionsensor] ProcessAngle
-- @param  #table translator
-- @param  #table sensor
-- @param  #Vector pos
-- @param  #Angle ang
-- @param  #table special_vectors
-- @param  #number boneid
-- @param  #table v
-- @return #boolean Returns nil on failure.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- @function [parent=#motionsensor] ProcessAnglesTable
-- @param  #table translator
-- @param  #table sensor
-- @param  #Vector pos
-- @param  #Angle rotation
-- @return #Angle The angle. If !translator.AnglesTable then return {}.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- @function [parent=#motionsensor] ProcessPositionTable
-- @param  #table translator
-- @param  #table sensor
-- @return #Vector The position. If !translator.PositionTable then return {}.


-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- This starts access to the kinect sensor. Note that this usually freezes the
-- game for a couple of seconds.
-- @function [parent=#motionsensor] Start

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stops the motion capture.
-- @function [parent=#motionsensor] Stop

return nil
