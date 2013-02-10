class AddProjectToDatafile < ActiveRecord::Migration
  def change
    add_column :datafiles, :project_id, :integer
  end
end
