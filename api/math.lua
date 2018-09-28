-------------------------------------------------------------------------------
-- Mathematical Functions.
-- This library is an interface to the standard C math library.
-- It provides all its functions inside the table math.
-- In Garry's Mod several additional math functions have been added.
-- @module math

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Calculates the absolute value of a number (effectively removes any negative sign).
-- @function [parent=#math] abs
-- @param  #number x The number to get the absolute value of.
-- @return #number The absolute value of x.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the arc cosine of the given number.
-- @function [parent=#math] acos
-- @param  #number cos Cosine value in range of -1 to 1.
-- @return #number An angle in radians, between 0 and pi, which has the given cos value.
-- nan if the argument is out of range.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Calculates the difference between two angles.
-- @function [parent=#math] AngleDifference
-- @param  #number a The first angle.
-- @param  #number b The second angle.
-- @return #number The difference between the angles between -180 and 180.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Gradually approaches the target value by the specified amount.
-- @function [parent=#math] Approach
-- @param  #number current The value we're currently at.
-- @param  #number target The target value. This function will never overshoot this value.
-- @param  #number change The amount that the current value is allowed to change by to approach the target. (It makes no difference whether this is positive or negative.)
-- @return #number New current value, closer to the target than it was previously.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Increments an angle towards another by specified rate.
-- 
-- **Note**: This function is for numbers representing angles (0-360), NOT **Angle** objects!
-- @function [parent=#math] ApproachAngle
-- @param  #number currentAngle The current angle to increase.
-- @param  #number targetAngle The angle to increase towards.
-- @param  #number rate The amount to approach the target angle by.
-- @return #number The modified angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the arc sine of the given number.
-- @function [parent=#math] asin
-- @param  #number normal Sine value in the range of -1 to 1.
-- @return #number An angle in radians, in the range -pi/2 to pi/2, which has the given sine value.
-- nan if the argument is out of range.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the arc tangent of the given number.
-- @function [parent=#math] atan
-- @param  #number normal Tangent value.
-- @return #number An angle in radians, in the range -pi/2 to pi/2, which has the given tangent.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **atan2** functions like **math.atan**(y / x), except it also takes into
-- account the quadrant of the angle and so doesn't have a limited range of output.
-- 
-- **Note**: _The Y argument comes first!_
-- @function [parent=#math] atan2
-- @param  #number y The Y coordinate.
-- @param  #number x The X coordinate.
-- @return #number The angle of the line from (0, 0) to (x, y) in radians, in the range -pi to pi.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts a binary string into a number.
-- @function [parent=#math] BinToInt
-- @param  #string string Binary string to convert.
-- @return #number Base 10 number.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Basic code for Bezier-Spline algorithm.
-- @function [parent=#math] BSplinePoint
-- @param  #number tDiff From 0 to 1, where alongside the spline the point will be.
-- @param  #table tPoints A table of **Vectors**. The amount cannot be less than 4.
-- @param  #number tMax Just leave this at 1.
-- @return #Vector Point on Bezier curve, related to tDiff.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This is an internal function or feature.**  
-- _This means you will be able to use it, but you really shouldn't._
-- _Use **math.BSplinePoint** instead._
-- 
-- Basic code for Bezier-Spline algorithm, helper function for **math.BSplinePoint**.
-- @function [parent=#math] 
-- @param  #number i
-- @param  #number k
-- @param  #number t
-- @param  #number tinc
-- @return #number

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Ceils or rounds a number up.
-- @function [parent=#math] ceil
-- @param  #number number The number to be rounded up.
-- @return #number The rounded number.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Clamps a number between a minimum and maximum value.
-- @function [parent=#math] Clamp
-- @param  #number input The number to clamp.
-- @param  #number min The minimum value, this function will never return a number less than this.
-- @param  #number max The maximum value, this function will never return a number greater than this.
-- @return #number The clamped value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the cosine of given angle.
-- @function [parent=#math] cos
-- @param  #number number Angle in radians.
-- @return #number Cosine of given angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the hyperbolic cosine of the given angle.
-- @function [parent=#math] cosh
-- @param  #number number Angle in radians.
-- @return #number The hyperbolic cosine of the given angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts radians to degrees.
-- @function [parent=#math] deg
-- @param  #number radians Value to be converted to degrees.
-- @return #number Degrees.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _You should use **math.Distance** instead._
-- 
-- Returns the difference between two points in 2D space. Alias of **math.Distance**.
-- @function [parent=#math] Dist
-- @param  #number x1 X position of first point.
-- @param  #number y1 Y position of first point.
-- @param  #number x2 X position of second point.
-- @param  #number y2 Y position of second point.
-- @return #number Distance between the two points.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the difference between two points in 2D space.
-- @function [parent=#math] Distance
-- @param  #number x1 X position of first point.
-- @param  #number y1 Y position of first point.
-- @param  #number x2 X position of second point.
-- @param  #number y2 Y position of second point.
-- @return #number Distance between the two points.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Calculates the progress of a value fraction, taking in to account given
-- easing fractions.
-- @function [parent=#math] EaseInOut
-- @param  #number progress Fraction of the progress to ease.
-- @param  #number easeIn Fraction of how much easing to begin with.
-- @param  #number easeOut Fraction of how much easing to end with.
-- @return #number Eased value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the x power of the Euler constant e.
-- @function [parent=#math] exp
-- @param  #number exponent The exponent for the function.
-- @return #number e to the specified power.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Floors or rounds a number down.
-- @function [parent=#math] floor
-- @param  #number number The number to be rounded down.
-- @return #number The rounded number.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the modulus of the specified values.
-- While this is similar to the % operator, it will return a negative value if
-- the first argument is negative, whereas the % operator will return a
-- positive value even if the first operand is negative.
-- @function [parent=#math] fmod
-- @param  #number base The base value.
-- @param  #number modulator The modulator.
-- @return #number The calculated modulus.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Used to split the number value into a normalized fraction and an exponent.
-- Two values are returned: the first is a multiplier in the range 1/2
-- (inclusive) to 1 (exclusive) and the second is an integer exponent.
-- 
-- The result is such that x = m*2^e.
-- @function [parent=#math] frexp
-- @param  #number x The value to get the normalized fraction and the exponent from.
-- @return #number, #number The multiplier, between 0.5/1 and the exponent. (always an integer)

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- This is NOT a function, it's a variable that effectively represents
-- infinity, in the sense that in any numerical comparison every number will be
-- less than this.
-- 
-- For example, if x is a number, "x > math.huge" will NEVER be true except in
-- the case of overflow (see below).
-- 
-- Lua will consider any number greater than or equal to 21024 (the exponent
-- limit of a double) as inf and hence equal to this.
-- @field [parent=#math] #number huge

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts an integer to a binary (base-2) string.
-- @function [parent=#math] IntToBin
-- @param  #number int Number to be converted.
-- @return #string Binary number string. The length of this will always be a multiple of 3.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Takes a normalised number and returns the floating point representation.
-- @function [parent=#math] ldexp
-- @param  #number normalizedFraction The value to get the normalized fraction and the exponent from.
-- @param  #number exponent The value to get the normalized fraction and the exponent from.
-- @return #number The result.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- With one argument, return the natural logarithm of x (to base e).  
-- With two arguments, return the logarithm of x to the given base, calculated
-- as log(x)/log(base).
-- @function [parent=#math] log
-- @param  #number x The value to get the base from exponent from.
-- @param  #number base The logarithmic base. _(Default: e)_
-- @return #number Logarithm of x to the given base.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the base-10 logarithm of x. This is usually more accurate than math.log(x, 10).
-- @function [parent=#math] log10
-- @param  #number x The value to get the base from exponent from.
-- @return #number Logarithm of x to base 10.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the largest value of all arguments.
-- @function [parent=#math] max
-- @param ... Numbers to get the largest from.
-- @return #number The largest number.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the smallest value of all arguments.
-- @function [parent=#math] min
-- @param ... Numbers to get the largest from.
-- @return #number The smallest number.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- **This feature is deprecated.**  
-- _You should avoid using it as it may be removed in a future version._
-- _This is removed in Lua versions later than what GMod is currently using.
-- You should use the % operator or **math.fmod** instead._
-- 
-- Returns the modulus of the specified values. Same as **math.fmod**.
-- @function [parent=#math] mod
-- @param  #number base The base value.
-- @param  #number modulator The modulator.
-- @return #number The calculated modulus.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the integral and fractional component of the modulo operation.
-- @function [parent=#math] modf
-- @param  #number base The base value.
-- @return #number, #number The integral and fractional components.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Normalizes angle, so it returns value between -180 and 180.
-- @function [parent=#math] NormalizeAngle
-- @param  #number angle The angle to normalize, in degrees.
-- @return #number The normalized angle, in the range of -180 to 180 degrees.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- This is NOT a function, it's a variable containing the mathematical constant pi.
-- @field [parent=#math] #number pi

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns x raised to the power y. In particular, **math.pow**(1.0, x) and
-- **math.pow**(x, 0.0) always return 1.0, even when x is a zero or a NaN. If both
-- x and y are finite, x is negative, and y is not an integer then
-- **math.pow**(x, y) is undefined.
-- @function [parent=#math] pow
-- @param  #number x Base.
-- @param  #number y Exponent.
-- @return #number y power of x.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Converts an angle in degrees to it's equivalent in radians.
-- @function [parent=#math] rad
-- @param  #number degrees The angle measured in degrees.
-- @return #number Radians.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns a random float between min and max. See also **math.random**.
-- @function [parent=#math] Rand
-- @param  #number min The minimum value.
-- @param  #number max The maximum value.
-- @return #number Random float between min and max.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- This function is an interface to the simple pseudo-random generator
-- function `rand` provided by ANSI C. (No guarantees can be given for its
-- statistical properties.)
-- 
-- When called without arguments, returns a uniform pseudo-random real
-- number in the range *[0,1)*. When called with an integer number `m`,
-- `math.random` returns a uniform pseudo-random integer in the range *[1,
-- m]*. When called with two integer numbers `m` and `n`, `math.random`
-- returns a uniform pseudo-random integer in the range *[m, n]*.
-- @function [parent=#math] random
-- @param  #number m If m is the only parameter: upper limit. _(Default: nil)_  
-- If n is also provided: lower limit.  
-- If provided, this must be an integer.
-- @param  #number n Upper limit. _(Default: nil)_  
-- If provided, this must be an integer.
-- @return #number Random value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Seeds the random number generator. The same seed will guarantee the same
-- sequence of numbers each time with **math.random**.
-- 
-- For shared random values across predicted realms, use **util.SharedRandom**.
-- 
-- **Warning**: _Incorrect usage of this function will affect **all** random numbers in the game._
-- @function [parent=#math] randomseed
-- @param  #number seed The new seed.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Remaps the value from one range to another.
-- @function [parent=#math] Remap
-- @param  #number value The value to map.
-- @param  #number inMin The minimum of the initial range.
-- @param  #number inMax The maximum of the initial range.
-- @param  #number outMin The minimum of new range.
-- @param  #number outMax The maximum of new range.
-- @return #number The number in the new range.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Rounds the given value to the nearest whole number or to the given decimal places.
-- @function [parent=#math] Round
-- @param  #number value The value to round.
-- @param  #number decimals The decimal places to round to. _(Default: 0)_
-- @return #number The rounded value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the sine of given angle.
-- @function [parent=#math] sin
-- @param  #number number Angle in radians.
-- @return #number Sine for given angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the hyperbolic sine of the given angle.
-- @function [parent=#math] sinh
-- @param  #number number Angle in radians.
-- @return #number The hyperbolic sine of the given angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the square root of the number. (You can also use the expression `x^0.5`
-- to compute this value.)
-- @function [parent=#math] sqrt
-- @param  #number value Value to get the square root of.
-- @return #number The square root of the value.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the tangent of the given angle.
-- @function [parent=#math] tan
-- @param  #number value Angle in radians.
-- @return #number The tangent of the given angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the hyperbolic tangents of the given number.
-- @function [parent=#math] tanh
-- @param  #number number Angle in radians.
-- @return #number The hyperbolic tangent of the given angle.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Returns the fraction of where the current time is relative to the start and
-- end times.
-- @function [parent=#math] TimeFraction
-- @param  #number start Start time in seconds.
-- @param  #number end End time in seconds.
-- @param  #number current Current time in seconds.
-- @return #number The fraction of time.

-------------------------------------------------------------------------------
-- _Client_ | _Menu_ | _Server_
-- 
-- Rounds towards zero.
-- @function [parent=#math] Truncate
-- @param  #number num The number to truncate.
-- @param  #number digits The amount of digits to keep after the point. _(Default: 0)_
-- @return #number The truncated number.

return nil
