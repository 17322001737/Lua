local require_list = {
	"common/functions",
	"component/c_talk",
	"component/c_walk",

	"game/person"
}

function Main()
	for _, v in ipairs(require_list) do
		require(v)
	end
	local person = Person.New()
	person:Eat()
	person:Sleep()

	person:Talk()
	person:Walk()
end

Main()