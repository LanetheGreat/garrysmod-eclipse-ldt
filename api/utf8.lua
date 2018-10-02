-------------------------------------------------------------------------------
-- The utf8 library provides basic support for UTF-8 encoding. This library
-- does not provide any support for Unicode other than the handling of the
-- encoding. Any operation that needs the meaning of a character, such as
-- character classification, is outside its scope.
-- 
-- Unless stated otherwise, all functions that expect a byte position as a
-- parameter assume that the given position is either the start of a byte
-- sequence or one plus the length of the subject string. As in the string
-- library, negative indices count from the end of the string.
-- @module utf8

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Receives zero or more integers, converts each one to its corresponding UTF-8
-- byte sequence and returns a string with the concatenation of all these sequences.
-- @function [parent=#utf8] char
-- @param  ... Unicode code points to be converted in to a UTF-8 string.
-- @return #string UTF-8 string generated from given arguments.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- This is NOT a function, it's the pattern (a string, not a function)
-- ```"[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*"```
-- which matches exactly one UTF-8 byte sequence, assuming that the subject is a valid UTF-8 string.
-- @field [parent=#utf8] #string charpattern

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the codepoints (as numbers) from all characters in the given string
-- that start between byte position startPos and endPos. It raises an error if
-- it meets any invalid byte sequence. This functions similarly to **string.byte**.
-- @function [parent=#utf8] codepoint
-- @param  #string string The string that you will get the code(s) from.
-- @param  #number startPos The starting byte of the string to get the codepoint of. _(Default: 1)_
-- @param  #number endPos The ending byte of the string to get the codepoint of. _(Default: 1)_
-- @return ... The codepoint number(s).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns an iterator (like **string.gmatch**) which returns both the position and
-- codepoint of each utf8 character in the string. It raises an error if it
-- meets any invalid byte sequence.
-- @function [parent=#utf8] codes
-- @param  #string string The string that you will get the codes from.
-- @return #function The iterator. (to be used in a for loop)

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Forces a string to contain only valid UTF-8 data. Invalid sequences are
-- replaced with U+FFFD (the Unicode replacement character).
-- 
-- This is a lazy way for users to ensure a string contains only valid UTF-8 data.
-- @function [parent=#utf8] force
-- @param  #string string The string that will become a valid UTF-8 string.
-- @return #string The validated UTF-8 string.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the number of UTF-8 sequences in the given string between positions
-- startPos and endPos (both inclusive). If it finds any invalid UTF-8 byte
-- sequence, returns false as well as the position of the first invalid byte.
-- @function [parent=#utf8] 
-- @param  #string string The string to calculate the length of.
-- @param  #number startPos The starting position to get the length from. _(Default: 1)_
-- @param  #number endPos The ending position to get the length from. _(Default: 1)_
-- @return #number, #number The number of UTF-8 characters in the string, or false and the position of the first invalid byte, if there were no invalid bytes, this will be nil.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the byte-index of the n'th UTF-8-character after the given startPos
-- (nil if none). startPos defaults to 1 when n is positive and -1 when n is
-- negative. If n is zero, this function instead returns the byte-index of the
-- UTF-8-character startPos lies within.
-- @function [parent=#utf8] offset
-- @param  #string string The string that you will get the byte position from.
-- @param  #number n The position to get the beginning byte position from.
-- @param  #number startPos The offset for n. _(Default: 1 when n>=0, -1 otherwise)_
-- @return #number Starting byte-index of the given position.

return nil
