module V1
  class Users < V1::Base
      
    authentication!
    resource :users do
      desc '修改资料'
      params do
        optional :name, type: String, desc: '昵称'
        optional :gender, type: String, values: ['male', 'female'], desc: '性别'
      end
      put :profile do
        current_user.update! params
        process_succeed current_user, with: V1::Entities::Users
      end
    end
  end
end