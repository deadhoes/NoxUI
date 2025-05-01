-- Rayfield UI Library (init.lua)

local UILib = {}

-- Create a window
function UILib:CreateWindow(title)
    local window = Instance.new("ScreenGui")
    window.Name = title
    window.ResetOnSpawn = false
    window.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 600, 0, 400)
    frame.Position = UDim2.new(0, 50, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = window

    local header = Instance.new("TextLabel")
    header.Size = UDim2.new(1, 0, 0, 30)
    header.Text = title
    header.TextColor3 = Color3.fromRGB(255, 255, 255)
    header.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    header.TextSize = 18
    header.Font = Enum.Font.SourceSansBold
    header.Parent = frame

    -- Customizable background image
    function window:SetBackgroundImage(url)
        local imageLabel = Instance.new("ImageLabel")
        imageLabel.Size = UDim2.new(1, 0, 1, 0)
        imageLabel.Position = UDim2.new(0, 0, 0, 30)
        imageLabel.Image = url
        imageLabel.BackgroundTransparency = 1
        imageLabel.Parent = frame
    end

    -- Responsive resizing
    function window:SetResponsive(isResponsive)
        if isResponsive then
            frame.Size = UDim2.new(0.5, 0, 0.5, 0)
        end
    end

    -- Enable dragging the window
    function window:EnableWindowDrag(enable)
        if enable then
            local dragInput, dragStart, startPos

            local function update(input)
                local delta = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end

            header.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragStart = input.Position
                    startPos = frame.Position
                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            game:GetService("UserInputService").InputChanged:Disconnect(update)
                        end
                    end)
                    game:GetService("UserInputService").InputChanged:Connect(update)
                end
            end)
        end
    end

    -- Add button
    function window:AddButton(text, callback, settings)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, settings.size.X, 0, settings.size.Y)
        button.Position = UDim2.new(0, 50, 0, 70)
        button.BackgroundColor3 = settings.color
        button.Text = text
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 18
        button.Font = Enum.Font.SourceSans
        button.BorderRadius = UDim.new(0, settings.borderRadius)
        button.Parent = frame

        -- Hover effect
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = settings.hoverColor
        end)

        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = settings.color
        end)

        button.MouseButton1Click:Connect(callback)
    end

    -- Add toggle
    function window:AddToggle(text, default, callback, settings)
        local toggleFrame = Instance.new("Frame")
        toggleFrame.Size = UDim2.new(0, settings.size.X, 0, settings.size.Y)
        toggleFrame.Position = UDim2.new(0, 50, 0, 120)
        toggleFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        toggleFrame.BorderSizePixel = 0
        toggleFrame.Parent = frame

        local toggleLabel = Instance.new("TextLabel")
        toggleLabel.Size = UDim2.new(0, settings.size.X, 0, 20)
        toggleLabel.Position = UDim2.new(0, 0, 0, 0)
        toggleLabel.Text = text
        toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleLabel.TextSize = settings.textSize
        toggleLabel.Font = Enum.Font.SourceSans
        toggleLabel.Parent = toggleFrame

        local toggleButton = Instance.new("TextButton")
        toggleButton.Size = UDim2.new(0, 60, 0, 30)
        toggleButton.Position = UDim2.new(1, -70, 0, 0)
        toggleButton.BackgroundColor3 = Color3.fromRGB(70, 255, 70)
        toggleButton.Text = default and "ON" or "OFF"
        toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        toggleButton.TextSize = 16
        toggleButton.Font = Enum.Font.SourceSans
        toggleButton.BorderRadius = UDim.new(0, 8)
        toggleButton.Parent = toggleFrame

        toggleButton.MouseButton1Click:Connect(function()
            default = not default
            toggleButton.Text = default and "ON" or "OFF"
            callback(default)
        end)
    end

    -- Add slider
    function window:AddSlider(text, min, max, default, callback, settings)
        local sliderFrame = Instance.new("Frame")
        sliderFrame.Size = UDim2.new(0, settings.size.X, 0, settings.size.Y)
        sliderFrame.Position = UDim2.new(0, 50, 0, 170)
        sliderFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        sliderFrame.BorderSizePixel = 0
        sliderFrame.Parent = frame

        local sliderLabel = Instance.new("TextLabel")
        sliderLabel.Size = UDim2.new(0, settings.size.X, 0, 20)
        sliderLabel.Position = UDim2.new(0, 0, 0, 0)
        sliderLabel.Text = text
        sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        sliderLabel.TextSize = 16
        sliderLabel.Font = Enum.Font.SourceSans
        sliderLabel.Parent = sliderFrame

        local slider = Instance.new("TextBox")
        slider.Size = UDim2.new(0, settings.size.X, 0, 20)
        slider.Position = UDim2.new(0, 0, 0, 20)
        slider.BackgroundColor3 = settings.sliderColor
        slider.Text = tostring(default)
        slider.TextColor3 = Color3.fromRGB(255, 255, 255)
        slider.TextSize = 14
        slider.Font = Enum.Font.SourceSans
        slider.BorderSizePixel = 0
        slider.Parent = sliderFrame

        local sliderButton = Instance.new("TextButton")
        sliderButton.Size = UDim2.new(0, settings.size.X, 0, 5)
        sliderButton.Position = UDim2.new(0, 0, 0, 40)
        sliderButton.BackgroundColor3 = settings.color
        sliderButton.Text = ""
        sliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        sliderButton.BorderSizePixel = 0
        sliderButton.Parent = sliderFrame

        sliderButton.MouseDragChanged:Connect(function(input)
            local value = math.clamp((input.Position.X - sliderButton.Position.X.Offset) / sliderButton.Size.X.Offset, 0, 1)
            local newValue = math.floor(value * (max - min) + min)
            slider.Text = tostring(newValue)
            callback(newValue)
        end)
    end

    return window
end

return UILib
