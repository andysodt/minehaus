# frozen_string_literal: true

ActiveAdmin.register Task do
  permit_params :project_id, :user_id, :title, :is_done, :due_date

  scope :all, default: true
  scope :due_this_week do |tasks|
    tasks.where('due_date > ? and due_date < ?', Time.now, 1.week.from_now)
  end
  scope :late do |tasks|
    tasks.where('due_date < ?', Time.now)
  end
  scope :mine do |tasks|
    tasks.where(user_id: current_user.id)
  end

  show do
    panel 'Task Details' do
      attributes_table_for task do
        row('Status') { status_tag (task.is_done ? 'Done' : 'Pending'), (task.is_done ? :ok : :error) }
        row('Title') { task.title }
        row('Project') { link_to task.project.title, admin_project_path(task.project) }
        row('Assigned To') { link_to task.user.email, admin_user_path(task.user) }
        row('Due Date') { task.due_date? ? l(task.due_date, format: :long) : '-' }
      end
    end

    active_admin_comments
  end

  index do
    column :title
    column :is_done
    column :due_date
    column :user

    actions
  end

  sidebar 'Other Tasks For This User', only: :show do
    table_for current_user.tasks.where(project_id: task.project) do |t|
      t.column('Status') { |task| status_tag (task.is_done ? 'Done' : 'Pending'), (task.is_done ? :ok : :error) }
      t.column('Title') { |task| link_to task.title, admin_task_path(task) }
    end
  end
end
