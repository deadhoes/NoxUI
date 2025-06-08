local Library = {}

function Library:Window(name)
    -- Create main window
    local Options = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local TopBar = Instance.new("Frame")
    local TabButton = Instance.new("ImageLabel")
    local Close = Instance.new("ImageLabel")
    local Minimize = Instance.new("ImageLabel")
    local Tabs = Instance.new("Frame")

    Options.Name = "Options"
    Options.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    Options.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Frame.Parent = Options
    Frame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.403124988, 0, 0.297773659, 0)
    Frame.Size = UDim2.new(0, 492, 0, 319)

    TopBar.Name = "TopBar"
    TopBar.Parent = Frame
    TopBar.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    TopBar.BorderColor3 = Color3.fromRGB(30, 30, 30)
    TopBar.Position = UDim2.new(-0.000245629286, 0, -0.128526643, 0)
    TopBar.Size = UDim2.new(0, 491, 0, 41)

    TabButton.Name = "TabButton"
    TabButton.Parent = TopBar
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabButton.BackgroundTransparency = 1.000
    TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TabButton.BorderSizePixel = 0
    TabButton.Position = UDim2.new(0.0187398084, 0, 0.301219672, 0)
    TabButton.Size = UDim2.new(0, 15, 0, 15)
    TabButton.Image = "rbxassetid://11432865277"
    TabButton.ImageColor3 = Color3.fromRGB(150, 150, 150)

    Close.Name = "Close"
    Close.Parent = TopBar
    Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Close.BackgroundTransparency = 1.000
    Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.951122761, 0, 0.317073166, 0)
    Close.Size = UDim2.new(0, 15, 0, 15)
    Close.Image = "rbxassetid://11293981586"
    Close.ImageColor3 = Color3.fromRGB(150, 150, 150)

    Minimize.Name = "Minimize"
    Minimize.Parent = TopBar
    Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Minimize.BackgroundTransparency = 1.000
    Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Minimize.BorderSizePixel = 0
    Minimize.Position = UDim2.new(0.897212207, 0, 0.316999853, 0)
    Minimize.Size = UDim2.new(0, 15, 0, 15)
    Minimize.Image = "rbxassetid://11293980042"
    Minimize.ImageColor3 = Color3.fromRGB(150, 150, 150)

    Tabs.Name = "Tabs"
    Tabs.Parent = Frame
    Tabs.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Position = UDim2.new(0, 0, 0.0118329758, 0)
    Tabs.Size = UDim2.new(0, 155, 0, 315)

    -- Window functions
    local WindowFunctions = {}

    function WindowFunctions:Tab(name)
        local TabButton = Instance.new("TextButton")
        local Name = Instance.new("TextLabel")
        local Icon = Instance.new("ImageLabel")

        TabButton.Name = "TabButton"
        TabButton.Parent = Frame
        TabButton.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
        TabButton.BorderColor3 = Color3.fromRGB(30, 30, 30)
        TabButton.Position = UDim2.new(-0.000822361908, 0, 0.00940438826, 0)
        TabButton.Size = UDim2.new(0, 147, 0, 41)
        TabButton.Font = Enum.Font.SourceSans
        TabButton.Text = ""
        TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        TabButton.TextSize = 14.000

        Name.Name = "Name"
        Name.Parent = TabButton
        Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Name.BackgroundTransparency = 1.000
        Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Name.BorderSizePixel = 0
        Name.Position = UDim2.new(0.257078409, 0, 0.024390243, 0)
        Name.Size = UDim2.new(0, 117, 0, 40)
        Name.Font = Enum.Font.SourceSansBold
        Name.Text = name or "Tab"
        Name.TextColor3 = Color3.fromRGB(150, 150, 150)
        Name.TextSize = 15.000
        Name.TextXAlignment = Enum.TextXAlignment.Left

        Icon.Name = "Icon"
        Icon.Parent = TabButton
        Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Icon.BackgroundTransparency = 1.000
        Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
        Icon.BorderSizePixel = 0
        Icon.Position = UDim2.new(0, 5, 0.244000003, 0)
        Icon.Size = UDim2.new(0, 20, 0, 20)
        Icon.Image = "rbxassetid://12967526257"
        Icon.ImageColor3 = Color3.fromRGB(150, 150, 150)

        -- Tab functions
        local TabFunctions = {}

        function TabFunctions:Section(name)
            local SectionFrame = Instance.new("Frame")
            local SectionTitle = Instance.new("TextLabel")
            
            -- Section creation code here
            -- ...
            
            -- Section functions
            local SectionFunctions = {}

            function SectionFunctions:Button(text, callback)
                local Button = Instance.new("TextButton")
                -- Button creation code here
                -- ...
                
                if callback then
                    Button.MouseButton1Click:Connect(callback)
                end
            end

            return SectionFunctions
        end

        return TabFunctions
    end

    -- Close button functionality
    Close.MouseButton1Click:Connect(function()
        Options:Destroy()
    end)

    -- Minimize button functionality
    local isMinimized = false
    Minimize.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            Frame.Size = UDim2.new(0, 492, 0, 41)
        else
            Frame.Size = UDim2.new(0, 492, 0, 319)
        end
    end)

    return WindowFunctions
end

return Library
