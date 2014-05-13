node[:deploy].each do |application, deploy|
  
  if deploy[:application_type] == 'rails'
  
    deploy = node[:deploy][application]
    rails_env = deploy[:rails_env]

    Chef::Log.info("Cleaning up Rails assets with environment #{rails_env}")

    execute 'rake assets:clobber' do
      cwd deploy[:current_path]
      user 'deploy'
      command 'bundle exec rake assets:clobber'
      environment 'RAILS_ENV' => rails_env
    end
  
    Chef::Log.info("Precompiling Rails assets with environment #{rails_env}")

    execute 'rake assets:precompile' do
      cwd deploy[:current_path]
      user 'deploy'
      command 'bundle exec rake assets:precompile'
      environment 'RAILS_ENV' => rails_env
    end
  
  end
end
