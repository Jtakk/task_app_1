module SchedulesHelper

  # boolean型のtrueを"○"に変換"
  def signature(boolean)
    case boolean
    when true
      return "○"
    when false
      return ""
    end
  end
  
end
