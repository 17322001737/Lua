require("game/role_exp/role_exp_view")
require("game/role_exp/role_exp_data")

RoleExpCtrl = RoleExpCtrl or BaseClass(BaseCtrl)
function RoleExpCtrl:Constructor()
	print("RoleExpCtrl Constructor")
	self.view = RoleExpView.New("RoleExpView")
	self.data = RoleExpData.New()
end

function RoleExpCtrl:Destructor()

end