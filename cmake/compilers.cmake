
# File to execute compiler specific commands

SET(COMPILER_INCLUDES "" CACHE INTERNAL "Compiler specific includes")
SET(COMPILER_LBRARIES "" CACHE INTERNAL "Compiler specific libraries")

IF (MSVC)
	INCLUDE(msvc)
ELSEIF(CMAKE_GENERATOR STREQUAL "Unix Makefiles")
	INCLUDE(gcc)
ELSE(MSVC)
	MESSAGE(STATUS "No special handling for this compiler present, good luck!")
	
	IF (NOT FSO_INSTRUCTION_SET STREQUAL "")
		MESSAGE(WARNING "This compiler does not support a special instruction set!")
	
		SET(FSO_INSTRUCTION_SET "")
	ENDIF(NOT FSO_INSTRUCTION_SET STREQUAL "")
ENDIF(MSVC)

IF (WIN32)
ENDIF(WIN32)

IF(NOT FSO_INSTRUCTION_SET STREQUAL "")
	ADD_DEFINITIONS(_D_${FSO_INSTRUCTION_SET})
ENDIF(NOT FSO_INSTRUCTION_SET STREQUAL "")