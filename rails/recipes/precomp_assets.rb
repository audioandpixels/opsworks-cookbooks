Chef::Log.info("Precompiling assets for RAILS_ENV=production...")

execute "rake assets:precompile" do
  cwd release_path
  command "bundle exec rake assets:precompile"
  environment "RAILS_ENV" => "production"
end