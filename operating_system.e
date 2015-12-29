note
	description: "Abstract notion of an Operating System"
	author: "Larry Rix"
	synopsis: "[
		This class is here (to begin with) as a way to open URLs on
		various operating systems using the appropriate command for
		the target OS.
		
		Windows: 	cmd /c start filename_or_URL
		Linux:		xdg-open filename_or_URL
		Mac:		open filename_or_URL
		
		Nearly all operating systems have a simple command to open up 
		a file, directory, or URL from the command line. This is really 
		handy when you’re writing a program, because these are easy to 
		invoke from almost any language.
		]"
	EIS: "src=http://www.dwheeler.com/essays/open-files-urls.html"
	date: "$Date: $"
	revision: "$Revision: $"

deferred class
	OPERATING_SYSTEM

feature -- Access

	default_harness_path_and_file: STRING
			-- `default_harness_path_and_file'.
		deferred
		end

	start_command: STRING_32
			-- `start_command' used at command-line of {OPERATING_SYSTEM} to start designated handler for file-type X.
		deferred
		end

end
