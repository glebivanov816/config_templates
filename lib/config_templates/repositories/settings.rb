module ConfigTemplates::Repositories
  class Settings
    def initialize
      @locator = ::ConfigTemplates::Locator.new
    end

    def find_all
      @find_all ||= @locator.settings.reduce({}) {
        |result, current| result.merge ::YAML.load_file current
      }
    end
  end
end