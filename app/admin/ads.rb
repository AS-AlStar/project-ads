# frozen_string_literal: true
# rubocop:disable all

ActiveAdmin.register Ad do
  config.per_page = 10

  batch_action :approved do |ids|
    batch_action_collection.find(ids).each do |ad|
      ad.update(state: 'approved')
    end
    redirect_to collection_path, alert: 'The ads have been approved.'
  end

  batch_action :rejected do |ids|
    batch_action_collection.find(ids).each do |ad|
      ad.update(state: 'rejected')
    end
    redirect_to collection_path, alert: 'The ads have been rejected.'
  end

  member_action :make_state_approved, method: :patch do
    Ad.find(params[:id]).update(state: 'approved')
    flash[:notice] = 'Advertising successfully has become "Approved"'
    redirect_to admin_ad_path, id: params[:id]
  end

  member_action :make_state_rejected, method: :patch do
    Ad.find(params[:id]).update(state: 'rejected')
    flash[:notice] = 'Advertising successfully has become "Rejected"'
    redirect_to admin_ad_path, id: params[:id]
  end

  action_item :make_state_approved, only: :show do
    link_to 'Approved', make_state_approved_admin_ad_path(ad), method: :patch unless ad.state == 'approved'
  end

  action_item :make_state_rejected, only: :show do
    link_to 'Rejected', make_state_rejected_admin_ad_path(ad), method: :patch unless ad.state == 'rejected'
  end

  permit_params :title, :body, :user_id, :state, :image

  index do
    selectable_column
    id_column
    column :title
    column :created_at
    column :state
    actions
  end

  filter :title
  filter :created_at
  filter :state
  filter :user_id

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :user_id
      f.input :state
      f.input :image
    end
    f.actions
  end
end
