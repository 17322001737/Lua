require("game/role_exp/role_exp_view")
require("game/role_exp/role_exp_data")

RoleExpCtrl = RoleExpCtrl or BaseClass(BaseCtrl)

function RoleExpCtrl:Constructor()
	self.view = RoleExpView.New(View.RoleExpView)
	self.data = RoleExpData.New()

	EventManager.Register(self, "RoleCtrlEvent", self.RequestRoleExp)
end

function RoleExpCtrl:Destructor()

end

function RoleExpCtrl:CheckRoleExp()
	EventManager.Fire(self, "RoleCtrlEvent", 1000)
	EventManager.Remove(self, "RoleCtrlEvent")
end

function RoleExpCtrl:RequestRoleExp(params)
	print("Role Exp :", params)
end