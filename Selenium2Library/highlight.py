# by @glmeece on RF Slack 

def highlight(element, sleep_amount=.33):
    """== Highlights (blinks) a Selenium Webdriver element ==

    - Pass in a Selenium web element, (and optionally a sleep time value).
    - Highlights the web element with the defined style for the time specified.
    
    == Calling ==
    
    | *Args* | ``element`` (object) | Selenium web object. |
    | *Args* | ``sleep_amount`` (float) | _Optional_ Fractional time amount to "hold" the highlight. |
    | *Returns* | [none] |  |
    | *Raises* | [none] |  |

    === Example in Robot ===
    
    | ${the_element} =    Get Webelement   //*[@id="theElementID"]  # Creates the actual Selenium object
    | Highlight           ${the_element}  # does the actual highlighting
    ...alternately, with specified time:
    | Highlight           ${the_element}  sleep_amount=${1.5}  # Must encapsulate float value this way
    """
    driver = element._parent
    # Make the next two variables, we can tweak the style of highlighting more easily
    back_color = "yellow"
    outline_style = "2px dotted red"
    def apply_style(s):
        driver.execute_script("arguments[0].setAttribute('style', arguments[1]);",
                              element, s)
    original_style = element.get_attribute('style')
    hilite_style = ("background: {}; border: {};").format(back_color, outline_style)
    apply_style(hilite_style)
    time.sleep(sleep_amount)
    apply_style(original_style)
