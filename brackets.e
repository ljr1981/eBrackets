note
	description: "[
		Representation of a "Brackets"-like test harness for HTML/CSS/JS code.
		]"
	synopsis: "[
		Include this class through multiple inheritance on any class inheriting
		from {EQA_TEST_SET}. Doing so will add facilities for taking segments or
		whole pages of HTML, CSS, and JS to display them in Chrome or other favorite
		browser.
		
		Standard steps:
		---------------
		(1) Create a new *_TEST_SET, placing {BRACKETS} in the inheritance.
		(2) Create a new test which generates some snippet of HTML/CSS/JS.
		(3) Pass the snippet to one of several features which will place the
			snippet in an appropriate "harness".
		(4) Pass the harnessed snippet to the `render_in_browser' feature, which
			will load the specified browser, and then the generated HTML harness
			file will be given to it for rendering.
		(5) Make changes to your code as-needed.
		(6) Compile and re-run the created test(s) to re-render in the browser.
		
		Repeat steps (5) and (6) as often as required until the rendering and
		behavior of the code in the browser is Correct.

		(ref: EIS below)

		The Brackets products offers two very useful services:

		(1) Faster feedback cycle to see changes in HTML/CSS/JS -> Browser.
		(2) Simpler management of HTML references in CSS and JS.

		This library facilitates the first use of the Brackets product. The second
		facility is handled by Eiffel and any library which will properly link
		each CSS and JS DOM reference to its appropriate HTML element. This library
		ought to also consolidate at least CSS in such a way that the CSS delivered
		to the browser is the smallest specification possible (for speed and latency
		purposes).
		
		This second notion is more or less represented in products like Sass (a style
		sheet language). See the EIS link below for WikiPedia article on Sass. The
		primary take-away from the link is that Sass brings "Object Oriented" to CSS
		and CSS-3. While this is a nice thought, the question immediately arises: Why?
		We already have OO languages (e.g. Eiffel). Why not build a class library
		which allows CSS/CSS3 to be compiled, properly processed, and managed? Thus,
		The second notion of the Brackets product is handled by development of such
		libraries, which will not only aid in the management of CSS, but in compiling
		the resulting CSS down to the bare minimum required to make delivery to the
		client browser as fast as possible.
		]"
	EIS: "src=http://brackets.io/"
	EIS: "src=https://en.wikipedia.org/wiki/Sass_(stylesheet_language)"
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
		]"
	author: "Larry Rix"
	date: "$Date: $"
	revision: "$Revision: $"

deferred class
	BRACKETS [G -> OPERATING_SYSTEM create default_create end]

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
			-- Place `a_snippet' in `harness' of `harness_page'.
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
			-- Place `a_snippet' into a raw file using either `default_harness_path_and_file' or `harness_path_and_file'.
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

	render_in_browser (a_file: DIRECTORY)
			-- Render `a_file' harnessed HTML/CSS/JS file snippet using the common `start_command'.
		do
			execution_environment.launch (start_command + a_file.path.out)
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

	harness_page: STRING_32 = "[
<!DOCTYPE html>
<html lang="en-US">
<body>
<<SNIPPET>>
</body>
</html>
]"

	execution_environment: EXECUTION_ENVIRONMENT
			-- Execution environment for Current.
		once
			create Result
		end

	default_harness_path_and_file: STRING
		once
			Result := (create {G}).default_harness_path_and_file
		end

	start_command: STRING_32
			-- Constant representing specific windows-based start command.
		once
			Result := (create {G}).start_command
		end

end
