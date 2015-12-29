note
	description: "Summary description for {WINDOWS_OPERATING_SYSTEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WINDOWS_OPERATING_SYSTEM

inherit
	OPERATING_SYSTEM

feature -- Access

	start_command: STRING_32 = "cmd /c start "
			-- `start_command' used at command-line of {OPERATING_SYSTEM} to start designated handler for file-type X.

end
