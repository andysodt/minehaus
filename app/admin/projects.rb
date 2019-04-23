# frozen_string_literal: true

ActiveAdmin.register Project do
  permit_params :avatar, :title, task_ids: []
  decorate_with ProjectDecorator

  show title: :title do
    panel 'Project Details' do
      attributes_table_for project do
        row :pic do
          image_tag project.avatar.variant(resize: '200x200').processed if project.avatar.attached? 
        end
        row :title do
          project.title
        end
      end
    end
    panel 'Tasks' do
      table_for project.tasks do |t|
        t.column('Status') { |task| status_tag (task.is_done ? 'Done' : 'Pending')}
        t.column('Title') { |task| link_to task.title, admin_task_path(task) }
        t.column('Assigned To') { |task| task.user.email }
        t.column('Due Date') { |task| task.due_date? ? l(task.due_date, format: :long) : '-' }
      end
    end
  end

  index do
    column :avatar do |project|
      image_tag project.avatar.variant(resize: '50x50').processed if project.avatar.attached?
    end
    column :title do |project|
      link_to project.title, admin_project_path(project)
    end

    actions
  end

  # Filter only by title
  filter :title

  form do |f|
    f.inputs do
      f.input :title
      f.input :avatar, as: :file
    end
    f.actions
  end
end
