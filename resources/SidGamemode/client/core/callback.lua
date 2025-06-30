local waitlist = {}
local callback_id = 0

Callbacks = {}

Callbacks.Trigger = function(name, ...)
    local id = callback_id
    local i = 0

    callback_id +=  1
    Events.TriggerServer('callback', name, id, ...)
    waitlist[id] = 'outro_waiting_for_callback_response'

    while waitlist[id] == 'outro_waiting_for_callback_response' do
        Utils.RealWait(50)
        i += 1
        if i > 500 then
            Console.Warning('Callback timed out: ', name, id)
            return nil
        end
    end

	local response = waitlist[id]
	waitlist[id] = nil

    return response
end

Events.Register('callback', function(source, id, response)
    waitlist[id] = response
end)
