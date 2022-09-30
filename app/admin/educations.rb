ActiveAdmin.register Education do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :college_name, :course, :branch, :user_id
  #
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :college_name
    column :course
    column :branch
    column :user_id
    actions
  end
  show do
    attributes_table title: "user" do
      row :first_name
      row :last_name
      row :college_name
      row :course
      row :branch
      row :user_id
    end
  end
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :college_name
      f.input :course
      f.input :branch
      f.input :user_id
    end
    f.actions
  end

end






  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :college_name, :course, :branch, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
# end
