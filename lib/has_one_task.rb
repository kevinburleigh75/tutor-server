module HasOneTask

  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def has_one_task
      class_eval do
        has_one :task, as: :details, dependent: :destroy
        delegate :type, :task_plan_id, :opens_at, :due_at, :is_shared, to: :task

        def type
          task.details_type
        end
      end
    end
  end

end

ActiveRecord::Base.send :include, HasOneTask