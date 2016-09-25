class ChangeColumnApprovalStatus < ActiveRecord::Migration
  def change
    change_column :reservations, :approval_status, :boolean, :default => false
  end
end
