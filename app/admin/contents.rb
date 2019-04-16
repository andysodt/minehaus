# frozen_string_literal: true

ActiveAdmin.register Content do
	permit_params :title, :description, :attached_file
	decorate_with ContentDecorator
  
	index do
	  selectable_column
	  column :attached_file do |content|
		image_tag content.attached_file if content.attached_file.attached?
	  end
	  column :title
	  column :description
	  actions
	end
  
	filter :title
	filter :description
	filter :created_at
  
	show do
	  panel 'Content Details' do
		attributes_table_for content do
			row('attached file') { image_tag content.attached_file.variant(resize: "75x75").processed if content.attached_file.attached? }
			row('title') { content.title }
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
  