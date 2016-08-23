# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
create_account = User.create([email: 'admin@gmail.com', password: '12345678', password_confirmation: '12345678', name: '測試用帳號'])

create_projects = for i in 1..12 do
  Project.create!([target: "Seed Project-#{i}",
                   subtarget: "Seed建立的計劃-#{i}",
                   success_define: "Seed建立的成功定義-#{i}",
                   possible: "Seed建立的可行性分析-#{i}"])
  for j in 1..Random.new.rand(1..3) do
    RealLife.create!([schedule_type: "daily",
                      description: "Seed建立的測試內容",
                      project_id: i,
                      schedule_num: 0,
                      notify_flag: "0"])
  end
  for k in 1..Random.new.rand(1..5) do
    Progress.create!([project_id: i,
                      deadline: Date.today+Random.new.rand(1..100),
                      description: "Seed建立的完成事項"])
  end
end
