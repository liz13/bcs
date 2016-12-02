
set(CoupledDD_VERSION 0.0.1)
include(CMakeFindDependencyMacro)
# we will use find_dependency, but we don't want to force
# our users to have to specify where all of our dependencies
# were installed; that defeats the whole point of automatically
# importing dependencies.
# since the documentation for find_dependency() doesn't mention
# a PATHS argument, we'll temporarily add the prefixes to
# CMAKE_PREFIX_PATH.
set(CoupledDD_DEPS "")
set(CoupledDD_DEP_PREFIXES "")
set(CoupledDD_BACKUP_PREFIX_PATH "${CMAKE_PREFIX_PATH}")
set(CMAKE_PREFIX_PATH "${CoupledDD_DEP_PREFIXES};${CMAKE_PREFIX_PATH}")
foreach(dep IN LISTS CoupledDD_DEPS)
  find_dependency(${dep})
endforeach()
set(CMAKE_PREFIX_PATH "${CoupledDD_BACKUP_PREFIX_PATH}")
set(CoupledDD_EXPORTED_TARGETS "")
foreach(tgt IN LISTS CoupledDD_EXPORTED_TARGETS)
  include(${CMAKE_CURRENT_LIST_DIR}/${tgt}-target.cmake)
endforeach()
set(CoupledDD_COMPILER "/usr/local/mpich3/3.1.2-thread-multiple/bin/mpicxx")
set(CoupledDD_CXX_FLAGS " -O2 -g -Werror -Wall -Wextra --std=c++11 ")
