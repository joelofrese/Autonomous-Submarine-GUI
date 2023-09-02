# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_em_yeu_anh_ko_thuong_tiec_gi_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED em_yeu_anh_ko_thuong_tiec_gi_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(em_yeu_anh_ko_thuong_tiec_gi_FOUND FALSE)
  elseif(NOT em_yeu_anh_ko_thuong_tiec_gi_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(em_yeu_anh_ko_thuong_tiec_gi_FOUND FALSE)
  endif()
  return()
endif()
set(_em_yeu_anh_ko_thuong_tiec_gi_CONFIG_INCLUDED TRUE)

# output package information
if(NOT em_yeu_anh_ko_thuong_tiec_gi_FIND_QUIETLY)
  message(STATUS "Found em_yeu_anh_ko_thuong_tiec_gi: 0.0.0 (${em_yeu_anh_ko_thuong_tiec_gi_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'em_yeu_anh_ko_thuong_tiec_gi' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${em_yeu_anh_ko_thuong_tiec_gi_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(em_yeu_anh_ko_thuong_tiec_gi_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${em_yeu_anh_ko_thuong_tiec_gi_DIR}/${_extra}")
endforeach()
