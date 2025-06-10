--[[
  Noctalis UI Library v1.0
  Created by: Noctalis Softworks
  Description: A modern, draggable, customizable UI library for Roblox games.
]]

local Library = {}
local uis = game:GetService("UserInputService")

function Library:Window(name)
    local screenGui = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = name
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Size = UDim2.new(0, 500, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Active = true
    mainFrame.Draggable = true

    local title = Instance.new("TextLabel", mainFrame)
    title.Text = name
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20

    local close = Instance.new("TextButton", mainFrame)
    close.Text = "✕"
    close.Size = UDim2.new(0, 40, 0, 40)
    close.Position = UDim2.new(1, -40, 0, 0)
    close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    close.TextColor3 = Color3.fromRGB(255, 80, 80)
    close.Font = Enum.Font.GothamBold
    close.TextSize = 18
    close.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    local TabFunctions = {}
    function TabFunctions:Tab(tabName)
        local tab = Instance.new("Frame", mainFrame)
        tab.Name = tabName
        tab.Size = UDim2.new(1, -20, 1, -60)
        tab.Position = UDim2.new(0, 10, 0, 50)
        tab.BackgroundTransparency = 1

        local SectionFunctions = {}
        function SectionFunctions:Button(text, callback)
            local button = Instance.new("TextButton", tab)
            button.Size = UDim2.new(0, 200, 0, 40)
            button.Position = UDim2.new(0, 10, 0, 10)
            button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            button.Text = text
            button.Font = Enum.Font.Gotham
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 16
            button.MouseButton1Click:Connect(callback)
        end

        function SectionFunctions:Slider(name, min, max, default, callback)
            local sliderLabel = Instance.new("TextLabel", tab)
            sliderLabel.Text = name .. ": " .. tostring(default)
            sliderLabel.Size = UDim2.new(0, 200, 0, 20)
            sliderLabel.Position = UDim2.new(0, 10, 0, 60)
            sliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderLabel.Font = Enum.Font.Gotham
            sliderLabel.TextSize = 14

            local slider = Instance.new("TextButton", tab)
            slider.Size = UDim2.new(0, 200, 0, 20)
            slider.Position = UDim2.new(0, 10, 0, 85)
            slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            slider.Text = ""
            
            local fill = Instance.new("Frame", slider)
            fill.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
            fill.Size = UDim2.new((default - min)/(max - min), 0, 1, 0)
            fill.BorderSizePixel = 0

            slider.MouseButton1Down:Connect(function()
                local conn
                conn = uis.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        local rel = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                        local val = math.floor((min + (max - min) * rel) + 0.5)
                        fill.Size = UDim2.new(rel, 0, 1, 0)
                        sliderLabel.Text = name .. ": " .. val
                        callback(val)
                    end
                end)
                uis.InputEnded:Wait()
                conn:Disconnect()
            end)
        end

        function SectionFunctions:Toggle(text, default, callback)
            local toggle = Instance.new("TextButton", tab)
            toggle.Size = UDim2.new(0, 200, 0, 30)
            toggle.Position = UDim2.new(0, 10, 0, 120)
            toggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggle.Font = Enum.Font.Gotham
            toggle.TextSize = 16

            local state = default
            local function update()
                toggle.Text = (state and "✔ " or "✖ ") .. text
                callback(state)
            end
            update()
            toggle.MouseButton1Click:Connect(function()
                state = not state
                update()
            end)
        end

        function SectionFunctions:Dropdown(titleText, options, callback)
            local label = Instance.new("TextLabel", tab)
            label.Text = titleText
            label.Size = UDim2.new(0, 200, 0, 20)
            label.Position = UDim2.new(0, 10, 0, 160)
            label.Font = Enum.Font.Gotham
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextSize = 14
            label.BackgroundTransparency = 1

            local dropDown = Instance.new("TextButton", tab)
            dropDown.Size = UDim2.new(0, 200, 0, 30)
            dropDown.Position = UDim2.new(0, 10, 0, 185)
            dropDown.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            dropDown.Text = "Select..."
            dropDown.Font = Enum.Font.Gotham
            dropDown.TextColor3 = Color3.fromRGB(255, 255, 255)
            dropDown.TextSize = 14

            local dropdownFrame = Instance.new("Frame", dropDown)
            dropdownFrame.Size = UDim2.new(1, 0, 0, #options * 25)
            dropdownFrame.Position = UDim2.new(0, 0, 1, 0)
            dropdownFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            dropdownFrame.Visible = false
            dropdownFrame.ClipsDescendants = true

            for _, option in pairs(options) do
                local btn = Instance.new("TextButton", dropdownFrame)
                btn.Size = UDim2.new(1, 0, 0, 25)
                btn.Position = UDim2.new(0, 0, 0, (_ - 1) * 25)
                btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                btn.Text = option
                btn.Font = Enum.Font.Gotham
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                btn.TextSize = 14
                btn.MouseButton1Click:Connect(function()
                    dropDown.Text = option
                    dropdownFrame.Visible = false
                    callback(option)
                end)
            end

            dropDown.MouseButton1Click:Connect(function()
                dropdownFrame.Visible = not dropdownFrame.Visible
            end)
        end

        return SectionFunctions
    end
    return TabFunctions
end

return Library
