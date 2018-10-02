-------------------------------------------------------------------------------
-- Utility functions.
-- @module util

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds the specified string to a string table, which will cache it and network
-- it to all clients automatically. Whenever you want to create a net message
-- with **net.Start**, you must add the name of that message as a networked string
-- via this function. If the passed string already exists, nothing will happen
-- and the ID of the existing item will be returned.
-- 
-- **Note**: _Due to the way string tables work, it's preferable to call this
-- function as soon as the server starts up, such as in **GM:Initialize** or even
-- bare in a lua file outside of a function._
-- 
-- **Note**: _The string table used for this function does not interfere with
-- the engine string tables and has 2048 slots._
-- @function [parent=#util] AddNetworkString
-- @param  #string str Adds the specified string to the string table.
-- @return #number The id of the string that was added to the string table.
-- Same as calling **util.NetworkStringToID**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Function used to calculate aim vector from 2D screen position. It is used in
-- SuperDOF calculate Distance. Essentially a generic version of **gui.ScreenToVector**.
-- @function [parent=#util] AimVector
-- @param  #Angle ViewAngles View angles.
-- @param  #number ViewFOV View Field of View.
-- @param  #number x Mouse X position.
-- @param  #number y Mouse Y position.
-- @param  #number scrWidth Screen width.
-- @param  #number scrHeight Screen height.
-- @return #Vector Calculated aim vector.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Encodes the specified string to base64.
-- @function [parent=#util] Base64Encode
-- @param  #string str String to encode.
-- @return #string Base 64 encoded string.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Applies explosion damage to all entities in the specified radius.
-- @function [parent=#util] BlastDamage
-- @param  #Entity inflictor The entity that caused the damage.
-- @param  #Entity attacker The entity that attacked.
-- @param  #Vector damageOrigin The center of the explosion
-- @param  #number damageRadius The radius in which entities will be damaged.
-- @param  #number damage The amount of damage to be applied.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Applies spherical damage based on damage info to all entities in the specified radius.
-- @function [parent=#util] BlastDamageInfo
-- @param  #CTakeDamageInfo dmg The information about the damage.
-- @param  #Vector damageOrigin Center of the spherical damage.
-- @param  #number damageRadius The radius in which entities will be damaged.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Compresses the given string using the LZMA algorithm. Use with **net.WriteData**
-- and **net.ReadData** for networking and **util.Decompress** to decompress the data.
-- @function [parent=#util] Compress
-- @param  #string str String to compress.
-- @return #string The compressed string, or nil if the input string was zero length ("").

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Generates the CRC checksum of the specified string.
-- @function [parent=#util] CRC
-- @param  #string stringToHash The string to calculate the checksum of.
-- @return #string The unsigned 32 bit checksum.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the current date formatted like '2012-10-31 18-00-00'.
-- @function [parent=#util] DateStamp
-- @return #string Current date as a string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Performs a trace and paints a decal to the surface hit.
-- @function [parent=#util] Decal
-- @param  #string name The name of the decal to paint.
-- @param  #Vector start The start of the trace.
-- @param  #Vector end The end of the trace.
-- @param  #Entity filter If set, the decal will not be able to be placed on given entity. Can also be a table of entities. _(Default: NULL)_
-- 
-- Here's a list of all the decal names that should be possible to use by default:
-- 
-- * BeerSplash
-- * BirdPoop
-- * Blood
-- * BulletProof
-- * Cross
-- * Dark
-- * ExplosiveGunshot
-- * Eye
-- * FadingScorch
-- * GlassBreak
-- * Impact.Antlion
-- * Impact.BloodyFlesh
-- * Impact.Concrete
-- * Impact.Glass
-- * Impact.Metal
-- * Impact.Sand
-- * Impact.Wood
-- * Light
-- * ManhackCut
-- * Nought
-- * Noughtsncrosses
-- * PaintSplatBlue
-- * PaintSplatGreen
-- * PaintSplatPink
-- * Scorch
-- * SmallScorch
-- * Smile
-- * Splash.Large
-- * YellowBlood

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Performs a trace and paints a decal to the surface hit.
-- 
-- **Note**: _This function has trouble spanning across multiple brushes on the map._
-- @function [parent=#util] DecalEx
-- @param  #IMaterial material The name of the decal to paint. Can be retrieved with **util.DecalMaterial**.
-- @param  #Entity ent The entity to apply the decal to
-- @param  #Vector position The position of the decal.
-- @param  #Vector normal The direction of the decal.
-- @param  #table color The color of the decal. Uses the **Color structure**.
-- This only works when used on a brush model and only if the decal material has set $vertexcolor to 1.
-- @param  #number w The width scale of the decal.
-- @param  #number h The height scale of the decal.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the full material path by the decal name. Used with **util.DecalEx**.
-- @function [parent=#util] DecalMaterial
-- @param  #string decalName Name of the decal.
-- @return #string Material path of the decal.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Decompresses the given string using LZMA algorithm. Used to decompress
-- strings previously compressed with **util.Compress**.
-- @function [parent=#util] Decompress
-- @param  #string compressedString The compressed string to decompress.
-- @param  #number maxSize The maximal size in bytes it will decompress. _(Default: nil)_
-- @return #string The original, decompressed string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the distance between a line and a point in 3d space.
-- @function [parent=#util] DistanceToLine
-- @param  #Vector lineStart Start of the line.
-- @param  #Vector lineEnd End of the line.
-- @param  #Vector pointPos The position of the point.
-- @return #number, #Vector, #number Distance from line, nearest point on line, and distance along line from start.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates an effect with the specified data. You can create your own.
-- 
-- **Note**: _When dispatching an effect from the server, some values may be
-- clamped for networking optimizations. Visit the Set accessors on **CEffectData**
-- to see which ones are affected._
-- 
-- **Note**: _You will need to couple this function with **IsFirstTimePredicted**
-- should you use this in a predicted hook._
-- @function [parent=#util] Effect
-- @param  #string effectName The name of the effect to create.
-- @param  #CEffectData effectData The effect data describing the effect.
-- @param  #boolean allowOverride Whether Lua-defined effects should override engine-defined effects with the same name for this/single function call. _(Default: true)_
-- @param  #any ignorePredictionOrRecipientFilter Can either be a boolean to ignore the prediction filter or a CRecipientFilter. _(Default: nil)_
-- Set this to true if you wish to call this function in multiplayer from server.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table containing the info about the model. It seems to be not
-- working serverside, but still exists serverside.
-- 
-- **Note**: _This function will silently fail if used on models with following strings in them:_
-- 
-- * _anim
-- * _anims
-- * _anm
-- * _gestures
-- * _gst
-- * _include
-- * _postures
-- * _pst
-- * _shared
-- * _shd
-- * _ss
-- @function [parent=#util] GetModelInfo
-- @param  #string mdl Model path.
-- @return #table The model info.
-- * _#number SkinCount_
-- * _#string KeyValues_ : ( Constraint Info, valve KeyValues format )

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Gets PData of an offline player using their SteamID.
-- 
-- **Warning**: _This function internally uses Player:UniqueID, which can cause
-- collisions (two or more players sharing the same PData entry). It's
-- recommended that you don't use it._
-- @function [parent=#util] GetPData
-- @param  #string steamID SteamID of the player.
-- @param  #string name Variable name to get the value of.
-- @param  #string default The default value, in case there's nothing stored.
-- @return #string The stored value.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a new PixVis handle. See **util.PixelVisible**.
-- @function [parent=#util] GetPixelVisibleHandle
-- @return #pixelvis_handle_t PixVis

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Utility function to quickly generate a trace table that starts at the
-- players view position, and ends 16384 units along a specified direction.
-- @function [parent=#util] GetPlayerTrace
-- @param  #Player ply The player the trace should be based on.
-- @param  #Vector dir The direction of the trace. _(Default: ply:GetAimVector())_
-- @return #table The trace data. See **Trace structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets information about the sun position and obstruction or nil if there is no sun.
-- @function [parent=#util] GetSunInfo
-- @return #table The sun info. See **SunInfo structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns data of a surface property at given ID.
-- @function [parent=#util] GetSurfaceData
-- @param  #number id Surface property ID. You can get it from **TraceResult structure**.
-- @return #table The data or no value if there is no valid surface property at given index. See **SurfacePropertyData structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the matching surface property index for the given surface property name.
-- See also **util.GetSurfaceData** and **util.GetSurfacePropName** for opposite function.
-- @function [parent=#util] GetSurfaceIndex
-- @param  #string surfaceName The name of the surface.
-- @return # number The surface property index, or -1 if name doesn't correspond to a valid surface property.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the name of a surface property at given ID. See also
-- **util.GetSurfaceData** and **util.GetSurfaceIndex** for opposite function.
-- @function [parent=#util] GetSurfacePropName
-- @param  #number id Surface property ID. You can get it from **TraceResult structure**.
-- @return #string The name or an empty string if there is no valid surface property at given index.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of all SteamIDs that have a usergroup.
-- 
-- **Note**: _This returns the original usergroups table, changes done to this
-- table are not retroactive and will only affect newly connected users._
-- @function [parent=#util] GetUserGroups
-- @return #table The table of users. The table consists of SteamID-Table pairs,
-- where the table has 2 fields:
-- 
-- * _#string name_ : Players name.
-- * _#string group_ : The players user group.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Performs a "ray" box intersection and returns position, normal and the fraction.
-- @function [parent=#util] IntersectRayWithOBB
-- @param  #Vector rayStart Origin/start position of the ray.
-- @param  #Vector rayDelta The ray vector itself. This can be thought of as: the ray end point relative to the start point.
-- Note that in this implementation, the ray is not infinite - it's only a segment.
-- @param  #Vector boxOrigin The center of the box.
-- @param  #Angle boxAngles The angles of the box.
-- @param  #Vector boxMins The min position of the box.
-- @param  #Vector boxMaxs The max position of the box.
-- @return #Vector, #Vector, #number Hit position(nil if not hit), normal/direction vector(nil if not hit), and fraction of trace used(nil if not hit).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Performs a ray-plane intersection and returns the hit position or nil.
-- @function [parent=#util] IntersectRayWithPlane
-- @param  #Vector rayOrigin Origin/start position of the ray.
-- @param  #Vector rayDirection The direction of the ray.
-- @param  #Vector planePosition Any position of the plane.
-- @param  #Vector planeNormal The normal vector of the plane.
-- @return #Vector The position of intersection, nil if not hit.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Checks if a certain position in within the world bounds.
-- @function [parent=#util] IsInWorld
-- @param  #Vector position Position to check.
-- @return #boolean Whether the vector is in world.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the model is loaded in the game.
-- @function [parent=#util] IsModelLoaded
-- @param  #string modelName Name/Path of the model to check.
-- @return #boolean Returns true if the model is loaded in the game; otherwise false.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Check whether the skybox is visibile from the point specified.
-- 
-- **Note**: _This will always return true in fullbright maps._
-- @function [parent=#util] IsSkyboxVisibleFromPoint
-- @param  #Vector position The position to check the skybox visibility from.
-- @return #boolean Whether the skybox is visible from the position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the specified model is valid.
-- @function [parent=#util] IsValidModel
-- @param  #string modelName Name/Path of the model to check.
-- @return #boolean Whether the model is valid or not. Returns false clientside if the model is not precached by the server.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Checks if given numbered physics object of given entity is valid or not.
-- Most useful for ragdolls.
-- @function [parent=#util] IsValidPhysicsObject
-- @param  #Entity ent The entity to check.
-- @param  #number physobj Number of the physics object to test.
-- @return #boolean true is valid, false otherwise

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the specified prop is valid.
-- @function [parent=#util] IsValidProp
-- @param  #string modelName Name/Path of the model to check.
-- @return #boolean Returns true if the specified prop is valid; otherwise false.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the specified model name points to a valid ragdoll.
-- @function [parent=#util] IsValidRagdoll
-- @param  #string ragdollName Name/Path of the ragdoll model to check.
-- @return #boolean Returns true if the specified model name points to a valid ragdoll; otherwise false.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a JSON string to a Lua table.
-- 
-- **Warning**: _This function converts keys to numbers whenever possible._
-- @function [parent=#util] JSONToTable
-- @param  #string json The JSON string to convert.
-- @return #table The table containing converted information. Returns nothing on failure.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a KeyValue string to a Lua table.
-- @function [parent=#util] KeyValuesToTable
-- @param  #string keyValues The KeyValue string to convert.
-- @param  #boolean usesEscapeSequences _(Default: false)_
-- @param  #boolean preserveKeyCase Whether we should preserve key case or not. _(Default: false)_
-- @return #table The converted table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Similar to **util.KeyValuesToTable** but it also preserves order of keys.
-- 
-- **Note**: _This creates a table of the same structure, but replaces keys
-- with a table containing their value and their order._
-- @function [parent=#util] KeyValuesToTablePreserveOrder
-- @param  #string keyValues The KeyValue string to convert.
-- @param  #boolean usesEscapeSequences _(Default: false)_
-- @param  #boolean preserveKeyCase Whether we should preserve key case or not. _(Default: false)_
-- @return #table The converted table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a vector in world coordinates based on an entity and local coordinates.
-- @function [parent=#util] LocalToWorld
-- @param  #Entity ent The entity lpos is local to.
-- @param  #Vector lpos Coordinates local to the ent.
-- @param  #number bonenum The bonenumber of the ent lpos is local to.
-- @return #Vector World position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the networked string associated with the given ID from the string table.
-- @function [parent=#util] NetworkIDToString
-- @param  #number stringTableID ID to get the associated string from.
-- @return #string The networked string, or nil if it wasn't found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the networked ID associated with the given string from the string table.
-- @function [parent=#util] NetworkStringToID
-- @param  #string networkString String to get the associated networked ID from.
-- @return #number The networked ID of the string, or 0 if it hasn't been networked with **util.AddNetworkString**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Formats a float by stripping off extra 0's and .'s
-- @function [parent=#util] NiceFloat
-- @param  #number float The float to format.
-- @return #string Formatted float as a string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a tracer effect with the given parameters.
-- @function [parent=#util] ParticleTracer
-- @param  #string name The name of the tracer effect.
-- @param  #Vector startPos The start position of the tracer.
-- @param  #Vector endPos The end position of the tracer.
-- @param  #boolean doWhiz Play the hit miss(whiz) sound.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a tracer effect with the given parameters.
-- @function [parent=#util] ParticleTracerEx
-- @param  #string name The name of the tracer effect.
-- @param  #Vector startPos The start position of the tracer.
-- @param  #Vector endPos The end position of the tracer.
-- @param  #boolean doWhiz Play the hit miss(whiz) sound.
-- @param  #number entityIndex Entity index of the emitting entity.
-- @param  #number attachmentIndex Attachment index to be used as origin.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the visibility of a sphere in the world.
-- 
-- **Warning**: _Don't use the same handle twice per tick or it will give
-- unpredictable results._
-- @function [parent=#util] PixelVisible
-- @param  #Vector position The center of the visibility test.
-- @param  #number radius The radius of the sphere to check for visibility.
-- @param  #pixelvis_handle_t PixVis The PixVis handle created with **util.GetPixelVisibleHandle**.
-- @return #number Visibility, ranges from 0-1. 0 when none of the area is visible, 1 when all of it is visible.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the contents of the position specified.
-- @function [parent=#util] PointContents
-- @param  #Vector position Position to get the contents sample from.
-- @return #number Contents bitflag, see **CONTENTS\_Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Precaches a model for later use. Model is cached after being loaded once.
-- @function [parent=#util] PrecacheModel
-- @param  #string modelName The model to precache.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Precaches a sound for later use. Sound is cached after being loaded once.
-- @function [parent=#util] PrecacheSound
-- @param  #string soundName The sound to precache.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Performs a trace with the given origin, direction and filter.
-- @function [parent=#util] QuickTrace
-- @param  #Vector origin The origin of the trace.
-- @param  #Vector endpos The end point of the trace, relative to the start.
-- This is the direction of the trace times the distance of the trace.
-- @param  #Entity filter Entity which should be ignored by the trace. _(Default: nil)_
-- Can also be a table of entities or a function. See **Trace structure**.
-- @return #table Trace result. See **TraceResult structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the absolute system path the file relative to /garrysmod/.
-- @function [parent=#util] RelativePathToFull
-- @param  #string file The file to get the absolute path of.
-- @return #string File's absolute path.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Removes PData of offline player using his SteamID.
-- 
-- **Warning**: _This function internally uses **Player:UniqueID**, which can cause
-- collisions (two or more players sharing the same PData entry). It's recommended
-- that you don't use it._
-- @function [parent=#util] RemovePData
-- @param  #string steamID SteamID of the player.
-- @param  #string name Variable name to remove.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Makes the screen shake.
-- @function [parent=#util] ScreenShake
-- @param  #Vector pos The origin of the effect.
-- @param  #number amplitude The strength of the effect.
-- @param  #number frequency The frequency of the effect in Hz.
-- @param  #number duration The duration of the effect in seconds.
-- @param  #number radius The range from the origin within which views will be affected, in Hammer Units.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Sets PData for offline player using his SteamID.
-- 
-- **Warning**: _This function internally uses **Player:UniqueID**, which can cause
-- collisions (two or more players sharing the same PData entry). It's recommended
-- that you don't use it._
-- @function [parent=#util] SetPData
-- @param  #string steamID SteamID of the player.
-- @param  #string name Variable name to store the value in.
-- @param  #any value The value to store.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Generates a random float value that should be the same on client and server.
-- 
-- **Note**: _This function is best used in a Predicted Hook._
-- @function [parent=#util] SharedRandom
-- @param  #string uniqueName The seed for the random value.
-- @param  #number min The minimum value of the random range.
-- @param  #number max The maximum value of the random range.
-- @param  #number additionalSeed The additional seed. _(Default: 0)_
-- @return #number The random float value.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a trail to the specified entity.
-- @function [parent=#util] SpriteTrail
-- @param  #Entity ent Entity to attach trail to.
-- @param  #number attachmentID Attachment ID of the entities model to attach trail to. If you are not sure, set this to 0.
-- @param  #table color Color of the trail, see **Color structure**.
-- @param  #boolean additive Should the trail be additive or not.
-- @param  #number startWidth Start width of the trail.
-- @param  #number endWidth End width of the trail.
-- @param  #number lifetime How long it takes to transition from startWidth to endWidth.
-- @param  #number textureRes The resolution of trails texture.
-- A good value can be calculated using this formula: 1 / ( startWidth + endWidth ) * 0.5
-- @param  #string texture Path to the texture to use as a trail.
-- **Note**: _You should also include the ".vmt" or the game WILL crash!_
-- @return #Entity Entity of created trail. (env_spritetrail)

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a new **Stack** object.
-- @function [parent=#util] Stack
-- @return #Stack A brand new stack object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Given a 64bit SteamID will return a STEAM_0: style Steam ID.
-- @function [parent=#util] SteamIDFrom64
-- @param  #string id The 64 bit Steam ID.
-- @return #string STEAM_0 style Steam ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Given a STEAM_0 style Steam ID will return a 64bit Steam ID.
-- @function [parent=#util] SteamIDTo64
-- @param  #string id The STEAM_0 style id.
-- @return #string 64bit Steam ID.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a string to the specified type. This can be useful when dealing
-- with ConVars.
-- @function [parent=#util] StringToType
-- @param  #string str The string to convert.
-- @param  #string typename The type to attempt to convert the string to.
-- This can be vector, angle, float, int, bool, or string. (case insensitive)
-- @return #any The result of the conversion, or nil if a bad type is specified.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a table to a JSON string.
-- 
-- **Warning**: _All keys are strings in the JSON format, so all keys will be
-- converted to strings!_
-- 
-- **Warning**: _All integers will be converted to decimals (5 -> 5.0)._
-- @function [parent=#util] TableToJSON
-- @param  #table table Table to convert.
-- @param  #boolean prettyPrint Format and indent the JSON. _(Default: false)_
-- @return #string JSON.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts the given table into a key value string.
-- @function [parent=#util] TableToKeyValues
-- @param  #table table The table to convert.
-- @return #string KeyValue string.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a timer object.
-- @function [parent=#util] Timer
-- @param  #number startdelay How long you want the timer to be. _(Default: 0)_
-- @return #table A timer object.
-- It has next methods:
-- 
-- * Reset() - Resets the timer to nothing.
-- * Start( time ) - Starts the timer, call with end time.
-- * Started() - Returns true if the timer has been started.
-- * Elapsed() - Returns true if the time has elapsed.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the time since this function has been last called.
-- @function [parent=#util] TimerCycle
-- @return #number Time since this function has been last called in ms.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should use tobool instead._
-- 
-- Converts string or a number to a bool, if possible. Alias of tobool.
-- @function [parent=#util] tobool
-- @param  #any input A string or a number to convert.
-- @return #boolean False if the input is equal to the string or boolean "false", if the input is equal to the string or number "0", or if the input is nil.
-- Returns true otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Runs a trace using the entity's collisionmodel between two points. This does
-- not take the entity's angles into account and will trace its unrotated collisionmodel.
-- 
-- **Note**: _Clientside entities will not be hit by traces._
-- @function [parent=#util] TraceEntity
-- @param  #table tracedata Trace data. See **Trace structure**.
-- @param  #Entity ent The entity to use.
-- @return #table Trace result. See **TraceResult structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should use tobool instead._
-- 
-- Traces from one entity to another.
-- @function [parent=#util] TraceEntityHull
-- @param  #Entity ent1 The first entity to trace from.
-- @param  #Entity ent2 The second entity to trace to.
-- @return #table Trace result. See **TraceResult structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Performs an AABB hull (axis-aligned bounding box, aka not rotated) trace
-- with the given trace data.
-- 
-- **Note**: _Clientside entities will not be hit by traces._
-- 
-- **Note**: _This function may not always give desired results clientside due
-- to certain physics mechanisms not existing on the client. Use it serverside
-- for accurate results._
-- @function [parent=#util] TraceHull
-- @param  #table TraceData The trace data to use. See **HullTrace structure**.
-- @return #table Trace result. See **TraceResult structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Performs a trace with the given trace data.
-- @function [parent=#util] TraceLine
-- @param  #table TraceData The trace data to use. See **Trace structure**.
-- @return #table Trace result. See **TraceResult structure**.
-- Can return nil if **game.GetWorld** or its physics object is invalid. This will be the case for any traces done before **GM:InitPostEntity** is called.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a type to a (nice, but still parsable) string.
-- @function [parent=#util] TypeToString
-- @param  #any input What to convert.
-- @return #string Converted string.

return nil
