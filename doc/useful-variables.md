CMAKE_PREFIX_PATH:
 - find_library
 - find_file
 - find_package (config mode)
 - find_program

CMAKE_LIBRARY_PATH:
 - find_library

CMAKE_INCLUDE_PATH:
  - find_file

CMAKE_MODULE_PATH:
 - find_package (module mode, Findxxx.cmake>

CMAKE_PROGRAM_PATH:

CMAKE_INSTALL_PREFIX:
 - default value: /usr/local

CMAKE_BUILD_TYPE:
 - Release
 - Debug
 - RelWithDebInfo
 - MinSizeRel

BUILD_SHARED_LIBS
 - default: empty
 - TRUE to build shared libraries

CMAKE_<LANG>_FLAGS
 - e.g., CMAKE_C_FLAGS, CMAKE_CXX_FLAGS

-------

$ENV{PATH}
 - to read the environment variable PATH
 - find_program
