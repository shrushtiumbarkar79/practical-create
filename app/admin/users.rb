ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name, :last_name, :date_of_birth, :address, :email_id, :phone_no
  #
  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :date_of_birth
    column :address
    column :email_id
    column :phone_no
    actions
  end
  show do
    attributes_table title: "user" do
      row :first_name
      row :last_name
      row :date_of_birth
      row :address
      row :email_id
      row :phone_no
    end
  end
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :date_of_birth
      f.input :address
      f.input :email_id
      f.input :phone_no
    end
    f.actions
  end
  action_item :only => :index do
    link_to 'Upload Bulk Users', :action => 'upload_csv'
  end


  collection_action :upload_csv do
    render "admin/user"
  end
  collection_action :import_csv, :method => :post do
     begin
    res = Import.bulk_import_csv(User, params[:dump][:file])
    if res.present?
       redirect_to :action => :index, :notice => "CSV imported successfully!"
    else
       redirect_to :action => :index, :notice => "SomeThing went wrong with files!"
     end
    rescue Exception => e
      puts(e)
     redirect_to :action => :index, :notice => "CSV not imported successfully!"
    end
  end





end








      # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :date_of_birth, :address, :email_id, :phone_no]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
# end
