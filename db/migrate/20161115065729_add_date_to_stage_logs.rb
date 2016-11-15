class AddDateToStageLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :stage_logs, :confirm_date, :date
    add_column :stage_logs, :return_date, :date
  end
end
