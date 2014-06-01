node[:deploy].each do |application, deploy|

  execute "restart Rails app #{application} for custom env" do
    command "command "sleep 300 && sudo monit restart sidekiq_#{application}"
    action :nothing
  end

end
