class ApiRoot < Grape::API

    default_format :json
  
    content_type :json, 'application/json; charset=UTF-8'
    content_type :xml, "text/xml"
    content_type :txt,  'text/plain'
    content_type :binary, 'application/octet-stream'
    content_type :html, "text/html"
  
    formatter :xml, Proc.new { |object|
      if object.is_a? Hash
        object.to_xml(root: :xml, children: :item, skip_types: true, skip_instruct: true).gsub(/\s*/, '')
      else
        object
      end
    }
  
    #报错处理
    rescue_from ActiveRecord::RecordNotFound do |e|
      error_200! '记录未找到'
    end
  
    rescue_from :all do |e|
      error_200! e.message
    end

    # helpers
    helpers ApiHelpers

    # routers
    mount V1::Base
  end