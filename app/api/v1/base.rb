module V1
    class Base < ApiRoot
  
      def self.authentication!
        before do
          authenticate!
        end
      end
  
      # api version
      version :v1, using: :path
  
      # routers
      mount Sessions
      mount Users
    end
  end