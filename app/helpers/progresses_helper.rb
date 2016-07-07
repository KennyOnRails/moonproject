module ProgressesHelper
  def render_aasm_state_name(progress)
    case progress.aasm_state
      when "ready"
        "待完成"
      when "completed"
        "已完成"
    end
  end
  def render_deadline_format(progress)
    if ENV['RACK_ENV'] == 'production' then
      date_hash = progress.deadline
      deadline_string = "#{date_hash[1]}/#{date_hash[2]}/#{date_hash[3]}"
    else
      progress.deadline
    end
  end
end
