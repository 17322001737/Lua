ViewManager = ViewManager or BaseClass()

function ViewManager:Constructor()
	self.view_list = {}
	self.view_status = {}
end

function ViewManager:Destructor()
	self.view = nil
	self.view_status = nil
	self.view_list = nil
end

function ViewManager:RegisterView(view, view_name)
	if self.view_list[view_name] == nil then
		self.view_list[view_name] = view
	end
end

function ViewManager:Open(view_name)
	if self.view_list[view_name] then
		self.view_list[view_name]:Open()
		self.view_status[view_name] = GAME_ENUM.VIEW_STATUS.OPEN
	end
end

function ViewManager:Close(view_name)
	if self.view_list[view_name] then
		self.view_list[view_name]:Close()
		self.view_status[view_name] = GAME_ENUM.VIEW_STATUS.CLOSE
	end
end

function ViewManager:CheckStatus(view_name)
	return self.view_status[view_name] or GAME_ENUM.VIEW_STATUS.NONE
end