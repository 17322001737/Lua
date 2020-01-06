require("common/view_define")
require("common/event_define")
require("common/game_enum")
require("common/base_class")
require("common/base_object")
require("common/base_player")
require("common/base_ctrl")
require("common/base_view")

local require_list = {
	"common/view_manager",
	"common/event_manager",
	"common/config_manager",
	"game/role_exp/role_exp_ctrl",
	"game/player_self"
}

function ViewDemo()
	print("------------------------- View DEMO")
	ViewManager:Open(View.RoleExpView)
	ViewManager:Close(View.RoleExpView)
end

function EventDemo()
	print("------------------------- Event DEMO")
	EventManager:GlobalRegister(Event.GlobalSendProtocol, GlobalSendProtocol)
	EventManager:GlobalFire(Event.GlobalSendProtocol, "Request RoleExp")
	-- remove before
	RoleExpCtrl:CheckRoleExp()
	-- remove later
	RoleExpCtrl:CheckRoleExp()
end

function GlobalSendProtocol(params)
	print("GlobalSend Protocol:", params)
end

function ConfigDemo()
	print("------------------------- Config DEMO")
	local cfg = Config:GetConfig(GAME_ENUM.CONFIG.ROLE_EXP_CONFIG)
	for _, v in ipairs(cfg) do
		print("LEVEL:" .. v.level, "EXP:" .. v.exp)
	end
end

function ExtendsDemo()
	print("------------------------- Extends DEMO")
	PlayerSelf.New()
end

function Main()
	for _, v in ipairs(require_list) do
		require(v)
	end
	EventManager.New()
	Config.New()
	ViewManager.New()
	RoleExpCtrl.New()

	-- ViewDemo()
	-- EventDemo()
	-- ConfigDemo()
	ExtendsDemo()
end

Main()