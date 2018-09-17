-------------------------------------------------------------------------------
-- Lua global variables.
-- The basic library provides some core functions to Lua.
-- All the preloaded module of Lua are declared here.
-- @module global

------------------------------------------------------------------------------
-- This library provides generic functions for coroutine manipulation.
-- This is a global variable which hold the preloaded @{coroutine} module.
-- @field[parent = #global] coroutine#coroutine coroutine preloaded module

------------------------------------------------------------------------------
-- The package library provides basic facilities for loading and building modules in Lua.
-- This is a global variable which hold the preloaded @{package} module.
-- @field[parent = #global] package#package package preloaded module

------------------------------------------------------------------------------
-- This library provides generic functions for string manipulation.
-- This is a global variable which hold the preloaded @{string} module.
-- @field[parent = #global] string#string string preloaded module

------------------------------------------------------------------------------
-- This library provides generic functions for table manipulation.
-- This is a global variable which hold the preloaded @{table} module.
-- @field[parent = #global] table#table table preloaded module

------------------------------------------------------------------------------
-- This library is an interface to the standard C math library.
-- This is a global variable which hold the preloaded @{math} module.
-- @field[parent = #global] math#math math preloaded module

------------------------------------------------------------------------------
-- The I/O library provides function for file manipulation.
-- This is a global variable which hold the preloaded @{io} module.
-- @field[parent = #global] io#io io preloaded module

------------------------------------------------------------------------------
-- Operating System Facilities.
-- This is a global variable which hold the preloaded @{os} module.
-- @field[parent = #global] os#os os preloaded module

------------------------------------------------------------------------------
-- The Debug Library.
-- This is a  global variable which hold the preloaded @{debug} module.
-- @field[parent = #global] debug#debug debug preloaded module

-------------------------------------------------------------------------------
-- Issues an error when the value of its argument `v` is false (i.e.,
-- **nil** or **false**); otherwise, returns all its arguments. `message` is an error
-- message; when absent, it defaults to *"assertion failed!"*.
-- @function [parent=#global] assert
-- @param v if this argument is false an error is issued.
-- @param #string message an error message. defaults value is *"assertion failed"*.
-- @return All its arguments.

-------------------------------------------------------------------------------
-- This function is a generic interface to the garbage collector.
-- It performs different functions according to its first argument, `opt`:
--
--   * **"stop":** stops the garbage collector.
--   * **"restart":** restarts the garbage collector.
--   * **"collect":** performs a full garbage-collection cycle.
--   * **"count":** returns the total memory in use by Lua (in Kbytes).
--   * **"step":** performs a garbage-collection step. The step "size" is controlled
--       by `arg` (larger values mean more steps) in a non-specified way. If you
--       want to control the step size you must experimentally tune the value of
--      `arg`. Returns true if the step finished a collection cycle.
--   * **"setpause":** sets `arg` as the new value for the *pause* of the collector.
--       Returns the previous value for *pause*.
--   * **"setstepmul":** sets `arg` as the new value for the *step multiplier*
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
-- This is a global variable which hold the preloaded @{GWEN} module.
-- @field[parent = #global] GWEN#GWEN GWEN preloaded module

------------------------------------------------------------------------------
-- This library is used internally by Garry's Mod to help keep track of
-- achievement progress and unlock the appropriate achievements once a
-- certain number is reached.
-- 
-- However, this library can also be used by anyone else to forcefully
-- unlock certain achievements.
-- This is a global variable which hold the preloaded @{achievements} module.
-- @field[parent = #global] achievements#achievements achievements preloaded module

------------------------------------------------------------------------------
-- The ai library.
-- This is a global variable which hold the preloaded @{ai} module.
-- @field[parent = #global] ai#ai ai preloaded module

------------------------------------------------------------------------------
-- Allows you to set up a schedule for NPCs to follow.
-- This lets you dictate their actions.
-- This is a global variable which hold the preloaded @{ai_schedule} module.
-- @field[parent = #global] ai_schedule#ai_schedule ai_schedule preloaded module

------------------------------------------------------------------------------
-- Used to create tasks for scripted NPCs.
-- This is a global variable which hold the preloaded @{ai_task} module.
-- @field[parent = #global] ai_task#ai_task ai_task preloaded module

------------------------------------------------------------------------------
-- The baseclass library.
-- This is a global variable which hold the preloaded @{baseclass} module.
-- @field[parent = #global] baseclass#baseclass baseclass preloaded module

------------------------------------------------------------------------------
-- The bitwise library contains useful functions for bitwise operations.
-- This is a global variable which hold the preloaded @{bit} module.
-- @field[parent = #global] bit#bit bit preloaded module

------------------------------------------------------------------------------
-- This directs all drawing to be done to a certain 2D or 3D plane or
-- position, until the corresponding "End" function is called.
-- 
-- The matrix functions exist, but are mostly unusable unless you're
-- familiar with the source engine's layout for each aspect.
-- This is a global variable which hold the preloaded @{cam} module.
-- @field[parent = #global] cam#cam cam preloaded module

------------------------------------------------------------------------------
-- The library to interface with the default chatbox.
-- This is a global variable which hold the preloaded @{chat} module.
-- @field[parent = #global] chat#chat chat preloaded module

------------------------------------------------------------------------------
-- The cleanup library allows you to control what happens to custom entities
-- when the clean-up buttons are pressed in the Utilities tab of the Spawn
-- menu (default Q).
-- This is a global variable which hold the preloaded @{cleanup} module.
-- @field[parent = #global] cleanup#cleanup cleanup preloaded module

------------------------------------------------------------------------------
-- The concommand library is used to create console commands which can be used
-- to network (basic) information & events between the client and the server.
-- This is a global variable which hold the preloaded @{concommand} module.
-- @field[parent = #global] concommand#concommand concommand preloaded module

------------------------------------------------------------------------------
-- The constraint library allows you to control the constraint system built
-- into the physics engine (rope, weld, ballsockets, etc).
-- This is a global variable which hold the preloaded @{constraint} module.
-- @field[parent = #global] constraint#constraint constraint preloaded module

------------------------------------------------------------------------------
-- The construct library is used to control the physical properties of entities.
-- This is a global variable which hold the preloaded @{construct} module.
-- @field[parent = #global] construct#construct construct preloaded module

------------------------------------------------------------------------------
-- Retrieves the control panel for a given stool in the Q menu.
-- This is a global variable which hold the preloaded @{controlpanel} module.
-- @field[parent = #global] controlpanel#controlpanel controlpanel preloaded module

------------------------------------------------------------------------------
-- Used to store permanent variables/settings on clients that will persist
-- between servers.
-- This is a global variable which hold the preloaded @{cookie} module.
-- @field[parent = #global] cookie#cookie cookie preloaded module

------------------------------------------------------------------------------
-- The cvars library allows you to control what happens when a cvar (console
-- variable) is changed.
-- This is a global variable which hold the preloaded @{cvars} module.
-- @field[parent = #global] cvars#cvars cvars preloaded module

------------------------------------------------------------------------------
-- The debugoverlay library is mainly useful for 3D debugging, it can be used
-- to draw shapes on the screen for debug purposes.
-- This is a global variable which hold the preloaded @{debugoverlay} module.
-- @field[parent = #global] debugoverlay#debugoverlay debugoverlay preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{derma} module.
-- @field[parent = #global] derma#derma derma preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{dragndrop} module.
-- @field[parent = #global] dragndrop#dragndrop dragndrop preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{draw} module.
-- @field[parent = #global] draw#draw draw preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{drive} module.
-- @field[parent = #global] drive#drive drive preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{duplicator} module.
-- @field[parent = #global] duplicator#duplicator duplicator preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{effects} module.
-- @field[parent = #global] effects#effects effects preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{engine} module.
-- @field[parent = #global] engine#engine engine preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{ents} module.
-- @field[parent = #global] ents#ents ents preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{file} module.
-- @field[parent = #global] file#file file preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{frame_blend} module.
-- @field[parent = #global] frame_blend#frame_blend frame_blend preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{game} module.
-- @field[parent = #global] game#game game preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{gameevent} module.
-- @field[parent = #global] gameevent#gameevent gameevent preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{gamemode} module.
-- @field[parent = #global] gamemode#gamemode gamemode preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{gmod} module.
-- @field[parent = #global] gmod#gmod gmod preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{gmsave} module.
-- @field[parent = #global] gmsave#gmsave gmsave preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{gui} module.
-- @field[parent = #global] gui#gui gui preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{halo} module.
-- @field[parent = #global] halo#halo halo preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{hammer} module.
-- @field[parent = #global] hammer#hammer hammer preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{hook} module.
-- @field[parent = #global] hook#hook hook preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{http} module.
-- @field[parent = #global] http#http http preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{input} module.
-- @field[parent = #global] input#input input preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{jit} module.
-- @field[parent = #global] jit#jit jit preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{killicon} module.
-- @field[parent = #global] killicon#killicon killicon preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{language} module.
-- @field[parent = #global] language#language language preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{list} module.
-- @field[parent = #global] list#list list preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{markup} module.
-- @field[parent = #global] markup#markup markup preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{matproxy} module.
-- @field[parent = #global] matproxy#matproxy matproxy preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{menu} module.
-- @field[parent = #global] menu#menu menu preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{menubar} module.
-- @field[parent = #global] menubar#menubar menubar preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{mesh} module.
-- @field[parent = #global] mesh#mesh mesh preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{motionsensor} module.
-- @field[parent = #global] motionsensor#motionsensor motionsensor preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{navmesh} module.
-- @field[parent = #global] navmesh#navmesh navmesh preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{net} module.
-- @field[parent = #global] net#net net preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{notification} module.
-- @field[parent = #global] notification#notification notification preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{numpad} module.
-- @field[parent = #global] numpad#numpad numpad preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{physenv} module.
-- @field[parent = #global] physenv#physenv physenv preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{player} module.
-- @field[parent = #global] player#player player preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{player_manager} module.
-- @field[parent = #global] player_manager#player_manager player_manager preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{presets} module.
-- @field[parent = #global] presets#presets presets preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{properties} module.
-- @field[parent = #global] properties#properties properties preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{render} module.
-- @field[parent = #global] render#render render preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{resource} module.
-- @field[parent = #global] resource#resource resource preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{saverestore} module.
-- @field[parent = #global] saverestore#saverestore saverestore preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{scripted_ents} module.
-- @field[parent = #global] scripted_ents#scripted_ents scripted_ents preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{search} module.
-- @field[parent = #global] search#search search preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{serverlist} module.
-- @field[parent = #global] serverlist#serverlist serverlist preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{sound} module.
-- @field[parent = #global] sound#sound sound preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{spawnmenu} module.
-- @field[parent = #global] spawnmenu#spawnmenu spawnmenu preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{sql} module.
-- @field[parent = #global] sql#sql sql preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{steamworks} module.
-- @field[parent = #global] steamworks#steamworks steamworks preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{surface} module.
-- @field[parent = #global] surface#surface surface preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{system} module.
-- @field[parent = #global] system#system system preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{team} module.
-- @field[parent = #global] team#team team preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{timer} module.
-- @field[parent = #global] timer#timer timer preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{umsg} module.
-- @field[parent = #global] umsg#umsg umsg preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{undo} module.
-- @field[parent = #global] undo#undo undo preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{usermessage} module.
-- @field[parent = #global] usermessage#usermessage usermessage preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{utf8} module.
-- @field[parent = #global] utf8#utf8 utf8 preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{util} module.
-- @field[parent = #global] util#util util preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{util.worldpicker} module.
-- @field[parent = #global] util.worldpicker#util.worldpicker util.worldpicker preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{vgui} module.
-- @field[parent = #global] vgui#vgui vgui preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{video} module.
-- @field[parent = #global] video#video video preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{weapons} module.
-- @field[parent = #global] weapons#weapons weapons preloaded module

------------------------------------------------------------------------------
-- 
-- This is a global variable which hold the preloaded @{widgets} module.
-- @field[parent = #global] widgets#widgets widgets preloaded module

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] AccessorFunc
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Add_NPC_Class
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] AddBackgroundImage
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] AddConsoleCommand
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] AddCSLuaFile
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] AddonMaterial
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] AddOriginToPVS
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] AddWorldTip
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Angle
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] AngleRand
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] BroadcastLua
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] BuildNetworkedVarsTable
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CanAddServerToFavorites
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CancelLoading
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ChangeBackground
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ChangeTooltip
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ClearBackgroundImages
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ClientsideModel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ClientsideRagdoll
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ClientsideScene
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CloseDermaMenus
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Color
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ColorAlpha
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ColorRand
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ColorToHSV
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CompileFile
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CompileString
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ConsoleAutoComplete
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ConVarExists
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CreateClientConVar
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CreateConVar
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CreateMaterial
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CreateParticleSystem
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CreatePhysCollideBox
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CreatePhysCollidesFromModel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CreateSound
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CreateSprite
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] CurTime
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DamageInfo
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DebugInfo
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DEFINE_BASECLASS
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DeriveGamemode
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Derma_Anim
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Derma_DrawBackgroundBlur
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Derma_Hook
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Derma_Install_Convar_Functions
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Derma_Message
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Derma_Query
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Derma_StringRequest
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DermaMenu
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DisableClipping
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DOF_Kill
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DOF_Start
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DOFModeHack
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawBackground
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawBloom
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawColorModify
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawMaterialOverlay
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawMotionBlur
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawSharpen
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawSobel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawSunbeams
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawTexturize
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DrawToyTown
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DropEntityIfHeld
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] DynamicLight
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] EffectData
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Either
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] EmitSentence
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] EmitSound
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] EndTooltip
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Entity
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Error
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ErrorNoHalt
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] EyeAngles
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] EyePos
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] EyeVector
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] FindMetaTable
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] FindTooltip
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Format
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] FrameNumber
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] FrameTime
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GameDetails
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] gcinfo
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetConVar
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetConVar_Internal
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetConVarNumber
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetConVarString
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetDefaultLoadingHTML
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetDemoFileDetails
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetDownloadables
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetGlobalAngle
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetGlobalBool
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetGlobalEntity
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetGlobalFloat
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetGlobalInt
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetGlobalString
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetGlobalVector
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetHostName
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetHUDPanel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetLoadPanel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetLoadStatus
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetMapList
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetOverlayPanel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetRenderTarget
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetRenderTargetEx
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetSaveFileDetails
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] GetViewEntity
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] HSVToColor
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] HTTP
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] include
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IncludeCS
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] isangle
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] isbool
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsColor
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsEnemyEntityName
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsEntity
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] isentity
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsFirstTimePredicted
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsFriendEntityName
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] isfunction
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsInGame
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ismatrix
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsMounted
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] isnumber
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ispanel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] isstring
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] istable
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsTableOfEntitiesValid
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsUselessModel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] IsValid
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] isvector
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] JoinServer
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] JS_Language
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] JS_Utility
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] JS_Workshop
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Label
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] LanguageChanged
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Lerp
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] LerpAngle
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] LerpVector
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] LoadLastMap
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] LoadPresets
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Localize
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] LocalPlayer
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] LocalToWorld
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Material
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Matrix
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Mesh
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Model
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] module
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Msg
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] MsgAll
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] MsgC
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] MsgN
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] NamedColor
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] newproxy
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] NumDownloadables
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] NumModelSkins
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] OnModelLoaded
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] OpenFolder
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] OrderVectors
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Particle
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ParticleEffect
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ParticleEffectAttach
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ParticleEmitter
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Path
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Player
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] PositionSpawnIcon
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] PrecacheParticleSystem
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] PrecacheScene
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] PrecacheSentenceFile
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] PrecacheSentenceGroup
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] PrintMessage
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] PrintTable
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ProjectedTexture
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ProtectedCall
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RandomPairs
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RealFrameTime
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RealTime
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RecipientFilter
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RecordDemoFrame
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RegisterDermaMenuForClose
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RememberCursorPosition
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RemoveTooltip
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RenderAngles
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RenderDoF
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RenderStereoscopy
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RenderSuperDoF
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RestoreCursorPosition
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RunConsoleCommand
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RunGameUICommand
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RunString
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] RunStringEx
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SafeRemoveEntity
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SafeRemoveEntityDelayed
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SaveLastMap
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SavePresets
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ScreenScale
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ScrH
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ScrW
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SendUserMessage
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ServerLog
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetClipboardText
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetGlobalAngle
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetGlobalBool
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetGlobalEntity
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetGlobalFloat
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetGlobalInt
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetGlobalString
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetGlobalVector
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SetPhysConstraintSystem
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SortedPairs
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SortedPairsByMemberValue
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SortedPairsByValue
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Sound
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SoundDuration
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SQLStr
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SScale
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] STNDRD
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SuppressHostEvents
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] SysTime
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] TauntCamera
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] TextEntryLoseFocus
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] TimedCos
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] TimedSin
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] tobool
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ToggleFavourite
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] TranslateDownloadableName
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] TypeID
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] UnPredictedCurTime
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] UpdateLoadPanel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] UTIL_IsUselessModel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] ValidPanel
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] Vector
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] VectorRand
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] VGUIFrameTime
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] VGUIRect
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] VisualizeLayout
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] WorkshopFileBase
-- @param  
-- @return 

-------------------------------------------------------------------------------
-- 
-- @function [parent=#global] WorldToLocal
-- @param  
-- @return 

return nil
