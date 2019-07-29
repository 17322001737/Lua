EventManager = EventManager or BaseClass()

function EventManager:Constructor()
	self.event_list = {}
end

function EventManager:Destructor()
	self.event_list = nil
end

function EventManager:GlobalRegister(event_name, callback)
	if event_name ~= nil and callback ~= nil and type(callback) == "function" then
		if self.event_list[event_name] == nil then
			self.event_list[event_name] = callback
		else
			print("event has exist!")
		end
	else
		print("event format get a error!")
	end
end

function EventManager:GlobalFire(event_name, params)
	if event_name ~= nil then
		if self.event_list[event_name] ~= nil then
			self.event_list[event_name](params)
		end
	end
end