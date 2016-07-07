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
      #date_str = progress.deadline
      #date_str.slice! "{"
      #date_str.slice! "}"
      #date_hash = Hash[date_hash.split(",").collect{|x| x.strip.split("=>")}]
      #deadline_format = "#{date_hash['1']}/#{date_hash['2']}/#{date_hash['3']}"
      progress.deadline
    else
      progress.deadline
    end
  end
end
