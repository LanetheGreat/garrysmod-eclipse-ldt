-------------------------------------------------------------------------------
-- Table Manipulation
-- This library provides generic functions for table manipulation.
-- It provides all its functions inside the table table.
--
-- Most functions in the table library assume that the table represents an array or a list.
-- For these functions, when we talk about the "length" of a table we mean the result of the length operator.
-- @module table

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Adds the contents from one table into another. See also **table.Inherit** and **table.Merge**.
-- @function [parent=#table] Add
-- @param  #table target The table to insert the new values into.
-- @param  #table source The table to retrieve the values from.
-- @return #table The table the values were appended to.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Changes all keys to sequential integers. This creates a new table object and
-- does not affect the original.
-- @function [parent=#table] ClearKeys
-- @param  #table table The original table to modify.
-- @param  #boolean saveKeys Save the keys within each member table. This will insert a new field _\_\_key_ into each value, and should not be used if the table contains non-table values. _(Default: false)_
-- @return #table Table with integer keys.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Collapses a table with key/value structure.
-- @function [parent=#table] CollapseKeyValue
-- @param  #table input Input table.
-- @return #table Output table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Given an array where all elements are strings or numbers, returns
-- `table[i]..sep..table[i+1]...sep..table[j]`. The default value for
-- `sep` is the empty string, the default for `i` is 1, and the default for
-- `j` is the length of the table. If `i` is greater than `j`, returns the
-- empty string.
-- @function [parent=#table] concat
-- @param #table table table to handle.
-- @param #string sep the separator, default value is an empty string. 
-- @param #number i start index, default value is 1.
-- @param #number j end index, default value is lenght of the table.
-- @return #string the concatenated table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Creates a deep copy and returns that copy.
-- 
-- **Warning**: _This function does NOT copy userdata, such as **Vectors** and **Angles**!_
-- @function [parent=#table] 
-- @param  #table originalTable The table to be copied.
-- @return #table A deep copy of the original table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Empties the target table, and merges all values from the source table into it.
-- @function [parent=#table] CopyFromTo
-- @param  #table source The table to copy from.
-- @param  #table target The table to write to.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Counts the amount of keys in a table. This should only be used when a table
-- is not numerically and sequentially indexed. For those tables, consider the
-- length operator.
-- @function [parent=#table] Count
-- @param  #table tbl The table to count the keys of.
-- @return #number The number of keyvalue pairs. This includes non-numeric and non-sequential keys, unlike the length (#) operator.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a table that has been sanitised with **table.Sanitise** back to its
-- original form.
-- @function [parent=#table] DeSanitise
-- @param  #table tbl Table to be de-sanitised.
-- @return #table De-sanitised table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Removes all values from a table.
-- @function [parent=#table] Empty
-- @param  #table tbl The table to empty.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Instead, iterate the table using ipairs or increment from the previous
-- index using next. Non-numerically indexed tables are not ordered._
-- 
-- Returns the value positioned after the supplied value in a table. If it
-- isn't found then the first element in the table is returned.
-- @function [parent=#table] 
-- @param  #table tbl Table to search.
-- @param  #any value Value to return element after.
-- @return #any Found element.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Instead, iterate your table with ipairs, storing the previous value and
-- checking for the target. Non-numerically indexed tables are not ordered._
-- 
-- Returns the value positioned before the supplied value in a table. If it
-- isn't found then the last element in the table is returned.
-- @function [parent=#table] 
-- @param  #table tbl Table to search.
-- @param  #any value Value to return element before.
-- @return #any Found element.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Inserts a value in to the given table even if the table is non-existent.
-- @function [parent=#table] ForceInsert
-- @param  #table tab Table to insert value in to. _(Default: {})_
-- @param  #any value Value to insert.
-- @return #table The supplied or created table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _This was deprecated in Lua 5.1 and removed in 5.2. You should use **pairs**() instead._
-- 
-- Iterates for each key-value pair in the table, calling the function with the
-- key and value of the pair. If the function returns anything, the loop is broken.
-- 
-- This is inherited from the original Lua implementation and is deprecated in
-- Lua as of 5.1; see here. You should use pairs() instead. The GLua
-- interpretation of this is table.ForEach.
-- @function [parent=#table] 
-- @param  #table tbl The table to iterate over.
-- @param  #function callback The function to run for each key and value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should use **pairs**() instead._
-- 
-- Iterates over a table and calls the given function for each key and value
-- found. Unlike table.foreach, this ignores the value returned by the function.
-- @function [parent=#table] 
-- @param  #table tab Table to iterate over.
-- @param  #function callback Function to call for every key-value pair.
-- Arguments passed are:
-- 
-- * _#any key_
-- * _#any value_

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _This was deprecated in Lua 5.1 and removed in 5.2. You should use **ipairs**() instead._
-- 
-- Iterates for each numeric index in the table in order. This is inherited
-- from the original Lua implementation and is deprecated in Lua as of 5.1.
-- @function [parent=#table] foreachi
-- @param  #table table The table to iterate over.
-- @param  #function func The function to run for each index.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Instead, expect the first key to be 1._
-- _Non-numerically indexed tables are not ordered and do not have a first key._
-- 
-- Returns the first key found in the given table.
-- @function [parent=#table] 
-- @param  #table tab Table to retrieve key from.
-- @return #any key

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Instead, index the table with a key of 1._
-- _Non-numerically indexed tables are not ordered and do not have a first key._
-- 
-- Returns the first value found in the given table.
-- @function [parent=#table] 
-- @param  #table tab Table to retrieve value from.
-- @return #any value

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns all keys of a table.
-- @function [parent=#table] GetKeys
-- @param  #table tabl The table to get keys of.
-- @return #table Table of keys.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Instead, use the result of the length (#) operator, ensuring it is not zero.
-- Non-numerically indexed tables are not ordered and do not have a last key._
-- 
-- Returns the last key found in the given table.
-- @function [parent=#table] GetLastKey
-- @param  #table tab Table to retrieve key from.
-- @return #any key

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _Instead, index the table with the result of the length (#) operator,
-- ensuring it is not zero. Non-numerically indexed tables are not ordered and do not have a last key._
-- 
-- Returns the last value found in the given table.
-- @function [parent=#table] 
-- @param  #table tab Table to retrieve value from.
-- @return #any value

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a key of the supplied table with the highest number value.
-- @function [parent=#table] GetWinningKey
-- @param  #table inputTable The table to search in.
-- @return #any The highest value key.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Checks if a table has a value.
-- 
-- **Warning**: _This function is very inefficient for large tables (O(n)) and
-- should probably not be called in things that run each frame._
-- 
-- **Note**: _For optimization, functions that look for a value by sorting the
-- table should never be needed if you work on a table that you built yourself._
-- @function [parent=#table] HasValue
-- @param  #table tbl Table to check.
-- @param  #any value Value to search for.
-- @return #boolean Returns true if the table has that value, false otherwise.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Copies any missing data from base to target, and sets the target's BaseClass
-- member to the base table's pointer.
-- 
-- See **table.Merge**, which overrides existing values and doesn't add a BaseClass member.
-- See also **table.Add**, which simply adds values of one table to another.
-- @function [parent=#table] Inherit
-- @param  #table target Table to copy data to.
-- @param  #table base Table to copy data from.
-- @return #table target table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Inserts element `value` at position `pos` in `table`, shifting up
-- other elements to open space, if necessary. The default value for `pos` is
-- `n+1`, where `n` is the length of the table, so that a call
-- `table.insert(t,x)` inserts `x` at the end of table `t`.
-- @function [parent=#table] insert
-- @param #table table table to modify.
-- @param #number pos index of insertion.
-- @param value value to insert.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns whether or not the table's keys are sequential.
-- @function [parent=#table] IsSequential
-- @param  #table tab Table to check.
-- @return #boolean Is sequential.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the first key found to be containing the supplied value.
-- @function [parent=#table] KeyFromValue
-- @param  #table tab Table to search.
-- @param  #any value Value to search for.
-- @return #any key

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a table of keys containing the supplied value.
-- @function [parent=#table] KeysFromValue
-- @param  #table tab Table to search.
-- @param  #any value Value to search for.
-- @return #table keys

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a copy of the input table with all string keys converted to be
-- lowercase recursively.
-- @function [parent=#table] LowerKeyNames
-- @param  #table tbl Table to convert.
-- @return #table New table with lowercased keys.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the largest positive numerical index of the given table, or
-- zero if the table has no positive numerical indices. (To do its job this
-- function does a linear traversal of the whole table.)
-- @function [parent=#table] maxn
-- @param #table table table to traverse.
-- @return #number the largest positive numerical index of the given table, or
-- zero if the table has no positive numerical indices.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Merges the contents of the second table with the content in the first one.
-- 
-- See **table.Inherit**, which doesn't override existing values.
-- See also *table.Add**, which simply adds values of one table to another.
-- @function [parent=#table] Merge
-- @param  #table destination The table you want the source table to merge with.
-- @param  #table source The table you want to merge with the destination table.
-- @return #table destination table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a random value from the supplied table.
-- 
-- **Note**: _This function iterates over the given table twice, therefore with
-- sequential tables you should instead use following:_
-- 
-- ```mytable[math.random(#mytable)]```
-- @function [parent=#table] 
-- @param  #table haystack The table to choose from.
-- @return #any, #any A random value and its associated key.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Removes from `table` the element at position `pos`, shifting down other
-- elements to close the space, if necessary. Returns the value of the removed
-- element. The default value for `pos` is `n`, where `n` is the length of the
-- table, so that a call `table.remove(t)` removes the last element of table
-- `t`.
-- @function [parent=#table] remove
-- @param #table table table to modify.
-- @param #number pos index of deletion. (default value is the lenght of the table)

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Removes the first instance of a given value from the specified table with
-- **table.remove**, then returns the key that the value was found at.
-- @function [parent=#table] RemoveByValue
-- @param  #table tbl The table that will be searched.
-- @param  #any val The value to find within the table.
-- @return #any The key at which the value was found, or false if the value was not found.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a reversed copy of a sequential table. Any non-sequential and
-- non-numeric key/value pairs will not be copied.
-- @function [parent=#table] Reverse
-- @param  #table tbl Table to reverse.
-- @return #table A reversed copy of the table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts Vectors, Angles and booleans to be able to be converted to and from
-- key/values. **table.DeSanitise** does the opposite.
-- @function [parent=#table] Sanitise
-- @param  #table tab Table to sanitise.
-- @return #table Sanitised table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Sorts table elements in a given order,
-- *in-place*, from `table[1]` to `table[n]`, where `n` is the length of the
-- table. If `comp` is given, then it must be a function that receives two
-- table elements, and returns true when the first is less than the second
-- (so that `not comp(a[i+1],a[i])` will be true after the sort). Lua operator < is used instead.
-- 
-- The sort algorithm is not stable; that is, elements considered equal by the given order may have their relative positions changed by the sort.
-- @function [parent=#table] sort
-- @param #table table table to sort.
-- @param comp a function which take to table and returns true when the first is less than the second.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a list of keys sorted based on values of those keys. For normal
-- sorting see **table.sort**.
-- @function [parent=#table] SortByKey
-- @param  #table tab Table to sort. All values of this table must be of same type.
-- @param  #boolean descending Should the order be descending? _(Default: false)_
-- @return #table A table of keys sorted by values from supplied table.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- 
-- @function [parent=#table] SortByMember
-- @param  #table tab Table to sort.
-- @param  #any memberKey The key used to identify the member.
-- @param  #boolean ascending Whether or not the order should be ascending. _(Default: false)_

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Sorts a table in reverse order from **table.sort**.
-- @function [parent=#table] SortDesc
-- @param  #table tbl The table to sort in descending order.
-- @return #table The same table, sorted.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a table into a string
-- @function [parent=#table] ToString
-- @param  #table tbl The table to iterate over.
-- @param  #string displayName Optional. A name for the table.
-- @param  #boolean niceFormatting Adds new lines and tabs to the string.
-- @return #string The table formatted as a string.

return nil
