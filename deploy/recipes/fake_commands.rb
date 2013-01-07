namespace :symfony do
  namespace :init do
      desc "Init Acl is not possible"
      task :acl do
          capifony_pretty_print "--> Forbidden command, your salary is safe."
          capifony_puts_ok
      end
    end
    # not tested :(
    namespace :doctrine do
      namespace :schema do
          desc "Schema drop is not possible"
          task :drop do
              capifony_pretty_print "--> Forbidden command, OK you are not fired."
              capifony_puts_ok
          end
          task :update do
              capifony_pretty_print "--> Forbidden command, your salary is still safe."
              capifony_puts_ok
          end
      end

      namespace :database do
          desc "Database drop is not possible"
          task :drop do
              capifony_pretty_print "--> Forbidden command, you are still part of the team."
              capifony_puts_ok
          end
      end
  end
end
