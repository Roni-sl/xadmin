xAdmin = {}
xAdmin.Info = {}
xAdmin.Database = {}
xAdmin.Config = {}
xAdmin.Core = {}
xAdmin.Users = {}
xAdmin.Groups = {}
xAdmin.Commands = {}
xAdmin.AdminChat = {}
print("Loading xAdmin")
xAdmin.Info.Version = "1.0"
-- The table prefix used when making the unique tables. If you're running multiple servers this should be unique else they will share data
xAdmin.Info.Name = "svr1"
-- The unique name of this server. This will be used as a unique identifier in the bans archive
xAdmin.Info.FullName = "Server 1"
local path = "xadmin/"

if SERVER then
	local files, folders = file.Find(path .. "*", "LUA")

	for _, folder in SortedPairs(folders, true) do
		print("Loading folder:", folder)

		for b, File in SortedPairs(file.Find(path .. folder .. "/sh_*.lua", "LUA"), true) do
			print("Loading file:", File)
			AddCSLuaFile(path .. folder .. "/" .. File)
			include(path .. folder .. "/" .. File)
		end

		for b, File in SortedPairs(file.Find(path .. folder .. "/sv_*.lua", "LUA"), true) do
			print("Loading file:", File)
			include(path .. folder .. "/" .. File)
		end

		for b, File in SortedPairs(file.Find(path .. folder .. "/cl_*.lua", "LUA"), true) do
			print("Loading file:", File)
			AddCSLuaFile(path .. folder .. "/" .. File)
		end
	end
end

if CLIENT then
	local files, folders = file.Find(path .. "*", "LUA")

	for _, folder in SortedPairs(folders, true) do
		print("Loading folder:", folder)

		for b, File in SortedPairs(file.Find(path .. folder .. "/sh_*.lua", "LUA"), true) do
			print("Loading file:", File)
			include(path .. folder .. "/" .. File)
		end

		for b, File in SortedPairs(file.Find(path .. folder .. "/cl_*.lua", "LUA"), true) do
			print("Loading file:", File)
			include(path .. folder .. "/" .. File)
		end
	end
end

print("Loaded xAdmin")