-------------------------------------------------------------------------------
-- The ents library provides functions for creating and finding entities in
-- the game.
-- @module ents

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **Warning**: _Do not use before **GM:InitPostEntity** has been called, otherwise
-- the server will crash!_  
-- _If you need to perform entity creation when the game starts, create a hook
-- for **GM:InitPostEntity** and do it there._
-- 
-- Creates an entity. This function will fail and return NULL if the soft-edict
-- limit is hit (8176), or the provided entity class doesn't exist.
-- @function [parent=#ents] Create
-- @param  #string class The classname of the entity to create.
-- @return #Entity The created entity, or NULL if failed.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a clientside only prop. See also **ClientsideModel**.
-- @function [parent=#ents] CreateClientProp
-- @param  #string model The model for the entity to be created. _(Default: "models/error.mdl")_
-- 
-- **Warning**: _Model must be precached with **util.PrecacheModel** on the server before usage._
-- @return #CSEnt The created entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of all entities along the ray. The ray does not stop on
-- collisions, meaning it will go through walls/entities.
-- @function [parent=#ents] FindAlongRay
-- @param  #Vector start The start position of the ray.
-- @param  #Vector end The end position of the ray.
-- @param  #Vector mins The mins corner of the ray. _(Default: nil)_
-- @param  #Vector maxs The maxs corner of the ray. _(Default: nil)_
-- @return #table A table of found entities or nil if none are found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets all entities with the given class, supports wildcards. This works
-- internally by iterating over **ents.GetAll**.
-- 
-- **Note**: _Asterisks (*) are the only wildcard supported._
-- @function [parent=#ents] FindByClass
-- @param  #string class The class of the entities to find.
-- @return #table A table of found entities or nil if none are found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Finds all entities that are of given class and are children of given entity.
-- This works internally by iterating over **ents.GetAll**.
-- @function [parent=#ents] FindByClassAndParent
-- @param  #string class The class of entities to search for.
-- @param  #Entity parent Parent of entities that are being searched for.
-- @return #table A table of found entities or nil if none are found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets all entities with the given model, supports wildcards. This works
-- internally by iterating over **ents.GetAll**.
-- @function [parent=#ents] FindByModel
-- @param  #string model The model of the entities to find.
-- @return #table A table of found entities or nil if none are found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets all entities with the given hammer targetname. This works internally by
-- iterating over **ents.GetAll**.
-- 
-- **Note**: _A player's Name is his nickname, see **Player:GetName**._
-- 
-- Doesn't do anything on client.
-- @function [parent=#ents] FindByName
-- @param  #string name The targetname to look for.
-- @return #table A table of found entities or nil if none are found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns all entities within the specified box.
-- 
-- **Note**: _Clientside entities will not be returned by this function._
-- 
-- **Warning**: _There is a limit of 512 entities for the output!_
-- @function [parent=#ents] FindInBox
-- @param  #Vector boxMins The box minimum coordinates.
-- @param  #Vector boxMaxs The box maximum coordinates.
-- @return #table A table of found entities or nil if none are found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Finds and returns all entities within the specified cone. Only entities
-- whose **Entity:WorldSpaceCenter** is within the cone are considered to be in it.
-- 
-- The "cone" is actually a conical "slice" of an axis-aligned box
-- (see: **ents.FindInBox**). The image to the right shows approximately how
-- this function would look in 2D. Due to this, the entity may be farther than
-- the specified range!
-- 
-- **Note**: _Clientside entities will not be returned by this function._
-- 
-- **Warning**: _If there are more than 512 entities in the axis-aligned box
-- around the origin, then the result may be incomplete!_
-- @function [parent=#ents] FindInCone
-- @param  #Vector origin The tip of the cone.
-- @param  #Vector normal Direction of the cone.
-- @param  #number range The range of the cone/box around the origin.
-- @param  #number angle_cos The cosine of the angle between the center of the cone to its edges, which is half the overall angle of the cone.  
-- 1 makes a 0&deg; cone, 0.707 makes approximately 90&deg;, 0 makes 180&deg;, and so on.
-- @return #table A table of found entities or nil if none are found.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Finds all entities that lie within a PVS.
-- 
-- **Note**: _The function won't take in to account **AddOriginToPVS** and the like._
-- @function [parent=#ents] FindInPVS
-- @param  #any viewPoint Entity or Vector to find entities within the PVS of. If a player is given, this function will use the player's view entity.
-- @return #table A table of found entities or nil if none are found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets all entities within the specified sphere.
-- 
-- **Note**: _Clientside entities will not be returned by this function._
-- @function [parent=#ents] FindInSphere
-- @param  #Vector origin Center of the sphere.
-- @param  #number radius Radius of the sphere.
-- @return #table A table of found entities or nil if none are found. Has a limit of 1024 entities.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Fires a use event.
-- @function [parent=#ents] FireTargets
-- @param  #string target Name of the target entity.
-- @param  #Entity activator Activator of the event.
-- @param  #Entity caller Caller of the event.
-- @param  #number usetype Use type. See the **USE\_Enums**.
-- @param  #number value This value is passed to **ENTITY:Use**, but isn't used by any default entities in the engine.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of all existing entities.
-- @function [parent=#ents] GetAll
-- @return #table Table of all existing Entities.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an entity by its index. Same as **Entity**.
-- @function [parent=#ents] GetByIndex
-- @param  #number entIdx The index of the entity.
-- @return #Entity The entity if it exists.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gives you the amount of currently existing entities. Similar to **ents.GetAll**
-- but with much better performance.
-- @function [parent=#ents] GetCount
-- @param  #boolean IncludeKillMe Include entities with the FL_KILLME flag. This will skip an internal loop, and the function will be more efficient as a byproduct.
-- @return #number Number of entities.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the amount of networked entities, which is limited to 8192.
-- **ents.Create** will fail somewhere between 8064 and 8176 - this can vary
-- based on the amount of existing temp ents.
-- @function [parent=#ents] GetEdictCount
-- @return #number Number of networked entities.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns entity that has given **Entity:MapCreationID**.
-- @function [parent=#ents] GetMapCreatedEntity
-- @param  #number id Entity's creation id.
-- @return #Entity The found entity.

return nil