class CreateUsers < ActiveRecord::Migration[6.0]
  def self.up
    create_table :users, comment: '用户信息表' do |t|
      t.string  :mobile, null: false, index: { unique: true }, comment: '手机号'
      t.string  :name, comment: '用户名'
      t.integer :gender, comment: '性别'
      t.string  :token, comment: 'jwt token'
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
