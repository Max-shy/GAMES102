# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.20.0)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(nameof-populate NONE)

# Pass through things we've already detected in the main project to avoid
# paying the cost of redetecting them again in ExternalProject_Add()
set(GIT_EXECUTABLE [==[E:/GitHub/Git/download/Git/cmd/git.exe]==])
set(GIT_VERSION_STRING [==[2.9.0.windows.1]==])
set_property(GLOBAL PROPERTY _CMAKE_FindGit_GIT_EXECUTABLE_VERSION
  [==[E:/GitHub/Git/download/Git/cmd/git.exe;2.9.0.windows.1]==]
)


include(ExternalProject)
ExternalProject_Add(nameof-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/Neargye/nameof.git" "GIT_TAG" "v0.9.4"
                    SOURCE_DIR          "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-src"
                    BINARY_DIR          "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)


