# Copyright (c) 2018, Kuang Fangjun <csukuangfj at gmail dot com>.
# All rights reserved.

#[[
refer to
 - https://cmake.org/cmake/help/latest/command/cmake_parse_arguments.html
 - https://cmake.org/cmake/help/latest/command/function.html
]]

function(say_hello)
  set(options OPTION NONE) # print nothing
  set(language "LANGUAGE")
  set(text "TEXT")

  cmake_parse_arguments(hello "${options}" "${language}" "${text}"  ${ARGV})

  if (${hello_NONE})
    message(STATUS "NONE is specified!")
    return()
  elseif(hello_OPTION)
    message(STATUS "Option is specified")
  endif()
  if(hello_LANGUAGE STREQUAL "English")
    message(STATUS "Hello world")
  elseif(hello_LANGUAGE STREQUAL "Chinese")
    message(STATUS "Ni hao")
  elseif(hello_LANGUAGE STREQUAL "German")
    message(STATUS "Hallo Welt")
  endif()

  if (hello_TEXT)
    foreach (text ${hello_TEXT})
      message(STATUS "text: ${text}")
    endforeach()
  endif()

  if (hello_UNPARSED_ARGUMENTS)
    message(STATUS "extras: ${hello_UNPARSED_ARGUMENTS}")
  endif()
endfunction()

say_hello(LANGUAGE German)
say_hello(LANGUAGE Chinese)
say_hello(LANGUAGE English)
say_hello(OPTION)
say_hello(OPTION a b c)
say_hello(OPTION TEXT a b c)
say_hello(OPTION TEXT c LANGUAGE German a b)

#[[
usage:
$ cmake -P cmake_parse_arguments-test.cmake
-- Hallo Welt
-- Ni hao
-- Hello world
-- Option is specified
-- Option is specified
-- extras: a;b;c
-- Option is specified
-- text: a
-- text: b
-- text: c
-- Option is specified
-- Hallo Welt
-- text: c
-- extras: a;b
]]
