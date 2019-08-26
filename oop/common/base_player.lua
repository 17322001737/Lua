BasePlayer = BasePlayer or BaseClass(BaseObject)

function BasePlayer:Constructor(obj, ...)
	self.super.Constructor(obj, ...)
	print("BasePlayer:Constructor")
end

function BasePlayer:Destructor()

end