
if(NOT "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-subbuild/nameof-populate-prefix/src/nameof-populate-stamp/nameof-populate-gitinfo.txt" IS_NEWER_THAN "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-subbuild/nameof-populate-prefix/src/nameof-populate-stamp/nameof-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: 'E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-subbuild/nameof-populate-prefix/src/nameof-populate-stamp/nameof-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "E:/GitHub/Git/download/Git/cmd/git.exe"  clone --no-checkout --config "advice.detachedHead=false" "https://github.com/Neargye/nameof.git" "nameof-src"
    WORKING_DIRECTORY "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/Neargye/nameof.git'")
endif()

execute_process(
  COMMAND "E:/GitHub/Git/download/Git/cmd/git.exe"  checkout v0.9.4 --
  WORKING_DIRECTORY "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'v0.9.4'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "E:/GitHub/Git/download/Git/cmd/git.exe"  submodule update --recursive --init 
    WORKING_DIRECTORY "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-subbuild/nameof-populate-prefix/src/nameof-populate-stamp/nameof-populate-gitinfo.txt"
    "E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-subbuild/nameof-populate-prefix/src/nameof-populate-stamp/nameof-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'E:/CG/Games/GAMES102/Assignment/102/GAMES102-main/homeworks/project/build/_deps/nameof-subbuild/nameof-populate-prefix/src/nameof-populate-stamp/nameof-populate-gitclone-lastrun.txt'")
endif()

