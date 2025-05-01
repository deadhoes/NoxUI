local NoxUI = {}

function NoxUI:CreateWindow(config)
	local gameName = config.Title or "Nox Game"
	local version = config.Version or "1.0"

	local player = game.Players.LocalPlayer
	local screenGui = Instance.new("ScreenGui")
	screenGui.Name = "NoxUI"
	screenGui.ResetOnSpawn = false
	screenGui.Parent = player:WaitForChild("PlayerGui")

	local main = Instance.new("Frame", screenGui)
	main.Size = UDim2.new(0, 450, 0, 300)
	main.Position = UDim2.new(0.5, -225, 0.5, -150)
	main.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
	main.BorderSizePixel = 0
	main.Active = true
	main.Draggable = true

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

	local content = Instance.new("ScrollingFrame", main)
	content.Position = UDim2.new(0, 0, 0, 40)
	content.Size = UDim2.new(1, 0, 1, -40)
	content.CanvasSize = UDim2.new(0, 0, 0, 0)
	content.ScrollBarThickness = 6
	content.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	content.BorderSizePixel = 0

	local layout = Instance.new("UIListLayout", content)
	layout.Padding = UDim.new(0, 8)
	layout.SortOrder = Enum.SortOrder.LayoutOrder

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

	function UI:AddTextBox(placeholder, callback)
		local box = Instance.new("TextBox", content)
		box.Size = UDim2.new(1, -20, 0, 40)
		box.Position = UDim2.new(0, 10, 0, 0)
		box.PlaceholderText = placeholder
		box.Text = ""
		box.Font = Enum.Font.Gotham
		box.TextSize = 18
		box.TextColor3 = Color3.new(1, 1, 1)
		box.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		box.BorderSizePixel = 0
		box.FocusLost:Connect(function(enterPressed)
			if enterPressed then
				callback(box.Text)
			end
		end)
		content.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end

	function UI:AddToggle(text, callback)
		local toggle = Instance.new("TextButton", content)
		toggle.Size = UDim2.new(1, -20, 0, 40)
		toggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		toggle.Text = "❎ " .. text
		toggle.Font = Enum.Font.Gotham
		toggle.TextSize = 18
		toggle.TextColor3 = Color3.new(1, 1, 1)
		toggle.BorderSizePixel = 0

		local toggled = false
		toggle.MouseButton1Click:Connect(function()
			toggled = not toggled
			toggle.Text = (toggled and "✅ " or "❎ ") .. text
			callback(toggled)
		end)
		content.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end

	function UI:AddSlider(label, min, max, default, callback)
		local sliderFrame = Instance.new("Frame", content)
		sliderFrame.Size = UDim2.new(1, -20, 0, 60)
		sliderFrame.BackgroundTransparency = 1

		local labelText = Instance.new("TextLabel", sliderFrame)
		labelText.Size = UDim2.new(1, 0, 0, 20)
		labelText.Text = label .. ": " .. tostring(default)
		labelText.Font = Enum.Font.Gotham
		labelText.TextSize = 16
		labelText.TextColor3 = Color3.new(1, 1, 1)
		labelText.BackgroundTransparency = 1

		local slider = Instance.new("Slider", sliderFrame) -- Placeholder name (we’ll use buttons instead)
		local sliderBar = Instance.new("Frame", sliderFrame)
		sliderBar.Size = UDim2.new(1, -20, 0, 10)
		sliderBar.Position = UDim2.new(0, 10, 0, 30)
		sliderBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

		local fill = Instance.new("Frame", sliderBar)
		fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
		fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)

		local dragging = false
		sliderBar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
			end
		end)
		sliderBar.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				local relX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
				local value = math.floor(min + (max - min) * relX)
				fill.Size = UDim2.new(relX, 0, 1, 0)
				labelText.Text = label .. ": " .. tostring(value)
				callback(value)
			end
		end)
		content.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 10)
	end

	return UI
end

return NoxUI
