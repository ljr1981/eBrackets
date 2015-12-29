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

	default_harness_path_and_file: STRING = "C:\temp\harness_file.html"
			-- <Precursor>

	start_command: STRING_32 = "cmd /c start "
			-- <Precursor>

end
