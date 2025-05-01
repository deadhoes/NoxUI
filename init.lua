local NoxUI = {}

function NoxUI:CreateWindow(gameName, version)
	local player = game.Players.LocalPlayer
	local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	screenGui.Name = "NoxUI_Main"
	screenGui.ResetOnSpawn = false

	local mainFrame = Instance.new("Frame", screenGui)
	mainFrame.Name = "NoxUI_Window"
	mainFrame.Size = UDim2.new(0, 420, 0, 270)
	mainFrame.Position = UDim2.new(0.5, -210, 0.5, -135)
	mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	mainFrame.BorderSizePixel = 0
	mainFrame.Active = true
	mainFrame.Draggable = true

	-- Title bar
	local titleBar = Instance.new("Frame", mainFrame)
	titleBar.Name = "NoxUI_TitleBar"
	titleBar.Size = UDim2.new(1, 0, 0, 45)
	titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

	local titleLabel = Instance.new("TextLabel", titleBar)
	titleLabel.Text = "🔷 " .. gameName .. " | v" .. version
	titleLabel.Size = UDim2.new(1, 0, 1, 0)
	titleLabel.BackgroundTransparency = 1
	titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	titleLabel.Font = Enum.Font.GothamBold
	titleLabel.TextScaled = true

	-- Content area
	local content = Instance.new("Frame", mainFrame)
	content.Name = "NoxUI_Content"
	content.Position = UDim2.new(0, 0, 0, 45)
	content.Size = UDim2.new(1, 0, 1, -45)
	content.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	content.BorderSizePixel = 0

	-- UIListLayout for button stacking
	local listLayout = Instance.new("UIListLayout", content)
	listLayout.Padding = UDim.new(0, 6)
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder

	return {
		Frame = mainFrame,
		Content = content,
		AddButton = function(self, text, callback)
			local button = Instance.new("TextButton", content)
			button.Size = UDim2.new(1, -20, 0, 40)
			button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			button.Text = text
			button.TextColor3 = Color3.fromRGB(255, 255, 255)
			button.Font = Enum.Font.Gotham
			button.TextScaled = true
			button.AutoButtonColor = true
			button.BorderSizePixel = 0
			button.MouseButton1Click:Connect(callback)
		end
	}
end

return NoxUI
