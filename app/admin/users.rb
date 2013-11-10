ActiveAdmin.register User do
  member_action :switch, :method => :post do
    user = User.find(params[:id])
    sign_out
    sign_in(user)
    redirect_to root_path, notice: "Signed in as: #{user.full_name}"
  end

  action_item only: :show do
    link_to('Switch to User', switch_admin_user_path(user), method: :post)
  end
end