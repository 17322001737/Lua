BasePlayer = BasePlayer or BaseClass(BaseObject)

function BasePlayer:Ctor(obj, ...)
	self.super.Ctor(obj, ...)
	print("BasePlayer:Ctor")
end

function BasePlayer:Dtor()

end