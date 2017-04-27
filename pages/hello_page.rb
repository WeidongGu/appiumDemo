module HelloPage
    include Test::Unit::Assertions

    def set_name name
       tf = find_element(:class_name, 'UIATextField')
       tf.type name
    end

    def say_hello
        button('say hello!').click
    end
  
    def should_see_alert_text(text)
        # Alerts can be switched into
        alert = driver.switch_to.alert # Get the text of the current alert, using
        # the Selenium::WebDriver directly
        alerting_text = alert.text
        raise Exception unless alerting_text.include? text
        alert_accept # Accept the current alert
    end

end