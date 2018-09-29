-------------------------------------------------------------------------------
-- The net library is one of a number of ways to send data between the client
-- and server. The major advantages of the net library are the large size limit
-- (64kb/message) and the ability to send data backwards - from the client to
-- the server. Refer to **Net Library Usage** for a short introduction.
-- @module net

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sends the currently built net message to all connected players.
-- @function [parent=#net] Broadcast

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the size of the current message in bytes.
-- @function [parent=#net] BytesWritten
-- @return #number The amount of bytes written to the current net message.
-- Returns nil if no net message has been started.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- _You may be looking for **net.Receive**._
-- 
-- Function called by the engine to tell the lua state a message arrived.
-- @function [parent=#net] Incoming
-- @param  #number length The message length, in bits.
-- @param  #Player client The player that sent the message. This will be nil in the client state.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads an angle from the received net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadAngle
-- @return #Angle The read angle, or Angle(0,0,0) if no angle could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a bit from the received net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadBit
-- @return #number 0 or 1, or 0 if the bit could not be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a boolean from the received net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadBool
-- @return #boolean true or false, or false if the bool could not be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a **Color structure** from the current net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadColor
-- @return #table The **Color structure** read from the current net message, or Color(0,0,0,0) if the color could not be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads pure binary data from the message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadData
-- @param  #number length The length of the data to be read, in bytes.
-- @return #string The binary data read, or a string containing one character with a byte of 0 if no data could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a double-precision number from the received net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadDouble
-- @return #number The double-precision number, or 0 if no number could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads an entity from the received net message. You should always check if
-- the specified entity exists as it may have been removed and there for NULL
-- if it is outside of the players PVS or was already removed.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadEntity
-- @return #Entity The entity, or Entity(0) if no entity could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a floating point number from the received net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadFloat
-- @return #number The floating point number, or 0 if no number could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Returns the "header" of the message which contains a short which can be
-- converted to the corresponding message name via **util.NetworkIDToString**.
-- @function [parent=#net] ReadHeader
-- @return #number The header number.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads an integer from the received net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadInt
-- @param  #number bitCount The amount of bits to be read. This must be set to what you set to **net.WriteInt**.
-- @return #number The read integer number, or 0 if no integer could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a **VMatrix** from the received net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadMatrix
-- @return #VMatrix The matrix, or an empty matrix if no matrix could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a normal vector from the net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadNormal
-- @return #Vector The normalized vector(length=1), or Vector(0,0,1) if no normal could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a null terminated string from the net stream. The size of the string
-- is 8 bits plus 8 bits for every ASCII character in the string.
-- @function [parent=#net] ReadString
-- @return #string The read string, or a string with 0 length if no string could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a table from the received net message.
-- 
-- **Note**: _Sometimes when sending a table through the net library, the order
-- of the keys may be switched. So be cautious when comparing._
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadTable
-- @return #table Table recieved via the net message, or a blank table if no table could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a value from the net message with the specified type.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadType
-- @param  #number typeID The type of value to be read, using **TYPE\_Enums**. _(Default: **net.ReadUInt**(8))_
-- @return #any The value, or the respective blank value based on the type you're reading if the value could not be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads an unsigned integer with the specified number of bits from the
-- received net message.
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadUInt
-- @param  #number numberOfBits The size of the integer to be read, in bits.
-- @return #number The unsigned integer read, or 0 if the integer could not be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Reads a vector from the received net message. Vectors sent by this function
-- are compressed, which may result in precision loss. 
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- @function [parent=#net] ReadVector
-- @return #Vector The read vector, or Vector(0,0,0) if no vector could be read.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Adds a net message handler. Only one receiver can be used to receive the net message.
-- 
-- **Note**: _The message-name is converted to lower-case so the message-names
-- "BigBlue" and "bigblue" would be equal._
-- 
-- **Warning**: _You must put this function outside of any other function or
-- hook for it to work properly unless you know what you are doing!_
-- 
-- **Warning**: _You **must** read information in same order as you write it._
-- 
-- **Warning**: _Each net message has a length limit of 64KB!_
-- @function [parent=#net] Receive
-- @param  #string messageName The message name to hook to.
-- @param  #function callback The function to be called if the specified message was received.
-- Arguments are:
-- 
-- * _#number len_ : Length of the message, in bits.
-- * _#Player ply_ : The player that sent the message, works only serverside.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sends the current message to the specified player, or to all players listed in the table.
-- @function [parent=#net] Send
-- @param  #Player ply The player(s) to send the message to. Can be a table of players or a **CRecipientFilter**.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sends the current message to all except the specified, or to all except all
-- players in the table.
-- @function [parent=#net] SendOmit
-- @param  #Player ply The player(s) to NOT send the message to. Can be a table of players.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sends the message to all players that are in the same potentially audible
-- set(PAS) as the position, or simply said, it adds all players that can
-- potentially hear sounds from this position.
-- @function [parent=#net] SendPAS
-- @param  #Vector position The PAS position.

-------------------------------------------------------------------------------
-- _Server_
-- 
-- Sends the message to all players the position is in the PVS of or, more
-- simply said, sends the message to players that can potentially see this position.
-- @function [parent=#net] SendPVS
-- @param  #Vector position Position that must be in players' visibility set.

-------------------------------------------------------------------------------
-- _Client_
-- 
-- Sends the current message to the server.
-- @function [parent=#net] SendToServer

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Begins a new net message. If another net message is already started and
-- hasn't been sent yet, it will be discarded.
-- 
-- **Warning**: _Each net message has a length limit of 64KB!_
-- 
-- **Warning**: _The message name must be pooled with **util.AddNetworkString** beforehand!_
-- @function [parent=#net] Start
-- @param  #string messageName The name of the message to send.
-- @param  #boolean unreliable If set to true, the message is not guaranteed to reach its destination. _(Default: false)_
-- @return #boolean True if the message has been started.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes an angle to the current net message.
-- @function [parent=#net] WriteAngle
-- @param  #Angle angle The angle to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends a boolean (as 1 or 0) to the current net message. Please note that
-- the bit is written here from a boolean(true/false) but **net.ReadBit** returns
-- a number.
-- @function [parent=#net] WriteBit
-- @param  #boolean bit Bit status(false=0, true=1).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends a boolean to the current net message. Alias of **net.WriteBit**.
-- @function [parent=#net] WriteBool
-- @param  #boolean boolean Bit status(false=0, true=1).

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends a **Color structure** to the current net message.
-- @function [parent=#net] WriteColor
-- @param  #table Color The **Color structure** you want to append to the net message.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a chunk of binary data to the message.
-- @function [parent=#net] WriteData
-- @param  #string binaryData The binary data to be sent.
-- @param  #number length The length of the binary data to be sent, in bytes.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends a double-precision number to the current net message.
-- @function [parent=#net] WriteDouble
-- @param  #number double The double to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends an entity to the current net message.
-- @function [parent=#net] WriteEntity
-- @param  #Entity entity The entity to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends a float(number with decimals) to the current net message.
-- @function [parent=#net] WriteFloat
-- @param  #number float The float to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends an integer - a whole number - to the current net message. Can be
-- read back with **net.ReadInt** on the receiving end.  
-- Use **net.WriteUInt** to send an unsigned number (that you know will never be
-- negative). Use **net.WriteFloat** for a non-whole number (e.g. 2.25).
-- @function [parent=#net] WriteInt
-- @param  #number integer The integer to be sent.
-- @param  #number bitCount The amount of bits the number consists of. This must be 32 or less. If you are unsure what to set, just set it to 32.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a **VMatrix** to the current net message.
-- @function [parent=#net] WriteMatrix
-- @param  #VMatrix matrix The matrix to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Writes a normalized/direction vector(Vector with length of 1) to the net message.  
-- This function uses less bandwidth compared to **net.WriteVector** and will not
-- send vectors with length of > 1 properly.
-- @function [parent=#net] WriteNormal
-- @param  #Vector normal The normalized/direction vector to be send.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends a string to the current net message. The size of the string is 8
-- bits plus 8 bits for every ASCII character in the string. The maximum
-- allowed length of a single written string is 65533 characters.
-- @function [parent=#net] WriteString
-- @param  #string string The string to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends a table to the current net message. Adds 16 extra bits per key/value
-- pair so you're better off writing each individual key/value as the exact
-- type if possible.
-- 
-- **Warning**: _All net messages have a 64kb buffer. This function will not
-- check or error when that buffer is overflown. You might want to consider
-- using **util.TableToJSON** and **util.Compress** and send the resulting string in
-- 60kb chunks, doing the opposite on the receiving end._
-- 
-- **Warning**: _If the table contains a nil key the table may not be read correctly._
-- @function [parent=#net] WriteTable
-- @param  #table table The table to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- _Used internally by **net.WriteTable**._
-- 
-- Appends any type of value to the current net message.
-- 
-- **Note**: _An additional 8-bit unsigned integer indicating the type will
-- automatically be written to the packet before the value, in order to
-- facilitate reading with **net.ReadType**. If you know the data type you are
-- writing, use a function meant for that specific data type to reduce amount
-- of data sent._
-- @function [parent=#net] 
-- @param  #any data The data to be sent.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends an unsigned integer with the specified number of bits to the current
-- net message.
-- @function [parent=#net] WriteUInt
-- @param  #number unsignedInteger The unsigned integer to be sent.
-- @param  #number numberOfBits The size of the integer to be sent, in bits. Acceptable values range from any number 1 to 32 inclusive. For reference, 1 = bit, 4 = nibble, 8 = byte, 16 = short, 32 = long.

-------------------------------------------------------------------------------
-- _Client_ | _Server_
-- 
-- Appends a vector to the current net message. Vectors sent by this function
-- are compressed, which may result in precision loss. XYZ components greater
-- than 16384 or less than -16384 are irrecoverably altered (most significant
-- bits are trimmed) and precision after the decimal point is low.
-- @function [parent=#net] WriteVector
-- @param  #Vector vector The vector to be sent.

return nil
