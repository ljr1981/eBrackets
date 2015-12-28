note
	description: "[
		Representation of a "Brackets"-like test harness for HTML/CSS/JS code.
		]"
	synopsis: "[
		Include this class through multiple inheritance on any class inheriting
		from {EQA_TEST_SET}. Doing so will add facilities for taking segments or
		whole pages of HTML, CSS, and JS to display them in Chrome or other favorite
		browser.
		]"
	example_calls: "[
		Using the `harness_page' to enclose "Hello World!":
		---------------------------------------------------
		lauch_in_browser (harness_file ("Hello World!"))
		
		Using the `raw_file', presuming the passed snippet is a complete web page:
		--------------------------------------------------------------------------
		lauch_in_browser (raw_file ("<!DOCTYPE html ... </html>"))
		]"
	ideas: "[
		(1) HASH_TABLE of all browsers/settings
		(2) Make "test" selectable as to which browsers the resulting HTML/CSS/JS is sent to
		(3) Classes for each notion: HTML/Content/CSS/JS
		(4) Various ways to harness and present the content (beyond what is already there)
		]"
	author: "Larry Rix"
	date: "$Date: $"
	revision: "$Revision: $"

deferred class
	BRACKETS

inherit
	EQA_TEST_SET
		select
			default_create
		end

	EQA_COMMONLY_USED_ASSERTIONS
		rename
			assert as unused_assert,
			default_create as unused_default_create
		end

feature {NONE} -- Implementation: Basic Operations

	harness (a_snippet: STRING_32): STRING_32
			-- Put `a_snippet' in `harness'.
		do
			Result := harness_page.twin
			Result.replace_substring_all ("<<SNIPPET>>", a_snippet)
		end

	harnessed_file (a_snippet: STRING_32): DIRECTORY
			-- Place `a_snippet' in `harnessed_file' and set Result as {DIRECTORY} to file.
		do
			Result := raw_file (harness (a_snippet))
		end

	raw_file (a_snippet: STRING_32): DIRECTORY
		local
			l_file: RAW_FILE
			l_path_and_file: STRING_32
		do
			if harness_path_and_file.is_empty then
				l_path_and_file := default_harness_path_and_file.twin
			else
				l_path_and_file := harness_path_and_file.twin
			end
			create l_file.make_open_write (l_path_and_file)
			l_file.put_string (a_snippet)
			l_file.close
			create Result.make_with_name (l_path_and_file)
		end

	launch_in_browser (a_directory: DIRECTORY)
			-- launch `a_directory' file snippet of HTML/CSS/JS in a `browser_exe'.
		do
			l_env.launch (browser_path + browser_exe + local_host + a_directory.path.out + "%" --new-window")
		end

feature -- Assigners

	reset_harness_path_and_file
			-- Reset (`wipe_out') `harness_path_and_file'.
		do
			harness_path_and_file.wipe_out
		end

	set_harness_path_and_file (a_path_and_file: like harness_path_and_file)
			-- Set `a_path_and_file' name into `harness_path_and_file'.
		note
			warnings: "[
				(1) Overrides the `default_harness_path_and_file'
				]"
		do
			harness_path_and_file := a_path_and_file
		ensure
			set: harness_path_and_file.same_string (a_path_and_file)
		end

feature {NONE} -- Implementation: Constants

	harness_path_and_file: STRING assign set_harness_path_and_file
			-- `harness_path_and_file' assigned by `set_harness_path_and_file'.
		attribute
			create Result.make_empty
		end

	default_harness_path_and_file: STRING = "C:\temp\harness_file.html"

	harness_page: STRING_32 = "[
<!DOCTYPE html>
<html lang="en-US">
<body>
<<SNIPPET>>
</body>
</html>
]"

	l_env: EXECUTION_ENVIRONMENT
			-- Execution environment for Current.
		once
			create Result
		end

feature {NONE} -- Generic OS Browser

	browser_exe: STRING
			-- File name of the default `browser_exe'.
		deferred
		end

	browser_path: STRING
			-- Full path to `browser_exe'.
		deferred
		end

	local_host: STRING
			-- `local_host' specification.
		deferred
		end

feature {NONE} -- Windows Chrome

	chrome_exe: STRING = "chrome.exe"

	windows_chrome_path: STRING = "C:\Program Files (x86)\Google\Chrome\Application\"

	windows_local_host: STRING = " %"file://localhost/"

end
