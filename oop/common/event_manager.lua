EventManager = EventManager or BaseClass()

function EventManager:Constructor()
	self.global_event_list = {}
	self.local_event_list = {}
end

function EventManager:Destructor()
	self.global_event_list = nil
	self.local_event_list = nil
end

function EventManager:GlobalRegister(event_name, callback)
	if event_name == nil or callback == nil or type(callback) ~= "function" then
		print("global event format get a error!")
		return
	end

	if self.global_event_list[event_name] == nil then
		self.global_event_list[event_name] = {}
	end

	self.global_event_list[event_name][#self.global_event_list[event_name] + 1] = callback
end

function EventManager:GlobalFire(event_name, params)
	if event_name ~= nil then
		if self.global_event_list[event_name] ~= nil then
			for _, v in ipairs(self.global_event_list[event_name]) do
				v(params)
			end
		end
	else
		print("global event not found.")
	end
end

function EventManager.Register(self, event_name, callback)
	if self == nil or event_name == nil or callback == nil or type(callback) ~= "function" then
		print("local event format get a error!")
	end

	if self.event_list == nil then
		self.event_list = {}
		local event = {}
		event.event_name = event_name
		event.callback = callback
		self.event_list[#self.event_list + 1] = event

		return
	end

	for _, v in ipairs(self.event_list) do
		if v.event_name == event_name then
			print("local event has exist!")

			return
		end
	end

	local event = {}
	event.event_name = event_name
	event.callback = callback
	self.event_list[#self.event_list + 1] = event
end

function EventManager.Fire(self, event_name, params)
	if self == nil or self.event_list == nil then
		print("local event list not found.")
		return
	end
	for _, v in ipairs(self.event_list) do
		if v.event_name == event_name then
			v:callback(params)

			return
		end
	end

	print("local event not found.")
end

function EventManager.Remove(self, event_name)
	if self == nil or self.event_list == nil then
		print("local event list not found.")
	end

	local new_event_list = {}
	for _, v in ipairs(self.event_list) do
		if v.event_name ~= event_name then
			new_event_list[#new_event_list + 1] = v
		end
	end

	self.event_list = new_event_list
end