# Copyright (c) 2018, Kuang Fangjun <csukuangfj at gmail dot com>.
# All rights reserved.

#[[
refer to
 - https://cmake.org/cmake/help/latest/command/cmake_host_system_information.html
 - https://github.com/Kitware/CMake/blob/master/Tests/CMakeTests/CMakeHostSystemInformationTest.cmake.in
]]

function(print_host_system_info key)
  cmake_host_system_information(RESULT value QUERY ${key})
  message(STATUS "${key}: ${value}")
endfunction()

print_host_system_info(NUMBER_OF_LOGICAL_CORES)
print_host_system_info(NUMBER_OF_PHYSICAL_CORES)
print_host_system_info(HOSTNAME)
print_host_system_info(FQDN)
print_host_system_info(TOTAL_VIRTUAL_MEMORY)
print_host_system_info(AVAILABLE_VIRTUAL_MEMORY)
print_host_system_info(TOTAL_PHYSICAL_MEMORY)
print_host_system_info(AVAILABLE_PHYSICAL_MEMORY)
print_host_system_info(IS_64BIT)
print_host_system_info(HAS_FPU)
print_host_system_info(HAS_MMX)
print_host_system_info(HAS_MMX_PLUS)
print_host_system_info(HAS_SSE)
print_host_system_info(HAS_SSE2)
print_host_system_info(HAS_SSE_FP)
print_host_system_info(HAS_SSE_MMX)
print_host_system_info(HAS_AMD_3DNOW)
print_host_system_info(HAS_AMD_3DNOW_PLUS)
print_host_system_info(HAS_IA64)
print_host_system_info(HAS_SERIAL_NUMBER)
print_host_system_info(PROCESSOR_SERIAL_NUMBER)
print_host_system_info(PROCESSOR_NAME)
print_host_system_info(PROCESSOR_DESCRIPTION)
print_host_system_info(OS_NAME)
print_host_system_info(OS_RELEASE)
print_host_system_info(OS_VERSION)
print_host_system_info(OS_PLATFORM)

#[[
usage:
$ cmake -P cmake_host_system_information.cmake
-- NUMBER_OF_LOGICAL_CORES: 4
-- NUMBER_OF_PHYSICAL_CORES: 2
-- HOSTNAME: localhost
-- FQDN: localhost
-- TOTAL_VIRTUAL_MEMORY: 2048
-- AVAILABLE_VIRTUAL_MEMORY: 1316
-- TOTAL_PHYSICAL_MEMORY: 4096
-- AVAILABLE_PHYSICAL_MEMORY: 41
-- IS_64BIT: 1
-- HAS_FPU: 1
-- HAS_MMX: 1
-- HAS_MMX_PLUS: 0
-- HAS_SSE: 1
-- HAS_SSE2: 1
-- HAS_SSE_FP: 0
-- HAS_SSE_MMX: 0
-- HAS_AMD_3DNOW: 0
-- HAS_AMD_3DNOW_PLUS: 0
-- HAS_IA64: 0
-- HAS_SERIAL_NUMBER: 0
-- PROCESSOR_SERIAL_NUMBER:
-- PROCESSOR_NAME: Intel(R) Core(TM) i5-5250U CPU @ 1.60GHz
-- PROCESSOR_DESCRIPTION: 2 core Intel(R) Core(TM) i5-5250U CPU @ 1.60GHz
-- OS_NAME: Mac OS X
-- OS_RELEASE: 10.11.3
-- OS_VERSION: 15D21
-- OS_PLATFORM: x86_64
]]
