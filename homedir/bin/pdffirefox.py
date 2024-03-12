#!/usr/bin/env python3
"""INCOMPLETE Convert url to pdf."""

from time import sleep

from helium import start_firefox
from selenium.webdriver import FirefoxOptions

#URL = "https://www.deskriders.dev/posts/1639863087-python-selenium/"
#URL = "file:///home/sendai/Downloads/Educative - Grokking the Coding Interview Patterns for Coding Questions 2022-7/01. Introduction/2 Course Overview - Grokking the Coding Interview_ Patterns for Coding Questions.html"
URL = "file:///home/sendai/Downloads/Educative - Grokking Modern System Design Interview for Engineers & Managers 2022-10/08. Load Balancers/1. Introduction to Load Balancers.html"

options = FirefoxOptions()

options.add_argument("--start-maximized")

options.set_preference("print.always_print_silent", True)
options.set_preference("print.save_as_pdf.links.enabled", True)

options.set_preference("print_printer", "Mozilla Save to PDF")
options.set_preference("print.printer_Mozilla_Save_to_PDF.print_to_file", True)
options.set_preference("print.printer_Mozilla_Save_to_PDF.print_to_filename", "/home/sendai/html2pdf.pdf")

options.set_preference("print.print_headercenter", "")
options.set_preference("print.print_headerleft", "")
options.set_preference("print.print_headerright", "")
options.set_preference("print.print_footercenter", "")
options.set_preference("print.print_footerleft", "")
options.set_preference("print.print_footerright", "")

options.set_preference("print.print_bgcolor", False)
options.set_preference("print.print_bgimages", False)

# options.set_preference("print.print_reversed", True)
# options.set_preference("print.shrink-to-fit.scale-limit-percent", 20)


# options.set_preference("print.shrink-to-fit", True)
# options.set_preference("print.shrink_to_fit", True)

# options.set_preference("print.print_unwriteable_margin_top", 0)
# options.set_preference("print.print_unwriteable_margin_left", 0)
# options.set_preference("print.print_unwriteable_margin_right", 0)
# options.set_preference("print.print_unwriteable_margin_bottom", 0)

# options.set_preference("print.print_edge_top", 0)
# options.set_preference("print.print_edge_left", 0)
# options.set_preference("print.print_edge_right", 0)
# options.set_preference("print.print_edge_bottom", 0)
# options.set_preference("print.print_margin_top", 0)
# options.set_preference("print.print_margin_left", 0)
# options.set_preference("print.print_margin_right", 0)
# options.set_preference("print.print_margin_bottom", 0)


driver = start_firefox(URL, options=options)

driver.execute_script("window.print();")
sleep(2)  # Found that a little wait is needed for the print to be rendered otherwise the file will be corrupted

driver.quit()

# Scale: fit to page width
# Margins: none / -default-
# Format: original / -simplified-
# Options: "print backgrounds" "print headers and footers"
#
# https://www.deskriders.dev/posts/1640791840-selenium-firefox-and-saving-webpage-as-pdf/
# https://searchfox.org/mozilla-central/source/modules/libpref/init/all.js
# https://searchfox.org/mozilla-central/source/widget/nsPrintSettingsService.cpp
