note
	description: "[
		Tests of a "Brackets"-like test system.
		]"
	author: "Larry Rix"
	date: "$Date: $"
	revision: "$Revision: $"
	testing: "type/manual"

class
	BRACKETS_TEST_SET

inherit
	BRACKETS [WINDOWS_OPERATING_SYSTEM]

feature -- Test routines

	hello_world_test
			-- Test of `no_graphics'.
		do
			set_harness_path_and_file ("C:/temp/hello_world.html")
			render_in_browser (harnessed_file (hello_world))
		end

	basic_microformatted_hcard_test
			-- Test of `basic_microformatted_hcard'
		note
			EIS: "src=https://css-tricks.com/snippets/html/basic-microformatted-hcard/"
		do
			set_harness_path_and_file ("C:/temp/basic_microformatted_hcard.html")
			render_in_browser (harnessed_file (basic_microformatted_hcard))
		end

	left_right_halves_layout_test
			-- Test of `left_right_halves_layout'.
		note
			EIS: "src=https://css-tricks.com/snippets/html/left-right-halves-layout/"
		do
			set_harness_path_and_file ("C:/temp/left_right_halves_layout.html")
			render_in_browser (raw_file (left_right_halves_layout))
		end

	corner_ribbon_test
			-- Test of `corner_ribbon'.
		note
			EIS: "src=https://css-tricks.com/snippets/css/corner-ribbon/"
		do
			set_harness_path_and_file ("C:/temp/corner_ribbon.html")
			render_in_browser (raw_file (corner_ribbon))
		end

	flex_products_test
			-- Test of `flex_products'.
		note
			EIS: "src=https://drafts.csswg.org/css-flexbox/#overview"
		local
			l_html: STRING_32
			l_path: STRING_32
		do
			set_harness_path_and_file ("C:/temp/flex_products.html")
			l_path := execution_environment.current_working_path.absolute_path.out
			l_html := flex_products.twin
			l_html.replace_substring_all ("<<COMPUTER_IMAGE>>", l_path + "\tests\images\computer.jpg")
			l_html.replace_substring_all ("<<PRINTER_IMAGE>>", l_path + "\tests\images\printer.png")
			render_in_browser (harnessed_file (l_html))
		end

feature {NONE} -- Implementation: Snippets

	hello_world: STRING_32 = "[
Hello World!
]"

	basic_microformatted_hcard: STRING_32
		do
			Result := "[
<div id="hcard-Christopher-John-Coyier" class="vcard">
 <a class="url fn n" href="http://chriscoyier.net">
  <span class="given-name">Christopher</span>
  <span class="additional-name">John</span>
  <span class="family-name">Coyier</span>
</a>
 <div class="org">CSS-Tricks</div>
 <a class="email" href="mailto:chriscoyier@gmail.com">chriscoyier@gmail.com</a>
 <div class="adr">
  <div class="street-address">123 Appleseed Street</div>
  <span class="locality">Chicago</span>, <span class="region">IL </span> <span class="postal-code">60647</span>
  <span class="country-name">United States</span>
 </div>
 <div class="tel">555-555-5555</div>
</div>
]"
		end

	left_right_halves_layout: STRING_32
		do
			Result := "[
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<title>Some Example from CSS-Tricks</title>
	
	<style type="text/css">
	   
	   * { margin: 0; padding: 0; }
	   p { padding: 10px; }
	   #left { position: absolute; left: 0; top: 0; width: 50%; }
	   #right { position: absolute; right: 0; top: 0; width: 50%; }
	
	</style>
</head>

<body>

    <div id="left">
        <p>Left Half</p>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
    </div>

    <div id="right">
        <p>Right Half</p>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>
    </div>

</body>

</html>
]"
		end

	corner_ribbon: STRING_32 = "[
<div class="wrapper">
	<div class="ribbon-wrapper-green">
		<div class="ribbon-green">
			NEW!!!
		</div>
	</div>
</div>​
<style>
.wrapper {
  margin: 50px auto;
  width: 800px;
  height: 600px;
  background: skyblue;
  border-radius: 20px;
  -webkit-box-shadow: 0px 0px 8px rgba(0,0,0,0.3);
  -moz-box-shadow:    0px 0px 8px rgba(0,0,0,0.3);
  box-shadow:         0px 0px 8px rgba(0,0,0,0.3);
  position: relative;
  z-index: 90;
}

.ribbon-wrapper-green {
  width: 85px;
  height: 88px;
  overflow: hidden;
  position: absolute;
  top: -3px;
  right: -3px;
}

.ribbon-green {
  font: bold 15px Sans-Serif;
  color: #333;
  text-align: center;
  text-shadow: rgba(255,255,255,0.5) 0px 1px 0px;
  -webkit-transform: rotate(45deg);
  -moz-transform:    rotate(45deg);
  -ms-transform:     rotate(45deg);
  -o-transform:      rotate(45deg);
  position: relative;
  padding: 7px 0;
  left: -5px;
  top: 15px;
  width: 120px;
  background-color: #BFDC7A;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#BFDC7A), to(#8EBF45)); 
  background-image: -webkit-linear-gradient(top, #BFDC7A, #8EBF45); 
  background-image:    -moz-linear-gradient(top, #BFDC7A, #8EBF45); 
  background-image:     -ms-linear-gradient(top, #BFDC7A, #8EBF45); 
  background-image:      -o-linear-gradient(top, #BFDC7A, #8EBF45); 
  color: #6a6340;
  -webkit-box-shadow: 0px 0px 3px rgba(0,0,0,0.3);
  -moz-box-shadow:    0px 0px 3px rgba(0,0,0,0.3);
  box-shadow:         0px 0px 3px rgba(0,0,0,0.3);
}

.ribbon-green:before, .ribbon-green:after {
  content: "";
  border-top:   3px solid #6e8900;   
  border-left:  3px solid transparent;
  border-right: 3px solid transparent;
  position:absolute;
  bottom: -3px;
}

.ribbon-green:before {
  left: 0;
}
.ribbon-green:after {
  right: 0;
}​
</style>
]"

	flex_products: STRING_32 = "[
<style>
#deals {
  display: flex;        /* Flex layout so items have equal height  */
  flex-flow: row wrap;  /* Allow items to wrap into multiple lines */
}
.sale-item {
  display: flex;        /* Lay out each item using flex layout */
  flex-flow: column;    /* Lay out item’s contents vertically  */
  background: hsl(60,100%,90%);
  border: medium inset hsl(120,70%,40%);
  border-radius: 10px;
  padding: 5px;
  font-size: 11pt;
}
.sale-item > img {
  order: -1;            /* Shift image before other content (in visual order) */
  align-self: center;   /* Center the image cross-wise (horizontally)         */
}
.sale-item > button {
  margin-top: auto;     /* Auto top margin pushes button to bottom */
  background-color: hsl(120,100%,40%);
  border: medium inset hsl(120,70%,40%);
  border-radius: 1em;
  padding: .5em;
  font-weight: bold;
  color: white;
  font-size: 1.6em;
  cursor: pointer;
  width: 90%;
  margin: 1em auto;
}
</style>
<section id="deals">
  <section class="sale-item">
    <h1>Computer Starter Kit</h1>
    <p>This is the best computer money can buy, if you don’t have much money.
    <ul>
      <li>Computer
      <li>Monitor
      <li>Keyboard
      <li>Mouse
    </ul>
    <img src="<<COMPUTER_IMAGE>>"
         alt="You get: a white computer with matching peripherals.">
    <button>BUY NOW</button>
  </section>
  <section class="sale-item">
    <h1>Computer Printer Kit</h1>
    <p>This is the best printer money can buy, if you don’t have much money.
    <ul>
      <li>Printer
      <li>Paper
      <li>Ink
      <li>Cable
    </ul>
    <img src="<<PRINTER_IMAGE>>"
         alt="You get: a white printer with printer stuff.">
    <button>BUY NOW</button>
  </section>
</section>
]"

end


