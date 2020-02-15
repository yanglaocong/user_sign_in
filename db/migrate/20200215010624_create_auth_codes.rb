class CreateAuthCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :auth_codes, comment: '短信验证码' do |t|
      t.string :mobile, null: false, index: { unique: true }, comment: '手机号'
      t.string :token, null: false, comment: '验证码'
      t.datetime :expired_at, null: false, comment: '有效期'
      t.timestamps
    end
  end
end
