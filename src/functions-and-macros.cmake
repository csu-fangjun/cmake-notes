# Copyright (c) 2018, Kuang Fangjun <csukuangfj at gmail dot com>.
# All rights reserved.

#[[
this file demonstrates the differences
between macros and functions.
]]

set(var_a "this is a")
set(var_b "this is b")

message(STATUS "before calling")
message(STATUS "var a: ${var_a}")
message(STATUS "var b: ${var_b}")

function(my_func a b)
  message(STATUS "-------")
  message(STATUS "inside function")
  message(STATUS "arg a: ${a}")
  message(STATUS "arg b: ${b}")
  message(STATUS "-------")
  message(STATUS "var a via arg: ${${a}}")
  message(STATUS "var b via arg: ${${b}}")
  message(STATUS "-------")
  set(${a} "a is changed!" PARENT_SCOPE)
  set(${b} "b is changed!")
endfunction()

my_func(var_a var_b)

message(STATUS "-------")
message(STATUS "after calling")
message(STATUS "var a: ${var_a}") # var_a is changed
message(STATUS "var b: ${var_b}") # var_b is not changed

set(var_c "this is c")
set(var_d "this is d")

macro(my_macro c d)
  message(STATUS "-------")
  message(STATUS "inside macro")
  message(STATUS "arg c: ${c}")
  message(STATUS "arg d: ${d}")
  message(STATUS "-------")
  message(STATUS "var c via arg: ${${c}}")
  message(STATUS "var d via arg: ${${d}}")
  message(STATUS "-------")
  set(${c} "c is changed!" PARENT_SCOPE) # warning! It has no parent!
  set(${d} "d is changed!")
endmacro()

message(STATUS "before calling")
message(STATUS "var c: ${var_c}")
message(STATUS "var d: ${var_d}")

my_macro(var_c var_d)

message(STATUS "-------")
message(STATUS "after calling")
message(STATUS "var c: ${var_c}") # var_c is not CHANGED!
message(STATUS "var d: ${var_d}") # var_d is changed


#[[
Usage:
$ cmake -P functions-and-macros.cmake
-- before calling
-- var a: this is a
-- var b: this is b
-- -------
-- inside function
-- arg a: var_a
-- arg b: var_b
-- -------
-- var a via arg: this is a
-- var b via arg: this is b
-- -------
-- -------
-- after calling
-- var a: a is changed!
-- var b: this is b
-- before calling
-- var c: this is c
-- var d: this is d
-- -------
-- inside macro
-- arg c: var_c
-- arg d: var_d
-- -------
-- var c via arg: this is c
-- var d via arg: this is d
-- -------
CMake Warning (dev) at functions-and-macros.cmake:48 (set):
  Cannot set "var_c": current scope has no parent.
Call Stack (most recent call first):
  functions-and-macros.cmake:56 (my_macro)
This warning is for project developers.  Use -Wno-dev to suppress it.

-- -------
-- after calling
-- var c: this is c
-- var d: d is changed!
]]
