ActiveAdmin.register User do
  config.sort_order = 'last_name_asc'

  controller do
    def permitted_params
      params.permit!
    end
  end

  member_action :switch, :method => :post do
    user = User.find(params[:id])
    sign_out
    sign_in(user)
    redirect_to root_path, notice: "Signed in as: #{user.full_name}"
  end

  action_item :switch_to_user_link, only: :show do
    link_to('Switch to User', switch_admin_user_path(user), method: :post)
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
      f.input :legacy
    end
    f.actions
  end

end
