-- Fake variables
local game
local Instance

-- Name: rewards.luau
-- Type: Server script
-- Parent: ServerScriptService
-- Description: Used to reward currency to players

-- Rewards
local rewardEvent = game.ReplicatedStorage.RewardEBux -- Assuming a RemoteEvent named 'RewardEBux' in parent of ReplicatedStorage has been created.
local DataStoreService = game:GetService("DataStoreService")
local storedEBux = DataStoreService:GetDataStore("EBux")

rewardEvent.OnServerEvent:Connect(function(amount, player)
    local playerKey = "player"..player.UserId
    player.leaderstats.EBux.Value = (player.leaderstats.EBux.Value + amount)
    storedEBux:SetAsync(playerKey, player.leaderstats.EBux.Value)
    print("Successfully rewarded "..playerKey..".")
end)