# frozen_string_literal: true
# rubocop:disable all

ActiveAdmin.register User do
  config.per_page = 10

  member_action :make_admin, method: :patch do
    User.find(params[:id]).update(role: 'admin')
    flash[:notice] = 'User successfully has become Admin'
    redirect_to admin_user_path, id: params[:id]
  end

  member_action :make_user, method: :patch do
    User.find(params[:id]).update(role: 'default')
    flash[:notice] = 'User successfully has become Default'
    redirect_to admin_user_path, id: params[:id]
  end

  action_item :make_admin, only: :show do
    if user.role == 'default'
      link_to 'Make Admin', make_admin_admin_user_path(user), method: :patch
    else
      link_to 'Make User', make_user_admin_user_path(user), method: :patch
    end
  end

  permit_params :email, :password, :password_confirmation, :nickname, :first_name, :last_name, :role

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :nickname
    column :first_name
    column :last_name
    column :role
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at
  filter :nickname
  filter :first_name
  filter :last_name
  filter :role

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :nickname
      f.input :role
      f.input :first_name
      f.input :last_name
    end
    f.actions
  end
end
