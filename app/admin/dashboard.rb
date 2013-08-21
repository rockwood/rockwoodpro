ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => "Dashboard"

  content :title => "Rockwood Productions" do

    section "Active Recordings" do
      table_for Recording.all.order("datetime desc") do
        column do |recording|
          link_to 'Edit', [:edit, :admin, recording]
          link_to 'View', [:admin, recording]
        end
        column :user
        column "Date/Time", :datetime
        column :location
        column :state
        column :context
        column :level
        column "CDs", :cds
        column "DVDs", :dvds
      end
      strong { link_to "View All Recordings", admin_recordings_path }
    end
  end
end
