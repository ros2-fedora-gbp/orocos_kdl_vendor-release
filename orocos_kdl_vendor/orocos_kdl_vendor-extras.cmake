# Copyright 2022 Open Source Robotics Foundation, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

find_package(eigen3_cmake_module REQUIRED)
find_package(Eigen3 REQUIRED)
find_package(orocos_kdl REQUIRED)
if(TARGET orocos-kdl)
  message(STATUS "Ensuring Eigen3 include directory is part of orocos-kdl CMake target")
  if(TARGET Eigen3::Eigen)
    # TODO: require target to exist when https://github.com/ros2/choco-packages/issues/19 is addressed
    target_link_libraries(orocos-kdl INTERFACE Eigen3::Eigen)
  else()
    target_include_directories(orocos-kdl SYSTEM INTERFACE ${Eigen3_INCLUDE_DIRS})
  endif()
endif()
