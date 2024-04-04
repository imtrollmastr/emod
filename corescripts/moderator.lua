-- Fake variables
local game
local Instance

-- Name: moderator.luau
-- Type: Module script
-- Parent: ReplicatedStorage
-- Description: Used for moderation globally in all places, mostly used for administrators

-- moderator

local module = {}

function module.kickPlayer(player, reason)
    player:Kick(reason)
    print("Kicked "..player.Name..".")
end

function module.stunPlayer(player)
    local char = game.Workspace:WaitForChild(player.Name)
    if char:FindFirstChild("Humanoid") then
        if char.HumanoidRootPart.Anchored == true then
            char.HumanoidRootPart.Anchored = false
            print("Unstunned "..player.Name..".")
        else
            char.HumanoidRootPart.Anchored = true
            print("Stunned "..player.Name..".")
        end
    else
        warn("Character related to provided player is not valid.")
    end
end

function module.damagePlayer(player, amount)
    local char = game.Workspace:WaitForChild(player.Name)
    if char:FindFirstChild("Humanoid") then
        char.Humanoid.Health = (char.Humanoid.Health - amount)
        print(amount.." deducted from "..player.Name.."'s health.")
    end
end

function module.GetPlayerInfo(player)
    local char = game.Workspace:WaitForChild(player.Name)
    if char:FindFirstChild("Humanoid") then
        print("Getting player API from Roblox...")
        print("Player username: "..player.Name)
        print("Player UserID: "..player.UserId)
        print("Player age: "..player.AccountAge)
        print("Character Health: "..char.Humanoid.Health)
        print("Character position in map: "..char.HumanoidRootPart.CFrame)
        print("Successfully provided all information on "..player.Name..".")
    end
end

function module.TeleportPlayers(player1, player2)
    local char1 = game.Workspace:WaitForChild(player1.Name)
    local char2 = game.Workspace:WaitForChild(player2.Name)
    if char1:FindFirstChild("Humanoid") then
        if char2:FindFirstChild("Humanoid") then
            char1.HumanoidRootPart.CFrame = char2.HumanoidRootPart.CFrame
            print("Successfully brought "..player2.Name.." to "..player1.Name..".")
        end
    end
end

return module