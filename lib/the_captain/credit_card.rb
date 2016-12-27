module TheCaptain
  class CreditCard < ApiResource
    api_path "/creditcard"

    EVENT_OPTIONS = {
        purchased: "user:purchased",
        failed: "user:purchased:failed",
        success: "user:purchased:success",
    }.freeze

    def self.retrieve(identifier, options = {})
      options = merge_options(options)
      super
    end

    def self.submit(cc_fingerprint, options = {})
      raise ArgumentError("user or user_id required") unless options[:user] || options[:user_id]
      options = merge_options(options)
      options = user_id_options(options)
      super
    end

    def self.merge_options(options = {})
      return options unless options[:event]
      options.merge!(event: (EVENT_OPTIONS[options[:event]] || options[:event]))
    end
  end
end