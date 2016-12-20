module TheCaptain
  class ApiResource < Hashie::Mash
    include TheCaptain::Model
    include TheCaptain::APIOperations::Request
    include TheCaptain::APIOperations::Read
    include TheCaptain::APIOperations::Query
    include TheCaptain::APIOperations::Create

    def self.class_name
      name.split("::")[-1]
    end

    # Convert kasmair pagination into geo4 params
    def self.pagination_options(options)
      options[:limit] = options.delete(:per) if options[:per]
      options[:skip] = options.delete(:page) if options[:page]
      options
    end
  end
end
