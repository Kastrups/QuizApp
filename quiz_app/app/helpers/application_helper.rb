module ApplicationHelper
    def flash_class(level)
      case level.to_sym
      when :notice then "green"
      when :alert then "red"
      else "blue"
      end
    end
  end
  