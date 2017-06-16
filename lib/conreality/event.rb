module Conreality
  ##
  # Represents a Conreality event.
  class Event < Database::Row
    TABLE = :event
    KEY   = :id

    ##
    # The event's sequential identifier.
    #
    # @return [Integer]
    attr_reader :id

    ##
    # The event's timestamp (in Zulu time).
    #
    # @return [Date]
    attr_reader :timestamp

    ##
    # The event's predicate (an action or verb).
    #
    # @return [String]
    attr_reader :predicate

    ##
    # The subject (i.e., source) of the predicate.
    #
    # @return [Object]
    attr_reader :subject

    ##
    # The object (i.e., target) of the predicate.
    #
    # @return [Object]
    attr_reader :object

    ##
    # @param client [Client]
    # @param id     [#to_i]
    def initialize(client, id)
      super(client)
      @id = id.to_i
    end
  end # Event
end # Conreality
