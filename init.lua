local NoxUI = {}

-- Ana pencere oluştur
function NoxUI:CreateWindow(config)
	local gameName = config.Title or "Nox Game"
	local version = config.Version or "1.0"

	local player = game.Players.LocalPlayer
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "NoxUI"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = player:WaitForChild("PlayerGui")

	-- Pencere ana çerçevesi
	local main = Instance.new("Frame", screenGui)
	main.Name = "Window"
	main.Size = UDim2.new(0, 450, 0, 300)
	main.Position = UDim2.new(0.5, -225, 0.5, -150)
	main.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	main.BorderSizePixel = 0
	main.Active = true
	main.Draggable = true

	-- Başlık çubuğu
	local titleBar = Instance.new("Frame", main)
	titleBar.Size = UDim2.new(1, 0, 0, 40)
	titleBar.BackgroundColor3 = Color3.fromRGB(38, 38, 38)

	local titleText = Instance.new("TextLabel", titleBar)
	titleText.Size = UDim2.new(1, -10, 1, 0)
	titleText.Position = UDim2.new(0, 10, 0, 0)
	titleText.Text = "🟦 " .. gameName .. "  |  v" .. version
	titleText.TextColor3 = Color3.new(1, 1, 1)
	titleText.Font = Enum.Font.GothamBold
	titleText.TextSize = 20
	titleText.BackgroundTransparency = 1
	titleText.TextXAlignment = Enum.TextXAlignment.Left

	-- İçerik alanı
	local content = Instance.new("ScrollingFrame", main)
	content.Name = "Content"
	content.Position = UDim2.new(0, 0, 0, 40)
	content.Size = UDim2.new(1, 0, 1, -40)
	content.CanvasSize = UDim2.new(0, 0, 0, 0)
	content.ScrollBarThickness = 6
	content.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	content.BorderSizePixel = 0

	local layout = Instance.new("UIListLayout", content)
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

	-- UI Fonksiyonları
	local UI = {}

	function UI:AddButton(text, callback)
		local btn = Instance.new("TextButton", content)
		btn.Size = UDim2.new(1, -20, 0, 40)
		btn.Position = UDim2.new(0, 10, 0, 0)
		btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		btn.Text = text
		btn.Font = Enum.Font.Gotham
		btn.TextSize = 18
		btn.TextColor3 = Color3.new(1, 1, 1)
		btn.BorderSizePixel = 0
		btn.AutoButtonColor = true
		btn.MouseButton1Click:Connect(callback)
		content.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end

	return UI
end

return NoxUI
