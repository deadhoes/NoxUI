-- Noctalis UI - Gelişmiş Lua UI Kütüphanesi
local Noctalis = {}

function Noctalis:Window(name)
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "NoctalisUI"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 640, 0, 420)
    main.Position = UDim2.new(0.5, -320, 0.5, -210)
    main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    main.BorderSizePixel = 0
    main.Name = name

    Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)
    Instance.new("UIStroke", main).Color = Color3.fromRGB(100, 100, 255)

    -- Close Button (X)
    local closeBtn = Instance.new("TextButton", main)
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 18
    closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
    closeBtn.BackgroundTransparency = 1
    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    -- Drag
    local drag = Instance.new("Frame", main)
    drag.Size = UDim2.new(1, 0, 0, 30)
    drag.BackgroundTransparency = 1

    local UIS = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos

    drag.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    drag.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    local tabList = Instance.new("Frame", main)
    tabList.Size = UDim2.new(0, 140, 1, 0)
    tabList.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Instance.new("UICorner", tabList).CornerRadius = UDim.new(0, 8)

    local tabsFolder = Instance.new("Folder", main)
    tabsFolder.Name = "Tabs"

    local windowFuncs = {}

    function windowFuncs:Tab(tabName, iconId)
        local tabBtn = Instance.new("TextButton", tabList)
        tabBtn.Size = UDim2.new(1, 0, 0, 40)
        tabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        tabBtn.Text = "   " .. tabName
        tabBtn.Font = Enum.Font.GothamSemibold
        tabBtn.TextColor3 = Color3.new(1, 1, 1)
        tabBtn.TextXAlignment = Enum.TextXAlignment.Left

        if iconId then
            local icon = Instance.new("ImageLabel", tabBtn)
            icon.Size = UDim2.new(0, 20, 0, 20)
            icon.Position = UDim2.new(0, 10, 0.5, -10)
            icon.Image = iconId
            icon.BackgroundTransparency = 1
        end

        local tabFrame = Instance.new("ScrollingFrame", tabsFolder)
        tabFrame.Size = UDim2.new(1, -150, 1, -10)
        tabFrame.Position = UDim2.new(0, 150, 0, 10)
        tabFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
        tabFrame.ScrollBarThickness = 6
        tabFrame.BackgroundTransparency = 1
        tabFrame.Visible = false
        Instance.new("UIListLayout", tabFrame).Padding = UDim.new(0, 10)

        tabBtn.MouseButton1Click:Connect(function()
            for _, t in pairs(tabsFolder:GetChildren()) do t.Visible = false end
            tabFrame.Visible = true
        end)

        local tabFuncs = {}

        function tabFuncs:Section(title)
            local secLabel = Instance.new("TextLabel", tabFrame)
            secLabel.Size = UDim2.new(1, -20, 0, 25)
            secLabel.Text = title
            secLabel.Font = Enum.Font.GothamBold
            secLabel.TextColor3 = Color3.new(1, 1, 1)
            secLabel.BackgroundTransparency = 1
            secLabel.TextXAlignment = Enum.TextXAlignment.Left

            local secFrame = Instance.new("Frame", tabFrame)
            secFrame.Size = UDim2.new(1, -20, 0, 200)
            secFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
            Instance.new("UICorner", secFrame).CornerRadius = UDim.new(0, 8)
            local layout = Instance.new("UIListLayout", secFrame)
            layout.Padding = UDim.new(0, 5)

            local secFuncs = {}

            function secFuncs:Button(text, cb)
                local btn = Instance.new("TextButton", secFrame)
                btn.Size = UDim2.new(1, 0, 0, 35)
                btn.Text = text
                btn.Font = Enum.Font.Gotham
                btn.TextColor3 = Color3.new(1,1,1)
                btn.BackgroundColor3 = Color3.fromRGB(60,60,65)
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
                btn.MouseButton1Click:Connect(function()
                    if cb then pcall(cb) end
                end)
            end

            function secFuncs:Toggle(text, state, cb)
                local toggle = Instance.new("TextButton", secFrame)
                toggle.Size = UDim2.new(1, 0, 0, 35)
                toggle.Text = text .. ": OFF"
                toggle.Font = Enum.Font.Gotham
                toggle.TextColor3 = Color3.new(1,1,1)
                toggle.BackgroundColor3 = Color3.fromRGB(60,60,65)
                Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 6)
                local on = state or false
                toggle.MouseButton1Click:Connect(function()
                    on = not on
                    toggle.Text = text .. ": " .. (on and "ON" or "OFF")
                    if cb then pcall(cb, on) end
                end)
            end

            function secFuncs:Slider(text, min, max, default, cb)
                local label = Instance.new("TextLabel", secFrame)
                label.Size = UDim2.new(1, 0, 0, 25)
                label.Text = text .. ": " .. tostring(default)
                label.Font = Enum.Font.Gotham
                label.TextColor3 = Color3.new(1,1,1)
                label.BackgroundTransparency = 1

                local slider = Instance.new("TextButton", secFrame)
                slider.Size = UDim2.new(1, 0, 0, 25)
                slider.BackgroundColor3 = Color3.fromRGB(80,80,85)
                Instance.new("UICorner", slider)
                local val = default
                slider.MouseButton1Click:Connect(function()
                    val = val + 1
                    if val > max then val = min end
                    label.Text = text .. ": " .. tostring(val)
                    if cb then pcall(cb, val) end
                end)
            end

            function secFuncs:Dropdown(title, options, cb)
                local drop = Instance.new("TextButton", secFrame)
                drop.Size = UDim2.new(1, 0, 0, 30)
                drop.Text = title
                drop.BackgroundColor3 = Color3.fromRGB(70,70,75)
                drop.TextColor3 = Color3.new(1,1,1)
                drop.Font = Enum.Font.Gotham
                Instance.new("UICorner", drop)

                local menu = Instance.new("Frame", drop)
                menu.Size = UDim2.new(1, 0, 0, #options * 30)
                menu.Position = UDim2.new(0, 0, 1, 0)
                menu.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
                menu.Visible = false
                Instance.new("UICorner", menu)

                for _, opt in ipairs(options) do
                    local item = Instance.new("TextButton", menu)
                    item.Size = UDim2.new(1, 0, 0, 30)
                    item.Text = opt
                    item.BackgroundTransparency = 1
                    item.TextColor3 = Color3.new(1,1,1)
                    item.Font = Enum.Font.Gotham
                    item.MouseButton1Click:Connect(function()
                        drop.Text = title .. ": " .. opt
                        menu.Visible = false
                        if cb then pcall(cb, opt) end
                    end)
                end

                drop.MouseButton1Click:Connect(function()
                    menu.Visible = not menu.Visible
                end)
            end

            return secFuncs
        end

        return tabFuncs
    end

    return windowFuncs
end

return Noctalis
