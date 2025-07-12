-- Wastelane Hack [Completão] - por ChatGPT

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Wastelane Hack [Completão]",
   LoadingTitle = "Carregando Interface...",
   ConfigurationSaving = {
      Enabled = false
   }
})

-- Abas
local FarmTab = Window:CreateTab("Auto Farm", nil)
local CombatTab = Window:CreateTab("Combate", nil)
local MiscTab = Window:CreateTab("Extras", nil)

-- Auto Farm
FarmTab:CreateToggle({ Name = "Auto Farm Inimigos", CurrentValue = false, Callback = function(state)
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        for _, enemy in ipairs(workspace:GetDescendants()) do
            if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") and enemy.Name ~= "Player" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
                wait(0.5)
            end
        end
        wait()
    end
end})

-- Kill Aura
CombatTab:CreateToggle({ Name = "Kill Aura (arma equipada)", CurrentValue = false, Callback = function(state)
    getgenv().killAura = state
    while getgenv().killAura do
        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool then
            for _, enemy in ipairs(workspace:GetDescendants()) do
                if enemy:FindFirstChild("Humanoid") and enemy.Name ~= "Player" then
                    enemy.Humanoid.Health = 0
                end
            end
        end
        wait(0.3)
    end
end})

-- God Mode (experimental)
CombatTab:CreateButton({ Name = "Ativar God Mode (Experimental)", Callback = function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.Name = "1"
        local clone = char["1"]:Clone()
        clone.Name = "Humanoid"
        clone.Parent = char
        wait(0.5)
        char["1"]:Destroy()
    end
end})

-- Teleporte para a loja
MiscTab:CreateButton({ Name = "Teleportar para a Loja", Callback = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(100, 5, 100)
end})

-- Comprar tudo
MiscTab:CreateButton({ Name = "Comprar Tudo (Magnum, Espingarda...)", Callback = function()
    local remote = game:GetService("ReplicatedStorage"):FindFirstChild("BuyItem")
    local itens = {"Magnum", "Espingarda", "Armazém"}
    if remote then
        for _, item in ipairs(itens) do
            remote:FireServer(item)
            wait(0.2)
        end
    else
        warn("RemoteEvent 'BuyItem' não encontrado.")
    end
end})

-- Speed Hack
MiscTab:CreateSlider({ Name = "Speed Hack", Range = {16, 100}, Increment = 2, CurrentValue = 16, Callback = function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end})

-- Fly (pressione E)
MiscTab:CreateToggle({ Name = "Fly (pressione E)", CurrentValue = false, Callback = function(state)
    if state then
        loadstring(game:HttpGet("https://pastebin.com/raw/Yj8vKMB5"))()
    end
end})
