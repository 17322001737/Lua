BaseView = BaseView or BaseClass()

function BaseView.New(self, ...)
	if ... ~= nil then
		ViewManager:RegisterView(self, ...)
	end
end

function BaseView:Load()
	self:LoadCallBack()
end

function BaseView:Open()
	self:Load()
	self:OpenCallBack()
end

function BaseView:Close()
	self:CloseCallBack()
end

function BaseView:Flush()
	self:OnFlush()
end

function BaseView:LoadCallBack()
end

function BaseView:OpenCallBack()
end

function BaseView:CloseCallBack()
end

function BaseView:OnFlush()
end