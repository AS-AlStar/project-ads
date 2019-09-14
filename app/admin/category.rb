# frozen_string_literal: true
# rubocop:disable all

ActiveAdmin.register Category do
  config.per_page = 10

  permit_params :name, :status

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :status
    actions
  end

  filter :name
  filter :created_at
  filter :status

  form do |f|
    f.inputs do
      f.input :name
      f.input :status
    end
    f.actions
  end
end
