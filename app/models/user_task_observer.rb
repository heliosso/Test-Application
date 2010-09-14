class UserTaskObserver < ActiveRecord::Observer
  require 'net/http'


    def after_create(record)
      send_hook(record, :completed)
    end

    def after_update(record)
      #send_hook(record, :update)
    end

    def after_destroy(record)
      #send_hook(record, :destroy)
    end

    private
      def send_hook(record, status)
        uri = URI.parse('http://localhost:3001/hooks/task')
        Net::HTTP.post_form(uri, {
          'task_title'        => record.task.title,
          'task_description'   => record.task.description,
          'task_list'    =>  record.task.task_list.name,
          'status' => status
        })
      end
end



