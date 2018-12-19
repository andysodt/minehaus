# frozen_string_literal: true

ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :avatar
  decorate_with AdminUserDecorator

  index do
    selectable_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do
    panel 'Admin User Details' do
      attributes_table_for admin_user do
        row('AVATAR') { image_tag admin_user.avatar.variant(resize: "75x75").processed if admin_user.avatar.attached? }
        row('EMail') { admin_user.email }
      end
    end

    active_admin_comments
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :avatar, as: :file
    end
    f.actions
  end
end
