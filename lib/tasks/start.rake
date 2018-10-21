namespace :start do
  desc 'Start dev server'
  task :development do
    exec 'foreman start -f Procfile'
  end
end
task :start => 'start:development'