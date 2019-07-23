RoleExpView = RoleExpView or BaseClass(BaseView)

function RoleExpView:Constructor()
	self.cur_exp = 1000
	self.next_exp = 10000
end

function RoleExpView:LoadCallBack()
	
end

function RoleExpView:OpenCallBack()
	print("RoleExpView OpenCallBack")
	print("Curr Exp:" .. self.cur_exp)
	print("Targ Exp:" .. self.next_exp)
	print("Need Exp:" .. self.next_exp - self.cur_exp)
end

function RoleExpView:OnFlush()
	print("RoleExpView OnFlush")
end

function RoleExpView:CloseCallBack()
	print("RoleExpView CloseCallBack")
end