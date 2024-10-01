/datum/round_event_control
	/// This event's cost in the Unified system. Equates to a cooldown in minutes for the event.
	var/unified_cost = 0

	/// The cooldown in minutes to use instead of the cost.
	var/cooldown_override = 0

	/// Last calculated weight that Unified assigned this event
	var/calculated_cost = 0
