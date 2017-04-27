当(/^我在输入框输入"([^"]*)"后点击按钮$/) do |text|
  HelloPage.set_name text
  HelloPage.say_hello
end

那么(/^我应该看到文本"([^"]*)"$/) do |text|
  HelloPage.should_see_alert_text(text)
end