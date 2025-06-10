local Noctalis = {}

function Noctalis:Window(name)
    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "NoctalisUI"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local main = Instance.new("Frame", gui)
    main.Size = UDim2.new(0, 600, 0, 400)
    main.Position = UDim2.new(0.5, -300, 0.5, -200)
    main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    main.BorderSizePixel = 0
    main.Name = name

    local stroke = Instance.new("UIStroke", main)
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(85, 170, 255)

    local corner = Instance.new("UICorner", main)
    corner.CornerRadius = UDim.new(0, 12)

    local drag = Instance.new("Frame", main)
    drag.Size = UDim2.new(1, 0, 0, 30)
    drag.BackgroundTransparency = 1
    drag.Name = "DragTop"

    -- DRAG SYSTEM
    local UserInputService = game:GetService("UserInputService")
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

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Tab UI
    local tabContainer = Instance.new("Frame", main)
    tabContainer.Size = UDim2.new(0, 150, 1, 0)
    tabContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    tabContainer.BorderSizePixel = 0

    local tabsFolder = Instance.new("Folder", main)
    tabsFolder.Name = "Tabs"

    local windowFunctions = {}

    function windowFunctions:Tab(tabName, iconId) -- iconId örneği: "rbxassetid://123456"
        local button = Instance.new("TextButton", tabContainer)
        button.Size = UDim2.new(1, 0, 0, 40)
        button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        button.Text = "   " .. tabName
        button.Font = Enum.Font.GothamBold
        button.TextColor3 = Color3.new(1, 1, 1)
        button.TextXAlignment = Enum.TextXAlignment.Left

        local icon
        if iconId then
            icon = Instance.new("ImageLabel", button)
            icon.Size = UDim2.new(0, 20, 0, 20)
            icon.Position = UDim2.new(0, 10, 0.5, -10)
            icon.Image = iconId
            icon.BackgroundTransparency = 1
        end

        local tabFrame = Instance.new("Frame", tabsFolder)
        tabFrame.Size = UDim2.new(1, -150, 1, 0)
        tabFrame.Position = UDim2.new(0, 150, 0, 0)
        tabFrame.BackgroundTransparency = 1
        tabFrame.Visible = false

        button.MouseButton1Click:Connect(function()
            for _, t in pairs(tabsFolder:GetChildren()) do t.Visible = false end
            tabFrame.Visible = true
        end)

        local tabFunctions = {}

        function tabFunctions:Section(sectionTitle)
            local label = Instance.new("TextLabel", tabFrame)
            label.Size = UDim2.new(1, -20, 0, 30)
            label.Position = UDim2.new(0, 10, 0, 10)
            label.BackgroundTransparency = 1
            label.Text = sectionTitle
            label.Font = Enum.Font.GothamSemibold
            label.TextColor3 = Color3.new(1, 1, 1)
            label.TextSize = 18
            label.TextXAlignment = Enum.TextXAlignment.Left

            local frame = Instance.new("Frame", tabFrame)
            frame.Size = UDim2.new(1, -20, 0, 300)
            frame.Position = UDim2.new(0, 10, 0, 40)
            frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            frame.BorderSizePixel = 0

            local corner = Instance.new("UICorner", frame)
            corner.CornerRadius = UDim.new(0, 8)

            local layout = Instance.new("UIListLayout", frame)
            layout.Padding = UDim.new(0, 6)
            layout.SortOrder = Enum.SortOrder.LayoutOrder

            local sectionFunctions = {}

            function sectionFunctions:Button(text, callback)
                local btn = Instance.new("TextButton", frame)
                btn.Size = UDim2.new(1, 0, 0, 40)
                btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
                btn.Text = text
                btn.Font = Enum.Font.GothamBold
                btn.TextColor3 = Color3.new(1, 1, 1)

                local corner = Instance.new("UICorner", btn)
                corner.CornerRadius = UDim.new(0, 6)

                btn.MouseButton1Click:Connect(function()
                    if callback then pcall(callback) end
                end)
            end

            return sectionFunctions
        end

        return tabFunctions
    end

    return windowFunctions
end

return Noctalis
