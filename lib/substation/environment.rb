module Substation

  # Encapsulates all registered actions and their observers
  #
  # The only protocol actions must support is +#call(request)+.
  # Actions are intended to be classes that handle one specific
  # application use case.
  class Environment

    # Encapsulates access to one registered action
    class Action

      # Raised when no action class name is configured
      MissingClassError = Class.new(StandardError)

      # Coerce the given +name+ and +config+ to an {Action} instance
      #
      # @param [Hash] config
      #   the configuration hash
      #
      # @return [Action]
      #   the coerced instance
      #
      # @api private
      def self.coerce(config)
        klass_name = config.fetch('action') { raise(MissingClassError) }
        observer   = Observer.coerce(config['observer'])

        new(Utils.const_get(klass_name), observer)
      end

      include Concord.new(:klass, :observer)
      include Adamantium

      # Call the action
      #
      # @param [Substation::Request] request
      #   the request passed to the registered action
      #
      # @return [Substation::Response]
      #   the response returned when calling the action
      #
      # @api private
      def call(request)
        response = klass.call(request)
        observer.call(response)
        response
      end

    end # class Action

    # Raised when trying to dispatch to an unregistered action
    UnknownActionError = Class.new(StandardError)

    # Coerce the given +config+ to an {Environment} instance
    #
    # @param [Hash] config
    #   the environment configuration
    #
    # @return [Environment]
    #   the coerced instance
    #
    # @api private
    def self.coerce(config)
      new(config.each_with_object({}) { |(name, config), actions|
        actions[name.to_sym] = Action.coerce(config)
      })
    end

    include Concord.new(:actions)
    include Adamantium

    # Invoke the action identified by +name+
    #
    # @param [Symbol] name
    #   a registered action name
    #
    # @param [Object] input
    #   the input model instance to pass to the action
    #
    # @return [Response]
    #   the response returned when calling the action
    #
    # @raise [UnknownActionError]
    #   if no action is registered for +name+
    #
    # @api private
    def dispatch(name, input)
      fetch(name).call(Request.new(self, input))
    end

    # The names of all registered actions
    #
    # @return [Set<Symbol>]
    #   the set of registered action names
    #
    # @api private
    def action_names
      Set.new(actions.keys)
    end

    memoize :action_names

    private

    # The action registered with +name+
    #
    # @param [Symbol] name
    #   a name for which an action is registered
    #
    # @return [Action]
    #   the action configuration registered for +name+
    #
    # @raise [KeyError]
    #   if no action is registered with +name+
    #
    # @api private
    def fetch(name)
      actions.fetch(name) { raise(UnknownActionError) }
    end

  end # class Environment
end # module Substation
