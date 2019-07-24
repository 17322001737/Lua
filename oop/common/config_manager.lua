Config = Config or BaseClass()

function Config:Constructor()
	self.config_list = {}
	self.config_mapping = {
		[GAME_ENUM.CONFIG.ROLE_EXP_CONFIG] = "config/role_exp_config"
	}
end

function Config:Destructor()
	self.config_list = nil
	self.config_mapping = nil
end

function Config:GetConfig(config_name)
	if self.config_list[config_name] == nil then
		self.config_list[config_name] = require(self.config_mapping[config_name])
	end

	return self.config_list[config_name]
end