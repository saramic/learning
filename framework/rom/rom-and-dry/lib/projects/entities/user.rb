module Projects
  module Entities
    class User < ROM::Struct
      def full_name
        [first_name, last_name].join(" ")
      end
    end
  end
end