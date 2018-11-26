-------------------------------------------------------------------------------
-- The duplicator library allows you to specify what should be saved when
-- someone attempts to duplicate your custom entity with the duplicator tool.
-- It can also be used by 3rd party duplicator tools to make use of the built
-- in system.
-- @module duplicator

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Allow this entity to be duplicated.
-- @function [parent=#duplicator] Allow
-- @param  #string classname An entity's classname.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Calls every function registered with **duplicator.RegisterBoneModifier** on
-- each bone the entity has.
-- @function [parent=#duplicator] ApplyBoneModifiers
-- @param  #Player ply The player who owns the entity.
-- @param  #Entity ent The entity to apply function calls to.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Calls every function registered with **duplicator.RegisterEntityModifier** on
-- the entity.
-- @function [parent=#duplicator] ApplyEntityModifiers
-- @param  #Player ply The player who owns the entity.
-- @param  #Entity ent The entity to apply function calls to.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Clears/removes the chosen entity modifier from the entity.
-- @function [parent=#duplicator] ClearEntityModifier
-- @param  #Entity ent The entity the modification is stored on.
-- @param  #any The key of the stored entity modifier.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Copies the entity, and all of its constraints and entities, then returns
-- them in a table.
-- @function [parent=#duplicator] Copy
-- @param  #Entity ent The entity to duplicate. The function will automatically copy all constrained entities.
-- @param  A pre-existing table to add entities and constraints in from. _(Default: {})_  
-- Uses the same table format as the table returned from this function.
-- @return #table A table containing duplication info which includes the following members:
-- 
-- * _#table Entities_
-- * _#table Constraints_
-- * _#Vector Mins_
-- * _#Vector Maxs_
-- 
-- The values of Mins & Maxs from the table are returned from **duplicator.WorkoutSize**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Copies the passed table of entities to save for later.
-- @function [parent=#duplicator] CopyEnts
-- @param  #table ents A table of entities to save/copy.
-- @return #table A table containing duplication info which includes the following members:
-- 
-- * _#table Entities_
-- * _#table Constraints_
-- * _#Vector Mins_
-- * _#Vector Maxs_
-- 
-- The values of Mins & Maxs from the table are returned from **duplicator.WorkoutSize**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table with some entity data that can be used to create a new
-- entity with **duplicator.CreateEntityFromTable**.
-- @function [parent=#duplicator] CopyEntTable
-- @param  #Entity ent The entity table to save.
-- @return #table An EntityCopyData object. See **EntityCopyData structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Creates a constraint from a saved/copied constraint table.
-- @function [parent=#duplicator] CreateConstraintFromTable
-- @param  #table constraint Saved/copied constraint table.
-- @param  #table entityList The list of entities that are to be constrained.
-- @return #Entity The newly created constraint entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Creates an entity from a table. This creates an entity using the data in
-- entTable. If an entity factory has been registered for the entity's Class,
-- it will be called. Otherwise, **duplicator.GenericDuplicatorFunction** will
-- be called instead.
-- @function [parent=#duplicator] CreateEntityFromTable
-- @param  #Player ply The player who wants to create something.
-- @param  #table entTable The duplication data to build the entity with. See **EntityCopyData structure**.
-- @return #Entity The newly created entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Restores the bone's data. Loops through Bones and calls
-- **Entity:ManipulateBoneScale**, **Entity:ManipulateBoneAngles** and
-- **Entity:ManipulateBonePosition** on ent with the table keys and the
-- subtable values s, a and p respectively.
-- @function [parent=#duplicator] DoBoneManipulator
-- @param  #Entity ent The entity to be bone manipulated.
-- @param  #table bones Table with a **BoneManipulationData structure** for every bone (that has manipulations applied) using the bone ID as the table index.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Restores the flex data using **Entity:SetFlexWeight** and **Entity:SetFlexScale**.
-- @function [parent=#duplicator] DoFlex
-- @param  #Entity ent The entity to restore the flexes on.
-- @param  #table flex The flexes to restore.
-- @param  #number scale The flex scale to apply. _(Default: nil)_ (Flex scale is unchanged if omitted)

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Applies generic every-day entity stuff for ent from table data. Depending on
-- the values of Model, Angle, Pos, Skin, Flex, Bonemanip, ModelScale,
-- ColGroup, Name, and BodyG (table of multiple values) in the data table, this
-- calls **Entity:SetModel**, **Entity:SetAngles**, **Entity:SetPos**, **Entity:SetSkin**,
-- **duplicator.DoFlex**, **duplicator.DoBoneManipulator**, **Entity:SetModelScale**,
-- **Entity:SetCollisionGroup**, **Entity:SetName**, **Entity:SetBodygroup** on ent.
-- If ent has a RestoreNetworkVars function, it is called with data.DT.
-- @function [parent=#duplicator] DoGeneric
-- @param  #Entity ent The entity to be applied upon.
-- @param  #table data The data to be applied onto the entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Applies bone data, generically. If data contains a PhysicsObjects table, it
-- moves, re-angles and if relevent freezes all specified bones, first
-- converting from local coordinates to world coordinates.
-- @function [parent=#duplicator] DoGenericPhysics
-- @param  #Entity ent The entity to be applied upon.
-- @param  #Player ply The player who owns the entity. _(Default: nil)_ (Unused in function as of early 2013)
-- @param  #table data The data to be applied onto the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity class factory registered with **duplicator.RegisterEntityClass**.
-- @function [parent=#duplicator] FindEntityClass
-- @param  #string name The name of the entity class factory.
-- @return #table A table with the following members:
-- 
-- * _#function func_ : The function that creates the entity.
-- * _#table args_ : Arguments to pass to the function.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Generic function for duplicating stuff. This is called when
-- **duplicator.CreateEntityFromTable** can't find an entity factory to build with.
-- It calls **duplicator.DoGeneric** and **duplicator.DoGenericPhysics* to apply
-- standard duplicator stored attributes such as the model and position.
-- @function [parent=#duplicator] GenericDuplicatorFunction
-- @param  #Player ply The player who wants to create something.
-- @param  #table data The duplication data to build the entity with.
-- @return #Entity The newly created entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Fills entStorageTable with all of the entities in a group connected with
-- constraints. Fills constraintStorageTable with all of the constrains
-- constraining the group.
-- @function [parent=#duplicator] GetAllConstrainedEntitiesAndConstraints
-- @param  #Entity ent The entity to start from.
-- @param  #table entStorageTable The table the entities will be inserted into.
-- @param  #table constraintStorageTable The table the constraints will be inserted into.
-- @return #table, #table The entStorageTable and constraintStorageTable arguments.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the entity can be duplicated or not.
-- @function [parent=#duplicator] IsAllowed
-- @param  #string classname An entity's classname.
-- @return #boolean Returns true if the entity can be duplicated (nil otherwise).

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Given entity list and constraint list, create all entities and return their tables.  
-- Calls **duplicator.CreateEntityFromTable** on each sub-table of EntityList. If
-- an entity is actually created, it calls **ENTITY:OnDuplicated** with the
-- entity's duplicator data, then **duplicator.ApplyEntityModifiers**,
-- **duplicator.ApplyBoneModifiers** and **finally ENTITY:PostEntityPaste** is called.
-- The constraints are then created with **duplicator.CreateConstraintFromTable**.
-- @function [parent=#duplicator] Paste
-- @param  #Player ply The player who wants to create something.
-- @param  #table EntityList A table of duplicator data to create the entities from.
-- @param  #table ConstraintList A table of duplicator data to create the constraints from.
-- @return #table, #table A list of created entities and a list of created constraints.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Registers a function to be called on each of an entity's bones when
-- **duplicator.ApplyBoneModifiers** is called.
-- 
-- **Note**: _This function is available to call on the client, but registered
-- functions aren't used anywhere!_
-- @function [parent=#duplicator] RegisterBoneModifier
-- @param  #any key The type of the key doesn't appear to matter, but it is preferable to use a string.
-- @param  #function boneModifier Function called on each bone that an ent has. Called during **duplicator.ApplyBoneModifiers**.  
-- Function parameters are:
-- 
-- * _#Player ply_
-- * _#Entity ent_
-- * _#number boneID_
-- * _#PhysObj bone_
-- * _#table data_
-- 
-- The data table that is passed to boneModifier is set with **duplicator.StoreBoneModifier**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Register a function used for creating a duplicated constraint.
-- @function [parent=#duplicator] RegisterConstraint
-- @param  #string name The unique name of new constraint.
-- @param  #function callback Function to be called when this constraint is created.
-- @param  ... Arguments to pass to the callback function.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This allows you to specify a specific function to be run when your SENT is
-- pasted with the duplicator, instead of relying on the generic automatic functions.
-- 
-- **Note**: _Automatically calls **duplicator.Allow** for the entity class._
-- @function [parent=#duplicator] RegisterEntityClass
-- @param  #string name The ClassName of the entity you wish to register a factory for.
-- @param  #function func The factory function you want to have called. It should have the arguments (Player, ...) where ... is whatever arguments you request to be passed.
-- @param  ... Strings of the names of arguments you want passed to function the from the **EntityCopyData structure**. As a special case, "Data" will pass the whole structure.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This allows you to register tweaks to entities. For instance, if you were
-- making an "unbreakable" addon, you would use this to enable saving the
-- "unbreakable" state of entities between duplications. This function
-- registers a piece of generic code that is run on all entities with this
-- modifier. In order to have it actually run, use **duplicator.StoreEntityModifier**.  
-- This function does nothing when run clientside.
-- @function [parent=#duplicator] RegisterEntityModifier
-- @param  #string name An identifier for your modification. (This is not limited, so be verbose. "Person's 'Unbreakable' mod" is far less likely to cause conflicts than "unbreakable")
-- @param  #function func The function to be called for your modification. It should have the arguments (Player, Entity, Data), where data is what you pass to **duplicator.StoreEntityModifier**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Help to remove certain map created entities before creating the saved
-- entities. This is obviously so we don't get duplicate props everywhere.
-- It should be called before calling Paste.
-- @function [parent=#duplicator] RemoveMapCreatedEntities

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- When a copy is copied it will be rotated according to this angle, if you set
-- it.  _Make sure to set it back to 0 0 0!_
-- @function [parent=#duplicator] SetLocalAng
-- @param  #Angle v The angle to rotate all pastes from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- When a copy is copied it will be translated according to this vector, if you
-- set it.  _Make sure to set it back to 0 0 0!_
-- @function [parent=#duplicator] SetLocalPos
-- @param  #Vector v The position to offset all pastes from.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Stores bone mod data for a registered bone modification function.
-- @function [parent=#duplicator] StoreBoneModifier
-- @param  #Entity ent The entity to add bone mod data to.
-- @param  #number boneID The bone ID. See **Entity:GetPhysicsObjectNum**.
-- @param  #any key The key for the bone modification.
-- @param  #table data The bone modification data that is passed to the bone modification function.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Stores an entity modifier into an entity for saving.
-- @function [parent=#duplicator] StoreEntityModifier
-- @param  #Entity entity The entity to store modifier in.
-- @param  #string name Unique modifier name as defined in **duplicator.RegisterEntityModifier**.
-- @param  #table data The modifier data.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Work out the AABB bounding box size.
-- @function [parent=#duplicator] WorkoutSize
-- @param  #table Ents A table of entity duplication datums.

return nil
