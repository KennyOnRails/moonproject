module RealLivesHelper
  def render_schedule_type(type_code, type_num)
    num = type_num.to_i
    case type_code
    when 'daily'
      '每天'
    when 'weekly'
      if num >= 1 and num <=5 then
        "每週#{num}"
      elsif num == 6 then
        "每週六"
      elsif num == 7 then
        "每週日"
      end
    when 'monthly'
      if num >= 1 and num <= 31 then
        "每月#{num}號"
      end
    end
  end

end
