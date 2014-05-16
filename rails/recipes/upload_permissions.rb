node[:deploy].each do |application, deploy|
  
  if deploy[:application_type] == 'rails'

    execute "Rails upload permissions" do
      cwd deploy[:current_path]
      command "chmod 666 tmp"
    end
    
  end
end
    
