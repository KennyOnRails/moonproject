module ProgressesHelper
  def render_aasm_state_name(progress)
    case progress.aasm_state
      when "ready"
        "待完成"
      when "completed"
        "已完成"
    end
  end
end
