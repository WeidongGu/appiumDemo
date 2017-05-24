Before do
  initialise_appium
end

def load_config
  capabilities_file_path=File.dirname(__FILE__)+"/capabilities.yml"
  $APP_PATH=YAML.load_file(capabilities_file_path)[:app_path]
  $PLATFORMVERSION=YAML.load_file(capabilities_file_path)[:platform_version]
  $DEVICENAME=YAML.load_file(capabilities_file_path)[:device_name]
  $IMPLICITWAITTIME=YAML.load_file(capabilities_file_path)[:implicit_wait_time]
  $FULLRESET=YAML.load_file(capabilities_file_path)[:full_reset]
  $NORESET=YAML.load_file(capabilities_file_path)[:no_reset]
end

def load_caps
  $DESIRED_CAPS = {
      caps: {
          platformName: 'iOS',
          deviceName: $DEVICENAME,
          language: $LANGUAGE,
          locale: $LOCALE,
          app: $APP_PATH,
          platformVersion: $PLATFORMVERSION,
          fullReset: $FULLRESET,
          noReset: $NORESET
      },
      appium_lib: {
          sauce_username: nil,
          sauce_access_key: nil
      }
  }
end

def initialise_appium
  load_config
  load_caps
  @driver=Appium::Driver.new($DESIRED_CAPS)
  Appium.promote_appium_methods self.class
  @driver.start_driver.manage.timeouts.implicit_wait = $IMPLICITWAITTIME
end

def take_screenshot scenario
  screenshot_path = "./hms/#{scenario}.png"
  screenshot screenshot_path
end

After do |scenario|
  if scenario.failed?
    take_screenshot scenario.name
  end

  @driver.driver_quit

end