#Project(ABC)

CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

set(INSTALL_RUNTIME_DESTINATION ${CMAKE_INSTALL_PREFIX}/bin CACHE PATH "Installation directory for executables")

FIND_PACKAGE(ITK)
IF (ITK_FOUND)
  INCLUDE(${ITK_USE_FILE})
ELSE (ITK_FOUND)
  MESSAGE(FATAL_ERROR "ITK not found. Please set ITK_DIR.")
ENDIF (ITK_FOUND)

# Build Slicer4 plugin by default
OPTION(COMPILE_SLICER4COMMANDLINE "Compile Slicer4CommandLine" ON)
IF(COMPILE_SLICER4COMMANDLINE) 
  SUBDIRS(Slicer4CommandLine)
ENDIF(COMPILE_SLICER4COMMANDLINE)

OPTION(COMPILE_BRAINSEG "Compile brainseg" OFF)
IF(COMPILE_BRAINSEG) 
  SUBDIRS(Engine/brainseg)
ENDIF(COMPILE_BRAINSEG)

OPTION(COMPILE_STANDALONEGUI "Compile StandAloneGUI" OFF)
IF(COMPILE_STANDALONEGUI) 
  SUBDIRS(StandAloneGUI)
ENDIF(COMPILE_STANDALONEGUI)

OPTION(COMPILE_COMMANDLINE "Compile CommandLine" OFF)
IF(COMPILE_COMMANDLINE) 
  SUBDIRS(StandAloneCLI)
ENDIF(COMPILE_COMMANDLINE)