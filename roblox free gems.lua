local player = game.Players.LocalPlayer
local button = script.Parent -- Riferimento al pulsante
button.MouseButton1Click:Connect(function()
-- Richiede al server di dare gemme
game.ReplicatedStorage.AddGems:FireServer()
end)
-- Configurazione
local gemAmount = 10 -- Numero di gemme da aggiungere ogni clic
-- Evento remoto per aggiungere gemme
local replicatedStorage = game:GetService("ReplicatedStorage")
local addGemsEvent = Instance.new("RemoteEvent", replicatedStorage)
addGemsEvent.Name = "AddGems"
-- Gestione dell'evento remoto
addGemsEvent.OnServerEvent:Connect(function(player)
local leaderstats = player:FindFirstChild("leaderstats")
if leaderstats then
local gems = leaderstats:FindFirstChild("Gemme")
if gems then
gems.Value = gems.Value + gemAmount
end
end
end)
-- Creazione leaderstats (se non già presente)
game.Players.PlayerAdded:Connect(function(player)
local leaderstats = Instance.new("Folder")
leaderstats.Name = "leaderstats"
leaderstats.Parent = player
local gems = Instance.new("IntValue")
gems.Name = "Gemme"
gems.Value = 0 -- Gemme iniziali
gems.Parent = leaderstats
end)

