class CreateRequestLogs < ActiveRecord::Migration
  def change
    create_table :request_logs do |t|
      t.string :url

      t.timestamps
    end
  end
end
