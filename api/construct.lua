-------------------------------------------------------------------------------
-- The construct library is used to control the physical properties of entities.
-- @module construct

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Creates a magnet.
-- @function [parent=#construct] Magnet
-- @param  #Player pl Player that will have the numpad control over the magnet.
-- @param  #Vector pos The position of the magnet.
-- @param  #Angle ang The angles of the magnet.
-- @param  #string model The model of the maget.
-- @param  #string material Name of the material to use while rendering the magnet.
-- @param  #number key The key to toggle the magnet, see **KEY\_Enums**.
-- @param  #number maxObjects Maximum amount of objects the magnet can hold.
-- @param  #number strength Strength of the magnet.
-- @param  #number nopull If > 0, disallows the magnet to pull objects towards it. _(Default: 0)_
-- @param  #number allowrot If > 0, allows rotation of the objects attached. _(Default: 0)_
-- @param  #number startOn If > 0, enabled from spawn. _(Default: 0)_
-- @param  #number toggle If != 0, pressing the key toggles the magnet, otherwise you'll have to hold the key to keep it enabled.
-- @param  #Vector vel Velocity to set on spawn. _(Default: Vector(0,0,0))_
-- @param  #Angle aVel Angular velocity to set on spawn. _(Default: Angle(0,0,0))_
-- @param  #boolean frozen Freeze the magnet on start. _(Default: false)_
-- @return #Entity The new magnet.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets props physical properties.
-- @function [parent=#construct] SetPhysProp
-- @param  #Player ply The player. This variable is not used and can be left out.
-- @param  #Entity ent The entity to apply properties to.
-- @param  #number physObjID You can use this or the argument below. This will be used in case you don't provide argument below.
-- @param  #PhysObj physObj The physics object to apply the properties to.
-- @param  #table data The table containing properties to apply. See **PhysProperties structure**.

return nil
