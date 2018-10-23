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
-- @param  #number force The type the setter should force to, see **FORCE\_Enums**. _(Default: nil)_

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Defines a global entity class variable with an automatic value in order to
-- prevent collisions with other **CLASS\_Enums**. You should prefix your variable
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
-- @param  #number flags Concommand flags using **FCVAR\_Enums**.

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
-- @param  #number renderGroup The rendergroup of the entity, see **RENDERGROUP\_Enums**. _(Default: RENDERGROUP\_OTHER)_
-- @return #CSEnt Created client-side model. (C_BaseFlex)

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Creates a fully clientside ragdoll.
-- 
-- **Warning**: _Model must be precached with **util.PrecacheModel** on the server before usage._
-- @function [parent=#global] ClientsideRagdoll
-- @param  #string model The file path to the model.
-- @param  #number renderGroup The **RENDERGROUP\_Enums** to assign. _(Default: RENDER\_GROUP\_OPAQUE)_
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
-- @param  #number flags Flags of the convar, either as bitflag or as table. See **FCVAR\_Enums**. _(Default: FCVAR\_NONE)_
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
-- @param  #number partAttachment See **PATTACH\_Enums**.
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
-- its **PANEL:Think** hook and should call **Panel:ConVarChanged** when the panel's
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
-- @param  #number channel The sound channel, see **CHAN\_Enums**. _(Default: CHAN\_AUTO)_
-- @param  #number volume The volume of the sound, from 0 to 1. _(Default: 1)_
-- @param  #number soundLevel The sound level of the sound, see **SNDLVL\_Enums**. _(Default: 75)_
-- @param  #number soundFlags The flags of the sound, see **SND\_Enums**. _(Default: 0)_
-- @param  #number pitch The pitch of the sound, 0-255. _(Default: 100)_

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Emits the specified sound at the specified position.
-- @function [parent=#global] EmitSound
-- @param  #string soundName The sound to play.
-- @param  #Vector position The position to play at.
-- @param  #number entity The entity to emit the sound from. Must be **Entity:EntIndex**.
-- @param  #number channel The sound channel, see **CHAN\_Enums**. _(Default: CHAN\_AUTO)_
-- @param  #number volume The volume of the sound, from 0 to 1. _(Default: 1)_
-- @param  #number soundLevel The sound level of the sound, see **SNDLVL\_Enums**. _(Default: 75)_
-- @param  #number soundFlags The flags of the sound, see **SND\_Enums**. _(Default: 0)_
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
-- tables that can be retrieved with this function on **TYPE\_Enums**. The name in
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
-- _Client_ |  _Server_
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
-- @param  #number sizeMode Bitflag that influences the sizing of the render target, see **RT\_SIZE\_Enums**.
-- @param  #number depthMode Bitflag that determines the depth buffer usage of the render target **MATERIAL\_RT\_DEPTH\_Enums**.
-- @param  #number textureFlags Bitflag that configurates the texture, see **TEXTUREFLAGS\_Enums**.
-- @param  #number rtFlags Flags that controll the HDR behaviour of the render target, see **CREATERENDERTARGETFLAGS\_Enums**.
-- @param  #number imageFormat Image format, see **IMAGE\_FORMAT\_Enums**.
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
-- **Important**: _Engine functions (i.e. those not written in plain Lua) that
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
-- @param  #number attachType Attachment type using **PATTACH\_Enums**.
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
-- @param  #number type Which type of message should be sent to the players. See **HUD\_Enums**.
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
-- the error handler (i.e. sent to server console if clientside and
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
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Use **RunString** instead._
-- 
-- Alias of **RunString**.
-- @function [parent=#global] RunStringEx

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
-- _Client_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should be using **ScreenScale** instead._
-- 
-- Returns a number based on the Size argument and your screen's width. Alias
-- of **ScreenScale**.
-- @function [parent=#global] SScale
-- @param  #number Size The number you want to scale.
-- @return #number The scaled number.

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
-- @return #number The type ID of the variable. See the **TYPE\_Enums**.

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
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should use **IsUselessModel** instead._
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
-- @function [parent=#global] UTIL_IsUselessModel
-- @param  #string modelName The model name to be checked.
-- @return #boolean Whether or not the model is useless.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should use **IsValid** instead._
-- 
-- Returns if a panel is safe to use.
-- @function [parent=#global] ValidPanel
-- @param  #Panel panel The panel to validate.

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

return nil
