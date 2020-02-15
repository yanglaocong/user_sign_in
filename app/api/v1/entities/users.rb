module V1
  module Entities
    class Users < Grape::Entity
      expose :id, documentation: { type: 'Integer', desc: 'ID' }
      expose :mobile, documentation: { type: 'String', desc: '手机号' }
      expose :name, documentation: { type: 'String', desc: '用户昵称' }
      expose :token, documentation: { type: 'String', desc: 'JWT' }
      expose :gender, documentation: { type: 'String', desc: '用户性别' }
    end
  end
end