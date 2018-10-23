-------------------------------------------------------------------------------
-- The SQL library allows you to access powerful database software included
-- with Garry's Mod. It is the preferred and fastest method of storing large
-- amounts of data. The database is located in sv.db serverside and cl.db
-- clientside, both in the Garry's Mod base folder. SQL is a whole scripting
-- language in itself although relatively simple, it's something you'll need to
-- read up on before using this library.
-- @module sql

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Tells the engine a set of queries is coming. Will wait until **sql.Commit** is
-- called to run them. This is most useful when you run more than 100+ queries.
-- @function [parent=#sql] Begin

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Tells the engine to execute a series of queries queued for execution, must
-- be preceded by **sql.Begin**.
-- @function [parent=#sql] Commit

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the last error from a SQLite query.
-- @function [parent=#sql] LastError
-- @return #string The last numerical SQLite error code.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Performs a query on the local SQLite database, returns a table as result
-- set, nil if result is empty and false on error.
-- @function [parent=#sql] Query
-- @param  #string query The query to execute.
-- @return #table false is returned if there is an error, nil if the query returned no data.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Performs the query like **sql.Query**, but returns the first row found.
-- @function [parent=#sql] QueryRow
-- @param  #string query The input query.
-- @param  #number row The row number. Say we receive back 5 rows, putting 3 as this argument will give us row #3. _(Default: 1)_
-- @return #table The returned row.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Performs the query like **sql.QueryRow**, but returns the first value found.
-- @function [parent=#sql] QueryValue
-- @param  #string query The input query.
-- @return #any The returned value; the engine automatically converts numerical output to Lua numbers.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Escapes dangerous characters and symbols from user input used in an SQLite
-- SQL Query.
-- 
-- **Note**: _This function is not meant to be used with external database
-- engines such as MySQL. Escaping strings with inadequate functions is dangerous!_
-- @function [parent=#sql] SQLStr
-- @param  #string string The string to be escaped.
-- @param  #boolean bNoQuotes Set this as true, and the function will not wrap the input string in apostrophes. _(Default: false)_
-- @return #string The escaped input.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns if the table with the specified name exists.
-- @function [parent=#sql] TableExists
-- @param  #string tableName The name of the table to check.
-- @return #boolean Whether the specified table exists or not.

return nil
