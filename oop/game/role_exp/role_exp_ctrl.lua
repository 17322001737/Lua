require("game/role_exp/role_exp_view")
require("game/role_exp/role_exp_data")

RoleExpCtrl = RoleExpCtrl or BaseClass(BaseCtrl)

function RoleExpCtrl:Ctor()
	self.view = RoleExpView.New(View.RoleExpView)
	self.data = RoleExpData.New()

	EventManager:Add("RoleCtrlEvent", function(params)
		self:RequestRoleExp(params)
	end)
end

function RoleExpCtrl:Dtor()

end

function RoleExpCtrl:CheckRoleExp()
	EventManager:Fire("RoleCtrlEvent", 1000)
end

function RoleExpCtrl:RequestRoleExp(params)
	print("Role Exp :", params)
end