# frozen_string_literal: true

ActiveAdmin.register Resource do
  permit_params :title, :description, :attached_file
  decorate_with ResourceDecorator

  index do
    selectable_column
    column :attached_file do |resource|
      if resource.attached_file.attached?
        if resource.attached_file.previewable?
          image_tag resource.attached_file.preview(resize: '75x75').processed
        elsif resource.attached_file.variable?
          image_tag resource.attached_file.variant(resize: '75x75').processed
        end
      end
    end
    column :title
    column :description
    actions
  end

  filter :title
  filter :description
  filter :created_at

  show do
    panel 'Resource Details' do
      attributes_table_for resource do
        row :attached_file do
          if resource.attached_file.attached?
            if resource.attached_file.previewable?
              image_tag resource.attached_file.preview(resize: '200x200').processed
            elsif resource.attached_file.variable?
              image_tag resource.attached_file.variant(resize: '200x200').processed
            end
        end
        end
        row :title do
          resource.title
        end
        row :description do
          resource.description
        end
      end
    end

    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :attached_file, as: :file
    end
    f.actions
  end
end
