-- Fake variables
local game
local Instance

-- Name: rewards.luau
-- Type: Server script
-- Parent: ServerScriptService
-- Description: Used to auto-detect changes to players' currency and to create currency statistics when a player joins the server.

-- leaderstats
local DataStoreService = game:GetService("DataStoreService")
local storedEBux = DataStoreService:GetDataStore("EBux")

game.Players.PlayerAdded:Connect(function(plr)
    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = plr

    local EBux = Instance.new("IntValue")
    EBux.Name = "EBux"
    EBux.Parent = leaderstats
    EBux.Value = 0

    local playerKey = "player"..plr.UserId
    local storedValueForPlayer = storedEBux:GetAsync(playerKey)
    EBux.Value = storedValueForPlayer
    
    print("Successfully transferred stored data to 'leaderstats' for "..playerKey..".")
end)

while true do
    for i, v in pairs(game.Players:GetChildren()) do
        local playerKey = "player"..v.UserId
        local StoredValueForPlayer = storedEBux:GetAsync(playerKey)
        v.leaderstats.EBux.Value = StoredValueForPlayer
    end
end