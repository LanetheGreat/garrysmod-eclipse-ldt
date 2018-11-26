-------------------------------------------------------------------------------
-- Lua global variables.
-- The basic library provides some core functions to Lua.
-- All the preloaded module of Lua are declared here.
-- @module global

------------------------------------------------------------------------------
-- This library provides generic functions for coroutine manipulation.
-- This is a global variable which holds the preloaded @{coroutine} module.
-- @field[parent = #global] coroutine#coroutine coroutine preloaded module

------------------------------------------------------------------------------
-- The package library provides basic facilities for loading and building modules in Lua.
-- This is a global variable which holds the preloaded @{package} module.
-- @field[parent = #global] package#package package preloaded module

------------------------------------------------------------------------------
-- This library provides generic functions for string manipulation.
-- This is a global variable which holds the preloaded @{string} module.
-- @field[parent = #global] string#string string preloaded module

------------------------------------------------------------------------------
-- This library provides generic functions for table manipulation.
-- This is a global variable which holds the preloaded @{table} module.
-- @field[parent = #global] table#table table preloaded module

------------------------------------------------------------------------------
-- This library is an interface to the standard C math library.
-- In Garry's Mod several additional math functions have been added.
-- This is a global variable which holds the preloaded @{math} module.
-- @field[parent = #global] math#math math preloaded module

------------------------------------------------------------------------------
-- The I/O library provides function for file manipulation.
-- This is a global variable which holds the preloaded @{io} module.
-- @field[parent = #global] io#io io preloaded module

------------------------------------------------------------------------------
-- Operating System Facilities.
-- This is a global variable which holds the preloaded @{os} module.
-- @field[parent = #global] os#os os preloaded module

------------------------------------------------------------------------------
-- The Debug Library.
-- This is a  global variable which hold the preloaded @{debug} module.
-- @field[parent = #global] debug#debug debug preloaded module

-------------------------------------------------------------------------------
-- This function is a generic interface to the garbage collector.
-- It performs different functions according to its first argument, `opt`:
--
-- * **"stop":** stops the garbage collector.
-- * **"restart":** restarts the garbage collector.
-- * **"collect":** performs a full garbage-collection cycle.
-- * **"count":** returns the total memory in use by Lua (in Kbytes).
-- * **"step":** performs a garbage-collection step. The step "size" is controlled
--     by `arg` (larger values mean more steps) in a non-specified way. If you
--     want to control the step size you must experimentally tune the value of
--    `arg`. Returns true if the step finished a collection cycle.
-- * **"setpause":** sets `arg` as the new value for the *pause* of the collector.
--     Returns the previous value for *pause*.
-- * **"setstepmul":** sets `arg` as the new value for the *step multiplier*
--       of the collector. Returns the previous value for *step*.
-- @function [parent=#global] collectgarbage
-- @param #string opt the command to send.
-- @param arg the argument of the command. (optional)

-------------------------------------------------------------------------------
-- Opens the named file and executes its contents as a Lua chunk. When
-- called without arguments,
-- `dofile` executes the contents of the standard input (`stdin`). Returns
-- all values returned by the chunk. In case of errors, `dofile` propagates
-- the error to its caller (that is, `dofile` does not run in protected mode).
-- @function [parent=#global] dofile
-- @param #string filename the path to the file. (optional)

-------------------------------------------------------------------------------
-- Terminates the last protected function called and returns `message`
-- as the error message. Function `error` never returns.
--
-- Usually, `error` adds some information about the error position at the
-- beginning of the message. The `level` argument specifies how to get the
-- error position.  
-- With level 1 (the default), the error position is where the
-- `error` function was called.  
-- Level 2 points the error to where the function
-- that called `error` was called; and so on.  
-- Passing a level 0 avoids the addition of error position information to the message.
-- @function [parent=#global] error
-- @param #string message an error message.
-- @param #number level specifies how to get the error position, default value is `1`.

-------------------------------------------------------------------------------
-- A global variable (not a function) that holds the global environment
-- (that is, `_G._G = _G`). Lua itself does not use this variable; changing
-- its value does not affect any environment, nor vice-versa. (Use `setfenv`
-- to change environments.)
-- @field [parent = #global] #table _G

-------------------------------------------------------------------------------
-- Returns the current environment in use by the function.
-- @function [parent=#global] getfenv
-- @param f can be a Lua function or a number that specifies the function at that
-- stack level: Level 1 is the function calling `getfenv`. If the given
-- function is not a Lua function, or if `f` is `0`, `getfenv` returns the
-- global environment. The default for `f` is `1`.

-------------------------------------------------------------------------------
-- If `object` does not have a metatable, returns nil. Otherwise, if the
-- object's metatable has a `"__metatable"` field, returns the associated
-- value. Otherwise, returns the metatable of the given object.
-- @function [parent=#global] getmetatable
-- @param object
-- @return #table the metatable of object.

-------------------------------------------------------------------------------
-- Use to iterate over a table by index.
-- Returns three values: an iterator function, the table `t`, and 0,
-- so that the construction :
-- 
--     for i,v in ipairs(t) do *body* end
-- will iterate over the pairs (`1,t[1]`), (`2,t[2]`), ..., up to the
-- first integer key absent from the table.
-- @function [parent=#global] ipairs
-- @param #table t a table by index.

-------------------------------------------------------------------------------
-- Loads a chunk using function `func` to get its pieces. Each call to
-- `func` must return a string that concatenates with previous results. A
-- return of an empty string, **nil,** or no value signals the end of the chunk.
--
-- If there are no errors, returns the compiled chunk as a function; otherwise,
-- returns nil plus the error message. The environment of the returned function
-- is the global environment.
--
-- `chunkname` is used as the chunk name for error messages and debug
-- information. When absent, it defaults to "`=(load)`".
-- @function [parent=#global] load
-- @param func function which loads the chunk.
-- @param #string chunkname chunk name used for error messages and debug information, default value is "`=(load)`".

-------------------------------------------------------------------------------
-- Similar to `load`, but gets the chunk from file `filename` or from the
-- standard input, if no file name is given.
-- @function [parent=#global] loadfile
-- @param #string filename the path to the file. (optional)

-------------------------------------------------------------------------------
-- Similar to `load`, but gets the chunk from the given string.
-- To load and run a given string, use the idiom  
-- 
--     assert(loadstring(s))()
-- When absent, `chunkname` defaults to the given string.
-- @function [parent=#global] loadstring
-- @param #string string lua code to load.
-- @param #string chunkname chunk name used for error messages and debug information, default value is the given string.

-------------------------------------------------------------------------------
-- Allows a program to traverse all fields of a table. Its first argument is
-- a table and its second argument is an index in this table. `next` returns
-- the next index of the table and its associated value.
--
-- When called with nil
-- as its second argument, `next` returns an initial index and its associated
-- value. When called with the last index, or with nil in an empty table, `next`
-- returns nil.
--
-- If the second argument is absent, then it is interpreted as
-- nil. In particular, you can use `next(t)` to check whether a table is empty.
-- The order in which the indices are enumerated is not specified, *even for
-- numeric indices*. (To traverse a table in numeric order, use a numerical
-- for or the `ipairs` function.)
--
-- The behavior of `next` is *undefined* if, during the traversal, you assign
-- any value to a non-existent field in the table. You may however modify
-- existing fields. In particular, you may clear existing fields.
-- @function [parent=#global] next
-- @param #table table table to traverse.
-- @param index initial index.

-------------------------------------------------------------------------------
-- Use to iterate over a table.
-- Returns three values: the `next` function, the table `t`, and nil,
-- so that the construction :
-- 
--     for k,v in pairs(t) do *body* end
-- will iterate over all key-value pairs of table `t`.
-- 
-- See function `next` for the caveats of modifying the table during its
-- traversal.
-- @function [parent=#global] pairs
-- @param #table t table to traverse.

-------------------------------------------------------------------------------
-- Calls function `f` with the given arguments in *protected mode*. This
-- means that any error inside `f` is not propagated; instead, `pcall` catches
-- the error and returns a status code. Its first result is the status code (a
-- boolean), which is true if the call succeeds without errors. In such case,
-- `pcall` also returns all results from the call, after this first result. In
-- case of any error, `pcall` returns false plus the error message.
-- @function [parent=#global] pcall
-- @param f function to be call in *protected mode*.
-- @param ... function arguments.
-- @return #boolean true plus the result of `f` function if its call succeeds without errors.
-- @return #boolean,#string  false plus the error message in case of any error.

-------------------------------------------------------------------------------
-- Receives any number of arguments, and prints their values to `stdout`,
-- using the `tostring` function to convert them to strings. `print` is not
-- intended for formatted output, but only as a quick way to show a value,
-- typically for debugging. For formatted output, use `string.format`.
-- @function [parent=#global] print
-- @param ... values to print to `stdout`.

-------------------------------------------------------------------------------
-- Checks whether `v1` is equal to `v2`, without invoking any
-- metamethod. Returns a boolean.
-- @function [parent=#global] rawequal
-- @param v1
-- @param v2
-- @return #boolean true if `v1` is equal to `v2`. 

-------------------------------------------------------------------------------
-- Gets the real value of `table[index]`, without invoking any
-- metamethod. `table` must be a table; `index` may be any value.
-- @function [parent=#global] rawget
-- @param #table table
-- @param index may be any value.
-- @return The real value of `table[index]`, without invoking any
-- metamethod.

-------------------------------------------------------------------------------
-- Sets the real value of `table[index]` to `value`, without invoking any
-- metamethod. `table` must be a table, `index` any value different from nil,
-- and `value` any Lua value.  
-- This function returns `table`.
-- @function [parent=#global] rawset
-- @param #table table
-- @param index any value different from nil.
-- @param value any Lua value.

-------------------------------------------------------------------------------
-- If `index` is a number, returns all arguments after argument number
-- `index`. Otherwise, `index` must be the string `"#"`, and `select` returns
-- the total number of extra arguments it received.
-- @function [parent=#global] select
-- @param index a number or the string `"#"`
-- @param ...

-------------------------------------------------------------------------------
-- Sets the environment to be used by the given function. `f` can be a Lua
-- function or a number that specifies the function at that stack level: Level
-- 1 is the function calling `setfenv`. `setfenv` returns the given function.  
-- As a special case, when `f` is 0 `setfenv` changes the environment of the
-- running thread. In this case, `setfenv` returns no values.
-- @function [parent=#global] setfenv
-- @param f a Lua function or a number that specifies the stack level.
-- @param #table table used as environment for `f`.
-- @return The given function.

-------------------------------------------------------------------------------
-- Sets the metatable for the given table. (You cannot change the metatable
-- of other types from Lua, only from C.) If `metatable` is nil, removes the
-- metatable of the given table. If the original metatable has a `"__metatable"`
-- field, raises an error.  
-- This function returns `table`.
-- @function [parent=#global] setmetatable
-- @param #table table 
-- @param #table metatable
-- @return The first argument `table`. 

-------------------------------------------------------------------------------
-- Tries to convert its argument to a number. If the argument is already
-- a number or a string convertible to a number, then `tonumber` returns this
-- number; otherwise, it returns **nil.**
--
-- An optional argument specifies the base to interpret the numeral. The base
-- may be any integer between 2 and 36, inclusive. In bases above 10, the
-- letter '`A`' (in either upper or lower case) represents 10, '`B`' represents
-- 11, and so forth, with '`Z`' representing 35. In base 10 (the default),
-- the number can have a decimal part, as well as an optional exponent part.
-- In other bases, only unsigned integers are accepted.
-- @function [parent=#global] tonumber
-- @param e a number or string to convert to a number.
-- @param #number base the base to interpret the numeral, any integer between 2 and 36.(default is 10).
-- @return #number a number if conversion succeeds else **nil**.

-------------------------------------------------------------------------------
-- Receives an argument of any type and converts it to a string in a
-- reasonable format. For complete control of how numbers are converted, use
-- `string.format`.
--
-- If the metatable of `e` has a `"__tostring"` field, then `tostring` calls
-- the corresponding value with `e` as argument, and uses the result of the
-- call as its result.
-- @function [parent=#global] tostring
-- @param e an argument of any type.
-- @return #string a string in a reasonable format.

-------------------------------------------------------------------------------
-- Returns the type of its only argument, coded as a string. The possible
-- results of this function are "
-- `nil`" (a string, not the value nil), "`number`", "`string`", "`boolean`",
-- "`table`", "`function`", "`thread`", and "`userdata`".
-- @function [parent=#global] type
-- @param v any value.
-- @return #string the type of `v`.

-------------------------------------------------------------------------------
-- Returns the elements from the given table. This function is equivalent to
-- 
--     return list[i], list[i+1], ..., list[j]
-- except that the above code can be written only for a fixed number of
-- elements. By default, `i` is 1 and `j` is the length of the list, as
-- defined by the length operator.
-- @function [parent=#global] unpack
-- @param #table list a table by index
-- @param i index of first value.
-- @param j index of last value.

-------------------------------------------------------------------------------
-- A global variable (not a function) that holds a string containing the
-- current interpreter version. The current contents of this variable is
-- "`Lua 5.1`".
-- @field [parent = #global] #string _VERSION

-------------------------------------------------------------------------------
-- This function is similar to `pcall`, except that you can set a new
-- error handler.
--
-- `xpcall` calls function `f` in protected mode, using `err` as the error
-- handler. Any error inside `f` is not propagated; instead, `xpcall` catches
-- the error, calls the `err` function with the original error object, and
-- returns a status code. Its first result is the status code (a boolean),
-- which is true if the call succeeds without errors. In this case, `xpcall`
-- also returns all results from the call, after this first result. In case
-- of any error, `xpcall` returns false plus the result from `err`.
-- @function [parent=#global] xpcall
-- @param f function to be call in *protected mode*.
-- @param err function used as error handler.
-- @return #boolean true plus the result of `f` function if its call succeeds without errors.
-- @return #boolean,#string  false plus the result of `err` function. 

-------------------------------------------------------------------------------
-- Creates a module. If there is a table in `package.loaded[name]`,
-- this table is the module. Otherwise, if there is a global table `t`
-- with the given name, this table is the module. 
-- 
-- Otherwise creates a new table `t` and sets it as the value of the global 
-- `name` and the value of `package.loaded[name]`. 
--  This function also initializes `t._NAME` with the
-- given name, `t._M` with the module (`t` itself), and `t._PACKAGE` with the
-- package name (the full module name minus last component; see below). Finally,
-- `module` sets `t` as the new environment of the current function and the
-- new value of `package.loaded[name]`, so that `require` returns `t`.
--
-- If `name` is a compound name (that is, one with components separated by
-- dots), `module` creates (or reuses, if they already exist) tables for each
-- component. For instance, if `name` is `a.b.c`, then `module` stores the
-- module table in field `c` of field `b` of global `a`.
--
-- This function can receive optional *options* after the module name, where
-- each option is a function to be applied over the module.
-- @function [parent=#global] module
-- @param name the module name.

-------------------------------------------------------------------------------
-- Loads the given module. The function starts by looking into the
-- `package.loaded` table to determine whether `modname` is already
-- loaded. If it is, then `require` returns the value stored at
-- `package.loaded[modname]`. Otherwise, it tries to find a *loader* for
-- the module.
--
-- To find a loader, `require` is guided by the `package.loaders` array. By
-- changing this array, we can change how `require` looks for a module. The
-- following explanation is based on the default configuration for
-- `package.loaders`.
--
-- First `require` queries `package.preload[modname]`. If it has a value,
-- this value (which should be a function) is the loader. Otherwise `require`
-- searches for a Lua loader using the path stored in `package.path`. If
-- that also fails, it searches for a C loader using the path stored in
-- `package.cpath`. If that also fails, it tries an *all-in-one* loader (see
-- `package.loaders`).
--
-- Once a loader is found, `require` calls the loader with a single argument,
-- `modname`. If the loader returns any value, `require` assigns the returned
-- value to `package.loaded[modname]`. If the loader returns no value and
-- has not assigned any value to `package.loaded[modname]`, then `require`
-- assigns true to this entry. In any case, `require` returns the final value
-- of `package.loaded[modname]`.
--
-- If there is any error loading or running the module, or if it cannot find
-- any loader for the module, then `require` signals an error.
-- @function [parent=#global] require
-- @param #string modname name of module to load.

------------------------------------------------------------------------------
-- GWEN is a system that allows you to load a spritesheet and generate a
-- skin out of it.
-- This is a global variable which holds the preloaded @{GWEN} module.
-- @field[parent = #global] GWEN#GWEN GWEN preloaded module

------------------------------------------------------------------------------
-- This library is used internally by Garry's Mod to help keep track of
-- achievement progress and unlock the appropriate achievements once a
-- certain number is reached.
-- 
-- However, this library can also be used by anyone else to forcefully
-- unlock certain achievements.
-- This is a global variable which holds the preloaded @{achievements} module.
-- @field[parent = #global] achievements#achievements achievements preloaded module

------------------------------------------------------------------------------
-- The ai library.
-- This is a global variable which holds the preloaded @{ai} module.
-- @field[parent = #global] ai#ai ai preloaded module

------------------------------------------------------------------------------
-- Allows you to set up a schedule for NPCs to follow.
-- This lets you dictate their actions.
-- This is a global variable which holds the preloaded @{ai_schedule} module.
-- @field[parent = #global] ai_schedule#ai_schedule ai_schedule preloaded module

------------------------------------------------------------------------------
-- Used to create tasks for scripted NPCs.
-- This is a global variable which holds the preloaded @{ai_task} module.
-- @field[parent = #global] ai_task#ai_task ai_task preloaded module

------------------------------------------------------------------------------
-- The baseclass library.
-- This is a global variable which holds the preloaded @{baseclass} module.
-- @field[parent = #global] baseclass#baseclass baseclass preloaded module

------------------------------------------------------------------------------
-- The bitwise library contains useful functions for bitwise operations.
-- This is a global variable which holds the preloaded @{bit} module.
-- @field[parent = #global] bit#bit bit preloaded module

------------------------------------------------------------------------------
-- This directs all drawing to be done to a certain 2D or 3D plane or
-- position, until the corresponding "End" function is called.
-- 
-- The matrix functions exist, but are mostly unusable unless you're
-- familiar with the source engine's layout for each aspect.
-- This is a global variable which holds the preloaded @{cam} module.
-- @field[parent = #global] cam#cam cam preloaded module

------------------------------------------------------------------------------
-- The library to interface with the default chatbox.
-- This is a global variable which holds the preloaded @{chat} module.
-- @field[parent = #global] chat#chat chat preloaded module

------------------------------------------------------------------------------
-- The cleanup library allows you to control what happens to custom entities
-- when the clean-up buttons are pressed in the Utilities tab of the Spawn
-- menu (default Q).
-- This is a global variable which holds the preloaded @{cleanup} module.
-- @field[parent = #global] cleanup#cleanup cleanup preloaded module

------------------------------------------------------------------------------
-- The concommand library is used to create console commands which can be used
-- to network (basic) information & events between the client and the server.
-- This is a global variable which holds the preloaded @{concommand} module.
-- @field[parent = #global] concommand#concommand concommand preloaded module

------------------------------------------------------------------------------
-- The constraint library allows you to control the constraint system built
-- into the physics engine (rope, weld, ballsockets, etc).
-- This is a global variable which holds the preloaded @{constraint} module.
-- @field[parent = #global] constraint#constraint constraint preloaded module

------------------------------------------------------------------------------
-- The construct library is used to control the physical properties of entities.
-- This is a global variable which holds the preloaded @{construct} module.
-- @field[parent = #global] construct#construct construct preloaded module

------------------------------------------------------------------------------
-- Retrieves the control panel for a given stool in the Q menu.
-- This is a global variable which holds the preloaded @{controlpanel} module.
-- @field[parent = #global] controlpanel#controlpanel controlpanel preloaded module

------------------------------------------------------------------------------
-- Used to store permanent variables/settings on clients that will persist
-- between servers.
-- This is a global variable which holds the preloaded @{cookie} module.
-- @field[parent = #global] cookie#cookie cookie preloaded module

------------------------------------------------------------------------------
-- The cvars library allows you to control what happens when a cvar (console
-- variable) is changed.
-- This is a global variable which holds the preloaded @{cvars} module.
-- @field[parent = #global] cvars#cvars cvars preloaded module

------------------------------------------------------------------------------
-- The debugoverlay library is mainly useful for 3D debugging, it can be used
-- to draw shapes on the screen for debug purposes.
-- This is a global variable which holds the preloaded @{debugoverlay} module.
-- @field[parent = #global] debugoverlay#debugoverlay debugoverlay preloaded module

------------------------------------------------------------------------------
-- The derma library allows you to add custom derma controls and create &
-- modify derma skins.
-- This is a global variable which holds the preloaded @{derma} module.
-- @field[parent = #global] derma#derma derma preloaded module

------------------------------------------------------------------------------
-- The drag'n'drop library, used internally by certain base panels to allow
-- for drag'n'drop functionality, like spawnmenu's customizations.
-- This is a global variable which holds the preloaded @{dragndrop} module.
-- @field[parent = #global] dragndrop#dragndrop dragndrop preloaded module

------------------------------------------------------------------------------
-- The draw library's purpose is to simplify the usage of the **surface** library.
-- This is a global variable which holds the preloaded @{draw} module.
-- @field[parent = #global] draw#draw draw preloaded module

------------------------------------------------------------------------------
-- The drive library is for adding custom control modes to the new "remote
-- control" entity piloting system in Garry's Mod 13.
-- This is a global variable which holds the preloaded @{drive} module.
-- @field[parent = #global] drive#drive drive preloaded module

------------------------------------------------------------------------------
-- The duplicator library allows you to specify what should be saved when
-- someone attempts to duplicate your custom entity with the duplicator tool.
-- This is a global variable which holds the preloaded @{duplicator} module.
-- @field[parent = #global] duplicator#duplicator duplicator preloaded module

------------------------------------------------------------------------------
-- The effects library allows you to manually add scripted effects.
-- This is a global variable which holds the preloaded @{effects} module.
-- @field[parent = #global] effects#effects effects preloaded module

------------------------------------------------------------------------------
-- The engine library provides functions to access various features in the
-- game's engine, most are related to the demo and save systems.
-- This is a global variable which holds the preloaded @{engine} module.
-- @field[parent = #global] engine#engine engine preloaded module

------------------------------------------------------------------------------
-- The ents library provides functions for creating and finding entities in
-- the game.
-- This is a global variable which holds the preloaded @{ents} module.
-- @field[parent = #global] ents#ents ents preloaded module

------------------------------------------------------------------------------
-- The file library provides functions for finding, reading and writing to files.
-- This is a global variable which holds the preloaded @{file} module.
-- @field[parent = #global] file#file file preloaded module

------------------------------------------------------------------------------
-- The frame blending library.
-- This is a global variable which holds the preloaded @{frame_blend} module.
-- @field[parent = #global] frame_blend#frame_blend frame_blend preloaded module

------------------------------------------------------------------------------
-- The game library provides functions to access various features in the
-- game's engine, most of it's functions are related to controlling the map.
-- This is a global variable which holds the preloaded @{game} module.
-- @field[parent = #global] game#game game preloaded module

------------------------------------------------------------------------------
-- Used to interface with the built in game events system.
-- This is a global variable which holds the preloaded @{gameevent} module.
-- @field[parent = #global] gameevent#gameevent gameevent preloaded module

------------------------------------------------------------------------------
-- The gamemode library provides functions relating to the gamemode system in
-- Garry's Mod.
-- This is a global variable which holds the preloaded @{gamemode} module.
-- @field[parent = #global] gamemode#gamemode gamemode preloaded module

------------------------------------------------------------------------------
-- Similar purpose to the **game library** and **engine library**, allows access to
-- various features of the game's engine.
-- This is a global variable which holds the preloaded @{gmod} module.
-- @field[parent = #global] gmod#gmod gmod preloaded module

------------------------------------------------------------------------------
-- The gmsave library provides functions relating to the singleplayer save
-- system in Garry's Mod.
-- This is a global variable which holds the preloaded @{gmsave} module.
-- @field[parent = #global] gmsave#gmsave gmsave preloaded module

------------------------------------------------------------------------------
-- The gui library is similar to the **input library** but features functions that
-- are more focused on the mouse's interaction with GUI panels.
-- This is a global variable which holds the preloaded @{gui} module.
-- @field[parent = #global] gui#gui gui preloaded module

------------------------------------------------------------------------------
-- The halo library is used to draw glowing outlines around entities, an
-- example of this can be seen by picking up props with the physgun in Garry's
-- Mod 13.
-- This is a global variable which holds the preloaded @{halo} module.
-- @field[parent = #global] halo#halo halo preloaded module

------------------------------------------------------------------------------
-- The hammer library.
-- This is a global variable which holds the preloaded @{hammer} module.
-- @field[parent = #global] hammer#hammer hammer preloaded module

------------------------------------------------------------------------------
-- The hook library allows you to add hooks called by the game engine, allowing
-- multiple scripts to modify game function.
-- This is a global variable which holds the preloaded @{hook} module.
-- @field[parent = #global] hook#hook hook preloaded module

------------------------------------------------------------------------------
-- The http library allows either the server or client to communicate with
-- external websites via HTTP, both GET (**http.Fetch**) and POST (**http.Post**) are
-- supported. A more powerful & advanced method can be used via the global HTTP function.
-- This is a global variable which holds the preloaded @{http} module.
-- @field[parent = #global] http#http http preloaded module

------------------------------------------------------------------------------
-- The input library allows you to gather information about the clients input
-- devices (mouse & keyboard), such as the cursor position and whether a key is
-- pressed or not.
-- This is a global variable which holds the preloaded @{input} module.
-- @field[parent = #global] input#input input preloaded module

------------------------------------------------------------------------------
-- Functions to work with the LuaJIT functionality of gmod.
-- This is a global variable which holds the preloaded @{jit} module.
-- @field[parent = #global] jit#jit jit preloaded module

------------------------------------------------------------------------------
-- The killicon library is used to add to and control the icons that appear in
-- the top right of your screen when a player is killed.
-- This is a global variable which holds the preloaded @{killicon} module.
-- @field[parent = #global] killicon#killicon killicon preloaded module

------------------------------------------------------------------------------
-- The language library is used for translation.
-- This is a global variable which holds the preloaded @{language} module.
-- @field[parent = #global] language#language language preloaded module

------------------------------------------------------------------------------
-- The list library allows you add and retrieve values to and from lists. The
-- list library is basically a fancy wrapper for a table, but with much more
-- limited functionality.
-- This is a global variable which holds the preloaded @{list} module.
-- @field[parent = #global] list#list list preloaded module

------------------------------------------------------------------------------
-- The markup library only contains a single function to create a **MarkupObject**.
-- This is a global variable which holds the preloaded @{markup} module.
-- @field[parent = #global] markup#markup markup preloaded module

------------------------------------------------------------------------------
-- Add proxies to materials.
-- This is a global variable which holds the preloaded @{matproxy} module.
-- @field[parent = #global] matproxy#matproxy matproxy preloaded module

------------------------------------------------------------------------------
-- The menu library.
-- This is a global variable which holds the preloaded @{menu} module.
-- @field[parent = #global] menu#menu menu preloaded module

------------------------------------------------------------------------------
-- The menubar library.
-- This is a global variable which holds the preloaded @{menubar} module.
-- @field[parent = #global] menubar#menubar menubar preloaded module

------------------------------------------------------------------------------
-- The mesh library allows you to create meshes. A mesh is a set of vertices
-- that define a 3D shape, for constant meshes you should use the **IMesh** object
-- instead.
-- This is a global variable which holds the preloaded @{mesh} module.
-- @field[parent = #global] mesh#mesh mesh preloaded module

------------------------------------------------------------------------------
-- Functions related to Kinect for Windows usage in GMod.
-- This is a global variable which holds the preloaded @{motionsensor} module.
-- @field[parent = #global] motionsensor#motionsensor motionsensor preloaded module

------------------------------------------------------------------------------
-- The navigation mesh library. To be used with **CNavArea**.  
-- The navigation mesh is used by **NextBot** to calculate path to its target.
-- This is a global variable which holds the preloaded @{navmesh} module.
-- @field[parent = #global] navmesh#navmesh navmesh preloaded module

------------------------------------------------------------------------------
-- The net library is one of a number of ways to send data between the client
-- and server. The major advantages of the net library are the large size limit
-- (64kb/message) and the ability to send data backwards - from the client to
-- the server.
-- This is a global variable which holds the preloaded @{net} module.
-- @field[parent = #global] net#net net preloaded module

------------------------------------------------------------------------------
-- Used to display notifications on the screen (mid-right).
-- This is a global variable which holds the preloaded @{notification} module.
-- @field[parent = #global] notification#notification notification preloaded module

------------------------------------------------------------------------------
-- The numpad module allows you to execute functions on a key press or release.
-- This is a global variable which holds the preloaded @{numpad} module.
-- @field[parent = #global] numpad#numpad numpad preloaded module

------------------------------------------------------------------------------
-- The physenv library allows you to control the physics environment created by
-- the engine, and lets you modify constants such as gravity and maximum velocity.
-- This is a global variable which holds the preloaded @{physenv} module.
-- @field[parent = #global] physenv#physenv physenv preloaded module

------------------------------------------------------------------------------
-- The player library is used to get the Lua objects that represent players in-game.
-- This is a global variable which holds the preloaded @{player} module.
-- @field[parent = #global] player#player player preloaded module

------------------------------------------------------------------------------
-- The player_manager library lets you manage players, such as setting their
-- models or creating player classes.
-- This is a global variable which holds the preloaded @{player_manager} module.
-- @field[parent = #global] player_manager#player_manager player_manager preloaded module

------------------------------------------------------------------------------
-- The presets library lets you add and modify the pre-set options for scripted
-- tools (selected via the white bar at the top of each tools control panel).
-- This is a global variable which holds the preloaded @{presets} module.
-- @field[parent = #global] presets#presets presets preloaded module

------------------------------------------------------------------------------
-- The properties library gives you access to the menu that shows up when right
-- clicking entities while holding C.
-- This is a global variable which holds the preloaded @{properties} module.
-- @field[parent = #global] properties#properties properties preloaded module

------------------------------------------------------------------------------
-- The render library is a powerful set of functions that let you control how
-- the world and its contents are rendered. It can also be used to draw some 3D
-- clientside effects such as beams, boxes and spheres.
-- This is a global variable which holds the preloaded @{render} module.
-- @field[parent = #global] render#render render preloaded module

------------------------------------------------------------------------------
-- The resource library is used to control what files are sent to clients who
-- join a server, this includes models, materials, sounds, text files but not
-- Lua files.
-- This is a global variable which holds the preloaded @{resource} module.
-- @field[parent = #global] resource#resource resource preloaded module

------------------------------------------------------------------------------
-- The saverestore library contains functions relating to the singleplayer save
-- system built into the game.
-- This is a global variable which holds the preloaded @{saverestore} module.
-- @field[parent = #global] saverestore#saverestore saverestore preloaded module

------------------------------------------------------------------------------
-- The scripted_ents library allows you to access information about any
-- scripted entities loaded into the game, as well as register your own entities.
-- This is a global variable which holds the preloaded @{scripted_ents} module.
-- @field[parent = #global] scripted_ents#scripted_ents scripted_ents preloaded module

------------------------------------------------------------------------------
-- The search library.
-- This is a global variable which holds the preloaded @{search} module.
-- @field[parent = #global] search#search search preloaded module

------------------------------------------------------------------------------
-- Menu state library to query the master server list.
-- This is a global variable which holds the preloaded @{serverlist} module.
-- @field[parent = #global] serverlist#serverlist serverlist preloaded module

------------------------------------------------------------------------------
-- Used primarily for adding new soundscript entries.
-- This is a global variable which holds the preloaded @{sound} module.
-- @field[parent = #global] sound#sound sound preloaded module

------------------------------------------------------------------------------
-- The spawnmenu library is a set of functions that allow you to control the
-- spawn (Q) menu.
-- This is a global variable which holds the preloaded @{spawnmenu} module.
-- @field[parent = #global] spawnmenu#spawnmenu spawnmenu preloaded module

------------------------------------------------------------------------------
-- The SQL library allows you to access powerful database software included
-- with Garry's Mod. It is the preferred and fastest method of storing large
-- amounts of data. The database is located in sv.db serverside and cl.db
-- clientside, both in the Garry's Mod base folder. SQL is a whole scripting
-- language in itself although relatively simple, it's something you'll need to
-- read up on before using this library.
-- This is a global variable which holds the preloaded @{sql} module.
-- @field[parent = #global] sql#sql sql preloaded module

------------------------------------------------------------------------------
-- Steamworks related functions.
-- This is a global variable which holds the preloaded @{steamworks} module.
-- @field[parent = #global] steamworks#steamworks steamworks preloaded module

------------------------------------------------------------------------------
-- The surface library allows you to draw text and shapes on the screen.
-- Primarily used for making HUDs & custom GUI panels.
-- This is a global variable which holds the preloaded @{surface} module.
-- @field[parent = #global] surface#surface surface preloaded module

------------------------------------------------------------------------------
-- The system library provides functions that allow you to gather information
-- about the system running the game, such as operating system, uptime and
-- battery level.
-- This is a global variable which holds the preloaded @{system} module.
-- @field[parent = #global] system#system system preloaded module

------------------------------------------------------------------------------
-- The team library gives you access to the team system built into the Source
-- engine, and allows you to create custom teams and get information about them.
-- This is a global variable which holds the preloaded @{team} module.
-- @field[parent = #global] team#team team preloaded module

------------------------------------------------------------------------------
-- The timer library is a very useful set of functions which allow you to run a
-- function periodically or after a given delay.
-- This is a global variable which holds the preloaded @{timer} module.
-- @field[parent = #global] timer#timer timer preloaded module

------------------------------------------------------------------------------
-- The umsg (user message) library was previously the most common way of
-- sending information from the server to the client.
-- This is a global variable which holds the preloaded @{umsg} module.
-- @field[parent = #global] umsg#umsg umsg preloaded module

------------------------------------------------------------------------------
-- The undo library allows you to add custom entities to the undo list,
-- allowing users to "undo" their creation with their undo (default: Z) key.
-- This is a global variable which holds the preloaded @{undo} module.
-- @field[parent = #global] undo#undo undo preloaded module

------------------------------------------------------------------------------
-- The usermessage library is used to receive user messages from the server on
-- the client.
-- This is a global variable which holds the preloaded @{usermessage} module.
-- @field[parent = #global] usermessage#usermessage usermessage preloaded module

------------------------------------------------------------------------------
-- The utf8 library provides basic support for UTF-8 encoding. This library
-- does not provide any support for Unicode other than the handling of the
-- encoding. Any operation that needs the meaning of a character, such as
-- character classification, is outside its scope.
-- 
-- Unless stated otherwise, all functions that expect a byte position as a
-- parameter assume that the given position is either the start of a byte
-- sequence or one plus the length of the subject string. As in the string
-- library, negative indices count from the end of the string.
-- This is a global variable which holds the preloaded @{utf8} module.
-- @field[parent = #global] utf8#utf8 utf8 preloaded module

------------------------------------------------------------------------------
-- Utility functions.
-- This is a global variable which holds the preloaded @{util} module.
-- @field[parent = #global] util#util util preloaded module

------------------------------------------------------------------------------
-- util.worldpicker is for picking an entity in the world while GUI is open.
-- This is a global variable which holds the preloaded @{util.worldpicker} module.
-- @field[parent = #global] util.worldpicker#util.worldpicker util.worldpicker preloaded module

------------------------------------------------------------------------------
-- The vgui library allows you to script and create your own panels using
-- Valve's GUI system.
-- This is a global variable which holds the preloaded @{vgui} module.
-- @field[parent = #global] vgui#vgui vgui preloaded module

------------------------------------------------------------------------------
-- The video library.
-- This is a global variable which holds the preloaded @{video} module.
-- @field[parent = #global] video#video video preloaded module

------------------------------------------------------------------------------
-- The weapons library allows you to access information about any scripted
-- weapons loaded into the game, as well as register your own weapons.
-- This is a global variable which holds the preloaded @{weapons} module.
-- @field[parent = #global] weapons#weapons weapons preloaded module

------------------------------------------------------------------------------
-- The widgets library. Widgets allow the player to have mouse interaction
-- with entities, such as being able to manipulate the bones of an NPC.
-- This is a global variable which holds the preloaded @{widgets} module.
-- @field[parent = #global] widgets#widgets widgets preloaded module


-- Global functions

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Adds simple Get/Set accessor functions on the specified table.
-- Can also force the value to be set to a number, bool or string.
-- @function [parent=#global] AccessorFunc
-- @param  #table tab The table to add the accessor functions too.
-- @param  #any key The key of the table to be get/set.
-- @param  #string name The name of the functions. (will be prefixed with Get and Set)
-- @param  #number force The type the setter should force to, see **FORCE\_ Enums**. _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Defines a global entity class variable with an automatic value in order to
-- prevent collisions with other **CLASS\_ Enums**. You should prefix your variable
-- with CLASS_ for consistency.
-- @function [parent=#global] Add_NPC_Class
-- @param  #string name The name of the new enum/global variable.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Adds the specified image path to the main menu background pool. Image can be
-- png or jpeg.
-- @function [parent=#global] AddBackgroundImage
-- @param  #string path Path to the image.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- _Use **concommand.Add** instead._
-- 
-- Tells the engine to register a console command. If the command was ran, the
-- engine calls **concommand.Run**.
-- @function [parent=#global] AddConsoleCommand
-- @param  #string name The name of the console command to add.
-- @param  #string helpText The help text.
-- @param  #number flags Concommand flags using **FCVAR\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Marks a Lua file to be sent to clients when they join the server. Doesn't do
-- anything on the client - this means you can use it in a shared file without problems.
-- 
-- **Warning**: _If the file trying to be added is empty, an error will occur,
-- and the file will not be sent to the client._
-- 
-- **Note**: _This function is not needed for scripts located in **lua/autorun/**
-- and **lua/autorun/client/**, they are automatically sent to clients._
-- @function [parent=#global] AddCSLuaFile
-- @param  #string file The name/path to the Lua file that should be sent, relative to the garrysmod/lua folder. _(Default: current file)_  
-- If no parameter is specified, it sends the current file. The file path can be relative to the script it is ran from.
-- For example, if your script is in lua/myfolder/stuff.lua, calling **AddCSLuaFile**("otherstuff.lua") and **AddCSLuaFile**("myfolder/otherstuff.lua") is the same thing.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Loads the specified image from the /cache folder, used in combination
-- **steamworks.Download**. Most addons will provide a 512x512 png image.
-- @function [parent=#global] AddonMaterial
-- @param  #string name The name of the file.
-- @return #IMaterial The material, returns nil if the cached file is not an image.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds the specified vector to the PVS which is currently building. This
-- allows all objects in visleafs visible from that vector to be drawn.
-- @function [parent=#global] AddOriginToPVS
-- @param  #Vector position The origin to add.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This function creates a World Tip, similar to the one shown when aiming at a
-- Thruster where it shows you its force. This function will make a World Tip
-- that will only last 50 milliseconds (1/20th of a second), so you must call
-- it continuously as long as you want the World Tip to be shown. It is common
-- to call it inside a Think hook.
-- 
-- Contrary to what the function's name implies, it is impossible to create
-- more than one World Tip at the same time. A new World Tip will overwrite the
-- old one, so only use this function when you know nothing else will also be
-- using it. See **SANDBOX:PaintWorldTips** for more information.
-- 
-- **Note**: _This function is only available in Sandbox and its derivatives._
-- @function [parent=#global] AddWorldTip
-- @param  #number entindex This argument is no longer used; it has no effect on anything. _(Default: nil)_
-- @param  #string text The text for the world tip to display.
-- @param  #number dieTime This argument is no longer used; when you add a World Tip it will always last only 0.05 seconds. _(Default: SysTime() + 0.05)_
-- @param  #Vector pos Where in the world you want the World Tip to be drawn. _(Default: **ent:GetPos**())_  
-- If you add a valid Entity in the next argument, this argument will have no effect on the actual World Tip.
-- @param  #Entity ent Which entity you want to associate with the World Tip. This argument is optional. _(Default: nil)_  
-- If set to a valid entity, this will override the position set in pos with the Entity's position.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates an Angle object.
-- @function [parent=#global] Angle
-- @param  #number pitch=0 The pitch value of the angle. _(Default: 0)_  
-- If this is an Angle, this function will return a copy of the given angle.
-- If this is a string, this function will try to parse the string as a angle. If it fails, it returns a 0 angle.
-- @param  #number yaw The yaw value of the angle. _(Default: 0)_
-- @param  #number roll The roll value of the angle. _(Default: 0)_
-- @return #Angle Created angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns an angle with a randomized pitch, yaw and roll. The pitch is between
-- -90 and 90 degrees, while yaw and roll are between -180 and 180 degrees.
-- @function [parent=#global] AngleRand
-- @return #Angle The randomly generated angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- If the result of the first argument is false or nil, an error is thrown with
-- the second argument as the message.
-- @function [parent=#global] assert
-- @param  #any expression The expression to assert.
-- @param  #string errorMessage The error message to throw when assertion fails. _(Default: "assertion failed!")_  
-- This is only type-checked if the assertion fails.
-- @param  ... Any arguments past the error message will be returned by a successful assert.
-- @return ... If successful, returns the first argument, then the error message, and any arguments past the error message.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sends the specified Lua code to all connected clients and executes it.
-- @function [parent=#global] BroadcastLua
-- @param  #string code The code to be executed. Capped at length of 254 characters.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Dumps the networked variables of all entities into one table and returns it.
-- @function [parent=#global] BuildNetworkedVarsTable
-- @return #table Table formatted as:
-- 
-- * key : Entity for NWVars or number (always 0) for global vars.
-- * value : Table formatted as:
--  * key : string variable name.
--  * value : any type variable value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used internally to check if the current server the player is on can be added
-- to favorites or not. Does not check if the server is ALREADY in the favorites.
-- @function [parent=#global] CanAddServerToFavorites
-- @return #boolean Server can be added to favorites.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Aborts joining of the server you are currently joining.
-- @function [parent=#global] CancelLoading

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used internally to check if the current server the player is on can be added
-- to favorites or not. Does not check if the server is ALREADY in the favorites.
-- @function [parent=#global] CanAddServerToFavorites
-- @return #boolean Can add current server to favorites.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Aborts joining of the server you are currently joining.
-- @function [parent=#global] CancelLoading

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Sets the active main menu background image to a random entry from the
-- background images pool. Images are added with **AddBackgroundImage**.
-- @function [parent=#global] ChangeBackground
-- @param  #string currentgm Apparently does nothing.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Automatically called by the engine when a panel is hovered over with the mouse.
-- @function [parent=#global] ChangeTooltip
-- @param  #Panel panel Panel that has been hovered over.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Empties the pool of main menu background images.
-- @function [parent=#global] ClearBackgroundImages

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a non physical entity that only exists on the client. See also **ents.CreateClientProp**.
-- 
-- **Warning**: _Model must be precached with **util.PrecacheModel** on the server before usage._
-- @function [parent=#global] ClientsideModel
-- @param  #string model The file path to the model.
-- @param  #number renderGroup The rendergroup of the entity, see **RENDERGROUP\_ Enums**. _(Default: RENDERGROUP\_OTHER)_
-- @return #CSEnt Created client-side model. (C_BaseFlex)

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a fully clientside ragdoll.
-- 
-- **Warning**: _Model must be precached with **util.PrecacheModel** on the server before usage._
-- @function [parent=#global] ClientsideRagdoll
-- @param  #string model The file path to the model.
-- @param  #number renderGroup The **RENDERGROUP\_ Enums** to assign. _(Default: RENDER\_GROUP\_OPAQUE)_
-- @return #CSEnt The newly created client-side ragdoll. (C_ClientRagdoll)

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a scene entity based on the scene name and the entity.
-- @function [parent=#global] ClientsideScene
-- @param  #string name The name of the scene.
-- @param  #Entity targetEnt The entity to play the scene on.
-- @return #CSEnt The newly created client-side scene entity. (C_SceneEntity)

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Closes all Derma menus that have been passed to **RegisterDermaMenuForClose**
-- and calls **GM:CloseDermaMenus**.
-- @function [parent=#global] CloseDermaMenus

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Executes the specified action on the garbage collector.
-- @function [parent=#global] collectgarbage
-- @param  #string action="collect" The action to run. _(Default: "collect")_  
-- Valid actions are:
-- 
-- * "collect"
-- * "stop"
-- * "restart"
-- * "count"
-- * "step"
-- * "setpause"
-- * "setstepmul"
-- @param  #number arg The argument of the specified action, only applicable for "step", "setpause" and "setstepmul".
-- @return #any If the action is "count" this is the number of kilobytes of memory used by Lua.
-- If the action is step this is true if a garbage collection cycle was finished.
-- If the action is "setpause" this is the previous value for the GC's pause.
-- If the action is "setstepmul" this is the previous value for the GC's step.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a **Color structure**.
-- @function [parent=#global] Color
-- @param  #number r An integer from 0-255 describing the red value of the color.
-- @param  #number g An integer from 0-255 describing the green value of the color.
-- @param  #number b An integer from 0-255 describing the blue value of the color.
-- @param  #number a An integer from 0-255 describing the alpha value of the color. _(Default: 255)_
-- @return #table The created **Color structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a new **Color structure** with the RGB components of the given **Color
-- structure** and the alpha value specified.
-- @function [parent=#global] ColorAlpha
-- @param  #table color The **Color structure** from which to take RGB values. This color will not be modified.
-- @param  #number alpha The new alpha value, a number between 0 and 255. Values above 255 will be clamped.
-- @return #table The new **Color structure** with the modified alpha value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a **Color structure** with randomized red, green, and blue components.
-- If the alpha argument is true, alpha will also be randomized.
-- @function [parent=#global] ColorRand
-- @param  #boolean a Should alpha be randomized. _(Default: false)_
-- @return #table The created **Color structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a **Color structure** into HSV color space.
-- @function [parent=#global] ColorToHSV
-- @param  #table color The **Color structure**.
-- @return #number, #number, #number The hue in degrees, the saturation from 0-1, and the value from 0-1.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Attempts to compile the given file. If successful, returns a function that
-- can be called to perform the actual execution of the script.
-- @function [parent=#global] CompileFile
-- @param  #string path Path to the file, relative to the garrysmod/lua/ directory.
-- @return #function The function which executes the script.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- This function will compile the code argument as lua code and return a
-- function that will execute that code. Please note that this function will
-- not automatically execute the given code after compiling it.
-- @function [parent=#global] CompileString
-- @param  #string code The code to compile.
-- @param  #string identifier An identifier in case an error is thrown. (The same identifier can be used multiple times)
-- @param  #boolean HandleError If false this function will return an error string instead of throwing an error. _(Default: true)_
-- @return #function, #string A function that, when called, will execute the given code, or nil if there was an error and the error string, will be nil if there were no errors.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns a table of console command names beginning with the given text.
-- @function [parent=#global] ConsoleAutoComplete
-- @param  #string text Text that the console commands must begin with.
-- @return #table Table of console command names.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether a **ConVar** with the given name exists or not.
-- @function [parent=#global] ConVarExists
-- @param  #string name Name of the ConVar.
-- @return #boolean True if the **ConVar** exists, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Makes a clientside-only console variable. Although this function is shared,
-- it should only be used clientside.
-- 
-- **Note**: _This function is a wrapper of **CreateConVar**, with the difference
-- being that FCVAR\_ARCHIVE and FCVAR\_USERINFO are added automatically when
-- shouldsave and userinfo are true, respectively._
-- @function [parent=#global] CreateClientConVar
-- @param  #string name Name of the ConVar to be created and able to be accessed.
-- This cannot be a name of existing console command or console variable. It will silently fail if it is.
-- @param  #string default Default value of the ConVar.
-- @param  #boolean shouldsave Should the ConVar be saved across sessions. _(Default: true)_
-- @param  #boolean userinfo Should the **ConVar** and its containing data be sent to the server when it has changed. _(Default: false)_  
-- This make the convar accessible from server using **Player:GetInfoNum** and similar functions.
-- @param  #string helptext Help text to display in the console. _(Default: "")_
-- @return #ConVar Created convar.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a console variable (ConVar), in general these are for things like
-- gamemode/server settings.
-- @function [parent=#global] CreateConVar
-- @param  #string name Name of the convar.
-- This cannot be a name of an engine console command or console variable. It will silently fail if it is. If it is the same name as another lua ConVar, it will return that ConVar object.
-- @param  #string value Default value of the convar. Can also be a number.
-- @param  #number flags Flags of the convar, either as bitflag or as table. See **FCVAR\_ Enums**. _(Default: FCVAR\_NONE)_
-- @param  #string helptext The help text to show in the console. _(Default: "")_
-- @return #ConVar The convar created.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Creates a new material with the specified name and shader.
-- 
-- **Note**: _Materials created with this function can be used in
-- **Entity:SetMaterial** and **Entity:SetSubMaterial** by prepending a "!" to their
-- material name argument._
-- @function [parent=#global] CreateMaterial
-- @param  #string name The material name. Must be unique.
-- @param  #string shaderName The shader name. See **Category: Shaders**.
-- @param  #table materialData Key-value table that contains shader parameters and proxies.
-- 
-- **Note**: _Unlike **IMaterial:SetTexture**, this table will not accept **ITexture** values. Instead, use the texture's name. (See **ITexture:GetName**)_
-- @return #IMaterial Created material.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a new particle system.
-- 
-- **Note**: _The particle effect must be precached with **PrecacheParticleSystem**
-- and the file its from must be added via **game.AddParticles** before it can be used!_
-- @function [parent=#global] CreateParticleSystem
-- @param  #Entity ent The entity to attach the control point to.
-- @param  #string effect The name of the effect to create. It must be precached.
-- @param  #number partAttachment See **PATTACH\_ Enums**.
-- @param  #number entAttachment The attachment ID on the entity to attach the particle system to. _(Default: 0)_
-- @param  #Vector offset The offset from the **Entity:GetPos** of the entity we are attaching this CP to. _(Default: Vector(0,0,0))_
-- @return #CNewParticleEffect The created particle system.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a new **PhysCollide** from the given bounds.
-- @function [parent=#global] CreatePhysCollideBox
-- @param  #Vector mins Min corner of the box. This is not automatically ordered with the maxs and must contain the smallest vector components. See **OrderVectors**.
-- @param  #Vector maxs Max corner of the box. This is not automatically ordered with the mins and must contain the largest vector components.
-- @return #PhysCollide The new **PhysCollide**. This will be a NULL **PhysCollide** (**PhysCollide:IsValid** returns false) if given bad vectors or no more **PhysCollides** can be created in the physics engine.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates **PhysCollide** objects for every physics object the model has. The
-- model must be precached with **util.PrecacheModel** before being used with this function.
-- @function [parent=#global] CreatePhysCollidesFromModel
-- @param  #string modelName Model path to get the collision objects of.
-- @return #table Table of **PhysCollide** objects. The number of entries will match the model's physics object count.
-- See also **Entity:GetPhysicsObjectCount**. Returns no value if the model doesn't exist, or has not been precached.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a sound parented to the specified entity.
-- 
-- **Note**: _You can only create one CSoundPatch per audio file, per entity at
-- the same time._
-- @function [parent=#global] CreateSound
-- @param  #Entity targetEnt The target entity.
-- @param  #string soundName The sound to play.
-- @param  #CRecipientFilter filter A **CRecipientFilter** of the players that will have this sound networked to them. _(Default: CPASAttenuationFilter)_  
-- **Note**: _This argument only works serverside._
-- @return #CSoundPatch The sound object.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates and returns a new DSprite element with the supplied material.
-- @function [parent=#global] CreateSprite
-- @param  #IMaterial material Material the sprite should draw.
-- @return #Panel The new DSprite element.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the uptime of the server in seconds (to at least 4 decimal
-- places). This is a synchronised value and affected by various factors such
-- as host\_timescale (or **game.GetTimeScale**) and the server being paused -
-- either by sv_pausable or all players disconnecting. You should use this
-- function for timing in-game events but not for real-world events. See also
-- **RealTime** & **SysTime**.
-- 
-- **Note**: _This is internally defined as a float, and as such it will be
-- affected by precision loss if your server uptime is more than 6 hours, which
-- will cause jittery movement of players and props and inaccuracy of timers,
-- it is highly encouraged to refresh or change the map when that happens (a
-- server restart is not necessary). This is NOT easy as it sounds to fix in
-- the engine, so please refrain from posting issues about this_
-- @function [parent=#global] CurTime
-- @return #number Time synced with the game server.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an CTakeDamageInfo object.
-- @function [parent=#global] DamageInfo
-- @return #CTakeDamageInfo The **CTakeDamageInfo** object.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Writes text to the right hand side of the screen, like the old error system.
-- Messages disappear after a couple of seconds.
-- @function [parent=#global] DebugInfo
-- @param  #number slot The location on the right hand screen to write the debug info to. Starts at 0, no upper limit.
-- @param  #string info The debugging information to be written to the screen.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Alias of **baseclass.Get**.
-- @function [parent=#global] DEFINE_BASECLASS

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves data from a gamemode to use in yours. This also sets a BaseClass
-- field on your GM table to the gamemode you are deriving from. It appears
-- that this function works by running the init and cl_init Lua files of the
-- target gamemode, then overriding functions that appear in both the target
-- and your gamemode with your gamemode's functions.
-- @function [parent=#global] DeriveGamemode
-- @param  #string base Gamemode name to derive from.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Creates a new derma animation.
-- @function [parent=#global] Derma_Anim
-- @param  #string name Name of the animation to create.
-- @param  #Panel panel Panel to run the animation on.
-- @param  #function func Function to call to process the animation.  
-- Arguments:
-- 
-- * _#Panel pnl_ : The panel passed to Derma_Anim.
-- * _#table anim_ : The anim table.
-- * _#number delta_ : The fraction of the progress through the animation.
-- * _#any data_ : Optional data passed to the run metatable method.
-- @return #table A lua metatable containing four methods:
-- 
-- * Run() : Should be called each frame you want the animation to be ran.
-- * Active() : Returns if the animation is currently active. (has not finished and stop has not been called)
-- * Stop() : Halts the animation at its current progress.
-- * Start(Length, Data) : Prepares the animation to be ran for Length seconds. Must be called once before calling Run(). The data parameter will be passed to the func function.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Draws background blur around the given panel.
-- @function [parent=#global] Derma_DrawBackgroundBlur
-- @param  #Panel panel Panel to draw the background blur around.
-- @param  #number startTime Time that the blur began being painted.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Creates panel method that calls the supplied Derma skin hook via **derma.SkinHook**.
-- @function [parent=#global] Derma_Hook
-- @param  #Panel panel Panel to add the hook to.
-- @param  #string functionName Name of panel function to create.
-- @param  #string typeName Type of element to call Derma skin hook for.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Makes the panel (usually an input of sorts) respond to changes in console
-- variables by adding next functions to the panel:
-- 
-- * Panel:SetConVar
-- * Panel:ConVarChanged
-- * Panel:ConVarStringThink
-- * Panel:ConVarNumberThink
-- 
-- The console variable value is saved in the m_strConVar property of the panel.
-- 
-- The panel should call **Panel:ConVarStringThink** or **Panel:ConVarNumberThink** in
-- its **Panel:Think** hook and should call **Panel:ConVarChanged** when the panel's
-- value has changed.
-- @function [parent=#global] Derma_Install_Convar_Functions
-- @param  #Panel target The panel the functions should be added to.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Creates a derma window to display information.
-- @function [parent=#global] Derma_Message
-- @param  #string Text The text within the created panel.
-- @param  #string Title The title of the created panel.
-- @param  #string Button The text of the button to close the panel.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Shows a message box in the middle of the screen, with up to 4 buttons they
-- can press.
-- @function [parent=#global] Derma_Query
-- @param  #string text The message to display. _(Default: "Message Text (Second Parameter)")_
-- @param  #string title The title to give the message box. _(Default: "Message Title (First Parameter)")_
-- @param  #string btn1text The text to display on the first button.
-- @param  #function btn1func The function to run if the user clicks the first button. _(Default: nil)_
-- @param  #string btn2text The text to display on the second button. _(Default: nil)_
-- @param  #function btn2func The function to run if the user clicks the second button. _(Default: nil)_
-- @param  #string btn3text The text to display on the third button. _(Default: nil)_
-- @param  #function btn3func The function to run if the user clicks the third button. _(Default: nil)_
-- @param  #string btn4text The text to display on the third button. _(Default: nil)_
-- @param  #function btn4func The function to run if the user clicks the fourth button. _(Default: nil)_
-- @return #Panel The Panel object of the created window.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Creates a derma window asking players to input a string.
-- @function [parent=#global] Derma_StringRequest
-- @param  #string title The title of the created panel.
-- @param  #string subtitle The text above the input box.
-- @param  #string default The default text for the input box.
-- @param  #function confirm The function to be called once the user has confirmed their input.
-- @param  #function cancel The function to be called once the user has cancelled their input. _(Default: nil)_
-- @param  #string confirmText Allows you to override text of the "OK" button. _(Default: "OK")_
-- @param  #string cancelText Allows you to override text of the "Cancel" button. _(Default: "Cancel")_
-- @return #Panel The created DFrame.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Creates a DMenu and closes any current menus.
-- @function [parent=#global] DermaMenu
-- @param  #Panel parent The panel to parent the created menu to.
-- @return #Panel The created DMenu.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Sets whether rendering should be limited to being inside a panel or not.
-- See also **surface.DisableClipping** and **Panel:NoClipping**.
-- @function [parent=#global] DisableClipping
-- @param  #boolean disable Whether or not clipping should be disabled.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Cancels current DOF post-process effect started with DOF_Start.
-- @function [parent=#global] DOF_Kill

-------------------------------------------------------------------------------
-- _Client_
-- Cancels any existing DOF post-process effects. Begins the DOF post-process effect.
-- @function [parent=#global] DOF_Start

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- A hacky method used to fix some bugs regarding DoF.
-- @function [parent=#global] DOFModeHack
-- @param  #boolean enable Enables or disables depth-of-field mode.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Draws the currently active main menu background image and handles
-- transitioning between background images. This is called by default in the
-- menu panel's Paint hook.
-- @function [parent=#global] DrawBackground

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the bloom shader, which creates a glowing effect from bright objects.
-- @function [parent=#global] DrawBloom
-- @param  #number Darken Determines how much to darken the effect. A lower
-- number will make the glow come from lower light levels. A value of 1 will
-- make the bloom effect unnoticeable. Negative values will make even pitch
-- black areas glow.
-- @param  #number Multiply Will affect how bright the glowing spots are. A value of 0 will make the bloom effect unnoticeable.
-- @param  #number SizeX The size of the bloom effect along the horizontal axis.
-- @param  #number SizeY The size of the bloom effect along the vertical axis.
-- @param  #number Passes Determines how much to exaggerate the effect.
-- @param  #number ColorMultiply Will multiply the colors of the glowing spots, making them more vivid.
-- @param  #number Red How much red to multiply with the glowing color. Should be between 0 and 1.
-- @param  #number Green How much green to multiply with the glowing color. Should be between 0 and 1.
-- @param  #number Blue How much blue to multiply with the glowing color. Should be between 0 and 1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the Color Modify shader, which can be used to adjust colors on screen.
-- @function [parent=#global] DrawColorModify
-- @param  #table modifyParameters Color modification parameters. See **g_colourmodify** shader.
-- Note that if you leave out a field, it will retain its last value which may have changed if another caller uses this function.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a material overlay on the screen.
-- @function [parent=#global] DrawMaterialOverlay
-- @param  #string Material This will be the material that is drawn onto the screen.
-- @param  #number RefractAmount This will adjust how much the material will refract your screen.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a motion blur effect by drawing your screen multiple times.
-- @function [parent=#global] DrawMotionBlur
-- @param  #number AddAlpha How much alpha to change per frame.
-- @param  #number DrawAlpha How much alpha the frames will have. A value of 0 will not render the motion blur effect.
-- @param  #number Delay Determines the amount of time between frames to capture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the sharpen shader, which creates more contrast.
-- @function [parent=#global] DrawSharpen
-- @param  #number Contrast How much contrast to create.
-- @param  #number Distance How large the contrast effect will be.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the sobel shader, which detects edges and draws a black border.
-- @function [parent=#global] DrawSobel
-- @param  #number Threshold Determines the threshold of edges. A value of 0 will make your screen completely black.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renders the post-processing effect of beams of light originating from the
-- map's sun. Utilises the "pp/sunbeams" material.
-- @function [parent=#global] DrawSunbeams
-- @param  #number darken $darken property for sunbeams material.
-- @param  #number multiplier $multiply property for sunbeams material.
-- @param  #number sunSize $sunsize property for sunbeams material.
-- @param  #number sunX $sunx property for sunbeams material.
-- @param  #number sunY $suny property for sunbeams material.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the texturize shader, which replaces each pixel on your screen with a
-- different part of the texture depending on its brightness. See **g_texturize**
-- for information on making the texture.
-- @function [parent=#global] DrawTexturize
-- @param  #number Scale Scale of the texture. A smaller number creates a larger texture.
-- @param  #number BaseTexture This will be the texture to use in the effect. Make sure you use **Material** to get the texture number.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the toy town shader, which blurs the top and bottom of your screen.
-- This can make very large objects look like toys, hence the name.
-- @function [parent=#global] DrawToyTown
-- @param  #number Passes An integer determining how many times to draw the effect. A higher number creates more blur.
-- @param  #number Height The amount of screen which should be blurred on the top and bottom.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Drops the specified entity if it is being held by any player with Gravity
-- Gun or +use pickup.
-- @function [parent=#global] DropEntityIfHeld
-- @param  #Entity ent The entity to drop.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates or replaces a dynamic light with the given id.
-- 
-- **Note**: _Only 32 lights can be active at once._
-- @function [parent=#global] DynamicLight
-- @param  #number index An unsigned Integer. Usually an entity index is used here.
-- @return #table A DynamicLight structured table. See **DynamicLight structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a **CEffectData** object to be used with **util.Effect**.
-- @function [parent=#global] EffectData
-- @return #CEffectData The CEffectData object.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- An 'if then else'. This is almost equivalent to (condition and truevar or
-- falsevar) in Lua. The difference is that if truevar evaluates to false, the
-- plain Lua method stated would return falsevar regardless of condition whilst
-- this function would take condition into account.
-- @function [parent=#global] Either
-- @param  #any condition The condition to check if true or false.
-- @param  #any truevar If the condition isn't nil/false, returns this value.
-- @param  #any falsevar If the condition is nil/false, returns this value.
-- @return #any The result.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Plays a sentence from scripts/sentences.txt. Seems to work only on server-side.
-- @function [parent=#global] EmitSentence
-- @param  #string soundName The sound to play.
-- @param  #Vector position The position to play at.
-- @param  #number entity The entity to emit the sound from. Must be **Entity:EntIndex**.
-- @param  #number channel The sound channel, see **CHAN\_ Enums**. _(Default: CHAN\_AUTO)_
-- @param  #number volume The volume of the sound, from 0 to 1. _(Default: 1)_
-- @param  #number soundLevel The sound level of the sound, see **SNDLVL\_ Enums**. _(Default: 75)_
-- @param  #number soundFlags The flags of the sound, see **SND\_ Enums**. _(Default: 0)_
-- @param  #number pitch The pitch of the sound, 0-255. _(Default: 100)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Emits the specified sound at the specified position.
-- @function [parent=#global] EmitSound
-- @param  #string soundName The sound to play.
-- @param  #Vector position The position to play at.
-- @param  #number entity The entity to emit the sound from. Must be **Entity:EntIndex**.
-- @param  #number channel The sound channel, see **CHAN\_ Enums**. _(Default: CHAN\_AUTO)_
-- @param  #number volume The volume of the sound, from 0 to 1. _(Default: 1)_
-- @param  #number soundLevel The sound level of the sound, see **SNDLVL\_ Enums**. _(Default: 75)_
-- @param  #number soundFlags The flags of the sound, see **SND\_ Enums**. _(Default: 0)_
-- @param  #number pitch The pitch of the sound, 0-255. _(Default: 100)_

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Removes the currently active tool tip from the screen.
-- @function [parent=#global] EndTooltip
-- @param  #Panel panel This is the panel that has a tool tip.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity with the matching **Entity:EntIndex**. Indices 1 through
-- **game.MaxPlayers**() are always reserved for players.
-- 
-- **Note**: _In examples on this wiki, **Entity**(1) is used when a player entity
-- is needed. In singleplayer and listen servers, **Entity**(1) will always be the
-- first player. In dedicated servers, however, **Entity**(1) won't always be a
-- valid player._
-- @function [parent=#global] Entity
-- @param  #number entityIndex The entity index.
-- @return #Entity The entity if it exists, or NULL if it doesn't.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Throws a Lua error with the specified message and stack level.
-- @function [parent=#global] Error
-- @param  ... Converts all arguments to strings and prints them with no spacing or line breaks.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Throws a Lua error and breaks out of the current call stack.
-- @function [parent=#global] error
-- @param  #string message The error message to throw.
-- @param  #number errorLevel The level to throw the error at. _(Default: 1)_

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Throws a Lua error but does not break out of the current call stack.
-- @function [parent=#global] ErrorNoHalt
-- @param  ... Converts all arguments to strings and prints them with no spacing or line breaks.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the angles of the current render context as calculated by **GM:CalcView**.
-- @function [parent=#global] EyeAngles
-- @return #Angle The angle of the currently rendered scene.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the origin of the current render context as calculated by **GM:CalcView**.
-- @function [parent=#global] EyePos
-- @return #Vector Camera position.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the normal vector of the current render context as calculated by
-- **GM:CalcView**, similar to **EyeAngles**.
-- @function [parent=#global] EyeVector
-- @return #Vector View direction of the currently rendered scene.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the meta table for the class with the matching name. Internally
-- returns **debug.getregistry**()[metaName]. You can find a list of meta
-- tables that can be retrieved with this function on **TYPE\_ Enums**. The name in
-- the description is the string to use with this function.
-- @function [parent=#global] FindMetaTable
-- @param  #string metaName The object type to retrieve the meta table of.
-- @return #table The corresponding meta table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the tool-tip text and tool-tip-panel (if any) of the given panel as
-- well as itself.
-- @function [parent=#global] FindTooltip
-- @param  #Panel panel Panel to find tool-tip of.
-- @return #string, #Panel, #Panel The tooltip text, tooltip panel, and function that the panel was called with.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Formats the specified values into the string given. Same as **string.format**.
-- @function [parent=#global] Format
-- @param  #string format The string to be formatted.
-- Follows this format: http://www.cplusplus.com/reference/cstdio/printf/.
-- @param  ... Values to be formatted into the string.
-- @return #string The formatted string.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the number of frames rendered since the game was launched.
-- @function [parent=#global] FrameNumber

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the **CurTime**-based time in seconds it took to render the last frame.
-- This should be used for frame/tick based timing, such as movement prediction
-- or animations. For real-time-based frame time that isn't affected by
-- host_timescale, use **RealFrameTime**. **RealFrameTime** is more suited for things
-- like GUIs or HUDs.
-- @function [parent=#global] FrameTime
-- @return #number time (in seconds)

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Callback function for when the client has joined a server. This function
-- shows the server's loading URL by default.
-- @function [parent=#global] GameDetails
-- @param  #string servername Server's name.
-- @param  #string serverurl Server's loading screen URL, or "" if the URL is not set.
-- @param  #string mapname Server's current map's name.
-- @param  #number maxplayers Max player count of server.
-- @param  #string steamid The local player's **Player:SteamID64**.
-- @param  #string gamemode Server's current gamemode's folder name.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _This function was deprecated in Lua 5.1 and is removed in Lua 5.2._
-- _Use **collectgarbage**("count") instead._
-- 
-- Returns the current floored dynamic memory usage of Lua in kilobytes.
-- @function [parent=#global] gcinfo
-- @return #number The current floored dynamic memory usage of Lua, in kilobytes.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Gets the ConVar with the specified name. This function caches the ConVar
-- object internally.
-- @function [parent=#global] GetConVar
-- @param  #string name Name of the ConVar to get.
-- @return #ConVar The ConVar object.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Gets the ConVar with the specified name. This function doesn't cache the convar.
-- @function [parent=#global] GetConVar_Internal
-- @param  #string name Name of the ConVar to get.
-- @return #ConVar The ConVar object.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Store the ConVar object retrieved with **GetConVar** and call **ConVar:GetInt** or
-- **ConVar:GetFloat** on it._
-- 
-- Gets the numeric value ConVar with the specified name.
-- @function [parent=#global] GetConVarNumber
-- @param  #string name Name of the ConVar to get.
-- @return #number The ConVar's value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Store the ConVar object retrieved with **GetConVar** and call **ConVar:GetString**
-- on it._
-- 
-- Gets the string value ConVar with the specified name.
-- @function [parent=#global] GetConVarString
-- @param  #string name Name of the ConVar to get.
-- @return #string The ConVar's value.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns the default loading screen URL (asset://garrysmod/html/loading.html)
-- @function [parent=#global] GetDefaultLoadingHTML
-- @return #string Default loading url. (asset://garrysmod/html/loading.html)

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Retrieves data about the demo with the specified filename. Similar to **GetSaveFileDetails**.
-- @function [parent=#global] GetDemoFileDetails
-- @param  #string filename The file name of the demo.
-- @return #table Demo data.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns a table with the names of files needed from the server you are
-- currently joining.
-- @function [parent=#global] GetDownloadables
-- @return #table Table of file names.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the environment table of either the stack level or the function specified.
-- @function [parent=#global] getfenv
-- @param  #function location The object to get the enviroment from. _(Default: 1)_  
-- Can also be a number that specifies the function at that stack level: Level 1 is the function calling getfenv.
-- @return #table The environment.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an angle that is shared between the server and all clients.
-- @function [parent=#global] GetGlobalAngle
-- @param  #string index The unique index to identify the global value with.
-- @param  #Angle default The value to return if the global value is not set. _(Default: Angle(0,0,0))_
-- @return #Angle The global value, or default if the global is not set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a boolean that is shared between the server and all clients.
-- @function [parent=#global] GetGlobalBool
-- @param  #string index The unique index to identify the global value with.
-- @param  #boolean default The value to return if the global value is not set. _(Default: false)_
-- @return #boolean The global value, or the default if the global value is not set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an entity that is shared between the server and all clients.
-- @function [parent=#global] GetGlobalEntity
-- @param  #string index The unique index to identify the global value with.
-- @param  #Entity default The value to return if the global value is not set. _(Default: NULL)_
-- @return #Entity The global value, or the default if the global value is not set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a float that is shared between the server and all clients.
-- @function [parent=#global] GetGlobalFloat
-- @param  #string index The unique index to identify the global value with.
-- @param  #number default The value to return if the global value is not set. _(Default: 0)_
-- @return #number The global value, or the default if the global value is not set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an integer that is shared between the server and all clients.
-- @function [parent=#global] GetGlobalInt
-- @param  #string index The unique index to identify the global value with.
-- @param  #number default The value to return if the global value is not set. _(Default: 0)_
-- @return #number The global value, or the default if the global value is not set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a string that is shared between the server and all clients.
-- @function [parent=#global] GetGlobalString
-- @param  #string index The unique index to identify the global value with.
-- @param  #string default The value to return if the global value is not set. _(Default: "")_
-- @return #string The global value, or the default if the global value is not set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a vector that is shared between the server and all clients.
-- @function [parent=#global] GetGlobalVector
-- @param  #string index The unique index to identify the global value with.
-- @param  #Vector default The value to return if the global value is not set.
-- @return #Vector The global value, or the default if the global value is not set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the name of the current server.
-- @function [parent=#global] GetHostName
-- @return #string The name of the server.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the panel that is used as a wrapper for the HUD. See also **vgui.GetWorldPanel**.
-- @function [parent=#global] GetHUDPanel
-- @return #Panel The HUD panel.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns the loading screen panel and creates it if it doesn't exist.
-- @function [parent=#global] GetLoadPanel
-- @return #Panel The loading screen panel.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns the current status of the server join progress.
-- @function [parent=#global] GetLoadStatus
-- @return #string The current status.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns a table with the names of all maps and categories that you have on your client.
-- @function [parent=#global] GetMapList
-- @return #table Table of map names and categories.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the metatable of an object. This function obeys the metatable's
-- __metatable field, and will return that field if the metatable has it set.
-- Use **debug.getmetatable** if you want the true metatable of the object.
-- @function [parent=#global] getmetatable
-- @param  #any object The value to return the metatable of.
-- @return #any The metatable of the value. This is not always a table.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns the menu overlay panel, a container for panels like the error panel
-- created in **GM:OnLuaError**.
-- @function [parent=#global] GetOverlayPanel
-- @return #Panel The overlay panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates or gets the rendertarget with the given name. See **GetRenderTargetEx**
-- for an advanced version of this function with more options.
-- @function [parent=#global] GetRenderTarget
-- @param  #string name The internal name of the render target.
-- @param  #number width The width of the render target, must be power of 2.
-- If not set to PO2, the size will be automatically converted to the nearest PO2 size.
-- @param  #number height The height of the render target, must be power of 2.
-- If not set to PO2, the size will be automatically converted to the nearest PO2 size.
-- @param  #boolean additive Sets whenever the rt should be additive. _(Default: false)_
-- @return #ITexture The render target.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates (or gets if it already exsits) the rendertarget with the given name,
-- this function allows to adjust the creation of a rendertarget more than
-- **GetRenderTarget**. See also **render.PushRenderTarget** and **render.SetRenderTarget**.
-- @function [parent=#global] GetRenderTargetEx
-- @param  #string name The internal name of the render target.
-- 
-- **Warning**: _The name is treated like a path and gets its extension discarded. "name.1" and "name.2" are considered the same name and will result in the same render target being reused._
-- @param  #number width The width of the render target, must be power of 2.
-- @param  #number height The height of the render target, must be power of 2.
-- @param  #number sizeMode Bitflag that influences the sizing of the render target, see **RT\_SIZE\_ Enums**.
-- @param  #number depthMode Bitflag that determines the depth buffer usage of the render target **MATERIAL\_RT\_DEPTH\_ Enums**.
-- @param  #number textureFlags Bitflag that configurates the texture, see **TEXTUREFLAGS\_ Enums**.
-- @param  #number rtFlags Flags that controll the HDR behaviour of the render target, see **CREATERENDERTARGETFLAGS\_ Enums**.
-- @param  #number imageFormat Image format, see **IMAGE\_FORMAT\_ Enums**.
-- @return #ITexture The new render target.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Retrieves data about the save with the specified filename. Similar to **GetDemoFileDetails**.
-- @function [parent=#global] GetSaveFileDetails
-- @param  #string filename The file name of the save.
-- @return #table Save data.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the entity the client is using to see from (such as the player
-- itself, the camera, or another entity).
-- @function [parent=#global] GetViewEntity
-- @return #Entity The view entity.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a color from HSV color space into RGB color space and returns a
-- **Color structure**.
-- @function [parent=#global] HSVToColor
-- @param  #number hue Hue in degrees.
-- @param  #number saturation Saturation from 0 to 1.
-- @param  #number value Value from 0 to 1.
-- @return #table The **Color structure** created from the HSV color space.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Launches an asynchronous http request with the given parameters.
-- @function [parent=#global] HTTP
-- @param  #table parameters The request parameters. See **HTTPRequest structure**.
-- @return #boolean true if we made a request, nil if we failed.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Executes a Lua script.
-- 
-- **Note**: _Addon files (.gma files) do not support relative parent folders
-- (.. notation)._
-- 
-- **Warning**: _The file you are attempting to include MUST NOT be empty or
-- the include will fail. Files over a certain size may fail as well._
-- 
-- **Warning**: _If the file you are including is clientside or shared, it **must**
-- be **AddCSLuaFile**'d or this function will error saying the file doesn't exist._
-- @function [parent=#global] include
-- @param  #string fileName The name of the script to be executed.
-- The path must be either relative to the current file, or be an absolute path (relative to and excluding the lua/ folder).
-- 
-- **Note**: _Please make sure your file names are unique, the filesystem is shared across all addons, so a file named "lua/config.lua" in your addon may be overwritten by the same file in another addon._
-- @return ... Anything that the executed Lua script returns.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _To send the target file to the client simply call AddCSLuaFile() in the
-- target file itself._
-- 
-- This function works exactly the same as include both clientside and
-- serverside. The only difference is that on the serverside it also calls
-- **AddCSLuaFile** on the filename, so that it gets sent to the client.
-- @function [parent=#global] IncludeCS
-- @param  #string filename The filename of the Lua file you want to include.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns an iterator function for a for loop, to return ordered key-value
-- pairs from a table. This will only iterate though numerical keys, and these
-- must also be sequential; starting at 1 with no gaps.
-- 
-- For unordered pairs, see **pairs**. For pairs sorted by key in alphabetical order, see **SortedPairs**.
-- @function [parent=#global] ipairs
-- @param  #table tab The table to iterate over.
-- @return #function, #table, #number The iterator function, the table being iterated and the origin.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is an **Angle**.
-- @function [parent=#global] isangle
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean True if the variable is an **Angle**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is a boolean.
-- @function [parent=#global] isbool
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean true if the variable is a boolean.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether the given object does or doesn't have a metatable of a color.
-- 
-- **Important**: _Engine functions (ex: those not written in plain Lua) that
-- return color objects do not currently set the color metatable and this
-- function will return false if you use it on them._
-- @function [parent=#global] IsColor
-- @param  #any Object The object to be tested.
-- @return #boolean Whether the given object is a color or not.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the given NPC class name is an enemy. Returns true if the entity
-- name is one of the following:
-- 
-- * "npc_combine_s"
-- * "npc_cscanner"
-- * "npc_manhack"
-- * "npc_hunter"
-- * "npc_antlion"
-- * "npc_antlionguard"
-- * "npc_antlion_worker"
-- * "npc_fastzombie_torso"
-- * "npc_fastzombie"
-- * "npc_headcrab"
-- * "npc_headcrab_fast"
-- * "npc_poisonzombie"
-- * "npc_headcrab_poison"
-- * "npc_zombie"
-- * "npc_zombie_torso"
-- * "npc_zombine"
-- * "npc_gman"
-- * "npc_breen"
-- @function [parent=#global] IsEnemyEntityName
-- @param  #string className Class name of the entity to check.
-- @return #boolean Is an enemy.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the passed object is an **Entity**. Alias of **isentity**.
-- @function [parent=#global] IsEntity
-- @param  #any variable The variable to check.
-- @return #boolean true if the variable is an **Entity**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is an **Entity**.
-- @function [parent=#global] isentity
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean true if the variable is an Entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if this is the first time this hook was predicted. This is useful
-- for one-time logic in your SWEPs PrimaryAttack, SecondaryAttack and Reload
-- and other predicted hooks (to prevent those hooks from being called rapidly
-- in succession). It's also useful in a Move hook for when the client predicts
-- movement.
-- 
-- **Note**: _This is already used internally for **Entity:EmitSound**,
-- **Weapon:SendWeaponAnim** and **Entity:FireBullets**, but NOT in **util.Effect**._
-- @function [parent=#global] IsFirstTimePredicted
-- @return #boolean Whether or not this is the first time being predicted.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the given NPC class name is a friend. Returns true if the entity
-- name is one of the following:
-- 
-- * "npc_monk"
-- * "npc_alyx"
-- * "npc_barney"
-- * "npc_citizen"
-- * "npc_kleiner"
-- * "npc_magnusson"
-- * "npc_eli"
-- * "npc_mossman"
-- * "npc_vortigaunt"
-- @function [parent=#global] IsFriendEntityName
-- @param  #string className Class name of the entity to check.
-- @return #boolean Is a friend.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is a function.
-- @function [parent=#global] isfunction
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean true if the variable is a function.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns true if the client is currently playing either a singleplayer or
-- multiplayer game.
-- @function [parent=#global] IsInGame
-- @return #boolean true if we are in a game.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether the passed object is a **VMatrix**.
-- @function [parent=#global] ismatrix
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean true if the variable is a **VMatrix**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Checks whether or not a game is currently mounted. Uses data given by
-- **engine.GetGames**. Currently does not work correctly serverside on dedicated servers.
-- @function [parent=#global] IsMounted
-- @param  #string game The game string/app ID to check.
-- @return #boolean true if the game is mounted.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is a number.
-- @function [parent=#global] isnumber
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean True if the variable is a number.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is a **Panel**.
-- @function [parent=#global] ispanel
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean true if the variable is a **Panel**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is a string.
-- @function [parent=#global] isstring
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean true if the variable is a string.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is a table.
-- @function [parent=#global] istable
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean true if the variable is a table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether or not every element within a table is a valid entity.
-- @function [parent=#global] IsTableOfEntitiesValid
-- @param  #table table Table containing entities to check.
-- @return #boolean All entities valid.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether or not a model is useless by checking that the file path is
-- that of a proper model. If the string ".mdl" is not found in the model name,
-- the function will return true. The function will also return true if any of
-- the following strings are found in the given model name:
-- 
-- * "_gesture"
-- * "_anim"
-- * "_gst"
-- * "_pst"
-- * "_shd"
-- * "_ss"
-- * "_posture"
-- * "_anm"
-- * "ghostanim"
-- * "_paths"
-- * "_shared"
-- * "anim_"
-- * "gestures_"
-- * "shared_ragdoll_"
-- @function [parent=#global] IsUselessModel
-- @param  #string modelName The model name to be checked.
-- @return #boolean Whether or not the model is useless.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether an object is valid or not. (Such as **Entity**s, **Panels**, custom
-- table objects and more) Checks that an object is not nil, has an IsValid
-- method and if this method returns true.
-- 
-- **Note**: _Due to vehicles being technically valid the moment they're spawned,
-- also use **Vehicle:IsValidVehicle** to make sure they're fully initialized._
-- @function [parent=#global] IsValid
-- @param  #any toBeValidated The table or object to be validated.
-- @return #boolean True if the object is valid.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the passed object is a **Vector**.
-- @function [parent=#global] isvector
-- @param  #any variable The variable to perform the type check for.
-- @return #boolean true if the variable is a **Vector**.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Joins the server with the specified IP.
-- @function [parent=#global] JoinServer
-- @param  #string IP The IP of the server to join.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Adds javascript function 'language.Update' to an HTML panel as a method to
-- call Lua's **language.GetPhrase** function.
-- @function [parent=#global] JS_Language
-- @param  #Panel htmlPanel Panel to add javascript function 'language.Update' to.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Adds javascript function 'util.MotionSensorAvailable' to an HTML panel as a
-- method to call Lua's **motionsensor.IsAvailable** function.
-- @function [parent=#global] JS_Utility
-- @param  #Panel htmlPanel Panel to add javascript function 'util.MotionSensorAvailable' to.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Adds workshop related javascript functions to an HTML panel, used by the "Dupes" and "Saves" tabs in the spawnmenu.
-- @function [parent=#global] JS_Workshop
-- @param  #Panel htmlPanel Panel to add javascript functions to.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Convenience function that creates a DLabel, sets the text, and returns it.
-- @function [parent=#global] Label
-- @param  #string text The string to set the label's text to.
-- @param  #Panel parent Optional, panel to parent the DLabel to. _(Default: nil)_
-- @return #Panel The created DLabel.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Callback function for when the client's language changes. Called by the engine.
-- @function [parent=#global] LanguageChanged
-- @param  #string lang The new language code.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Performs a linear interpolation from the start number to the end number.
-- This function provides a very efficient and easy way to smooth out movements.
-- @function [parent=#global] Lerp
-- @param  #number t The fraction for finding the result. This number is clamped between 0 and 1.
-- @param  #number from The starting number. The result will be equal to this if delta is 0.
-- @param  #number to The ending number. The result will be equal to this if delta is 1.
-- @return #number The result of the linear interpolation. _(1-t) * from + t * to_

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns point between first and second angle using given fraction and
-- linear interpolation.
-- @function [parent=#global] LerpAngle
-- @param  #number ratio Ratio of progress through values.
-- @param  #Angle angleStart Angle to begin from.
-- @param  #Angle angleEnd Angle to end at.
-- @return #Angle The interpolated angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Linear interpolation between two vectors. It is commonly used to smooth
-- movement between two vectors.
-- @function [parent=#global] LerpVector
-- @param  #number fraction Fraction ranging from 0 to 1.
-- @param  #Vector from The initial **Vector**.
-- @param  #Vector to The desired **Vector**.
-- @return #Vector The lerped vector.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This function is used to get the last map and category to which the map
-- belongs from the cookie saved with **SaveLastMap**.
-- @function [parent=#global] LoadLastMap

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Loads all preset settings for the presets library and returns them in a table.
-- @function [parent=#global] LoadPresets
-- @return #table Preset data.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns a localisation for the given token, if none is found it will return
-- the default(second) parameter.
-- @function [parent=#global] Localize
-- @param  #string localisationToken The token to find a translation for.
-- @param  #string default The default value to be returned if no translation was found.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the player object of the current client. **LocalPlayer**() will return
-- NULL until all entities have been initialized. See **GM:InitPostEntity**.
-- @function [parent=#global] LocalPlayer
-- @return #Player The player object representing the client.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Translates the specified position and angle from the specified local
-- coordinate system into worldspace coordinates. If you're working with an
-- entity's local vectors, use **Entity:LocalToWorld** and/or
-- **Entity:LocalToWorldAngles** instead. See also: **WorldToLocal**, the
-- reverse of this function.
-- @function [parent=#global] LocalToWorld
-- @param  #Vector localPos The position vector in the source coordinate system, that should be translated to world coordinates.
-- @param  #Angle localAng The angle in the source coordinate system, that should be converted to a world angle.
-- If you don't need to convert an angle, you can supply an arbitrary valid angle (e.g. **Angle**()).
-- @param  #Vector originPos The origin point of the source coordinate system, in world coordinates.
-- @param  #Angle originAngle The angles of the source coordinate system, as a world angle.
-- @return #Vector, #Angle The world position, and world angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Either returns the material with the given name, or loads the material
-- interpreting the first argument as the path.
-- 
-- **Note**: _When using .png or .jpg textures, make sure that their sizes are
-- Power Of 2 (1, 2, 4, 8, 16, 32, 64, etc). If they are not, they will be
-- automatically stretched to the nearest PO2 size and cause graphical artifacts._
-- @function [parent=#global] Material
-- @param  #string materialName The material name or path. The path is relative to the materials/ folder. You do not need to add materials/ to your path.
-- To retrieve a Lua material created with **CreateMaterial**, just prepend a "!" to the material name.
-- @param  #string pngParameters A string containing space separated keywords which will be used to add material parameters. _(Default: nil)_  
-- **Note**: _This feature only works when importing .png or .jpeg image files._
-- @return #IMaterial, #number Generated material and time it took for the function to run.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a **VMatrix** object.
-- @function [parent=#global] Matrix
-- @param  #table data Initial data to initialize the matrix with. Leave empty to initialize an identity matrix. _(Default: {{1, 0, 0, 0}, {0, 1, 0, 0}, {0, 0, 1, 0}, {0, 0, 0, 1}})_
-- @return #VMatrix New matrix.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a new mesh object.
-- @function [parent=#global] Mesh
-- @param  #IMaterial mat The material the mesh is intended to be rendered with. _(Default: nil)_  
-- It's merely a hint that tells that mesh what vertex format it should use.
-- @return #IMesh The created object.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Runs **util.PrecacheModel** and returns the string.
-- @function [parent=#global] Model
-- @param  #string model The model to precache.
-- @return #string The same string entered as an argument.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a table with the specified module name and sets the function
-- environment for said table. Any passed loaders are called with the table as
-- an argument. An example of this is **package.seeall**.
-- @function [parent=#global] module
-- @param  #string name The name of the module. This will be used to access the module table in the runtime environment.
-- @param  ... Calls each function passed with the new table as an argument.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Writes every given argument to the console. Automatically attempts to
-- convert each argument to a string. (See tostring) Unlike print, arguments
-- are not separated by anything. They are simply concatenated. Additionally,
-- a newline isn't added automatically to the end, so subsequent **Msg** or **print**
-- operations will continue the same line of text in the console. See **MsgN** for
-- a version that does add a newline. The text is blue on the server, orange on
-- the client, and green on the menu
-- @function [parent=#global] Msg
-- @param  ... List of values to print.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Works exactly like **Msg** except that, if called on the server, will print to
-- all players consoles plus the server console.
-- @function [parent=#global] MsgAll
-- @param  ... List of values to print.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Just like **Msg**, except it can also print colored text, just like **chat.AddText**.
-- @function [parent=#global] MsgC
-- @param  ... Values to print. If you put in a color, all text after that color will be printed in that color.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Same as **print**, except it concatinates the arguments without inserting any
-- whitespace in between them. See also **Msg**, which doesn't add a newline ("\n")
-- at the end.
-- @function [parent=#global] MsgN
-- @param  ... List of values to print. They can be of any type and will be converted to strings with **tostring**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns named color defined in resource/ClientScheme.res.
-- @function [parent=#global] NamedColor
-- @param  #string name Name of color.
-- @return #table A **Color structure** or nil.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a new userdata object.
-- @function [parent=#global] newproxy
-- @param  #boolean addMetatable If true, the userdata will get its own metatable automatically. _(Default: false)_
-- @return #userdata The newly created userdata.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the next key and value pair in a table.
-- 
-- **Note**: _Table keys in Lua have no specific order, and will be returned in
-- whatever order they exist in memory. This may not always be in ascending
-- order or alphabetical order. If you need to iterate over an array in order,
-- use **ipairs**._
-- @function [parent=#global] next
-- @param  #table tab The table.
-- @param  #any prevKey The previous key in the table. _(Default: nil)_
-- @return #any, #any The next key, and the value associated with that key.
-- If the previous key was nil, this will be the first key in the table.
-- If the previous key was the last in the table, this will be nil and so will the value.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Returns the number of files needed from the server you are currently joining.
-- @function [parent=#global] NumDownloadables
-- @return #number The number of downloadables.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the amount of skins the specified model has.
-- @function [parent=#global] NumModelSkins
-- @param  #string modelName Model to return amount of skins of.
-- @return #number Amount of skins.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by the engine when a model has been loaded. Caches model information
-- with the sql library.
-- @function [parent=#global] OnModelLoaded
-- @param  #string modelName Name of the model.
-- @param  #number numPostParams Number of pose parameters the model has.
-- @param  #number numSeq Number of sequences the model has.
-- @param  #number numAttachments Number of attachments the model has.
-- @param  #number numBoneControllers Number of bone controllers the model has.
-- @param  #number numSkins Number of skins that the model has.
-- @param  #number size Size of the model.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Opens a folder with the given name in the garrysmod folder using the
-- operating system's file browser. Currently broken on OS X and Linux.
-- @function [parent=#global] OpenFolder
-- @param  #string folder The subdirectory to open in the garrysmod folder.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Modifies the given vectors so that all of vector2's axis are larger than
-- vector1's by switching them around. Also known as ordering vectors.
-- 
-- **Note**: _This function will irreversibly modify the given vectors._
-- @function [parent=#global] OrderVectors
-- @param  #Vector vector1 Bounding box min resultant.
-- @param  #Vector vector2 Bounding box max resultant.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns an iterator function(next) for a for loop that will return the
-- values of the specified table in an arbitrary order. For alphabetical key
-- order use **SortedPairs**. For alphabetical value order use **SortedPairsByValue**.
-- @function [parent=#global] pairs
-- @param  #table tab The table to iterate over.
-- @return #function, #table, #any The iterator, the table being iterated, nil(for the constructor).

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Calls **game.AddParticles** and returns given string.
-- @function [parent=#global] Particle
-- @param  #string file The particle file.
-- @return #string The particle file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a particle effect.
-- 
-- **Note**: _The particle effect must be precached with **PrecacheParticleSystem**
-- and the file its from must be added via **game.AddParticles** before it can be used!_
-- @function [parent=#global] ParticleEffect
-- @param  #string particleName The name of the particle effect.
-- @param  #Vector position The start position of the effect.
-- @param  #Angle angles The orientation of the effect.
-- @param  #Entity parent If set, the particle will be parented to the entity. _(Default: NULL)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a particle effect with specialized parameters.
-- 
-- **Note**: _The particle effect must be precached with **PrecacheParticleSystem**
-- and the file its from must be added via **game.AddParticles** before it can be used!_
-- @function [parent=#global] ParticleEffectAttach
-- @param  #string particleName The name of the particle effect.
-- @param  #number attachType Attachment type using **PATTACH\_ Enums**.
-- @param  #Entity entity The entity to be used in the way specified by the attachType.
-- @param  #number attachmentID The id of the attachment to be used in the way specified by the attachType.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a new CLuaEmitter.
-- 
-- **Note**: _Do not forget to delete the emitter with **CLuaEmitter:Finish** once
-- you are done with it._
-- @function [parent=#global] ParticleEmitter
-- @param  #Vector position The start position of the emitter. This is only used to determine particle drawing order for translucent particles.
-- @param  #boolean use3D Whenever to render the particles in 2D or 3D mode.
-- @return #CLuaEmitter The new particle emitter.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Creates a path for the bot to follow.
-- @function [parent=#global] Path
-- @param  #string type The name of the path to create. This is going to be "Follow" or "Chase" right now.
-- @return #PathFollower The path.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Calls a function and catches an error that can be thrown while the execution
-- of the call.
-- @function [parent=#global] pcall
-- @param  #function func Function to be executed and of which the errors should be caught of.
-- @param  ... Arguments to call the function with.
-- @return #boolean If the function had no errors occur within it, and this will be a string containing the error message, or this will be the return values of the function passed in.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player with the matching **Player:UserID**. For a function that
-- returns a player based on their **Entity:EntIndex**, see **Entity**. For a function
-- that returns a player based on their connection ID, see **player.GetByID**.
-- @function [parent=#global] Player
-- @param  #number playerIndex The player index.
-- @return #Player The retrieved player.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Moves the given model to the given position and returns view information
-- based on its properties.
-- @function [parent=#global] PositionSpawnIcon
-- @param  #Entity model Model that is being rendered to the spawn icon.
-- @param  #Vector position Position that the model is being rendered at.
-- @return #table Table of information of the view which can be used for rendering.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Precaches the particle with the specified name.
-- @function [parent=#global] PrecacheParticleSystem
-- @param  #string particleSystemName The name of the particle system.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Precaches a scene file.
-- @function [parent=#global] PrecacheScene
-- @param  #string scene Path to the scene file to precache.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Load and precache a custom sentence file.
-- @function [parent=#global] PrecacheSentenceFile
-- @param  #string filename The path to the custom sentences.txt.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Precache a sentence group in a sentences.txt definition file.
-- @function [parent=#global] PrecacheSentenceGroup
-- @param  #string group The group to precache.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Writes every given argument to the console. Automatically attempts to
-- convert each argument to a string. (See tostring) Separates arguments with
-- a tab character ("\t").
-- @function [parent=#global] print
-- @param  ... List of values to print.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Displays a message in the chat, console, or center of screen of every player.
-- This uses the archaic user message system (umsg library) and hence is
-- limited to ≈250 characters.
-- @function [parent=#global] PrintMessage
-- @param  #number type Which type of message should be sent to the players. See **HUD\_ Enums**.
-- @param  #string message Message to be sent to the players.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Recursively prints the contents of a table to the console.
-- @function [parent=#global] PrintTable
-- @param  #table tableToPrint The table to be printed.
-- @param  #number indent Number of tabs to start indenting at. _(Default: 0)_  
-- Increases by 2 when entering another table.
-- @param  #table done Internal argument, you shouldn't normally change this. _(Default: {})_  
-- Used to check if a nested table has already been printed so it doesn't get caught in a loop.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a new **ProjectedTexture**.
-- @function [parent=#global] ProjectedTexture
-- @return #ProjectedTexture Newly created projected texture.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Runs a function without stopping the whole script on error. This function is
-- similar to pcall and xpcall except the errors are still printed and sent to
-- the error handler (ex: sent to server console if clientside and
-- **GM:OnLuaError** called).
-- @function [parent=#global] ProtectedCall
-- @param  #function func Function to run.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns an iterator function that can be used to loop through a table in
-- random order.
-- @function [parent=#global] RandomPairs
-- @param  #table table Table to create iterator for.
-- @param  #boolean descending Whether the iterator should iterate descending or not.
-- @return #function Iterator function.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Compares the two values without calling their __eq operator.
-- @function [parent=#global] rawequal
-- @param  #any value1 The first value to compare.
-- @param  #any value2 The second value to compare.
-- @return #boolean Whether or not the two values are equal.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Gets the value with the specified key from the table without calling the
-- __index method.
-- @function [parent=#global] rawget
-- @param  #table table Table to get the value from.
-- @param  #any index The index to get the value from.
-- @return #any The value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Sets the value with the specified key from the table without calling the
-- __newindex method.
-- @function [parent=#global] rawset
-- @param  #table table Table to get the value from.
-- @param  #any index The index to get the value from.
-- @param  #any value The value to set for the specified key.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the real frame-time which is unaffected by host_timescale. To be
-- used for GUI effects(for example).
-- @function [parent=#global] RealFrameTime
-- @return #number Real frame time.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the uptime of the game/server in seconds (to at least 4 decimal places).
-- 
-- **Note**: _This is not synchronised or affected by the game._
-- 
-- You should use this function (or SysTime) for timing real-world events such
-- as user interaction, but not for timing game events such as animations.
-- See also: **CurTime**, **SysTime**.
-- @function [parent=#global] RealTime
-- @return #number Uptime of the server.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Creates a new **CRecipientFilter**.
-- @function [parent=#global] RecipientFilter
-- @return #CRecipientFilter The new created recipient filter.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Adds a frame to the currently recording demo.
-- @function [parent=#global] RecordDemoFrame

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Registers a Derma element to be closed the next time **CloseDermaMenus** is called.
-- @function [parent=#global] RegisterDermaMenuForClose
-- @param  #Panel menu Menu to be registered for closure.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Saves position of your cursor on screen. You can restore it by using
-- **RestoreCursorPosition**. Despite this function being available on server, it
-- will not do anything on server.
-- @function [parent=#global] RememberCursorPosition

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Does the removing of the tooltip panel. Called by **EndTooltip**.
-- @function [parent=#global] RemoveTooltip

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the angle that the clients view is being rendered at.
-- @function [parent=#global] RenderAngles
-- @return #Angle Render Angles.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renders a Depth of Field effect.
-- @function [parent=#global] RenderDoF
-- @param  #Vector origin Origin to render the effect at.
-- @param  #Angle angle Angle to render the effect at.
-- @param  #Vector usableFocusPoin Point to focus the effect at.
-- @param  #number angleSize Angle size of the effect.
-- @param  #number radialSteps Amount of radial steps to render the effect with.
-- @param  #number passes Amount of render passes.
-- @param  #boolean spin Whether to cycle the frame or not.
-- @param  #table inView Table of view data.
-- @param  #number fov FOV to render the effect with.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renders the stereoscopic post-process effect.
-- @function [parent=#global] RenderStereoscopy
-- @param  #Vector viewOrigin Origin to render the effect at.
-- @param  #Angle viewAngles Angles to render the effect at.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renders the Super Depth of Field post-process effect.
-- @function [parent=#global] RenderSuperDoF
-- @param  #Vector viewOrigin Origin to render the effect at.
-- @param  #Angle viewAngles Angles to render the effect at.
-- @param  #number viewFOV Field of View to render the effect at.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- First tries to load a binary module with the given name, if unsuccessful, it
-- tries to load a Lua module with the given name.
-- @function [parent=#global] require
-- @param  #string name The name of the module to be loaded.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Restores position of your cursor on screen. You can save it by using
-- **RememberCursorPosition**. Despite this function being available on server, it
-- will not do anything on server.
-- @function [parent=#global] RestoreCursorPosition

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Executes the given console command with the parameters.
-- 
-- **Notes**: _Some commands/convars are blocked from being ran/changed using
-- this function, usually to prevent harm/annoyance to clients. For a list of
-- blocked commands, see **Blocked ConCommands**._
-- @function [parent=#global] RunConsoleCommand
-- @param  #string command The command to be executed.
-- @param  ... The arguments. Note, that unlike **Player:ConCommand**, you must pass each argument as a new string, not separating them with a space.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Runs a menu command. Equivalent to **RunConsoleCommand**("gamemenucommand",
-- command) unless the command starts with the "engine" keyword in which case
-- it is equivalent to **RunConsoleCommand**(command).
-- @function [parent=#global] RunGameUICommand
-- @param  #string command The menu command to run.
-- Should be one of the following:
-- 
-- * "Disconnect" - Disconnects from the current server.
-- * "OpenBenchmarkDialog" - Opens the "Video Hardware Stress Test" dialog.
-- * "OpenChangeGameDialog" - Does not work in GMod.
-- * "OpenCreateMultiplayerGameDialog" - Opens the Source dialog for creating a listen server.
-- * "OpenCustomMapsDialog" - Does nothing.
-- * "OpenFriendsDialog" - Does nothing.
-- * "OpenGameMenu" - Does not work in GMod.
-- * "OpenLoadCommentaryDialog" - Opens the "Developer Commentary" selection dialog. Useless in GMod.
-- * "OpenLoadDemoDialog" - Does nothing.
-- * "OpenLoadGameDialog" - Opens the Source "Load Game" dialog.
-- * "OpenNewGameDialog" - Opens the "New Game" dialog. Useless in GMod.
-- * "OpenOptionsDialog" - Opens the options dialog.
-- * "OpenPlayerListDialog" - Opens the "Mute Players" dialog that shows all players connected to the server and allows to mute them.
-- * "OpenSaveGameDialog" - Opens the Source "Save Game" dialog.
-- * "OpenServerBrowser" - Opens the legacy server browser.
-- * "Quit" - Quits the game without confirmation (unlike other Source games).
-- * "QuitNoConfirm" - Quits the game without confirmation (like other Source games).
-- * "ResumeGame" - Closes the menu and returns to the game.
-- * "engine <concommand>" - Runs a console command. Equivalent to **RunConsoleCommand**( <concommand> ).

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Evaluates and executes the given code, will throw an error on failure.
-- 
-- **Note**: _Local variables are not passed to the given code._
-- @function [parent=#global] RunString
-- @param  #string code The code to execute.
-- @param  #string identifier The name that should appear in any error messages caused by this code. _(Default: "RunString")_
-- @param  #boolean handleError If false, this function will return a string containing any error messages instead of throwing an error. _(Default: true)_
-- @return #string If handleError is false, the error message (if any).

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Removes the given entity unless it is a player or the world entity.
-- @function [parent=#global] SafeRemoveEntity
-- @param  #Entity ent Entity to safely remove.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Removes entity after delay using **SafeRemoveEntity**.
-- @function [parent=#global] SafeRemoveEntityDelayed
-- @param  #Entity entity Entity to be removed.
-- @param  #number delay Delay for entity removal in seconds.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This function is used to save the last map and category to which the map
-- belongs as a cookie.
-- @function [parent=#global] SaveLastMap
-- @param  #string map The name of the map.
-- @param  #string category The name of the category to which this map belongs.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Overwrites all presets with the supplied table. Used by the presets library
-- for preset saving.
-- @function [parent=#global] SavePresets
-- @param  #table presets Presets to be saved.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a number based on the Size argument and your screen's width. The
-- screen's width is always equal to size 640. This function is primarily used
-- for scaling font sizes.
-- @function [parent=#global] ScreenScale
-- @param  #number Size The number you want to scale.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets the height of the game's window (in pixels).
-- @function [parent=#global] ScrH
-- @return #number The height of the game's window in pixels.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Gets the width of the game's window (in pixels).
-- @function [parent=#global] ScrW
-- @return #number The width of the game's window in pixels.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Used to select single values from a vararg or get the count of values in it.
-- @function [parent=#global] select
-- @param  #any parameter Can be a number or string.
-- 
-- * If it's a string and starts with "#", the function will return the amount of values in the vararg. (ignoring the rest of the string)
-- * If it's a positive number, the function will return all values starting from the given index.
-- * If the number is negative, it will return the amount specified from the end instead of the beginning.
-- @param  ... These are the values from which you want to select.
-- @return ... Returns a number or vararg, depending on the select method.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Send a usermessage.
-- @function [parent=#global] SendUserMessage
-- @param  #string name The name of the usermessage.
-- @param  #any recipients Can be a **CRecipientFilter**, table or **Player** object.
-- @param  ... Data to send in the usermessage.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Prints "ServerLog: PARAM" without a newline, to the server log and console.
-- @function [parent=#global] ServerLog
-- @param  #string parameter The value to be printed to console.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Adds the given string to the computers clipboard, which can then be pasted
-- in or outside of GMod with Ctrl + V.
-- @function [parent=#global] SetClipboardText
-- @param  #string text The text to add to the clipboard.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Sets the enviroment for a function or a stack level, if a function is
-- passed, the return value will be the function, otherwise nil.
-- @function [parent=#global] setfenv
-- @param  #function location The function to set the enviroment for or a number representing stack level.
-- @param  #table enviroment Table to be used as enviroment.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Defines an angle to be automatically networked to clients.
-- 
-- **Note**: _Running this function clientside will only set it clientside for
-- the client it is called on!_
-- @function [parent=#global] SetGlobalAngle
-- @param  #any index Index to identify the global angle with.
-- @param  #Angle angle Angle to be networked.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Defined a boolean to be automatically networked to clients.
-- 
-- **Note**: _Running this function clientside will only set it clientside for
-- the client it is called on!_
-- @function [parent=#global] SetGlobalBool
-- @param  #any index Index to identify the global boolean with.
-- @param  #boolean bool Boolean to be networked.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Defines an entity to be automatically networked to clients.
-- 
-- **Note**: _Running this function clientside will only set it clientside for
-- the client it is called on!_
-- @function [parent=#global] SetGlobalEntity
-- @param  #any index Index to identify the global entity with.
-- @param  #Entity ent Entity to be networked.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Defines a floating point number to be automatically networked to clients.
-- 
-- **Note**: _Running this function clientside will only set it clientside for
-- the client it is called on!_
-- @function [parent=#global] SetGlobalFloat
-- @param  #any index Index to identify the global float with.
-- @param  #number float Float to be networked.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets an integer that is shared between the server and all clients.
-- 
-- **Note**: _Running this function clientside will only set it clientside for
-- the client it is called on!_
-- @function [parent=#global] SetGlobalInt
-- @param  #string index The unique index to identify the global value with.
-- @param  #number value The value to set the global value to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Defines a string with a maximum of 199 characters to be automatically
-- networked to clients.
-- 
-- **Note**: _Running this function clientside will only set it clientside for
-- the client it is called on!_
-- @function [parent=#global] SetGlobalString
-- @param  #any index Index to identify the global string with.
-- @param  #string string String to be networked.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Defines a vector to be automatically networked to clients.
-- 
-- **Note**: _Running this function clientside will only set it clientside for
-- the client it is called on!_
-- @function [parent=#global] SetGlobalVector
-- @param  #any index Index to identify the global vector with.
-- @param  #Vector vec Vector to be networked.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Sets, changes or removes a table's metatable. Returns Tab (the first argument).
-- 
-- 
-- @function [parent=#global] setmetatable
-- @param  #table Tab The table who's metatable to change.
-- @param  #table Metatable The metatable to assign. If it's nil, the metatable will be removed.
-- @return #table The first argument.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Called by the engine to set which constraint system the next created
-- constraints should use.
-- @function [parent=#global] SetPhysConstraintSystem
-- @param  #Entity constraintSystem Constraint system to use.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- This function can be used in a for loop instead of pairs. It sorts all keys
-- alphabetically. For sorting by specific value member, use **SortedPairsByMemberValue**.
-- For sorting by value, use **SortedPairsByValue**.
-- @function [parent=#global] SortedPairs
-- @param  #table table The table to sort.
-- @param  #boolean desc Reverse the sorting order. _(Default: false)_
-- @return #function, #table The iterator function and table being iterated.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns an iterator function that can be used to loop through a table in
-- order of member values, when the values of the table are also tables and
-- contain that member. To sort by value, use **SortedPairsByValue**. To sort by
-- keys, use **SortedPairs**.
-- @function [parent=#global] SortedPairsByMemberValue
-- @param  #table table Table to create iterator for.
-- @param  #any memberKey Key of the value member to sort by.
-- @param  #boolean descending Whether the iterator should iterate in descending order or not. _(Default: false)_
-- @return #function, #table The iterator function and table being iterated.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns an iterator function that can be used to loop through a table in
-- order of its values. To sort by specific value member, use
-- **SortedPairsByMemberValue**. To sort by keys, use **SortedPairs**.
-- @function [parent=#global] SortedPairsByValue
-- @param  #table table Table to create iterator for.
-- @param  #boolean descending Whether the iterator should iterate in descending order or not. _(Default: false)_
-- @return #function, #table The iterator function and table being iterated.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Runs **util.PrecacheSound** and returns the string.
-- @function [parent=#global] Sound
-- @param  #string soundPath The soundpath to precache.
-- @return #string The string passed as the first argument.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the duration of the sound specified in seconds.
-- @function [parent=#global] SoundDuration
-- @param  #string soundName The sound file path.
-- @return #number Sound duration in seconds.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the input value in an escaped form so that it can safely be used
-- inside of queries. The returned value is surrounded by quotes unless
-- noQuotes is true. Alias of **sql.SQLStr**.
-- @function [parent=#global] SQLStr
-- @param  #string input String to be escaped.
-- @param  #boolean noQuotes Whether the returned value should be surrounded in quotes or not. _(Default: false)_
-- @return #string Escaped input.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the ordinal suffix of a given number.
-- @function [parent=#global] STNDRD
-- @param  #number number The number to find the ordinal suffix of.
-- @return #string The ordinal suffix.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Suppress any networking from the server to the specified player. This is
-- automatically called by the engine before/after a player fires their weapon,
-- reloads, or causes any other similar shared-predicted event to occur.
-- @function [parent=#global] SuppressHostEvents
-- @param  #Player suppressPlayer The player to suppress any networking to.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a highly accurate time in seconds since the start up, ideal for benchmarking.
-- @function [parent=#global] SysTime
-- @return #number Uptime of the server.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a TauntCamera object.
-- @function [parent=#global] TauntCamera
-- @return #table A TauntCamera.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Clears focus from any text entries player may have focused.
-- @function [parent=#global] TextEntryLoseFocus

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a cosine value that fluctuates based on the current time.
-- @function [parent=#global] TimedCos
-- @param  #number frequency The frequency of fluctuation.
-- @param  #number min Minimum value.
-- @param  #number max Maxmimum value.
-- @param  #number offset Offset variable that doesn't affect the rate of change, but causes the returned value to be offset by time.
-- @return #number Cosine value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- 
-- @function [parent=#global] TimedSin
-- @param  #number frequency The frequency of fluctuation, in hertz.
-- @param  #number origin The center value of the sine wave.
-- @param  #number max This argument's distance from origin defines the size of the full range of the sine wave.
-- For example, if origin is 3 and max is 5, then the full range of the sine wave is 5-3 = 2. 3 is the center point of the sine wave, so the sine wave will range between 2 and 4.
-- @param  #number offset Offset variable that doesn't affect the rate of change, but causes the returned value to be offset by time.
-- @return #number Sine value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Attempts to return an appropriate boolean for the given value.
-- @function [parent=#global] tobool
-- @param  #any val The object to be converted to a boolean.
-- @return #boolean Returns false for the following values, and true for anything else:
-- 
-- * boolean false.
-- * "false".
-- * "0".
-- * numeric 0.
-- * nil.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Toggles whether or not the named map is favorited in the new game list.
-- @function [parent=#global] ToggleFavourite
-- @param  #string map Map to toggle favorite.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Attempts to convert the value to a number. Returns nil on failure.
-- @function [parent=#global] tonumber
-- @param  #any value The value to convert. Can be a number or string.
-- @return #number The numeric representation of the value with the given base, or nil if the conversion failed.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Attempts to convert the value to a string. If the value is an object and its
-- metatable has defined the __tostring metamethod, this will call that
-- function. **print** also uses this functionality.
-- @function [parent=#global] tostring
-- @param  #any value The object to be converted to a string.
-- @return #string The string representation of the value.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Returns "Lua Cache File" if the given file name is in a certain string
-- table, nothing otherwise.
-- @function [parent=#global] TranslateDownloadableName
-- @param  #string filename File name to test.
-- @return #string "Lua Cache File" if the given file name is in a certain string table, nothing otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a string representing the name of the type of the passed object.
-- @function [parent=#global] type
-- @param  #any var The object to get the type of.
-- @return #string The name of the object's type.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the associated type ID of the variable.
-- @function [parent=#global] TypeID
-- @param  #any variable The variable to get the type ID of.
-- @return #number The type ID of the variable. See the **TYPE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- This function takes a numeric indexed table and return all the members as a
-- vararg. If specified, it will start at the given index and end at end index.
-- @function [parent=#global] unpack
-- @param  #table tbl The table to generate the vararg from.
-- @param  #number startIndex Optionally, which index to start from. _(Default: 1)_
-- @param  #number endIndex Which index to end at. Optional, even if you set StartIndex. _(Default: tbl)_
-- @return ... Output values.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the current asynchronous in-game time.
-- @function [parent=#global] UnPredictedCurTime
-- @return #number The asynchronous in-game time.

-------------------------------------------------------------------------------
-- _Menu_
-- 
-- Runs JavaScript on the loading screen panel. (**GetLoadPanel**)
-- @function [parent=#global] UpdateLoadPanel
-- @param  #string javascript JavaScript to run on the loading panel.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a **Vector** object.
-- @function [parent=#global] Vector
-- @param  #number x The x component of the vector. _(Default: 0)_  
-- If this is a Vector, this function will return a copy of the given vector.
-- If this is a string, this function will try to parse the string as a vector. If it fails, it returns a 0 vector.
-- @param  #number y The y component of the vector. _(Default: 0)_
-- @param  #number z The z component of the vector. _(Default: 0)_
-- @return #Vector The created vector object.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a random vector whose components are each between -1 and 1.
-- @function [parent=#global] VectorRand
-- @return #Vector The random direction vector.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Returns the time in seconds it took to render the VGUI.
-- @function [parent=#global] VGUIFrameTime

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates and returns a **DShape** rectangle GUI element with the given dimensions.
-- @function [parent=#global] VGUIRect
-- @param  #number x X position of the created element.
-- @param  #number y Y position of the created element.
-- @param  #number w Width position of the created element.
-- @param  #number h Height position of the created element.
-- @return #Panel DShape element.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- Briefly displays layout details of the given panel on-screen.
-- @function [parent=#global] VisualizeLayout
-- @return #Panel panel Panel to display layout details of.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Returns a new WorkshopFileBase element.
-- @function [parent=#global] WorkshopFileBase
-- @param  #string namespace Namespace for the file base.
-- @param  #table requiredTags Tags required for a Workshop submission to be interacted with by the filebase.
-- @return #table WorkshopFileBase element.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Translates the specified position and angle into the specified coordinate system.
-- @function [parent=#global] WorldToLocal
-- @param  #Vector position The position that should be translated from the current to the new system.
-- @param  #Angle angle The angles that should be translated from the current to the new system.
-- @param  #Vector newSystemOrigin The origin of the system to translate to.
-- @param  #Angle newSystemAngles The angles of the system to translate to.
-- @return #Vector, #Angle The local position and angles.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Attempts to call the first function. If the execution succeeds, this returns
-- true followed by the returns of the function. If execution fails, this
-- returns false and the second function is called with the error message.
-- Unlike in pcall, the stack is not unwound and can therefore be used for
-- stack analyses with the debug library.
-- @function [parent=#global] xpcall
-- @param  #function func The function to call initially.
-- @param  #function errorCallback The function to be called if execution of the first fails; the error message is passed as a string.
-- You cannot throw an error() from this callback: it will have no effect (not even stopping the callback).
-- @param  ... Arguments to pass to the initial function.
-- @return ... Status of the execution; First value is true for success, false for failure and the returns of the first function if execution succeeded, otherwise the first return value of the error callback.


-- Global types

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Created by **Angle** and many more functions.
-- @type Angle
-- @field #number pitch The pitch component of the angle.
-- @field #number yaw The yaw component of the angle.
-- @field #number roll The roll component of the angle.
-- @field #number p The pitch component of the angle.
-- @field #number y The yaw component of the angle.
-- @field #number r The roll component of the angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Adds the values of the argument angle to the orignal angle. This functions
-- the same as angle1 + angle2 without creating a new angle object, skipping
-- object construction and garbage collection.
-- @function [parent=#Angle] Add
-- @param  self
-- @param  #Angle angle The angle to add.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Divides all values of the original angle by a scalar. This functions the
-- same as angle1 / num without creating a new angle object, skipping object
-- construction and garbage collection.
-- @function [parent=#Angle] Div
-- @param  self
-- @param  #number scalar The number to divide by.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a normal vector facing in the direction that the angle points.
-- @function [parent=#Angle] Forward
-- @param  self
-- @return #Vector The forward direction of the angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the pitch, yaw and roll are 0 or not.
-- @function [parent=#Angle] IsZero
-- @param  self
-- @return #boolean Whether the pitch, yaw and roll are 0 or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Multiplies a scalar to all the values of the orignal angle. This functions
-- the same as num * angle without creating a new angle object, skipping object
-- construction and garbage collection.
-- @function [parent=#Angle] Mul
-- @param  self
-- @return #number scalar The number to multiply.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Normalizes the angles by applying a module with 360 to pitch, yaw and roll.
-- @param  self
-- @function [parent=#Angle] Normalize

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a normal vector facing in the direction that points right relative
-- to the angle's direction.
-- @function [parent=#Angle] Right
-- @param  self
-- @return #Vector The right direction of the angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Rotates the angle around the specified axis by the specified degrees.
-- @function [parent=#Angle] RotateAroundAxis
-- @param  self
-- @param  #Vector axis The axis to rotate around.
-- @param  #number rotation The degrees to rotate around the specified axis.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Copies pitch, yaw and roll from the second angle to the first.
-- @function [parent=#Angle] Set
-- @param  self
-- @param  #Angle originalAngle The angle to copy the values from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Snaps the angle to nearest interval of degrees.
-- 
-- **Note**: _This will modify the original angle too!_
-- @function [parent=#Angle] SnapTo
-- @param  self
-- @param  #string axis The component/axis to snap. Can be either "p"/"pitch", "y"/"yaw" or "r"/"roll".
-- @param  #number target The target angle snap interval.
-- @return #Angle The snapped angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Subtracts the values of the argument angle to the orignal angle. This
-- functions the same as angle1 - angle2 without creating a new angle object,
-- skipping object construction and garbage collection.
-- @function [parent=#Angle] Sub
-- @param  self
-- @param  #Angle angle The angle to subtract.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a normal vector facing in the direction that points up relative to
-- the angle's direction.
-- @function [parent=#Angle] Up
-- @param  self
-- @return #Vector The up direction of the angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets pitch, yaw and roll to 0. This function is faster than doing it manually.
-- @function [parent=#Angle] Zero
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This is the object returned by the **EffectData** function and is required for
-- **util.Effect** function.
-- @type CEffectData

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the angles of the effect.
-- @function [parent=#CEffectData] GetAngles
-- @param  self
-- @return #Angle The angles of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the attachment ID for the effect.
-- @function [parent=#CEffectData] GetAttachment
-- @param  self
-- @return #number The attachment ID of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns byte which represents the color of the effect.
-- @function [parent=#CEffectData] GetColor
-- @param  self
-- @return #number The color of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the damage type of the effect.
-- @function [parent=#CEffectData] GetDamageType
-- @param  self
-- @return #number Damage type of the effect, see **DMG\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the entity index of the entity set for the effect.
-- @function [parent=#CEffectData] GetEntIndex
-- @param  self
-- @return #number The entity index of the entity set for the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity assigned to the effect.
-- @function [parent=#CEffectData] GetEntity
-- @param  self
-- @return #Entity The entity assigned to the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the flags of the effect.
-- @function [parent=#CEffectData] GetFlags
-- @param  self
-- @return #number The flags of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the hit box ID of the effect.
-- @function [parent=#CEffectData] GetHitBox
-- @param  self
-- @return #number The hit box ID of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the magnitude of the effect.
-- @function [parent=#CEffectData] GetMagnitude
-- @param  self
-- @return #number The magnitude of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the material ID of the effect.
-- @function [parent=#CEffectData] GetMaterialIndex
-- @param  self
-- @return #number The material ID of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the normalized direction vector of the effect.
-- @function [parent=#CEffectData] GetNormal
-- @param  self
-- @return #Vector The normalized direction vector of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the origin position of the effect.
-- @function [parent=#CEffectData] GetOrigin
-- @param  self
-- @return #Vector The origin position of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the radius of the effect.
-- @function [parent=#CEffectData] GetRadius
-- @param  self
-- @return #number The radius of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the scale of the effect.
-- @function [parent=#CEffectData] GetScale
-- @param  self
-- @return #number The scale of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the start position of the effect.
-- @function [parent=#CEffectData] GetStart
-- @param  self
-- @return #Vector The start position of the effect. 

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the surface property index of the effect.
-- @function [parent=#CEffectData] GetSurfaceProp
-- @param  self
-- @return #number The surface property index of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the angles of the effect.
-- @function [parent=#CEffectData] SetAngles
-- @param  self
-- @param  #Angle ang The new angles to be set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the attachment id of the effect to be created with this effect data.
-- 
-- **Note**: _This is internally stored as an integer, but only the first 5
-- bits will be networked._
-- @function [parent=#CEffectData] SetAttachment
-- @param  self
-- @param  #number attachment New attachment ID of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the color of the effect.
-- @function [parent=#CEffectData] SetColor
-- @param  self
-- @param  #number color Color represented by a byte.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the damage type of the effect to be created with this effect data.
-- @function [parent=#CEffectData] SetDamageType
-- @param  self
-- @param  #number damageType Damage type, see **DMG\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the entity of the effect via its index.
-- @function [parent=#CEffectData] SetEntIndex
-- @param  self
-- @param  #number entIndex The entity index to be set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the entity of the effect to be created with this effect data.
-- @function [parent=#CEffectData] SetEntity
-- @param  self
-- @param  #Entity entity Entity of the effect, mostly used for parenting.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the flags of the effect.
-- 
-- **Note**: _This is internally stored as an integer, but only the first 8
-- bits will be networked._
-- @function [parent=#CEffectData] SetFlags
-- @param  self
-- @param  #number flags The flags of the effect. Each effect has their own flags.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the hit box index of the effect.
-- 
-- **Note**: _This is internally stored as an integer, but only the first 11
-- bits will be networked._
-- @function [parent=#CEffectData] SetHitBox
-- @param  self
-- @param  #number hitBoxIndex The hit box index of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the magnitude of the effect.
-- @function [parent=#CEffectData] SetMagnitude
-- @param  self
-- @param  #number magnitude The magnitude of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the material index of the effect.
-- 
-- **Note**: _This is internally stored as an integer, but only the first 11
-- bits will be networked._
-- @function [parent=#CEffectData] SetMaterialIndex
-- @param  self
-- @param  #number materialIndex The material index of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the normalized direction vector of the effect to be created with this
-- effect data.
-- @function [parent=#CEffectData] SetNormal
-- @param  self
-- @param  #Vector normal The normalized direction vector of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the origin of the effect to be created with this effect data.
-- @function [parent=#CEffectData] SetOrigin
-- @param  self
-- @param  #Vector origin Origin of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the radius of the effect to be created with this effect data.
-- 
-- **Note**: _This is clamped internally from 0 to 1023._
-- @function [parent=#CEffectData] SetRadius
-- @param  self
-- @param  #number radius Radius of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the scale of the effect to be created with this effect data.
-- @function [parent=#CEffectData] SetScale
-- @param  self
-- @param  #number scale Scale of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the start of the effect to be created with this effect data.
-- @function [parent=#CEffectData] SetStart
-- @param  self
-- @param  #Vector start Start of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the surface property index of the effect.
-- @function [parent=#CEffectData] SetSurfaceProp
-- @param  self
-- @param  #number surfaceProperties The surface property index of the effect.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- This is the object returned by the **ParticleEmitter** function.
-- @type CLuaEmitter

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a new **CLuaParticle** with the given material and position.
-- @function [parent=#CLuaEmitter] Add
-- @param  self
-- @param  #string material The particles material. Can also be an **IMaterial**.
-- @param  #Vector position The position to spawn the particle on.
-- @return #CLuaParticle The created particle, if any.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Manually renders all particles the emitter has created.
-- @function [parent=#CLuaEmitter] Draw
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Removes the emitter and all its particles.
-- @function [parent=#CLuaEmitter] Finish
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the amount of active particles of this emitter.
-- @function [parent=#CLuaEmitter] GetNumActiveParticles
-- @param  self
-- @return #number The amount of active particles of this emitter.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the position of this emitter. This is set when creating the emitter
-- with **ParticleEmitter**.
-- @function [parent=#CLuaEmitter] GetPos
-- @param  self
-- @return #Vector Position of this particle emitter.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether this emitter is 3D or not. This is set when creating the
-- emitter with **ParticleEmitter**.
-- @function [parent=#CLuaEmitter] Is3D
-- @param  self
-- @return #boolean Whether this emitter is 3D or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether this **CLuaEmitter** is valid or not.
-- @function [parent=#CLuaEmitter] IsValid
-- @param  self
-- @return #boolean Whether this CLuaEmitter is valid or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the bounding box for this emitter. Usually the bounding box is
-- automatically determined by the particles, but this function overrides it.
-- @function [parent=#CLuaEmitter] SetBBox
-- @param  self
-- @param  #Vector mins The minimum position of the box.
-- @param  #Vector maxs The maximum position of the box.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This function sets the the distance between the render camera and the
-- emitter at which the particles should start fading and at which distance
-- fade ends (alpha becomes 0).
-- @function [parent=#CLuaEmitter] SetNearClip
-- @param  self
-- @param  #number distanceMin Min distance where the alpha becomes 0.
-- @param  #number distanceMax Max distance where the alpha starts fading.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Prevents all particles of the emitter from automatically drawing.
-- @function [parent=#CLuaEmitter] SetNoDraw
-- @param  self
-- @param  #boolean Whether we should draw the particles or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- The function name has not much in common with its actual function, it
-- applies a radius to every particles that affects the building of the
-- bounding box, as it, usually is constructed by the particle that has the
-- lowest x, y and z and the highest x, y and z, this function just
-- adds/subtracts the radius and inflates the bounding box.
-- @function [parent=#CLuaEmitter] SetParticleCullRadius
-- @param  self
-- @param  #number radius Particle radius.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the position of the particle emitter.
-- @function [parent=#CLuaEmitter] SetPos
-- @param  self
-- @param  #Vector position New position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- This class is essentially what controls a **NextBot** NPC. You can access it in
-- a **NextBot** NPC by using **self.loco** variable.
-- @type CLuaLocomotion

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the location we want to get to.
-- @function [parent=#CLuaLocomotion] Approach
-- @param  self
-- @param  #Vector goal The vector we want to get to.
-- @param  #number goalweight If unsure then set this to 1.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes the stuck status from the bot.
-- @function [parent=#CLuaLocomotion] ClearStuck
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the direction we want to face.
-- @function [parent=#CLuaLocomotion] FaceTowards
-- @param  self
-- @param  #Vector goal The vector we want to face.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the acceleration speed
-- @function [parent=#CLuaLocomotion] GetAcceleration
-- @param  self
-- @return #number Current acceleration speed.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current acceleration as a vector.
-- @function [parent=#CLuaLocomotion] GetCurrentAcceleration
-- @param  self
-- @return #Vector Current acceleration.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gets the height the bot is scared to fall from.
-- @function [parent=#CLuaLocomotion] GetDeathDropHeight
-- @param  self
-- @return #number Current death drop height.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gets the deceleration speed.
-- @function [parent=#CLuaLocomotion] GetDeceleration
-- @param  self
-- @return #number Current deceleration speed.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Return unit vector in XY plane describing our direction of motion - even if
-- we are currently not moving.
-- @function [parent=#CLuaLocomotion] GetGroundMotionVector
-- @param  self
-- @return #Vector A vector representing the X and Y movement.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gets the height of the bot's jump.
-- @function [parent=#CLuaLocomotion] GetJumpHeight
-- @param  self
-- @return #number Current jump height.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns maximum jump height of this **CLuaLocomotion**.
-- @function [parent=#CLuaLocomotion] GetMaxJumpHeight
-- @param  self
-- @return #number The maximum jump height.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the max rate at which the NextBot can visually rotate.
-- @function [parent=#CLuaLocomotion] GetMaxYawRate
-- @param  self
-- @return #number Maximum yaw rate.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gets the max height the bot can step up.
-- @function [parent=#CLuaLocomotion] GetStepHeight
-- @param  self
-- @return #number Current step height.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current movement velocity as a vector.
-- @function [parent=#CLuaLocomotion] GetVelocity
-- @param  self
-- @return #Vector Current velocity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this **CLuaLocomotion** can reach and/or traverse/move in given **CNavArea**.
-- @function [parent=#CLuaLocomotion] IsAreaTraversable
-- @param  self
-- @param  #CNavArea area The area to test.
-- @return #boolean Whether this **CLuaLocomotion** can traverse given **CNavArea**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if we're trying to move.
-- @function [parent=#CLuaLocomotion] IsAttemptingToMove
-- @param  self
-- @return #boolean Whether we're trying to move or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true of the locomotion engine is jumping or climbing.
-- @function [parent=#CLuaLocomotion] IsClimbingOrJumping
-- @param  self
-- @return #boolean Whether we're climbing or jumping or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the locomotion/nextbot is on ground or not.
-- @function [parent=#CLuaLocomotion] IsOnGround
-- @param  self
-- @return #boolean Whether the locomotion/nextbot is on ground or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if we're stuck.
-- @function [parent=#CLuaLocomotion] IsStuck
-- @param  self
-- @return #boolean Whether we're stuck or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether or not the target in question is on a ladder or not.
-- @function [parent=#CLuaLocomotion] IsUsingLadder
-- @param  self
-- @return #boolean If the target is on a ladder or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes the bot jump.
-- @function [parent=#CLuaLocomotion] Jump
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#CLuaLocomotion] JumpAcrossGap
-- @param  self
-- @param  #Vector landingGoal
-- @param  #Vector landingForward

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the acceleration speed.
-- @function [parent=#CLuaLocomotion] SetAcceleration
-- @param  self
-- @param  #number speed Speed acceleration. _Default: 400)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the height the bot is scared to fall from.
-- @function [parent=#CLuaLocomotion] SetDeathDropHeight
-- @param  self
-- @param  #number height The drop height. _(Default: 200)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the deceleration speed.
-- @function [parent=#CLuaLocomotion] SetDeceleration
-- @param  self
-- @param  #number deceleration New deceleration speed. _(Default: 400)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets movement speed.
-- @function [parent=#CLuaLocomotion] SetDesiredSpeed
-- @param  self
-- @return #number speed The new desired speed.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the height of the bot's jump.
-- @function [parent=#CLuaLocomotion] SetJumpHeight
-- @param  self
-- @param  #number height The new jump height. _(Default: 58)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the max rate at which the NextBot can visually rotate. This will not
-- affect moving or pathing.
-- @function [parent=#CLuaLocomotion] SetMaxYawRate
-- @param  self
-- @param  #number yawRate Desired new maximum yaw rate.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the max height the bot can step up.
-- @function [parent=#CLuaLocomotion] SetStepHeight
-- @param  self
-- @param  #number height The new max step height. _(Default: 18)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the current movement velocity
-- @function [parent=#CLuaLocomotion] SetVelocity
-- @param  self
-- @param  #Vector velocity The new movement velocity.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This is the object returned by the **CLuaEmitter:Add** function.
-- @type CLuaParticle

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the air resistance of the particle.
-- @function [parent=#CLuaParticle] GetAirResistance
-- @param  self
-- @return #number The air resistance of the particle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current orientation of the particle.
-- @function [parent=#CLuaParticle] GetAngles
-- @param  self
-- @return #Angle The angles of the particle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the angular velocity of the particle.
-- @function [parent=#CLuaParticle] GetAngleVelocity
-- @param  self
-- @return #Angle The angular velocity of the particle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the 'bounciness' of the particle.
-- @function [parent=#CLuaParticle] GetBounce
-- @param  self
-- @return #number The 'bounciness' of the particle.  
-- 2 means it will gain 100% of its previous velocity,  
-- 1 means it will not lose velocity,  
-- 0.5 means it will lose half of its velocity with each bounce.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the color of the particle.
-- @function [parent=#CLuaParticle] GetColor
-- @param  self
-- @return #number, #number, #number Red, Green, Blue components.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the amount of time in seconds after which the particle will be destroyed.
-- @function [parent=#CLuaParticle] GetDieTime
-- @param  self
-- @return #number The amount of time in seconds after which the particle will be destroyed.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the alpha value that the particle will reach on its death.
-- @function [parent=#CLuaParticle] GetEndAlpha
-- @param  self
-- @return #number The alpha value the particle will fade to.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the length that the particle will reach on its death.
-- @function [parent=#CLuaParticle] GetEndLength
-- @param  self
-- @return #number The length the particle will reach.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the size that the particle will reach on its death.
-- @function [parent=#CLuaParticle] GetEndSize
-- @param  self
-- @return #number The size the particle will reach.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the gravity of the particle.
-- @function [parent=#CLuaParticle] GetGravity
-- @param  self
-- @return #Vector The gravity of the particle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the 'life time' of the particle, how long the particle existed since its creation.
-- 
-- This value will always be between 0 and **CLuaParticle:GetDieTime**.
-- It changes automatically as time goes.
-- 
-- It can be manipulated using **CLuaParticle:SetLifeTime**.
-- If the life time of the particle will be more than **CLuaParticle:GetDieTime**, it will be removed.
-- @function [parent=#CLuaParticle] GetLifeTime
-- @param  self
-- @return #number How long the particle existed, in seconds.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the absolute position of the particle.
-- @function [parent=#CLuaParticle] GetPos
-- @param  self
-- @return #Vector The absolute position of the particle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current rotation of the particle in radians, this should only be
-- used for 2D particles.
-- @function [parent=#CLuaParticle] GetRoll
-- @param  self
-- @return #number The current rotation of the particle in radians.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current rotation speed of the particle in radians, this should only be used for 2D particles.
-- @function [parent=#CLuaParticle] GetRollDelta
-- @param  self
-- @return #number The current rotation speed of the particle in radians.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the alpha value which the particle has when it's created.
-- @function [parent=#CLuaParticle] GetStartAlpha
-- @param  self
-- @return #number The alpha value which the particle has when it's created.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the length which the particle has when it's created.
-- @function [parent=#CLuaParticle] GetStartLength
-- @param  self
-- @return #number The length which the particle has when it's created.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the size which the particle has when it's created.
-- @function [parent=#CLuaParticle] GetStartSize
-- @param  self
-- @return #number The size which the particle has when it's created.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current velocity of the particle.
-- @function [parent=#CLuaParticle] GetVelocity
-- @param  self
-- @return #Vector The current velocity of the particle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the air resistance of the the particle.
-- @function [parent=#CLuaParticle] SetAirResistance
-- @param  self
-- @return #number airResistance New air resistance.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the angles of the particle.
-- @function [parent=#CLuaParticle] SetAngles
-- @param  self
-- @param  #Angle ang New angle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the angular velocity of the the particle.
-- @function [parent=#CLuaParticle] SetAngleVelocity
-- @param  self
-- @param  #Angle angVel New angular velocity.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the 'bounciness' of the the particle.
-- @function [parent=#CLuaParticle] SetBounce
-- @param  self
-- @param  #number bounce New 'bounciness' of the particle.  
-- 2 means it will gain 100% of its previous velocity,  
-- 1 means it will not lose velocity,  
-- 0.5 means it will lose half of its velocity with each bounce.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the whether the particle should collide with the world or not.
-- @function [parent=#CLuaParticle] SetCollide
-- @param  self
-- @param  #boolean shouldCollide Whether the particle should collide with the world or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the function that gets called whenever the particle collides with the world.
-- @function [parent=#CLuaParticle] SetCollideCallback
-- @param  self
-- @param  #function collideFunc Collide callback.  
-- The arguments are:
-- 
-- * **CLuaParticle** particle - The particle itself.
-- * **Vector** hitPos - Position of the collision.
-- * **Vector** hitNormal - Direction of the collision, perpendicular to the hit surface.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the color of the particle.
-- @function [parent=#CLuaParticle] SetColor
-- @param  self
-- @param  #number r The red component.
-- @param  #number r The green component.
-- @param  #number r The blue component.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the time where the particle will be removed.
-- @function [parent=#CLuaParticle] SetDieTime
-- @param  self
-- @param  #number dieTime The new die time.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the alpha value of the particle that it will reach when it dies.
-- @function [parent=#CLuaParticle] SetEndAlpha
-- @param  self
-- @param  #number endAlpha The new alpha value of the particle that it will reach when it dies.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the length of the particle that it will reach when it dies.
-- @function [parent=#CLuaParticle] SetEndLength
-- @param  self
-- @param  #number endLength The new length of the particle that it will reach when it dies.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the size of the particle that it will reach when it dies.
-- @function [parent=#CLuaParticle] SetEndSize
-- @param  self
-- @param  #number endSize The new size of the particle that it will reach when it dies.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the directional gravity aka. acceleration of the particle.
-- @function [parent=#CLuaParticle] SetGravity
-- @param  self
-- @param  #Vector gravity The directional gravity.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the 'life time' of the particle, how long the particle existed since
-- its creation. This value should always be between 0 and
-- **CLuaParticle:GetDieTime**. It changes automatically as time goes. If the life
-- time of the particle will be more than **CLuaParticle:GetDieTime**, it will
-- be removed.
-- @function [parent=#CLuaParticle] SetLifeTime
-- @param  self
-- @param  #number lifeTime The new life time of the particle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whether the particle should be lighted.
-- @function [parent=#CLuaParticle] SetLighting
-- @param  self
-- @param  #boolean useLighting Whether the particle should be lighted.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets when the particles think function should be called next, this uses the
-- synchronized server time returned by **CurTime**.
-- @function [parent=#CLuaParticle] SetNextThink
-- @param  self
-- @param  #number nextThink Next think time.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the absolute position of the particle.
-- @function [parent=#CLuaParticle] SetPos
-- @param  self
-- @param  #Vector pos The new particle position.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the roll of the particle in radians. This should only be used for 2D particles.
-- @function [parent=#CLuaParticle] SetRoll
-- @param  self
-- @param  #number roll The new rotation of the particle in radians.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the rotation speed of the particle in radians. This should only be used
-- for 2D particles.
-- @function [parent=#CLuaParticle] SetRollDelta
-- @param  self
-- @param  #number rollDelta The new rotation speed of the particle in radians.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the initial alpha value of the particle.
-- @function [parent=#CLuaParticle] SetStartAlpha
-- @param  self
-- @param  #number startAlpha Initial alpha.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the initial length value of the particle.
-- @function [parent=#CLuaParticle] SetStartLength
-- @param  self
-- @param  #number startLength Initial length.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the initial size value of the particle.
-- @function [parent=#CLuaParticle] SetStartSize
-- @param  self
-- @param  #number startSize Initial size.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the think function of the particle.
-- @function [parent=#CLuaParticle] SetThinkFunction
-- @param  self
-- @param  #function thinkFunc Think function.  
-- It has only one argument:
-- 
-- * **CLuaParticle** particle - The particle the think hook is set on.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the velocity of the particle.
-- @function [parent=#CLuaParticle] SetVelocity
-- @param  self
-- @param  #Vector vel The new velocity of the particle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Scales the velocity based on the particle speed.
-- @function [parent=#CLuaParticle] SetVelocityScale
-- @param  self
-- @param  #boolean doScale Use velocity scaling. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- A class used to store the inputs from CUserCmd and other information related
-- to the current movement simulation, such as velocity, position and so on.
-- 
-- This can only be accessed during **GM:SetupMove**, **GM:Move**, **GM:PlayerTick** and **GM:FinishMove**.
-- @type CMoveData

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds keys to the move data, as if player pressed them.
-- @function [parent=#CMoveData] AddKey
-- @param  self
-- @param  #number keys Keys to add, see **IN\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the aim angle. Seems to be same as **CMoveData:GetAngles**.
-- @function [parent=#CMoveData] GetAbsMoveAngles
-- @param  self
-- @return #Angle Aiming angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the aim angle. On client is the same as **Entity:GetAngles**.
-- @function [parent=#CMoveData] GetAngles
-- @param  self
-- @return #Angle Aiming angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets which buttons are down.
-- @function [parent=#CMoveData] GetButtons
-- @param  self
-- @return #number An integer representing which buttons are down, see **IN\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the radius that constrains the players movement.
-- @function [parent=#CMoveData] GetConstraintRadius
-- @param  self
-- @return #number The constraint radius.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the players forward speed.
-- @function [parent=#CMoveData] GetForwardSpeed
-- @param  self
-- @return #number Player's forward speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the number passed to "impulse" console command.
-- @function [parent=#CMoveData] GetImpulseCommand
-- @param  self
-- @return #number The impulse.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the maximum client speed of the player.
-- @function [parent=#CMoveData] GetMaxClientSpeed
-- @param  self
-- @return #number The maximum client speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the maximum speed of the player.
-- @function [parent=#CMoveData] GetMaxSpeed
-- @param  self
-- @return #number The maximum speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the angle the player is moving at. For more info, see **CMoveData:SetMoveAngles**.
-- @function [parent=#CMoveData] GetMoveAngles
-- @param  self
-- @return #Angle The move direction.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the aim angle. Only works clientside, server returns same as **CMoveData:GetAngles**.
-- @function [parent=#CMoveData] GetOldAngles
-- @param  self
-- @return #Angle The aim angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Get which buttons were down last frame.
-- @function [parent=#CMoveData] GetOldButtons
-- @param  self
-- @return #number An integer representing which buttons were down, see **IN\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the player's position.
-- @function [parent=#CMoveData] GetOrigin
-- @param  self
-- @return #Vector The player's position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the strafe speed of the player.
-- @function [parent=#CMoveData] GetSideSpeed
-- @param  self
-- @return #number The player's strafe speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the vertical speed of the player. (Z axis of **CMoveData:GetVelocity**)
-- @function [parent=#CMoveData] GetUpSpeed
-- @param  self
-- @return #number Vertical speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the players velocity.
-- @function [parent=#CMoveData] GetVelocity
-- @param  self
-- @return #Vector The players velocity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the key is down or not.
-- @function [parent=#CMoveData] KeyDown
-- @param  self
-- @param  #number key The key to test, see **IN\_ Enums**.
-- @return #boolean Is the key down or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the key was pressed. If you want to check if the key is held
-- down, try **CMoveData:KeyDown**.
-- @function [parent=#CMoveData] KeyPressed
-- @param  self
-- @param  #number key The key to test, see **IN\_ Enums**.
-- @return #boolean Was the key pressed or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the key was released.
-- @function [parent=#CMoveData] KeyReleased
-- @param  self
-- @param  #number key A key to test, see **IN\_ Enums**.
-- @return #boolean Was the key released or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the key was down or not. Unlike **CMoveData:KeyDown**, it will
-- return false if **CMoveData:KeyPressed** is true and it will return true if
-- **CMoveData:KeyReleased** is true.
-- @function [parent=#CMoveData] KeyWasDown
-- @param  self
-- @param  #number key The key to test, see **IN\_ Enums**.
-- @return #boolean Was the key down or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets absolute move angles. Doesn't seem to do anything?
-- @function [parent=#CMoveData] SetAbsMoveAngles
-- @param  self
-- @param  #Angle ang New absolute move angles.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets angles.
-- @function [parent=#CMoveData] SetAngles
-- @param  self
-- @param  #Angle ang The angles.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the pressed buttons on the move data.
-- @function [parent=#CMoveData] SetButtons
-- @param  self
-- @param  #number buttons A number representing which buttons are down, see **IN\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the radius that constrains the players movement. It is unknown what
-- this function does as changing its values doesn't affect player movement.
-- @function [parent=#CMoveData] SetConstraintRadius
-- @param  self
-- @param  #number radius The new constraint radius.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets players forward speed.
-- @function [parent=#CMoveData] SetForwardSpeed
-- @param  self
-- @param  #number speed New forward speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the impulse command. This isn't actually utilized in the engine anywhere.
-- @function [parent=#CMoveData] SetImpulseCommand
-- @param  self
-- @param  #number impulse The impulse to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the maximum player speed. Player won't be able to run or sprint faster
-- then this value. This also automatically sets **CMoveData:SetMaxSpeed** when
-- used in the **GM:SetupMove** hook. You must set it manually in the **GM:Move** hook.
-- This must be called on both client and server to avoid prediction errors.
-- This will not reduce speed in air.
-- 
-- **Note**: _Setting this to 0 will not make the player stationary. It won't
-- do anything._
-- @function [parent=#CMoveData] SetMaxClientSpeed
-- @param  self
-- @param  #number maxSpeed The new maximum speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the maximum speed of the player. This must match with
-- **CMoveData:SetMaxClientSpeed** both, on server and client. Doesn't seem to be
-- doing anything on it's own, use **CMoveData:SetMaxClientSpeed** instead.
-- @function [parent=#CMoveData] SetMaxSpeed
-- @param  self
-- @param  #number maxSpeed The new maximum speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the serverside move angles, making the movement keys act as if player
-- was facing that direction.
-- @function [parent=#CMoveData] SetMoveAngles
-- @param  self
-- @param  #Angle dir The aim direction.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets old aim angles. Doesn't seem to be doing anything?
-- @function [parent=#CMoveData] SetOldAngles
-- @param  self
-- @param  #Angle aimAng The old angles.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the 'old' pressed buttons on the move data. These buttons are used to
-- work out which buttons have been released, which have just been pressed and
-- which are being held down.
-- @function [parent=#CMoveData] SetOldButtons
-- @param  self
-- @param  #number buttons A number representing which buttons were down, see **IN\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the players position.
-- @function [parent=#CMoveData] SetOrigin
-- @param  self
-- @param  #Vector pos The position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets players strafe speed.
-- @function [parent=#CMoveData] SetSideSpeed
-- @param  self
-- @param  #number speed Strafe speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets vertical speed of the player. (Z axis of **CMoveData:SetVelocity**)
-- @function [parent=#CMoveData] SetUpSpeed
-- @param  self
-- @param  #number speed Vertical speed to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the player's velocity.
-- @function [parent=#CMoveData] SetVelocity
-- @param  self
-- @param  #Vector velocity The velocity to set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- An object returned by navmesh library functions.
-- @type CNavArea

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds this **CNavArea** to the closed list, a list of areas that have been
-- checked by A* pathfinding algorithm.
-- @function [parent=#CNavArea] AddToClosedList
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds this **CNavArea** to the Open List.
-- @function [parent=#CNavArea] AddToOpenList
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Clears the open and closed lists for a new search.
-- @function [parent=#CNavArea] ClearSearchLists
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the height difference between the edges of two connected navareas.
-- @function [parent=#CNavArea] ComputeAdjacentConnectionHeightChange
-- @param  self
-- @param  #CNavArea navarea The other connected navarea.
-- @return #number The height change.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the **NavDir\_ Enums** direction that the given vector faces on this **CNavArea**.
-- @function [parent=#CNavArea] ComputeDirection
-- @param  self
-- @param  #Vector pos The position to compute direction towards.
-- @return #number The direction the vector is in relation to this **CNavArea**. See **NavDir\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the height difference on the Z axis of the two **CNavAreas**. This is
-- calculated from the center most point on both **CNavAreas**.
-- @function [parent=#CNavArea] ComputeGroundHeightChange
-- @param  self
-- @param  #CNavArea navArea The nav area to test against.
-- @return #number The ground height change.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Connects this **CNavArea** to another **CNavArea** or **CNavLadder** with a one way
-- connection. (From this area to the target) See **CNavLadder:ConnectTo** for
-- making the connection from ladder to area.
-- @function [parent=#CNavArea] ConnectTo
-- @param  self
-- @param  #CNavArea area The **CNavArea** or **CNavLadder** this area leads to.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if this **CNavArea** contains the given vector.
-- @function [parent=#CNavArea] Contains
-- @param  self
-- @param  #Vector pos The position to test.
-- @return #boolean True if the vector was inside and false otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Disconnects this nav area from given area or ladder. (Only disconnects one way)
-- @function [parent=#CNavArea] Disconnect
-- @param  self
-- @param  #CNavArea area The **CNavArea** or **CNavLadder** this to disconnect from.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Draws this navarea on debug overlay.
-- @function [parent=#CNavArea] Draw
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Draws the hiding spots on debug overlay. This includes sniper/exposed spots too!
-- @function [parent=#CNavArea] DrawSpots
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of all the CNavAreas that have a (one and two way)
-- connection from this CNavArea. If an area has a one-way incoming connection
-- to this CNavArea, then it will not be returned from this function, use
-- **CNavArea:GetIncomingConnections** to get all one-way incoming connections. See
-- **CNavArea:GetAdjacentAreasAtSide** for a function that only returns areas from
-- one side/direction.
-- @function [parent=#CNavArea] GetAdjacentAreas
-- @param  self
-- @return #table A table of all **CNavArea** that have a (one and two way) connection from this **CNavArea**.
-- Returns an empty table if this area has no outgoing connections to any other areas.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of all the CNavAreas that have a (one and two way)
-- connection from this **CNavArea** in given direction. If an area has a one-way
-- incoming connection to this **CNavArea**, then it will not be returned from this
-- function, use **CNavArea:GetIncomingConnections** to get all incoming
-- connections. See **CNavArea:GetAdjacentAreas** for a function that returns all
-- areas from all sides/directions.
-- @function [parent=#CNavArea] GetAdjacentAreasAtSide
-- @param  self
-- @param  #number navDir The direction, in which to look for **CNavAreas**, see **NavDir\_ Enums**.
-- @return #table A table of all **CNavArea** that have a (one and two way) connection from this **CNavArea** in given direction.
-- Returns an empty table if this area has no outgoing connections to any other areas in given direction.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the amount of **CNavArea**'s that have a connection (one and two way)
-- from this **CNavArea**. See **CNavArea:GetAdjacentCountAtSide** for a function that
-- only returns area count from one side/direction.
-- @function [parent=#CNavArea] GetAdjacentCount
-- @param  self
-- @return #number The amount of CNavAreas that have a connection ( one and two way ) from this CNavArea.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the amount of CNavAreas that have a connection (one or two way)
-- from this **CNavArea** in given direction. See **CNavArea:GetAdjacentCount** for a
-- function that returns **CNavArea** count from/in all sides/directions.
-- @function [parent=#CNavArea] GetAdjacentCountAtSide
-- @param  self
-- @param  #number navDir The direction, in which to look for **CNavAreas**, see **NavDir\_ Enums**.
-- @return #number The amount of **CNavAreas** that have a connection (one or two way) from this **CNavArea** in given direction.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the attribute mask for the given **CNavArea**.
-- @function [parent=#CNavArea] GetAttributes
-- @param  self
-- @return #boolean Attribute mask for this **CNavArea**, see **NAV\_MESH\_ Enums** for the specific flags.  
-- **Note**: _A navmesh that was generated with nav\_quicksave set to 1 will have all **CNavAreas** attribute masks set to 0._

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the center most vector point for the given **CNavArea**.
-- @function [parent=#CNavArea] GetCenter
-- @param  self
-- @return #Vector The center vector.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the closest point of this **CNavArea** from the given position.
-- @function [parent=#CNavArea] GetClosestPointOnArea
-- @param  self
-- @param  #Vector pos The given position, can be outside of the **CNavArea** bounds.
-- @return #Vector The closest position on this **CNavArea**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the vector position of the corner for the given **CNavArea**.
-- @function [parent=#CNavArea] GetCorner
-- @param  self
-- @param  #number cornerid The target corner to get the position of, takes **NavCorner\_ Enums**.
-- @return #Vector The corner position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the cost from starting area this area when pathfinding. Set by **CNavArea:SetCostSoFar**.
-- @function [parent=#CNavArea] GetCostSoFar
-- @param  self
-- @return #number The cost so far.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of very bad hiding spots in this area.
-- @function [parent=#CNavArea] GetExposedSpots
-- @param  self
-- @return #table A table of Vectors.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns size info about the nav area.
-- @function [parent=#CNavArea] GetExtentInfo
-- @param  self
-- @return #table Returns a table containing the following keys:
-- 
-- * _#Vector hi_
-- * _#Vector lo_
-- * _#number SizeX_
-- * _#number SizeY_
-- * _#number SizeZ_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of good hiding spots in this area
-- @function [parent=#CNavArea] GetHidingSpots
-- @param  self
-- @return #table A table of Vectors.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns this **CNavArea**'s unique ID.
-- @function [parent=#CNavArea] GetID
-- @param  self
-- @return #number The unique ID.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of all the **CNavArea**'s that have a one-way connection to this
-- **CNavArea**. If a **CNavArea** has a two-way connection to or from this **CNavArea**
-- then it will not be returned from this function, use
-- **CNavArea:GetAdjacentAreas** to get outgoing (one and two way) connections. See
-- **CNavArea:GetIncomingConnectionsAtSide** for a function that returns one-way
-- incoming connections from only one side/direction.
-- @function [parent=#CNavArea] GetIncomingConnections
-- @param  self
-- @return #table A table of all **CNavArea**'s with one-way connection to this **CNavArea**.
-- Returns an empty table if there are no one-way incoming connections to this **CNavArea**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of all the **CNavArea**'s that have a one-way connection to this
-- **CNavArea** from given direction. If a **CNavArea** has a two-way connection to or
-- from this **CNavArea** then it will not be returned from this function, use
-- **CNavArea:GetAdjacentAreas** to get outgoing (one and two way) connections. See
-- **CNavArea:GetIncomingConnections** for a function that returns one-way incoming
-- connections from all sides/directions.
-- @function [parent=#CNavArea] GetIncomingConnectionsAtSide
-- @param  self
-- @param  #number navDir The direction, from which to look for **CNavArea**'s, see **NavDir\_ Enums**.
-- @return #table A table of all **CNavArea**'s with one-way connection to this **CNavArea** from given direction.
-- Returns an empty table if there are no one-way incoming connections to this **CNavArea** from given direction.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns all **CNavLadder**'s that have a (one or two way) connection from this
-- **CNavArea**. See **CNavArea:GetLaddersAtSide** for a function that only returns
-- **CNavLadder**'s in given direction.
-- @function [parent=#CNavArea] GetLadders
-- @param  self
-- @return #table The **CNavLadder**'s that have a (one or two way) connection from this **CNavArea**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns all **CNavLadder**'s that have a (one or two way) connection from (one
-- and two way) this **CNavArea** in given direction. See **CNavArea:GetLadders** for a
-- function that returns **CNavLadder** from/in all sides/directions.
-- @function [parent=#CNavArea] GetLaddersAtSide
-- @param  self
-- @param  #number navDir The direction, in which to look for **CNavLadder**'s.
-- 
-- * 0 = Up (LadderDirectionType::LADDER_UP)
-- * 1 = Down (LadderDirectionType::LADDER_DOWN)
-- @return #table The **CNavLadder**'s that have a (one or two way) connection from this **CNavArea** in given direction.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the parent **CNavArea**.
-- @function [parent=#CNavArea] GetParent
-- @param  self
-- @return #CNavArea The parent **CNavArea**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns how this **CNavArea** is connected to its parent.
-- @function [parent=#CNavArea] GetParentHow
-- @param  self
-- @return #number See **NavTraverseType\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the Place of the nav area.
-- @function [parent=#CNavArea] GetPlace
-- @param  self
-- @return #string The place of the nav area, or no value if it doesn't have a place set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a random **CNavArea** that has an outgoing (one or two way) connection
-- from this **CNavArea** in given direction.
-- @function [parent=#CNavArea] GetRandomAdjacentAreaAtSide
-- @param  self
-- @param  #number navDir The direction, in which to look for **CNavArea**'s, see **NavDir\_ Enums**.
-- @return #CNavArea The random **CNavArea** that has an outgoing (one or two way) connection from this **CNavArea** in given direction, if any.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a random point on the nav area.
-- @function [parent=#CNavArea] GetRandomPoint
-- @param  self
-- @return #Vector The random point on the nav area.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the width this Nav Area.
-- @function [parent=#CNavArea] GetSizeX
-- @param  self
-- @return #number The area's width.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the height of this Nav Area.
-- @function [parent=#CNavArea] GetSizeY
-- @param  self
-- @return #number The area's height.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the total cost when passing from starting area to the goal area
-- through this node. Set by **CNavArea:SetTotalCost**.
-- @function [parent=#CNavArea] GetTotalCost
-- @param  self
-- @return #number The total cost.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the elevation of this Nav Area at the given position.
-- @function [parent=#CNavArea] GetZ
-- @param  self
-- @param  #Vector pos The position to get the elevation from, the z value from this position is ignored and only the X and Y values are used to this task.
-- @return #number The elevation.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if the given **CNavArea** has this attribute flag set.
-- @function [parent=#CNavArea] HasAttributes
-- @param  self
-- @param  #number attribs Attribute mask to check for, see **NAV\_MESH\_ Enums**.
-- @return #boolean True if the **CNavArea** matches the given mask. False otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#CNavArea] IsBlocked
-- @param  self
-- @param  #number teamID
-- @param  #boolean ignoreNavBlockers _(Default: false)_
-- @return #boolean

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this node is in the Closed List.
-- @function [parent=#CNavArea] IsClosed
-- @param  self
-- @return #boolean Whether this node is in the Closed List.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this **CNavArea** has an outgoing (one or two way) connection to
-- given **CNavArea**. See **CNavArea:IsConnectedAtSide** for a function that only
-- checks for outgoing connections in one direction.
-- @function [parent=#CNavArea] IsConnected
-- @param  self
-- @param  #CNavArea navArea The **CNavArea** to test against.
-- @return #boolean Whether this **CNavArea** has an outgoing (one or two way) connection to given **CNavArea**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this **CNavArea* has an outgoing (one or two way) connection to
-- given **CNavArea** in given direction. See **CNavArea:IsConnected** for a function
-- that checks all sides.
-- @function [parent=#CNavArea] IsConnectedAtSide
-- @param  self
-- @param  #CNavArea navArea The **CNavArea** to test against.
-- @param  #number navDirType The direction, in which to look for the connection. See **NavDir\_ Enums**
-- @return #boolean Whether this **CNavArea** has an outgoing (one or two way) connection to given **CNavArea** in given direction.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this Nav Area is in the same plane as the given one.
-- @function [parent=#CNavArea] IsCoplanar
-- @param  self
-- @param  #CNavArea navArea The Nav Area to test.
-- @return #boolean Whether we're coplanar or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this Nav Area is flat within the tolerance of the
-- nav_coplanar_slope_limit_displacement and nav_coplanar_slope_limit convars.
-- @function [parent=#CNavArea] IsFlat
-- @param  self
-- @return #boolean Whether this **CNavArea** is mostly flat.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this area is in the Open List.
-- @function [parent=#CNavArea] IsOpen
-- @param  self
-- @return #boolean Whether this area is in the Open List.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the Open List is empty or not.
-- @function [parent=#CNavArea] IsOpenListEmpty
-- @param  self
-- @return #boolean Whether the Open List is empty or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns if this position overlaps the Nav Area within the given tolerance.
-- @function [parent=#CNavArea] IsOverlapping
-- @param  self
-- @param  #Vector pos The overlapping position to test.
-- @param  #number tolerance The tolerance of the overlapping, set to 0 for no tolerance. _(Default: 0)_
-- @return #boolean Whether the given position overlaps the Nav Area or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if this **CNavArea** is overlapping the given **CNavArea**.
-- @function [parent=#CNavArea] IsOverlappingArea
-- @param  self
-- @param  #CNavArea navArea The **CNavArea** to test against.
-- @return #boolean True if the given **CNavArea** overlaps this **CNavArea** at any point.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns if we're shaped like a square.
-- @function [parent=#CNavArea] IsRoughlySquare
-- @param  self
-- @return #boolean If we're a square or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Whether this Nav Area is placed underwater.
-- @function [parent=#CNavArea] IsUnderwater
-- @param  self
-- @return #boolean Whether we're underwater or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this **CNavArea** is valid or not.
-- @function [parent=#CNavArea] IsValid
-- @param  self
-- @return #boolean Whether this **CNavArea** is valid or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether we can be seen from the given position.
-- @function [parent=#CNavArea] IsVisible
-- @param  self
-- @param  #Vector pos The position to check.
-- @return #boolean Whether we can be seen or not, and if we can be seen, this is returned with either the center or one of the corners of the Nav Area.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Drops a corner or all corners of a **CNavArea** to the ground below it.
-- @function [parent=#CNavArea] PlaceOnGround
-- @param  self
-- @param  #number corner The corner(s) to drop, uses **NavCorner\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes a CNavArea from the Open List with the lowest cost to traverse to
-- from the starting node, and returns it.
-- @function [parent=#CNavArea] PopOpenList
-- @param  self
-- @return #CNavArea The **CNavArea** from the Open List with the lowest cost to traverse to from the starting node.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes the given nav area.
-- @function [parent=#CNavArea] Remove
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes this node from the Closed List.
-- @function [parent=#CNavArea] RemoveFromClosedList
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the attributes for given CNavArea.
-- @function [parent=#CNavArea] SetAttributes
-- @param  self
-- @param  #number attribs The attribute bitflag. See **NAV\_MESH\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the position of a corner of a nav area.
-- @function [parent=#CNavArea] SetCorner
-- @param  self
-- @param  #number corner The corner to set, uses **NavCorner\_ Enums**.
-- @param  #Vector position The new position to set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the cost from starting area this area when pathfinding.
-- @function [parent=#CNavArea] SetCostSoFar
-- @param  self
-- @param  #number cost The cost so far.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the new parent of this **CNavArea**.
-- @function [parent=#CNavArea] SetParent
-- @param  self
-- @param  #CNavArea parent The new parent to set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the Place of the nav area. There is a limit of 256 Places per nav file.
-- @function [parent=#CNavArea] SetPlace
-- @param  self
-- @param  #string place Set to "" to remove place from the nav area.
-- @return #boolean Returns true of operation succeeded, false otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the total cost when passing from starting area to the goal area through
-- this node.
-- @function [parent=#CNavArea] SetTotalCost
-- @param  self
-- @param  #number cost The total cost of the path to set. Must be above or equal 0.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Moves this open list to appropriate position based on its **CNavArea:GetTotalCost**
-- compared to the total cost of other areas in the open list.
-- @function [parent=#CNavArea] UpdateOnOpenList
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- An object that represents a ladder for Nextbots.
-- @type CNavLadder

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Connects this ladder to a **CNavArea** with a one way connection. (From this
-- ladder to the target area). See **CNavArea:ConnectTo** for making the connection
-- from area to ladder.
-- @function [parent=#CNavLadder] ConnectTo
-- @param  self
-- @param  #CNavArea area The area this ladder leads to.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Disconnects this ladder from given area in a single direction.
-- @function [parent=#CNavLadder] Disconnect
-- @param  self
-- @param  #CNavArea area The **CNavArea** this to disconnect from.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the bottom most position of the ladder.
-- @function [parent=#CNavLadder] GetBottom
-- @param  self
-- @return #Vector The bottom most position of the ladder.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the bottom area of the **CNavLadder**.
-- @function [parent=#CNavLadder] GetBottomArea
-- @param  self
-- @return #CNavArea The bottom connecting nav area.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns this CNavLadders unique ID.
-- @function [parent=#CNavLadder] GetID
-- @param  self
-- @return #number The unique ID.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the length of the ladder.
-- @function [parent=#CNavLadder] GetLength
-- @param  self
-- @return #number The length of the ladder.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the direction of this **CNavLadder**. (The direction in which players
-- back will be facing if they are looking directly at the ladder)
-- @function [parent=#CNavLadder] GetNormal
-- @param  self
-- @return #Vector The direction of this **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the world position based on given height relative to the ladder.
-- @function [parent=#CNavLadder] GetPosAtHeight
-- @param  self
-- @param  #number height The Z position in world space coordinates.
-- @return #Vector The closest point on the ladder to that height.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the topmost position of the ladder.
-- @function [parent=#CNavLadder] GetTop
-- @param  self
-- @return #Vector The topmost position of the ladder.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the top behind **CNavArea** of the **CNavLadder**.
-- @function [parent=#CNavLadder] GetTopBehindArea
-- @param  self
-- @return #CNavArea The top behind **CNavArea** of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the top forward **CNavArea** of the **CNavLadder**.
-- @function [parent=#CNavLadder] GetTopForwardArea
-- @param  self
-- @return #CNavArea The top forward **CNavArea** of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the top left **CNavArea** of the **CNavLadder**.
-- @function [parent=#CNavLadder] GetTopLeftArea
-- @param  self
-- @return #CNavArea The top left **CNavArea** of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the top right **CNavArea** of the **CNavLadder**.
-- @function [parent=#CNavLadder] GetTopRightArea
-- @param  self
-- @return #CNavArea The top right **CNavArea** of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the width of the ladder in Hammer Units.
-- @function [parent=#CNavLadder] GetWidth
-- @param  self
-- @return #number The width of the ladder in Hammer Units.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this CNavLadder has an outgoing (one or two way) connection
-- to given CNavArea in given direction.
-- @function [parent=#CNavLadder] IsConnectedAtSide
-- @param  self
-- @param  #CNavArea navArea The **CNavArea** to test against.
-- @param  #number navDirType The direction, in which to look for the connection. See **NavDir\_ Enums**.
-- @return #boolean Whether this **CNavLadder** has an outgoing (one or two way) connection to given **CNavArea** in given direction.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this **CNavLadder** is valid or not.
-- @function [parent=#CNavLadder] IsValid
-- @param  self
-- @return #boolean Whether this **CNavLadder** is valid or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes the given nav ladder.
-- @function [parent=#CNavLadder] Remove
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the bottom area of the **CNavLadder**.
-- @function [parent=#CNavLadder] SetBottomArea
-- @param  self
-- @param  #CNavArea area The **CNavArea** to connect to the bottom of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the top behind area of the **CNavLadder**.
-- @function [parent=#CNavLadder] SetTopBehindArea
-- @param  self
-- @param  #CNavArea area The **CNavArea** to connect to the top-back of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the top forward area of the CNavLadder.
-- @function [parent=#CNavLadder] SetTopForwardArea
-- @param  self
-- @param  #CNavArea area The **CNavArea** to connect to the top-front of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the top left area of the **CNavLadder**.
-- @function [parent=#CNavLadder] SetTopLeftArea
-- @param  self
-- @param  #CNavArea area The **CNavArea** to connect to the top-left of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the top right area of the **CNavLadder**.
-- @function [parent=#CNavLadder] SetTopRightArea
-- @param  self
-- @param  #CNavArea area The **CNavArea** to connect to the top-right of the **CNavLadder**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This object represents a .pcf (Orange Box) particle system. Created by
-- **Entity:CreateParticleEffect** and **CreateParticleSystem**.
-- @type CNewParticleEffect

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds a control point to the particle system.
-- 
-- **Note**: _This function will not work if the **CNewParticleEffect:GetOwner**
-- entity is not valid._
-- @function [parent=#CNewParticleEffect] AddControlPoint
-- @param  self
-- @param  #number cpID The control point ID, 0 to 63.
-- @param  #Entity ent The entity to attach the control point to.
-- @param  #number partAttachment See **PATTACH\_ Enums**.
-- @param  #number entAttachment The attachment ID on the entity to attach the particle system to. _(Default: 0)_
-- @param  #Vector offset The offset from the Entity:GetPos of the entity we are attaching this CP to. _(Default: Vector(0, 0, 0))_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- 
-- @function [parent=#CNewParticleEffect] GetAutoUpdateBBox
-- @param  self
-- @return #boolean

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the name of the particle effect this system is set to emit.
-- @function [parent=#CNewParticleEffect] GetEffectName
-- @param  self
-- @return #string The name of the particle effect.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the highest control point number for given particle system.
-- @function [parent=#CNewParticleEffect] GetHighestControlPoint
-- @param  self
-- @return #boolean The highest control point number for given particle system, 0 to 63.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the owner of the particle system, the entity the particle system is
-- attached to.
-- @function [parent=#CNewParticleEffect] GetOwner
-- @param  self
-- @return #Entity The owner of the particle system.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the particle system has finished emitting particles or not.
-- @function [parent=#CNewParticleEffect] IsFinished
-- @param  self
-- @return #boolean Whether the particle system has finished emitting particles or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the particle system is valid or not.
-- @function [parent=#CNewParticleEffect] IsValid
-- @param  self
-- @return #boolean Whether the particle system is valid or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the particle system is intended to be used on a view model.
-- @function [parent=#CNewParticleEffect] IsViewModelEffect
-- @param  self
-- @return #boolean Is intended for view models.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Forces the particle system to render using current rendering context. Can be
-- used to render the particle system in vgui panels, etc. Used in conjunction
-- with **CNewParticleEffect:SetShouldDraw**.
-- @function [parent=#CNewParticleEffect] Render
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Forces the particle system to restart emitting particles.
-- @function [parent=#CNewParticleEffect] Restart
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets a value for given control point.
-- @function [parent=#CNewParticleEffect] SetControlPoint
-- @param  self
-- @param  #number cpID The control point ID, 0 to 63.
-- @param  #Vector value The value to set for given control point.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Essentially makes child control point follow the parent entity.
-- @function [parent=#CNewParticleEffect] SetControlPointEntity
-- @param  self
-- @param  #number child The child control point ID, 0 to 63.
-- @param  #Entity parent The parent entity to follow.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the forward direction for given control point.
-- @function [parent=#CNewParticleEffect] SetControlPointForwardVector
-- @param  self
-- @param  #number cpID The control point ID, 0 to 63.
-- @param  #Vector forward The forward direction for given control point.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the orientation for given control point.
-- @function [parent=#CNewParticleEffect] SetControlPointOrientation
-- @param  self
-- @param  #number cpID The control point ID, 0 to 63.
-- @param  #Vector forward The forward direction for given control point.
-- @param  #Vector right The right direction for given control point.
-- @param  #Vector up The up direction for given control point.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Essentially makes child control point follow the parent control point.
-- @function [parent=#CNewParticleEffect] SetControlPointParent
-- @param  self
-- @param  #number child The child control point ID, 0 to 63.
-- @param  #number parent The parent control point ID, 0 to 63.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the right direction for given control point.
-- @function [parent=#CNewParticleEffect] SetControlPointRightVector
-- @param  self
-- @param  #number cpID The control point ID, 0 to 63.
-- @param  #Vector right The right direction for given control point.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the upward direction for given control point.
-- @function [parent=#CNewParticleEffect] SetControlPointUpVector
-- @param  self
-- @param  #number cpID The control point ID, 0 to 63.
-- @param  #Vector upward The upward direction for given control point.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- 
-- @function [parent=#CNewParticleEffect] SetIsViewModelEffect
-- @param  self
-- @param  #boolean isViewModel

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Forces the particle system to stop automatically rendering. Used in
-- conjunction with **CNewParticleEffect:Render**.
-- @function [parent=#CNewParticleEffect] SetShouldDraw
-- @param  self
-- @param  #boolean should Whether to automatically draw the particle effect or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the sort origin for given particle system. This is used as a helper to
-- determine which particles are in front of which.
-- @function [parent=#CNewParticleEffect] SetSortOrigin
-- @param  self
-- @param  #Vector origin The new sort origin.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Starts the particle emission.
-- @function [parent=#CNewParticleEffect] StartEmission
-- @param  self
-- @param  #boolean infiniteOnly _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stops the particle emission.
-- @function [parent=#CNewParticleEffect] StopEmission
-- @param  self
-- @param  #boolean infiniteOnly _(Default: false)_
-- @param  #boolean removeAllParticles _(Default: false)_
-- @param  #boolean wakeOnStop _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stops particle emission and destroys all particles instantly. Also detaches
-- the particle effect from the entity it was attached to.
-- 
-- **Note**: _This function will work identically to
-- **CNewParticleEffect:StopEmission**( false, true ) if
-- **CNewParticleEffect:GetOwner** entity is not valid._
-- 
-- Consider using **CNewParticleEffect:StopEmission**( false, true ) instead, which
-- has same effect, but doesn't require owner entity, and does't detach the
-- particle system from its entity.
-- @function [parent=#CNewParticleEffect] StopEmissionAndDestroyImmediately
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- List of all possible functions to manipulate Recipient Filters. Can be
-- created with **RecipientFilter**.
-- @type CRecipientFilter

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds all players to the recipient filter.
-- @function [parent=#CRecipientFilter] AddAllPlayers
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds all players that are in the same PAS as this position.
-- @function [parent=#CRecipientFilter] AddPAS
-- @param  self
-- @param  #Vector pos PAS position that players may be able to see.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a player to the recipient filter.
-- @function [parent=#CRecipientFilter] AddPlayer
-- @param  self
-- @param  #Player Player Player to add to the recipient filter.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds all players that are in the same PVS as this position.
-- @function [parent=#CRecipientFilter] AddPVS
-- @param  self
-- @param  #Vector Position PVS position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds all players that are on the given team to the filter.
-- @function [parent=#CRecipientFilter] AddRecipientsByTeam
-- @param  self
-- @param  #number teamid Team index to add players from.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the number of valid players in the recipient filter.
-- @function [parent=#CRecipientFilter] GetCount
-- @param  self
-- @return #number Number of valid players in the recipient filter.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of all valid players currently in the recipient filter.
-- @function [parent=#CRecipientFilter] GetPlayers
-- @param  self
-- @return #table A table of all valid players currently in the recipient filter.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all players from the recipient filter.
-- @function [parent=#CRecipientFilter] RemoveAllPlayers
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all players from the filter that are in Potentially Audible Set for
-- given position.
-- @function [parent=#CRecipientFilter] RemovePAS
-- @param  self
-- @param  #Vector position The position to test.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes the player from the recipient filter.
-- @function [parent=#CRecipientFilter] RemovePlayer
-- @param  self
-- @param  #Player Player The player that should be in the recipient filter if you call this function.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all players that can see this PVS from the recipient filter.
-- @function [parent=#CRecipientFilter] RemovePVS
-- @param  self
-- @param  #Vector pos Position that players may be able to see.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all players that are on the given team from the filter.
-- @function [parent=#CRecipientFilter] RemoveRecipientsByTeam
-- @param  self
-- @param  #number teamid Team index to remove players from.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all players that are not on the given team from the filter.
-- @function [parent=#CRecipientFilter] RemoveRecipientsNotOnTeam
-- @param  self
-- @param  #number teamid Team index.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- CSEnt is a client-side only entity which can be created with **ClientsideModel**,
-- **ClientsideRagdoll**, **ClientsideScene**, and **ents.CreateClientProp**.
-- Its base class is Entity so it inherits all of the Client and Shared
-- functions used by Entity.
-- @type CSEnt
-- @extends Entity

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Removes the clientside entity.
-- @function [parent=#CSEnt] Remove
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- CSoundPatch class. Created with **CreateSound**.
-- @type CSoundPatch

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adjust the pitch, alias the speed at which the sound is being played. This
-- invokes the **GM:EntityEmitSound**.
-- @function [parent=#CSoundPatch] ChangePitch
-- @param  self
-- @param  #number pitch The pitch can range from 0-255.
-- @param  #number deltaTime The time to fade from previous to the new pitch. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adjusts the volume of the sound played. Appears to only work while the sound
-- is being played.
-- @function [parent=#CSoundPatch] ChangeVolume
-- @param  self
-- @param  #number volume The volume ranges from 0 to 1.
-- @param  #number deltaTime Time to fade the volume from previous to new value from. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Fades out the volume of the sound from the current volume to 0 in the given
-- amount of seconds.
-- @function [parent=#CSoundPatch] FadeOut
-- @param  self
-- @param  #number seconds Fade time.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the Digital Signal Processor (DSP) effect for the sound.
-- @function [parent=#CSoundPatch] GetDSP
-- @param  self
-- @return #number The DSP effects of the sound.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the current pitch.
-- @function [parent=#CSoundPatch] GetPitch
-- @param  self
-- @return #number The current pitch, can range from 0-255.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the current sound level.
-- @function [parent=#CSoundPatch] GetSoundLevel
-- @param  self
-- @return #number The current sound level, see **SNDLVL\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the current volume.
-- @function [parent=#CSoundPatch] GetVolume
-- @param  self
-- @return #number The current volume, ranging from 0 to 1.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the sound is being played.
-- @function [parent=#CSoundPatch] IsPlaying
-- @param  self
-- @return #boolean Is playing or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Starts to play the sound.
-- @function [parent=#CSoundPatch] Play
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Same as **CSoundPatch:Play** but with 2 extra arguments allowing to set volume
-- and pitch directly.
-- @function [parent=#CSoundPatch] PlayEx
-- @param  self
-- @param  #number volume The volume ranges from 0 to 1.
-- @return #number pitch The pitch can range from 0-255.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the Digital Signal Processor (DSP) effect for the sound. Similar to **Player:SetDSP**.
-- @function [parent=#CSoundPatch] SetDSP
-- @param  self
-- @param  #number dsp The DSP effect to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the sound level in decibel.
-- @function [parent=#CSoundPatch] SetSoundLevel
-- @param  self
-- @param  #number level The sound level in decibel. See **SNDLVL\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stops the sound from being played.
-- @function [parent=#CSoundPatch] Stop
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- A class used to store and modify all the data concerning a damage event. An
-- empty CTakeDamageInfo object can be created with **DamageInfo**.  
-- List of hooks that this object is passed to:
-- 
-- * **ENTITY:OnTakeDamage**
-- * **GM:DoPlayerDeath**
-- * **GM:EntityTakeDamage**
-- * **GM:OnDamagedByExplosion**
-- * **GM:ScaleNPCDamage**
-- * **GM:ScalePlayerDamage**
-- * **NEXTBOT:OnInjured**
-- * **NEXTBOT:OnKilled**
-- * **NEXTBOT:OnOtherKilled**
-- List of functions that use this object:
-- 
-- * **util.BlastDamageInfo**
-- * **Entity:TakeDamageInfo**
-- * **Entity:TakePhysicsDamage**
-- * **Entity:DispatchTraceAttack**
-- @type CTakeDamageInfo

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Increases the damage by damageIncrease.
-- @function [parent=#CTakeDamageInfo] AddDamage
-- @param  self
-- @param  #number damageIncrease The damage to add.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the ammo type used by the weapon that inflicted the damage.
-- @function [parent=#CTakeDamageInfo] GetAmmoType
-- @param  self
-- @return #number Ammo type ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the attacker (character who originated the attack), for example a
-- player or an NPC that shot the weapon.
-- @function [parent=#CTakeDamageInfo] GetAttacker
-- @param  self
-- @return #Entity The attacker.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the initial unmodified by skill level (**game.GetSkillLevel**) damage.
-- @function [parent=#CTakeDamageInfo] GetBaseDamage
-- @param  self
-- @return #number Base Damage.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the total damage.
-- @function [parent=#CTakeDamageInfo] GetDamage
-- @param  self
-- @return #number Damage amount.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the current bonus damage.
-- @function [parent=#CTakeDamageInfo] GetDamageBonus
-- @param  self
-- @return #number Bonus damage.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the custom damage type. This is used by Day of Defeat: Source and Team
-- Fortress 2 for extended damage info, but isn't used in Garry's Mod by default.
-- @function [parent=#CTakeDamageInfo] GetDamageCustom
-- @param  self
-- @return #number The custom damage type.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a vector representing the damage force.
-- @function [parent=#CTakeDamageInfo] GetDamageForce
-- @param  self
-- @return #Vector The damage force.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position where the damage was or is going to be applied to.
-- @function [parent=#CTakeDamageInfo] GetDamagePosition
-- @param  self
-- @return #Vector The damage position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a bit flag which indicates the damage type(s) of the damage. Consider
-- using **CTakeDamageInfo:IsDamageType** instead. Value returned by this function
-- can contain multiple damage types.
-- @function [parent=#CTakeDamageInfo] GetDamageType
-- @param  self
-- @return #number Damage type(s), a combination of **DMG\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the inflicter of the damage. This is not necessarily a weapon. For
-- hitscan weapons this is the weapon. For projectile weapons this is the
-- projectile. For a more reliable method of getting the weapon that damaged an
-- entity, use **GetAttacker** with **GetActiveWeapon**.
-- @function [parent=#CTakeDamageInfo] GetInflictor
-- @param  self
-- @return #Entity The inflicter.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the maximum damage.
-- @function [parent=#CTakeDamageInfo] GetMaxDamage
-- @param  self
-- @return #number The maximum damage.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the initial, unmodified position where the damage occured.
-- @function [parent=#CTakeDamageInfo] GetReportedPosition
-- @param  self
-- @return #Vector Damage's position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the damage was caused by a bullet.
-- @function [parent=#CTakeDamageInfo] IsBulletDamage
-- @param  self
-- @return #boolean Is bullet damage.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the damageinfo contains the damage type specified.
-- @function [parent=#CTakeDamageInfo] IsDamageType
-- @param  self
-- @param  #number dmgType Damage type to test. See **DMG\_ Enums**.
-- @return #boolean Whether this damage contains specified damage type or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the damageinfo contains explosion damage.
-- @function [parent=#CTakeDamageInfo] IsExplosionDamage
-- @param  self
-- @return #boolean Is explosive damage.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the damageinfo contains fall damage.
-- @function [parent=#CTakeDamageInfo] IsFallDamage
-- @param  self
-- @return #boolean Is fall damage.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Scales the damage by the given value.
-- @function [parent=#CTakeDamageInfo] ScaleDamage
-- @param  self
-- @param  #number scale Value to scale the damage with.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Changes the ammo type used by the weapon that inflicted the damage.
-- @function [parent=#CTakeDamageInfo] SetAmmoType
-- @param  self
-- @param  #number ammoType Ammo type ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the attacker (character who originated the attack) of the damage, for
-- example a player or an NPC.
-- @function [parent=#CTakeDamageInfo] SetAttacker
-- @param  self
-- @param  #Entity ent The entity to be set as the attacker.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the amount of damage.
-- @function [parent=#CTakeDamageInfo] SetDamage
-- @param  self
-- @param  #number damage The value to set the absolute damage to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the bonus damage. Bonus damage isn't automatically applied, so this
-- will have no outer effect by default.
-- @function [parent=#CTakeDamageInfo] SetDamageBonus
-- @param  self
-- @param  #number damage The extra damage to be added.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the custom damage type. This is used by Day of Defeat: Source and Team
-- Fortress 2 for extended damage info, but isn't used in Garry's Mod by default.
-- @function [parent=#CTakeDamageInfo] SetDamageCustom
-- @param  self
-- @param  #number DamageType Any integer, can be based on your own custom enums.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the directional force of the damage.
-- @function [parent=#CTakeDamageInfo] SetDamageForce
-- @param  self
-- @param  #Vector force The vector to set the force to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the position of where the damage gets applied to.
-- @function [parent=#CTakeDamageInfo] SetDamagePosition
-- @param  self
-- @param  #Vector pos The position where the damage will be applied.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the damage type.
-- @function [parent=#CTakeDamageInfo] SetDamageType
-- @param  self
-- @param  #number type The damage type, see **DMG\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the inflicter of the damage for example a weapon. For hitscan/bullet
-- weapons this should the weapon. For projectile (rockets, etc) weapons this
-- should be the projectile.
-- @function [parent=#CTakeDamageInfo] SetInflictor
-- @param  self
-- @param  #Entity inflicter The new inflicter.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the maximum damage the object can cause.
-- @function [parent=#CTakeDamageInfo] SetMaxDamage
-- @param  self
-- @param  #number maxDamage Maximum damage value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the origin of the damage.
-- @function [parent=#CTakeDamageInfo] SetReportedPosition
-- @param  self
-- @param  #Vector pos The location of where the damage is originating.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Subtracts the specified amount from the damage.
-- @function [parent=#CTakeDamageInfo] SubtractDamage
-- @param  self
-- @param  #number damage Value to subtract.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- A class used to store the player inputs, such as mouse movement, view angles,
-- **IN\_ Enums** buttons pressed and analog movement, the data from this class is
-- then transfered to a CMoveData during actual movement simulation.
-- Can be modified during **GM:CreateMove**, **GM:StartCommand** and used in read only
-- with **GM:SetupMove** and **Player:GetCurrentCommand**.
-- @type CUserCmd

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes all keys from the command.
-- 
-- **Note**: _If you are looking to affect player movement, you may need to use
-- **CUserCmd:ClearMovement** instead of clearing the buttons._
-- @function [parent=#CUserCmd] ClearButtons
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Clears the movement from the command. See also **CUserCmd:SetForwardMove**,
-- **CUserCmd:SetSideMove** and **CUserCmd:SetUpMove**.
-- @function [parent=#CUserCmd] ClearMovement
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an increasing number representing the index of the user cmd. The
-- value returned is occasionally 0 inside **GM:CreateMove**, so it's advised to
-- check for a non-zero value if you wish to get the correct number.
-- @function [parent=#CUserCmd] CommandNumber
-- @param  self
-- @return #number The command number.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a bitflag indicating which buttons are pressed.
-- @function [parent=#CUserCmd] GetButtons
-- @param  self
-- @return #number Pressed buttons, see **IN\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- The speed the client wishes to move forward with, negative if the clients
-- wants to move backwards.
-- @function [parent=#CUserCmd] GetForwardMove
-- @param  self
-- @return #number The desired speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the current impulse from the client, usually 0.
-- @function [parent=#CUserCmd] GetImpulse
-- @param  self
-- @return #number The impulse.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the scroll delta as whole number.
-- @function [parent=#CUserCmd] GetMouseWheel
-- @param  self
-- @return #number Scroll delta.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the delta of the angular horizontal mouse movement of the player.
-- @function [parent=#CUserCmd] GetMouseX
-- @param  self
-- @return #number X delta.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the delta of the angular vertical mouse movement of the player.
-- @function [parent=#CUserCmd] GetMouseY
-- @param  self
-- @return #number Y delta.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- The speed the client wishes to move sideways with, positive if it wants to
-- move right, negative if it wants to move left.
-- @function [parent=#CUserCmd] GetSideMove
-- @param  self
-- @return #number The sideways move speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- The speed the client wishes to move up with, negative if the clients wants
-- to move down.
-- @function [parent=#CUserCmd] GetUpMove
-- @param  self
-- @return #number The up-down move speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the direction the player is looking in.
-- @function [parent=#CUserCmd] GetViewAngles
-- @param  self
-- @return #Angle The player's looking direction.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- When players are not sending usercommands to the server (often due to lag),
-- their last usercommand will be executed multiple times as a backup. This
-- function returns true if that is happening. This will never return true clientside.
-- @function [parent=#CUserCmd] IsForced
-- @param  self
-- @return #boolean Is forced.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the specified button(s) is pressed.
-- @function [parent=#CUserCmd] KeyDown
-- @param  self
-- @param  #number key Bit flag representing which button to check, see **IN\_ Enums**.
-- @return #boolean Is key down or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removed a key bit from the current key bit flag.
-- @function [parent=#CUserCmd] RemoveKey
-- @param  self
-- @param  #number button Bit flag to be removed from the key bit flag, see **IN\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Forces the associated player to select a weapon. This is used internally in
-- the default HL2 weapon selection HUD. This may not work immediately if the
-- current command is in prediction. Use **input.SelectWeapon** to switch the
-- weapon from the client when the next available command can do so.
-- 
-- **Note**: _This is the ideal function to use to create a custom weapon
-- selection HUD, as it allows prediction to run properly for **Weapon:Deploy**
-- and **GM:PlayerSwitchWeapon**._
-- @function [parent=#CUserCmd] SelectWeapon
-- @param  self
-- @param  #Weapon weapon The weapon entity to select.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the buttons as a bit flag. See also **CUserCmd:GetButtons**.
-- 
-- **Note**: _If you are looking to affect player movement, you may need to use
-- **CUserCmd:SetForwardMove** instead of setting the keys._
-- @function [parent=#CUserCmd] SetButtons
-- @param  self
-- @param  #number buttons Bit flag representing which buttons are "down", see **IN\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets speed the client wishes to move forward with, negative if the clients
-- wants to move backwards. See also **CUserCmd:ClearMovement**,
-- **CUserCmd:SetSideMove** and **CUserCmd:SetUpMove**.
-- @function [parent=#CUserCmd] SetForwardMove
-- @param  self
-- @param  #number speed The new speed to request.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the impulse command to be sent to the server. For example, 101 is an
-- impulse that will give the player all Half-Life 2 weapons with sv_cheats set
-- to 1. Impulse 100 will toggle their flashlight.
-- @function [parent=#CUserCmd] SetImpulse
-- @param  self
-- @param  #number speed The impulse to send.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the scroll delta.
-- @function [parent=#CUserCmd] SetMouseWheel
-- @param  self
-- @param  #number speed The scroll delta.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the delta of the angular horizontal mouse movement of the player. See
-- also **CUserCmd:SetMouseY**.
-- @function [parent=#CUserCmd] SetMouseX
-- @param  self
-- @param  #number speed Angular horizontal move delta.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the delta of the angular vertical mouse movement of the player. See
-- also **CUserCmd:SetMouseX**.
-- @function [parent=#CUserCmd] SetMouseY
-- @param  self
-- @param  #number speed Angular vertical move delta.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets speed the client wishes to move sidewards with, positive to move right,
-- negative to move left. See also **CUserCmd:SetForwardMove** and **CUserCmd:SetUpMove**.
-- @function [parent=#CUserCmd] SetSideMove
-- @param  self
-- @param  #number speed The new speed to request.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets speed the client wishes to move upwards with, negative to move down.
-- See also **CUserCmd:SetSideMove** and **CUserCmd:SetForwardMove**.
-- @function [parent=#CUserCmd] SetUpMove
-- @param  self
-- @param  #number speed The new speed to request.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the direction the client wants to move in.
-- 
-- **Note**: _The pitch (vertical) angle should be clamped to +/- 89° to
-- prevent the player's view from glitching._
-- @function [parent=#CUserCmd] SetViewAngles
-- @param  self
-- @param  #Angle viewAngle New view angles.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns tick count since joining the server.
-- 
-- **Note**: _This will always return 0 for bots._
-- 
-- **Note**: _Returns 0 clientside during prediction calls. If you are trying
-- to use **CUserCmd:Set\***() on the client in a movement or command hook, keep
-- doing so till **TickCount** returns a non-zero number to maintain prediction._
-- @function [parent=#CUserCmd] TickCount
-- @param  self
-- @return #number The amount of ticks passed since joining the server.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- An object returned by **GetConVar**. It represents a console variable.
-- @type ConVar

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Tries to convert the current string value of a **ConVar** to a boolean.
-- @function [parent=#ConVar] GetBool
-- @param  self
-- @return #boolean The boolean value of the console variable.
-- If the variable is numeric and not 0, the result will be true. Otherwise the result will be false.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the default value of the **ConVar**.
-- @function [parent=#ConVar] GetDefault
-- @param  self
-- @return #string The default value of the console variable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Attempts to convert the **ConVar** value to a float.
-- @function [parent=#ConVar] GetFloat
-- @param  self
-- @return #number The float value of the console variable.
-- If the value cannot be converted to a float, it will return 0.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the help text assigned to that convar.
-- @function [parent=#ConVar] GetHelpText
-- @param  self
-- @return #string The help text.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Attempts to convert the **ConVar** value to a integer.
-- @function [parent=#ConVar] GetInt
-- @param  self
-- @return #number The integer value of the console variable.
-- If it fails to convert to an integer, it will return 0.
-- All float/decimal values will be rounded down. (with math.floor)

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the name of the **ConVar**.
-- @function [parent=#ConVar] GetName
-- @param  self
-- @return #string The name of the console variable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the current **ConVar** value as a string.
-- @function [parent=#ConVar] GetString
-- @param  self
-- @return #string The current console variable value as a string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a ConVar's value to 1 or 0 based on the input boolean. This can only be
-- ran on **ConVars** created from within Lua.
-- @function [parent=#ConVar] SetBool
-- @param  self
-- @param  #boolean value Value to set the ConVar to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a ConVar's value to to the input number. This can only be ran on
-- ConVars created from within Lua.
-- @function [parent=#ConVar] SetFloat
-- @param  self
-- @param  #number value Value to set the ConVar to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a ConVar's value to the input number after converting it to an integer.
-- This can only be ran on ConVars created from within Lua.
-- @function [parent=#ConVar] SetInt
-- @param  self
-- @param  #number value Value to set the ConVar to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a ConVar's value to the input string. This can only be ran on ConVars
-- created from within Lua.
-- @function [parent=#ConVar] SetString
-- @param  self
-- @param  #string value Value to set the ConVar to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This is a list of all available methods for entites, which includes Players,
-- Weapons, NPCs and Vehicles.
-- @type Entity

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Activates the entity. This needs to be used on some entities (like
-- constraints) after being spawned.
-- 
-- **Note**: _For some entity types when this function is used after
-- **Entity:SetModelScale**, the physics object will be recreated with the new
-- scale. Source-sdk-2013_
-- @function [parent=#Entity] Activate
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Add a callback function to a specific event. This is used instead of hooks
-- to avoid calling empty functions unnecessarily. This also allows you to use
-- certain hooks in engine entities (non-scripted entities).
-- 
-- **Warning**: _This method does not check if the function has already been
-- added to this object before, so if you add the same callback twice, it will
-- be run twice! Make sure to add your callback only once._
-- @function [parent=#Entity] AddCallback
-- @param  self
-- @param  #string hook The hook name to hook onto.
-- @param  #function func The function to call.
-- @return #number The callback ID that was just added, which can later be used in **Entity:RemoveCallback**.
-- Returns nothing if the passed callback function was invalid or when asking for a non-existent hook.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Applies an engine effect to an entity.
-- @function [parent=#Entity] AddEffects
-- @param  self
-- @param  #number effect The effect to apply, see **EF\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds engine flags.
-- @function [parent=#Entity] AddEFlags
-- @param  self
-- @param  #number flag Engine flag to add, see **EFL\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds flags to the entity.
-- @function [parent=#Entity] AddFlags
-- @param  self
-- @param  #number flag Flag to add, see **FL\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a gesture animation to the entity and plays it. See
-- **Entity:AddGestureSequence** and **Entity:AddLayeredSequence** for functions that
-- takes sequences instead of **ACT\_ Enums**.
-- 
-- **Note**: _This function only works on BaseAnimatingOverlay entites!_
-- @function [parent=#Entity] AddGesture
-- @param  self
-- @param  #number activity The activity to play as the gesture. See **ACT\_ Enums**.
-- @param  #boolean autokill _(Default: true)_
-- @return #number Layer ID of the started gesture, used to manipulate the played gesture by other functions.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a gesture animation to the entity and plays it. See **Entity:AddGesture**
-- for a function that takes **ACT\_ Enums**. See also **Entity:AddLayeredSequence**.
-- 
-- **Note**: _This function only works on BaseAnimatingOverlay entites!_
-- @function [parent=#Entity] AddGestureSequence
-- @param  self
-- @param  #number sequence The sequence ID to play as the gesture. See **Entity:LookupSequence**.
-- @param  #boolean autokill _(Default: true)_
-- @return #number Layer ID of the started gesture, used to manipulate the played gesture by other functions.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a gesture animation to the entity and plays it. See
-- **Entity:AddGestureSequence** for a function that doesn't take priority. See
-- **Entity:AddGesture** for a function that takes **ACT\_ Enums**.
-- 
-- **Note**: _This function only works on BaseAnimatingOverlay entites!_
-- @function [parent=#Entity] AddLayeredSequence
-- @param  self
-- @param  #number sequence The sequence ID to play as the gesture. See **Entity:LookupSequence**.
-- @param  #number priority
-- @return #number Layer ID of created layer.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds solid flag(s) to the entity.
-- @function [parent=#Entity] AddSolidFlags
-- @param  self
-- @param  #number flags The flag(s) to apply, see **FSOLID\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds a PhysObject to the entity's motion controller so that
-- **ENTITY:PhysicsSimulate** will be called for given PhysObject as well. You must
-- first create a motion controller with **Entity:StartMotionController**. You can
-- remove added PhysObjects by using **Entity:RemoveFromMotionController**.
-- @function [parent=#Entity] AddToMotionController
-- 
-- **Note**: _Only works on a scripted Entity of anim type._
-- @param  self
-- @param  #PhysObj physObj The PhysObj to add to the motion controller.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an angle based on the ones inputted that you can use to align an object.
-- 
-- **Note**: _This function doesn't change the angle of the entity on its own._
-- @function [parent=#Entity] AlignAngles
-- @param  self
-- @param  #Angle from The angle you want to align from.
-- @param  #Angle to The angle you want to align to.
-- @return #Angle The resulting aligned angle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Spawns a clientside ragdoll for the entity, positioning it in place of the
-- original entity, and makes the entity invisible. It doesn't preserve flex
-- values (face posing) as CSRagdolls don't support flex. It does not work on
-- players. Use **Player:CreateRagdoll** instead. The original entity is not
-- removed, and neither are any ragdolls previously generated with this function.
-- To make the entity re-appear, run **Entity:SetNoDraw**(false).
-- @function [parent=#Entity] BecomeRagdollOnClient
-- @param  self
-- @return #CSEnt The created ragdoll.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns true if the entity is being looked at by the local player and is
-- within 256 units of distance.
-- 
-- **Note**: _This function is only available in entities that are based off of
-- sandbox's base_gmodentity._
-- 
-- **Note**: _This function uses **Distance** instead of **DistToSqr** so it may not be
-- suitable in situations where it's called often._
-- @function [parent=#Entity] BeingLookedAtByLocalPlayer
-- @param  self
-- @return #boolean Is the entity being looked at by the local player and within 256 units.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Dispatches blocked events to this entity's blocked handler. This function is
-- only useful when interacting with entities like func_movelinear.
-- @function [parent=#Entity] Blocked
-- @param  self
-- @param  #Entity entity The entity that is blocking us.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a centered vector of this entity, NPCs use this internally to aim at
-- their targets.
-- 
-- **Note**: _This only works on players and NPCs._
-- @function [parent=#Entity] BodyTarget
-- @param  self
-- @param  #Vector origin The vector of where the the attack comes from.
-- @param  #boolean noisy Decides if it should return the centered vector with a random offset to it. _(Default: false)_
-- @return #Vector The centered vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the entity's bone has the flag or not.
-- @function [parent=#Entity] BoneHasFlag
-- @param  self
-- @param  #number boneID Bone ID to test flag of.
-- @param  #number flag The flag to test, see **BONE\_ Enums**.
-- @return #boolean Whether the bone has that flag or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This function takes the boneID and returns the length of it in an unrounded decimal.
-- @function [parent=#Entity] BoneLength
-- @param  self
-- @param  #number boneID The ID of the bone you want the length of. You may
-- want to get the length of the next bone (boneID + 1) for decent results.
-- @return #number The length of the bone.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the distance between the center of the bounding box and the furthest
-- bounding box corner.
-- @function [parent=#Entity] BoundingRadius
-- @param  self
-- @return #number The radius of the bounding box.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Causes a specified function to be run if the entity is removed by any means.
-- This can later be undone by **Entity:RemoveCallOnRemove** if you need it to not run.
-- @function [parent=#Entity] CallOnRemove
-- @param  self
-- @param  #string identifier Identifier of the function within CallOnRemove.
-- @param  #function removeFunc Function to be called on remove.
-- @param  ... Optional arguments to pass to removeFunc.
-- Do note that the first argument passed to the function will always be the entity being removed, and the arguments passed on here start after that.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Resets all pose parameters such as aim_yaw, aim_pitch and rotation.
-- @function [parent=#Entity] ClearPoseParameters
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Declares that the collision rules of the entity have changed, and subsequent
-- calls for **GM:ShouldCollide** with this entity may return a different value
-- than they did previously.
-- 
-- **Warning**: _This function must not be called inside of **GM:ShouldCollide**.
-- Instead, it must be called in advance when the condition is known to change._
-- 
-- **Warning**: _Failure to use this function correctly will result in a crash
-- of the physics engine._
-- @function [parent=#Entity] CollisionRulesChanged
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the entity was created by map or not.
-- @function [parent=#Entity] CreatedByMap
-- @param  self
-- @return #boolean Is created by map?

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a clientside particle system attached to the entity. See also **CreateParticleSystem**.
-- 
-- **Note**: _The particle effect must be precached with **PrecacheParticleSystem**
-- and the file its from must be added via **game.AddParticles** before it can be used!_
-- @function [parent=#Entity] CreateParticleEffect
-- @param  self
-- @param  #string particle The particle name to create.
-- @param  #number attachment Attachment ID to attach the particle to.
-- @param  #table options=nil A table of tables (IDs 1 to 64) having the following structure:
-- 
-- * _#number attachtype_ : The particle attach type. See **PATTACH\_ Enums**. _(Default: PATTACH\_ABSORIGIN)_
-- * _#Entity entity_ : The parent entity? _(Default: NULL)_
-- * _#Vector position_ : The offset position for given control point. _(Default: nil)_
-- This only affects the control points of the particle effects and will do nothing if the effect doesn't use control points.
-- @return #CNewParticleEffect The created particle system.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the shadow of an entity.
-- @function [parent=#Entity] CreateShadow
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Whenever the entity is removed, entityToRemove will be removed also.
-- @function [parent=#Entity] DeleteOnRemove
-- @param  self
-- @param  #Entity entityToRemove The entity to be removed.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Removes the shadow for the entity. The shadow will be recreated as soon as
-- the entity wakes. Doesn't affect shadows from flashlight/lamps/env_projectedtexture.
-- @function [parent=#Entity] DestroyShadow
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Disables an active matrix.
-- @function [parent=#Entity] DisableMatrix
-- @param  self
-- @param  #string matrixType The name of the matrix type to disable. The only known matrix type is "RenderMultiply".

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Performs a trace attack.
-- @function [parent=#Entity] DispatchTraceAttack
-- @param  self
-- @param  #CTakeDamageInfo damageInfo The damage to apply.
-- @param  #table traceRes Trace result to use to deal damage. See **TraceResult structure**.
-- @param  #Vector dir Direction of the attack. _(Default: traceRes.HitNormal)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- This removes the argument entity from an ent's list of entities to 'delete
-- on remove'.
-- @function [parent=#Entity] DontDeleteOnRemove
-- @param  self
-- @param  #Entity entityToUnremove The entity to be removed from the list of entities to delete.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the entity or model. If called inside **ENTITY:Draw** or
-- **ENTITY:DrawTranslucent**, it only draws the entity's model itself. If called
-- outside of those hooks, it will call both of said hooks depending on
-- **Entity:GetRenderGroup**, drawing the entire entity again.
-- 
-- **Note**: _When drawing an entity more than once per frame in different
-- positions, you should call **Entity:SetupBones** before each draw; Otherwise,
-- the entity will retain its first drawn position._
-- 
-- **Note**: _This is a rendering function that requires a 3D rendering context.
-- This means that it will only work in hooks with a 3D rendering context._
-- @function [parent=#Entity] DrawModel
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether an entity's shadow should be drawn.
-- @function [parent=#Entity] DrawShadow
-- @param  self
-- @param  #boolean shouldDraw True to enable, false to disable shadow drawing.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Move an entity down until it collides with something.
-- 
-- **Warning**: _The entity needs to already have something below it within 256 units._
-- @function [parent=#Entity] DropToFloor
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Sets up a self.dt.NAME alias for a Data Table variable.
-- 
-- **Warning**: _You should use **Entity:NetworkVar** instead._
-- @function [parent=#Entity] DTVar
-- @param  self
-- @param  #string Type The type of the DTVar being set up. It can be one of the following: 'Int', 'Float', 'Vector', 'Angle', 'Bool', 'Entity' or 'String'.
-- @param  #number ID The ID of the DTVar. Can be between 0 and 3.
-- @param  #string Name Name by which you will refer to DTVar. It must be a valid variable name. (No spaces!)

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Plays a sound on an entity. If run clientside, the sound will only be heard
-- locally. If used on a player or NPC character with the mouth rigged, the
-- character will "lip-sync". This does not work with all sound files. It is
-- recommended to use sound scripts (see sound.Add) over direct file paths.
-- This will allow you to use **Entity:StopSound** to stop the played sound scripts.
-- @function [parent=#Entity] EmitSound
-- @param  self
-- @param  #string soundName The name of the sound to be played.
-- 
-- **Warning**: _The string will cannot have whitespace at the start or end. You can remove this with **string.Trim**._
-- @param  #number soundLevel A modifier for the distance this sound will reach, acceptable range is 0 to 511. 100 means no adjustment to the level. _(Default: 75)_
-- See **SNDLVL\_ Enums**. Will not work if a sound script is used.
-- @param  #number pitchPercent The pitch applied to the sound. _(Default: 100)_
-- The acceptable range is from 0 to 255. 100 means the pitch is not changed.
-- @param  #number volume The volume, from 0 to 1. _(Default: 1)_
-- @param  #number channel The sound channel, see **CHAN\_ Enums**. _(Default: CHAN\_AUTO, CHAN\_WEAPON for weapons)_
-- Will not work if a sound script is used.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Toggles the constraints of this ragdoll entity on and off.
-- @function [parent=#Entity] EnableConstraints
-- @param  self
-- @param  #boolean toggleConstraints Set to true to enable the constraints and false to disable them.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Flags an entity as using custom lua defined collisions. Fixes entities
-- having spongy player collisions or not hitting traces, such as after
-- **Entity:PhysicsFromMesh**.
-- @function [parent=#Entity] EnableCustomCollisions
-- @param  self
-- @param  #boolean useCustom True to flag this entity.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Can be used to apply a custom **VMatrix** to the entity, mostly used for scaling
-- the model by a **Vector**. To disable it, use **Entity:DisableMatrix**. If your old
-- scales are wrong due to a recent update, use **Entity:SetLegacyTransform** as a
-- quick fix.
-- 
-- **Note**: _The matrix can also be modified to apply a custom rotation and
-- offset via the **VMatrix:SetAngles** and **VMatrix:SetTranslation** functions._
-- @function [parent=#Entity] EnableMatrix
-- @param  self
-- @param  #string matrixType The name of the matrix type.
-- The only implemented matrix type is "RenderMultiply".
-- @param  #VMatrix matrix The matrix to apply before drawing the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the unique entity index of an entity.
-- 
-- **Note**: _Entity indices are marked as unused after deletion, and can be
-- reused by newly-created entities._
-- @function [parent=#Entity] EntIndex
-- @param  self
-- @return #number The index of the entity.
-- -1 for clientside-only or serverside-only entities.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Extinguishes the entity if it is on fire. Has no effect if called inside
-- EntityTakeDamage. (and the attacker is the flame that's hurting the entity)
-- @function [parent=#Entity] Extinguish
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the direction a player/npc/ragdoll is looking as a world-oriented angle.
-- @function [parent=#Entity] EyeAngles
-- @param  self
-- @return #Angle The entity's eye angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position of an Player/NPC's view, or two vectors for ragdolls (one for
-- each eye).
-- @function [parent=#Entity] EyePos
-- @param  self
-- @return #Vector, #Vector View position of the entity, or the position of the first and second eyes for ragdolls.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Searches for bodygroup with given name.
-- @function [parent=#Entity] FindBodygroupByName
-- @param  self
-- @param  #string name The bodygroup name to search for.
-- @return #number Bodygroup ID, -1 if not found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a transition from the given start and end sequence. This function
-- was only used by HL1 entities and NPCs, before the advent of sequence
-- blending and gestures.
-- @function [parent=#Entity] FindTransitionSequence
-- @param  self
-- @param  #number currentSequence The currently playing sequence.
-- @param  #number goalSequence The goal sequence.
-- @return #number The transition sequence, -1 if not available.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Fires an entity's input. You can find inputs for most entities on the Valve
-- Developer Wiki.
-- @function [parent=#Entity] Fire
-- @param  self
-- @param  #string input The name of the input to fire.
-- @param  #string param The value to give to the input, can also be a number. _(Default: "")_
-- @param  #number delay Delay in seconds before firing. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Fires a bullet. When used in a WEAPON hook such as **Weapon:Think** or
-- **Weapon:PrimaryAttack**, it will use **Player:LagCompensation** internally.
-- 
-- **Note**: _Lag compensation will not work if this function is called in a
-- timer, regardless if the timer was made in a WEAPON hook._
-- @function [parent=#Entity] FireBullets
-- @param  self
-- @param  #table bulletInfo The bullet data to be used. See the **Bullet structure**.
-- @param  #boolean suppressHostEvents Has the effect of encasing the FireBullets call in **SuppressHostEvents**, only works in multiplayer. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Makes an entity follow another entity's bone. Internally this function calls
-- **Entity:SetParent**(parent, boneid) and **Entity:AddEffects**(EF_FOLLOWBONE).
-- 
-- **Note**: _If the entity vibrates, you probably need to run
-- **Entity:SetPredictable**(false) clientside._
-- @function [parent=#Entity] FollowBone
-- @param  self
-- @param  #Entity parent The entity to follow the bone of. _(Default: NULL)_
-- If unset, removes the FollowBone effect.
-- @param  #number boneid The bone to follow.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Forces the Entity to be dropped, when it is being held by a player's
-- gravitygun or physgun.
-- @function [parent=#Entity] ForcePlayerDrop
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Advances the cycle of an animated entity by the given delta. Since cycle is
-- a value between 0 and 1, delta should be as well. Animations that loop will
-- automatically reset the cycle so you don't have to - ones that do not will
-- stop animating once you reach the end of their sequence.
-- @function [parent=#Entity] FrameAdvance
-- @param  self
-- @param  #number delta Amount to advance frame by.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's velocity.
-- 
-- **Note**: _Actually binds to **CBaseEntity::GetLocalVelocity**() which retrieves
-- the velocity of the entity due to its movement in the world from forces such
-- as gravity. Does not include velocity from entity-on-entity collision._
-- @function [parent=#Entity] GetAbsVelocity
-- @param  self
-- @return #Vector The velocity of the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the angles of given entity.
-- @function [parent=#Entity] GetAngles
-- @param  self
-- @return #Angle The angles of the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table containing the number of frames, flags, name, and FPS of an
-- entity's animation ID.
-- 
-- **Note**: _Animation ID is not the same as sequence ID._
-- 
-- **Warning**: _Using an animation ID that is too far out of a model's range
-- of animations can crash the client/server. When there are no animations left
-- in the model the default animation info (animIndex=0) is returned._
-- @function [parent=#Entity] GetAnimInfo
-- @param  self
-- @param  #number animIndex The animation ID to look up.
-- @return #table Information about the animation.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the last time the entity had an animation update. Returns 0 if the
-- entity doesn't animate.
-- @function [parent=#Entity] GetAnimTime
-- @param  self
-- @return #number The last time the entity had an animation update.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the orientation and position of the attachment by its ID, returns
-- nothing if the attachment does not exist.
-- 
-- **Note**: _The update rate of this function is limited by the setting of
-- ENT.AutomaticFrameAdvance for Scripted Entities!_
-- @function [parent=#Entity] GetAttachment
-- @param  self
-- @param  #number attachmentId The internal ID of the attachment.
-- @return #table The angle and position of the attachment. See the **AngPos structure**.
-- Most notably, the table contains the keys "Ang" and "Pos".

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table containing all attachments of the given entitys model.
-- Returns an empty table or nil in case it's model has no attachments.
-- @function [parent=#Entity] GetAttachments
-- @param  self
-- @return #table Attachment data. See **AttachmentData structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's base velocity which is their velocity due to forces
-- applied by other entities. This includes entity-on-entity collision or
-- riding a treadmill.
-- @function [parent=#Entity] GetBaseVelocity
-- @param  self
-- @return #Vector The base velocity of the entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the blood color of this entity. This can be set with **Entity:SetBloodColor**.
-- @function [parent=#Entity] GetBloodColor
-- @param  self
-- @return #number Color from **BLOOD\_COLOR\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the exact value for specific bodygroup of given entity.
-- @function [parent=#Entity] GetBodygroup
-- @param  self
-- @param  #number id The id of bodygroup to get value of. Starts from 0.
-- @return #number Current bodygroup. Starts from 0.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the count of possible values for this bodygroup. This is **not** the
-- maximum value, since the bodygroups start with 0, not 1.
-- @function [parent=#Entity] GetBodygroupCount
-- @param  self
-- @param  #number bodygroup The ID of bodygroup to retrieve count of.
-- @return #number Count of values of passed bodygroup.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the name of specific bodygroup for given entity.
-- @function [parent=#Entity] GetBodygroupName
-- @param  self
-- @param  #number id The id of bodygroup to get the name of.
-- @return #string The name of the bodygroup.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a list of all attachments of the entity.
-- @function [parent=#Entity] GetBodyGroups
-- @param  self
-- @return #table Bodygroups as a table of **BodyGroupData structures** if the entity can have bodygroups.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the value of the bone controller with the specified ID.
-- 
-- **Note**: _This is the precursor of pose parameters, and only works for Half
-- Life 1: Source models supporting it._
-- @function [parent=#Entity] GetBoneController
-- @param  self
-- @param  #number boneID ID of the bone controller. Goes from 0 to 3.
-- @return #number The value set on the bone controller.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the amount of bones in the entity.
-- @function [parent=#Entity] GetBoneCount
-- @param  self
-- @return #number The amount of bones in given entity; -1 on failure.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the matrix (position / rotation transform) of a given bone entity.
-- @function [parent=#Entity] GetBoneMatrix
-- @param  self
-- @param  #number boneID The bone to retrieve matrix of. Bones clientside and serverside will differ
-- @return #VMatrix The matrix. Some entities don't update animation every frame such as prop_physics and won't have accurate bone matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns name of given bone id.
-- @function [parent=#Entity] GetBoneName
-- @param  self
-- @param  #number index ID of bone to lookup name of.
-- @return #string The name of given bone.
-- nil in case we failed or entity doesn't have a model; "__INVALIDBONE__" in case the name cannot be read or the index is out of range.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns parent bone of given bone.
-- @function [parent=#Entity] GetBoneParent
-- @param  self
-- @param  #number bone The bode ID of the bone to get parent of.
-- @return #number Parent bone ID or -1 if we failed for some reason.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position and angle of the given attachment, relative to the world.
-- @function [parent=#Entity] GetBonePosition
-- @param  self
-- @param  #number boneIndex The bone index of the bone to get the position of. See **Entity:LookupBone**.
-- @return #Vector, #Angle The bone's postion and angle relative to the world.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns info about given plane of non-nodraw brush model surfaces of the
-- entity's model. Works on worldspawn as well.
-- @function [parent=#Entity] GetBrushPlane
-- @param  self
-- @param  #number id The index of the plane to get info of. Starts from 0.
-- @return #Vector, #Vector, #number The origin, normal, and distance of the plane.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the amount of planes of non-nodraw brush model surfaces of the
-- entity's model.
-- @function [parent=#Entity] GetBrushPlaneCount
-- @param  self
-- @return #number The amount of brush model planes of the entity's model.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the specified hook callbacks for this entity added with
-- **Entity:AddCallback**. The callbacks can then be removed with **Entity:RemoveCallback**.
-- @function [parent=#Entity] GetCallbacks
-- @param  self
-- @param  #string hook The hook to retrieve the callbacks from, see **Entity Callbacks** for the possible hooks.
-- @return #table A table containing the callbackid and function of all the callbacks for the specified hook.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns ids of child bones of given bone.
-- @function [parent=#Entity] GetChildBones
-- @param  self
-- @param  #number boneid Bone id to lookup children of.
-- @return #table A table of bone ids.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the children of the entity - that is, every entity whose move parent is
-- this entity.
-- 
-- **Note**: _This function returns Entity:SetMoveParent children, NOT **Entity:SetParent**!_
-- _**Entity:SetParent** however also calls **Entity:SetMoveParent**._
-- _This means that some entities in the returned list might have a NULL **Entity:GetParent**._
-- _This also means that using this function on players will return their weapons on the client but not the server._
-- @function [parent=#Entity] GetChildren
-- @param  self
-- @return #table A list of movement children entities.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the classname of a entity. This is often the name of the Lua file or
-- folder containing the files for the entity.
-- @function [parent=#Entity] GetClass
-- @param  self
-- @return #string The entity's classname.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an entity's collision bounding box. In most cases, this will return
-- the same bounding box as **Entity:GetModelBounds** unless the entity does not
-- have a physics mesh or it has a PhysObj different from the default.
-- @function [parent=#Entity] GetCollisionBounds
-- @param  self
-- @return #Vector, #Vector The minimum and maximum collision bounds.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's collision group.
-- @function [parent=#Entity] GetCollisionGroup
-- @param  self
-- @return #number The collision group. See **COLLISION\_GROUP\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the color the entity is set to.
-- @function [parent=#Entity] GetColor
-- @param  self
-- @return #table The color of the entity as a **Color structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the two entities involved in a constraint ent, or nil if the entity
-- is not a constraint.
-- @function [parent=#Entity] GetConstrainedEntities
-- @param  self
-- @return #Entity, #Entity The 2 colliding entities.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the two entities physobjects involved in a constraint ent, or no
-- value if the entity is not a constraint.
-- @function [parent=#Entity] GetConstrainedPhysObjects
-- @param  self
-- @return #PhysObj, #PhysObj The 2 colliding entities.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns entity's creation ID. Unlike **Entity:EntIndex** or **Entity:MapCreationID**,
-- it will always increase and old values won't be reused.
-- @function [parent=#Entity] GetCreationID
-- @param  self
-- @return #number The creation ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the time the entity was created on, relative to **CurTime**.
-- @function [parent=#Entity] GetCreationTime
-- @param  self
-- @return #number The time the entity was created on.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gets the creator of the SENT.
-- @function [parent=#Entity] GetCreator
-- @param  self
-- @return #Player The creator, NULL for no creator.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether this entity uses custom collision check set by **Entity:SetCustomCollisionCheck**.
-- @function [parent=#Entity] GetCustomCollisionCheck
-- @param  self
-- @return #boolean Whether this entity uses custom collision check or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the frame of the currently played sequence. This will be a number
-- between 0 and 1 as a representation of sequence progress.
-- @function [parent=#Entity] GetCycle
-- @param  self
-- @return #number The frame of the currently played sequence.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Get an angle stored in the
-- datatable of the entity.
-- @function [parent=#Entity] GetDTAngle
-- @param  self
-- @param  #number key Goes from 0 to 63. Specifies what key to grab from datatable.
-- @return #Angle Requested angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Get a boolean stored in the
-- datatable of the entity.
-- @function [parent=#Entity] GetDTBool
-- @param  self
-- @param  #number key Goes from 0 to 63. Specifies what key to grab from datatable.
-- @return #boolean Requested boolean.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Returns an entity stored in
-- the datatable of the entity.
-- @function [parent=#Entity] GetDTEntity
-- @param  self
-- @param  #number key Goes from 0 to 63. Specifies what key to grab from datatable.
-- @return #Entity Requested entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Get a float stored in the
-- datatable of the entity.
-- @function [parent=#Entity] GetDTFloat
-- @param  self
-- @param  #number key Goes from 0 to 63. Specifies what key to grab from datatable.
-- @return #number Requested float.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Get an integer stored in
-- the datatable of the entity.
-- @function [parent=#Entity] GetDTInt
-- @param  self
-- @param  #number key Goes from 0 to 63. Specifies what key to grab from datatable.
-- @return #number 32-bit signed integer.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Get a string stored in the
-- datatable of the entity.
-- @function [parent=#Entity] GetDTString
-- @param  self
-- @param  #number key Goes from 0 to 3. Specifies what key to grab from datatable.
-- @return #string Requested string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Get a vector stored in the
-- datatable of the entity.
-- @function [parent=#Entity] GetDTVector
-- @param  self
-- @param  #number key Goes from 0 to 63. Specifies what key to grab from datatable.
-- @return #Vector Requested vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a bit flag of all engine effect flags of the entity.
-- @function [parent=#Entity] GetEffects
-- @param  self
-- @return #number Engine effect flags, see **EF\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a bit flag of all engine flags of the entity.
-- @function [parent=#Entity] GetEFlags
-- @param  self
-- @return #number Engine flags, see **EFL\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the elasticity of this entity, used by some flying entities such as
-- the Helicopter NPC to determine how much it should bounce around when colliding.
-- @function [parent=#Entity] GetElasticity
-- @param  self
-- @return #number The entity's elasticity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns all flags of given entity.
-- @function [parent=#Entity] GetFlags
-- @param  self
-- @return #number Flags of given entity as a bitflag, see **FL\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns acceptable value range for the flex.
-- @function [parent=#Entity] GetFlexBounds
-- @param  self
-- @param  #number flex The ID of the flex to look up bounds of.
-- @return #number, #number The minimum and maximum value for this flex.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the ID of the flex based on given name.
-- @function [parent=#Entity] GetFlexIDByName
-- @param  self
-- @param  #string name The name of the flex to get the ID of. Case sensitive.
-- @return #number The ID of flex, nil if no flex with given name was found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns flex name.
-- @function [parent=#Entity] GetFlexName
-- @param  self
-- @param  #number id The flex id to look up name of.
-- @return #string The flex name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the number of flexes this entity has.
-- @function [parent=#Entity] GetFlexNum
-- @param  self
-- @return #number The number of flexes.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the flex scale of the entity.
-- @function [parent=#Entity] GetFlexScale
-- @param  self
-- @return #number The flex scale.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns current weight (value) of the flex.
-- @function [parent=#Entity] GetFlexWeight
-- @param  self
-- @param  #number flex The ID of the flex to get weight of.
-- @return #number The current weight of the flex.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the forward vector of the entity, as a normalized direction vector.
-- @function [parent=#Entity] GetForward
-- @param  self
-- @return #Vector The forward direction.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns how much friction an entity has. Entities default to 1 (100%) and
-- can be higher or even negative.
-- @function [parent=#Entity] GetFriction
-- @param  self
-- @return #number Entity's friction.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the gravity multiplier of the entity.
-- @function [parent=#Entity] GetGravity
-- @param  self
-- @return #number Entity's gravity multiplier.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the object the entity is standing on.
-- @function [parent=#Entity] GetGroundEntity
-- @param  self
-- @return #Entity The ground entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the entity's ground speed velocity, which is based on the entity's
-- walk/run speed and/or the ground speed of their sequence (**Entity:GetSequenceGroundSpeed**).
-- Will return an empty Vector if the entity isn't moving on the ground.
-- @function [parent=#Entity] GetGroundSpeedVelocity
-- @param  self
-- @return #Vector The ground speed velocity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the bone the hit box is attached to.
-- @function [parent=#Entity] GetHitBoxBone
-- @param  self
-- @param  #number hitbox The number of the hit box.
-- @param  #number group The number of the hit box group. This should be 0 in most cases.
-- Numbering for these groups start from 0. The total group count can be found with **Entity:GetHitBoxGroupCount**.
-- @return #number The number of the bone. Will be nil if the hit box index was out of range.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the bounds (min and max corners) of a hit box.
-- @function [parent=#Entity] GetHitBoxBounds
-- @param  self
-- @param  #number hitbox The number of the hit box.
-- @param  #number group The group of the hit box. This should be 0 in most cases.
-- @return #Vector, #Vector The hitbox mins and maxs, either will be nil if the index was out of range.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets how many hit boxes are in a given hit box group.
-- @function [parent=#Entity] GetHitBoxCount
-- @param  self
-- @param  #number group The number of the hit box group.
-- @return #number The number of hit boxes.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the number of hit box groups that an entity has.
-- @function [parent=#Entity] GetHitBoxGroupCount
-- @param  self
-- @return #number Number of hit box groups.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns entity's current hit box set.
-- @function [parent=#Entity] GetHitboxSet
-- @param  self
-- @return #number, #string The current hit box set id and name, both will be nil if the entity doesn't have hit boxes.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the amount of hitbox sets in the entity.
-- @function [parent=#Entity] GetHitboxSetCount
-- @param  self
-- @return #number The amount of hitbox sets in the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- An interface for accessing internal key values on entities. This function
-- returns variables created with **DEFINE\_KEYFIELD** in C++ entities.
-- @function [parent=#Entity] GetInternalVariable
-- @param  self
-- @param  #string VariableName Name of variable corresponding to an entity save value.
-- @return #any The internal variable value.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table containing all key values the entity has.
-- 
-- **Note**: _This only includes engine defined key values. "targetname" is not
-- an actual key value in-engine, use **Entity:GetName** for that instead. For
-- custom key values, use **GM:EntityKeyValue** or **ENTITY:KeyValue** to capture and
-- store them._
-- @function [parent=#Entity] GetKeyValues
-- @param  self
-- @return #table A table of key values.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the animation cycle/frame for given layer.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] GetLayerCycle
-- @param  self
-- @param  #number layerID The Layer ID.
-- @return #number The animation cycle/frame for given layer.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the duration of given layer.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] GetLayerDuration
-- @param  self
-- @param  #number layerID The Layer ID.
-- @return #number The duration of the layer.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current weight of the layer.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] GetLayerWeight
-- @param  self
-- @param  #number layerID The Layer ID.
-- @return #number The current weight of the layer.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the rotation of the entity relative to its parent entity.
-- @function [parent=#Entity] GetLocalAngles
-- @param  self
-- @return #Angle Relative angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the non-VPhysics angular velocity of the entity relative to its
-- parent entity.
-- @function [parent=#Entity] GetLocalAngularVelocity
-- @param  self
-- @return #Angle The velocity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns entity's position relative to it's parent.
-- @function [parent=#Entity] GetLocalPos
-- @param  self
-- @return #Vector Relative position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the entity's angle manipulation of the given bone. This is relative to
-- the default angle, so the angle is zero when unmodified.
-- @function [parent=#Entity] GetManipulateBoneAngles
-- @param  self
-- @param  #number boneID The bone's ID.
-- @return #Angle The entity's angle manipulation of the given bone.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the jiggle amount of the entity's bone. Seems to be broken.
-- @function [parent=#Entity] GetManipulateBoneJiggle
-- @param  self
-- @param  #number boneID The bone ID.
-- @return #number Returns a value ranging from 0 to 255 depending on the value set with **Entity:ManipulateBoneJiggle**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the entity's position manipulation of the given bone. This is relative
-- to the default position, so it is zero when unmodified.
-- @function [parent=#Entity] GetManipulateBonePosition
-- @param  self
-- @param  #number boneId The bone's ID.
-- @return #Vector The entity's position manipulation of the given bone.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the entity's scale manipulation of the given bone. Normal scale is Vector(1,1,1).
-- @function [parent=#Entity] GetManipulateBoneScale
-- @param  self
-- @param  #number boneID The bone's ID.
-- @return #Vector The entity's scale manipulation of the given bone.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the material override for this entity. Returns an empty string if no
-- material override exists. Use **Entity:GetMaterials** to list it's default materials.
-- @function [parent=#Entity] GetMaterial
-- @param  self
-- @return #string Entity's current material.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns all materials of the entity's model. This function is unaffected by
-- **Entity:SetSubMaterial** as it returns the original materials.
-- @function [parent=#Entity] GetMaterials
-- @param  self
-- @return #table A table containing full paths to the materials of the model.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the surface material of this entity.
-- @function [parent=#Entity] GetMaterialType
-- @param  self
-- @return #number Surface material. See **MAT\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the max health that the entity was given. It can be set via **Entity:SetMaxHealth**.
-- @function [parent=#Entity] GetMaxHealth
-- @param  self
-- @return #number Max health.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the model of given entity.
-- 
-- **Note**: _This does not necessarily return the model's path, as is the case
-- for brush and virtual models._
-- @function [parent=#Entity] GetModel
-- @param  self
-- @return #string The entity's model. Will be a filesystem path for most models.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's model bounds. This is different than the collision
-- bounds/hull. This is not scaled with **Entity:SetModelScale**, and will return
-- the model's original, unmodified mins and maxs.
-- @function [parent=#Entity] GetModelBounds
-- @param  self
-- @return #Vector, #Vector The minimum and maximum vectors of the bounds.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the physics bone count of the entity's model. This is only applicable
-- to ragdoll models and only to "anim" type Scripted Entities.
-- @function [parent=#Entity] GetModelPhysBoneCount
-- @param  self
-- @return #number How many physics bones exist on the model.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the models radius.
-- @function [parent=#Entity] GetModelRadius
-- @param  self
-- @return #number The radius of the model.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's model render bounds. By default this will return the
-- same bounds as **Entity:GetModelBounds**.
-- @function [parent=#Entity] GetModelRenderBounds
-- @param  self
-- @return #Vector, #Vector The minimum and maximum vectors of the bounds.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the selected entity's model scale.
-- @function [parent=#Entity] GetModelScale
-- @param  self
-- @return #number Scale of that entity's model.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the amount a momentary_rot_button entity is turned based on the given
-- angle. 0 meaning completely turned closed, 1 meaning completely turned open.
-- @function [parent=#Entity] GetMomentaryRotButtonPos
-- @param  self
-- @param  #Angle turnAngle The angle of rotation to compare - usually should be **Entity:GetAngles**.
-- @return #number The amount the momentary_rot_button is turned, ranging from 0 to 1, or nil if the entity is not a momentary_rot_button.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the move collide type of the entity. The move collide is the way a
-- physics object reacts to hitting an object - will it bounce, slide?
-- @function [parent=#Entity] GetMoveCollide
-- @param  self
-- @return #number The move collide type, see **MOVECOLLIDE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the movement parent of this entity.
-- @function [parent=#Entity] GetMoveParent
-- @param  self
-- @return #Entity The movement parent of this entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's movetype
-- @function [parent=#Entity] GetMoveType
-- @param  self
-- @return #number Move type. See **MOVETYPE\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the mapping name of this entity.
-- @function [parent=#Entity] GetName
-- @param  self
-- @return #string The name of the Entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets networked origin for entity.
-- @function [parent=#Entity] GetNetworkOrigin
-- @param  self
-- @return #Vector The entity's networked origin.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the entity's rendering and transmitting has been disabled.
-- 
-- **Note**: _This is equivalent to calling **Entity:IsEffectActive**(EF\_NODRAW)._
-- @function [parent=#Entity] GetNoDraw
-- @param  self
-- @return #boolean Whether the entity's rendering and transmitting has been disabled.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the body group count of the entity.
-- @function [parent=#Entity] GetNumBodyGroups
-- @param  self
-- @return #number Amount of bodygroups the entitys model has.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the number of pose parameters this entity has.
-- @function [parent=#Entity] GetNumPoseParameters
-- @param  self
-- @return #number Amount of pose parameters the entity has.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a networked angle value at specified index on the entity that is
-- set by **Entity:SetNWAngle**.
-- @function [parent=#Entity] GetNWAngle
-- @param  self
-- @param  #string key The key that is associated with the value.
-- @param  #any fallback The value to return if we failed to retrieve the value. (If it isn't set) _(Default: Angle(0,0,0))_
-- @return #Angle The retrieved value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a networked boolean value at specified index on the entity that is
-- set by **Entity:SetNWBool**.
-- @function [parent=#Entity] GetNWBool
-- @param  self
-- @param  #string key The key that is associated with the value.
-- @param  #any fallback The value to return if we failed to retrieve the value. (If it isn't set) _(Default: false)_
-- @return #boolean The retrieved value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a networked entity value at specified index on the entity that is
-- set by **Entity:SetNWEntity**.
-- @function [parent=#Entity] GetNWEntity
-- @param  self
-- @param  #string key The key that is associated with the value.
-- @param  #any fallback The value to return if we failed to retrieve the value. (If it isn't set) _(Default: NULL)_
-- @return #Entity The retrieved value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a networked float value at specified index on the entity that is
-- set by **Entity:SetNWFloat**.
-- @function [parent=#Entity] GetNWFloat
-- @param  self
-- @param  #string key The key that is associated with the value.
-- @param  #any fallback The value to return if we failed to retrieve the value. (If it isn't set) _(Default: 0)_
-- @return #number The retrieved value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a networked integer (whole number) value that was previously set
-- by **Entity:SetNWInt**.
-- @function [parent=#Entity] GetNWInt
-- @param  self
-- @param  #string key The key that is associated with the value.
-- @param  #any fallback The value to return if we failed to retrieve the value (If it isn't set). _(Default: 0)_
-- @return #number The stored integer, or the fallback if it doesn't exist.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a networked string value at specified index on the entity that is
-- set by **Entity:SetNWString**.
-- @function [parent=#Entity] GetNWString
-- @param  self
-- @param  #string key The key that is associated with the value.
-- @param  #any fallback The value to return if we failed to retrieve the value. (If it isn't set) _(Default: "")_
-- @return #string The retrieved value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns callback function for given NWVar of this entity.
-- 
-- **Note**: _Currently this function only works for the NW2Var system
-- (accessed by adding a 2 in between NW and Var for most NWVar functions),
-- which will replace the original one at some point in the future._
-- @function [parent=#Entity] GetNWVarProxy
-- @param  self
-- @param  #any key The key of the NWVar to get callback of.
-- @return #function The callback of given NWVar, or nil if not found.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns all the networked variables in an entity.
-- @function [parent=#Entity] GetNWVarTable
-- @param  self
-- @return #table Key-Value table of all networked variables.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a networked vector value at specified index on the entity that is
-- set by **Entity:SetNWVector**.
-- @function [parent=#Entity] GetNWVector
-- @param  self
-- @param  #string key The key that is associated with the value.
-- @param  #any fallback The value to return if we failed to retrieve the value. (If it isn't set) _(Default: Vector(0,0,0))_
-- @return #Vector The retrieved value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the owner entity of this entity.
-- @function [parent=#Entity] GetOwner
-- @param  self
-- @return #Entity The owner entity of this entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the parent entity of this entity.
-- @function [parent=#Entity] GetParent
-- @param  self
-- @return #Entity Entity's parent entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the attachment index of the entity's parent. Returns 0 if the entity
-- is not parented to a specific attachment or if it isn't parented at all.
-- 
-- This is set by second argument of **Entity:SetParent** or the SetParentAttachment input.
-- @function [parent=#Entity] GetParentAttachment
-- @param  self
-- @return #number The parented attachment index.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- If the entity is parented to an entity that has a model with multiple
-- physics objects (like a ragdoll), this is used to retrieve what physics
-- object number the entity is parented to on it's parent.
-- @function [parent=#Entity] GetParentPhysNum
-- @param  self
-- @return #number The physics object id, or nil if the entity has no parent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the entity is persistent or not.
-- @function [parent=#Entity] GetPersistent
-- @param  self
-- @return #boolean True if the entity is set to be persistent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns player who is claiming kills of physics damage the entity deals.
-- @function [parent=#Entity] GetPhysicsAttacker
-- @param  self
-- @param  #number timeLimit The time to check if the entity was still a proper physics attacker.
-- 
-- **Note**: _Some entities such as the Combine Ball disregard the time limit and always return the physics attacker._
-- @return #Player The player. If entity that was set is not a player, it will return NULL entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's physics object, if the entity has physics.
-- @function [parent=#Entity] GetPhysicsObject
-- @param  self
-- @return #PhysObj The entity's physics object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the number of physics objects an entity has. (usually 1 for non-ragdolls)
-- @function [parent=#Entity] GetPhysicsObjectCount
-- @param  self
-- @return #number Number of physics objects.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a specific physics object from an entity with multiple PhysObjects.
-- (like ragdolls) See also **Entity:TranslateBoneToPhysBone**.
-- @function [parent=#Entity] GetPhysicsObjectNum
-- @param  self
-- @param  #number physNum The number corresponding to the PhysObj to grab. Starts at 0.
-- @return #PhysObj The physics object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the playback rate of the main sequence on this entity, with 1.0
-- being the default speed.
-- @function [parent=#Entity] GetPlaybackRate
-- @param  self
-- @return #number The playback rate.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the position of entity in world.
-- @function [parent=#Entity] GetPos
-- @param  self
-- @return #Vector The position of the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the pose parameter value.
-- @function [parent=#Entity] GetPoseParameter
-- @param  self
-- @param  #string name Pose parameter name to look up.
-- @return #number Value of given pose parameter.
-- This value will be from 0 - 1 on the client and from minimum range to maximum range on the server!
-- You'll have to remap this value clientside to **Entity:GetPoseParameterRange**'s returns if you want get the actual pose parameter value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns name of given pose parameter.
-- @function [parent=#Entity] GetPoseParameterName
-- @param  self
-- @param  #number id Id of the pose paremeter.
-- @return #string Name of given pose parameter.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns pose parameter range.
-- @function [parent=#Entity] GetPoseParameterRange
-- @param  self
-- @param  #number id Pose parameter ID to look up.
-- @return #number, #number The minimum and maximum value.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether this entity is predictable or not.
-- See **Entity:SetPredictable** for more information.
-- @function [parent=#Entity] GetPredictable
-- @param  self
-- @return #boolean Whether this entity is predictable or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity which the ragdoll came from. The opposite of **Player:GetRagdollEntity**.
-- @function [parent=#Entity] GetRagdollOwner
-- @param  self
-- @return #Entity The entity who owns the ragdoll.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the entity's render angles, set by **Entity:SetRenderAngles** in a
-- drawing hook.
-- @function [parent=#Entity] GetRenderAngles
-- @param  self
-- @return #Angle The entity's render angles.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns render bounds of the entity. Can be overridden by **Entity:SetRenderBounds**.
-- If the render bounds are not inside players view, the entity will not be drawn!
-- @function [parent=#Entity] GetRenderBounds
-- @param  self
-- @return #number, #number The minimum and maximum vector if the bounds.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns current render FX of the entity.
-- @function [parent=#Entity] GetRenderFX
-- @param  self
-- @return #number The current render FX of the entity. See **kRenderFx\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the render group of the entity.
-- @function [parent=#Entity] GetRenderGroup
-- @param  self
-- @return #number The render group. See **RENDERGROUP\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the render mode of the entity.
-- @function [parent=#Entity] GetRenderMode
-- @param  self
-- @return #number The render Mode. See **RENDERMODE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the entity's render origin, set by **Entity:SetRenderOrigin** in a
-- drawing hook.
-- @function [parent=#Entity] GetRenderOrigin
-- @param  self
-- @param  #
-- @return #Vector The entity's render origin.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the rightward vector of the entity, as a normalized direction vector.
-- @function [parent=#Entity] GetRight
-- @param  self
-- @return #Vector Entity's right direction vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the min and max of the entity's axis-aligned bounding box.
-- @function [parent=#Entity] GetRotatedAABB
-- @param  self
-- @return #Vector, #Vector The minimum and maximum extent of the bounding box.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of save values for an entity. These tables are not the same
-- between the client and the server, and different entities may have different
-- fields. You can get the list different fields an entity has by looking at
-- it's source code (the 2013 SDK can be found online,
-- https://github.com/ValveSoftware/source-sdk-2013). Accessible fields are
-- defined by each **DEFINE\_FIELD** and **DEFINE\_KEYFIELD** inside the **DATADESC** block.  
-- For each **DEFINE\_FIELD**, the save table will have a key with name of first argument.
-- For each **DEFINE\_KEYFIELD**, the save table will have a key with name of the third argument.
-- See **Entity:GetInternalVariable** for only retrieving one key of the save table.
-- @function [parent=#Entity] GetSaveTable
-- @param  self
-- @return #table A table containing all save values in key/value format.
-- The value may be a sequential table (starting with 1) if the field in question is an array in engine.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Return the index of the model sequence that is currently active for the entity.
-- @function [parent=#Entity] GetSequence
-- @param  self
-- @return #number The index of the model sequence.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Return activity id out of sequence id. Opposite of **Entity:SelectWeightedSequence**.
-- @function [parent=#Entity] GetSequenceActivity
-- @param  self
-- @param  #number seq The sequence ID.
-- @return #number The activity ID, see **ACT\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the activity name for the given sequence id.
-- @function [parent=#Entity] GetSequenceActivityName
-- @param  self
-- @param  #number sequenceId The sequence id.
-- @return #string The **ACT\_ Enums** as a string, returns "Not Found!" with an invalid sequence and "No model!" when no model is set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the amount of sequences (animations) the entity's model has.
-- @function [parent=#Entity] GetSequenceCount
-- @param  self
-- @return #number The amount of sequences (animations) the entity's model has.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the ground speed of the entity's sequence.
-- @function [parent=#Entity] GetSequenceGroundSpeed
-- @param  self
-- @param  #number sequenceId The sequence ID.
-- @return #number The ground speed of this sequence.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of information about an entity's sequence.
-- @function [parent=#Entity] GetSequenceInfo
-- @param  self
-- @param  #number sequenceId The sequence id of the entity.
-- @return #table Table of information about the entity's sequence.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a list of all sequences (animations) the model has.
-- @function [parent=#Entity] GetSequenceList
-- @param  self
-- @return #table The list of all sequences (animations) the model has. The indices start with 0!

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns an entity's sequence move distance (the change in position over the
-- course of the entire sequence).
-- @function [parent=#Entity] GetSequenceMoveDist
-- @param  self
-- @param  #number sequenceId The sequence index.
-- @return #number The move distance of the sequence.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the delta movement and angles of a sequence of the entity's model.
-- @function [parent=#Entity] GetSequenceMovement
-- @param  self
-- @param  #number sequenceId The sequence index. See **Entity:GetSequenceName**.
-- @param  #number startCycle The sequence start cycle. 0 is the start of the animation, 1 is the end.
-- @param  #number endCycle The sequence end cycle. 0 is the start of the animation, 1 is the end. Values like 2, etc are allowed.
-- @return #boolen, #Vector, #Angle Value indicating success and the delta origin and angle of animation.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the change in heading direction in between the start and the end of
-- the sequence.
-- @function [parent=#Entity] GetSequenceMoveYaw
-- @param  self
-- @param  #number seq The sequence index. See **Entity:LookupSequence**.
-- @return #number The yaw delta. Returns 99999 for no movement.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Return the name of the sequence for the index provided. Refer to
-- **Entity:GetSequence** to find the current active sequence on this entity.
-- @function [parent=#Entity] GetSequenceName
-- @param  self
-- @param  #number index The index of the sequence to look up.
-- @return #string Name of the sequence.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the entity plays a sound when picked up by a player.
-- @function [parent=#Entity] GetShouldPlayPickupSound
-- @param  self
-- @return #boolean True if it plays the pickup sound, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if entity should create a server ragdoll on death or a client one.
-- @function [parent=#Entity] GetShouldServerRagdoll
-- @param  self
-- @return #boolean Returns true if ragdoll will be created on server, false if on client

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the skin index of the current skin.
-- @function [parent=#Entity] GetSkin
-- @param  self
-- @return #number The entity's skin index.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns solid type of an entity.
-- @function [parent=#Entity] GetSolid
-- @param  self
-- @return #number The solid type. See the **SOLID\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns solid flag(s) of an entity.
-- @function [parent=#Entity] GetSolidFlags
-- @param  self
-- @return #number The flag(s) of the entity, see **FSOLID\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if we should show a spawn effect on this entity.
-- @function [parent=#Entity] GetSpawnEffect
-- @param  self
-- @return #boolean The flag to allow or disallow the spawn effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the bitwise spawn flags used by the entity.
-- @function [parent=#Entity] GetSpawnFlags
-- @param  self
-- @return #number The spawn flags of the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the material override for the given index. Returns "" if no material
-- override exists. Use **Entity:GetMaterials** to list it's default materials.
-- @function [parent=#Entity] GetSubMaterial
-- @param  self
-- @param  #number index The index of the sub material. Acceptable values are from 0 to 31.
-- @return #string The material that overrides this index, if any.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a list of models included into the entity's model in the .qc file.
-- @function [parent=#Entity] GetSubModels
-- @param  self
-- @return #table The list of models included into the entity's model in the .qc file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the table that contains all values saved within the entity.
-- @function [parent=#Entity] GetTable
-- @param  self
-- @return #table Entity's entity table.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the last trace used in the collision callbacks such as
-- **ENTITY:StartTouch**, **ENTITY:Touch** and **ENTITY:EndTouch**.
-- 
-- **Note**: _This returns the last collision trace used, regardless of the entity
-- that caused it. As such, it's only reliable when used in the hooks mentioned above._
-- @function [parent=#Entity] GetTouchTrace
-- @param  self
-- @return #table The **TraceResult structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the TransmitWithParent flag is set or not.
-- @function [parent=#Entity] GetTransmitWithParent
-- @param  self
-- @return #boolean Is the TransmitWithParent flag is set or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns if the entity is unfreezable, meaning it can't be frozen with the
-- physgun. By default props are freezable, so this function will typically
-- return false.
-- @function [parent=#Entity] GetUnFreezable
-- @param  self
-- @return #boolean True if the entity is unfreezable, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the upward vector of the entity, as a normalized direction vector.
-- @function [parent=#Entity] GetUp
-- @param  self
-- @return #Vector Entity's up direction vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a value from entity's **Entity:GetTable**. Set by **Entity:SetVar**.
-- @function [parent=#Entity] GetVar
-- @param  self
-- @param  #any key Key of the value to retrieve.
-- @param  #any default A default value to fallback to if we couldn't retrieve the value from entity. _(Default: nil)_
-- @return #any Retrieved value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's velocity.
-- 
-- **Note**: _Actually binds to **CBaseEntity::GetAbsVelocity**() on the server and
-- **C_BaseEntity::EstimateAbsVelocity**() on the client. This returns the total
-- velocity of the entity and is equal to local velocity + base velocity._
-- @function [parent=#Entity] GetVelocity
-- @param  self
-- @return #Vector The velocity of the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position and angle of the entity as a 3x4 matrix (VMatrix is 4x4
-- so the fourth row goes unused). The first three columns store the angle as a
-- rotation matrix, and the fourth column stores the position vector.
-- @function [parent=#Entity] GetWorldTransformMatrix
-- @param  self
-- @return #VMatrix The position and angle matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Causes the entity to break into its current models gibs, if it has any. You
-- must call **Entity:PrecacheGibs** on the entity before using this function, or
-- it will not create any gibs. If called on server, the gibs will be spawned
-- on the currently connected clients and will not be synchronized. Otherwise
-- the gibs will be spawned only for the client the function is called on.
-- 
-- Note, that this function will not remove or hide the entity it is called on.
-- For more expensive version of this function see **Entity:GibBreakServer**.
-- @function [parent=#Entity] GibBreakClient
-- @param  self
-- @param  #Vector force The force to apply to the created gibs.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Causes the entity to break into its current models gibs, if it has any. You
-- must call **Entity:PrecacheGibs** on the entity before using this function, or
-- it will not create any gibs. The gibs will be spawned on the server and be
-- synchronized with all clients. Note, that this function will not remove or
-- hide the entity it is called on.
-- 
-- **Warning**: _Large numbers of serverside gibs will cause lag. You can avoid
-- this cost by spawning the gibs on the client using **Entity:GibBreakClient**._
-- 
-- **Note**: _Despite existing on client, it doesn't actually do anything on client._
-- @function [parent=#Entity] GibBreakServer
-- @param  self
-- @param  #Vector force The force to apply to the created gibs.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether or not the bone manipulation functions have ever been called
-- on given entity.
-- @function [parent=#Entity] HasBoneManipulations
-- @param  self
-- @return #boolean True if the entity has been bone manipulated, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether or not the the entity has had flex manipulations performed
-- with **Entity:SetFlexWeight** or **Entity:SetFlexScale**.
-- @function [parent=#Entity] HasFlexManipulatior
-- @param  self
-- @return #boolean True if the entity has flex manipulations, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether this entity has the specified spawnflags bits set.
-- @function [parent=#Entity] HasSpawnFlags
-- @param  self
-- @param  #number spawnFlags The spawnflag bits to check, see **SF\_ Enums**.
-- @return #boolean Whether the entity has that spawnflag set or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the position of the head of this entity, NPCs use this internally to
-- aim at their targets.
-- 
-- **Note**: _This only works on players and NPCs._
-- @function [parent=#Entity] HeadTarget
-- @param  self
-- @param  #Vector origin The vector of where the attack comes from.
-- @return #Vector The head position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the health of the entity.
-- @function [parent=#Entity] Health
-- @param  self
-- @return #number The entity's health.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the entity on fire.
-- @function [parent=#Entity] Ignite
-- @param  self
-- @param  #number length How long to keep the entity ignited.
-- Not supplying this argument will not ignite the entity at all.
-- @param  #number radius The radius of the ignition, will ignite everything around the entity that is in this radius. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Initializes this entity as being clientside only. Only works on entities
-- fully created clientside, and as such it has currently no use due to the
-- lack of clientside ents.Create. This function is automatically called by
-- **ents.CreateClientProp**, **ClientsideModel**, and **ClientsideScene**.
-- @function [parent=#Entity] InitializeAsClientEntity
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Fires input to the entity with the ability to make another entity
-- responsible. Similar to **Entity:Fire**.
-- @function [parent=#Entity] Input
-- @param  self
-- @param  #string input The name of the input to fire.
-- @param  #Entity activator The entity that is directly responsible.
-- @param  #Entity inflictor The entity that is indirectly responsible. (often a player)
-- @param  #any param The value to give to the input. Can be a String, Float or Integer. _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Sets up Data Tables from entity to use with **Entity:NetworkVar**.
-- @function [parent=#Entity] InstallDataTable
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resets the entity's bone cache values in order to prepare for a model change.
-- This should be called after calling **Entity:SetPoseParameter**.
-- @function [parent=#Entity] InvalidateBoneCache
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the entity has constraints attached to it.
-- @function [parent=#Entity] IsConstrained
-- @param  self
-- @return #boolean Whether the entity is constrained or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns if entity is constraint or not.
-- @function [parent=#Entity] IsConstraint
-- @param  self
-- @return #boolean Is the entity a constraint or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the entity is dormant or not. Client/server entities become
-- dormant when they leave the PVS on the server. Client side entities can
-- decide for themselves whether to become dormant. This mainly applies to PVS.
-- @function [parent=#Entity] IsDormant
-- @param  self
-- @return #boolean Whether the entity is dormant or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether an entity has engine effect applied or not.
-- @function [parent=#Entity] IsEffectActive
-- @param  self
-- @param  #number effect The effect to check for, see **EF\_ Enums**.
-- @return #boolean whether an entity has the engine effect applied or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if given flag is set or not.
-- @function [parent=#Entity] IsEFlagSet
-- @param  self
-- @param  #number flag The engine flag to test, see **EFL\_ Enums**.
-- @return #boolean Is set or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if given flag(s) is set or not.
-- @function [parent=#Entity] IsFlagSet
-- @param  self
-- @param  #number flag The engine flag(s) to test, see **FL\_ Enums**.
-- @return #boolean Is set or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the entity is inside a wall or outside of the map.
-- 
-- **Note**: _Internally this function uses **util.IsInWorld**, that means that
-- this function only checks **Entity:GetPos** of the entity. If an entity is only
-- partially inside a wall, or has a weird GetPos offset, this function may not
-- give reliable output._
-- @function [parent=#Entity] IsInWorld
-- @param  self
-- @return #boolean Is the entity in world.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the entity is lag compensated or not.
-- @function [parent=#Entity] IsLagCompensated
-- @param  self
-- @return #boolean Whether the entity is lag compensated or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the target is in line of sight. This will only work on
-- CBaseCombatCharacter entities.
-- @function [parent=#Entity] IsLineOfSightClear
-- @param  self
-- @param  #Vector target The target to test. You can also supply an Entity instead of a Vector.
-- @return #boolean Returns true if the line of sight is clear.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the entity is an NPC or not.
-- @function [parent=#Entity] IsNPC
-- @param  self
-- @return #boolean Whether the entity is an NPC.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the entity is on fire.
-- @function [parent=#Entity] IsOnFire
-- @param  self
-- @return #boolean Whether the entity is on fire or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the entity is on ground or not. Internally, this checks if
-- **FL_ONGROUND** is set on the entity. This function is an alias of **Entity:OnGround**.
-- @function [parent=#Entity] IsOnGround
-- @param  self
-- @return #boolean Whether the entity is on ground or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the entity is a player or not.
-- @function [parent=#Entity] IsPlayer
-- @param  self
-- @return #boolean Whether the entity is a player.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if the entity is being held by a player. Either by physics gun,
-- gravity gun or use-key (+use).
-- @function [parent=#Entity] IsPlayerHolding
-- @param  self
-- @return #boolean Is being held.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether there's a gesture is given activity being played.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] IsPlayingGesture
-- @param  self
-- @param  #number activity The activity to test. See **ACT\_ Enums**.
-- @return #boolean Whether there's a gesture is given activity being played.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the entity is a ragdoll.
-- @function [parent=#Entity] IsRagdoll
-- @param  self
-- @return #boolean Is ragdoll or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the entity is a SENT or a built-in entity.
-- @function [parent=#Entity] IsScripted
-- @param  self
-- @return #boolean Returns true if entity is scripted (SENT), false if not (A built-in engine entity).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the entity is solid or not. Very useful for determining if the
-- entity is a trigger or not.
-- @function [parent=#Entity] IsSolid
-- @param  self
-- @return #boolean Whether the entity is solid or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the entity is a valid entity or not. An entity is valid if:
-- 
-- * It is not a NULL entity
-- * It is not the worldspawn entity (**game.GetWorld**)
-- * Instead of calling this method directly, it's a good idea to call the global IsValid instead.
-- * It will check whether the given variable contains an object (an Entity) or nothing at all for you.
-- @function [parent=#Entity] IsValid
-- @param  self
-- @return #boolean True if the entity is valid, false otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the given layer ID is valid and exists on this entity.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] IsValidLayer
-- @param  self
-- @param  #number layerID The Layer ID.
-- @return #boolean Whether the given layer ID is valid and exists on this entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the entity is a vehicle or not.
-- @function [parent=#Entity] IsVehicle
-- @param  self
-- @return #boolean Whether the entity is a vehicle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the entity is a weapon or not.
-- @function [parent=#Entity] IsWeapon
-- @param  self
-- @return #boolean Whether the entity is a weapon.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the entity is a widget or not. This is used by the "Edit
-- Bones" context menu property.
-- @function [parent=#Entity] IsWidget
-- @param  self
-- @return #boolean Whether the entity is a widget or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the entity is the map's Entity[0] worldspawn.
-- @function [parent=#Entity] IsWorld
-- @param  self
-- @return #boolean Is world spawn.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Converts a vector local to an entity into a worldspace vector.
-- @function [parent=#Entity] LocalToWorld
-- @param  self
-- @param  #Vector lpos The local vector.
-- @return #Vector The translated to world coordinates vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Converts a local angle (local to the entity) to a world angle.
-- @function [parent=#Entity] LocalToWorldAngles
-- @param  self
-- @param  #Angle ang The local angle.
-- @return #Angle The world angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the attachment index of the given attachment name, returns 0 if the
-- attachment does not exist, or -1 if the model is invalid.
-- @function [parent=#Entity] LookupAttachment
-- @param  self
-- @param  #string attachmentName The name of the attachment.
-- @return #number The attachment's index.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the bone index of the given bone name, returns nothing if the bone does
-- not exist.
-- @function [parent=#Entity] LookupBone
-- @param  self
-- @param  #string boneName The name of the bone.  
-- Common generic bones (for player models and some HL2 models):
-- 
-- * ValveBiped.Bip01_Head1
-- * ValveBiped.Bip01_Spine
-- * ValveBiped.Anim_Attachment_RH
-- Common hand bones (left hand equivalents also available, replace _R_ with _L_):
-- 
-- * ValveBiped.Bip01_R_Hand
-- * ValveBiped.Bip01_R_Forearm
-- * ValveBiped.Bip01_R_Foot
-- * ValveBiped.Bip01_R_Thigh
-- * ValveBiped.Bip01_R_Calf
-- * ValveBiped.Bip01_R_Shoulder
-- * ValveBiped.Bip01_R_Elbow
-- @return #number Index of the given bone name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns sequence ID from its name.
-- @function [parent=#Entity] LookupSequence
-- @param  self
-- @param  #string name Sequence name.
-- @return #number, #number Sequence ID for the given name and the sequence duraction. -1 and 0 for invalid sequences.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Turns the **Entity:GetPhysicsObject** into a physics shadow. It's used
-- internally for the Player's and NPC's physics object, and certain HL2
-- entities such as the crane. A physics shadow can be used to have static
-- entities that never move by setting both arguments to false.
-- 
-- **Note**: _Unlike **Entity:PhysicsInitShadow**, this function doesn't remove the
-- current physics object._
-- @function [parent=#Entity] MakePhysicsObjectAShadow
-- @param  self
-- @param  #boolean allowPhysicsMovement Whether to allow the physics shadow to move under stress.
-- @param  #boolean allowPhysicsRotation Whether to allow the physics shadow to rotate under stress.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets custom bone angles.
-- 
-- **Note**: _The repeated use of bone manipulation in multiplayer games is
-- highly discouraged due to the huge produced network traffic._
-- @function [parent=#Entity] ManipulateBoneAngles
-- @param  self
-- @param  #number boneID Index of the bone you want to manipulate.
-- @param  #Angle ang Angle to apply.
-- The angle is relative to the original bone angle, not relative to the world or the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Manipulates the bone's jiggle value(s).
-- @function [parent=#Entity] ManipulateBoneJiggle
-- @param  self
-- @param  #number boneID Index of the bone you want to manipulate.
-- @param  #number enabled 0 = No Jiggle, 1 = Jiggle

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets custom bone offsets.
-- @function [parent=#Entity] ManipulateBonePosition
-- @param  self
-- @param  #number boneID Index of the bone you want to manipulate.
-- @param  #Vector pos Position vector to apply.
-- Note that the position is relative to the original bone position, not relative to the world or the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets custom bone scale.
-- 
-- **Warning**: _When used serverside, this method produces a huge network consumption!_
-- @function [parent=#Entity] ManipulateBoneScale
-- @param  self
-- @param  #number boneID Index of the bone you want to manipulate.
-- @param  #Vector scale Scale vector to apply.
-- Note that the scale is relative to the original bone scale, not relative to the world or the entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns entity's map creation ID. Unlike **Entity:EntIndex** or **Entity:GetCreationID**,
-- it will always be the same on same map, no matter how much you clean up or
-- restart it. To be used in conjunction with **ents.GetMapCreatedEntity**.
-- @function [parent=#Entity] MapCreationID
-- @param  self
-- @return #number The map creation ID or -1 if the entity is not compiled into the map.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Refreshes the shadow of the entity.
-- @function [parent=#Entity] MarkShadowAsDirty
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Fires the muzzle flash effect of the weapon the entity is carrying. This
-- only creates a light effect and is often called alongside **Weapon:SendWeaponAnim**.
-- @function [parent=#Entity] MuzzleFlash
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Performs a Ray OBBox intersection from the given position to the origin of
-- the OBBox with the entity and returns the hit position on the OBBox.
-- @function [parent=#Entity] NearestPoint
-- @param  self
-- @param  #Vector position The vector to start the intersection from.
-- @return #Vector The nearest hit point of the entity's bounding box in world coordinates.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a network variable on the entity and adds Set/Get functions for it.
-- This function should only be called in **ENTITY:SetupDataTables**.
-- @function [parent=#Entity] NetworkVar
-- @param  self
-- @param  #string type Supported choices:
-- 
-- * "String"
-- * "Bool"
-- * "Float"
-- * "Int" (32-bit signed integer)
-- * "Vector"
-- * "Angle"
-- * "Entity"
-- @param  #number slot Each network var has to have a unique slot.
-- The slot is per type - so you can have an int in slot 0, a bool in slot 0 and a float in slot 0 etc. but you can't have two ints in slot 0 instead you would do a int in slot 0 and another int in slot 1.
-- The max slots right now are 32 - so you should pick a number between 0 and 31. An exception to this is strings which has a max slots of 4.
-- @param  #string name The name will affect how you access it.
-- If you call it "Foo" you would add two new functions on your entity - SetFoo and GetFoo.
-- So be careful that what you call it won't collide with any existing functions (don't call it "Pos" for example).
-- @param  #table extended A table of extended information. _(Default: nil)_
-- 
-- * _KeyName_ : If the table contains a "KeyName" key the value can be set using **Entity:SetKeyValue**.
--   This is useful if you're making an entity that you want to be loaded in a map. The sky entity uses this.
-- * _Edit_ : The edit key lets you mark this variable as editable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Creates a callback that will execute when the given network variable changes
-- - that is, when the Set<name> function is run.
-- 
-- **Note**: _The callback is executed before the value is changed, and is
-- called even if the new and old values are the same._
-- 
-- **Note**: _This function does not exist on entities in which
-- **Entity:InstallDataTable** has not been called. By default, this means this
-- function only exists on SENTs (both serverside and clientside) and on
-- players with a Player Class (serverside and clientside **LocalPlayer** only!).
-- It is therefore safest to only use this in **ENTITY:SetupDataTables**._
-- 
-- **Warning**: _A clientside NetworkVarNotify will not be called when the
-- network var is changed serverside! This makes the function less useful.
-- This is a bug._
-- @function [parent=#Entity] NetworkVarNotify
-- @param  self
-- @param  #string name Name of variable to track changes of.
-- @param  #function callback The function to call when the variable changes.  
-- It is passed 4 arugments:
-- 
-- * _#Entity entity_ : Entity whos variable changed. (This will be variable called "self" in **ENT:CallBack** format.)
-- * _#string name_ : Name of changed variable.
-- * _#any old_ : Old/current variable value.
-- * _#any new_ : New variable value that it was set to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- In the case of a scripted entity, this will cause the next **ENTITY:Think**
-- event to be run at the given time. Does not work clientside!
-- Use **Entity:SetNextClientThink** instead.
-- @function [parent=#Entity] NextThink
-- @param  self
-- @param  #number timestamp The relative to CurTime timestamp, at which the next think should occur.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the center of an entity's bounding box as a local vector.
-- @function [parent=#Entity] OBBCenter
-- @param  self
-- @return #Vector Bounding box center.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the highest corner of an entity's bounding box as a local vector.
-- @function [parent=#Entity] OBBMaxs
-- @param  self
-- @return #Vector The local position of the highest corner of the entity's oriented bounding box.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the lowest corner of an entity's bounding box as a local vector.
-- @function [parent=#Entity] OBBMins
-- @param  self
-- @return #Vector The local position of the lowest corner of the entity's oriented bounding box.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity's capabilities as a bitfield. In the engine this function
-- is mostly used to check the use type, the save/restore system and level
-- transitions flags. Even though the function is defined shared, it is not
-- guaranteed to return the same value across states.
-- @function [parent=#Entity] ObjectCaps
-- @param  self
-- @return #number The bitfield, a combination of the **FCAP\_** flags.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the entity is on the ground, and false if it isn't.
-- Internally, this checks if **FL\_ONGROUND** is set on the entity. This is only
-- updated for players and NPCs, and thus won't inherently work for other entities.
-- @function [parent=#Entity] OnGround
-- @param  self
-- @return #boolean Whether the entity is on the ground or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Tests whether the damage passes the entity filter. This will call
-- **ENTITY:PassesDamageFilter** on scripted entities of the type "filter".
-- 
-- **Note**: _This function only works on entities of the type "filter".
-- (filter\_* entities, including base game filter entities)_
-- @function [parent=#Entity] PassesDamageFilter
-- @param  self
-- @param  #CTakeDamageInfo dmg The damage info to test.
-- @return #boolean Whether the damage info passes the entity filter.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Tests whether the entity passes the entity filter. This will call
-- **ENTITY:PassesFilter** on scripted entities of the type "filter".
-- 
-- **Note**: _This function only works on entities of the type "filter".
-- (filter\_* entities, including base game filter entities)_
-- @function [parent=#Entity] PassesFilter
-- @param  self
-- @param  #Entity caller The initiator of the test.
-- For example the trigger this filter entity is used in.
-- @param  #Entity ent The entity to test against the entity filter.
-- @return #boolean Whether the entity info passes the entity filter.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Destroys the current physics object of an entity.
-- @function [parent=#Entity] PhysicsDestroy
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Initializes the physics mesh of the entity from a triangle soup defined by a
-- table of vertices. The resulting mesh is hollow, may contain holes, and
-- always has a volume of 0. While this is very useful for static geometry such
-- as terrain displacements, it is advised to use **Entity:PhysicsInitConvex** or
-- **Entity:PhysicsInitMultiConvex** for moving solid objects instead.
-- 
-- **Entity:EnableCustomCollisions** needs to be called if you want players to
-- collide with the entity correctly.
-- @function [parent=#Entity] PhysicsFromMesh
-- @param  self
-- @param  #table vertices A table consisting of MeshVertex structure (only the pos element is taken into account).
-- Every 3 vertices define a triangle in the physics mesh.
-- @return #boolean Returns true on success, nil otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Initializes the physics object of the entity using its current model.
-- Deletes the previous physics object if it existed and the new object
-- creation was successful. If the entity's current model has no physics mesh
-- associated to it, no physics object will be created and the previous object
-- will still exist, if applicable.
-- 
-- **Note**: _When called clientside, this will not create a valid PhysObj if
-- the model hasn't been precached serverside._
-- 
-- **Note**: _If successful, this function will automatically call_
-- _**Entity:SetSolid**(solidType) and **Entity:SetSolidFlags**(0)._
-- @function [parent=#Entity] PhysicsInit
-- @param  self
-- @param  #number solidType The solid type of the physics object to create, see **SOLID\_ Enums**. Should be **SOLID\_VPHYSICS** in most cases.
-- 
-- Using **SOLID\_NONE** will only delete the current physics object - it does not create a new one.
-- @return #boolean Returns true on success, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Makes the physics object of the entity a AABB.
-- 
-- **Note**: _If the volume of the resulting box is 0 (the mins and maxs are
-- the same), the mins and maxs will be changed to Vector(-1, -1, -1) and 
-- Vector(1,1,1), respectively._
-- 
-- **Note**: _This function will automatically destroy any previous physics
-- objects if successful and call **Entity:SetSolid**(SOLID\_BBOX),
-- **Entity:SetMoveType**(MOVETYPE\_VPHYSICS), and **Entity:SetCollisionBounds**(mins,maxs)._
-- @function [parent=#Entity] PhysicsInitBox
-- @param  self
-- @param  #Vector mins The minimum position of the box. This is automatically ordered with the maxs.
-- @param  #Vector maxs The maximum position of the box. This is automatically ordered with the mins.
-- @return #boolean Returns true on success, nil otherwise. This fails when the game cannot create any more PhysCollides.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Initializes the physics mesh of the entity with a convex mesh defined by a
-- table of points. The resulting mesh is the convex hull of all the input points.
-- If successful, the previous physics object will be removed. This is the
-- standard way of creating moving physics objects with a custom convex shape.
-- For more complex, concave shapes, see **Entity:PhysicsInitMultiConvex**.
-- @function [parent=#Entity] PhysicsInitConvex
-- @param  self
-- @param  #table points A table of eight Vectors, in local coordinates, to be used in the computation of the convex mesh. Order does not matter.
-- @return #boolean Returns true on success, nil otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- An advanced version of **Entity:PhysicsInitConvex** which initializes a physics
-- object from multiple convex meshes. This should be used for physics objects
-- with a custom shape which cannot be represented by a single convex mesh.
-- If successful, the previous physics object will be removed.
-- @function [parent=#Entity] PhysicsInitMultiConvex
-- @param  self
-- @param  #table vertices A table consisting of tables of Vectors.
-- Each sub-table defines a set of points to be used in the computation of one convex mesh.
-- @return #boolean Returns true on success, nil otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Initializes the entity's physics object as a physics shadow. Removes the
-- previous physics object if successful. This is used internally for the
-- Player's and NPC's physics object, and certain HL2 entities such as the crane.
-- A physics shadow can be used to have static entities that never move by
-- setting both arguments to false.
-- @function [parent=#Entity] PhysicsInitShadow
-- @param  self
-- @param  #boolean allowPhysicsMovement Whether to allow the physics shadow to move under stress. _(Default: true)_
-- @param  #boolean allowPhysicsRotation Whether to allow the physics shadow to rotate under stress. _(Default: true)_
-- @return #boolean Return true on success, nil otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Makes the physics object of the entity a sphere.
-- 
-- **Note**: _This function will automatically destroy any previous physics
-- objects and call **Entity:SetSolid**(SOLID\_BBOX) and Entity:**SetMoveType**(MOVETYPE\_VPHYSICS)._
-- @function [parent=#Entity] PhysicsInitSphere
-- @param  self
-- @param  #number radius The radius of the sphere.
-- @param  #string physmat Physical material from surfaceproperties.txt or added with **physenv.AddSurfaceData**.
-- @return #boolean Returns true on success, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Initializes a static physics object of the entity using its current model.
-- If successful, the previous physics object is removed. This is what used by
-- entities such as func\_breakable, prop\_dynamic, item\_suitcharger, prop\_thumper
-- and npc\_rollermine while it is in its "buried" state in the Half-Life 2 Campaign.
-- 
-- If the entity's current model has no physics mesh associated to it, no
-- physics object will be created.
-- 
-- **Note**: _This function will automatically call **Entity:SetSolid**(solidType)._
-- @function [parent=#Entity] PhysicsInitStatic
-- @param  self
-- @param  #number solidType The solid type of the physics object to create, see **SOLID\_ Enums**. Should be **SOLID\_VPHYSICS** in most cases.
-- @return #boolean Returns true on success, false otherwise. This will fail if the entity's current model has no associated physics mesh.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Wakes up the entity's physics object.
-- @function [parent=#Entity] PhysWake
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes the entity play a .vcd scene.
-- @function [parent=#Entity] PlayScene
-- @param  self
-- @param  #string scene Filepath to scene.
-- @param  #number delay Delay in seconds until the scene starts playing. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Changes an entities angles so that it faces the target entity.
-- @function [parent=#Entity] PointAtEntity
-- @param  self
-- @param  #Entity target The entity to face.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Precaches gibs for the entity's model. Normally this function should be ran
-- when the entity is spawned, for example the **ENTITY:Initialize**, after
-- **Entity:SetModel** is called. This is required for **Entity:GibBreakServer** and
-- **Entity:GibBreakClient** to work.
-- @function [parent=#Entity] PrecacheGibs
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Normalizes the ragdoll. This is used alongside Kinect in
-- **Entity:SetRagdollBuildFunction**, for more info see ragdoll_motion entity.
-- @function [parent=#Entity] RagdollSolve
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the function to build the ragdoll. This is used alongside Kinect in
-- **Entity:SetRagdollBuildFunction**, for more info see ragdoll_motion entity.
-- @function [parent=#Entity] RagdollStopControlling
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes the physics objects follow the set bone positions. This is used
-- alongside Kinect in **Entity:SetRagdollBuildFunction**, for more info see
-- ragdoll_motion entity.
-- @function [parent=#Entity] RagdollUpdatePhysics
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes the entity it is used on.
-- @function [parent=#Entity] Remove
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes all decals from the entities surface.
-- @function [parent=#Entity] RemoveAllDecals
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes and stops all gestures.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] RemoveAllGestures
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes a callback previously added with **Entity:AddCallback**.
-- @function [parent=#Entity] RemoveCallback
-- @param  self
-- @param  #string hook The hook name to remove.
-- @param  #number callbackid The callback id previously retrieved with the return of **Entity:AddCallback** or **Entity:GetCallbacks**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes a function previously added via **Entity:CallOnRemove**.
-- @function [parent=#Entity] RemoveCallOnRemove
-- @param  self
-- @param  #string identifier Identifier of the function within CallOnRemove.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes an engine effect applied to an entity.
-- @function [parent=#Entity] RemoveEffects
-- @param  self
-- @param  #number effect The effect to remove, see **EF\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes specified engine flag.
-- @function [parent=#Entity] RemoveEFlags
-- @param  self
-- @param  #number flag The flag to remove, see **EFL\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes specified flag(s) from the entity.
-- @function [parent=#Entity] RemoveFlags
-- @param  self
-- @param  #number flag The flag(s) to remove, see **FL\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes a **PhysObject** from the entity's motion controller so that
-- **ENTITY:PhysicsSimulate** will no longer be called for given **PhysObject**.
-- You must first create a motion controller with **Entity:StartMotionController**.
-- 
-- **Note**: _Only works on a scripted Entity of "anim" type._
-- @function [parent=#Entity] RemoveFromMotionController
-- @param  self
-- @param  #PhysObj physObj The **PhysObj** to remove from the motion controller.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes and stops the gesture with given activity.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] RemoveGesture
-- @param  self
-- @param  #number activity The activity remove. See **ACT\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes solid flag(s) from the entity.
-- @function [parent=#Entity] RemoveSolidFlags
-- @param  self
-- @param  #number flags The flag(s) to remove, see **FSOLID\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Plays an animation on the entity. This may not always work on engine entities.
-- 
-- **Warning**: _This will not reset the animation on viewmodels, use
-- **Entity:SendViewModelMatchingSequence** instead._
-- 
-- **Note**: _This will not work properly if called directly after calling
-- **Entity:SetModel**. Consider waiting until the next Tick._
-- 
-- **Note**: _Will not work on players due to the animations being reset every
-- frame by the base gamemode animation system. See **GM:CalcMainActivity**._
-- @function [parent=#Entity] ResetSequence
-- @param  self
-- @param  #number sequence The sequence to play. Also accepts strings.
-- **Note**: _If set to a string, the function will automatically call
-- **Entity:LookupSequence** to retrieve the sequence ID as a number._

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reset entity sequence info such as playback rate, ground speed, last event
-- check, etc.
-- @function [parent=#Entity] ResetSequenceInfo
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes the entity/weapon respawn. Only usable on HL2 pickups and any weapons.
-- Seems to be buggy with weapons. Very unreliable.
-- @function [parent=#Entity] Respawn
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Restarts the entity's animation gesture. If the given gesture is already
-- playing, it will reset it and play it from the beginning.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites._
-- @function [parent=#Entity] RestartGesture
-- @param  self
-- @param  #number activity The activity number to send to the entity. See **ACT\_ Enums** and **Entity:GetSequenceActivity**.
-- @param  #boolean addIfMissing Add/start the gesture to if it has not been yet started. _(Default: true)_
-- @param  #boolean autokill _(Default: true)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns sequence ID corresponding to given activity ID. Opposite of 
-- **Entity:GetSequenceActivity**. Similar to **Entity:LookupSequence**. See also 
-- **Entity:SelectWeightedSequenceSeeded**.
-- @function [parent=#Entity] SelectWeightedSequence
-- @param  self
-- @param  #number act The activity ID, see **ACT\_ Enums**.
-- @return #number The sequence ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the sequence ID corresponding to given activity ID, and uses the
-- provided seed for random selection. The seed should be the same server-side
-- and client-side if used in a predicted environment. See
-- **Entity:SelectWeightedSequence** for a provided-seed version of this function.
-- @function [parent=#Entity] SelectWeightedSequenceSeeded
-- @param  self
-- @param  #number act The activity ID, see **ACT\_ Enums**.
-- @param  #number seed The seed to use for randomly selecting a sequence in the case the activity ID has multiple sequences bound to it.
-- **Entity:SelectWeightedSequence** uses the same seed as **util.SharedRandom** internally for this.
-- @return #number The sequence ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sends sequence animation to the view model. It is recommended to use this
-- for view model animations, instead of **Entity:ResetSequence**. This function is
-- only usable on view models.
-- @function [parent=#Entity] SendViewModelMatchingSequence
-- @param  self
-- @param  #number seq The sequence ID returned by **Entity:LookupSequence** or **Entity:SelectWeightedSequence**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns length of currently played sequence.
-- @function [parent=#Entity] SequenceDuration
-- @param  self
-- @param  #number seqid A sequence ID to return the length specific sequence of instead of the entity's main/currently playing sequence. _(Default: nil)_
-- @return #number The length of the sequence.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the entity's velocity.
-- 
-- **Note**: _Actually binds to **CBaseEntity::SetLocalVelocity**() which sets the
-- entity's velocity due to movement in the world from forces such as gravity.
-- Does not include velocity from entity-on-entity collision or other world movement._
-- @function [parent=#Entity] SetAbsVelocity
-- @param  self
-- @param  #Vector velocity The new velocity to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the angles of the entity.
-- 
-- **Note**: _To set a player's angles, use **Player:SetEyeAngles** instead._
-- @function [parent=#Entity] SetAngles
-- @param  self
-- @param  #Angle angles The new angles.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a player's third-person animation. Mainly used by Weapons to start the
-- player's weapon attack and reload animations.
-- @function [parent=#Entity] SetAnimation
-- @param  self
-- @param  #number playerAnim Player animation, see **PLAYER\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the time (relative to **CurTime**) of the current animation frame, which
-- is used to determine **Entity:GetCycle**.
-- @function [parent=#Entity] SetAnimTime
-- @param  self
-- @param  #number time The current animation time.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the blood color this entity uses.
-- @function [parent=#Entity] SetBloodColor
-- @param  self
-- @param  #number bloodColor An integer corresponding to **BLOOD\_COLOR\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets an entities' bodygroup.
-- @function [parent=#Entity] SetBodygroup
-- @param  self
-- @param  #number bodygroup The id of the bodygroup you're setting. Starts from 0.
-- @param  #number value The value you're setting the bodygroup to. Starts from 0.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the bodygroups from a string. A convenience function for **Entity:SetBodygroup**.
-- @function [parent=#Entity] SetBodyGroups
-- @param  self
-- @param  #string bodygroups Body groups to set. Each single-digit number in the string represents a separate bodygroup.
-- This make it impossible to set any bodygroup to a value higher than 9! For that you need to use **Entity:SetBodygroup**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the specified value on the bone controller with the given ID of this
-- entity, it's used in HL1 to change the head rotation of NPCs, turret aiming
-- and so on.
-- 
-- **Note**: _This is the precursor of pose parameters, and only works for Half Life 1: Source models supporting it._
-- @function [parent=#Entity] SetBoneController
-- @param  self
-- @param  #number boneControllerID The ID of the bone controller to set the value to. Goes from 0 to 3.
-- @param  #number value The value to set on the specified bone controller.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the bone matrix of given bone to given matrix. See also
-- **Entity:GetBoneMatrix**. Does nothing on server.
-- @function [parent=#Entity] SetBoneMatrix
-- @param  self
-- @param  #number boneid The ID of the bone.
-- @param  #VMatrix matrix The matrix to set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the bone position and angles.
-- @function [parent=#Entity] SetBonePosition
-- @param  self
-- @param  #number bone The bone ID to manipulate.
-- @param  #Vector pos The position to set.
-- @param  #Angle ang The angles to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the collision bounds for the entity, which are used for triggers
-- (**Entity:SetTrigger**, **ENTITY:Touch**), determining if rendering is necessary
-- clientside, and collision (If Entity:SetSolid set as **SOLID\_BBOX**).
-- 
-- Input bounds are relative to **Entity:GetPos**! See also **Entity:SetCollisionBoundsWS**.
-- @function [parent=#Entity] SetCollisionBounds
-- @param  self
-- @param  #Vector mins The minimum vector of the bounds. The vector must be smaller than second argument on all axises.
-- @param  #Vector maxs The maximum vector of the bounds. The vector must be bigger than first argument on all axises.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the collision bounds for the entity, which are used for triggers
-- (**Entity:SetTrigger**, **ENTITY:Touch**), determining if rendering is necessary
-- clientside, and collision (If **Entity:SetSolid** set as SOLID_BBOX).
-- 
-- Input bounds are in world coordinates! See also **Entity:SetCollisionBounds**.
-- @function [parent=#Entity] SetCollisionBoundsWS
-- @param  self
-- @param  #Vector vec1 The first vector of the bounds.
-- @param  #Vector vec2 The second vector of the bounds.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the entity's collision group.
-- @function [parent=#Entity] SetCollisionGroup
-- @param  self
-- @param  #number group Collision group of the entity, see **COLLISION\_GROUP\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the color of an entity.
-- @function [parent=#Entity] SetColor
-- @param  self
-- @param  #table color The color to set. See the **Color structure**. _(Default: Color(255,0,255,255))_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the creator of the SENT.
-- @function [parent=#Entity] SetCreator
-- @param  self
-- @param  #Player ply The creator.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Marks the entity to call **GM:ShouldCollide**.
-- @function [parent=#Entity] SetCustomCollisionCheck
-- @param  self
-- @param  #boolean enable Enable or disable the custom collision check.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the progress of the current animation to a specific value between 0 and 1.
-- @function [parent=#Entity] SetCycle
-- @param  self
-- @param  #number value The desired cycle value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Sets the specified angle on
-- the entity's datatable.
-- @function [parent=#Entity] SetDTAngle
-- @param  self
-- @param  #number key Goes from 0 to 31.
-- @param  #Angle ang The angle to write on the entity's datatable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Sets the specified bool on
-- the entity's datatable.
-- @function [parent=#Entity] SetDTBool
-- @param  self
-- @param  #number key Goes from 0 to 31.
-- @param  #boolean bool The boolean to write on the entity's metatable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Sets the specified entity
-- on this entity's datatable.
-- @function [parent=#Entity] SetDTEntity
-- @param  self
-- @param  #number key Goes from 0 to 31.
-- @param  #Entity ent The entity to write on this entity's datatable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Sets the specified float on
-- the entity's datatable.
-- @function [parent=#Entity] SetDTFloat
-- @param  self
-- @param  #number key Goes from 0 to 31.
-- @param  #number float The float to write on the entity's datatable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Sets the specified integer
-- on the entity's datatable.
-- @function [parent=#Entity] SetDTInt
-- @param  self
-- @param  #number key Goes from 0 to 31.
-- @param  #number integer The integer to write on the entity's datatable. This will be cast to a 32-bit signed integer internally.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Sets the specified string
-- on the entity's datatable.
-- 
-- **Note**: _The length of these strings are capped at 512 characters._
-- @function [parent=#Entity] SetDTString
-- @param  self
-- @param  #number key Goes from 0 to 3.
-- @param  #string str The string to write on the entity's datatable, can't be more than 512 characters per string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- This is called internally by the **Entity:NetworkVar** system, you can use this
-- in cases where using NetworkVar is not possible. Sets the specified vector
-- on the entity's datatable.
-- @function [parent=#Entity] SetDTVector
-- @param  self
-- @param  #number key Goes from 0 to 31.
-- @param  #Vector vec The vector to write on the entity's datatable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the elasticity of this entity, used by some flying entities such as the
-- Helicopter NPC to determine how much it should bounce around when colliding.
-- @function [parent=#Entity] SetElasticity
-- @param  self
-- @param  #number elasticity The elasticity to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Allows you to set the Start or End entity attachment for the rope.
-- @function [parent=#Entity] SetEntity
-- @param  self
-- @param  #string name The name of the variable to modify. Accepted names are StartEntity and EndEntity.
-- @param  #Entity entity The entity to apply to the specific attachment.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the position an entity's eyes look toward.
-- @function [parent=#Entity] SetEyeTarget
-- @param  self
-- @param  #Vector pos The world position the entity is looking toward.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the flex scale of the entity.
-- @function [parent=#Entity] SetFlexScale
-- @param  self
-- @param  #number scale The new flex scale to set to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the flex weight.
-- @function [parent=#Entity] SetFlexWeight
-- @param  self
-- @param  #number flex The ID of the flex to modify weight of.
-- @param  #number weight The new weight to set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets how much friction an entity has when sliding against a surface.
-- Entities default to 1 (100%) and can be higher or even negative.
-- 
-- **Note**: _Works only for MOVETYPE\_STEP entities._
-- @function [parent=#Entity] SetFriction
-- @param  self
-- @param  #number friction Friction multiplier.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the gravity multiplier of the entity.
-- @function [parent=#Entity] SetGravity
-- @param  self
-- @param  #number gravityMultiplier Value which specifies the gravity multiplier.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the ground the entity is standing on.
-- @function [parent=#Entity] SetGroundEntity
-- @param  self
-- @param  #Entity ground The ground entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the health of the entity.
-- 
-- **Note**: _You may want to take **Entity:GetMaxHealth** into account when
-- calculating what to set health to, in case a gamemode has a different max
-- health than 100._
-- @function [parent=#Entity] SetHealth
-- @param  self
-- @param  #number newHealth New health value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the current Hitbox set for the entity.
-- @function [parent=#Entity] SetHitboxSet
-- @param  self
-- @param  #number id The new hitbox set to set. Can be a name as a string, or the ID as a number.
-- If the operation failed, the function will silently fail.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables or disable the inverse kinematic usage of this entity.
-- @function [parent=#Entity] SetIK
-- @param  self
-- @param  #boolean useIK The state of the IK. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets key value for the entity.
-- @function [parent=#Entity] SetKeyValue
-- @param  self
-- @param  #string key The key.
-- @param  #string value The value.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- This allows the entity to be lag compensated during **Player:LagCompensation**.
-- 
-- **Note**: _Players are lag compensated by default and there's no need to
-- call this function for them. It's best to not enable lag compensation on
-- parented entities, as the system does not handle it that well (they will be
-- moved back but then the entity will lag behind). Parented entities move back
-- with the parent if its lag compensated, so if you are making some kind of
-- armor piece you shouldn't do anything._
-- 
-- As a side note for parented entities, if your entity can be shot at, keep in
-- mind that its collision bounds need to be bigger than the bone's hitbox the
-- entity is parented to, or hull/line traces (such as the crowbar attack or
-- bullets) might not hit at all.
-- @function [parent=#Entity] SetLagCompensated
-- @param  self
-- @param  #boolean enable Whether the entity should be lag compensated or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] SetLayerBlendIn
-- @param  self
-- @param  #number layerID The Layer ID.
-- @param  #number blendIn

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] SetLayerBlendOut
-- @param  self
-- @param  #number layerID The Layer ID.
-- @param  #number blendOut

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the animation cycle/frame of given layer.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] SetLayerCycle
-- @param  self
-- @param  #number layerID The Layer ID.
-- @return #number cycle The new animation cycle/frame for given layer.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the duration of given layer. This internally overrides the **Entity:SetLayerPlaybackRate**.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] SetLayerDuration
-- @param  self
-- @param  #number layerID The Layer ID.
-- @param  #number duration The new duration of the layer in seconds.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets whether the layer should loop or not.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] SetLayerLooping
-- @param  self
-- @param  #number layerID The Layer ID.
-- @param  #boolean loop Whether the layer should loop or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the layer player back rate. See also **Entity:SetLayerDuration**.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] SetLayerPlaybackRate
-- @param  self
-- @param  #number layerID The Layer ID.
-- @param  #number rate The new playback rate.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the priority of given layer.
-- 
-- **Note**: _This function only works on **BaseAnimatingOverlay** entites!_
-- @function [parent=#Entity] SetLayerPriority
-- @param  self
-- @param  #number layerID The Layer ID.
-- @param  #number priority The new priority of the layer.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the layer weight. This influences how strongly the animation should be
-- overriding the normal animations of the entity.
-- @function [parent=#Entity] SetLayerWeight
-- @param  self
-- @param  #number layerID The Layer ID.
-- @param  #number weight The new layer weight.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This forces an entity to use the bone transformation behaviour from versions
-- prior to 2014-07-08. This behaviour affects **Entity:EnableMatrix** and
-- **Entity:SetModelScale** and is incorrect, therefore this function be used
-- exclusively as a quick fix for old scripts that rely on it.
-- @function [parent=#Entity] SetLegacyTransform
-- @param  self
-- @param  #boolean enabled Whether the entity should use the old bone transformation behaviour or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets angles relative to angles of **Entity:GetParent**.
-- @function [parent=#Entity] SetLocalAngles
-- @param  self
-- @param  #Angle ang The local angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the entity's angular velocity (rotation speed).
-- @function [parent=#Entity] SetLocalAngularVelocity
-- @param  self
-- @param  #Angle angVel The angular velocity to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets local position relative to the parented position. This is for use with
-- **Entity:SetParent** to offset position.
-- @function [parent=#Entity] SetLocalPos
-- @param  self
-- @param  #Vector pos The local position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the entity's local velocity which is their velocity due to movement in
-- the world from forces such as gravity. Does not include velocity from
-- entity-on-entity collision or other world movement.
-- 
-- **Warning**: _Same as **Entity:SetAbsVelocity**, but clamps the given velocity,
-- and is not recommended to be used because of that._
-- @function [parent=#Entity] SetLocalVelocity
-- @param  self
-- @param  #Vector velocity The new velocity to set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the Level Of Detail model to use with this entity. This may not work
-- for all models if the model doesn't include any LOD sub models. This
-- function works exactly like the clientside r_lod convar and takes priority
-- over it.
-- @function [parent=#Entity] SetLOD
-- @param  self
-- @param  #number lod The Level Of Detail model ID to use. -1 leaves the engine to automatically set the Level of Detail. _(Default: -1)_
-- The Level Of Detail may range from 0 to 8, with 0 being the highest quality and 8 the lowest.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the rendering material override of the entity. To set a Lua material
-- created with **CreateMaterial**, just prepend a "!" to the material name.
-- 
-- **Note**: _If you wish to override a single material on the model, use
-- **Entity:SetSubMaterial** instead._
-- 
-- **Note**: _Please note that to apply materials to models, that material must
-- have VertexLitGeneric shader. For that reason you cannot apply map textures
-- onto models, map textures use a different material shader - LightmappedGeneric._
-- @function [parent=#Entity] SetMaterial
-- @param  self
-- @param  #string materialName New material name. Use an empty string ("") to reset to the default materials.
-- @param  #boolean forceMaterial Use it if you wish to apply material other than VertexLitGeneric (such as tools/toolswhite). _(Default: false)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the maximum health for entity. Note, that you can still set entity's
-- health above this amount with **Entity:SetHealth**.
-- @function [parent=#Entity] SetMaxHealth
-- @param  self
-- @param  #number maxhealth What the max health should be.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the model of the entity.
-- @function [parent=#Entity] SetModel
-- @param  self
-- @param  #string modelName New model value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Alter the model name returned by **Entity:GetModel**. Does not affect the
-- entity's actual model.
-- @function [parent=#Entity] SetModelName
-- @param  self
-- @param  #string modelname The new model name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Scales the model of the entity, if the entity is a Player or an NPC the
-- hitboxes will be scaled as well. For some entities, calling **Entity:Activate**
-- after this will scale the collision bounds and PhysObj as well; be wary as
-- there's no optimization being done internally and highly complex collision
-- models might crash the server. To resize the entity along any axis, use
-- **Entity:EnableMatrix** instead.
-- 
-- This is the same system used in TF2 for the Mann Vs Machine robots. If your
-- old scales are wrong due to a recent update, use **Entity:SetLegacyTransform**
-- as a quick fix.
-- @function [parent=#Entity] SetModelScale
-- @param  self
-- @param  #number scale A float to scale the model by. 0 will not draw anything. < 0 will draw the model inverted.
-- @param  #number deltaTime Transition time of the scale change, set to 0 to modify the scale right away. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the move collide type of the entity. The move collide is the way a
-- physics object reacts to hitting an object - will it bounce, slide?
-- @function [parent=#Entity] SetMoveCollide
-- @param  self
-- @param  #number moveCollideType The move collide type, see **MOVECOLLIDE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the Movement Parent of an entity to another entity. Similar to
-- **Entity:SetParent**, except the object's coordinates are not translated
-- automatically before parenting.
-- @function [parent=#Entity] SetMoveParent
-- @param  self
-- @param  #Entity Parent The entity to change this entity's Movement Parent to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the entity's move type. This should be called before initializing the
-- physics object on the entity, unless it will override SetMoveType such as
-- **Entity:PhysicsInitBox**. Despite existing on client, it doesn't actually do
-- anything on client.
-- @function [parent=#Entity] SetMoveType
-- @param  self
-- @param  #number movetype The new movetype, see **MOVETYPE\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the mapping name of the entity.
-- @function [parent=#Entity] SetName
-- @param  self
-- @param  #string mappingName The name to set for the entity.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Alters the entity's perceived serverside angle on the client.
-- @function [parent=#Entity] SetNetworkAngles
-- @param  self
-- @param  #Angle angle Networked angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a networked number at the specified index on the entity.
-- @function [parent=#Entity] SetNetworkedNumber
-- @param  self
-- @param  #any index The index that the value is stored in.
-- @param  #number number The value to network.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Virtually changes entity position for clients. Does the same thing as
-- **Entity:SetPos** when used serverside.
-- @function [parent=#Entity] SetNetworkOrigin
-- @param  self
-- @param  #Vector origin The position to make clients think this entity is at.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the next time the clientside **ENTITY:Think** is called.
-- @function [parent=#Entity] SetNextClientThink
-- @param  self
-- @param  #number nextthink The next time, relative to **CurTime**, to execute the **ENTITY:Think** clientside.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets if the entity's model should render at all. If set on the server, this
-- entity will no longer network to clients, and for all intents and purposes
-- cease to exist clientside.
-- @function [parent=#Entity] SetNoDraw
-- @param  self
-- @param  #boolean shouldNotDraw true disables drawing.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether the entity is solid or not.
-- @function [parent=#Entity] SetNotSolid
-- @param  self
-- @param  #boolean IsNotSolid True will make the entity not solid, false will make it solid.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a networked angle value on the entity. The value can then be accessed
-- with **Entity:GetNWAngle** both from client and server.
-- 
-- **Note**: _Running this function clientside will only set it for the client
-- it is called on._
-- @function [parent=#Entity] SetNWAngle
-- @param  self
-- @param  #string key The key to associate the value with.
-- @param  #Angle value The value to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a networked boolean value on the entity. The value can then be accessed
-- with **Entity:GetNWBool** both from client and server.
-- 
-- **Note**: _Running this function clientside will only set it for the client
-- it is called on._
-- @function [parent=#Entity] SetNWBool
-- @param  self
-- @param  #string key The key to associate the value with.
-- @param  #boolean value The value to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a networked entity value on the entity. The value can then be accessed
-- with **Entity:GetNWEntity** both from client and server.
-- 
-- **Note**: _Running this function clientside will only set it for the client
-- it is called on._
-- @function [parent=#Entity] SetNWEntity
-- @param  self
-- @param  #string key The key to associate the value with.
-- @param  #Entity value The value to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a networked float (number) value on the entity. The value can then be
-- accessed with **Entity:GetNWFloat** both from client and server. Unlike
-- **Entity:SetNWInt**, floats don't have to be whole numbers.
-- 
-- **Note**: _Running this function clientside will only set it for the client
-- it is called on._
-- @function [parent=#Entity] SetNWFloat
-- @param  self
-- @param  #string key The key to associate the value with.
-- @param  #number value The value to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a networked integer (whole number) value on the entity. The value can
-- then be accessed with **Entity:GetNWInt** both from client and server. See
-- **Entity:SetNWFloat** for numbers that aren't integers.
-- 
-- **Note**: _Running this function clientside will only set it for the client
-- it is called on._
-- @function [parent=#Entity] SetNWInt
-- @param  self
-- @param  #string key The key to associate the value with.
-- @param  #number value The value to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a networked string value on the entity. The value can then be accessed
-- with **Entity:GetNWString** both from client and server.
-- 
-- **Note**: _Running this function clientside will only set it for the client
-- it is called on._
-- @function [parent=#Entity] SetNWString
-- @param  self
-- @param  #string key The key to associate the value with.
-- @param  #string value The value to set, up to 199 characters.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a function to be called when the NWVar changes.
-- 
-- **Note**: _Currently this function only works for the NW2Var system
-- (accessed by adding a 2 in between NW and Var for most NWVar functions),
-- which will replace the original one at some point in the future._
-- @function [parent=#Entity] SetNWVarProxy
-- @param  self
-- @param  #any key The key of the NWVar to add callback for.
-- @param  #function callback The function to be called when the NWVar changes.
-- It has 3 arguments:
-- 
-- * _#Entity ent_ : The entity.
-- * _#string name_ : Name of the NWVar that has changed.
-- * _#any oldval_ : The old value.
-- * _#any newval_ : The new value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a networked vector value on the entity. The value can then be accessed
-- with **Entity:GetNWVector** both from client and server.
-- 
-- **Note**: _Running this function clientside will only set it for the client
-- it is called on._
-- @function [parent=#Entity] SetNWVector
-- @param  self
-- @param  #string key The key to associate the value with.
-- @return #Vector value The value to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the owner of this entity, disabling all physics interaction with it.
-- 
-- **Note**: _This function is generally used to disable physics interactions
-- on projectiles being fired by their owner, but can also be used for normal
-- ownership in case physics interactions are not involved at all. The Gravity
-- gun will be able to pick up the entity even if the owner can't collide with it._
-- @function [parent=#Entity] SetOwner
-- @param  self
-- @param  #Entity owner The entity to be set as owner. _(Default: NULL)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the parent of this entity, making it move with its parent.
-- @function [parent=#Entity] SetParent
-- @param  self
-- @param  #Entity parent The entity to parent to. Setting this to nil will clear the parent. _(Default: NULL)_
-- @param  #number attachmentId The attachment id to use when parenting, defaults to -1 or whatever the parent had set previously. _(Default: -1)_
-- 
-- **Note**: _You must call **Entity:SetMoveType**(MOVETYPE\_NONE) on the child for this argument to have any effect!_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the parent of an entity to another entity with the given physics bone
-- number. Similar to **Entity:SetParent**, except it is parented to a physbone.
-- This function is useful mainly for ragdolls.
-- 
-- **Note**: _Despite this function being available server side, it doesn't
-- actually do anything server side._
-- @function [parent=#Entity] SetParentPhysNum
-- @param  self
-- @param  #number bone Physics bone number to attach to.
-- Use 0 for objects with only one physics bone. See **Entity:GetPhysicsObjectNum**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether or not the given entity is persistent. A persistent entity will
-- be saved on server shutdown and loaded back when the server starts up.
-- Additionally, by default persistent entities cannot be grabbed with the
-- physgun and tools cannot be used on them.
-- 
-- In sandbox, this can be set on an entity by opening the context menu, right
-- clicking the entity, and choosing "Make Persistent".
-- 
-- **Note**: _Persistence can only be enabled with the sbox\_persist convar,
-- which works as an identifier for the current set of persistent entities.
-- An empty identifier (which is the default value) disables this feature._
-- 
-- **Note**: _This feature only works in Sandbox and Sandbox-derived gamemodes._
-- @function [parent=#Entity] SetPersistent
-- @param  self
-- @param  #boolean persist Whether or not the entity should be persistent.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- When called on a constraint entity, sets the two physics objects to be
-- constrained. Usage is not recommended as the Constraint library provides
-- easier ways to deal with constraints.
-- @function [parent=#Entity] SetPhysConstraintObjects
-- @param  self
-- @param  #PhysObj Phys1 The first physics object to be constrained.
-- @param  #PhysObj Phys2 The second physics object to be constrained.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the player who gets credit if this entity kills something with physics
-- damage within the time limit.
-- 
-- **Note**: _This can only be called on props._
-- @function [parent=#Entity] SetPhysicsAttacker
-- @param  self
-- @param  #Player ent Player who gets the kills. Setting this to a non-player entity will not work.
-- @return #number timeLimit Time in seconds until the entity forgets its physics attacker and prevents it from getting the kill credit. _(Default: 5)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Allows you to set how fast an entity's animation will play, with 1.0 being
-- the default speed.
-- @function [parent=#Entity] SetPlaybackRate
-- @param  self
-- @param  #number fSpeed How fast the animation will play.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Moves the entity to the specified position.
-- 
-- **Note**: _If the new position doesn't take effect right away, you can use
-- **Entity:SetupBones** to force it to do so. This issue is especially common when
-- trying to render the same entity twice or more in a single frame at different positions._
-- 
-- **Warning**: _Entities with **Entity:GetSolid** of SOLID\_BBOX will have their angles reset!_
-- @function [parent=#Entity] SetPos
-- @param  self
-- @param  #Vector position The position to move the entity to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the specified pose parameter to the specified value. You should call
-- **Entity:InvalidateBoneCache** after calling this function.
-- 
-- **Note**: _Avoid calling this in draw hooks, especially when animating
-- things, as it might cause visual artifacts._
-- @function [parent=#Entity] SetPoseParameter
-- @param  self
-- @param  #string poseName Name of the pose parameter.
-- @param  #number poseValue The value to set the pose to.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whether an entity should be predictable or not. When an entity is set
-- as predictable, its DT vars can be changed during predicted hooks. This is
-- useful for entities which can be controlled by player input. Any datatable
-- value that mismatches from the server will be overridden and a prediction
-- error will be spewed. Weapons are predictable by default, and the drive
-- system uses this function to make the controlled prop predictable as well.
-- 
-- **Note**: _This function resets the datatable variables everytime it's
-- called, it should ideally be called when a player starts using the entity
-- and when it stops._
-- 
-- **Note**: _Entities set as predictable with this function will be unmarked
-- when the user lags and receives a full packet update, to handle such case
-- visit **GM:NotifyShouldTransmit**._
-- @function [parent=#Entity] SetPredictable
-- @param  self
-- @param  #boolean setPredictable Whether to make this entity predictable or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Prevents the server from sending any further information about the entity to
-- a player.
-- @function [parent=#Entity] SetPreventTransmit
-- @param  self
-- @param  #Player player The player to stop networking the entity to.
-- @param  #boolean stopTransmitting true to stop the entity from networking, false to make it network again.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the bone angles. This is used alongside Kinect in
-- **Entity:SetRagdollBuildFunction**, for more info see ragdoll_motion entity.
-- @function [parent=#Entity] SetRagdollAng
-- @param  self
-- @param  #number boneid Bone ID.
-- @param  #Angle pos Angle to set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the function to build the ragdoll. This is used alongside Kinect, for
-- more info see ragdoll_motion entity.
-- @function [parent=#Entity] SetRagdollBuildFunction
-- @param  self
-- @param  #function func The build function.
-- This function has one argument:
-- 
-- * _#Entity ragdoll_ : The ragdoll to build.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the bone position. This is used alongside Kinect in
-- **Entity:SetRagdollBuildFunction**, for more info see ragdoll_motion entity.
-- @function [parent=#Entity] SetRagdollPos
-- @param  self
-- @param  #number boneid Bone ID.
-- @param  #Vector pos Position to set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the render angles of the Entity.
-- @function [parent=#Entity] SetRenderAngles
-- @param  self
-- @param  #Angle newAngles The new render angles to be set to.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the render bounds for the entity. For world space coordinates see **Entity:SetRenderBoundsWS**.
-- @function [parent=#Entity] SetRenderBounds
-- @param  self
-- @param  #Vector mins The minimum corner of the bounds, relative to origin of the entity.
-- @param  #Vector maxs The maximum corner of the bounds, relative to origin of the entity.
-- @param  #Vector add If defined, adds this vector to maxs and subtracts this vector from mins. _(Default: Vector(0,0,0))_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the render bounds for the entity in world space coordinates. For
-- relative coordinates see **Entity:SetRenderBounds**.
-- @function [parent=#Entity] SetRenderBoundsWS
-- @param  self
-- @param  #Vector mins The minimum corner of the bounds, relative to origin of the world/map.
-- @param  #Vector maxs The maximum corner of the bounds, relative to origin of the world/map.
-- @param  #Vector add If defined, adds this vector to maxs and subtracts this vector from mins. _(Default: Vector(0,0,0))_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Used to specify a plane, past which an object will be visually clipped.
-- @function [parent=#Entity] SetRenderClipPlane
-- @param  self
-- @param  #Vector planeNormal The normal of the plane. Anything behind the normal will be clipped.
-- @param  #number planePosition The position of the plane.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables the use of clipping planes to "cut" objects.
-- @function [parent=#Entity] SetRenderClipPlaneEnabled
-- @param  self
-- @param  #boolean enabled Enable or disable clipping planes.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets entity's render FX.
-- @function [parent=#Entity] SetRenderFX
-- @param  self
-- @param  #number renderFX The new render FX to set. See **kRenderFx\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the render mode of the entity.
-- @function [parent=#Entity] SetRenderMode
-- @param  self
-- @param  #number renderMode New render mode to set. See **RENDERMODE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Set the origin in which the Entity will be drawn from.
-- @function [parent=#Entity] SetRenderOrigin
-- @param  self
-- @param  #Vector newOrigin The new origin in world coordinates where the Entity's model will now be rendered from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a save value for an entity.
-- @function [parent=#Entity] SetSaveValue
-- @param  self
-- @param  #string name Name of the save value to set.
-- @param  #any value Value to set.
-- @return #boolean Key successfully set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the entity's model sequence. If the specified sequence is already
-- active, the animation will not be restarted. See **Entity:ResetSequence** for a
-- function that restarts the animation even if it is already playing. In some 
-- cases you want to run Entity:ResetSequenceInfo to make this function run.
-- 
-- **Note**: _This will not work properly if called directly after calling
-- **Entity:SetModel**. Consider waiting until the next Tick._
-- 
-- **Note**: _Will not work on players due to the animations being reset every
-- frame by the base gamemode animation system in **GM:CalcMainActivity**. For
-- Players, use in **GM:UpdateAnimation** instead._
-- @function [parent=#Entity] SetSequence
-- @param  self
-- @param  #number sequenceId The sequence to play. Also accepts strings.
-- 
-- **Note**: _If set to a string, the function will automatically call **Entity:LookupSequence** to retrieve the sequence ID as a number._

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether or not the entity should make a physics contact sound when it's
-- been picked up by a player.
-- @function [parent=#Entity] SetShouldPlayPickupSound
-- @param  self
-- @param  #boolean playsound True to play the pickup sound, false otherwise. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets if entity should create a server ragdoll on death or a client one.
-- @function [parent=#Entity] SetShouldServerRagdoll
-- @param  self
-- @param  #boolean serverragdoll Set true if ragdoll should be created on server, false if on client.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the skin of the entity.
-- @function [parent=#Entity] SetSkin
-- @param  self
-- @param  #number skinIndex Index of the skin to use.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the solidity of an entity.
-- @function [parent=#Entity] SetSolid
-- @param  self
-- @param  #number solid_type The solid type. See the **SOLID\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets solid flag(s) for the entity. This overrides any other flags the entity
-- might have had. See **Entity:AddSolidFlags** for adding flags.
-- @function [parent=#Entity] SetSolidFlags
-- @param  self
-- @param  #number flags The flag(s) to set. See **FSOLID\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether the entity should use a spawn effect. See also **Entity:GetSpawnEffect**.
-- 
-- **Note**: _This function doesn't actually give the entity a spawn effect,
-- but it's merely a networked bool._
-- @function [parent=#Entity] SetSpawnEffect
-- @param  self
-- @param  #boolean spawnEffect Sets if we should show a spawn effect.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Overrides a single material on the model of this entity. To set a Lua
-- material created with **CreateMaterial**, just prepend a "!" to the material name.
-- @function [parent=#Entity] SetSubMaterial
-- @param  self
-- @param  #number index Index of the material to override, acceptable values are from 0 to 31. _(Default: nil)_
-- Indexes are by **Entity:GetMaterials**, but you have to subtract 1 from them.
-- If called with no arguments, all sub materials will be reset.
-- @param  #string material The material to override the default one with. Set to nil to revert to default material. _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Changes the table that can be accessed by indexing an entity. Each entity
-- starts with its own table by default.
-- @function [parent=#Entity] SetTable
-- @param  self
-- @param  #table tab Table for the entity to use.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- When this flag is set the entity will only transmit to the player when its
-- parent is transmitted. This is useful for things like viewmodel attachments
-- since without this flag they will transmit to everyone (and cause the
-- viewmodels to transmit to everyone too).
-- 
-- **Note**: _In the case of scripted entities, this will override
-- **ENTITY:UpdateTransmitState**._
-- @function [parent=#Entity] SetTransmitWithParent
-- @param  self
-- @param  #boolean onoff Will set the TransmitWithParent flag on or off.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Marks the entity as a trigger, so it will generate **ENTITY:StartTouch**,
-- **ENTITY:Touch** and **ENTITY:EndTouch** callbacks. Internally this is stored as
-- **FSOLID\_ Enums** flag.
-- @function [parent=#Entity] SetTrigger
-- @param  self
-- @param  #boolean maketrigger Make the entity trigger or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets whether an entity can be unfrozen, meaning that it cannot be unfrozen
-- using the physgun.
-- @function [parent=#Entity] SetUnFreezable
-- @param  self
-- @param  #boolean freezable True to make the entity unfreezable, false otherwise. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Forces the entity to reconfigure its bones. You might need to call this
-- after changing your model's scales or when manually drawing the entity
-- multiple times at different positions.
-- 
-- **Note**: _This calls the BuildBonePositions callback added via
-- **Entity:AddCallback**, so avoid calling this function inside it to prevent an
-- infinite loop._
-- @function [parent=#Entity] SetupBones
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Initializes the class names of an entity's phoneme mappings (mouth movement
-- data). This is called by default with argument "phonemes" when a flex-based
-- entity (such as an NPC) is created.
-- @function [parent=#Entity] SetupPhonemeMappings
-- @param  self
-- @param  #string fileRoot The file prefix of the phoneme mappings (relative to "garrysmod/expressions/").

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the use type of an entity, affecting how often **ENTITY:Use** will be
-- called for Lua entities.
-- @function [parent=#Entity] SetUseType
-- @param  self
-- @param  #number useType The use type to apply to the entity. Uses **\_USE Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Allows to quickly set variable to entity's Entity:GetTable.
-- 
-- **Note**: _This will not network the variable to client(s). You want
-- **Entity:SetNWString** and similar functions for that._
-- @function [parent=#Entity] SetVar
-- @param  self
-- @param  #any key Key of the value to set.
-- @param  #any value Value to set the variable to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the entity's velocity.
-- 
-- **Note**: _Actually binds to **CBaseEntity::SetBaseVelocity**() which sets the
-- entity's velocity due to forces applied by other entities._
-- 
-- **Warning**: _If applied to a player, this will actually **ADD** velocity,
-- not set it._
-- @function [parent=#Entity] SetVelocity
-- @param  self
-- @param  #Vector velocity The new velocity to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the model and associated weapon to this viewmodel entity. This is used
-- internally when the player switches weapon.
-- 
-- **Note**: _View models are not drawn without a weapons associated to them._
-- 
-- **Warning**: _This will silently fail if the entity is not a viewmodel._
-- @function [parent=#Entity] SetWeaponModel
-- @param  self
-- @param  #string viewModel The model string to give to this viewmodel.
-- Example: "models/weapons/c_smg1.mdl"
-- @param  #Weapon weapon The weapon entity to associate this viewmodel to. _(Default: NULL)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the amount of skins the entity has.
-- @function [parent=#Entity] SkinCount
-- @param  self
-- @return #number The skin count.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Moves the model instance from the source entity to this entity. This can be
-- used to transfer decals that have been applied on one entity to another.
-- Both entities must have the same model.
-- @function [parent=#Entity] SnatchModelInstance
-- @param  self
-- @param  #Entity srcEntity Entity to move the model instance from.
-- @return #boolean Whether the operation was successful or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Initializes the entity and starts its networking. If called on a player, it
-- will respawn them. This calls **ENTITY:Initialize** on Lua-defined entities.
-- @function [parent=#Entity] Spawn
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Starts a "looping" sound. As with any other sound playing methods, this
-- function expects the sound file to be looping itself and will not
-- automatically loop a non looping sound file as one might expect. This
-- function is almost identical to **CreateSound**, with the exception of the sound
-- being created in the STATIC channel and with normal attenuation.
-- See also **Entity:StopLoopingSound**.
-- @function [parent=#Entity] StartLoopingSound
-- @param  self
-- @param  #string sound Sound to play. Can be either a sound script or a filepath.
-- @return #number The ID number of started sound starting with 0, or -1 if we failed for some reason.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Starts a motion controller in the physics engine tied to this entity's
-- PhysObj, which enables the use of **ENTITY:PhysicsSimulate**. The motion
-- controller can later be destroyed via **Entity:StopMotionController**. Motion
-- controllers are used internally to control other Entities' PhysObjects, such
-- as the Gravity Gun, +use pickup and the Physics Gun. This function should be
-- called every time you recreate the Entity's PhysObj. Or alternatively you
-- should call **Entity:AddToMotionController** on the new PhysObj.  
-- Also see **Entity:AddToMotionController** and **Entity:RemoveFromMotionController**.
-- 
-- **Note**: _Only works on a scripted Entity of anim type._
-- @function [parent=#Entity] StartMotionController
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stops all particle effects parented to the entity and immediately destroys them.
-- @function [parent=#Entity] StopAndDestroyParticles
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stops a sound created by Entity:StartLoopingSound.
-- @function [parent=#Entity] StopLoopingSound
-- @param  self
-- @param  #number id The sound ID returned by **Entity:StartLoopingSound**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stops the motion controller created with **Entity:StartMotionController**.
-- @function [parent=#Entity] StopMotionController
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stops all particle effects parented to the entity. This is ran automatically
-- on every client by **Entity:StopParticles** if called on the server.
-- @function [parent=#Entity] StopParticleEmission
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stops any attached to the entity .pcf particles using **ParticleEffectAttach**.
-- On client, this is the same as **Entity:StopParticleEmission**. (and you should
-- use **Entity:StopParticleEmission** instead)  
-- On server, this is the same as running **Entity:StopParticleEmission** on
-- every client.
-- @function [parent=#Entity] StopParticles
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stops all particle effects parented to the entity with given name.
-- @function [parent=#Entity] StopParticlesNamed
-- @param  self
-- @param  #string name The name of the particle to stop.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stops all particle effects parented to the entity with given name on given attachment.
-- @function [parent=#Entity] StopParticlesWithNameAndAttachment
-- @param  self
-- @param  #string name The name of the particle to stop.
-- @param  #number attachment The attachment of the entity to stop particles on.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stops emitting the given sound script from the entity, especially useful for
-- looping sound scripts.
-- 
-- **Note**: _This only works with sound scripts (**sound.Add**), using a file path
-- will not work!_
-- @function [parent=#Entity] StopSound
-- @param  self
-- @param  #string soundscript The name of the sound script to stop playback of.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Applies the specified amount of damage to the entity with **DMG\_GENERIC** flag.
-- @function [parent=#Entity] TakeDamage
-- @param  self
-- @param  #number damageAmount The amount of damage to be applied.
-- @param  #Entity attacker The entity that initiated the attack that caused the damage.
-- @param  #Entity inflictor The entity that applied the damage, ex: a weapon.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Applies the damage specified by the damage info to the entity.
-- @function [parent=#Entity] TakeDamageInfo
-- @param  self
-- @param  #CTakeDamageInfo damageInfo The damage to apply.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Applies physics damage to the entity.
-- @function [parent=#Entity] TakePhysicsDamage
-- @param  self
-- @param  #CTakeDamageInfo dmginfo The damage to apply.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Check if the given position or entity is within this entity's PVS.
-- 
-- **Note**: _The function won't take in to account **AddOriginToPVS** and the like._
-- @function [parent=#Entity] TestPVS
-- @param  self
-- @param  #any testPoint Entity or Vector to test against.
-- If an entity is given, this function will test using its bounding box.
-- @return #boolean True if the testPoint is within our PVS.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the ID of a PhysObj attached to the given bone. To be used with
-- **Entity:GetPhysicsObjectNum**. See **Entity:TranslatePhysBoneToBone** for
-- reverse function.
-- @function [parent=#Entity] TranslateBoneToPhysBone
-- @param  self
-- @param  #number boneID The ID of a bone to look up the "physics root" bone of.
-- @return #number The PhysObj ID of the given bone. -1 if we somehow cannot translate.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the boneID of the bone the given PhysObj is attached to. See
-- **Entity:TranslateBoneToPhysBone** for reverse function.
-- @function [parent=#Entity] TranslatePhysBoneToBone
-- @param  self
-- @param  #number physNum The PhysObj number on the entity.
-- @return #number The boneID of the bone the PhysObj is attached to.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Activates the entity, as if a player pressed the Use key (Default E) on it.
-- @function [parent=#Entity] Use
-- @param  self
-- @param  #Player Activator The player to credit with activating the entity.
-- @param  #Entity Caller Used when an entity instead of a player should trigger the use.
-- @param  #number UseType The type of use to trigger. See **USE\_ Enums**.
-- @param  #number Integer You can usually set this to 1.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Animations will be handled purely clientside instead of a fixed animtime,
-- enabling interpolation. This does not affect layers and gestures.
-- 
-- **Note**: _Does nothing on server._
-- @function [parent=#Entity] UseClientSideAnimation
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Enables or disables trigger bounds. This will give the entity a "trigger box"
-- that extends around its bounding box by iBloatSize units in X/Y and
-- (iBloatSize/2) in +Z (-Z remains the same). The trigger box is world aligned
-- and will work regardless of the object's solidity and collision group. It
-- will be visible as a light blue box when the ent_bbox console command is used.
-- Valve use trigger boxes for all pickup items. Their bloat size is 24, a
-- surprisingly large figure.
-- @function [parent=#Entity] UseTriggerBounds
-- @param  self
-- @param  #boolean enable Should we enable or disable the bounds.
-- @param  #number bloat The distance/size of the trigger bounds. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the index of this view model, it can be used to identify which one
-- of the player's view models this entity is.
-- @function [parent=#Entity] ViewModelIndex
-- @param  self
-- @return #number View model index, ranges from 0 to 2, nil if the entity is not a view model.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the target/given entity is visible from the this entity.
-- This is meant to be used only with NPCs.  
-- Differences from a simple trace include:
-- 
-- * If target has FL\_NOTARGET, returns false
-- * If ai_ignoreplayers is turned on and target is a player, returns false
-- * Reacts to ai\_LOS\_mode:
--  * If 1, does a simple trace with COLLISION\_GROUP\_NONE and MASK\_BLOCKLOS
--  * If not, does a trace with MASK\_BLOCKLOS\_AND\_NPCS ( - CONTENTS\_BLOCKLOS is target is player ) and a custom LOS filter. (**CTraceFilterLOS**)
-- * Returns true if hits a vehicle the target is driving
-- @function [parent=#Entity] Visible
-- @param  self
-- @param  #Entity target Entity to check for visibility to.
-- @return #boolean If the entities can see each other.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if supplied vector is visible from the entity's line of sight.
-- This is achieved similarly to a trace.
-- @function [parent=#Entity] VisibleVec
-- @param  self
-- @param  #Vector pos The position to check for visibility.
-- @return #boolean Within line of sight.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an integer that represents how deep in water the entity is.
-- 
-- * 0 - The entity isn't in water.
-- * 1 - Slightly submerged (at least to the feet).
-- * 2 - The majority of the entity is submerged (at least to the waist).
-- * 3 - Completely submerged.
-- @function [parent=#Entity] WaterLevel
-- @param  self
-- @return #number The water level.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the activity of the entity's active weapon.
-- 
-- **Note**: _This does nothing on the client._
-- 
-- **Note**: _Only works for CBaseCombatCharacter entities, which includes
-- players and NPCs._
-- @function [parent=#Entity] Weapon_SetActivity
-- @param  self
-- @param  #number act Activity number. See **ACT\_ Enums**.
-- @param  #number duration How long the animation should take in seconds.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Calls and returns **Weapon:TranslateActivity** on the weapon the entity (player
-- or NPC) carries. Despite existing on client, it doesn't actually do anything
-- on client.
-- @function [parent=#Entity] Weapon_TranslateActivity
-- @param  self
-- @param  #number act The activity to translate.
-- @return #number The translated activity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns two vectors representing the minimum and maximum extent of the
-- entity's bounding box.
-- @function [parent=#Entity] WorldSpaceAABB
-- @param  self
-- @return #Vector, #Vector The minimum and maximum vector for the entity's bounding box.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the center of the entity according to its collision model.
-- @function [parent=#Entity] WorldSpaceCenter
-- @param  self
-- @return #Vector The center of the entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Converts a worldspace vector into a vector local to an entity.
-- @function [parent=#Entity] WorldToLocal
-- @param  self
-- @param  #Vector wpos The world vector.
-- @return #Vector The local vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Converts world angles to local angles (local to the entity).
-- @function [parent=#Entity] WorldToLocalAngles
-- @param  self
-- @param  #Angle ang The world angles.
-- @return #Angle The local angles.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This is the file object. It used used primarily to read or write binary data
-- from files. The object is returned by file.Open.
-- @type File

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Dumps the file changes to disk and closes the file handle which makes the
-- handle useless.
-- @function [parent=#File] Close
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Dumps the file changes to disk and saves the file.
-- @function [parent=#File] Flush
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads the specified amount of chars and returns them as a binary string.
-- @function [parent=#File] Read
-- @param  self
-- @param  #number length Reads the specified amount of chars.
-- @return #string The file data.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads one byte of the file and returns whether that byte was not 0.
-- @function [parent=#File] ReadBool
-- @param  self
-- @return #boolean The boolean val.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads one unsigned 8-bit integer from the file.
-- @function [parent=#File] ReadByte
-- @param  self
-- @return #number The unsigned 8-bit integer from the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads 8 bytes from the file converts them to a double and returns them.
-- @function [parent=#File] ReadDouble
-- @param  self
-- @return #number The double value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads 4 bytes from the file converts them to a float and returns them.
-- @function [parent=#File] ReadFloat
-- @param  self
-- @return #number The float value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the contents of the file from the current position up until the end
-- of the current line. This function will not return more than 8192 characters.
-- @function [parent=#File] ReadLine
-- @param  self
-- @return #string The string of data from the read line.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a signed 32-bit integer from the file.
-- @function [parent=#File] ReadLong
-- @param  self
-- @return #number A signed 32-bit integer.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a signed 16-bit integer from the file.
-- @function [parent=#File] ReadShort
-- @param  self
-- @return #number A signed 16-bit integer.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads an unsigned 32-bit integer from the file.
-- @function [parent=#File] ReadULong
-- @param  self
-- @return #number An unsigned 32-bit integer

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads an unsigned 16-bit integer from the file.
-- @function [parent=#File] ReadUShort
-- @param  self
-- @return #number The 16-bit integer.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the file pointer to the specified position.
-- @function [parent=#File] Seek
-- @param  self
-- @param  #number pos Pointer position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the size of the file in bytes.
-- @function [parent=#File] Size
-- @param  self
-- @return #number The size of the file in bytes.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Moves the file pointer by the specified amount of chars.
-- @function [parent=#File] Skip
-- @param  self
-- @param  #number amount The amount of chars to skip, can be negative to skip backwards.
-- @return #number The number of bytes successfully skipped.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the current position of the file pointer.
-- @function [parent=#File] Tell
-- @param  self
-- @return #The position of the file pointer.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes the given string into the file.
-- @function [parent=#File] Write
-- @param  self
-- @param  #string data Binary data to write to the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a boolean value to the file as one byte.
-- @function [parent=#File] WriteBool
-- @param  self
-- @param  #boolean bool The bool to be written to the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Write an 8-bit unsigned integer to the file.
-- @function [parent=#File] WriteByte
-- @param  self
-- @param  #number uint8 The 8-bit unsigned integer to be written to the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a 8 byte floating point double to the file.
-- @function [parent=#File] WriteDouble
-- @param  self
-- @param  #number double The double to be written to the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a 4 byte float to the file.
-- @function [parent=#File] WriteFloat
-- @param  self
-- @param  #number float The float to be written to the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a 32-bit signed integer to the file.
-- @function [parent=#File] WriteLong
-- @param  self
-- @param  #number int32 The 32-bit signed integer to be written to the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a 16-bit signed integer to the file.
-- @function [parent=#File] WriteShort
-- @param  self
-- @param  #number int16 The 16-bit signed integer to be written to the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes an unsigned 32-bit integer to the file.
-- @function [parent=#File] WriteULong
-- @param  self
-- @param  #number uint32 The unsigned 32-bit integer to be written to the file.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes an unsigned 16-bit integer to the file.
-- @function [parent=#File] WriteUShort
-- @param  self
-- @param  #number uint16 The unsigned 16-bit integer to the file.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- A sound channel returned by a callback of **sound.PlayURL** and **sound.PlayFile**.
-- @type IGModAudioChannel

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables or disables looping of audio channel, requires noblock flag.
-- @function [parent=#IGModAudioChannel] EnableLooping
-- @param  self
-- @param  #boolean enable Enable or disable looping of this audio channel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Computes the DFT (discrete Fourier transform) of the sound channel. The size
-- parameter specifies the number of consecutive audio samples to use as the
-- input to the DFT and is restricted to a power of two. A Hann window is
-- applied to the input data. The computed DFT has the same number of
-- frequency bins as the number of samples. Only half of this DFT is returned,
-- since the DFT magnitudes are symmetric for real input data. The magnitudes
-- of the DFT (values from 0 to 1) are used to fill the output table, starting
-- at index 1.  
-- **Visualization protip**: For a size N DFT, bin k (1-indexed) corresponds to
-- a frequency of (k - 1) / N * sampleRate.  
-- **Visualization protip**: Sound energy is proportional to the square of the
-- magnitudes. Adding magnitudes together makes no sense physically, but adding
-- energies does.  
-- **Visualization protip**: The human ear works on a logarithmic amplitude
-- scale. You can convert to decibels by taking 20 log10 of frequency
-- magnitudes, or 10 log10 of energy. The decibel values will range from
-- -infinity to 0.
-- @function [parent=#IGModAudioChannel] FFT
-- @param  self
-- @param  #table tbl The table to output the DFT magnitudes (numbers between 0 and 1) into. Indices start from 1.
-- @param  #number size The number of samples to use. See **FFT\_ Enums**.
-- @return #number The number of frequency bins that have been filled in the output table.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns 3D cone of the sound channel. See **IGModAudioChannel:Set3DCone**.
-- @function [parent=#IGModAudioChannel] Get3DCone
-- @param  self
-- @return #number, #number, #number The inside projection angle, outside projection and delta-volume outside the outer projection.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns 3D fade distances of a sound channel.
-- @function [parent=#IGModAudioChannel] Get3DFadeDistance
-- @param  self
-- @return #number, #number The minimum and maximum fade distance.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the average bit rate of the sound channel.
-- @function [parent=#IGModAudioChannel] GetAverageBitRate
-- @param  self
-- @return #number The average bit rate of the sound channel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Retrieves the number of bits per sample of the sound channel. Doesn't work
-- for mp3 and ogg files.
-- @function [parent=#IGModAudioChannel] GetBitsPerSample
-- @param  self
-- @return #number Number of bits per sample, or 0 if unknown.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the filename for the sound channel.
-- @function [parent=#IGModAudioChannel] GetFileName
-- @param  self
-- @return #string The file name. This will not be always what you have put into the **sound.PlayURL** as first argument.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the length of sound played by the sound channel.
-- @function [parent=#IGModAudioChannel] GetLength
-- @param  self
-- @return #number The length of the sound. This value seems to be less then 0 for continuous radio streams.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the right and left levels of sound played by the sound channel.
-- @function [parent=#IGModAudioChannel] GetLevel
-- @param  self
-- @return #number, #number The left and right sounds levels, between 0 and 1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the playback rate of the sound channel.
-- @function [parent=#IGModAudioChannel] GetPlaybackRate
-- @param  self
-- @return #number The current playback rate of the sound channel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns position of the sound channel.
-- @function [parent=#IGModAudioChannel] GetPos
-- @param  self
-- @return #Vector The position of the sound channel, previously set by **IGModAudioChannel:SetPos**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the sample rate for currently playing sound.
-- @function [parent=#IGModAudioChannel] GetSamplingRate
-- @param  self
-- @return #number The sample rate in MHz. This should always be 44100.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the state of a sound channel.
-- @function [parent=#IGModAudioChannel] GetState
-- @param  self
-- @return #number The state of the sound channel, see **GMOD\_CHANNEL\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current time of the sound channel.
-- @function [parent=#IGModAudioChannel] GetTime
-- @param  self
-- @return #number The current time of the stream.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns volume of a sound channel.
-- @function [parent=#IGModAudioChannel] GetVolume
-- @param  self
-- @return #number The volume of the sound channel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the sound channel is in 3D mode or not.
-- @function [parent=#IGModAudioChannel] Is3D
-- @param  self
-- @return #boolean Is 3D or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the audio stream is block streamed or not.
-- @function [parent=#IGModAudioChannel] IsBlockStreamed
-- @param  self
-- @return #boolean Is the audio stream block streamed or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the sound channel is looping or not.
-- @function [parent=#IGModAudioChannel] IsLooping
-- @param  self
-- @return #boolean Is looping or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the sound channel is streamed from the Internet or not.
-- @function [parent=#IGModAudioChannel] IsOnline
-- @param  self
-- @return #boolean Is online or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the sound channel is valid or not.
-- @function [parent=#IGModAudioChannel] IsValid
-- @param  self
-- @return #boolean Is the sound channel valid or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pauses the stream. It can be started again using **IGModAudioChannel:Play**.
-- @function [parent=#IGModAudioChannel] Pause
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Starts playing the stream.
-- @function [parent=#IGModAudioChannel] Play
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets 3D cone of the sound channel.
-- @function [parent=#IGModAudioChannel] Set3DCone
-- @param  self
-- @param  #number innerAngle The angle of the inside projection cone in degrees.
-- Range is from 0 (no cone) to 360 (sphere), -1 = leave current.
-- @param  #number outerAngle The angle of the outside projection cone in degrees.
-- Range is from 0 (no cone) to 360 (sphere), -1 = leave current.
-- @param  #number outerVolume The delta-volume outside the outer projection cone.
-- Range is from 0 (silent) to 1 (same as inside the cone), less than 0 = leave current.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets 3D fade distances of a sound channel.
-- @function [parent=#IGModAudioChannel] Set3DFadeDistance
-- @param  self
-- @param  #number min The minimum distance. The channel's volume is at maximum when the listener is within this distance.
-- 0 or less = leave current.
-- @param  #number max The maximum distance. The channel's volume stops decreasing when the listener is beyond this distance.
-- 0 or less = leave current.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the playback rate of the sound channel. May not work with high values
-- for radio streams.
-- @function [parent=#IGModAudioChannel] SetPlaybackRate
-- @param  self
-- @param  #number rate Playback rate to set to. 1 is normal speed, 0.5 is half the normal speed, etc.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets position of sound channel in case the sound channel has a 3d option set.
-- @function [parent=#IGModAudioChannel] SetPos
-- @param  self
-- @param  #Vector pos The position to put the sound into.
-- @param  #Vector dir The direction of the sound. _(Default: Vector(0,0,0))_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the sound channel to specified time (Rewind to that position of the song).
-- Does not work on online radio streams. Streamed sounds must have "noblock"
-- parameter for this to work.
-- @function [parent=#IGModAudioChannel] SetTime
-- @param  self
-- @param  #number secs The time to set the stream to, in seconds.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the volume of a sound channel.
-- @function [parent=#IGModAudioChannel] SetVolume
-- @param  self
-- @param  #number volume Volume to set, a number between 0 and 1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stop the stream. It can be started again using **IGModAudioChannel:Play**.
-- @function [parent=#IGModAudioChannel] Stop
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- A Material object. It represents a game material, similarly to how a .vmt
-- file does. It can be created with **Material** or **CreateMaterial**.
-- @type IMaterial

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the color of the specified pixel of the $basetexture, only works for
-- materials created from PNG files. Basically identical to **ITexture:GetColor**
-- used on **IMaterial:GetTexture**("$basetexture").
-- @function [parent=#IMaterial] GetColor
-- @param  self
-- @param  #number x The X coordinate.
-- @param  #number y The Y coordinate.
-- @return #table The color of the pixel as a **Color structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the specified material value as a float, or nil if the value is not set.
-- @function [parent=#IMaterial] GetFloat
-- @param  self
-- @param  #string materialFloat The name of the material value.
-- @return #number Material's float value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the specified material value as a int, rounds the value if its a
-- float, or nil if the value is not set.
-- @function [parent=#IMaterial] GetInt
-- @param  self
-- @param  #string materialInt The name of the material integer.
-- @return #number The materials number.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets all the key values defined for the material.
-- @function [parent=#IMaterial] GetKeyValues
-- @param  self
-- @return #table The material's key values.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the specified material matrix as a int, or nil if the value is not
-- set or is not a matrix.
-- @function [parent=#IMaterial] GetMatrix
-- @param  self
-- @param  #string materialMatrix The name of the material matrix.
-- @return #VMatrix The material's matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the name of the material, in most cases the path.
-- @function [parent=#IMaterial] GetName
-- @param  self
-- @return #string Material name/path.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the name of the materials shader.
-- @function [parent=#IMaterial] GetShader
-- @param  self
-- @return #string The material's shader name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the specified material string, or nil if the value is not set or if
-- the value can not be converted to a string.
-- @function [parent=#IMaterial] GetString
-- @param  self
-- @param  #string materialString The name of the material string.
-- @return #string The value as a string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an ITexture based on the passed shader parameter.
-- @function [parent=#IMaterial] GetTexture
-- @param  self
-- @param  #string param The shader parameter to retrieve. This should normally be $basetexture.
-- @return #ITexture The value of the shader parameter. Returns nothing if the param doesn't exist.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the specified material vector, or nil if the value is not set. See
-- also **IMaterial:GetVectorLinear**.
-- @function [parent=#IMaterial] GetVector
-- @param  self
-- @param  #string materialVector The name of the material vector.
-- @return #Vector The color vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the specified material linear color vector, or nil if the value is
-- not set. See also **IMaterial:GetVector**.
-- @function [parent=#IMaterial] GetVectorLinear
-- @param  self
-- @param  #string materialVector The name of the material vector.
-- @return #Vector The linear color vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the height of the member texture set for $basetexture.
-- @function [parent=#IMaterial] Height
-- @param  self
-- @return #number Texture height.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the material was not loaded successfully.
-- @function [parent=#IMaterial] IsError
-- @param  self
-- @return #boolean Is error.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Recomputes the material's snapshot. This needs to be called if you have
-- changed variables on your material and it isn't changing.
-- 
-- Be careful though - this function is slow - so try to call it only when needed!
-- @function [parent=#IMaterial] Recompute
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the specified material float to the specified float, does nothing on a
-- type mismatch.
-- @function [parent=#IMaterial] SetFloat
-- @param  self
-- @param  #string materialFloat The name of the material float.
-- @param  #number float The new float value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the specified material value to the specified int, does nothing on a
-- type mismatch.
-- @function [parent=#IMaterial] SetInt
-- @param  self
-- @param  #string materialInt The name of the material int.
-- @param  #number int The new int value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the specified material value to the specified matrix, does nothing on a
-- type mismatch.
-- @function [parent=#IMaterial] SetMatrix
-- @param  self
-- @param  #string materialMatrix The name of the material int.
-- @param  #VMatrix matrix The new matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the specified material value to the specified string, does nothing on a
-- type mismatch.
-- @function [parent=#IMaterial] SetString
-- @param  self
-- @param  #string materialString The name of the material string.
-- @param  #string string The new string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the specified material texture to the specified texture, does nothing
-- on a type mismatch.
-- @function [parent=#IMaterial] SetTexture
-- @param  self
-- @param  #string materialTexture The name of the keyvalue on the material to store the texture on.
-- @param  #ITexture texture The new texture. This can also be a string, the name of the new texture.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Unsets the value for the specified material value.
-- @function [parent=#IMaterial] SetUndefined
-- @param  self
-- @param  #string materialValueName The name of the material value to be unset.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the specified material vector to the specified vector, does nothing on a
-- type mismatch.
-- @function [parent=#IMaterial] SetVector
-- @param  self
-- @param  #string MaterialVector The name of the material vector.
-- @param  #Vector vec The new vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the width of the member texture set for $basetexture.
-- @function [parent=#IMaterial] Width
-- @param  self
-- @return #number Texture width.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renderable mesh object, can be used to create models on the fly. The only
-- way to create your own IMesh object is to call **Mesh**.
-- @type IMesh

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Builds the mesh from a table mesh vertexes.
-- @function [parent=#IMesh] BuildFromTriangles
-- @param  self
-- @param  #table vertexes A table consisting of **MeshVertex structures**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Deletes the mesh and frees the memory used by it.
-- @function [parent=#IMesh] Destroy
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Renders the mesh with the active matrix.
-- @function [parent=#IMesh] Draw
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- The object used in the saverestore library, mainly in **saverestore.AddRestoreHook**.
-- It allows you to read blocks directly from the save game files used by
-- Half-Life 2 save system when such save is loaded.
-- @type IRestore

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Ends current data block started with **IRestore:StartBlock** and returns to the
-- parent block. To avoid all sorts of errors, you must end all blocks you start.
-- @function [parent=#IRestore] EndBlock
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads next bytes from the restore object as an Angle.
-- @function [parent=#IRestore] ReadAngle
-- @param  self
-- @return #Angle The angle that has been read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads next bytes from the restore object as a boolean.
-- @function [parent=#IRestore] ReadBool
-- @param  self
-- @return #boolean The boolean that has been read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads next bytes from the restore object as an Entity.
-- @function [parent=#IRestore] ReadEntity
-- @param  self
-- @return #Entity The entity that has been read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads next bytes from the restore object as a floating point number.
-- @function [parent=#IRestore] ReadFloat
-- @param  self
-- @return #number The read floating point number.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads next bytes from the restore object as an integer number.
-- @function [parent=#IRestore] ReadInt
-- @param  self
-- @return #number The read integer number.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads next bytes from the restore object as a string.
-- @function [parent=#IRestore] ReadString
-- @param  self
-- @return #string The read string. Maximum length is 1024.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads next bytes from the restore object as a Vector.
-- @function [parent=#IRestore] ReadVector
-- @param  self
-- @return #Vector The read vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Loads next block of data to be read inside current block. Blocks must be
-- ended with **IRestore:EndBlock**.
-- @function [parent=#IRestore] StartBlock
-- @param  self
-- @return #string The name of the next data block to be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- The object used in the saverestore library, mainly in **saverestore.AddSaveHook**.
-- It allows you to write blocks directly into the save game files used by
-- Half-Life 2 save system when such save is being saved.
-- @type ISave

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Ends current data block started with **ISave:StartBlock** and returns to the
-- parent block. To avoid all sorts of errors, you must end all blocks you start.
-- @function [parent=#ISave] EndBlock
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Starts a new block of data that you can write to inside current block.
-- Blocks must be ended with **ISave:EndBlock**.
-- @function [parent=#ISave] StartBlock
-- @param  self
-- @param  #string name Name of the new block. Used for determining which block is which, returned by **IRestore:StartBlock** during game load.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes an Angle to the save object.
-- @function [parent=#ISave] WriteAngle
-- @param  self
-- @param  #Angle ang The angle to write.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a boolean to the save object.
-- @function [parent=#ISave] WriteBool
-- @param  self
-- @param  #boolean bool The boolean to write.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes an Entity to the save object.
-- @function [parent=#ISave] WriteEntity
-- @param  self
-- @param  #Entity ent The entity to write.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a floating point number to the save object.
-- @function [parent=#ISave] WriteFloat
-- @param  self
-- @param  #number float The floating point number to write.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes an integer number to the save object.
-- @function [parent=#ISave] WriteInt
-- @param  self
-- @param  #number int The integer number to write.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a string to the save object.
-- @function [parent=#ISave] WriteString
-- @param  self
-- @param  #string str The string to write. Maximum length is 1024.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a Vector to the save object.
-- @function [parent=#ISave] WriteVector
-- @param  self
-- @param  #Vector vec The vector to write.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- An object representing game texture, like a .vtf file. Do not confuse with
-- **IMaterial**. Returned by **IMaterial:GetTexture**.
-- @type ITexture

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Invokes the generator of the texture. Reloads file based textures from disk
-- and clears render target textures.
-- @function [parent=#ITexture] Download
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the color of the specified pixel, only works for textures created
-- from PNG files.
-- @function [parent=#ITexture] GetColor
-- @param  self
-- @param  #number x The X coordinate.
-- @param  #number y The Y coordinate.
-- @return #table The color of the pixel as a **Color structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the true unmodified height of the texture.
-- @function [parent=#ITexture] GetMappingHeight
-- @param  self
-- @return #number Texture's true height.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the true unmodified width of the texture.
-- @function [parent=#ITexture] GetMappingWidth
-- @param  self
-- @return #number Texture's true width.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the name of the texture, in most cases the path.
-- @function [parent=#ITexture] GetName
-- @param  self
-- @return #string Texture name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the modified height of the texture, this value may be affected by
-- mipmapping and other factors.
-- @function [parent=#ITexture] Height
-- @param  self
-- @return #number Texture's modified height.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the texture is invalid or not.
-- @function [parent=#ITexture] IsError
-- @param  self
-- @return #boolean Is texture valid.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the modified width of the texture, this value may be affected by
-- mipmapping and other factors.
-- @function [parent=#ITexture] Width
-- @param  self
-- @return #number Texture's modified width.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This is returned from **video.Record**.
-- @type IVideoWriter

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds the current framebuffer to the video stream.
-- @function [parent=#IVideoWriter] AddFrame
-- @param  self
-- @param  #number frameTime Usually set to what **FrameTime** is, or simply 1/fps.
-- @param  #boolean downsample If true it will downsample the whole screenspace to the videos width and height, otherwise it will just record from the top left corner to the given width and height and therefor not the whole screen.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Ends the video recording and dumps it to disk.
-- @function [parent=#IVideoWriter] Finish
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the height of the video stream.
-- @function [parent=#IVideoWriter] Height
-- @param  self
-- @return #number Video's height.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whether to record sound or not.
-- @function [parent=#IVideoWriter] SetRecordSound
-- @param  self
-- @param  #boolean record Record sound or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the width of the video stream.
-- @function [parent=#IVideoWriter] Width
-- @param  self
-- @return #number Video's width.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Object containing parsed markup for later rendering. Created by **markup.Parse**.
-- @type MarkupObject

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Creates a new empty markupobject. Use **markup.Parse** instead of calling this.
-- @function [parent=#MarkupObject] Create
-- @param  self
-- @return #MarkupObject The created object.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws the computed markupobject to the screen.
-- @function [parent=#MarkupObject] Draw
-- @param  self
-- @param  #number xOffset The X coordinate on the screen.
-- @param  #number yOffset The Y coordinate on the screen.
-- @param  #number xAlign The alignment of the x coordinate using **TEXT\_ALIGN\_ Enums**.
-- @param  #number yAlign The alignment of the y coordinate using **TEXT\_ALIGN\_ Enums**.
-- @param  #number alphaoverride Sets the alpha of all drawn objects to this. _(Default: 255)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets computed the height of the markupobject.
-- @function [parent=#MarkupObject] GetHeight
-- @param  self
-- @return #number The computed height.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets computed the width of the markupobject.
-- @function [parent=#MarkupObject] GetWidth
-- @param  self
-- @return #number The computed width.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets computed the width and height of the markupobject.
-- @function [parent=#MarkupObject] Size
-- @param  self
-- @return #number, #number The computed width and height.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This is a list of all methods only available for NPCs. It is also possible
-- to call Entity functions on NPCs.
-- @type NPC
-- @extends Entity

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes the NPC like, hate, feel neutral towards, or fear the entity in
-- question. If you want to setup relationship towards a certain entity class,
-- use **NPC:AddRelationship**.
-- @function [parent=#NPC] AddEntityRelationship
-- @param  self
-- @param  #Entity target The entity for the relationship to be applied to.
-- @param  #number disposition A **D\_ Enums** representing the relationship type.
-- @param  #number priority How strong the relationship is.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Changes how an NPC feels towards another NPC. If you want to setup
-- relationship towards a certain entity, use **NPC:AddEntityRelationship**.
-- @function [parent=#NPC] AddRelationship
-- @param  self
-- @param  #string relationstring A string representing how the relationship should be set up.
-- Should be formatted as "npc\_class **D\_ Enums** numberPriority".

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Force an NPC to play his Alert sound.
-- @function [parent=#NPC] AlertSound
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a capability to the NPC.
-- @function [parent=#NPC] CapabilitiesAdd
-- @param  self
-- @param  #number capabilities Capabilities to add, see **CAP\_ Enums**

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all of Capabilities the NPC has.
-- @function [parent=#NPC] CapabilitiesClear
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the NPC's capabilities along the ones defined on its weapon.
-- @function [parent=#NPC] CapabilitiesGet
-- @param  self
-- @return #number The capabilities as a bitflag. See **CAP\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Remove a certain capability.
-- @function [parent=#NPC] CapabilitiesRemove
-- @param  self
-- @param  #number capabilities Capabilities to remove, see **CAP\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the NPC class. Do not confuse with **Entity:GetClass**!
-- @function [parent=#NPC] Classify
-- @param  self
-- @return #number See **CLASS\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Clears out the specified **COND\_ Enums** on this NPC.
-- @function [parent=#NPC] ClearCondition
-- @param  self
-- @param  #number condition The **COND\_ Enums** to clear out.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Clears the Enemy from the NPC's memory, effectively forgetting it until met
-- again with either the NPC vision or with **NPC:UpdateEnemyMemory**.
-- @function [parent=#NPC] ClearEnemyMemory
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Clears the NPC's current expression which can be set with **NPC:SetExpression**.
-- @function [parent=#NPC] ClearExpression
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Clears the current NPC goal or target.
-- @function [parent=#NPC] ClearGoal
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Stops the current schedule that the NPC is doing.
-- @function [parent=#NPC] ClearSchedule
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Translates condition ID to a string.
-- @function [parent=#NPC] ConditionName
-- @param  self
-- @param  #number cond The NPCs condition ID, see **COND\_ Enums**.
-- @return #string A human understandable string equivalent of that condition.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the way the NPC "feels" about the entity.
-- @function [parent=#NPC] Disposition
-- @param  self
-- @param  #Entity ent The entity to get the disposition from.
-- @return #number The NPCs disposition, see **D\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes an NPC exit a scripted sequence, if one is playing.
-- @function [parent=#NPC] ExitScriptedSequence
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Force an NPC to play his Fear sound.
-- @function [parent=#NPC] FearSound
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Force an NPC to play its FoundEnemy sound.
-- @function [parent=#NPC] FoundEnemySound
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the weapon the NPC is currently carrying, or NULL.
-- @function [parent=#NPC] GetActiveWeapon
-- @param  self
-- @return #Entity The NPCs current weapon.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the NPC's current activity.
-- @function [parent=#NPC] GetActivity
-- @param  self
-- @return #number Current activity, see **ACT\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the aim vector of the NPC. NPC alternative of **Player:GetAimVector**.
-- @function [parent=#NPC] GetAimVector
-- @param  self
-- @return #Vector The aim direction of the NPC.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the activity to be played when the NPC arrives at its goal.
-- @function [parent=#NPC] GetArrivalActivity
-- @param  self
-- @return #number

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] GetArrivalSequence
-- @param  self
-- @return #number

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the entity blocking the NPC along its path.
-- @function [parent=#NPC] GetBlockingEntity
-- @param  self
-- @return #Entity Blocking entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the NPC's current schedule.
-- @function [parent=#NPC] GetCurrentSchedule
-- @param  self
-- @return #number The NPCs schedule, see **SCHED\_ Enums** or -1 if we failed for some reason

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns how proficient (skilled) an NPC is with its current weapon.
-- @function [parent=#NPC] GetCurrentWeaponProficiency
-- @param  self
-- @return #number NPC's proficiency for current weapon. See **WEAPON\_PROFICIENCY\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the entity that this NPC is trying to fight.
-- @function [parent=#NPC] GetEnemy
-- @param  self
-- @return #NPC Enemy NPC.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the expression file the NPC is currently playing.
-- @function [parent=#NPC] GetExpression
-- @param  self
-- @return #string The file path of the expression.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns NPCs hull type set by **NPC:SetHullType**.
-- @function [parent=#NPC] GetHullType
-- @param  self
-- @return #number Hull type, see **HULL\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the NPC's current movement activity.
-- @function [parent=#NPC] GetMovementActivity
-- @param  self
-- @return #number Current NPC movement activity, see **ACT\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the index of the sequence the NPC uses to move.
-- @function [parent=#NPC] GetMovementSequence
-- @param  self
-- @return #number The movement sequence index.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the NPC's state.
-- @function [parent=#NPC] GetNPCState
-- @param  self
-- @return #number The NPC's current state, see **NPC\_STATE\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] GetPathDistanceToGoal
-- @param  self
-- @return #number

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] GetPathTimeToGoal
-- @param  self
-- @return #number

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the shooting position of the NPC.
-- 
-- **Note**: _This only works properly when called on an NPC that can hold
-- weapons, otherwise it will return the same value as **Entity:GetPos**._
-- @function [parent=#NPC] GetShootPos
-- @param  self
-- @return #Vector The NPC's shooting position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the NPC's current target set by **NPC:SetTarget**.
-- @function [parent=#NPC] GetTarget
-- @param  self
-- @return #Entity Target entity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Used to give a weapon to an already spawned NPC.
-- @function [parent=#NPC] Give
-- @param  self
-- @param  #string weapon Class name of the weapon to equip to the NPC.
-- @return #Weapon The weapon entity given to the NPC.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether or not the NPC has the given condition.
-- @function [parent=#NPC] HasCondition
-- @param  self
-- @param  #number condition The condition index, see **COND\_ Enums**.
-- @return #boolean True if the NPC has the given condition, false otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Force an NPC to play his Idle sound.
-- @function [parent=#NPC] IdleSound
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether or not the NPC is performing the given schedule.
-- @function [parent=#NPC] IsCurrentSchedule
-- @param  self
-- @param  #number schedule The schedule number, see **SCHED\_ Enums**.
-- @return #boolean True if the NPC is performing the given schedule, false otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the NPC is moving or not.
-- @function [parent=#NPC] IsMoving
-- @param  self
-- @return #boolean Whether the NPC is moving or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] IsRunningBehavior
-- @param  self
-- @return #boolean

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the entity given can be reached by this NPC.
-- @function [parent=#NPC] IsUnreachable
-- @param  self
-- @param  #Entity testEntity The entity to test.
-- @return #boolean If the entity is reachable or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Force an NPC to play it LostEnemy sound.
-- @function [parent=#NPC] LostEnemySound
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] MaintainActivity
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Causes the NPC to temporarily forget the current enemy and switch on to a
-- better one.
-- @function [parent=#NPC] MarkEnemyAsEluded
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] MoveOrder
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the goal position for the NPC.
-- @function [parent=#NPC] NavSetGoal
-- @param  self
-- @param  #Vector position The position to set as the goal.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Set the goal target for an NPC.
-- @function [parent=#NPC] NavSetGoalTarget
-- @param  self
-- @param  #Entity target The targeted entity to set the goal to.
-- @param  #Vector offset The offset to apply to the targeted entity's position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Creates a random path of specified minimum length between a closest start
-- node and random node in the specified direction.
-- @function [parent=#NPC] NavSetRandomGoal
-- @param  self
-- @param  #number minPathLength Minimum length of path in units.
-- @param  #Vector dir Unit vector pointing in the direction of the target random node.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets a goal in x, y offsets for the npc to wander to.
-- @function [parent=#NPC] NavSetWanderGoal
-- @param  self
-- @param  #number xoffset X offset.
-- @param  #number yoffset Y offset.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Forces the NPC to play a sentence from scripts/sentences.txt.
-- @function [parent=#NPC] PlaySentence
-- @param  self
-- @param  #string sentence The sentence string to speak.
-- @param  #number delay Delay in seconds until the sentence starts playing.
-- @param  #number volume The volume of the sentence, from 0 to 1.
-- @return #number Returns the sentence index, -1 if the sentence couldn't be played.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] RunEngineTask
-- @param  self
-- @param  #number taskID The task ID, see ai_task.h.
-- @param  #number taskData The task data.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] SentenceStop
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] SetArrivalActivity
-- @param  self
-- @param  #number act

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] SetArrivalDirection
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] SetArrivalDistance
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] SetArrivalSequence
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] SetArrivalSpeed
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets an NPC condition.
-- @function [parent=#NPC] SetCondition
-- @param  self
-- @param  #number condition The condition index, see **COND\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the weapon proficiency of an NPC (how skilled an NPC is with its
-- current weapon).
-- @function [parent=#NPC] SetCurrentWeaponProficiency
-- @param  self
-- @param  #number proficiency The proficiency for the NPC's current weapon. See **WEAPON\_PROFICIENCY\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the target for an NPC.
-- @function [parent=#NPC] SetEnemy
-- @param  self
-- @param  #Entity enemy The enemy that the NPC should target.
-- @param  #boolean newenemy Calls **NPC:SetCondition**(COND\_NEW\_ENEMY) if the new enemy is valid and not equal to the last enemy. _(Default: true)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the NPC's .vcd expression. Similar to **Entity:PlayScene** except the scene
-- is looped until it's interrupted by default NPC behavior or **NPC:ClearExpression**.
-- @function [parent=#NPC] SetExpression
-- @param  self
-- @param  #string expression The expression filepath.
-- @return #number

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Updates the NPC's hull and physics hull in order to match its model scale.
-- **Entity:SetModelScale** seems to take care of this regardless.
-- @function [parent=#NPC] SetHullSizeNormal
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the hull type for the NPC.
-- @function [parent=#NPC] SetHullType
-- @param  self
-- @param  #number hullType Hull type. See **HULL\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the last registered or memorized position for an npc. When using
-- scheduling, the NPC will focus on navigating to the last position via nodes.
-- 
-- **Note**: _The navigation requires ground nodes to function properly,
-- otherwise the NPC could only navigate in a small area._
-- _(https://developer.valvesoftware.com/wiki/Info\_node)_
-- @function [parent=#NPC] SetLastPosition
-- @param  self
-- @param  #Vector Position Where the NPC's last position will be set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] SetMaxRouteRebuildTime
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the activity the NPC uses when it moves.
-- @function [parent=#NPC] SetMovementActivity
-- @param  self
-- @param  #number activity The movement activity, see **ACT\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the sequence the NPC navigation path uses for speed calculation.
-- Doesn't seem to have any visible effect on NPC movement.
-- @function [parent=#NPC] SetMovementSequence
-- @param  self
-- @param  #number sequenceId The movement sequence index.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the state the NPC is in to help it decide on a ideal schedule.
-- @function [parent=#NPC] SetNPCState
-- @param  self
-- @param  #number state New NPC state, see **NPC\_STATE\_ Enums.**

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the NPC's current schedule.
-- @function [parent=#NPC] SetSchedule
-- @param  self
-- @param  #number schedule The NPC schedule, see **SCHED\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the NPC's target. This is used in some engine schedules.
-- @function [parent=#NPC] SetTarget
-- @param  self
-- @param  #Entity entity The target of the NPC.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Forces the NPC to start an engine task, this has different results for every NPC.
-- @function [parent=#NPC] StartEngineTask
-- @param  self
-- @param  #number task The id of the task to start, see ai_task.h.
-- @param  #number taskData The task data as a float, not all tasks make use of it.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Resets the NPC's movement animation and velocity. Does not actually stop the
-- NPC from moving.
-- @function [parent=#NPC] StopMoving
-- @param  self
-- @param  #
-- @return #

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] TargetOrder
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] TaskComplete
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] TaskFail
-- @param  self
-- @param  #string task A string most likely defined as a Source Task.
-- For more information on Tasks go to https://developer.valvesoftware.com/wiki/Task

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Force the NPC to update information on the supplied enemy, as if it had line of sight to it.
-- @function [parent=#NPC] UpdateEnemyMemory
-- @param  self
-- @param  #Entity enemy The enemy to update.
-- @param  #Vector pos The last known position of the enemy.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] UseActBusyBehavior
-- @param  self
-- @return #boolean

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] UseAssaultBehavior
-- @param  self
-- @return #boolean

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] UseFollowBehavior
-- @param  self
-- @return #boolean

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] UseFuncTankBehavior
-- @param  self
-- @return #boolean

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] UseLeadBehavior
-- @param  self
-- @return #boolean

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#NPC] UseNoBehavior
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- NextBots are a new system to create NPCs in the Source Engine, utilizing the
-- more powerful navmesh library system for navigation over the old node based system.
-- @type NextBot
-- @extends NPC

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Become a ragdoll and remove the entity.
-- @function [parent=#NextBot] BecomeRagdoll
-- @param  self
-- @param  #CTakeDamageInfo info Damage info passed from an onkilled event.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Should only be called in BodyUpdate. This sets the move\_x and move\_y pose
-- parameters of the bot to fit how they're currently moving, sets the
-- animation speed to suit the ground speed, and calls **Entity:FrameAdvance**.
-- @function [parent=#NextBot] BodyMoveXY
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Like **NextBot:FindSpots** but only returns a vector.
-- @function [parent=#NextBot] FindSpot
-- @param  self
-- @param  #string type Either "random", "near", "far".
-- @param  #table options This table should contain the search info:
-- 
-- * _#string type_ : The type. (Only 'hiding' for now)
-- * _#Vector pos_ : the position to search.
-- * _#number radius_ : the radius to search.
-- * _#number stepup_ : the highest step to step up.
-- * _#number stepdown_ : the highest we can step down without being hurt.
-- @return #Vector If it finds a spot it will return a vector. If not it will return nil.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns a table of hiding spots.
-- @function [parent=#NextBot] FindSpots
-- @param  self
-- @param  #table options This table should contain the search info:
-- 
-- * _#string type_ : The type. (Only 'hiding' for now)
-- * _#Vector pos_ : the position to search.
-- * _#number radius_ : the radius to search.
-- * _#number stepup_ : the highest step to step up.
-- * _#number stepdown_ : the highest we can step down without being hurt.
-- @return #table An unsorted table of tables containing:
-- 
-- * _#Vector vector_ : The position of the hiding spot.
-- * _#number distance_ : The distance to that position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the currently running activity.
-- @function [parent=#NextBot] GetActivity
-- @param  self
-- @return #number The current activity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns squared distance to an entity or a position. See also **NextBot:GetRangeTo**.
-- @function [parent=#NextBot] GetRangeSquaredTo
-- @param  self
-- @param  #Vector to The position to measure distance to. Can be an entity.
-- @return #number The squared distance.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the distance to an entity or position. See also **NextBot:GetRangeSquaredTo**.
-- @function [parent=#NextBot] GetRangeTo
-- @param  self
-- @param  #Vector to The position to measure distance to. Can be an entity.
-- @return #number The distance.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the solid mask for given NextBot.
-- @function [parent=#NextBot] GetSolidMask
-- @param  self
-- @return #number The solid mask, see **CONTENTS\_ Enums** and **MASK\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Called from Lua when the NPC is stuck. This should only be called from the
-- behaviour coroutine - so if you want to override this function and do
-- something special that yields - then go for it. You should always call
-- **self.loco:ClearStuck**() in this function to reset the stuck status - so it
-- knows it's unstuck. See **CLuaLocomotion:ClearStuck**.
-- @function [parent=#NextBot] HandleStuck
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- To be called in the behaviour coroutine only! Will yield until the bot has
-- reached the goal or is stuck.
-- @function [parent=#NextBot] MoveToPos
-- @param  self
-- @param  #Vector pos The position we want to get to.
-- @param  #table options A table containing a bunch of tweakable options:
-- 
-- * _#number lookahead_ : Minimum look ahead distance.
-- * _#number tolerance_ : How close we must be to the goal before it can be considered complete.
-- * _#boolean draw_ : Draw the path. Only visible on listen servers and single player.
-- * _#number maxage_ : Maximum age of the path before it times out.
-- * _#number repath_ : Rebuilds the path after this number of seconds.
-- @return #string Either "failed", "stuck", "timeout" or "ok" - depending on how the NPC got on.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- To be called in the behaviour coroutine only! Plays an animation sequence
-- and waits for it to end before returning.
-- @function [parent=#NextBot] PlaySequenceAndWait
-- @param  self
-- @param  #string name The sequence name.
-- @param  #number speed Playback Rate of that sequence. _(Defualt: 1)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the solid mask for given NextBot. The default solid mask of a NextBot
-- is MASK_NPCSOLID.
-- @function [parent=#NextBot] SetSolidMask
-- @param  self
-- @param  #number mask The new mask, see **CONTENTS\_ Enums** and **MASK\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Start doing an activity. (animation)
-- @function [parent=#NextBot] StartActivity
-- @param  self
-- @param  #number activity One of the **ACT\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This is the base panel for every other VGUI panel. It contains all of the
-- basic methods, some of which may only work on certain VGUI elements. As
-- their functionality is provided at the game's C/C++ level rather than by its
-- Lua script extension, they are unfortunately unavailable for most practical
-- purposes, however, they can still be obtained in a way similar to that
-- provided by the baseclass library.
-- @type Panel

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds the specified object to the panel.
-- @function [parent=#Panel] Add
-- @param  self
-- @param  #Panel object The panel to be added (parented). Can also be:
-- 
-- * _#string Class Name_ : Creates panel with the specified name and adds it to the panel.
-- * _#table PANEL table_ : Creates a panel from table and adds it to the panel.
-- @return #Panel New panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Aligns the panel on the bottom of its parent with the specified offset.
-- @function [parent=#Panel] AlignBottom
-- @param  self
-- @param  #number offset The align offset. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Aligns the panel on the left of its parent with the specified offset.
-- @function [parent=#Panel] AlignLeft
-- @param  self
-- @param  #number offset The align offset. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Aligns the panel on the right of its parent with the specified offset.
-- @function [parent=#Panel] AlignRight
-- @param  self
-- @param  #number offset The align offset. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Aligns the panel on the top of its parent with the specified offset.
-- @function [parent=#Panel] AlignTop
-- @param  self
-- @param  #number offset The align offset. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Uses animation to transition the current alpha value of a panel to a new
-- alpha, over a set period of time and after a specified delay.
-- @function [parent=#Panel] AlphaTo
-- @param  self
-- @param  #number alpha The alpha value (0-255) to approach.
-- @param  #number duration The time in seconds it should take to reach the alpha.
-- @param  # number delay The delay before the animation starts. _(Default: 0)_
-- @param  #function callback The function to be called once the animation finishes.
-- Arguments are:
-- 
-- * _#table animData_ : The AnimationData structure that was used.
-- * _#Panel pnl_ : The panel object whose alpha was changed.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Performs the per-frame operations required for panel animations. This is
-- called every frame by **Panel:AnimationThink**.
-- @function [parent=#Panel] AnimationThinkInternal
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the **SysTime** value when all animations for this panel object will end.
-- @function [parent=#Panel] AnimTail
-- @param  self
-- @return #number The system time value when all animations will end for this panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Appends text to a RichText element. This does not automatically add a new line.
-- @function [parent=#Panel] AppendText
-- @param  self
-- @param  #string txt The text to append (add on).

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Used by **Panel:LoadGWENFile** and **Panel:LoadGWENString** to apply a GWEN controls
-- table to a panel object. You can do this manually using **file.Read** and
-- **util.JSONToTable** to import and create a GWEN table structure from a .gwen
-- file. This method can then be called, passing the GWEN table's Controls member.
-- @function [parent=#Panel] ApplyGWEN
-- @param  self
-- @param  #table GWENTable The GWEN controls table to apply to the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Centers the panel on its parent.
-- @function [parent=#Panel] Center
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Centers the panel horizontally with specified fraction.
-- @function [parent=#Panel] CenterHorizontal
-- @param  self
-- @param  #number fraction The center fraction. _(Default: 0.5)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Centers the panel vertically with specified fraction.
-- @function [parent=#Panel] CenterVertical
-- @param  self
-- @param  #number fraction The center fraction. _(Default: 0.5)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the amount of children of the of panel.
-- @function [parent=#Panel] ChildCount
-- @param  self
-- @return #number Child count.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the width and height of the space between the position of the panel
-- (upper-left corner) and the max bound of the children panels (farthest
-- reaching lower-right corner).
-- @function [parent=#Panel] ChildrenSize
-- @param  self
-- @return #number, #number The children' size width and height.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Marks all of the panel's children for deletion.
-- @function [parent=#Panel] Clear
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Fades panels color to specified one. It won't work unless panel has SetColor function.
-- @function [parent=#Panel] ColorTo
-- @param  self
-- @param  #table color The color to fade to.
-- @param  #number length Length of the animation.
-- @param  #number delay Delay before start fading.
-- @param  #function callback Function to execute when finished.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sends an action command signal to the panel. The response is handled by **Panel:ActionSignal**.
-- @function [parent=#Panel] Command
-- @param  self
-- @param  #string command The command to send to the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Updates a panel object's associated console variable. This must first be set
-- up with **Derma\_Install\_Convar\_Functions**, and have a ConVar set using **Panel:SetConVar**.
-- @function [parent=#Panel] ConVarChanged
-- @param  self
-- @param  #string newValue The new value to set the associated console variable to.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- A think hook for Panels using ConVars as a value. Call it in the Think hook.
-- Sets the panel's value should the convar change. This function is best for:
-- checkboxes, sliders, number wangs. For a string alternative, see **Panel.ConVarStringThink**.
-- 
-- **Important**: _Make sure your Panel has a SetValue function, else you may get errors._
-- @function [parent=#Panel] ConVarNumberThink
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- A think hook for panels using ConVars as a value. Call it in the Think hook.
-- Sets the panel's value should the convar change. This function is best for:
-- text inputs, read-only inputs, dropdown selects. For a number alternative,
-- see **Panel.ConVarNumberThink**.
-- 
-- **Important**: _Make sure your Panel has a SetValue function, else you may get errors._
-- @function [parent=#Panel] ConVarStringThink
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the size, position and dock state of the passed panel object, and
-- applies it to this one.
-- @function [parent=#Panel] CopyBase
-- @param  self
-- @param  #Panel srcPanel The panel to copy the boundary and dock settings from.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Copies position and size of the panel.
-- @function [parent=#Panel] CopyBounds
-- @param  self
-- @param  #Panel base The panel to copy size and position from.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Copies the height of the panel.
-- @function [parent=#Panel] CopyHeight
-- @param  self
-- @param  #Panel base Panel to copy the height from.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Copies the position of the panel.
-- @function [parent=#Panel] CopyPos
-- @param  self
-- @param  #Panel base Panel to position the width from.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Performs the "CONTROL + C" key combination effect (Copy selection to
-- clipboard) on selected text.
-- @function [parent=#Panel] CopySelected
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Copies the width of the panel.
-- @function [parent=#Panel] CopyWidth
-- @param  self
-- @param  #Panel base Panel to copy the width from.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the cursor position relative to the top left of the panel. This is
-- equivalent to calling **gui.MousePos** and then **Panel:ScreenToLocal**.
-- 
-- **Warning**: _This function uses a cached value for the screen position of
-- the panel, computed at the end of the last VGUI Think/Layout pass. ie.
-- inaccurate results may be returned if the panel or any of its ancestors have
-- been repositioned outside of **Panel:Think** or **Panel:PerformLayout** within the
-- last frame._
-- @function [parent=#Panel] CursorPos
-- @param  self
-- @return #number, #number X and Y coordinates of the cursor, relative to the top left of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Performs the "CONTROL + X" (delete text and copy it to clipboard buffer)
-- action on selected text.
-- @function [parent=#Panel] CutSelected
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Deletes a cookie value using the panel's cookie name (**Panel:GetCookieName**)
-- and the passed extension.
-- @function [parent=#Panel] DeleteCookie
-- @param  self
-- @param  #string cookieName The unique cookie name to delete.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resets the panel object's **Panel:SetPos** method and removes its animation
-- table (**Panel.LerpAnim**). This effectively undoes the changes made by
-- **Panel:LerpPositions**. In order to use Lerp animation again, you must call
-- **Panel:Stop** before setting its SetPosReal property to 'nil'.
-- @function [parent=#Panel] DisableLerp
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the linear distance from the centre of this panel object and another.
-- @function [parent=#Panel] Distance
-- @param  self
-- @param  #Panel tgtPanel The target object with which to compare position.
-- @return #number The linear (straight-line) distance between the centres of the two objects.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the distance between the centre of this panel object and a specified
-- point (local to the parent panel).
-- @function [parent=#Panel] DistanceFrom
-- @param  self
-- @param  #number posX The horizontal (x) position in pixels of the point to compare with. Local to the parent panel, or container.
-- @param  #number posY The vertical (y) position in pixels of the point to compare with. Local to the parent panel, or container.
-- @return #number The linear (straight-line) distance between the specified point and the centre of the panel object.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the dock type of the panel.
-- 
-- **Note**: _After using this function, if you want to get the correct panel's
-- bounds (position, size), use **Panel:InvalidateParent**. (use true as argument if
-- you need to update immediately)_
-- @function [parent=#Panel] Dock
-- @param  self
-- @param  #number dockType Dock type using **DOCK\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the dock margin of the panel. The dock margin is the extra space that will
-- be left around the edge when this element is docked inside its parent element.
-- @function [parent=#Panel] DockMargin
-- @param  self
-- @param  #number marginLeft The left margin to the parent.
-- @param  #number marginTop The top margin to the parent.
-- @param  #number marginRight The right margin to the parent.
-- @param  #number marginBottom The bottom margin to the parent.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the dock padding of the panel. The dock padding is the extra space that
-- will be left around the edge when child elements are docked inside this element.
-- @function [parent=#Panel] DockPadding
-- @param  self
-- @param  #number paddingLeft The left padding to the parent.
-- @param  #number paddingTop The top padding to the parent.
-- @param  #number paddingRight The right padding to the parent.
-- @param  #number paddingBottom The bottom padding to the parent.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Makes the panel "lock" the screen until it is removed. It will silently fail
-- if used while cursor is not visible. Call **Panel:MakePopup** before calling
-- this function.
-- @function [parent=#Panel] DoModal
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by **Panel:DragMouseRelease** when a user clicks one mouse button whilst
-- dragging with another.
-- @function [parent=#Panel] DragClick
-- @param  self
-- @return #boolean Always returns true.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called by **dragndrop.HoverThink** to perform actions on an object that is
-- dragged and hovered over another.
-- @function [parent=#Panel] DragHover
-- @param  self
-- @param  #number HoverTime If this time is greater than 0.1, **Panel:DragHoverClick**, passing it as an argument.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called to end a drag and hover action. This resets the panel's
-- **Panel:PaintOver** method, and is primarily used by **dragndrop.StopDragging**.
-- @function [parent=#Panel] DragHoverEnd
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Called to inform the dragndrop library that a mouse button is being held
-- down on a panel object.
-- @function [parent=#Panel] DragMousePress
-- @param  self
-- @param  #number mouseCode The code for the mouse button pressed, passed by, for example, **Panel:OnMousePressed**. See the **MOUSE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Called to inform the dragndrop library that a mouse button has been
-- depressed on a panel object.
-- @function [parent=#Panel] DragMouseRelease
-- @param  self
-- @param  #number mouseCode The code for the mouse button pressed, passed by, for example, **Panel:OnMouseReleased**. See the **MOUSE\_ Enums**.
-- @return #boolean true if an object was being dragged, otherwise false.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Called to draw the drop target when an object is being dragged across another.
-- See **Panel:SetDropTarget**.
-- @function [parent=#Panel] DrawDragHover
-- @param  self
-- @param  #number x The x coordinate of the top-left corner of the drop area.
-- @param  #number y The y coordinate of the top-left corner of the drop area.
-- @param  #number width The width of the drop area.
-- @param  #number height The height of the drop area.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a coloured rectangle to fill the panel object this method is called on.
-- The colour is set using **surface.SetDrawColor**. This should only be called
-- within the object's **Panel:Paint** or **Panel:PaintOver** hooks, as a shortcut for
-- **surface.DrawRect**.
-- @function [parent=#Panel] DrawFilledRect
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a hollow rectangle the size of the panel object this method is called
-- on, with a border width of 1 px. The border colour is set using **surface.SetDrawColor**.
-- This should only be called within the object's **Panel:Paint** or 
-- **Panel:PaintOver** hooks, as a shortcut for **surface.DrawOutlinedRect**.
-- @function [parent=#Panel] DrawOutlinedRect
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Used to draw the magenta highlight colour of a panel object when it is
-- selected. This should be called in the object's **Panel:PaintOver** hook. Once
-- this is implemented, the highlight colour will be displayed only when the
-- object is selectable and selected. This is achieved using **Panel:SetSelectable**
-- and **Panel:SetSelected** respectively.
-- @function [parent=#Panel] DrawSelections
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Used to draw the text in a DTextEntry within a derma skin. This should be
-- called within the **SKIN:PaintTextEntry** skin hook.
-- @function [parent=#Panel] DrawTextEntryText
-- @param  self
-- @param  #table textCol The colour of the main text.
-- @param  #table highlightCol The colour of the selection highlight (when selecting text).
-- @param  #table cursorCol The colour of the text cursor (or caret).

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Draws a textured rectangle to fill the panel object this method is called on.
-- The texture is set using **surface.SetTexture** or **surface.SetMaterial**. This
-- should only be called within the object's **Panel:Paint** or **Panel:PaintOver**
-- hooks, as a shortcut for **surface.DrawTexturedRect**.
-- @function [parent=#Panel] DrawTexturedRect
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Makes this panel droppable. This is used with **Panel:Receiver** to create drag
-- and drop events. Can be called multiple times with different names allowing
-- to be dropped onto different receivers.
-- @function [parent=#Panel] Droppable
-- @param  self
-- @param  #string name Name of your droppable panel.
-- @return #table Blank table stored on the panel itself under pnl.m_DragSlot[name].
-- Is reset every time this function is called and does not appear to be used or exposed anywhere else.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Completes a box selection. If the end point of the selection box is within
-- the selection canvas, mouse capture is disabled for the panel object, and
-- the selected state of each child object within the selection box is toggled.
-- @function [parent=#Panel] EndBoxSelection
-- @param  self
-- @return #boolean Whether the end point of the selection box was within the selection canvas.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used to run commands within a DHTML window.
-- @function [parent=#Panel] Exec
-- @param  self
-- @param  #string cmd The command to be run.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Finds a panel in its children(and sub children) with the given name.
-- @function [parent=#Panel] Find
-- @param  self
-- @param  #string panelName The name of the panel that should be found.
-- @return #Panel The found panel, or nil if not panel was found.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Focuses the next panel in the focus queue.
-- @function [parent=#Panel] FocusNext
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Focuses the previous panel in the focus queue.
-- @function [parent=#Panel] FocusPrevious
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the alpha multiplier for this panel.
-- @function [parent=#Panel] GetAlpha
-- @param  self
-- @return #number Panel's alpha multiplier.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the position and size of the panel. This is equivalent to calling
-- **Panel:GetPos** and **Panel:GetSize** together.
-- @function [parent=#Panel] GetBounds
-- @param  self
-- @return #number, #number, #number, #number The x, y coordinates and width, height of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the position/offset of the caret (or text cursor) in a text-based
-- panel object.
-- @function [parent=#Panel] GetCaretPos
-- @param  self
-- @return #number The caret position/offset from the start of the text. A value of 0 means the caret sits before the first character.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets a child by its index.
-- @function [parent=#Panel] GetChild
-- @param  self
-- @param  #number childIndex The index of the child to get.
-- 
-- **Note**: _This index starts at 0, except when you use this on a **DMenu**._
-- @return #Panel The child panel at the specified index.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets a child object's position relative to this panel object. The number of
-- levels is not relevant; the child may have many parents between itself and
-- the object on which the method is called.
-- @function [parent=#Panel] GetChildPosition
-- @param  self
-- @param  #Panel pnl The panel to get the position of.
-- @return #number, #number The horizontal and vertical (x, y) position of the child relative to the panel object.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a table with all the child panels of the panel.
-- @function [parent=#Panel] GetChildren
-- @param  self
-- @return #table The panel's children.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a table of all visible, selectable children of the panel object that
-- lie at least partially within the specified rectangle.
-- @function [parent=#Panel] GetChildrenInRect
-- @param  self
-- @param  #number x The horizontal (x) position of the top-left corner of the rectangle, relative to the panel object.
-- @param  #number y The vertical (y) position of the top-left corner of the rectangle, relative to the panel object.
-- @param  #number w The width of the rectangle.
-- @param  #number h The height of the rectangle.
-- @return #table A table of panel objects that lie at least partially within the specified rectangle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the class name of the panel.
-- @function [parent=#Panel] GetClassName
-- @param  self
-- @return #string Panel's classname.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the child of this panel object that is closest to the specified
-- point. The point is relative to the object on which the method is called.
-- The distance the child is from this point is also returned.
-- @function [parent=#Panel] GetClosestChild
-- @param  self
-- @param  #number x The horizontal (x) position of the point.
-- @param  #number y The vertical (y) position of the point.
-- @return #Panel, #number The child object that was closest to the specified point and its distance from it.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the size of the content/children within a panel object. Only works with
-- Label derived panels by default such as DLabel. Will also work on any panel
-- that manually implements this method.
-- @function [parent=#Panel] GetContentSize
-- @param  self
-- @return #number, #number The content width and height of the object.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the value of a cookie stored by the panel object. This can also be done
-- with **cookie.GetString**, using the panel's cookie name, a fullstop, and then
-- the actual name of the cookie. Make sure the panel's cookie name has not
-- changed since writing, or the cookie will not be accessible. This can be
-- done with **Panel:GetCookieName** and **Panel:SetCookieName**.
-- @function [parent=#Panel] GetCookie
-- @param  self
-- @param  #string cookieName The name of the cookie from which to retrieve the value.
-- @param  #string default The default value to return if the cookie does not exist.
-- @return #string The value of the stored cookie, or the default value should the cookie not exist.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the name the panel uses to store cookies. This is set with **Panel:SetCookieName**.
-- @function [parent=#Panel] GetCookieName
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the value of a cookie stored by the panel object, as a number. This can
-- also be done with **cookie.GetNumber**, using the panel's cookie name, a
-- fullstop, and then the actual name of the cookie. Make sure the panel's
-- cookie name has not changed since writing, or the cookie will not be
-- accessible. This can be done with **Panel:GetCookieName** and **Panel:SetCookieName**.
-- @function [parent=#Panel] GetCookieNumber
-- @param  self
-- @param  #string cookieName The name of the cookie from which to retrieve the value.
-- @param  #number default The default value to return if the cookie does not exist.
-- @return #number The number value of the stored cookie, or the default value should the cookie not exist.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a dock enum for the panel's current docking type.
-- @function [parent=#Panel] GetDock
-- @param  self
-- @return #number The dock enum for the panel. See **DOCK\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the docked margins of the panel. (Set by **Panel:DockMargin**)
-- @function [parent=#Panel] GetDockMargin
-- @param  self
-- @return #number, #number, #number, #number The left, top, right, and bottom margin of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the docked padding of the panel. (Set by **Panel:DockPadding**)
-- @function [parent=#Panel] GetDockPadding
-- @param  self
-- @return #number, #number, #number, #number The left, top, right, and bottom padding of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the name of the font that the panel renders its text with. This is
-- the same font name set with **Panel:SetFontInternal**.
-- @function [parent=#Panel] GetFont
-- @param  self
-- @return #string The font's name.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the panel's HTML material. Only works with Awesomium, HTML and DHTML
-- panels that have been fully loaded.
-- @function [parent=#Panel] GetHTMLMaterial
-- @param  self
-- @return #IMaterial The HTML material used by the panel.
-- Typically starts with "\_\_vgui\_texture\_" followed by an incremental number.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the internal name of the panel.
-- @function [parent=#Panel] GetName
-- @param  self
-- @return #string Panel's internal name.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the number of lines in a RichText. You must wait a couple frames
-- before calling this after using **Panel:AppendText** or **Panel:SetText**, otherwise
-- it will return the number of text lines before the text change.
-- 
-- **Note**: _Even though this function can be called on any panel, it will
-- only work with RichText._
-- @function [parent=#Panel] GetNumLines
-- @param  self
-- @return #number The number of lines.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the parent of the panel, returns nil if there is no parent.
-- @function [parent=#Panel] GetParent
-- @param  self
-- @return #Panel The parent of given panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the position of the panel relative to its **Panel:GetParent**. If you
-- require the panel's position and size, consider using **Panel:GetBounds** instead.
-- If you need the position in screen space, see **Panel:LocalToScreen**.
-- @function [parent=#Panel] GetPos
-- @param  self
-- @return #number, #number X and Y coordinate, relative to the panels parents top left corner.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a table of all children of the panel object that are selected. This
-- is recursive, and the returned table will include tables for any child
-- objects that also have children. This means that not all first-level members
-- in the returned table will be of type Panel.
-- @function [parent=#Panel] GetSelectedChildren
-- @param  self
-- @return #table A table of any child objects that are selected, including tables for children of the child objects.
-- (These tables may also contain table members, as the method is recursive)

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the panel object (self) if it has been enabled as a selection canvas.
-- This is achieved using **Panel:SetSelectionCanvas**.
-- @function [parent=#Panel] GetSelectionCanvas
-- @param  self
-- @return #Panel The panel object this method was called on if enabled as a selection canvas, otherwise nil.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the size of the panel. If you require both the panel's position and
-- size, consider using **Panel:GetBounds** instead.
-- @function [parent=#Panel] GetSize
-- @param  self
-- @return #number, #number The panel's width and height.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the table for the derma skin currently being used by this panel object.
-- @function [parent=#Panel] GetSkin
-- @param  self
-- @return #table The derma skin table currently being used by this object.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the internal Lua table of the panel.
-- @function [parent=#Panel] GetTable
-- @param  self
-- @return #table A table containing all the members of given panel object.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the height of the panel.
-- @function [parent=#Panel] GetTall
-- @param  self
-- @return #number The height of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the panel's text. (where applicable) This method returns a maximum
-- of 1023 bytes, except for DTextEntry.
-- @function [parent=#Panel] GetText
-- @param  self
-- @return #string The panel's text.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the left and top text margins of a text-based panel object, such as a
-- DButton or DLabel. This is set with **Panel:SetTextInset**.
-- @function [parent=#Panel] GetTextInset
-- @param  self
-- @return #number, #number The left and top margin of the text, in pixels.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the size of the text within a Label derived panel.
-- @function [parent=#Panel] GetTextSize
-- @param  self
-- @return #number, #number The width and height of the text in the DLabel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets valid receiver slot of currently dragged panel.
-- @function [parent=#Panel] GetValidReceiverSlot
-- @param  self
-- @return #Panel, #table The panel this was called on if a valid receiver slot exists, otherwise false and the slot table.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the value the panel holds. In engine this is only implemented for
-- CheckButton, Label and TextEntry as a string and for those elements has a
-- hard coded limit of 8092 characters.
-- @function [parent=#Panel] GetValue
-- @param  self
-- @return #any The value the panel holds.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the width of the panel.
-- @function [parent=#Panel] GetWide
-- @param  self
-- @return #number Panel's width.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the Z position of the panel.
-- @function [parent=#Panel] GetZPos
-- @param  self
-- @return #number The Z order position of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Goes back one page in the HTML panel's history if available.
-- @function [parent=#Panel] GoBack
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Goes forward one page in the HTML panel's history if available.
-- @function [parent=#Panel] GoForward
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Goes to the page in the HTML panel's history at the specified relative offset.
-- @function [parent=#Panel] GoToHistoryOffset
-- @param  self
-- @param  #number offset The offset in the panel's back/forward history, relative to the current page, that you would like to skip to.
-- Because this is relative, 0 = current page while negative goes back and positive goes forward. For example, -2 will go back 2 pages in the history.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Causes a RichText element to scroll to the bottom of its text.
-- @function [parent=#Panel] GotoTextEnd
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Causes a RichText element to scroll to the top of its text.
-- @function [parent=#Panel] GotoTextStart
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the CheckboxText property to a DCheckBoxLabel.
-- This does exactly the same as **Panel:GWEN_SetText**, but exists to cater for
-- the seperate GWEN properties.
-- @function [parent=#Panel] GWEN_SetCheckboxText
-- @param  self
-- @param  #string txt The text to be applied to the DCheckBoxLabel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the ControlName property to a panel. This
-- calls **Panel:SetName**.
-- @function [parent=#Panel] GWEN_SetControlName
-- @param  self
-- @param  #string name The new name to apply to the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the Dock property to a panel object. This
-- calls **Panel:Dock**.
-- @function [parent=#Panel] GWEN_SetDock
-- @param  self
-- @param  #string dockState The dock mode to pass to the panel's Dock method.
-- This reads a string and applies the approriate **DOCK\_ Enums**.
-- 
-- * Right: Dock right.
-- * Left: Dock left.
-- * Bottom: Dock at the bottom.
-- * Top: Dock at the top.
-- * Fill: Fill the parent panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the HorizontalAlign property to a panel
-- object. This calls **Panel:SetContentAlignment**.
-- @function [parent=#Panel] GWEN_SetHorizontalAlign
-- @param  self
-- @param  #string hAlign The alignment, as a string, to pass to **Panel:SetContentAlignment**.
-- Accepts:
-- 
-- * Right: Align mid-right.
-- * Left: Align mid-left.
-- * Center: Align mid-center.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the Margin property to a panel object. This
-- calls **Panel:DockMargin**.
-- @function [parent=#Panel] GWEN_SetMargin
-- @param  self
-- @param  #table margins A four-membered table containing the margins as numbers:
-- 
-- * _#number left_ : The left margin.
-- * _#number top_ : The top margin.
-- * _#number right_ : The right margin.
-- * _#number bottom_ : The bottom margin.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the Max property to a DNumberWang, Slider,
-- DNumSlider or DNumberScratch. This calls SetMax on one of the previously
-- listed methods.
-- @function [parent=#Panel] GWEN_SetMax
-- @param  self
-- @param  #number maxValue The maximum value the element is to permit.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the Min property to a DNumberWang, Slider,
-- DNumSlider or DNumberScratch. This calls SetMin on one of the previously
-- listed methods.
-- @function [parent=#Panel] GWEN_SetMin
-- @param  self
-- @param  #number minValue The minimum value the element is to permit.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the Position property to a panel object.
-- This calls **Panel:SetPos**.
-- @function [parent=#Panel] GWEN_SetPosition
-- @param  self
-- @param  #table pos A two-membered table containing the x and y coordinates as numbers:
-- 
-- * _#number x_ : The x coordinate.
-- * _#number y_ : The y coordinate.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the Size property to a panel object. This
-- calls **Panel:SetSize**.
-- @function [parent=#Panel] GWEN_SetSize
-- @param  self
-- @param  #table size A two-membered table containing the width and heights as numbers:
-- 
-- * _#number w_ : The width.
-- * _#number h_ : The height.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Used by **Panel:ApplyGWEN** to apply the Text property to a panel.
-- @function [parent=#Panel] GWEN_SetText
-- @param  self
-- @param  #string txt The text to be applied to the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whenever the panel has child panels.
-- @function [parent=#Panel] HasChildren
-- @param  self
-- @return #boolean Has children.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the panel is focused.
-- @function [parent=#Panel] HasFocus
-- @param  self
-- @return #boolean Has focus.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the panel or any of its children(sub children and so on) has the focus.
-- @function [parent=#Panel] HasHierarchicalFocus
-- @param  self
-- @return #boolean Has hierarchical focus.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the panel is a descendent of the given panel.
-- @function [parent=#Panel] HasParent
-- @param  self
-- @param  #Panel parentPanel Panel to check is an ancestor.
-- @return #boolean True if the panel is contained within parentPanel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Makes a panel invisible.
-- @function [parent=#Panel] Hide
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Marks the end of a clickable text segment in a RichText element, started
-- with **Panel:InsertClickableTextStart**.
-- @function [parent=#Panel] InsertClickableTextEnd
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Starts the insertion of clickable text for a RichText element. Any text
-- appended with **Panel:AppendText** between this call and
-- **Panel:InsertClickableTextEnd** will become clickable text. The hook 
-- **Panel:ActionSignal** is called when the text is clicked, with "TextClicked"
-- as the signal name and signalValue as the signal value.
-- 
-- **Note**: _The clickable text is a separate Derma panel which will not
-- inherit the current font from the RichText._
-- @function [parent=#Panel] InsertClickableTextStart
-- @param  self
-- @param  #string signalValue The text passed as the action signal's value.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Inserts a color change in a RichText element, which affects the color of all
-- text added with **Panel:AppendText** until another color change is applied.
-- @function [parent=#Panel] InsertColorChange 
-- @param  self
-- @param  #number r The red value (0 - 255).
-- @param  #number g The green value (0 - 255).
-- @param  #number b The blue value (0 - 255).
-- @param  #number a The alpha value (0 - 255).

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Begins a text fade for a RichText element where the last appended text
-- segment is fully faded out after a specific amount of time, at a specific
-- speed. The alpha of the text at any given time is determined by the text's
-- base alpha * ((sustain - **CurTime**) / length) where **CurTime** is added to
-- sustain when this method is called.
-- @function [parent=#Panel] InsertFade
-- @param  self
-- @param  #number sustain The number of seconds the text remains visible.
-- @param  #number length The number of seconds it takes the text to fade out.
-- If set lower than sustain, the text will not begin fading out until (sustain - length) seconds have passed.
-- If set higher than sustain, the text will begin fading out immediately at a fraction of the base alpha.
-- If set to -1, the text doesn't fade out.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Invalidates the layout of this panel object and all its children. This will
-- cause these objects to re-layout immediately, calling **Panel:PerformLayout**.
-- If you want to perform the layout in the next frame, you will have loop
-- manually through all children, and call **Panel:InvalidateLayout** on each.
-- @function [parent=#Panel] InvalidateChildren
-- @param  self
-- @param  #boolean recursive If true, the method will recursively invalidate the layout of all children.
-- Otherwise, only immediate children are affected. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Causes the panel to re-layout in the next frame. During the layout process
-- **Panel:PerformLayout** will be called on the target panel. You should avoid
-- calling this function every frame.
-- @function [parent=#Panel] InvalidateLayout
-- @param  self
-- @param  #boolean layoutNow If true the panel will re-layout instantly and not wait for the next frame. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Invalidates the layout of the parent of this panel object. This will cause
-- it to re-layout, calling **Panel:PerformLayout**.
-- @function [parent=#Panel] InvalidateParent
-- @param  self
-- @param  #boolean layoutNow If true, the re-layout will occur immediately, otherwise it will be performed in the next frame. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Determines whether the mouse cursor is hovered over one of this panel
-- object's children. This is a reverse process using **vgui.GetHoveredPanel**, and
-- looks upward to find the parent.
-- @function [parent=#Panel] IsChildHovered
-- @param  self
-- @param  #boolean immediate Set to true to check only the immediate children of given panel. (first level) _(Default: false)_
-- @return #boolean Whether or not one of this panel object's children is being hovered over.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether this panel is draggable (if user is able to drag it) or not.
-- @function [parent=#Panel] IsDraggable
-- @param  self
-- @return #boolean Whether this panel is draggable (if user is able to drag it) or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether this panel is currently being dragged or not.
-- @function [parent=#Panel] IsDragging
-- @param  self
-- @return #boolean Whether this panel is currently being dragged or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the the panel is enabled or disabled. See **Panel:SetEnabled**
-- for a function that makes the panel enabled or disabled.
-- @function [parent=#Panel] IsEnabled
-- @param  self
-- @return #boolean Whether the panel is enabled or disabled.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the mouse cursor is hovering over this panel or not. Uses
-- **vgui.GetHoveredPanel** internally. Requires **Panel:SetMouseInputEnabled** to be
-- set to true.
-- @function [parent=#Panel] IsHovered
-- @param  self
-- @return #boolean true if the panel is hovered.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns true if the panel can receive keyboard input.
-- @function [parent=#Panel] IsKeyboardInputEnabled
-- @param  self
-- @return #boolean Is keyboard input enabled.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Determines whether or not a HTML or DHTML element is currently loading a page.
-- @function [parent=#Panel] IsLoading
-- @param  self
-- @return #boolean Whether or not the (D)HTML object is loading.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the panel is going to be deleted in the next frame.
-- @function [parent=#Panel] IsMarkedForDeletion
-- @param  self
-- @return #boolean Is marked for deletion.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns true if the panel can receive mouse input.
-- @function [parent=#Panel] IsMouseInputEnabled
-- @param  self
-- @return #boolean Is mouse input enabled.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Determines whether or not a text-based panel object, such as a DTextEntry,
-- is in multi-line mode. This is set with **Panel:SetMultiline**.
-- @function [parent=#Panel] IsMultiline
-- @param  self
-- @return #boolean Whether the object is in multi-line mode or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the panel contains the given panel, recursively.
-- @function [parent=#Panel] IsOurChild
-- @param  self
-- @param  #Panel childPanel Panel to check is a descendant.
-- @return #boolean True if the panel contains childPanel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Determines if the panel object is selectable (like icons in the Spawn Menu,
-- holding Shift). This is set with **Panel:SetSelectable**.
-- @function [parent=#Panel] IsSelectable
-- @param  self
-- @return #boolean Whether the panel is selectable or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the panel object is selected (like icons in the Spawn Menu,
-- holding Shift). This can be set in Lua using **Panel:SetSelected**.
-- @function [parent=#Panel] IsSelected
-- @param  self
-- @return #boolean Whether the panel object is selected or not.
-- Always returns false if the object is not selectable. This can be modified using **Panel:SetSelectable**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Determines if the panel object is a selection canvas or not. This is set
-- with **Panel:SetSelectionCanvas**.
-- @function [parent=#Panel] IsSelectionCanvas
-- @param  self
-- @return #any The value (if any) set by **Panel:SetSelectionCanvas**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the panel is valid and not marked for deletion.
-- @function [parent=#Panel] IsValid
-- @param  self
-- @return #boolean True if the object is valid.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the panel is visible.
-- @function [parent=#Panel] IsVisible
-- @param  self
-- @return #boolean Is visible.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Remove the focus from the panel.
-- @function [parent=#Panel] KillFocus
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Redefines the panel object's **Panel:SetPos** method to operate using
-- frame-by-frame linear interpolation (Lerp). When the panel's position is
-- changed, it will move to the target position at the speed defined. You can
-- undo this with **Panel:DisableLerp**.
-- Unlike the other panel animation functions, such as **Panel:MoveTo**, this
-- animation method will not operate whilst the game is paused. This is because
-- it relies on FrameTime.
-- @function [parent=#Panel] LerpPositions
-- @param  self
-- @param  #number speed The speed at which to move the panel. This is affected by the value of easeOut.
-- Recommended values are:
-- 
-- * 0.1 - 10 when easeOut is false.
-- * 0.1 - 1 when easeOut is true.
-- @param  #boolean easeOut This causes the panel object to 'jump' at the target, slowing as it approaches.
-- This affects the speed value significantly, see above.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Loads a .gwen file (created by GWEN Designer) and calls **Panel:LoadGWENString**
-- with the contents of the loaded file. Used to load panel controls from a file.
-- @function [parent=#Panel] LoadGWENFile
-- @param  self
-- @param  #string filename The file to open. The path is relative to garrysmod/garrysmod/.
-- @param  #string path="GAME" The path used to look up the file.
-- 
-- * "GAME" Structured like base folder (garrysmod/), searches all the mounted content. (main folder, addons, mounted games etc)
-- * "LUA" or "lsv" - All Lua folders (lua/) including gamesmodes and addons.
-- * "DATA" Data folder. (garrysmod/data)
-- * "MOD" Strictly the game folder (garrysmod/), ignores mounting.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Loads controls for the panel from a JSON string.
-- @function [parent=#Panel] LoadGWENString
-- @param  self
-- @param  #string str JSON string containing information about controls to create.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the cursor position local to the position of the panel (usually the
-- upper-left corner).
-- @function [parent=#Panel] LocalCursorPos
-- @param  self
-- @return #number, #number The x and y coordinates.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Gets the absolute screen position of the position specified relative to the
-- panel. See also **Panel:ScreenToLocal**.
-- 
-- **Warning**: _This function uses a cached value for the screen position of
-- the panel, computed at the end of the last VGUI Think/Layout pass. ie.
-- inaccurate results may be returned if the panel or any of its ancestors have
-- been repositioned outside of **Panel:Think** or **Panel:PerformLayout** within the
-- last frame._
-- 
-- **Note**: _If the panel uses **Panel:Dock**, this function will return 0, 0 when
-- the panel was created. The position will be updated in the next frame._
-- @function [parent=#Panel] LocalToScreen
-- @param  self
-- @param  #number posX The X coordinate of the position on the panel to translate.
-- @param  #number posY The Y coordinate of the position on the panel to translate.
-- @return #number, #number The X and Y coordinate relative to the screen.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Focuses the panel and enables it to receive input. This automatically calls
-- **Panel:SetMouseInputEnabled** and **Panel:SetKeyboardInputEnabled** and
-- sets them to true.
-- 
-- **Note**: _Panels derived from Panel will not work properly with this
-- function. Due to this, any children will not be intractable with keyboard.
-- Derive from EditablePanel instead._
-- @function [parent=#Panel] MakePopup
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Allows the panel to receive mouse input even if the mouse cursor is outside
-- the bounds of the panel.
-- @function [parent=#Panel] MouseCapture
-- @param  self
-- @param  #boolean doCapture Set to true to enable, set to false to disable.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Places the panel above the passed panel with the specified offset.
-- @function [parent=#Panel] MoveAbove
-- @param  self
-- @param  #Panel panel Panel to position relatively to.
-- @param  #number offset The align offset. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Places the panel below the passed panel with the specified offset.
-- @function [parent=#Panel] MoveBelow
-- @param  self
-- @param  #Panel panel Panel to position relatively to.
-- @param  #number offset The align offset. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Moves the panel by the specified coordinates using animation.
-- @function [parent=#Panel] MoveBy
-- @param  self
-- @param  #number moveX The number of pixels to move by in the horizontal (x) direction.
-- @param  #number moveY The number of pixels to move by in the horizontal (Y) direction.
-- @param  #number time The time (in seconds) in which to perform the animation.
-- @param  #number delay The delay (in seconds) before the animation begins. _(Default: 0)_
-- @param  #number ease The easing of the start and/or end speed of the animation. See **Panel:NewAnimation** for how this works. _(Default: -1)_
-- @param  #function callback The function to be called once the animation is complete. _(Default: nil)_
-- Arguments are:
-- 
-- * _#table animData_ : The AnimationData structure that was used.
-- * _#Panel pnl_ : The panel object that was moved.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Places the panel left to the passed panel with the specified offset.
-- @function [parent=#Panel] MoveLeftOf
-- @param  self
-- @param  #Panel panel Panel to position relatively to.
-- @param  #number offset The align offset. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Places the panel right to the passed panel with the specified offset.
-- @function [parent=#Panel] MoveRightOf
-- @param  self
-- @param  #Panel panel Panel to position relatively to.
-- @param  #number offset The align offset. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Moves the panel to the specified position using animation.
-- @function [parent=#Panel] MoveTo
-- @param  self
-- @param  #number posX The target x coordinate of the panel.
-- @param  #number posY The target y coordinate of the panel.
-- @param  #number time The time to perform the animation within.
-- @param  #number delay The delay before the animation starts. _(Default: 0)_
-- @param  #number ease The easing of the start and/or end speed of the animation. See **Panel:NewAnimation** for how this works. _(Default: -1)_
-- @param  #function callback The function to be called once the animation finishes.
-- Arguments are:
-- 
-- * _#table animData_ : The AnimationData structure that was used.
-- * _#Panel pnl_ : The panel object that was moved.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Moves this panel object in front of the specified sibling (child of the same
-- parent) in the render order, and shuffles up the Z-positions of siblings now behind.
-- @function [parent=#Panel] MoveToAfter
-- @param  self
-- @param  #Panel siblingPanel The panel to move this one in front of. Must be a child of the same parent panel.
-- @return #boolean false if the passed panel is not a sibling, otherwise nil.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Moves the panel object behind all other panels on screen. If the panel has
-- been made a pop-up with **Panel:MakePopup**, it will still draw in front of any
-- panels that haven't.
-- @function [parent=#Panel] MoveToBack
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Moves this panel object behind the specified sibling (child of the same parent)
-- in the render order, and shuffles up the **Panel:SetZPos** of siblings now in front.
-- @function [parent=#Panel] MoveToBefore
-- @param  self
-- @param  #Panel siblingPanel The panel to move this one behind. Must be a child of the same parent panel.
-- @return #boolean false if the passed panel is not a sibling, otherwise nil.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Moves the panel in front of all other panels on screen. Unless the panel has
-- been made a pop-up using **Panel:MakePopup**, it will still draw behind any that have.
-- @function [parent=#Panel] MoveToFront
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a new animation for the panel object.
-- Methods that use this function:
-- 
-- * **Panel:MoveTo**
-- * **Panel:SizeTo**
-- * **Panel:SlideUp**
-- * **Panel:SlideDown**
-- * **Panel:ColorTo**
-- * **Panel:AlphaTo**
-- * **Panel:MoveBy**
-- * **Panel:LerpPositions**
-- @function [parent=#Panel] NewAnimation
-- @param  self
-- @param  #number length The length of the animation in seconds.
-- @param  #number delay The delay before the animation starts. _(Default: 0)_
-- @param  #number ease The power/index to use for easing. _(Default: -1)_
-- 
-- * Positive values greater than 1 will ease in; the higher the number, the sharper the curve's gradient (less linear).
-- * A value of 1 removes all easing.
-- * Positive values between 0 and 1 ease out; values closer to 0 increase the curve's gradient (less linear).
-- * A value of 0 will break the animation and should be avoided.
-- * Any value less than zero will ease in/out; the value has no effect on the gradient.
-- @param  #function callback=nil The function to be called when the animation ends.
-- Arguments passed are:
-- 
-- * _#table animTable_ : The **AnimationData structure** that was used.
-- * _#Panel tgtPanel_ : The panel object that was animated.
-- @return #table Partially filled AnimationData structure with members:
-- 
-- * _#number EndTime_ : Equal to length and delay arguments added together, plus either the **SysTime** if there is no other animation queued or the end time of the last animation in the queue.
-- * _#number StartTime_ : Equal to the delay argument, plus either the **SysTime** if there is no other animation queued or the end time of the last animation in the queue.
-- * _#number Ease_ : Equal to the ease argument.
-- * _#function OnEnd_ : Equal to the callback argument.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- 
-- @function [parent=#Panel] NewObject
-- @param  self
-- @param  #string objectName

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- 
-- @function [parent=#Panel] NewObjectCallback
-- @param  self
-- @param  #string objectName
-- @param  #string callbackName

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whether this panel's drawings should be clipped within the parent
-- panel's bounds. See also **DisableClipping** and **surface.DisableClipping**.
-- @function [parent=#Panel] NoClipping
-- @param  self
-- @param  #boolean clip Whether to clip or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the number of children of the panel object that are selected. This
-- is equivalent to calling **Panel:IsSelected** on all child objects and
-- counting the number of returns that are true.
-- @function [parent=#Panel] NumSelectedChildren
-- @param  self
-- @return #number The number of child objects that are currently selected.
-- This does not include the parent object you are calling the method from.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Instructs a HTML control to download and parse a HTML script using the passed URL.
-- @function [parent=#Panel] OpenURL
-- @param  self
-- @param  #string URL URL to open.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Paints a ghost copy of the panel at the given position.
-- @function [parent=#Panel] PaintAt
-- @param  self
-- @param  #number posX The x coordinate to draw the panel from.
-- @param  #number posY The y coordinate to draw the panel from.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Paints the panel at its current position. To use this you must call **Panel:SetPaintedManually**(true).
-- @function [parent=#Panel] PaintManual
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Parents the panel to the HUD. Makes it invisible on the escape-menu and
-- disables controls.
-- @function [parent=#Panel] ParentToHUD
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Pastes the contents of the clipboard into the TextEntry. Only works for TextEntries.
-- 
-- **Note**: _Tab characters will be dropped from the pasted text._
-- 
-- **Warning**: _Due to privacy concerns, this function has been disabled._
-- @function [parent=#Panel] Paste
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the width and position of a DLabel and places the passed panel object
-- directly to the right of it. Returns the y value of the bottom of the
-- tallest object. The panel on which this method is run is not relevant; only
-- the passed objects are affected.
-- @function [parent=#Panel] PositionLabel
-- @param  self
-- @param  #number lblWidth The width to set the label to.
-- @param  #number x The horizontal (x) position at which to place the label.
-- @param  #number y The horizontal (y) position at which to place the label.
-- @param  #Panel lbl The label to resize and position.
-- @param  #Panel panelObj The panel object to place to the right of the label.
-- @return #number The distance from the top of the parent panel to the bottom of the tallest object.
-- (the y position plus the height of the label or passed panel, depending on which is tallest)

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Only used in deprecated Derma controls._
-- 
-- Sends a command to the panel.
-- @function [parent=#Panel] PostMessage
-- @param  self
-- @param  #string messageName The name of the message.
-- @param  #string valueType The type of the variable to post.
-- @param  #string value The value to post.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Installs Lua defined functions into the panel.
-- @function [parent=#Panel] Prepare
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables the queue for panel animations. If enabled, the next new animation
-- will begin after all current animations have ended. This must be called
-- before **Panel:NewAnimation** to work, and only applies to the next new
-- animation. If you want to queue many, you must call this before each.
-- @function [parent=#Panel] Queue
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Causes a SpawnIcon to rebuild its model image.
-- @function [parent=#Panel] RebuildSpawnIcon
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Re-renders a spawn icon with customized cam data.
-- 
-- **Note**: _This function does not accept the standard **CamData structure**._
-- @function [parent=#Panel] RebuildSpawnIconEx
-- @param  self
-- @param  #table data A four-membered table containing the information needed to re-render:
-- 
-- * _#Vector cam\_pos_ : The relative camera position the model is viewed from.
-- * _#Angle cam\_ang_ : The camera angle the model is viewed from.
-- * _#number cam\_fov_ : The camera's field of view (FOV).
-- * _#Entity ent_ : The entity object of the model.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Allows the panel to receive drag and drop events. Can be called multiple
-- times with different names to receive multiple different draggable panel events.
-- @function [parent=#Panel] Receiver
-- @param  self
-- @param  #string name Name of DnD panels to receive. This is set on the drag'n'drop-able panels via **Panel:Droppable**.
-- @param  #function func This function is called whenever a panel with valid name is hovering above and dropped on this panel.
-- It has next arguments:
-- 
-- * _#Panel pnl_ : The receiver panel.
-- * _#table tbl_ : A table of panels dropped onto receiver panel.
-- * _#boolean dropped_ : False if hovering over, true if dropped onto.
-- * _#number menuIndex_ : Index of clicked menu item from third argument of **Panel:Receiver**.
-- * _#number x_ : Cursor pos, relative to the receiver.
-- * _#number y_ : Cursor pos, relative to the receiver.
-- @param  #table menu A table of strings that will act as a menu if drag'n'drop was performed with a right click.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Refreshes the HTML panel's current page.
-- @function [parent=#Panel] Refresh
-- @param  self
-- @param  #boolean ignoreCache If true, the refresh will ignore cached content similar to "Ctrl+F5" in most browsers. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Marks a panel for deletion so it will be deleted on the next frame. Will
-- automatically call **Panel:InvalidateParent**.
-- @function [parent=#Panel] Remove
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Attempts to obtain focus for this panel.
-- @function [parent=#Panel] RequestFocus
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resets all text fades in a RichText element made with **Panel:InsertFade**.
-- @function [parent=#Panel] ResetAllFades
-- @param  self
-- @param  #boolean hold True to reset fades, false otherwise.
-- @param  #boolean expiredOnly Any value equating to true will reset fades only on text segments that are completely faded out.
-- @param  #number newSustain The new sustain value of each faded text segment. Set to -1 to keep the old sustain value.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Runs/Executes a string as JavaScript code in DHTML panel.
-- 
-- **Note**: _This function does NOT evaluate expression (ex: allow you to
-- pass variables from JavaScript (JS) to Lua context). Because a return value
-- is nil/no value (a.k.a. void). If you wish to pass/return values from JS to
-- Lua, you may want to use DHTML.AddFunction function to accomplish that job._
-- @function [parent=#Panel] RunJavascript
-- @param  self
-- @param  #string js Specify JavaScript code to be executed.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Saves the current state (caret position and the text inside) of a TextEntry
-- as an undo state. See also **Panel:Undo**.
-- @function [parent=#Panel] SaveUndoState
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Translates global screen coordinate to coordinates relative to the panel.
-- See also **Panel:LocalToScreen**.
-- 
-- **Warning**: _This function uses a cached value for the screen position of
-- the panel, computed at the end of the last VGUI Think/Layout pass. ie.
-- inaccurate results may be returned if the panel or any of its ancestors have
-- been repositioned outside of **Panel:Think** or **Panel:PerformLayout** within the
-- last frame._
-- @function [parent=#Panel] ScreenToLocal
-- @param  self
-- @param  #number screenX The x coordinate of the screen position to be translated.
-- @param  #number screenY The y coordinate of the screen position to be translated.
-- @return #number, #number Relative X and Y positions.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Selects all items within a panel or object. For text-based objects, selects all text.
-- @function [parent=#Panel] SelectAll
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- If called on a text entry, clicking the text entry for the first time will
-- automatically select all of the text ready to be copied by the user.
-- @function [parent=#Panel] SelectAllOnFocus
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Selects all the text in a panel object. Will not select non-text items; for
-- this, use **Panel:SelectAll**.
-- @function [parent=#Panel] SelectAllText
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Deselects all items in a panel object. For text-based objects, this will
-- deselect all text.
-- @function [parent=#Panel] SelectNone
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the achievement to be displayed by **AchievementIcon**.
-- @function [parent=#Panel] SetAchievement
-- @param  self
-- @param  #number id Achievement number ID.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Only used in deprecated Derma controls._
-- 
-- Used in Button to call a function when the button is clicked and in Slider
-- when the value changes.
-- @function [parent=#Panel] SetActionFunction
-- @param  self
-- @param  #function func Function to call when the Button is clicked or the Slider value is changed.
-- Arguments given are:
-- 
-- * _#Panel self_ : The panel itself
-- * _#string action_ : "Command" on button press, "SliderMoved" on slider move.
-- * _#number val_ : The new value of the Slider. Will always equal 0 for buttons.
-- * _#number_ : Always equals 0.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Configures a text input to allow user to type characters that are not
-- included in the US-ASCII (7-bit ASCII) character set. Characters not
-- included in US-ASCII are multi-byte characters in UTF-8. They can be
-- accented characters, non-Latin characters and special characters.
-- @function [parent=#Panel] SetAllowNonAsciiCharacters
-- @param  self
-- @param  #boolean allowed Set to true in order not to restrict input characters.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the alpha multiplier for the panel
-- @function [parent=#Panel] SetAlpha
-- @param  self
-- @param  #number alpha The alpha value in the range of 0-255.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables or disables animations for the panel object by overriding the
-- **Panel:AnimationThink** hook to nil and back.
-- @function [parent=#Panel] SetAnimationEnabled
-- @param  self
-- @param  #boolean enable Whether to enable or disable animations.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whenever the panel should be removed if the parent was removed.
-- @function [parent=#Panel] SetAutoDelete
-- @param  self
-- @param  #boolean autoDelete Whenever to delete if the parent was removed or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the background color of a panel such as a RichText, Label or DColorCube.
-- 
-- **Note**: _This doesn't apply to all VGUI elements and its function varies between them._
-- 
-- For DLabel elements, you must use **Panel:SetPaintBackgroundEnabled**(true)
-- before applying the color. This will not work on setup of the panel - you
-- should use this function in a hook like **Panel:ApplySchemeSettings** or **Panel:PerformLayout**.
-- @function [parent=#Panel] SetBGColor
-- @param  self
-- @param  #number r or color The red channel of the color, or a **Color structure**.
-- If you pass the latter, the following three arguments are ignored.
-- @param  #number g The green channel of the color.
-- @param  #number b The blue channel of the color.
-- @param  #number a The alpha channel of the color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Sets the background color of the panel.
-- @function [parent=#Panel] SetBGColorEx
-- @param  self
-- @param  #number r The red channel of the color.
-- @param  #number g The green channel of the color.
-- @param  #number b The blue channel of the color.
-- @param  #number a The alpha channel of the color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the position of the caret (or text cursor) in a text-based panel object.
-- @function [parent=#Panel] SetCaretPos
-- @param  self
-- @param  #number offset Caret position/offset from the start of text. A value of 0 places the caret before the first character.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the action signal command that's fired when a Button is clicked. The
-- hook **Panel:ActionSignal** is called as the click response. This has no effect
-- on buttons unless it has had its AddActionSignalTarget method called (an
-- internal function not available by default in Garry's Mod LUA). A better
-- alternative is calling **Panel:Command** when a DButton is clicked.
-- @function [parent=#Panel] SetCommand
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the alignment of the contents.
-- @function [parent=#Panel] SetContentAlignment
-- @param  self
-- @param  #number alignment The direction of the content, based on the number pad.
-- 
-- * 1 - bottom-left
-- * 2 - bottom-center
-- * 3 - bottom-right
-- * 4 - middle-left
-- * 5 - center
-- * 6 - middle-right
-- * 7 - top-left
-- * 8 - top-center
-- * 9 - top-right

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets this panel's convar. When the convar changes this panel will update automatically.
-- 
-- **Warning**: _This function does not exist on all panels._
-- @function [parent=#Panel] SetConVar
-- @param  self
-- @param  #string convar The console variable to check.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stores a string in the named cookie using **Panel:GetCookieName** as prefix.
-- 
-- **Warning**: _The panel's cookie name MUST be set for this function to work.
-- See **Panel:SetCookieName**._
-- @function [parent=#Panel] SetCookie
-- @param  self
-- @param  #string cookieName The unique name used to retrieve the cookie later.
-- @param  #string value The value to store in the cookie. This can be retrieved later as a string or number.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the panel's cookie name. Calls **Panel:LoadCookies** if defined.
-- @function [parent=#Panel] SetCookieName
-- @param  self
-- @param  #string name The panel's cookie name. Used as prefix for **Panel:SetCookie**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the appearance of the cursor.
-- @function [parent=#Panel] SetCursor
-- @param  self
-- @param  #string cursor The cursor to be set. Can be one of the following:
-- 
-- * arrow
-- * beam
-- * hourglass
-- * waitarrow
-- * crosshair
-- * up
-- * sizenwse
-- * sizenesw
-- * sizewe
-- * sizens
-- * sizeall
-- * no
-- * hand
-- * blank
-- Set to anything else to set it to "none", the default fallback.
-- Do note that a value of "none" does not, as one might assume, result in no cursor being drawn - hiding the cursor requires a value of "blank" instead.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the drag parent. Drag parent means that when we start to drag this
-- panel, we'll really start dragging the defined parent.
-- @function [parent=#Panel] SetDragParent
-- @param  self
-- @param  #Panel parent The panel to set as drag parent.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the visibility of the language selection box in a TextEntry when typing
-- in non-English mode. See **Panel:SetDrawLanguageIDAtLeft** for a function that
-- changes the position of the language selection box.
-- @function [parent=#Panel] SetDrawLanguageID
-- @param  self
-- @param  #boolean visible true to make it visible, false to hide it.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets where to draw the language selection box. See **Panel:SetDrawLanguageID**
-- for a function that hides or shows the language selection box.
-- @function [parent=#Panel] SetDrawLanguageIDAtLeft
-- @param  self
-- @param  #boolean left True = left, False = right.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Makes the panel render in front of all others, including the spawn menu and
-- main menu. Priority is given based on the last call, so of two panels that
-- call this method, the second will draw in front of the first.
-- 
-- **Note**: _This only makes the panel **draw** above other panels. If there's
-- another panel that would have otherwise covered it, users will not be able
-- to interact with it._
-- @function [parent=#Panel] SetDrawOnTop
-- @param  self
-- @param  #boolean drawOnTop Whether or not to draw the panel in front of all others. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the target area for dropping when an object is being dragged around
-- this panel using the dragndrop library. This draws a target box of the
-- specified size and position, until **Panel:DragHoverEnd** is called. It uses
-- **Panel:DrawDragHover** to draw this area.
-- @function [parent=#Panel] SetDropTarget
-- @param  self
-- @param  #number x The x coordinate of the top-left corner of the drop area.
-- @param  #number y The y coordinate of the top-left corner of the drop area.
-- @param  #number width The width of the drop area.
-- @param  #number height The height of the drop area.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the enabled state of a disable-able panel object, such as a DButton or
-- DTextEntry. See **Panel:IsEnabled** for a function that retrieves the "enabled"
-- state of a panel.
-- @function [parent=#Panel] SetEnabled
-- @param  self
-- @param  #boolean enable Whether to enable or disable the panel object.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Adds a shadow falling to the bottom right corner of the panel's text. This
-- has no effect on panels that do not derive from Label.
-- @function [parent=#Panel] SetExpensiveShadow
-- @param  self
-- @param  #number distance The distance of the shadow from the panel.
-- @param  #table Color The color of the shadow. Uses the Color structure.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the foreground color of a panel. For a Label or RichText, this is the
-- color of its text. This function calls **Panel:SetFGColorEx** internally.
-- 
-- **Note**: _This doesn't apply to all VGUI elements (such as DLabel) and its
-- function varies between them._
-- @function [parent=#Panel] SetFGColor
-- @param  self
-- @param  #number r or color The red channel of the color, or a **Color structure**.
-- If you pass the latter, the following three arguments are ignored.
-- @param  #number g The green channel of the color.
-- @param  #number b The blue channel of the color.
-- @param  #number a The alpha channel of the color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Sets the foreground color of the panel. For labels, this is the color of
-- their text.
-- @function [parent=#Panel] SetFGColorEx
-- @param  self
-- @param  #number r The red channel of the color.
-- @param  #number g The green channel of the color.
-- @param  #number b The blue channel of the color.
-- @param  #number a The alpha channel of the color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the panel that owns this FocusNavGroup to be the root in the focus
-- traversal hierarchy.
-- @function [parent=#Panel] SetFocusTopLevel
-- @param  self
-- @param  #boolean state

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the font used to render this panel's text. To retrieve the font used by
-- a panel, call **Panel:GetFont**.
-- @function [parent=#Panel] SetFontInternal
-- @param  self
-- @param  #string fontName The name of the font.
-- Alternatively, use **surface.CreateFont** to create your own custom font.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the height of the panel. Calls **Panel:OnSizeChanged** and marks this panel
-- for layout (**Panel:InvalidateLayout**). See also **Panel:SetSize**.
-- @function [parent=#Panel] SetHeight
-- @param  self
-- @param  #number height The height to be set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Allows you to set HTML code within a panel.
-- @function [parent=#Panel] SetHTML
-- @param  self
-- @param  #string HTML code The code to set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Allows or disallows the panel to receive keyboard focus and input. This is
-- recursively applied to all children.
-- @function [parent=#Panel] SetKeyboardInputEnabled
-- @param  self
-- @param  #boolean enable Whether keyboard input should be enabled for this panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the minimum dimensions of the panel or object. You can restrict either
-- or both values. Calling the function without arguments will remove the minimum size.
-- @function [parent=#Panel] SetMinimumSize
-- @param  self
-- @param  #number minW The minimum width of the object. _(Default: nil)_
-- @param  #number minH The minimum height of the object. _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the model to be displayed by SpawnIcon.
-- 
-- **Note**: _This must be called after setting size if you wish to use a
-- different size spawnicon._
-- @function [parent=#Panel] SetModel
-- @param  self
-- @param  #string ModelPath The path of the model to set.
-- @param  #number skin The skin to set. _(Default: 0)_
-- @param  #string bodygroups The body groups to set. Each single-digit number in the string represents a separate bodygroup, up to 9 in total. _(Default: "")_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables or disables the mouse input for the panel.
-- @function [parent=#Panel] SetMouseInputEnabled
-- @param  self
-- @param  #boolean mouseInput Whenever to enable or disable mouse input.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables or disables the multi-line functionality of a text object, such as
-- a DTextEntry.
-- @function [parent=#Panel] SetMultiline
-- @param  self
-- @param  #boolean multiline Whether to enable multiline or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the internal name of the panel.
-- @function [parent=#Panel] SetName
-- @param  self
-- @param  #string name The new name of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whenever all the default background of the panel should be drawn or not.
-- @function [parent=#Panel] SetPaintBackgroundEnabled
-- @param  self
-- @param  #boolean paintBackground Whenever to draw the background or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whenever all the default border of the panel should be drawn or not.
-- @function [parent=#Panel] SetPaintBorderEnabled
-- @param  self
-- @param  #boolean paintBorder Whenever to draw the border or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables or disables painting of the panel manually with **Panel:PaintManual**.
-- @function [parent=#Panel] SetPaintedManually
-- @param  self
-- @param  #boolean paintedManually True if the panel should be painted manually.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the parent of the panel.
-- @function [parent=#Panel] SetParent
-- @param  self
-- @param  #Panel parent The new parent of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Used by AvatarImage to load an avatar for given player.
-- @function [parent=#Panel] SetPlayer
-- @param  self
-- @param  #Player player The player to use avatar of.
-- @param  #number size The size of the avatar to use. Acceptable sizes are 32, 64, 184.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- If this panel object has been made a popup with **Panel:MakePopup**, this method
-- will prevent it from drawing in front of other panels when it receives input focus.
-- @function [parent=#Panel] SetPopupStayAtBack
-- @param  self
-- @param  #boolean stayAtBack If true, the popup panel will not draw in front of others when it gets focus, for example when it is clicked.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the position of the panel. This will trigger **Panel:PerformLayout**. You
-- should avoid calling this function in **Panel:PerformLayout** to avoid infinite loops.
-- 
-- **Note**: _If you wish to position and re-size panels without much guesswork
-- and have them look good on different screen resolutions, you may find
-- **Panel:Dock** useful._
-- @function [parent=#Panel] SetPos
-- @param  self
-- @param  #number posX The x coordinate of the position.
-- @param  #number posY The y coordinate of the position.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whenever the panel should be rendered in the next screenshot.
-- @function [parent=#Panel] SetRenderInScreenshots
-- @param  self
-- @param  #boolean renderInScreenshot Whenever to render or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whether the panel object can be selected or not (like icons in the
-- Spawn Menu, holding Shift). If enabled, this will affect the function of a
-- DButton whilst Shift is pressed. **Panel:SetSelected** can be used to
-- select/deselect the object.
-- @function [parent=#Panel] SetSelectable
-- @param  self
-- @param  #boolean selectable Whether the panel object should be selectable or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the selected state of a selectable panel object. This functionality is
-- set with **Panel:SetSelectable** and checked with **Panel:IsSelectable**.
-- @function [parent=#Panel] SetSelected
-- @param  self
-- @param  #boolean selected Whether the object should be selected or deselected.
-- **Panel:IsSelected** can be used to determine the selected state of the object. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enables the panel object for selection (much like the spawn menu).
-- @function [parent=#Panel] SetSelectionCanvas
-- @param  self
-- @param  #any selCanvas Any value other than nil or false will enable the panel object for selection. It is recommended to pass true.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the size of the panel. Calls Panel:OnSizeChanged and marks this panel
-- for layout (**Panel:InvalidateLayout**). See also **Panel:SetWidth** and **Panel:SetHeight**.
-- 
-- **Note**: _If you wish to position and re-size panels without much guesswork and
-- have them look good on different screen resolutions, you may find **Panel:Dock** useful._
-- @function [parent=#Panel] SetSize
-- @param  self
-- @param  #number width The width of the panel.
-- @param  #number height The height of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the derma skin that the panel object will use, and refreshes all panels
-- with **derma.RefreshSkins**.
-- @function [parent=#Panel] SetSkin
-- @param  self
-- @param  #string skinName The name of the skin to use. The default derma skin is _Default_.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the .png image to be displayed on a SpawnIcon or the panel it is based
-- on ModelImage. Only .png images can be used with this function.
-- @function [parent=#Panel] SetSpawnIcon
-- @param  self
-- @param  #string icon A path to the .png material, for example one of the Silkicons shipped with the game.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Used by AvatarImage panels to load an avatar by its 64-bit Steam ID (community ID).
-- @function [parent=#Panel] SetSteamID
-- @param  self
-- @param  #string steamid The 64bit SteamID of the player to load avatar of.
-- @param  #number size The size of the avatar to use. Acceptable sizes are 32, 64, 184.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets which order pressing TAB should "select/highlight" the panels, used on
-- text entries and buttons.
-- @function [parent=#Panel] SetTabPosition
-- @param  self
-- @param  #number position The position to set this panel to.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets height of a panel. An alias of **Panel:SetHeight**.
-- @function [parent=#Panel] SetTall
-- @param  self
-- @param  #number height Desired height to set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Removes the panel after given time in seconds.
-- 
-- **Note**: _This function will not work if **Panel:AnimationThink** is overridden,
-- unless **Panel:AnimationThinkInternal** is called every frame._
-- @function [parent=#Panel] SetTerm
-- @param  self
-- @param  #number delay Delay in seconds after which the panel should be removed.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the text value of a panel object containing text, such as a Label, TextEntry
-- or RichText and their derivatives, such as DLabel, DTextEntry or DButton.
-- 
-- **Note**: _When used on a Label or its derivatives (DLabel and DButton), it
-- will automatically call **Panel:InvalidateLayout**, meaning that you should
-- avoid running this function every frame on these panels to avoid unnecessary
-- performance loss._
-- @function [parent=#Panel] SetText
-- @param  self
-- @param  #string text The text value to set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the left and top text margins of a text-based panel object, such as a
-- DButton or DLabel.
-- @function [parent=#Panel] SetTextInset
-- @param  self
-- @param  #number insetX The left margin for the text, in pixels.
-- This will only affect centered text if the margin is greater than its x-coordinate.
-- @param  #number insetY The top margin for the text, in pixels.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the height of a RichText element to accommodate the text inside.
-- 
-- **Note**: _This function internally relies on **Panel:GetNumLines**, so it
-- should be called at least a couple frames after modifying the text using
-- **Panel:AppendText**._
-- @function [parent=#Panel] SetToFullHeight
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the tooltip to be displayed when a player hovers over the panel object
-- with their cursor.
-- @function [parent=#Panel] SetTooltip
-- @param  self
-- @param  #string str The text to be displayed in the tooltip. Set false to disable it.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the panel to be displayed as a tooltip when a player hovers over the
-- panel object with their cursor. Note that it will not override the default
-- DTooltip panel.
-- 
-- **Note**: _**Panel:SetTooltip** will override this functionality._
-- 
-- **Warning**: _Calling this from **Panel:OnCursorEntered** is too late! The
-- tooltip will not be displayed or be updated._
-- 
-- **Warning**: _Given panel or the previously set one will NOT be automatically removed._
-- @function [parent=#Panel] SetTooltipPanel
-- @param  self
-- @param  #Panel tooltipPanel The panel to use as the tooltip. _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the URL of a link-based panel such as DLabelURL.
-- @function [parent=#Panel] SetURL
-- @param  self
-- @param  #string url The URL to set. This **must** begin with http://.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the visibility of the vertical scrollbar. Works for RichText and TextEntry.
-- @function [parent=#Panel] SetVerticalScrollbarEnabled
-- @param  self
-- @param  #boolean display True to display the vertical text scroll bar, false to hide it. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the "visibility" of the panel.
-- @function [parent=#Panel] SetVisible
-- @param  self
-- @param  #boolean visible The visibility of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets width of a panel. An alias of **Panel:SetWidth**.
-- @function [parent=#Panel] SetWide
-- @param  self
-- @param  #number width Desired width to set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the width of the panel. Calls **Panel:OnSizeChanged** and marks this panel
-- for layout (**Panel:InvalidateLayout**). See also **Panel:SetSize**.
-- @function [parent=#Panel] SetWidth
-- @param  self
-- @param  #number width The new width of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This makes it so that when you're hovering over this panel you can _click_
-- on the world. Your viewmodel will aim etc.
-- @function [parent=#Panel] SetWorldClicker
-- @param  self
-- @param  #boolean enabled

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets whether text wrapping should be enabled or disabled on Label and DLabel
-- panels. Use **DLabel:SetAutoStretchVertical** to automatically correct vertical
-- size; **Panel:SizeToContents** will not set the correct height.
-- @function [parent=#Panel] SetWrap
-- @param  self
-- @param  #boolean wrap True to enable text wrapping, false otherwise.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the panels z position which determines the rendering order. Panels with
-- lower z positions appear behind panels with higher z positions. This also
-- controls in which order panels docked with **Panel:Dock** appears.
-- @function [parent=#Panel] SetZPos
-- @param  self
-- @param  #number zIndex The z position of the panel. Can't be lower than -32768 or higher than 32767.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Makes a panel visible.
-- @function [parent=#Panel] Show
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Uses animation to resize the panel to the specified size.
-- @function [parent=#Panel] SizeTo
-- @param  self
-- @param  #number sizeW The target width of the panel. Use -1 to retain the current width. _(Default: 0)_
-- @param  #number sizeH The target height of the panel. Use -1 to retain the current height. _(Default: 0)_
-- @param  #number time The time to perform the animation within.
-- @param  #number delay The delay before the animation starts. _(Default: 0)_
-- @param  #number ease Easing of the start and/or end speed of the animation. See **Panel:NewAnimation** for how this works. _(Default: -1)_
-- @param  #function callback The function to be called once the animation finishes.
-- Arguments are:
-- 
-- * _#table animData_ : The AnimationData structure that was used.
-- * _#Panel pnl_ : The panel object that was resized.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resizes the panel to fit the bounds of its children.
-- 
-- **Note**: _Your panel must have its layout updated (**Panel:InvalidateLayout**)
-- for this function to work properly._
-- @function [parent=#Panel] SizeToChildren
-- @param  self
-- @param  #boolean sizeW Resize with width of the panel.
-- @param  #boolean sizeH Resize with height of the panel.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resizes the panel so that its width and height fit all of the content inside.
-- 
-- **Note**: _Only works on Label derived panels such as DLabel by default, and
-- on any panel that manually implemented the **Panel:SizeToContents** method, such
-- as DNumberWang and DImage._
-- 
-- **Warning**: _You must call this function AFTER setting text/font, adjusting
-- child panels or otherwise altering the panel._
-- @function [parent=#Panel] SizeToContents
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resizes the panel object's width to accommodate all child objects/contents.
-- Only works on Label derived panels such as DLabel by default, and on any
-- panel that manually implemented **Panel:GetContentSize** method.
-- 
-- **Warning**: _You must call this function **AFTER** setting text/font or
-- adjusting child panels._
-- @function [parent=#Panel] SizeToContentsX
-- @param  self
-- @param  #number addVal The number of extra pixels to add to the width. _(Default: 0)_
-- Can be a negative number, to reduce the width.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resizes the panel object's height to accommodate all child objects/contents.
-- Only works on Label derived panels such as DLabel by default, and on any
-- panel that manually implemented **Panel:GetContentSize** method.
-- 
-- **Note**: _You must call this function **AFTER** setting text/font or adjusting
-- child panels._
-- @function [parent=#Panel] SizeToContentsY
-- @param  self
-- @param  #number addVal The number of extra pixels to add to the height. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Slides the panel in from above.
-- @function [parent=#Panel] SlideDown
-- @param  self
-- @param  #number Length Time to complete the animation.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Slides the panel out to the top.
-- @function [parent=#Panel] SlideUp
-- @param  self
-- @param  #number Length Time to complete the animation.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Begins a box selection, enables mouse capture for the panel object, and sets
-- the start point of the selection box to the mouse cursor's position,
-- relative to this object. For this to work, either the object or its parent
-- must be enabled as a selection canvas. This is set using **Panel:SetSelectionCanvas**.
-- @function [parent=#Panel] StartBoxSelection
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Stops all panel animations by clearing its animation list. This also clears
-- all delayed animations.
-- @function [parent=#Panel] Stop
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resizes the panel object's height so that its bottom is aligned with the top
-- of the passed panel. An offset greater than zero will reduce the panel's
-- height to leave a gap between it and the passed panel.
-- @function [parent=#Panel] StretchBottomTo
-- @param  self
-- @param  #Panel tgtPanel The panel to align the bottom of this one with.
-- @param  #number offset The gap to leave between this and the passed panel. _(Default: 0)_
-- Negative values will cause the panel's height to increase, forming an overlap.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Resizes the panel object's width so that its right edge is aligned with the
-- left of the passed panel. An offset greater than zero will reduce the panel's
-- width to leave a gap between it and the passed panel.
-- @function [parent=#Panel] StretchRightTo
-- @param  self
-- @param  #Panel tgtPanel The panel to align the right edge of this one with.
-- @param  #number offset The gap to leave between this and the passed panel. _(Default: 0)_
-- Negative values will cause the panel's width to increase, forming an overlap.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the dimensions of the panel to fill its parent. It will only stretch in
-- directions that aren't nil.
-- @function [parent=#Panel] StretchToParent
-- @param  self
-- @param  #number offsetLeft The left offset to the parent.
-- @param  #number offsetTop The top offset to the parent.
-- @param  #number offsetRight The right offset to the parent.
-- @param  #number offsetBottom The bottom offset to the parent.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Toggles the selected state of a selectable panel object. This functionality
-- is set with **Panel:SetSelectable** and checked with **Panel:IsSelectable**. To
-- check whether the object is selected or not, **Panel:IsSelected** is used.
-- @function [parent=#Panel] ToggleSelection
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Toggles the visibility of a panel and all its children.
-- @function [parent=#Panel] ToggleVisible
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Restores the last saved state (caret position and the text inside) of a
-- TextEntry. Should act identically to pressing CTRL+Z in a TextEntry. See
-- also **Panel:SaveUndoState**.
-- @function [parent=#Panel] Undo
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Recursively deselects this panel object and all of its children. This will
-- cascade to all child objects at every level below the parent.
-- @function [parent=#Panel] UnselectAll
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Forcibly updates the panels' HTML Material, similar to when Paint is called
-- on it. This is only useful if the panel is not normally visible, i.e the
-- panel exists purely for its HTML Material.
-- 
-- **Note**: _Only works on with panels that have a HTML Material. See
-- **Panel:GetHTMLMaterial** for more details._
-- 
-- **Note**: _A good place to call this is in the **GM:PreRender** hook._
-- @function [parent=#Panel] UpdateHTMLTexture
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Path object for a NextBot NPC. Returned by **Path**.
-- @type PathFollower

-------------------------------------------------------------------------------
-- _Server_
-- 
-- If you created your path with type "Chase" this functions should be used in
-- place of **PathFollower:Update** to cause the bot to chase the specified entity.
-- @function [parent=#PathFollower] Chase
-- @param  self
-- @param  #NextBot bot The bot to update along the path.
-- @param  #Entity ent The entity we want to chase.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Compute shortest path from bot to 'goal' via A* algorithm.
-- @function [parent=#PathFollower] Compute
-- @param  self
-- @param  #NextBot from The nextbot we're generating for.
-- @param  #Vector to To point.
-- @param  #function generator A funtion that allows you to alter the path generation. _(Default: nil)_
-- @return #boolean If returns true, path was found to the goal position.
-- If returns false, path may either be invalid (use IsValid() to check), or valid but doesn't reach all the way to the goal.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Draws the path. This is meant for debugging and uses debug overlay.
-- @function [parent=#PathFollower] Draw
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the first segment of the path.
-- @function [parent=#PathFollower] FirstSegment
-- @param  self
-- @return #table A table with **PathSegment structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the age since the path was built.
-- @function [parent=#PathFollower] GetAge
-- @param  self
-- @return #number Path age.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns all of the segments of the given path.
-- @function [parent=#PathFollower] GetAllSegments
-- @param  self
-- @return #table A table of tables with **PathSegment structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- The closest position along the path to a position.
-- @function [parent=#PathFollower] GetClosestPosition
-- @param  self
-- @param  #Vector position The point we're querying for.
-- @return #Vector The closest position on the path.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current goal data. Can return nil if the current goal is invalid,
-- for example immediately after **PathFollower:Update**.
-- @function [parent=#PathFollower] GetCurrentGoal
-- @param  self
-- @return #table A table with **PathSegment structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the cursor data.
-- @function [parent=#PathFollower] GetCursorData
-- @param  self
-- @return #table A table with 3 keys:
-- 
-- * _#number curvature_
-- * _#Vector forward_
-- * _#Vector pos_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current progress along the path.
-- @function [parent=#PathFollower] GetCursorPosition
-- @param  self
-- @return #number The current progress.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the path end position.
-- @function [parent=#PathFollower] GetEnd
-- @param  self
-- @return #Vector The end position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#PathFollower] GetHindrance
-- @param  self
-- @return #Entity

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the total length of the path.
-- @function [parent=#PathFollower] GetLength
-- @param  self
-- @return #number The length of the path.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the vector position of distance along path.
-- @function [parent=#PathFollower] GetPositionOnPath
-- @param  self
-- @param  #number distance The distance along the path to query.
-- @return #Vector The position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the path start position.
-- @function [parent=#PathFollower] GetStart
-- @param  self
-- @return #Vector The start position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Invalidates the current path
-- @function [parent=#PathFollower] Invalidate
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if the path is valid.
-- @function [parent=#PathFollower] IsValid
-- @param  self
-- @return #boolean Wether the path is valid or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the last segment of the path.
-- @function [parent=#PathFollower] LastSegment
-- @param  self
-- @return #table A table with **PathSegment structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Moves the cursor by give distance. For a function that sets the distance,
-- see **PathFollower:MoveCursorTo**.
-- @function [parent=#PathFollower] MoveCursor
-- @param  self
-- @param  #number distance The distance to move the cursor. (in relative world units)

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the cursor position to given distance. For relative distance, see **PathFollower:MoveCursor**.
-- @function [parent=#PathFollower] MoveCursorTo
-- @param  self
-- @param  #number distance The distance to move the cursor. (in world units)

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Moves the cursor of the path to the closest position compared to given vector.
-- @function [parent=#PathFollower] MoveCursorToClosestPosition
-- @param  self
-- @param  #Vector pos
-- @param  #number type Seek type. _(Default: 0)_
-- 
-- * 0 : SEEK\_ENTIRE\_PATH - Search the entire path length
-- * 1 : SEEK_AHEAD - Search from current cursor position forward toward end of path
-- * 2 : SEEK_BEHIND - Search from current cursor position backward toward path start
-- @param  #number alongLimit _(Default: 0)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Moves the cursor to the end of the path.
-- @function [parent=#PathFollower] MoveCursorToEnd
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Moves the cursor to the end of the path.
-- @function [parent=#PathFollower] MoveCursorToStart
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Resets the age which is retrieved by **PathFollower:GetAge** to 0.
-- @function [parent=#PathFollower] ResetAge
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- How close we can get to the goal to call it done.
-- @function [parent=#PathFollower] SetGoalTolerance
-- @param  self
-- @param  #number distance The distance we're setting it to.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets minimum range movement goal must be along path.
-- @function [parent=#PathFollower] SetMinLookAheadDistance
-- @param  self
-- @param  #number mindist The minimum look ahead distance.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Move the bot along the path.
-- @function [parent=#PathFollower] Update
-- @param  self
-- @param  #NextBot bot The bot to update along the path.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- A PhysCollide holds collision data from VPhysics. These objects can be used
-- to run (currently quite limited) collision tests, but do not represent
-- actual physics objects. Created by **CreatePhysCollideBox** or **CreatePhysCollidesFromModel**.
-- @type PhysCollide

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Destroys the PhysCollide object.
-- @function [parent=#PhysCollide] Destroy
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks whether this PhysCollide object is valid or not. You should just use
-- **IsValid** instead.
-- @function [parent=#PhysCollide] IsValid
-- @param  self
-- @return #boolean Is valid or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Performs a trace against this PhysCollide with the given parameters. This
-- can be used for both line traces and box traces.
-- @function [parent=#PhysCollide] TraceBox
-- @param  self
-- @param  #Vector origin The origin for the PhysCollide during the trace.
-- @param  #Angle angles The angles for the PhysCollide during the trace.
-- @param  #Vector rayStart The start position of the trace.
-- @param  #Vector rayEnd The end position of the trace.
-- @param  #Vector rayMins The mins of the trace's bounds.
-- @param  #Vector rayMaxs The maxs of the trace's bounds.
-- @return #Vector, #Vector, #Vector Hit position, position normal, and fraction of the trace.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This is the object returned by **Entity:GetPhysicsObject** and
-- **Entity:GetPhysicsObjectNum**. It represents a physics object.
-- @type PhysObj

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds the specified velocity to the current.
-- @function [parent=#PhysObj] AddAngleVelocity
-- @param  self
-- @param  #Vector angularVelocity Additional velocity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds one or more bit flags.
-- @function [parent=#PhysObj] AddGameFlag
-- @param  self
-- @param  #number flags Bitflag, see **FVPHYSICS\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds the specified velocity to the current.
-- @function [parent=#PhysObj] AddVelocity
-- @param  self
-- @param  #Vector velocity Additional velocity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Rotates the object so that it's angles are aligned to the ones inputted.
-- @function [parent=#PhysObj] AlignAngles
-- @param  self
-- @param  #Angle from
-- @param  #Angle to
-- @return #Angle

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Applies the specified force to the physics object. (in Newtons)
-- 
-- **Note**: _This will not work on players, use **Entity:SetVelocity** instead._
-- @function [parent=#PhysObj] ApplyForceCenter
-- @param  self
-- @param  #Vector force The force to be applied.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Applies the specified force on the physics object at the specified position.
-- @function [parent=#PhysObj] ApplyForceOffset
-- @param  self
-- @param  #Vector force The force to be applied.
-- @param  #Vector position The position in world coordinates where the force is applied to the physics object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Applies specified torque to the physics object.
-- @function [parent=#PhysObj] ApplyTorqueCenter
-- @param  self
-- @param  #Vector torque The torque to be applied in kg * degrees / s.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Calculates the force and torque on the center of mass for an offset force
-- impulse. The outputs can be directly passed to **PhysObj:ApplyForceCenter** and
-- **PhysObj:ApplyTorqueCenter**, respectively.
-- @function [parent=#PhysObj] CalculateForceOffset
-- @param  self
-- @param  #Vector force The initial force.
-- @param  #Vector pos The location of the force in world coordinates.
-- @return #Vector, #Vector The calculated force and torque on the physics object's center of mass.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Calculates the linear and angular velocities on the center of mass for an
-- offset force impulse. The outputs can be directly passed to
-- **PhysObj:AddVelocity** and **PhysObj:AddAngleVelocity**, respectively.
-- @function [parent=#PhysObj] CalculateVelocityOffset
-- @param  self
-- @param  #Vector force The initial force.
-- @param  #Vector pos The location of the force in world coordinates.
-- @return #Vector, #Vector The calculated linear and angular velocities from the force on the physics object's center of mass.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes one of more specified flags.
-- @function [parent=#PhysObj] ClearGameFlag
-- @param  self
-- @param  #number flags Bitflag, see **FVPHYSICS\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Allows you to move a PhysObj to a point and angle in 3D space.
-- @function [parent=#PhysObj] ComputeShadowControl
-- @param  self
-- @param  #table shadowparams The parameters for the shadow.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether the physics object should collide with anything or not,
-- including world.
-- 
-- **Warning**: _This function currently has major problems with player
-- collisions, and as such should be avoided at all costs. A better alternative
-- to this function would be using **Entity:SetCollisionGroup**(COLLISION\_GROUP\_WORLD)._
-- @function [parent=#PhysObj] EnableCollisions
-- @param  self
-- @param  #boolean enable True to enable, false to disable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whenever the physics object should be affected by drag.
-- @function [parent=#PhysObj] EnableDrag
-- @param  self
-- @param  #boolean enable True to enable, false to disable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether the PhysObject should be affected by gravity.
-- @function [parent=#PhysObj] EnableGravity
-- @param  self
-- @param  #boolean enable True to enable, false to disable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether the physobject should be able to move or not. This is the exact
-- method the Physics Gun uses to freeze props. If a motion-disabled physics
-- object is grabbed with the physics gun, the object will be able to move
-- again. To disallow this, use **GM:PhysgunPickup**.
-- @function [parent=#PhysObj] EnableMotion
-- @param  self
-- @param  #boolean enable True to enable, false to disable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the mins and max of the physics object.
-- @function [parent=#PhysObj] GetAABB
-- @param  self
-- @return #Vector, #Vector The mins and max.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the angles of the physics object.
-- @function [parent=#PhysObj] GetAngles
-- @param  self
-- @return #Angle The angles of the physics object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the angular velocity of the object in degrees per second.
-- @function [parent=#PhysObj] GetAngleVelocity
-- @param  self
-- @return #Vector The angular velocity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the contents flag of the PhysObj.
-- @function [parent=#PhysObj] GetContents
-- @param  self
-- @return #number The **CONTENTS\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the linear and angular damping of the physics object.
-- @function [parent=#PhysObj] GetDamping
-- @param  self
-- @return #number, #number The linear and angular damping.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the kinetic energy of the physobject.
-- @function [parent=#PhysObj] GetEnergy
-- @param  self
-- @return #number The kinetic energy.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the parent entity of the physics object.
-- @function [parent=#PhysObj] GetEntity
-- @param  self
-- @return #Entity Parent entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the directional inertia of the physics object.
-- @function [parent=#PhysObj] GetInertia
-- @param  self
-- @return #Vector Directional inertia.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns 1 divided by the inertia.
-- @function [parent=#PhysObj] GetInvInertia
-- @param  self
-- @return #number The inverted inertia.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns 1 divided by the physics object's mass.
-- @function [parent=#PhysObj] GetInvMass
-- @param  self
-- @return #number The inverted mass.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the mass of the physics object.
-- @function [parent=#PhysObj] GetMass
-- @param  self
-- @return #number The mass in kilograms.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the center of mass of the physics object as a local vector.
-- @function [parent=#PhysObj] GetMassCenter
-- @param  self
-- @return #Vector The center of mass of the physics object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the physical material of the physics object.
-- @function [parent=#PhysObj] GetMaterial
-- @param  self
-- @return #string The physical material.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the physics mesh of the object which is used for physobj-on-physobj collision.
-- @function [parent=#PhysObj] GetMesh
-- @param  self
-- @return #table Table of MeshVertex structures where each three vertices represent a triangle.
-- Returns nil if the physics object is a sphere.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns all convex physics meshes of the object. See
-- **Entity.PhysicsInitMultiConvex** for more information.
-- @function [parent=#PhysObj] GetMeshConvexes
-- @param  self
-- @return #table Table of **MeshVertex structures** where each **MeshVertex structure** is an independent convex mesh and each three vertices represent a triangle.
-- Returns nil if the physics object is a sphere.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the name of the physics object.
-- @function [parent=#PhysObj] GetName
-- @param  self
-- @return #string The name of the physics object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position of the physics object.
-- @function [parent=#PhysObj] GetPos
-- @param  self
-- @return #Vector The position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position and angle of the physics object as a 3x4 matrix
-- (VMatrix is 4x4 so the fourth row goes unused). The first three columns
-- store the angle as a rotation matrix, and the fourth column stores the
-- position vector.
-- @function [parent=#PhysObj] GetPositionMatrix
-- @param  self
-- @return #VMatrix The position and angle matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the rotation damping of the physics object.
-- @function [parent=#PhysObj] GetRotDamping
-- @param  self
-- @return #number The rotation damping.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the angles of the PhysObj shadow. See **PhysObj:UpdateShadow**.
-- @function [parent=#PhysObj] GetShadowAngles
-- @param  self
-- @return #Angle The angles of the PhysObj shadow.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position of the PhysObj shadow. See **PhysObj:UpdateShadow**.
-- @function [parent=#PhysObj] GetShadowPos
-- @param  self
-- @return #Vector The position of the PhysObj shadow.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the speed damping of the physics object.
-- @function [parent=#PhysObj] GetSpeedDamping
-- @param  self
-- @return #number Speed damping.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the stress of the entity.
-- @function [parent=#PhysObj] GetStress
-- @param  self
-- @return #number Exerted stress.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the surface area of the physics object in source-units.
-- @function [parent=#PhysObj] GetSurfaceArea
-- @param  self
-- @return #number The surface area.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the absolute directional velocity of the physobject.
-- @function [parent=#PhysObj] GetVelocity
-- @param  self
-- @return #Vector velocity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the world velocity of a point in world coordinates about the object.
-- @function [parent=#PhysObj] GetVelocityAtPoint
-- @param  self
-- @param  #Vector point
-- @return #Vector

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the volume in source units.
-- @function [parent=#PhysObj] GetVolume
-- @param  self
-- @return #number Volume.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the specified flag(s) is/are set.
-- @function [parent=#PhysObj] HasGameFlag
-- @param  self
-- @param  #number flags Bitflag, see **FVPHYSICS\_ Enums**.
-- @return #boolean If flag was set or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the physics object is "sleeping". See **PhysObj:Sleep** for more information.
-- @function [parent=#PhysObj] IsAsleep
-- @param  self
-- @return #boolean Whether the physics object is sleeping.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the entity is able to collide or not.
-- @function [parent=#PhysObj] IsCollisionEnabled
-- @param  self
-- @return #boolean Is collision enabled.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the entity is affected by drag.
-- @function [parent=#PhysObj] IsDragEnabled
-- @param  self
-- @return #boolean Is drag enabled.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the entity is affected by gravity.
-- @function [parent=#PhysObj] IsGravityEnabled
-- @param  self
-- @return #boolean Is Gravitated.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the physics object can move itself. (by velocity, acceleration)
-- @function [parent=#PhysObj] IsMotionEnabled
-- @param  self
-- @return #boolean Is motion enabled.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the entity is able to move.
-- @function [parent=#PhysObj] IsMoveable
-- @param  self
-- @return #boolean Is movable.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the physics object is penetrating another physics object.
-- @function [parent=#PhysObj] IsPenetrating
-- @param  self
-- @return #boolean Is penetrating.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the physics object is valid/not NULL.
-- @function [parent=#PhysObj] IsValid
-- @param  self
-- @return #boolean Is valid.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Mapping a vector in local frame of the physics object to world frame.
-- 
-- **Note**: _This function does translation and rotation, with translation done first._
-- @function [parent=#PhysObj] LocalToWorld
-- @param  self
-- @param  #Vector LocalVec A vector in the physics object's local frame.
-- @return #Vector The corresponding vector in world frame.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Rotate a vector from the local frame of the physics object to world frame.
-- 
-- **Note**: _This function only rotates the vector, without any translation operation._
-- @function [parent=#PhysObj] LocalToWorldVector
-- @param  self
-- @param  #Vector LocalVec A vector in the physics object's local frame.
-- @return #Vector The corresponding vector in world frame.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Prints debug info about the state of the physics object to the console.
-- @function [parent=#PhysObj] OutputDebugInfo
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Call this when the collision filter conditions change due to this object's
-- state. (e.g. changing solid type or collision group)
-- @function [parent=#PhysObj] RecheckCollisionFilter
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- A convinience function for **Angle:RotateAroundAxis**.
-- @function [parent=#PhysObj] RotateAroundAxis
-- @param  self
-- @param  #Vector dir Direction, around which we will rotate.
-- @param  #number ang Amount of rotation, in degrees.
-- @return #Angle The resulting angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the amount of drag to apply to a physics object when attempting to rotate.
-- @function [parent=#PhysObj] SetAngleDragCoefficient
-- @param  self
-- @param  #number coefficient Drag coefficient. The bigger this value is, the slower the angles will change.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the angles of the physobject.
-- @function [parent=#PhysObj] SetAngles
-- @param  self
-- @param  #Angle angles The new angles of the physobject.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the buoyancy ratio of the physics object. (how well it floats in water)
-- @function [parent=#PhysObj] SetBuoyancyRatio
-- @param  self
-- @param  #number buoyancy Buoyancy ratio, where 0 is not buoyant at all (like a rock), and 1 is very buoyant (like wood).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the contents flag of the PhysObj.
-- @function [parent=#PhysObj] SetContents
-- @param  self
-- @param  #number contents The **CONTENTS\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the linear and angular damping of the physics object.
-- @function [parent=#PhysObj] SetDamping
-- @param  self
-- @param  #number linearDamping Linear damping.
-- @param  #number angularDamping Angular damping.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Modifies how much drag (air resistance) affects the object.
-- @function [parent=#PhysObj] SetDragCoefficient
-- @param  self
-- @param  #number drag The drag coefficient. It can be positive or negative.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the directional inertia.
-- @function [parent=#PhysObj] SetInertia
-- @param  self
-- @param  #Vector directionalInertia The directional inertia of the object.
-- A value of Vector(0,0,0) makes the physobject go invalid.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the mass of the physics object.
-- @function [parent=#PhysObj] SetMass
-- @param  self
-- @param  #number mass The mass in kilograms.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the material of the physobject.
-- 
-- **Note**: _Impact sounds will only change if this is called on client._
-- @function [parent=#PhysObj] SetMaterial
-- @param  self
-- @param  #string materialName The name of the phys material to use.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the position of the physobject.
-- @function [parent=#PhysObj] SetPos
-- @param  self
-- @param  #Vector position The new position of the physobject.
-- @param  #boolean teleport _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the velocity of the physics object for the next iteration.
-- @function [parent=#PhysObj] SetVelocity
-- @param  self
-- @param  #Vector velocity The new velocity of the phyiscs object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the velocity of the physics object.
-- @function [parent=#PhysObj] SetVelocityInstantaneous
-- @param  self
-- @param  #Vector velocity The new velocity of the physics object.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Makes the physics object "sleep". The physics object will no longer be
-- moving unless it is "woken up" by either a collision with another moving
-- object, or by **PhysObj:Wake**. This is an optimization feature of the
-- physics engine.
-- @function [parent=#PhysObj] Sleep
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Unlike **PhysObj:SetPos** and **PhysObj:SetAngles**, this allows the movement of a
-- physobj while leaving physics interactions intact. This is used internally
-- by the motion controller of the Gravity Gun, the +use pickup and the Physics
-- Gun, and entities such as the crane.
-- 
-- **Note**: _This is the ideal function to move a physics shadow created with
-- **Entity:PhysicsInitShadow** or **Entity:MakePhysicsObjectAShadow**._
-- @function [parent=#PhysObj] UpdateShadow
-- @param  self
-- @param  #Vector targetPosition The position we should move to.
-- @param  #Angle targetAngles The angle we should rotate towards.
-- @param  #number frameTime The frame time to use for this movement, can be generally filled with **FrameTime** or **ENTITY:PhysicsSimulate** with the deltaTime.
-- Can be set to 0 when you need to update the physics object just once.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Wakes the physics object. See **PhysObj:Sleep** for more information.
-- @function [parent=#PhysObj] Wake
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Converts a vector to a relative to the physics object coordinate system.
-- @function [parent=#PhysObj] WorldToLocal
-- @param  self
-- @param  #Vector vec The vector in world space coordinates.
-- @return #Vector The vector local to **PhysObj:GetPos**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Rotate a vector from the world frame to the local frame of the physics object.
-- 
-- **Note**: _This function only rotates the vector, without any translation operation._
-- @function [parent=#PhysObj] WorldToLocalVector
-- @param  self
-- @param  #Vector WorldVec A vector in the world frame.
-- @return #Vector The corresponding vector relative to the PhysObj.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- @type Player
-- @extends Entity

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's AccountID aka 32bit SteamID. For bots and in
-- singleplayer, this will return no value.
-- @function [parent=#Player] AccountID
-- @param  self
-- @return #number Player's 32bit SteamID aka AccountID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds an entity to the players clean up list.
-- 
-- **Note**: _This function is only available in Sandbox and its derivatives._
-- @function [parent=#Player] AddCleanup
-- @param  self
-- @param  #string type Cleanup type.
-- @param  #Entity ent Entity to add.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds an entity to the total count of entities of same class.
-- 
-- **Note**: _This function is only available in Sandbox and its derivatives._
-- @function [parent=#Player] AddCount
-- @param  self
-- @param  #string str Entity type.
-- @param  #Entity ent Entity to add.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Add a certain amount to the player's death count.
-- @function [parent=#Player] AddDeaths
-- @param  self
-- @param  #number count number of deaths to add.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Add a certain amount to the player's frag count (or kills count).
-- @function [parent=#Player] AddFrags
-- @param  self
-- @param  #number count Number of frags to add.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a entity to the players list of frozen objects.
-- @function [parent=#Player] AddFrozenPhysicsObject
-- @param  self
-- @param  #Entity ent Entity to add.
-- @param  #PhysObj physobj Physics object belonging to ent.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets up the voting system for the player. This is a really barebone system.
-- By calling this a vote gets started, when the player presses 0-9 the
-- callback function gets called along with the key the player pressed. Use the
-- draw callback to draw the vote panel.
-- @function [parent=#Player] AddPlayerOption
-- @param  self
-- @param  #string name Name of the vote.
-- @param  #number timeout Time until the vote expires.
-- @param  #function vote_callback The function to be run when the player presses 0-9 while a vote is active.
-- @param  #function draw_callback Used to draw the vote panel.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Plays a sequence directly from a sequence number, similar to
-- **Player:AnimRestartGesture**. This function has the advantage to play sequences
-- that haven't been bound to an existing **ACT\_ Enums**.
-- @function [parent=#Player] AddVCDSequenceToGestureSlot
-- @param  self
-- @param  #number slot Gesture slot using **GESTURE\_SLOT\_ Enums**.
-- @param  #number sequenceId The sequence ID to play, can be retrieved with **Entity:LookupSequence**.
-- @param  #number cycle The cycle to start the animation at, ranges from 0 to 1.
-- @param  #boolean autokill If the animation should not loop. _(Default: false)_
-- true = stops the animation, false = the animation keeps playing.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the player is alive.
-- @function [parent=#Player] Alive
-- @param  self
-- @return #boolean Whether the player is alive.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets if the player can toggle his flashlight. Function exists on both the
-- server and client but has no effect when ran on the client.
-- @function [parent=#Player] AllowFlashlight
-- @param  self
-- @param  #boolean canFlashlight True allows flashlight toggling.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Lets the player spray his decal without delay.
-- @function [parent=#Player] AllowImmediateDecalPainting
-- @param  self
-- @param  #boolean allow Allow or disallow.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Resets player gesture in selected slot.
-- @function [parent=#Player] AnimResetGestureSlot
-- @param  self
-- @param  #number slot Slot to reset. See the **GESTURE\_SLOT\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Restart a gesture on a player, within a gesture slot.
-- 
-- **Warning**: _This is not automatically networked. This function has to be
-- called on the client to be seen by said client._
-- @function [parent=#Player] AnimRestartGesture
-- @param  self
-- @param  #number slot Gesture slot using **GESTURE\_SLOT\_ Enums**.
-- @param  #number activity The activity (see **ACT\_ Enums**) or sequence that should be played.
-- @param  #boolean autokill Whether the animation should be automatically stopped. _(Default: false)_
-- true = stops the animation, false = the animation keeps playing/looping.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Restarts the main animation on the player, has the same effect as calling **Entity:SetCycle**(0).
-- @function [parent=#Player] AnimRestartMainSequence
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the sequence of the animation playing in the given gesture slot.
-- @function [parent=#Player] AnimSetGestureSequence
-- @param  self
-- @param  #number slot The gesture slot. See **GESTURE\_SLOT\_ Enums**.
-- @param  #number sequenceID Sequence ID to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the weight of the animation playing in the given gesture slot.
-- @function [parent=#Player] AnimSetGestureWeight
-- @param  self
-- @param  #number slot The gesture slot. See **GESTURE\_SLOT\_ Enums**.
-- @param  #number weight The weight this slot should be set to. Value must be ranging from 0 to 1.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's armor.
-- @function [parent=#Player] Armor
-- @param  self
-- @return #number The player's armor.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Bans the player from the server for a certain amount of minutes.
-- @function [parent=#Player] Ban
-- @param  self
-- @param  #number minutes Duration of the ban in minutes. (0 is permanent)
-- @param  #boolean kick Whether to kick the player after banning then or not. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the player's flashlight hasn't been disabled by **Player:AllowFlashlight**.
-- @function [parent=#Player] CanUseFlashlight
-- @param  self
-- @return #boolean Can use flashlight.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Prints a string to the chatbox of the client.
-- 
-- **Warning**: _Just like the usermessage library, this function is affected
-- by the 255 byte limit!_
-- @function [parent=#Player] ChatPrint
-- @param  self
-- @param  #string message String to be printed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the limit is hit or not. If it is, it will throw a notification
-- saying so.
-- @function [parent=#Player] CheckLimit
-- @param  self
-- @param  #string limitType Limit type.
-- In unmodified Sandbox possible values are:
-- 
-- * "props"
-- * "ragdolls"
-- * "vehicles"
-- * "effects"
-- * "balloons"
-- * "cameras"
-- * "npcs"
-- * "sents"
-- * "dynamite"
-- * "lamps"
-- * "lights"
-- * "wheels"
-- * "thrusters"
-- * "hoverballs"
-- * "buttons"
-- * "emitters"
-- @return #boolean Returns true if limit is not hit, false if it is hit.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Runs the concommand on the player. This does not work on bots. If you wish
-- to directly modify the movement input of bots, use **GM:StartCommand** instead.
-- 
-- **Note**: _Some commands/convars are blocked from being ran/changed using
-- this function, usually to prevent harm/annoyance to clients. For a list of
-- blocked commands, see Blocked ConCommands._
-- @function [parent=#Player] ConCommand
-- @param  self
-- @param  #string command Command to run.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Creates the player's ragdoll entity. This is normally used when a player
-- dies, to create their death ragdoll. The ragdoll will be created with the
-- player's properties such as Position, Angles, PlayerColor, Velocity and Model.
-- You can retrieve the entity this creates with **Player:GetRagdollEntity**.
-- @function [parent=#Player] CreateRagdoll
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Disables a players crosshair.
-- @function [parent=#Player] CrosshairDisable
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Enables crosshair of player.
-- @function [parent=#Player] CrosshairEnable
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the player is crouching or not.
-- @function [parent=#Player] Crouching
-- @param  self
-- @return #boolean Whether the player is crouching.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's death count.
-- @function [parent=#Player] Deaths
-- @param  self
-- @return #number The number of deaths the player has had.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Prints the players' name and position to the console.
-- @function [parent=#Player] DebugInfo
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Detonates all tripmines belonging to the player.
-- @function [parent=#Player] DetonateTripmines
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sends a third person animation event to the player. Calls
-- **GM:DoAnimationEvent** with PLAYERANIMEVENT\_CUSTOM\_GESTURE as the event, data
-- as the given data.
-- @function [parent=#Player] DoAnimationEvent
-- @param  self
-- @param  #number data The data to send.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Starts the player's attack animation. The attack animation is determined by
-- the weapon's HoldType. Similar to other animation event functions, calls
-- **GM:DoAnimationEvent** with PLAYERANIMEVENT\_ATTACK\_PRIMARY as the event and no
-- extra data.
-- @function [parent=#Player] DoAttackEvent
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sends a specified third person animation event to the player. Calls
-- **GM:DoAnimationEvent** with specified arguments.
-- @function [parent=#Player] DoCustomAnimEvent
-- @param  self
-- @param  #number event The event to send. See **PLAYERANIMEVENT\_ Enums**.
-- @param  #number data The data to send alongside the event.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sends a third person reload animation event to the player. Similar to other
-- animation event functions, calls **GM:DoAnimationEvent** with
-- PLAYERANIMEVENT_RELOAD as the event and no extra data.
-- @function [parent=#Player] DoReloadEvent
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sends a third person secondary fire animation event to the player. Similar
-- to other animation event functions, calls **GM:DoAnimationEvent** with
-- PLAYERANIMEVENT\_ATTACK\_SECONDARY as the event and no extra data.
-- @function [parent=#Player] DoSecondaryAttack
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Show/Hide the player's weapon's viewmodel.
-- @function [parent=#Player] DrawViewModel
-- @param  self
-- @param  #boolean draw Should draw.
-- @param  #number vm Which view model to show/hide, 0-2. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Show/Hide the player's weapon's worldmodel.
-- @function [parent=#Player] DrawWorldModel
-- @param  self
-- @param  #boolean draw Should draw.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Drops the players' weapon of a specific class.
-- @function [parent=#Player] DropNamedWeapon
-- @param  self
-- @param  #string class The class to drop.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Drops any object the player is currently holding with either gravitygun or
-- +Use (E key).
-- @function [parent=#Player] DropObject
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Forces the player to drop the specified weapon.
-- @function [parent=#Player] DropWeapon
-- @param  self
-- @param  #Weapon weapon Weapon to be dropped.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Enters the player into specified vehicle.
-- @function [parent=#Player] EnterVehicle
-- @param  self
-- @param  #Vehicle vehicle Vehicle the player will enter.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Equips the player with the HEV suit. Allows the player to zoom, walk slowly,
-- sprint, pickup armor batteries, use the health and armor stations and also
-- shows the HUD. The player also emits a flatline sound on death, which can be
-- overridden with **GM:PlayerDeathSound**. The player is automatically
-- equipped with the suit on spawn, if you wish to stop that, use **Player:RemoveSuit**.
-- @function [parent=#Player] EquipSuit
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes the player exit the vehicle if they're in one.
-- @function [parent=#Player] ExitVehicle
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Enables/Disables the player's flashlight.
-- @function [parent=#Player] Flashlight
-- @param  self
-- @param  #boolean isOn Turns the flashlight on/off.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the player's flashlight is on.
-- @function [parent=#Player] FlashlightIsOn
-- @param  self
-- @return #boolean Whether the player's flashlight is on.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the amount of kills a player has.
-- @function [parent=#Player] Frags
-- @param  self
-- @return #number Number of kills the player has.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Freeze the player. Frozen players cannot move, look around, or attack. Key
-- bindings are still called. Similar to **Player:Lock** but the player can still
-- take damage. Adds or removes the FL_FROZEN flag from the player.
-- 
-- **Note**: _Frozen bots will still be able to turn with bot_mimic 1._
-- @function [parent=#Player] Freeze
-- @param  self
-- @param  #boolean frozen Whether the player should be frozen. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's active weapon.
-- @function [parent=#Player] GetActiveWeapon
-- @param  self
-- @return #Weapon The weapon the player is currently has equipped.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the direction that the player is aiming.
-- @function [parent=#Player] GetAimVector
-- @param  self
-- @return #Vector The direction vector of players aim.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the players' model is allowed to rotate around the pitch and
-- roll axis.
-- @function [parent=#Player] GetAllowFullRotation
-- @param  self
-- @return #boolean Allowed to rotate.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the player is allowed to use his weapons in a vehicle or not.
-- @function [parent=#Player] GetAllowWeaponsInVehicle
-- @param  self
-- @return #boolean Whether the player is allowed to use his weapons in a vehicle or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the amount of ammo the player has.
-- @function [parent=#Player] GetAmmoCount
-- @param  self
-- @param  #any ammotype The ammunition type. Can be either number ammo ID or string ammo name.
-- @return #number The amount of ammo player has in reserve.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets if the player will be pushed out of nocollided players.
-- @function [parent=#Player] GetAvoidPlayers
-- @param  self
-- @return #boolean Gets pushed by nocollided.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the player is able to walk using the (default) alt key.
-- @function [parent=#Player] GetCanWalk
-- @param  self
-- @return #boolean Able to walk.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Determines whenever the player is allowed to use the zoom functionality.
-- @function [parent=#Player] GetCanZoom
-- @param  self
-- @return #boolean Can zoom.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's class id.
-- @function [parent=#Player] GetClassID
-- @param  self
-- @return #number The player's class id.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets total count of entities of same class.
-- 
-- **Note**: _This function is only available in Sandbox and its derivatives._
-- @function [parent=#Player] GetCount
-- @param  self
-- @param  #string type Entity type to get count of.
-- @param  #number minus If specified, it will reduce the counter by this value. _(Default: 0)_
-- Works only serverside.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the crouched walk speed multiplier. See also **Player:GetWalkSpeed**
-- and **Player:SetCrouchedWalkSpeed**.
-- @function [parent=#Player] GetCrouchedWalkSpeed
-- @param  self
-- @return #number The crouched walk speed multiplier.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the last command which was sent by the specified player. Can only be
-- used in a Predicted Hook.
-- 
-- **Note**: _When called clientside in singleplayer during **WEAPON:Think**, it
-- will return nothing as the hook is not technically predicted in that instance._
-- @function [parent=#Player] GetCurrentCommand
-- @param  self
-- @return #CUserCmd Last user commands.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the actual view offset which equals the difference between the players
-- actual position and their view when standing. Do not confuse with
-- **Player:GetViewOffset** and **Player:GetViewOffsetDucked**.
-- @function [parent=#Player] GetCurrentViewOffset
-- @param  self
-- @return #Vector The actual view offset.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the entity the player is currently driving.
-- @function [parent=#Player] GetDrivingEntity
-- @param  self
-- @return #Entity Driven entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns driving mode of the player.
-- @function [parent=#Player] GetDrivingMode
-- @param  self
-- @return #number The drive mode ID or 0 if player doesn't use the drive system.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a player's duck speed. (in seconds)
-- @function [parent=#Player] GetDuckSpeed
-- @param  self
-- @return #number Duck speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table with information of what the player is looking at. The results
-- of this function are cached every frame. See also **Player:GetEyeTraceNoCursor**.
-- @function [parent=#Player] GetEyeTrace
-- @param  self
-- @return #table Trace information, see **TraceResult structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the trace according to the players view direction, ignoring their
-- mouse (Holding C and moving the mouse in Sandbox). The results of this
-- function are cached every frame. See also **Player:GetEyeTrace**.
-- @function [parent=#Player] GetEyeTraceNoCursor
-- @param  self
-- @return #table Trace result. See **TraceResult structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the FOV of the player.
-- @function [parent=#Player] GetFOV
-- @param  self
-- @return #number FOV

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the steam "relationship" towards the player.
-- @function [parent=#Player] GetFriendStatus
-- @param  self
-- @return #string Should return one of four different things depending on their status on your friends list: "friend", "blocked", "none" or "requested".

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the hands entity of a player.
-- @function [parent=#Player] GetHands
-- @param  self
-- @return #Entity The hands entity if players has one.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the widget the player is hovering with his mouse.
-- @function [parent=#Player] GetHoveredWidget
-- @param  self
-- @return #Entity The hovered widget.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the bottom base and the top base size of the player's hull.
-- @function [parent=#Player] GetHull
-- @param  self
-- @return #Vector, #Vector Player's hull bottom base and top base size.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the bottom base and the top base size of the player's crouch hull.
-- @function [parent=#Player] GetHullDuck
-- @param  self
-- @return #Vector Player's crouch hull bottom base and top base size.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Retrieves the value of a client-side ConVar. The ConVar must have a
-- FCVAR_USERINFO flag for this to work.
-- 
-- **Warning**: _The returned value is truncated to 31 bytes._
-- @function [parent=#Player] GetInfo
-- @param  self
-- @param  #string cVarName The name of the client-side ConVar.
-- @return #string The value of the ConVar.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Retrieves the numeric value of a client-side convar, returns nil if value is
-- not convertible to a number. The ConVar must have a FCVAR_USERINFO flag for
-- this to work.
-- @function [parent=#Player] GetInfoNum
-- @param  self
-- @param  #string cVarName The name of the ConVar to query the value of.
-- @param  #number default Default value if we failed to retrieve the number.
-- @return #number The value of the ConVar or the default value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the jump power of the player.
-- @function [parent=#Player] GetJumpPower
-- @param  self
-- @return #number Jump power.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the timescale multiplier of the player movement.
-- @function [parent=#Player] GetLaggedMovementValue
-- @param  self
-- @return #number The timescale multiplier, defaults to 1.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's maximum movement speed. See also **Player:SetMaxSpeed**,
-- **Player:GetWalkSpeed** and **Player:GetRunSpeed**.
-- @function [parent=#Player] GetMaxSpeed
-- @param  self
-- @return #number The maximum movement speed the player can go at.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's name, this is an alias of **Player:Nick**.
-- 
-- **Note**: _This function overrides **Entity:GetName** (in the Lua metatable, not
-- in c++), keep it in mind when dealing with **ents.FindByName** or any engine
-- function which requires the mapping name._
-- @function [parent=#Player] GetName
-- @param  self
-- @return #string The player's name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the player is set not to collide with their teammates.
-- @function [parent=#Player] GetNoCollideWithTeammates
-- @param  self
-- @return #boolean No collide with teammates.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the the observer mode of the player.
-- @function [parent=#Player] GetObserverMode
-- @param  self
-- @return #number Observe mode of that player, see **OBS\_MODE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity the player is currently observing. Set using **Player:SpectateEntity**.
-- @function [parent=#Player] GetObserverTarget
-- @param  self
-- @return #Entity The entity the player is currently spectating, or NULL if the player has no target.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a Player Data key-value pair from the SQL database. (sv.db when called
-- on server, cl.db when called on client) Internally uses the sql library.
-- 
-- **Warning**: _This function internally uses **Player:UniqueID**, which can cause
-- collisions (two or more players sharing the same PData entry). It's
-- recommended that you don't use it. See the related wiki page for more information._
-- 
-- **Note**: _PData is not networked from servers to clients!_
-- @function [parent=#Player] GetPData
-- @param  self
-- @param  #string key Name of the PData key.
-- @param  #any default Default value if PData key doesn't exist. _(Default: nil)_
-- @return #string The data in the SQL database or the default value given.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a player model's color. The part of the model that is colored is
-- determined by the model itself, and is different for each model. The format
-- is Vector(r,g,b), and each color should be between 0 and 1.
-- @function [parent=#Player] GetPlayerColor
-- @param  self
-- @return #Vector The player's color.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns a table containing player information.
-- @function [parent=#Player] GetPlayerInfo
-- @param  self
-- @return #table A table containing player information.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the preferred carry angles of an object, if any are set. Calls
-- **GM:GetPreferredCarryAngles** with the target entity and returns the
-- carry angles.
-- @function [parent=#Player] GetPreferredCarryAngles
-- @param  self
-- @param  #Entity carryEnt Entity to retrieve the carry angles of.
-- @return #Angle Carry angles or nil if the entity has no preferred carry angles.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the widget entity the player is using. Having a pressed widget stops
-- the player from firing his weapon to allow input to be passed onto the widget.
-- @function [parent=#Player] GetPressedWidget
-- @param  self
-- @return #Entity The pressed widget.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns players death ragdoll. The ragdoll is created by **Player:CreateRagdoll**.
-- @function [parent=#Player] GetRagdollEntity
-- @param  self
-- @return #Entity The ragdoll.
-- Unlike normal clientside ragdolls (C\_ClientRagdoll), this will be a C\_HL2MPRagdoll on the client, and hl2mp\_ragdoll on the server.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the render angles for the player.
-- @function [parent=#Player] GetRenderAngles
-- @param  self
-- @return #Angle The render angles of the player.
-- Only yaw part of the angle seems to be present.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's sprint speed. See also **Player:SetRunSpeed**,
-- **Player:GetWalkSpeed** and **Player:GetMaxSpeed**.
-- @function [parent=#Player] GetRunSpeed
-- @param  self
-- @return #number The sprint speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position of a Player's view.
-- 
-- **Note**: _This is the same as calling **Entity:EyePos** on the player._
-- @function [parent=#Player] GetShootPos
-- @param  self
-- @return #Vector Aim position.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the maximum height player can step onto.
-- @function [parent=#Player] GetStepSize
-- @param  self
-- @return #number The maximum height player can get up onto without jumping, in hammer units.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the number of seconds that the player has been timing out for. You
-- can check if a player is timing out with **Player:IsTimingOut**.
-- @function [parent=#Player] GetTimeoutSeconds
-- @param  self
-- @return #number Timeout seconds.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns TOOL table of players current tool, or of the one specified.
-- @function [parent=#Player] GetTool
-- @param  self
-- @param  #string mode Classname of the tool to retrieve. (Filename of the tool in gmod\_tool/stools/) _(Default: nil)_
-- @return #table TOOL table, or nil if the table wasn't found or the player doesn't have a tool gun.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a player's unduck speed. (in seconds)
-- @function [parent=#Player] GetUnDuckSpeed
-- @param  self
-- @return #number Unduck speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's user group.
-- @function [parent=#Player] GetUserGroup
-- @param  self
-- @return #string The user group of the player.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the vehicle the player is driving, returns NULL ENTITY if the player is
-- not driving.
-- @function [parent=#Player] GetVehicle
-- @param  self
-- @return #Vehicle Vehicle entity or NULL.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the entity the player is using to see from (such as the player
-- itself, the camera, or another entity).
-- @function [parent=#Player] GetViewEntity
-- @param  self
-- @return #Entity The entity the player is using to see from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's view model entity by the index. Each player has 3 view
-- models by default, but only the first one is used. To use the other
-- viewmodels in your SWEP, see **Entity:SetWeaponModel**.
-- 
-- **Note**: _In the Client realm, other players' viewmodels are not available
-- unless they are being spectated._
-- @function [parent=#Player] GetViewModel
-- @param  self
-- @param  #number index Optional index of the view model to return, can range from 0 to 2. _(Default: 0)_
-- @return #Entity The view model entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the view offset of the player which equals the difference between the
-- players actual position and their view. See also **Player:GetViewOffsetDucked**.
-- @function [parent=#Player] GetViewOffset
-- @param  self
-- @return #Vector New view offset, must be local vector to players **Entity:GetPos**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the view offset of the player which equals the difference between the
-- players actual position and their view when ducked. See also **Player:GetViewOffset**.
-- @function [parent=#Player] GetViewOffsetDucked
-- @param  self
-- @return #Vector New crouching view offset, must be local vector to players **Entity:GetPos**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns players screen punch effect angle.
-- @function [parent=#Player] GetViewPunchAngles
-- @param  self
-- @return #Angle The punch angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's normal walking speed. Not sprinting, not slow walking. (+walk)
-- See also **Player:SetWalkSpeed**, **Player:GetMaxSpeed** and **Player:GetRunSpeed**.
-- @function [parent=#Player] GetWalkSpeed
-- @param  self
-- @return #number The normal walking speed.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the weapon for the specified class.
-- @function [parent=#Player] GetWeapon
-- @param  self
-- @param  #string className Class name of weapon.
-- @return #Weapon The weapon for the specified class.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a player's weapon color. The part of the model that is colored is
-- determined by the model itself, and is different for each model. The format
-- is Vector(r,g,b), and each color should be between 0 and 1.
-- @function [parent=#Player] GetWeaponColor
-- @param  self
-- @return #Vector The weapon's color.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table of the player's weapons.
-- @function [parent=#Player] GetWeapons
-- @param  self
-- @return #table All the weapons the player currently has.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gives the player a weapon.
-- 
-- **Note**: _While this function is meant for weapons/pickupables only, it is
-- **not** restricted to weapons. Any entity can be spawned using this function,
-- including NPCs and SENTs._
-- @function [parent=#Player] Give
-- @param  self
-- @param  #string weaponClassName Class name of weapon to give the player.
-- @param  #boolean bNoAmmo Set to true to not give any ammo on weapon spawn. _(Default: false)_
-- (Reserve ammo set by DefaultClip)
-- @return #Weapon The weapon given to the player, if one was given.
-- It will return NULL if the player already has the weapon, or the weapon entity (entity with given classname) doesn't exist.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gives ammo to a player.
-- @function [parent=#Player] GiveAmmo
-- @param  self
-- @param  #number amount Amount of ammo.
-- @param  #string type Type of ammo. This can also be a number for ammo ID, useful for custom ammo types.
-- @param  #boolean hidePopup Hide display popup when giving the ammo. _(Default: false)_
-- @return #number Ammo given.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Disables god mode on the player.
-- @function [parent=#Player] GodDisable
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Enables god mode on the player.
-- @function [parent=#Player] GodEnable
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the player has god mode or not, contolled by
-- **Player:GodEnable** and **Player:GodDisable**.
-- @function [parent=#Player] HasGodMode
-- @param  self
-- @return #boolean Whether the player has god mode or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the player has the specified weapon.
-- @function [parent=#Player] HasWeapon
-- @param  self
-- @param  #string className Class name of the weapon.
-- @return #boolean True if the player has the weapon.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the player is in a vehicle.
-- @function [parent=#Player] InVehicle
-- @param  self
-- @return #boolean Whether the player is in a vehicle.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the player's IP address and connection port in ip:port form.
-- @function [parent=#Player] IPAddress
-- @param  self
-- @return #string The player's IP address and connection port.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the player is an admin or not.
-- @function [parent=#Player] IsAdmin
-- @param  self
-- @return #boolean True if the player is an admin.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the player is an bot or not.
-- @function [parent=#Player] IsBot
-- @param  self
-- @return #boolean True if the player is a bot.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true from the point when the player is sending client info but not
-- fully in the game until they disconnect.
-- @function [parent=#Player] IsConnected
-- @param  self
-- @return #boolean Is connected.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Used to find out if a player is currently 'driving' an entity (by which we
-- mean 'right click > drive').
-- @function [parent=#Player] IsDrivingEntity
-- @param  self
-- @return #boolean A value representing whether or not the player is 'driving' an entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the players movement is currently frozen, contolled by **Player:Freeze**.
-- @function [parent=#Player] IsFrozen
-- @param  self
-- @return #boolean Whether the players movement is currently frozen or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the player identity was confirmed by the steam network.
-- @function [parent=#Player] IsFullyAuthenticated
-- @param  self
-- @return #boolean Whether the player has been fully authenticated or not.
-- This will always be true for singleplayer and the listen server host.
-- This will always be false for bots.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns if a player is the host of the current session.
-- @function [parent=#Player] IsListenServerHost
-- @param  self
-- @return #boolean True if the player is the listen server host, false otherwise.
-- This will always be true in single player, and false on a dedicated server.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether or not the player is muted locally.
-- @function [parent=#Player] IsMuted
-- @param  self
-- @return #boolean whether or not the player is muted locally.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the player is playing a taunt.
-- @function [parent=#Player] IsPlayingTaunt
-- @param  self
-- @return #boolean Whether the player is playing a taunt.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whenever the player is heard by the local player.
-- @function [parent=#Player] IsSpeaking
-- @param  self
-- @return #boolean Is speaking.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the player is currently sprinting or not.
-- @function [parent=#Player] IsSprinting
-- @param  self
-- @return #boolean Is the player sprinting or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the player is equipped with the suit item.
-- @function [parent=#Player] IsSuitEquipped
-- @param  self
-- @return #boolean Is the suit equipped or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the player is a superadmin.
-- @function [parent=#Player] IsSuperAdmin
-- @param  self
-- @return #boolean True if the player is a superadmin.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns true if the player is timing out (ex: is losing connection), false otherwise.
-- @function [parent=#Player] IsTimingOut
-- @param  self
-- @return #boolean Is timing out.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the player is typing in their chat. This may not work
-- properly if the server uses a custom chatbox.
-- @function [parent=#Player] IsTyping
-- @param  self
-- @return #boolean Whether the player is typing in their chat or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true/false if the player is in specified group or not.
-- @function [parent=#Player] IsUserGroup
-- @param  self
-- @param  #string groupname Group to check the player for.
-- @return #boolean Is in user group.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns if the player can be heard by the local player.
-- @function [parent=#Player] IsVoiceAudible
-- @param  self
-- @return #boolean Is audible.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the player is in the context menu.
-- 
-- **Note**: _Although this is shared, it will only work properly on the CLIENT
-- for the local player. Using this serverside or on other players will return false._
-- @function [parent=#Player] IsWorldClicking
-- @param  self
-- @return #boolean Is the player world clicking or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets whether a key is down. This is not networked to other players, meaning
-- only the local client can see the keys they are pressing.
-- @function [parent=#Player] KeyDown
-- @param  self
-- @param  #number key The key, see **IN\_ Enums**.
-- @return #boolean Is down.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets whether a key was down one tick ago.
-- @function [parent=#Player] KeyDownLast
-- @param  self
-- @param  #number key The key, see **IN\_ Enums**.
-- @return #boolean Is key down.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets whether a key was just pressed this tick.
-- @function [parent=#Player] KeyPressed
-- @param  self
-- @param  #number key Corresponds to an **IN\_ Enums**.
-- @return #boolean Was pressed or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets whether a key was just released this tick.
-- @function [parent=#Player] KeyReleased
-- @param  self
-- @param  #number key The key, see **IN\_ Enums**.
-- @return #boolean Was released or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Kicks the player from the server.
-- @function [parent=#Player] Kick
-- @param  self
-- @param  #string reason Reason to show for disconnection. _(Default: "No reason given")_

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Kills a player and calls **GM:PlayerDeath**.
-- @function [parent=#Player] Kill
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Kills a player without notifying the rest of the server. This will call
-- **GM:PlayerSilentDeath** instead of **GM:PlayerDeath**.
-- @function [parent=#Player] KillSilent
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This allows the server to mitigate the lag of the player by moving back all
-- the entities that can be lag compensated to the time the player attacked
-- with his weapon. This technique is most commonly used on things that hit
-- other entities instantaneously, such as traces.  
-- Lag compensation only works for players and entities that have been enabled
-- with **Entity:SetLagCompensated**. Despite being defined shared, it can only be
-- used server side in a Predicted Hook.
-- 
-- **Note**: _**Entity:FireBullets** calls this function internally._
-- 
-- **Warning**: _This function NEEDS to be disabled after you're done with it
-- or it will break the movement of the entities affected!_
-- @function [parent=#Player] LagCompensation
-- @param  self
-- @param  #boolean lagCompensation The state of the lag compensation, true to enable and false to disable.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the hitgroup where the player was last hit.
-- @function [parent=#Player] LastHitGroup
-- @param  self
-- @return #number Hitgroup, see **HITGROUP\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Shows "limit hit" notification in sandbox.
-- 
-- **Note**: _This function is only available in Sandbox and its derivatives._
-- @function [parent=#Player] LimitHit
-- @param  self
-- @param  #string type Type of hit limit.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Stops a player from using any inputs, such as moving, turning, or attacking.
-- Key binds are still called. Similar to **Player:Freeze** but the player takes no
-- damage. Adds the FL\_FROZEN and FL\_GODMODE flags to the player.
-- @function [parent=#Player] Lock
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the position of a Kinect bone.
-- @function [parent=#Player] MotionSensorPos
-- @param  self
-- @param  #number bone Bone to get the position of. Must be from 0 to 19.
-- @return #Vector Position of the bone.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the players name. Identical to **Player:Nick** and **Player:GetName**.
-- @function [parent=#Player] Name
-- @param  self
-- @return #string Player's Steam name.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's nickname.
-- @function [parent=#Player] Nick
-- @param  self
-- @return #string Player's Steam name.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the packet loss of the client. It is not networked so it only
-- returns 0 when run clientside.
-- @function [parent=#Player] PacketLoss
-- @param  self
-- @return #number Number of packets lost.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Unfreezes the props player is looking at. This is essentially the same as
-- pressing reload with the physics gun, including double press for unfreeze all.
-- @function [parent=#Player] PhysgunUnfreeze
-- @param  self
-- @return #number Number of props unfrozen.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- This makes the player hold (same as pressing E on a small prop) the provided entity.
-- 
-- **Note**: _Don't get this confused with picking up items like ammo or health kits._
-- 
-- **Note**: _This picks up the passed entity regardless of its mass or
-- distance from the player._
-- @function [parent=#Player] PickupObject
-- @param  self
-- @param  #Entity entity Entity to pick up.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's ping to server.
-- @function [parent=#Player] Ping
-- @param  self
-- @return #number The player's ping.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Plays the correct step sound according to what the player is staying on.
-- @function [parent=#Player] PlayStepSound
-- @param  self
-- @param  #number volume Volume for the sound, in range from 0 to 1.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Displays a message either in their chat, console, or center of the screen.
-- See also **PrintMessage**.
-- 
-- **Note**: _When called serverside, this uses the archaic user message system
-- (the umsg library) and hence is limited to ≈250 characters._
-- 
-- **Note**: _HUD\_PRINTCENTER will not work when this is called clientside._
-- @function [parent=#Player] PrintMessage
-- @param  self
-- @param  #number type Which type of message should be sent to the player. See **HUD\_ Enums**.
-- @param  #string message Message to be sent to the player.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all ammo from a certain player.
-- @function [parent=#Player] RemoveAllAmmo
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all weapons and ammo from the player.
-- @function [parent=#Player] RemoveAllItems
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes the amount of the specified ammo from the player.
-- @function [parent=#Player] RemoveAmmo
-- @param  self
-- @param  #number ammoCount The amount of ammunition to remove.
-- @param  #string ammoName The name of the ammunition to remove from. This can also be a number ammoID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Removes a Player Data key-value pair from the SQL database. (sv.db when
-- called on server, cl.db when called on client) Internally uses the sql library.
-- 
-- **Warning**: _This function internally uses **Player:UniqueID**, which can cause
-- collisions (two or more players sharing the same PData entry). It's
-- recommended that you don't use it._
-- @function [parent=#Player] RemovePData
-- @param  self
-- @param  #string key Key to remove.
-- @return #boolean true is succeeded, false otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Strips the player's suit item.
-- @function [parent=#Player] RemoveSuit
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Resets both normal and duck hulls to their default values.
-- @function [parent=#Player] ResetHull
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Forces the player to say whatever the first argument is. Works on bots too.
-- 
-- **Note**: _This function ignores the default chat message cooldown._
-- @function [parent=#Player] Say
-- @param  self
-- @param  #string text The text to force the player to say.
-- @param  #boolean teamOnly Whether to send this message to our own team only. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Fades the screen.
-- @function [parent=#Player] ScreenFade
-- @param  self
-- @param  #number flags Fade flags defined with **SCREENFADE\_ Enums**.
-- @param  #number clr The color of the screenfade. _(Default: color\_white)_
-- @param  #number fadeTime Fade(in/out) effect transition time. (From no fade to full fade and vice versa)
-- @param  #number fadeHold Fade effect hold time.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the active weapon of the player by its class name.
-- 
-- **Warning**: _This will switch the weapon out of prediction, causing delay
-- on the client and **Weapon:Deploy** to be called out of prediction. Try using
-- **CUserCmd:SelectWeapon** or **input.SelectWeapon**, instead._
-- 
-- **Note**: _This will trigger the weapon switch event and associated
-- animations. To switch weapons silently, use **Player:SetActiveWeapon**._
-- @function [parent=#Player] SelectWeapon
-- @param  self
-- @param  #string className The class name of the weapon to switch to.
-- The player must already have this weapon. You can use **Player:Give** if not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sends a hint to a player.
-- 
-- **Note**: _This function is only available in Sandbox and its derivatives.
-- Since this adds **#Hint\_** to the beginning of each message, you should only use
-- it with default hint messages, or those cached with **language.Add**. For hints
-- with custom text, look at **notification.AddLegacy**._
-- @function [parent=#Player] SendHint
-- @param  self
-- @param  #string name Name/class/index of the hint.
-- The text of the hint will contain this value. ( "#Hint_" .. name )
-- An example is PhysgunFreeze.
-- @param  #number delay Delay in seconds before showing the hint.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Executes a simple Lua string on the player.
-- 
-- **Note**: _The string is limited to 254 bytes. Consider using the net
-- library for more advanced server-client interaction._
-- @function [parent=#Player] SendLua
-- @param  self
-- @param  #string script The script to execute.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the player's active weapon. You should use **CUserCmd:SelectWeapon** or
-- **Player:SelectWeapon**, instead in most cases.
-- 
-- **Note**: _This function will not trigger the weapon switch event or
-- associated equip animations. You can achieve this using **Player:SelectWeapon**
-- with **Entity:GetClass**._
-- 
-- **Note**: _This will not call **GM:PlayerSwitchWeapon**._
-- @function [parent=#Player] SetActiveWeapon
-- @param  self
-- @param  #Weapon weapon The weapon to equip.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Set if the players' model is allowed to rotate around the pitch and roll axis.
-- @function [parent=#Player] SetAllowFullRotation
-- @param  self
-- @param  #boolean Allowed Allowed to rotate.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Allows player to use his weapons in a vehicle. You need to call this before
-- entering a vehicle.
-- @function [parent=#Player] SetAllowWeaponsInVehicle
-- @param  self
-- @param  #boolean allow Show we allow player to use his weapons in a vehicle or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the amount of the specified ammo for the player.
-- @function [parent=#Player] SetAmmo
-- @param  self
-- @param  #number ammoCount The amount of ammunition to set.
-- @param  #any ammoType The ammunition type. Can be either number ammo ID or string ammo name.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the player armor to the argument.
-- @function [parent=#Player] SetArmor
-- @param  self
-- @param  #number Amount The amount that the player armor is going to be set to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Pushes the player away from another player whenever it's inside the other
-- players bounding box.
-- @function [parent=#Player] SetAvoidPlayers
-- @param  self
-- @param  #boolean avoidPlayers Avoid or not avoid.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Set if the player should be allowed to walk using the (default) alt key.
-- @function [parent=#Player] SetCanWalk
-- @param  self
-- @param  #boolean abletowalk True allows the player to walk.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets whether the player can use the HL2 suit zoom ("+zoom" bind) or not.
-- @function [parent=#Player] SetCanZoom
-- @param  self
-- @param  #boolean canZoom Whether to make the player able or unable to zoom.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the player's class id.
-- @function [parent=#Player] SetClassID
-- @param  self
-- @param  #number classID The class id the player is being set with.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the crouched walk speed multiplier. Doesn't work for values above 1.
-- See also **Player:SetWalkSpeed** and **Player:GetCrouchedWalkSpeed**.
-- @function [parent=#Player] SetCrouchedWalkSpeed
-- @param  self
-- @param  #number speed The walk speed multiplier that crouch speed should be.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the actual view offset which equals the difference between the players
-- actual position and their view when standing. Do not confuse with
-- **Player:SetViewOffset** and **Player:SetViewOffsetDucked**.
-- @function [parent=#Player] SetCurrentViewOffset
-- @param  self
-- @param  #Vector viewOffset The new view offset.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets a player's death count.
-- @function [parent=#Player] SetDeaths
-- @param  self
-- @param  #number deathcount Number of deaths. (positive or negative)

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Sets the driving entity and driving mode. Use **drive.PlayerStartDriving** instead.
-- @function [parent=#Player] SetDrivingEntity
-- @param  self
-- @param  #Entity drivingEntity The entity the player should drive. _(Default: NULL)_
-- @param  #number drivingMode The driving mode index.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Applies the specified sound filter to the player.
-- @function [parent=#Player] SetDSP
-- @param  self
-- @param  #number soundFilter The index of the sound filter to apply.
-- @param  #boolean fastReset If set to true the sound filter will be removed faster.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets how quickly a player ducks.
-- @function [parent=#Player] SetDuckSpeed
-- @param  self
-- @param  #number duckSpeed How quickly the player will duck.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the angle of the player's view. (may rotate body too if angular
-- difference is large)
-- @function [parent=#Player] SetEyeAngles
-- @param  self
-- @param  #Angle angle Angle to set the view to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Set a player's FOV (Field Of View) over a certain amount of time.
-- @function [parent=#Player] SetFOV
-- @param  self
-- @param  #number fov The angle of perception (FOV).
-- Set to 0 to return to default user FOV. (Which is ranging from 75 to 90, depending on user settings)
-- @param  #number time The time it takes to transition to the FOV expressed in a floating point.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets a player's frags. (kills)
-- @function [parent=#Player] SetFrags
-- @param  self
-- @param  #number fragcount Number of frags. (positive or negative)

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the hands entity of a player. The hands entity is an entity introduced
-- in Garry's Mod 13 and it's used to show the player's hands attached to the
-- viewmodel. This is similar to the approach used in L4D and CS:GO.
-- @function [parent=#Player] SetHands
-- @param  self
-- @param  #Entity hands The hands entity to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the widget that is currently hovered by the player's mouse.
-- @function [parent=#Player] SetHoveredWidget
-- @param  self
-- @param  #Entity widget The widget entity that the player is hovering. _(Default: NULL)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the mins and maxs of the AABB of the players collision.
-- @function [parent=#Player] SetHull
-- @param  self
-- @param  #Vector hullMins The min coordinates of the hull.
-- @param  # Vector hullMaxs The max coordinates of the hull.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the mins and maxs of the AABB of the players collision when ducked.
-- @function [parent=#Player] SetHullDuck
-- @param  self
-- @param  #Vector hullMins The min coordinates of the hull.
-- @param  #Vector hullMaxs The max coordinates of the hull.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the jump power, ex: the velocity the player will applied to when he jumps.
-- @function [parent=#Player] SetJumpPower
-- @param  self
-- @param  #number jumpPower The new jump velocity.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Slows down the player movement simulation by the timescale, this is used
-- internally in the HL2 weapon stripping sequence. It achieves such behavior
-- by multiplying the **FrameTime** by the specified timescale at the start of the
-- movement simulation and then restoring it afterwards.
-- 
-- **Note**: _This is reset to 1 on spawn._
-- 
-- **Note**: _There is no weapon counterpart to this, you'll have to hardcode
-- the multiplier in the weapon or call **Weapon:SetNextPrimaryFire** /
-- **Weapon:SetNextSecondaryFire** manually from a Predicted Hook._
-- @function [parent=#Player] SetLaggedMovementValue
-- @param  self
-- @param  #number timescale The timescale multiplier.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the maximum speed which the player can move at.
-- 
-- **Note**: _This is called automatically by the engine. If you wish to limit player
-- speed without setting their run/sprint speeds, see **CMoveData:SetMaxClientSpeed**._
-- @function [parent=#Player] SetMaxSpeed
-- @param  self
-- @param  #number walkSpeed The maximum speed.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets if the player should be muted locally.
-- @function [parent=#Player] SetMuted
-- @param  self
-- @param  #boolean mute Mute or unmute.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets whenever the player should not collide with their teammates.
-- @function [parent=#Player] SetNoCollideWithTeammates
-- @param  self
-- @param  #boolean shouldNotCollide True to disable, false to enable collision.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the players visibility towards NPCs.
-- @function [parent=#Player] SetNoTarget
-- @param  self
-- @param  #boolean visibility The visibility.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the players observer mode. You must start the spectating first with **Player:Spectate**.
-- @function [parent=#Player] SetObserverMode
-- @param  self
-- @param  #number mode Spectator mode using **OBS\_MODE\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a Player Data key-value pair to the SQL database. (sv.db when called
-- on server, cl.db when called on client) Internally uses the sql library.
-- 
-- **Warning**: _This function internally uses **Player:UniqueID**, which can cause
-- collisions (two or more players sharing the same PData entry). It's
-- recommended that you don't use it._
-- 
-- **Note**: _PData is not networked from servers to clients!_
-- @function [parent=#Player] SetPData
-- @param  self
-- @param  #string key Name of the PData key.
-- @param  #any value Value to write to the key (must be an SQL valid data type, such as a string or integer)
-- @return #boolean Whether the operation was successful or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the player model's color. The part of the model that is colored is
-- determined by the model itself, and is different for each model.
-- @function [parent=#Player] SetPlayerColor
-- @param  self
-- @param  #Vector Color This is the color to be set.
-- The format is Vector(r,g,b), and each color should be between 0 and 1.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the widget that is currently in use by the player's mouse. Having a
-- pressed widget stops the player from firing his weapon to allow input to be
-- passed onto the widget.
-- @function [parent=#Player] SetPressedWidget
-- @param  self
-- @param  #Entity pressedWidget The widget the player is currently using. _(Default: NULL)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the render angles of a player.
-- @function [parent=#Player] SetRenderAngles
-- @param  self
-- @param  #Angle ang The new render angles to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the player's sprint speed. See also **Player:GetRunSpeed**,
-- **Player:SetWalkSpeed** and **Player:SetMaxSpeed**.
-- @function [parent=#Player] SetRunSpeed
-- @param  self
-- @param  #number runSpeed The new sprint speed when sv_friction is below 10.
-- Higher sv_friction values will result in slower speed.
-- Has to be 7 or above or the player won't be able to move.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the maximum height a player can step onto without jumping.
-- @function [parent=#Player] SetStepSize
-- @param  self
-- @param  #number stepHeight The new maximum height the player can step onto without jumping.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whenever to suppress the pickup notification for the player.
-- @function [parent=#Player] SetSuppressPickupNotices
-- @param  self
-- @param  #boolean doSuppress Whenever to suppress the notice or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the player to the chosen team.
-- @function [parent=#Player] SetTeam
-- @param  self
-- @param  #number Team The team that the player is being set to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets how quickly a player un-ducks
-- @function [parent=#Player] SetUnDuckSpeed
-- @param  self
-- @param  #number UnDuckSpeed How quickly the player will un-duck.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets up the players view model hands. Calls **GM:PlayerSetHandsModel** to set
-- the model of the hands.
-- @function [parent=#Player] SetupHands
-- @param  self
-- @param  #Entity ent If the player is spectating an entity, this should be the entity the player is spectating, so we can use its hands model instead.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the usergroup of the player.
-- @function [parent=#Player] SetUserGroup
-- @param  self
-- @param  #string groupName The user group of the player.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Attaches the players view to the position and angles of the specified entity.
-- @function [parent=#Player] SetViewEntity
-- @param  self
-- @param  #Entity viewEntity The entity to attach the player view to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the desired view offset which equals the difference between the players
-- actual position and their view when standing. If you want to set actual view
-- offset, use **Player:SetCurrentViewOffset**. See also **Player:SetViewOffsetDucked**
-- for desired view offset when crouching.
-- @function [parent=#Player] SetViewOffset
-- @param  self
-- @param  #Vector viewOffset The new desired view offset when standing.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the desired view offset which equals the difference between the
-- players actual position and their view when crouching. If you want to set
-- actual view offset, use **Player:SetCurrentViewOffset**. See also
-- **Player:SetViewOffset** for desired view offset when standing.
-- @function [parent=#Player] SetViewOffsetDucked
-- @param  self
-- @param  #Vector viewOffset The new desired view offset when crouching.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets client's view punch. See **Player:ViewPunch**.
-- @function [parent=#Player] SetViewPunchAngles
-- @param  self
-- @param  #Angle punchAngle The angle to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the player's normal walking speed. Not sprinting, not slow walking +walk.
-- There currently is no way to modify the slow walking +walk speed. See also
-- **Player:GetWalkSpeed**, **Player:SetCrouchedWalkSpeed**, **Player:SetMaxSpeed** and **Player:SetRunSpeed**.
-- @function [parent=#Player] SetWalkSpeed
-- @param  self
-- @param  #number walkSpeed The new walk speed when sv\_friction is below 10.
-- Higher sv_friction values will result in slower speed.
-- Has to be 7 or above or the player won't be able to move.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the player weapon's color. The part of the model that is colored is
-- determined by the model itself, and is different for each model.
-- @function [parent=#Player] SetWeaponColor
-- @param  self
-- @param  #Vector Color This is the color to be set. The format is Vector(r,g,b), and each color should be between 0 and 1.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Polls the engine to request if the player should be drawn at the time the function is called.
-- @function [parent=#Player] ShouldDrawLocalPlayer
-- @param  self
-- @return #boolean Should draw.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets whether the player's current weapon should drop on death.
-- 
-- **Warning**: _This seems to be reset to false when player dies._
-- @function [parent=#Player] ShouldDropWeapon
-- @param  self
-- @param  #boolean drop Whether to drop the player's current weapon or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Opens the player steam profile page in the steam overlay browser.
-- @function [parent=#Player] ShowProfile
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Signals the entity that it was dropped by the gravity gun.
-- @function [parent=#Player] SimulateGravGunDrop
-- @param  self
-- @param  #Entity ent Entity that was dropped.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Signals the entity that it was picked up by the gravity gun. This call is
-- only required if you want to simulate the situation of picking up objects.
-- @function [parent=#Player] SimulateGravGunPickup
-- @param  self
-- @param  #Entity ent The entity picked up.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Starts spectate mode for given player. This will also affect the players
-- movetype in some cases.
-- @function [parent=#Player] Spectate
-- @param  self
-- @param  #number mode Spectate mode, see **OBS\_MODE\_ Enums**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes the player spectate the entity. To get the applied spectated entity,
-- use **Player:GetObserverTarget**().
-- @function [parent=#Player] SpectateEntity
-- @param  self
-- @param  #Entity entity Entity to spectate.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Makes a player spray their decal.
-- @function [parent=#Player] SprayDecal
-- @param  self
-- @param  #Vector sprayOrigin The location to spray from.
-- @param  #Vector sprayEndPos The location to spray to.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Disables the sprint on the player.
-- @function [parent=#Player] SprintDisable
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Enables the sprint on the player.
-- @function [parent=#Player] SprintEnable
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's SteamID. In singleplayer, this will be STEAM\_ID\_PENDING
-- serverside. For Bots this will return "BOT" on the server and on the client
-- it returns "NULL".
-- @function [parent=#Player] SteamID
-- @param  self
-- @return #string Player's SteamID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's 64bit SteamID aka CommunityID. In singleplayer, this
-- will return no value serverside. For bots, this will return
-- 90071996842377216 (equivalent to STEAM\_0:0:0) for the first bot to join.
-- For each additional bot, the number increases by 1. So the next bot will be
-- 90071996842377217 (STEAM\_0:1:0) then 90071996842377218 (STEAM\_0:0:1) and so on.
-- On the client it returns no value for bots.
-- @function [parent=#Player] SteamID64
-- @param  self
-- @return #string Player's 64bit SteamID aka CommunityID.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Turns off the zoom mode of the player. (+zoom console command) Basically
-- equivalent of entering "-zoom" into player's console.
-- @function [parent=#Player] StopZooming
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all ammo from the player.
-- @function [parent=#Player] StripAmmo
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes the specified weapon class from a certain player.
-- @function [parent=#Player] StripWeapon
-- @param  self
-- @param  #string weapon The weapon class to remove.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Removes all weapons from a certain player.
-- @function [parent=#Player] StripWeapons
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Prevents a hint from showing up.
-- 
-- **Note**: _This function is only available in Sandbox and its derivatives._
-- @function [parent=#Player] SuppressHint
-- @param  self
-- @param  #string name Hint name/class/index to prevent from showing up.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Attempts to switch the player weapon to the one specified in the
-- "cl_defaultweapon" convar, if the player does not own the specified weapon
-- nothing will happen. If you want to switch to a specific weapon, use **Player:SetActiveWeapon**.
-- @function [parent=#Player] SwitchToDefaultWeapon
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's team ID. Returns 0 clientside when the game is not fully loaded.
-- @function [parent=#Player] Team
-- @param  self
-- @return #number The player's team's index number, as in the **TEAM\_ Enums** or a custom team defined in **team.SetUp**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the time in second since the player connected.
-- @function [parent=#Player] TimeConnected
-- @param  self
-- @return #number Connect time.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Performs a trace hull and applies damage to the entities hit, returns the
-- first entity hit.
-- @function [parent=#Player] TraceHullAttack
-- @param  self
-- @param  #Vector startPos The start position of the hull trace.
-- @param  #Vector endPos The end position of the hull trace.
-- @param  #Vector mins The minimum coordinates of the hull.
-- @param  #Vector maxs The maximum coordinates of the hull.
-- @param  #number damage The damage to be applied.
-- @param  #Vector damageFlags Bitflag specifying the damage type, see **DMG\_ Enums**.
-- @param  #number damageForce The force to be applied to the hit object.
-- @param  #boolean damageAllNPCs Whether to apply damage to all hit NPCs or not.
-- @return #Entity The hit entity.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Translates **ACT\_ Enums** according to the holdtype of players currently held weapon.
-- @function [parent=#Player] TranslateWeaponActivity
-- @param  self
-- @param  #number act The initial **ACT\_ Enums**.
-- @return #number Translated **ACT\_ Enums**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Unfreezes all objects the player has frozen with their Physics Gun. Same as
-- double pressing R while holding Physics Gun.
-- @function [parent=#Player] UnfreezePhysicsObjects
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a 32 bit integer that remains constant for a player across
-- joins/leaves and across different servers. This can be used when a string is
-- inappropriate - e.g. in a database primary key.
-- 
-- **Warning**: _This function has collisions, where more than one player has
-- the same UniqueID. It is highly recommended to use **Player:AccountID**,
-- **Player:SteamID** or **Player:SteamID64** instead, which are guaranteed to be
-- unique to each player._
-- 
-- **Note**: _In Singleplayer, this function will always return 1._
-- @function [parent=#Player] UniqueID
-- @param  self
-- @return #number The player's Unique ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a table that will stay allocated for the specific player between
-- connects until the server shuts down. Note, that this table is not
-- synchronized between client and server.
-- @function [parent=#Player] UniqueIDTable
-- @param  self
-- @param  #any key Unique table key.
-- @return #table The table that contains any info you have put in it.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Unlocks the player movement if locked previously. Will disable godmode for
-- the player if locked previously.
-- @function [parent=#Player] UnLock
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Stops the player from spectating another entity.
-- @function [parent=#Player] UnSpectate
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the player's ID. You can use **Player**() to get the player by their ID.
-- @function [parent=#Player] UserID
-- @param  self
-- @return #number The player's user ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Simulates a push on the client's screen.
-- @function [parent=#Player] ViewPunch
-- @param  self
-- @param  #Angle PunchAngle The angle in which to push the player's screen.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Resets the player's view punch (**Player:ViewPunch**) effect back to normal.
-- @function [parent=#Player] ViewPunchReset
-- @param  self
-- @param  #number tolerance Reset all ViewPunch below this threshold. _(Default: 0)_

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the players voice volume, how loud the player's voice communication
-- currently is, as a normal number. Doesn't work on local player unless the
-- voice_loopback convar is set to 1.
-- @function [parent=#Player] VoiceVolume
-- @param  self
-- @return #number The voice volume.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- A client side projected texture, created by ProjectedTexture.
-- @type ProjectedTexture

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the angle of the ProjectedTexture, which were previously set by **ProjectedTexture:SetAngles**.
-- @function [parent=#ProjectedTexture] GetAngles
-- @param  self
-- @return #Angle The angles of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the brightness of the ProjectedTexture, which was previously set by **ProjectedTexture:SetBrightness**.
-- @function [parent=#ProjectedTexture] GetBrightness
-- @param  self
-- @return #number The brightness of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the color of the ProjectedTexture, which was previously set by **ProjectedTexture:SetColor**.
-- @function [parent=#ProjectedTexture] GetColor
-- @param  self
-- @return #table **Color structure**, the color of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the constant attenuation of the projected texture, which can also be
-- set by **ProjectedTexture:SetConstantAttenuation**.
-- @function [parent=#ProjectedTexture] GetConstantAttenuation
-- @param  self
-- @return #number The constant attenuation.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether shadows are enabled for this ProjectedTexture, which was
-- previously set by **ProjectedTexture:SetEnableShadows**.
-- @function [parent=#ProjectedTexture] GetEnableShadows
-- @param  self
-- @return #boolean Whether shadows are enabled.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the projection distance of the ProjectedTexture, which was
-- previously set by **ProjectedTexture:SetFarZ**.
-- @function [parent=#ProjectedTexture] GetFarZ
-- @param  self
-- @return #number The projection distance of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the horizontal FOV of the ProjectedTexture, which was previously set
-- by **ProjectedTexture:SetHorizontalFOV** or **ProjectedTexture:SetFOV**.
-- @function [parent=#ProjectedTexture] GetHorizontalFOV
-- @param  self
-- @return #number The horizontal FOV of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the linear attenuation of the projected texture, which can also be
-- set by **ProjectedTexture:SetLinearAttenuation**.
-- @function [parent=#ProjectedTexture] GetLinearAttenuation
-- @param  self
-- @return #number The linear attenuation.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the NearZ value of the ProjectedTexture, which was previously set by **ProjectedTexture:SetNearZ**.
-- @function [parent=#ProjectedTexture] GetNearZ
-- @param  self
-- @return #number NearZ of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the current orthographic settings of the Projected Texture. To set
-- these values, use **ProjectedTexture:SetOrthographic**.
-- @function [parent=#ProjectedTexture] GetOrthographic
-- @param  self
-- @return #boolean, #number, #number, #number, #number True if texture is orthographic, false and nothing else is returned otherwise the left, top, right, and bottom settings.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the position of the ProjectedTexture, which was previously set by **ProjectedTexture:SetPos**.
-- @function [parent=#ProjectedTexture] GetPos
-- @param  self
-- @return #Vector The position of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the quadratic attenuation of the projected texture, which can also
-- be set by **ProjectedTexture:SetQuadraticAttenuation**.
-- @function [parent=#ProjectedTexture] GetQuadraticAttenuation
-- @param  self
-- @return #number The quadratic attenuation.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the texture of the ProjectedTexture, which was previously set by **ProjectedTexture:SetTexture**.
-- @function [parent=#ProjectedTexture] GetTexture
-- @param  self
-- @return #ITexture The texture of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the texture frame of the ProjectedTexture, which was previously set
-- by **ProjectedTexture:SetTextureFrame**.
-- @function [parent=#ProjectedTexture] GetTextureFrame
-- @param  self
-- @return #number The texture frame.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns the vertical FOV of the ProjectedTexture, which was previously set
-- by **ProjectedTexture:SetVerticalFOV** or **ProjectedTexture:SetFOV**.
-- @function [parent=#ProjectedTexture] GetVerticalFOV
-- @param  self
-- @return #number The vertical FOV of the ProjectedTexture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns true if the projected texture is valid (ex: has not been removed),
-- false otherwise. Instead of calling this directly it's a good idea to call
-- **IsValid** in case the variable is nil.
-- @function [parent=#ProjectedTexture] IsValid
-- @param  self
-- @return #boolean Whether the projected texture is valid.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Removes the projected texture. After calling this, **ProjectedTexture:IsValid**
-- will return false, and any hooks with the projected texture as the
-- identifier will be automatically deleted.
-- @function [parent=#ProjectedTexture] Remove
-- @param  self

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the angles (direction) of the projected texture. You must call
-- **ProjectedTexture:Update** after using this function for it to take effect.
-- @function [parent=#ProjectedTexture] SetAngles
-- @param  self
-- @param  #Angle angle The angle to project the texture towards.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the brightness of the projected texture. You must call
-- **ProjectedTexture:Update** after using this function for it to take effect.
-- @function [parent=#ProjectedTexture] SetBrightness
-- @param  self
-- @param  #number brightness The brightness to give the projected texture.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the color of the projected texture. You must call
-- **ProjectedTexture:Update** after using this function for it to take effect.
-- @function [parent=#ProjectedTexture] SetColor
-- @param  self
-- @param  #table color Must be a **Color structure**.
-- Unlike other projected textures, this color can only go up to 255.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the constant attenuation of the projected texture. See also
-- **ProjectedTexture:SetLinearAttenuation** and **ProjectedTexture:SetQuadraticAttenuation**.
-- You must call **ProjectedTexture:Update** after using this function for it to
-- take effect.
-- @function [parent=#ProjectedTexture] SetConstantAttenuation
-- @param  self
-- @param  #number constAtten

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Enable or disable shadows cast from the projected texture.
-- 
-- **Note**: _As with all types of projected textures (including the player's
-- flashlight and env\_projectedtexture), there can only be 8 projected textures
-- with shadows enabled in total. This limit can be increased with the launch
-- parameter: "-numshadowtextures limit" where limit is the new limit. Naturally,
-- many projected lights with shadows enabled will drastically decrease framerate._
-- You must call **ProjectedTexture:Update** after using this function for it to take effect.
-- @function [parent=#ProjectedTexture] SetEnableShadows
-- @param  self
-- @param  #boolean newState

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the distance at which the projected texture ends. You must call
-- **ProjectedTexture:Update** after using this function for it to take effect.
-- @function [parent=#ProjectedTexture] SetFarZ
-- @param  self
-- @param  #number farZ

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the angle of projection. You must call **ProjectedTexture:Update** after
-- using this function for it to take effect.
-- @function [parent=#ProjectedTexture] SetFOV
-- @param  self
-- @param  #number fov Must be higher than 0 and lower than 180.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the horizontal angle of projection without affecting the vertical angle.
-- You must call **ProjectedTexture:Update** after using this function for it to
-- take effect.
-- @function [parent=#ProjectedTexture] SetHorizontalFOV
-- @param  self
-- @param  #number hFOV The new horizontal Field Of View for the projected texture.
-- Must be in range between 0 and 180.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the linear attenuation of the projected texture. See also
-- **ProjectedTexture:SetConstantAttenuation** and **ProjectedTexture:SetQuadraticAttenuation**.
-- The default value of linear attenuation when the projected texture is
-- created is 100. (others are 0, as you are not supposed to mix them)
-- You must call **ProjectedTexture:Update** after using this function for it
-- to take effect.
-- @function [parent=#ProjectedTexture] SetLinearAttenuation
-- @param  self
-- @param  #number linearAtten

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the distance at which the projected texture begins its projection. You
-- must call **ProjectedTexture:Update** after using this function for it to
-- take effect.
-- 
-- **Note**: _Setting this to 0 will disable the projected texture completely!
-- This may be useful if you want to disable a projected texture without
-- actually removing it._
-- 
-- **Note**: _This seems to affect the rendering of shadows - a higher Near Z
-- value will have shadows begin to render closer to their casting object.
-- Comparing a low Near Z value (like 1) with a normal one (12) or high one
-- (1000) is the easiest way to understand this artifact._
-- @function [parent=#ProjectedTexture] SetNearZ
-- @param  self
-- @param  #number nearZ

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Changes the current projected texture between orthographic and perspective
-- projection. You must call **ProjectedTexture:Update** after using this function
-- for it to take effect.
-- @function [parent=#ProjectedTexture] SetOrthographic
-- @param  self
-- @param  #boolean orthographic When false, all other arguments are ignored and the texture is reset to perspective projection.
-- @param  #number left The amount of units left from the projected texture's origin to project.
-- @param  #number top The amount of units upwards from the projected texture's origin to project.
-- @param  #number right The amount of units right from the projected texture's origin to project.
-- @param  #number bottom The amount of units downwards from the projected texture's origin to project.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Move the Projected Texture to the specified position. You must call
-- **ProjectedTexture:Update** after using this function for it to take effect.
-- @function [parent=#ProjectedTexture] SetPos
-- @param  self
-- @param  #Vector position

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the quadratic attenuation of the projected texture. See also
-- **ProjectedTexture:SetLinearAttenuation** and **ProjectedTexture:SetConstantAttenuation**.
-- You must call **ProjectedTexture:Update** after using this function for it to
-- take effect.
-- @function [parent=#ProjectedTexture] SetQuadraticAttenuation
-- @param  self
-- @param  #number quadAtten

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the texture to be projected. You must call **ProjectedTexture:Update**
-- after using this function for it to take effect.
-- @function [parent=#ProjectedTexture] SetTexture
-- @param  self
-- @param  #string texture The name of the texture. Can also be an **ITexture**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- For animated textures, this will choose which frame in the animation will be
-- projected. You must call **ProjectedTexture:Update** after using this function
-- for it to take effect.
-- @function [parent=#ProjectedTexture] SetTextureFrame
-- @param  self
-- @param  #number frame The frame index to use.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sets the vertical angle of projection without affecting the horizontal angle.
-- You must call **ProjectedTexture:Update** after using this function for it to
-- take effect.
-- @function [parent=#ProjectedTexture] SetVerticalFOV
-- @param  self
-- @param  #number vFOV The new vertical Field Of View for the projected texture.
-- Must be in range between 0 and 180.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Updates the Projected Light and applies all previously set parameters.
-- @function [parent=#ProjectedTexture] Update
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- The object returned by **ai_schedule.New**.
-- @type Schedule

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds a task to the schedule See also **NPC:StartEngineTask** and **NPC:RunEngineTask**.
-- @function [parent=#Schedule] AddTask
-- @param  self
-- @param  #string taskname Task name, see ai_task.h
-- @param  #number taskdata Task data as a float.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#Schedule] AddTaskEx
-- @param  self
-- @param  #string start
-- @param  #string run
-- @param  #number data

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Adds an engine task to the schedule.
-- @function [parent=#Schedule] EngTask
-- @param  self
-- @param  #string taskname Task name.
-- @param  #number taskdata Task data.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the task at the given index.
-- @function [parent=#Schedule] GetTask
-- @param  self
-- @param  #number num Task index.
-- @param  #Task Task at the given index.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Initialises the Schedule. Called by **ai_schedule.New** when the Schedule is created.
-- @function [parent=#Schedule] Init
-- @param  self
-- @param  #string debugName The name passed from **ai_schedule.New**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the number of tasks in the schedule.
-- @function [parent=#Schedule] NumTasks
-- @param  self
-- @return #number The number of tasks in this schedule.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- An object returned by **util.Stack**. Like a Lua table, a Stack is a container.
-- It follows the principle of LIFO (last in, first out). The Stack works like
-- a stack of papers: the first page you put down (push) will be the last one
-- you remove (pop). That also means that the last page you put down, will be
-- the first to be removed.
-- @type Stack

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Pop an item from the stack
-- @function [parent=#Stack] Pop
-- @param  self
-- @param  #number amount Amount of items you want to pop. _(Default: 1)_
-- @return #any The item or a list of items popped from the stack.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Push an item onto the stack.
-- @function [parent=#Stack] Push
-- @param  self
-- @param  #any object The item you want to push.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the size of the stack.
-- @function [parent=#Stack] Size
-- @param  self
-- @return #number The size of the stack.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Get the item at the top of the stack.
-- @function [parent=#Stack] Top
-- @param  self
-- @return #any The item at the top of the stack.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- A single AI task. Returned by **ai_task.New**.
-- @type Task

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Initialises the AI task. Called by **ai_task.New**.
-- @function [parent=#Task] Init
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Initialises the AI task as an engine task.
-- @function [parent=#Task] InitEngine
-- @param  self
-- @param  #string taskname The name of the task.
-- @param  #number taskdata

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Initialises the AI task as NPC method-based.
-- @function [parent=#Task] InitFunctionName
-- @param  self
-- @param  #string startname The name of the NPC method to call on task start.
-- @param  #string runname The name of the NPC method to call on task run.
-- @param  #number taskdata

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Determines if the task is an engine task (TYPE_ENGINE, 1).
-- @function [parent=#Task] IsEngineType
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Determines if the task is an NPC method-based task (TYPE_FNAME, 2).
-- @function [parent=#Task] IsFNameType
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Runs the AI task.
-- @function [parent=#Task] Run
-- @param  self
-- @param  #NPC target The NPC to run the task on.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Runs the AI task as an NPC method. This requires the task to be of type TYPE_FNAME.
-- @function [parent=#Task] Run_FName
-- @param  self
-- @param  #NPC target The NPC to run the task on.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Starts the AI task.
-- @function [parent=#Task] Start
-- @param  self
-- @param  #NPC target The NPC to start the task on.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Starts the AI task as an NPC method.
-- @function [parent=#Task] Start_FName
-- @param  self
-- @param  #NPC target The NPC to start the task on.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- A list of functions available inside a TOOL. TOOLs are the Sandbox tools and
-- they are available only in Sandbox and Sandbox derived gamemodes.
-- @type Tool

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Clears all objects previously set with **Tool:SetObject**.
-- @function [parent=#Tool] ClearObjects
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves a physics bone number previously stored using **Tool:SetObject**.
-- @function [parent=#Tool] GetBone
-- @param  self
-- @param  #number id The id of the object which was set in **Tool:SetObject**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Attempts to grab a clientside tool ConVar.
-- @function [parent=#Tool] GetClientInfo
-- @param  self
-- @param  #string name Name of the convar to retrieve. The function will automatically add the "mytoolfilename_" part to it.
-- @return #string The value of the requested ConVar.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Attempts to grab a clientside tool ConVar.
-- @function [parent=#Tool] GetClientNumber
-- @param  self
-- @param  #string name Name of the convar to retrieve. The function will automatically add the "mytoolfilename_" part to it.
-- @param  #number default The default value to return in case the lookup fails. _(Default: 0)_
-- @return #number The value of the requested ConVar.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Retrieves an Entity previously stored using **Tool:SetObject**.
-- @function [parent=#Tool] GetEnt
-- @param  self
-- @param  #number id The id of the object which was set in **Tool:SetObject**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the current operation of the tool set by **Tool:SetOperation**.
-- @function [parent=#Tool] GetOperation
-- @param  self
-- @return #number The current operation the tool is at.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the owner of this tool.
-- @function [parent=#Tool] GetOwner
-- @param  self
-- @return #Entity Player using the tool.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Attempts to grab a serverside tool ConVar. This will not do anything on
-- client, despite the function being defined shared.
-- @function [parent=#Tool] GetServerInfo
-- @param  self
-- @param  #string name Name of the convar to retrieve. The function will automatically add the "mytoolfilename_" part to it.
-- @return #string The value of the requested ConVar.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the current stage of the tool set by **Tool:SetStage**.
-- @function [parent=#Tool] GetStage
-- @param  self
-- @return #number The current stage of the current operation the tool is at.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the amount of stored objects (Entitys) the tool has.
-- @function [parent=#Tool] NumObjects
-- @param  self
-- @return #number The amount of stored objects, or **Tool:GetStage** clientide.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Stores an Entity for later use in the tool.
-- @function [parent=#Tool] SetObject
-- @param  self
-- @param  #number id The id of the object to store.
-- @param  #Entity ent The entity to store.
-- @param  #Vector pos The position to store.
-- 
-- **Note**: _This position is in global space and is internally converted to local space relative to the object,
-- so when you retrieve it later it will be corrected to the object's new position._
-- @param  #PhysObj phys The physics object to store.
-- @param  #number bone The hit bone to store.
-- @param  #Vector norm The hit normal to store.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the current operation of the tool. Does nothing clientside. See also **Tool:SetStage**.
-- Operations and stages work as follows:
-- 
-- * Operation 1
--  * Stage 1
--  * Stage 2
--  * Stage 3
-- * Operation 2
--  * Stage 1
--  * Stage 2
--  * Stage ...
-- @function [parent=#Tool] SetOperation
-- @param  self
-- @param  #number operation The new operation ID to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the current stage of the tool. Does nothing clientside. See also **Tool:SetOperation**.
-- @function [parent=#Tool] SetStage
-- @param  self
-- @param  #number stage The new stage to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- List of all possible functions to manipulate matrices. This object can be
-- created by **Matrix**.
-- @type VMatrix

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the absolute rotation of the matrix.
-- @function [parent=#VMatrix] GetAngles
-- @param  self
-- @return #Angle Absolute rotation of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a specific field in the matrix.
-- @function [parent=#VMatrix] GetField
-- @param  self
-- @param  #number row Row of the field whose value is to be retrieved, from 1 to 4.
-- @param  #number column Column of the field whose value is to be retrieved, from 1 to 4.
-- @return #number The value of the specified field.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the forward direction of the matrix. ie. The first column of the matrix,
-- excluding the w coordinate.
-- @function [parent=#VMatrix] GetForward
-- @param  self
-- @return #Vector The forward direction of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an inverted matrix without modifying the original matrix. Inverting
-- the matrix will fail if its determinant is 0 or close to 0. (ie. its "scale"
-- in any direction is 0.) See also **VMatrix:GetInverseTR**.
-- @function [parent=#VMatrix] GetInverse
-- @param  self
-- @return #VMatrix The inverted matrix if possible, nil otherwise

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an inverted matrix without modifying the original matrix. This
-- function will not fail, but only works correctly on matrices that contain
-- only translation and/or rotation. Using this function on a matrix with
-- modified scale may return an incorrect inverted matrix.  
-- To get the inverse of a matrix that contains other modifications, see **VMatrix:GetInverse**.
-- @function [parent=#VMatrix] GetInverseTR
-- @param  self
-- @return #VMatrix The inverted matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the right direction of the matrix. ie. The second column of the matrix,
-- negated, excluding the w coordinate.
-- @function [parent=#VMatrix] GetRight
-- @param  self
-- @return #Vector The right direction of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the absolute scale of the matrix.
-- @function [parent=#VMatrix] GetScale
-- @param  self
-- @return #Vector Absolute scale of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the absolute translation of the matrix.
-- @function [parent=#VMatrix] GetTranslation
-- @param  self
-- @return #Vector Absolute translation of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the up direction of the matrix. ie. The third column of the matrix,
-- excluding the w coordinate.
-- @function [parent=#VMatrix] GetUp
-- @param  self
-- @return #Vector The up direction of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Initializes the matrix as Identity matrix.
-- @function [parent=#VMatrix] Identity
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Inverts the matrix. Inverting the matrix will fail if its determinant is 0
-- or close to 0. (ie. its "scale" in any direction is 0.) If the matrix cannot
-- be inverted, it does not get modified. See also **VMatrix:InvertTR**.
-- @function [parent=#VMatrix] Invert
-- @param  self
-- @return #boolean Whether the matrix was inverted or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Inverts the matrix. This function will not fail, but only works correctly on
-- matrices that contain only translation and/or rotation. Using this function
-- on a matrix with modified scale may return an incorrect inverted matrix. To
-- invert a matrix that contains other modifications, see **VMatrix:Invert**.
-- @function [parent=#VMatrix] InvertTR
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the matrix is equal to Identity matrix or not.
-- @function [parent=#VMatrix] IsIdentity
-- @param  self
-- @return #boolean Is the matrix an Identity matrix or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the matrix is a rotation matrix or not. Technically it
-- checks if the forward, right and up vectors are orthogonal and normalized.
-- @function [parent=#VMatrix] IsRotationMatrix
-- @param  self
-- @return #boolean Is the matrix a rotation matrix or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Rotates the matrix by the given angle. Postmultiplies the matrix by a
-- rotation matrix (A = AR).
-- @function [parent=#VMatrix] Rotate
-- @param  self
-- @param  #Angle rotation Rotation.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Scales the matrix by the given vector. Postmultiplies the matrix by a
-- scaling matrix (A = AS).
-- @function [parent=#VMatrix] Scale
-- @param  self
-- @param  #Vector scale Vector to scale with matrix with.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Scales the absolute translation with the given value.
-- @function [parent=#VMatrix] ScaleTranslation
-- @param  self
-- @param  #number scale Value to scale the translation with.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Copies values from the given matrix object.
-- @function [parent=#VMatrix] Set
-- @param  self
-- @param  #VMatrix src The matrix to copy values from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the absolute rotation of the matrix.
-- @function [parent=#VMatrix] SetAngles
-- @param  self
-- @param  #Angle angle New angles.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets a specific field in the matrix.
-- @function [parent=#VMatrix] SetField
-- @param  self
-- @param  #number row Row of the field to be set, from 1 to 4.
-- @param  #number column Column of the field to be set, from 1 to 4.
-- @param  #number value The value to set in that field.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the forward direction of the matrix. ie. The first column of the matrix,
-- excluding the w coordinate.
-- @function [parent=#VMatrix] SetForward
-- @param  self
-- @param  #Vector forward The forward direction of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the right direction of the matrix. ie. The second column of the matrix,
-- negated, excluding the w coordinate.
-- @function [parent=#VMatrix] SetRight
-- @param  self
-- @param  #Vector forward The right direction of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Modifies the scale of the matrix while preserving the rotation and translation.
-- @function [parent=#VMatrix] SetScale
-- @param  self
-- @param  #Vector scale The scale to set.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the absolute translation of the matrix.
-- @function [parent=#VMatrix] SetTranslation
-- @param  self
-- @param  #Vector translation New translation.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the up direction of the matrix. ie. The third column of the matrix,
-- excluding the w coordinate.
-- @function [parent=#VMatrix] SetUp
-- @param  self
-- @param  #Vector forward The up direction of the matrix.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Converts the matrix to a 4x4 table. See **Matrix** function.
-- @function [parent=#VMatrix] ToTable
-- @param  self
-- @return #table The 4x4 table.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Translates the matrix by the given vector aka. adds the vector to the
-- translation. Postmultiplies the matrix by a translation matrix (A = AT).
-- @function [parent=#VMatrix] Translate
-- @param  self
-- @param  #Vector translation Vector to translate the matrix by.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- List of all possible functions to manipulate vectors. Created by Vector &
-- many more functions.
-- @type Vector
-- @field #number x The X component of the vector.
-- @field #number y The Y component of the vector.
-- @field #number z The Z component of the vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds the values of the argument vector to the orignal vector. This functions
-- the same as vector1 + vector2 without creating a new vector object, skipping
-- object construction and garbage collection.
-- @function [parent=#Vector] Add
-- @param  self
-- @param  #Vector vector The vector to add.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an angle representing the normal of the vector.
-- @function [parent=#Vector] Angle
-- @param  self
-- @return #Angle The angle/direction of the vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the angle of the vector, but instead of assuming that up is
-- Vector(0,0,1). (Like **Vector:Angle** does) you can specify which direction is
-- 'up' for the angle.
-- @function [parent=#Vector] AngleEx
-- @param  self
-- @param  #Vector up The up direction vector
-- @return #Angle The angle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Calculates the cross product of this vector and the passed one. The cross
-- product of two vectors is a 3-dimensional vector with a direction
-- perpendicular (at right angles) to both of them (according to the right-hand
-- rule), and magnitude equal to the area of parallelogram they span. This is
-- defined as the product of the magnitudes, the sine of the angle between them,
-- and unit (normal) vector n defined by the right-hand rule:
-- a × b = |a| |b| sin(θ) n̂
-- where a and b are vectors, and n̂ is a unit vector (magnitude of 1)
-- perpendicular to both.
-- @function [parent=#Vector] Cross
-- @param  self
-- @param  #Vector otherVector Vector to calculate the cross product with.
-- @return #Vector The cross product of the two vectors.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the pythagorean distance between the vector and the other vector.
-- This is a relatively expensive process since it uses the square root. It is
-- recommended that you use **Vector:DistToSqr** whenever possible.
-- @function [parent=#Vector] Distance
-- @param  self
-- @param  #Vector otherVector The vector to get the distance to.
-- @return #number Distance between the vectors.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the squared distance of 2 vectors, this is faster than
-- **Vector:Distance** as calculating the square root is an expensive process.
-- @function [parent=#Vector] DistToSqr
-- @param  self
-- @param  #Vector otherVec The vector to calculate the distance to.
-- @return #number Squared distance to the vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Divide the vector by the given number, that means x, y and z are divided by
-- that value. This will change the value of the original vector.
-- @function [parent=#Vector] Div
-- @param  self
-- @param  #number divisor The value to divide the vector with.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the dot product of this vector and the passed one. The dot product
-- of two vectors is the product of their magnitudes (lengths), and the cosine
-- of the angle between them:
-- a · b = |a| |b| cos(θ)
-- where a and b are vectors. See **Vector:Length** for obtaining magnitudes.
-- A dot product returns just the cosine of the angle if both vectors are
-- normalized, and zero if the vectors are at right angles to each other.
-- @function [parent=#Vector] Dot
-- @param  self
-- @param  #Vector otherVector The vector to calculate the dot product with.
-- @return #number The dot product between the two vectors.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns a normalized version of the vector. Normalized means vector with
-- same direction but with length of 1. This does not affect the vector you
-- call it on; to do this, use **Vector:Normalize**.
-- @function [parent=#Vector] GetNormalized
-- @param  self
-- @return #Vector Normalized version of the vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if the vector is equal to another vector with the given tolerance.
-- @function [parent=#Vector] IsEqualTol
-- @param  self
-- @param  #Vector compare The vector to compare to.
-- @param  #number tolerance The tolerance range.
-- @return #boolean Are the vectors equal or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks whenever all fields of the vector are 0.
-- @function [parent=#Vector] IsZero
-- @param  self
-- @return #boolean Do all fields of the vector equal 0 or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the Euclidean length of the vector: sqrt(x^2 + y^2 + z^2)
-- @function [parent=#Vector] Length
-- @param  self
-- @return #number Length of the vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the length of the vector in two dimensions, without the Z axis.
-- @function [parent=#Vector] Length2D
-- @param  self
-- @return #number Length of the vector in two dimensions, sqrt(x^2 + y^2).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the squared length of the vectors x and y value, x^2 + y^2. This is
-- faster than **Vector:Length2D** as calculating the square root is an expensive process.
-- @function [parent=#Vector] Length2DSqr
-- @param  self
-- @return #number Squared length of the vector in two dimensions.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the squared length of the vector, x^2 + y^2 + z^2. This is faster than
-- **Vector:Length** as calculating the square root is an expensive process.
-- @function [parent=#Vector] LengthSqr
-- @param  self
-- @return #number Squared length of the vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Scales the vector by the given number, that means x, y and z are multiplied
-- by that value.
-- @function [parent=#Vector] Mul
-- @param  self
-- @param  #number multiplier The value to scale the vector with.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Normalizes the given vector. This changes the vector you call it on, if you want
-- to return a normalized copy without affecting the original, use **Vector:GetNormalized**.
-- @function [parent=#Vector] Normalize
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Rotates a vector by the given angle. Doesn't return anything, but rather
-- changes the original vector.
-- @function [parent=#Vector] Rotate
-- @param  self
-- @param  #Angle rotation The angle to rotate the vector by.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Copies the values from the second vector to the first vector.
-- @function [parent=#Vector] Set
-- @param  self
-- @param  #Vector vector The vector to copy from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Substracts the values of the second vector from the orignal vector, this
-- function can be used to avoid garbage collection.
-- @function [parent=#Vector] Sub
-- @param  self
-- @param  #Vector vector The other vector.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Translates the vector normalized vector (length is 1) into a Color structure.
-- 
-- * x * 255 -> r
-- * y * 255 -> g
-- * z * 255 -> b
-- @function [parent=#Vector] ToColor
-- @param  self
-- @return #table The created **Color structure**.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns where on the screen the specified position vector would appear. A
-- related function is gui.ScreenToVector, which converts a 2D coordinate to a
-- 3D direction.
-- 
-- **Note**: _Should be called from a 3D rendering environment or after
-- **cam.Start3D** or it may not work correctly._
-- @function [parent=#Vector] ToScreen
-- @param  self
-- @return #table The created **ToScreenData structure**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whenever the given vector is in a box created by the 2 other vectors.
-- @function [parent=#Vector] WithinAABox
-- @param  self
-- @param  #Vector boxStart The first vector.
-- @param  #Vector boxEnd The second vector.
-- @return #boolean Is the vector in the box or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets x, y and z to 0.
-- @function [parent=#Vector] Zero
-- @param  self

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- @type Vehicle
-- @extends Entity

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the remaining boosting time left.
-- @function [parent=#Vehicle] BoostTimeLeft
-- @param  self
-- @return #number The remaining boosting time left.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#Vehicle] CheckExitPoint
-- @param  self
-- @param  #number yaw
-- @param  #number distance
-- @param  #Vector endPoint
-- @return #boolean

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets whether the engine is enabled or disabled, ex: can be started or not.
-- @function [parent=#Vehicle] EnableEngine
-- @param  self
-- @param  #boolean enable Enable or disable the engine.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns information about the ammo of the vehicle.
-- @function [parent=#Vehicle] GetAmmo
-- @param  self
-- @return #number, #number, #number Ammo type, clip size and count.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns third person camera distance.
-- @function [parent=#Vehicle] GetCameraDistance
-- @param  self
-- @return #number Camera distance.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gets the driver of the vehicle, returns NULL if no driver is present.
-- @function [parent=#Vehicle] GetDriver
-- @param  self
-- @return #Entity The driver of the vehicle.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current speed of the vehicle in Half-Life Hammer Units (in/s).
-- Same as **Entity:GetVelocity** + **Vector:Length**.
-- @function [parent=#Vehicle] GetHLSpeed
-- @param  self
-- @return #number The speed of the vehicle.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the max speed of the vehicle in MPH.
-- @function [parent=#Vehicle] GetMaxSpeed
-- @param  self
-- @return #number The max speed of the vehicle in MPH.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns some info about the vehicle.
-- @function [parent=#Vehicle] GetOperatingParams
-- @param  self
-- @return #table The operating params. See **OperatingParams structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Gets the passenger of the vehicle, returns NULL if no drivers is present.
-- @function [parent=#Vehicle] GetPassenger
-- @param  self
-- @param  #number passenger The index of the passenger.
-- @return #Entity The passenger.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the seat position and angle of a given passenger seat.
-- @function [parent=#Vehicle] GetPassengerSeatPoint
-- @param  self
-- @param  #number role The passenger role. (1 is the driver).
-- @return #Vector, #Angle The seat position and angle.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current RPM of the vehicle. This value is fake and doesn't
-- actually affect the vehicle movement.
-- @function [parent=#Vehicle] GetRPM
-- @param  self
-- @return #number The RPM.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current speed of the vehicle in MPH.
-- @function [parent=#Vehicle] GetSpeed
-- @param  self
-- @return #number The speed of the vehicle in MPH.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current steering of the vehicle.
-- @function [parent=#Vehicle] GetSteering
-- @param  self
-- @return #number The current steering of the vehicle.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the maximum steering degree of the vehicle.
-- @function [parent=#Vehicle] GetSteeringDegrees
-- @param  self
-- @return #number The maximum steering degree of the vehicle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns if vehicle has thirdperson mode enabled or not.
-- @function [parent=#Vehicle] GetThirdPersonMode
-- @param  self
-- @return #boolean Returns true if third person mode enabled, false otherwise.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the current throttle of the vehicle.
-- @function [parent=#Vehicle] GetThrottle
-- @param  self
-- @return #number The current throttle of the vehicle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the vehicle class name. This is only useful for Sandbox spawned
-- vehicles or any vehicle that properly sets the vehicle class with **Vehicle:SetVehicleClass**.
-- @function [parent=#Vehicle] GetVehicleClass
-- @param  self
-- @return #string The class name of the vehicle.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the vehicle parameters of given vehicle.
-- @function [parent=#Vehicle] GetVehicleParams
-- @param  self
-- @return #table The vehicle parameters. See **VehicleParams structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the view position and forward angle of a given passenger seat.
-- @function [parent=#Vehicle] GetVehicleViewPosition
-- @param  self
-- @param  #number role The passenger role. _(Default: 0)_
-- 0 is the driver. This parameter seems to be ignored by the game engine and is therefore optional.
-- @return #Vector, #Angle, #number The view position, angle, and field of view.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the PhysObj of given wheel.
-- @function [parent=#Vehicle] GetWheel
-- @param  self
-- @param  #number wheel The wheel to retrieve.
-- @return #PhysObj The wheel.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the base wheel height.
-- @function [parent=#Vehicle] GetWheelBaseHeight
-- @param  self
-- @param  #number wheel The wheel to get the base wheel height of.
-- @return #number The base wheel height.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the wheel contact point.
-- @function [parent=#Vehicle] GetWheelContactPoint
-- @param  self
-- @param  #number wheel The wheel to check.
-- @return #Vector, #number, #boolean The contact position, surface properties ID, and whether the wheel is on the ground or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the wheel count of the vehicle.
-- @function [parent=#Vehicle] GetWheelCount
-- @param  self
-- @return #number The amount of wheels.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns the total wheel height.
-- @function [parent=#Vehicle] GetWheelTotalHeight
-- @param  self
-- @param  #number wheel The wheel to get the base wheel height of.
-- @return #number The total wheel height.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this vehicle has boost at all.
-- @function [parent=#Vehicle] HasBoost
-- @param  self
-- @return #boolean Whether this vehicle has boost at all.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this vehicle has a brake pedal. See **Vehicle:SetHasBrakePedal**.
-- @function [parent=#Vehicle] HasBrakePedal
-- @param  self
-- @return #boolean Whether this vehicle has a brake pedal or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this vehicle is currently boosting or not.
-- @function [parent=#Vehicle] IsBoosting
-- @param  self
-- @return #boolean Whether this vehicle is currently boosting or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the engine is enabled or not, ex: whether it can be started.
-- @function [parent=#Vehicle] IsEngineEnabled
-- @param  self
-- @return #boolean Whether the engine is enabled.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether the engine is started or not.
-- @function [parent=#Vehicle] IsEngineStarted
-- @param  self
-- @return #boolean Whether the engine is started or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns true if the vehicle object is a valid or not. This will return false
-- when Vehicle functions are not usable on the vehicle.
-- @function [parent=#Vehicle] IsValidVehicle
-- @param  self
-- @return #boolean Is the vehicle a valid vehicle or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Returns whether this vehicle's engine is underwater or not. (Internally the
-- attachment point "engine" or "vehicle_engine" is checked)
-- @function [parent=#Vehicle] IsVehicleBodyInWater
-- @param  self
-- @return #boolean Whether this vehicle's engine is underwater or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#Vehicle] ReleaseHandbrake
-- @param  self

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the boost. It is possible that this function does not work while the
-- vehicle has a valid driver in it.
-- @function [parent=#Vehicle] SetBoost
-- @param  self
-- @param  #number boost The new boost value.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the third person camera distance of the vehicle.
-- @function [parent=#Vehicle] SetCameraDistance
-- @param  self
-- @param  #number distance Camera distance to set to.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- 
-- @function [parent=#Vehicle] SetHandbrake
-- @param  self
-- @param  #boolean handbrake

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets whether this vehicle has a brake pedal.
-- @function [parent=#Vehicle] SetHasBrakePedal
-- @param  self
-- @param  #boolean brakePedal Whether this vehicle has a brake pedal.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets maximum reverse throttle.
-- @function [parent=#Vehicle] SetMaxReverseThrottle
-- @param  self
-- @param  #number maxRevThrottle The new maximum throttle. This number must be negative.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets maximum forward throttle.
-- @function [parent=#Vehicle] SetMaxThrottle
-- @param  self
-- @param  #number maxThrottle The new maximum throttle.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets spring length of given wheel.
-- @function [parent=#Vehicle] SetSpringLength
-- @param  self
-- @param  #number wheel The wheel to change spring length of.
-- @param  #number length The new spring length.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the steering of the vehicle.
-- @function [parent=#Vehicle] SetSteering
-- @param  self
-- @param  #number front Angle of the front wheels (-1 to 1).
-- @param  #number rear Angle of the rear wheels (-1 to 1).

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the maximum steering degrees of the vehicle.
-- @function [parent=#Vehicle] SetSteeringDegrees
-- @param  self
-- @param  #number steeringDegrees The new maximum steering degree.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the third person mode state.
-- @function [parent=#Vehicle] SetThirdPersonMode
-- @param  self
-- @param  #boolean enable Enable or disable the third person mode for this vehicle.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the throttle of the vehicle. It is possible that this function does not
-- work with a valid driver in it.
-- @function [parent=#Vehicle] SetThrottle
-- @param  self
-- @param  #number throttle The new throttle.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- 
-- Sets the vehicle class name.
-- @function [parent=#Vehicle] SetVehicleClass
-- @param  self
-- @param  #string class The vehicle class name to set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets whether the entry or exit camera animation should be played or not.
-- @function [parent=#Vehicle] SetVehicleEntryAnim
-- @param  self
-- @param  #boolean bOn Whether the entry or exit camera animation should be played or not.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets the vehicle parameters for given vehicle.
-- 
-- **Note**: _Not all variables from the VehicleParams structure can be set._
-- @function [parent=#Vehicle] SetVehicleParams
-- @param  self
-- @param  #table params The new new vehicle parameters. See **VehicleParams structure**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sets friction of given wheel. This function may be broken...
-- @function [parent=#Vehicle] SetWheelFriction
-- @param  self
-- @param  #number wheel The wheel to change the friction of.
-- @param  #number friction The new friction to set.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Starts or stops the engine.
-- @function [parent=#Vehicle] StartEngine
-- @param  self
-- @param  #boolean start True to start, false to stop.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- @type Weapon
-- @extends Entity

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the weapon allows to being switched from when a better
-- (**Weapon:GetWeight**) weapon is being picked up.
-- @function [parent=#Weapon] AllowsAutoSwitchFrom
-- @param  self
-- @return #boolean Whether the weapon allows to being switched from.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the weapon allows to being switched to when a better
-- (**Weapon:GetWeight**) weapon is being picked up.
-- @function [parent=#Weapon] AllowsAutoSwitchTo
-- @param  self
-- @return #boolean Whether the weapon allows to being switched to.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Calls a SWEP function on client.
-- 
-- **Warning**: _This uses the usermessage library internally, because of that,
-- the combined length of the arguments of this function may not exceed 254
-- bytes/characters or the function will cease to function!_
-- @function [parent=#Weapon] CallOnClient
-- @param  self
-- @param  #string functionName Name of function to call.
-- If you want to call **SWEP:MyFunc**() on client, you type in "MyFunc".
-- @param  #string arguments Arguments for the function, separated by spaces. _(Default: "")_
-- 
-- **Note**: _Only the second argument is passed as argument and must be a string._

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns how much primary ammo is in the magazine.
-- @function [parent=#Weapon] Clip1
-- @param  self
-- @return #number The amount of primary ammo in the magazine.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns how much secondary ammo is in magazine.
-- @function [parent=#Weapon] Clip2
-- @param  self
-- @return #number The amount of secondary ammo in the magazine.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Forces the weapon to reload while playing given animation.
-- @function [parent=#Weapon] DefaultReload
-- @param  self
-- @param  #number act Sequence to use as reload animation. Uses the **ACT\_ Enums**.
-- @return #boolean Did reloading actually take place.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the sequence enumeration number that the weapon is playing.
-- @function [parent=#Weapon] GetActivity
-- @param  self
-- @return #number Current activity, see **ACT\_ Enums**.
-- Returns 0 if the weapon doesn't have active sequence.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the hold type of the weapon.
-- @function [parent=#Weapon] GetHoldType
-- @param  self
-- @return #string The hold type of the weapon.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns maximum primary clip size.
-- @function [parent=#Weapon] GetMaxClip1
-- @param  self
-- @return #number Maximum primary clip size.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns maximum secondary clip size.
-- @function [parent=#Weapon] GetMaxClip2
-- @param  self
-- @return #number Maximum secondary clip size.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the next time the weapon can primary fire. (Can call **Weapon:PrimaryAttack**)
-- @function [parent=#Weapon] GetNextPrimaryFire
-- @param  self
-- @return #number The time, relative to **CurTime**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the next time the weapon can secondary fire. (Can call **Weapon:SecondaryAttack**)
-- @function [parent=#Weapon] GetNextSecondaryFire
-- @param  self
-- @return #number The time, relative to **CurTime**.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the primary ammo type of the given weapon.
-- @function [parent=#Weapon] GetPrimaryAmmoType
-- @param  self
-- @return #number The ammo type ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the non-internal name of the weapon, that should be for displaying.
-- 
-- **Note**: _If that returns an untranslated message (#HL2\_XX), use
-- **language.GetPhrase** to see the "nice" name._
-- 
-- **Note**: _If **SWEP.PrintName** is not set in the Weapon or the Weapon Base
-- then "<MISSING SWEP PRINT NAME>" will be returned._
-- @function [parent=#Weapon] GetPrintName
-- @param  self
-- @return #string The "nice" name of the weapon.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Gets the ammo type of the given weapons secondary fire.
-- @function [parent=#Weapon] GetSecondaryAmmoType
-- @param  self
-- @return #number The secondary ammo type ID.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the slot of the weapon. (slot numbers start from 0)
-- @function [parent=#Weapon] GetSlot
-- @param  self
-- @return #number The slot of the weapon.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns slot position of the weapon.
-- @function [parent=#Weapon] GetSlotPos
-- @param  self
-- @return #number The slot position of the weapon.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the view model of the weapon.
-- @function [parent=#Weapon] GetWeaponViewModel
-- @param  self
-- @return #string The view model of the weapon.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the world model of the weapon.
-- @function [parent=#Weapon] GetWeaponWorldModel
-- @param  self
-- @return #string The world model of the weapon.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the "weight" of the weapon, which is used when deciding which Weapon
-- is better by the engine.
-- @function [parent=#Weapon] GetWeight
-- @param  self
-- @return #number The weapon "weight".

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the weapon has ammo left or not. It will return false when
-- there's no ammo left in the magazine and when there's no reserve ammo left.
-- 
-- **Note**: _This will return true for weapons like crowbar, gravity gun, etc._
-- @function [parent=#Weapon] HasAmmo
-- @param  self
-- @return #boolean Whether the weapon has ammo or not.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Returns whether the weapon is carried by the local player.
-- @function [parent=#Weapon] IsCarriedByLocalPlayer
-- @param  self
-- @return #boolean Is the weapon is carried by the local player or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Checks if the weapon is a SWEP or a built-in weapon.
-- @function [parent=#Weapon] IsScripted
-- @param  self
-- @return #boolean Returns true if weapon is scripted (SWEP), false if not (a built-in HL2 weapon).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns whether the weapon is visible. The term visibility is not exactly
-- what gets checked here, first it checks if the owner is a player, then
-- checks if the active view model has EF_NODRAW flag NOT set.
-- @function [parent=#Weapon] IsWeaponVisible
-- @param  self
-- @return #boolean Is visible or not.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the time since this weapon last fired a bullet with
-- **Entity:FireBullets** in seconds. It is not networked.
-- @function [parent=#Weapon] LastShootTime
-- @param  self
-- @return #number The time in seconds when the last bullet was fired.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Forces weapon to play activity/animation.
-- @function [parent=#Weapon] SendWeaponAnim
-- @param  self
-- @param  #number act Activity to play. See the **ACT\_ Enums** (specifically ACT\_VM\_).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Lets you change the number of bullets in the given weapons primary clip.
-- @function [parent=#Weapon] SetClip1
-- @param  self
-- @param  #number ammo The amount of bullets the clip should contain.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Lets you change the number of bullets in the given weapons secondary clip.
-- @function [parent=#Weapon] SetClip2
-- @param  self
-- @param  #number ammo The amount of bullets the clip should contain.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the hold type of the weapon. This function also calls
-- **WEAPON:SetWeaponHoldType** and properly networks it to all clients.
-- 
-- **Note**: _This only works on scripted weapons._
-- @function [parent=#Weapon] SetHoldType
-- @param  self
-- @param  #string name Name of the hold type.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets the time since this weapon last fired in seconds. Used in conjunction
-- with **Weapon:LastShootTime**.
-- @function [parent=#Weapon] SetLastShootTime
-- @param  self
-- @param  #number time The time in seconds when the last time the weapon was fired. _(Default: CurTime())_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets when the weapon can fire again. Time should be based on **CurTime**.
-- @function [parent=#Weapon] SetNextPrimaryFire
-- @param  self
-- @param  #number time Time when player should be able to use primary fire again.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Sets when the weapon can alt-fire again. Time should be based on **CurTime**.
-- @function [parent=#Weapon] SetNextSecondaryFire
-- @param  self
-- @param  #number time Time when player should be able to use secondary fire again.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- This is the object passed to **usermessage.Hook** when a message is received. It
-- contains each value stored in the message in sequential order. You should
-- read values from it in the order you wrote them.
-- @type bf_read

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads an returns an angle object from the bitstream.
-- @function [parent=#bf_read] ReadAngle
-- @param  self
-- @return #Angle The read angle.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads 1 bit an returns a bool representing the bit.
-- @function [parent=#bf_read] ReadBool
-- @param  self
-- @return #boolean The read bit.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads a signed char and returns a number from -127 to 127 representing the
-- ascii value of that char.
-- @function [parent=#bf_read] ReadChar
-- @param  self
-- @return #number The read ascii value.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads a short representing an entity index and returns the matching entity handle.
-- @function [parent=#bf_read] ReadEntity
-- @param  self
-- @return #Entity The read entity.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads a 4 byte float from the bitstream and returns it.
-- @function [parent=#bf_read] ReadFloat
-- @param  self
-- @return #number The read float.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads a 4 byte long from the bitstream and returns it.
-- @function [parent=#bf_read] ReadLong
-- @param  self
-- @return #number The read int.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads a 2 byte short from the bitstream and returns it.
-- @function [parent=#bf_read] ReadShort
-- @param  self
-- @return #number The read short.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads a null terminated string from the bitstream.
-- @function [parent=#bf_read] ReadString
-- @param  self
-- @return #string The read string.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads a special encoded vector from the bitstream and returns it, this
-- function is not suitable to send normals.
-- @function [parent=#bf_read] ReadVector
-- @param  self
-- @return #Vector The read vector.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Reads a special encoded vector normal from the bitstream and returns it,
-- this function is not suitable to send vectors that represent a position.
-- @function [parent=#bf_read] ReadVectorNormal
-- @param  self
-- @return #Vector The read normalized vector.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Rewinds the bitstream so it can be read again.
-- @function [parent=#bf_read] Reset
-- @param  self


return nil
