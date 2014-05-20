node[:deploy].each do |application, deploy|

  if deploy[:application_type] == 'rails'
    Chef::Log.info("Restart Sidekiq #{application}")
    
    execute "Restarting Sidekiq #{application}" do
      command "sudo monit restart sidekiq_#{application}"
    end
  
  end
end
