# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :avatar
  decorate_with UserDecorator

  index do
    selectable_column
    column :avatar do |user|
      image_tag user.avatar.variant(resize: "50x50").processed if user.avatar.attached?
    end
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do
    panel 'User Details' do
      attributes_table_for user do
        row :pic do
          image_tag user.avatar.variant(resize: '200x200').processed if user.avatar.attached? 
        end
        row :email do
          user.email
        end
      end
    end

    active_admin_comments
  end

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
