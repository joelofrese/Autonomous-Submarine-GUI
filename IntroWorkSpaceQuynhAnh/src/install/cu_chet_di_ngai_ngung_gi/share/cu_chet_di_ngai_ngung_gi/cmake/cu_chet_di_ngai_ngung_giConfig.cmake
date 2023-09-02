# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_cu_chet_di_ngai_ngung_gi_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED cu_chet_di_ngai_ngung_gi_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(cu_chet_di_ngai_ngung_gi_FOUND FALSE)
  elseif(NOT cu_chet_di_ngai_ngung_gi_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(cu_chet_di_ngai_ngung_gi_FOUND FALSE)
  endif()
  return()
endif()
set(_cu_chet_di_ngai_ngung_gi_CONFIG_INCLUDED TRUE)

# output package information
if(NOT cu_chet_di_ngai_ngung_gi_FIND_QUIETLY)
  message(STATUS "Found cu_chet_di_ngai_ngung_gi: 0.0.0 (${cu_chet_di_ngai_ngung_gi_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'cu_chet_di_ngai_ngung_gi' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${cu_chet_di_ngai_ngung_gi_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(cu_chet_di_ngai_ngung_gi_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${cu_chet_di_ngai_ngung_gi_DIR}/${_extra}")
endforeach()
