local NoxUI = {}

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Core Styling
local DEFAULTS = {
    Font = Enum.Font.GothamSemibold,
    TextSize = 16,
    Padding = 10,
    BackgroundColor = Color3.fromRGB(30, 30, 30),
    TitleBarColor = Color3.fromRGB(0, 132, 255),
    TitleTextColor = Color3.fromRGB(255, 255, 255),
    BorderColor = Color3.fromRGB(50, 50, 50),
    CornerRadius = 12,
    ElementSpacing = 8
}

-- Helper to create UI elements
local function Create(class, props)
    local obj = Instance.new(class)
    for i, v in pairs(props) do
        obj[i] = v
    end
    return obj
end

-- Create the main window
function NoxUI:CreateWindow(config)
    config = setmetatable(config or {}, { __index = DEFAULTS })

    local ScreenGui = Create("ScreenGui", {
        Name = "NoxUI",
        Parent = CoreGui,
        ResetOnSpawn = false,
    })

    local Frame = Create("Frame", {
        Size = config.Size,
        Position = config.Position,
        BackgroundColor3 = config.BackgroundColor,
        BorderColor3 = config.BorderColor,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = ScreenGui
    })

    Create("UICorner", {
        CornerRadius = UDim.new(0, config.CornerRadius),
        Parent = Frame
    })

    local Layout = Create("UIListLayout", {
        Padding = UDim.new(0, config.ElementSpacing),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = Frame
    })

    Create("UIPadding", {
        PaddingTop = UDim.new(0, config.Padding),
        PaddingBottom = UDim.new(0, config.Padding),
        PaddingLeft = UDim.new(0, config.Padding),
        PaddingRight = UDim.new(0, config.Padding),
        Parent = Frame
    })

    local Title = Create("TextLabel", {
        Text = config.Title,
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Font = config.Font,
        TextSize = config.TextSize + 2,
        TextColor3 = config.TitleTextColor,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Frame
    })

    return Frame
end

-- Create a button
function NoxUI:CreateButton(parent, text, callback)
    local btn = Create("TextButton", {
        Text = text,
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = DEFAULTS.Font,
        TextSize = DEFAULTS.TextSize,
        Parent = parent
    })

    Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = btn })

    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
end

-- Create a toggle
function NoxUI:CreateToggle(parent, text, default, callback)
    local toggle = Create("TextButton", {
        Text = text,
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = DEFAULTS.Font,
        TextSize = DEFAULTS.TextSize,
        Parent = parent
    })

    Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = toggle })

    local state = default or false

    toggle.MouseButton1Click:Connect(function()
        state = not state
        toggle.BackgroundColor3 = state and Color3.fromRGB(0, 170, 90) or Color3.fromRGB(45, 45, 45)
        pcall(callback, state)
    end)
end

-- Create a slider
function NoxUI:CreateSlider(parent, text, min, max, default, callback)
    local holder = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundTransparency = 1,
        Parent = parent
    })

    local label = Create("TextLabel", {
        Text = text .. ": " .. default,
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = DEFAULTS.Font,
        TextSize = DEFAULTS.TextSize,
        Parent = holder
    })

    local sliderBg = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 8),
        Position = UDim2.new(0, 0, 1, -10),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        Parent = holder
    })

    local fill = Create("Frame", {
        Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 132, 255),
        Parent = sliderBg
    })

    local dragging = false

    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    game:GetService("RunService").RenderStepped:Connect(function()
        if dragging then
            local mouse = game:GetService("UserInputService"):GetMouseLocation().X
            local relative = math.clamp((mouse - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
            local value = math.floor(min + (max - min) * relative)
            fill.Size = UDim2.new(relative, 0, 1, 0)
            label.Text = text .. ": " .. value
            pcall(callback, value)
        end
    end)
end

-- Create a textbox
function NoxUI:CreateTextBox(parent, data)
    local box = Create("TextBox", {
        PlaceholderText = data.Placeholder or "Enter text...",
        Text = "",
        Size = UDim2.new(1, 0, 0, 32),
        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = DEFAULTS.Font,
        TextSize = DEFAULTS.TextSize,
        ClearTextOnFocus = false,
        Parent = parent
    })

    Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = box })

    local label = Create("TextLabel", {
        Text = data.Title or "Input",
        Size = UDim2.new(1, 0, 0, 16),
        BackgroundTransparency = 1,
        Font = DEFAULTS.Font,
        TextSize = DEFAULTS.TextSize - 2,
        TextColor3 = Color3.fromRGB(180, 180, 180),
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = parent
    })

    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            pcall(data.Callback, box.Text)
        end
    end)
end

-- Notification
function NoxUI:CreateNotification(title, message, duration)
    local ScreenGui = CoreGui:FindFirstChild("NoxUI")
    if not ScreenGui then return end

    local notif = Create("TextLabel", {
        Text = title .. "\n" .. message,
        Size = UDim2.new(0, 250, 0, 80),
        Position = UDim2.new(1, -260, 1, -100),
        BackgroundColor3 = Color3.fromRGB(20, 20, 20),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = DEFAULTS.Font,
        TextSize = 15,
        TextWrapped = true,
        Parent = ScreenGui
    })

    Create("UICorner", { CornerRadius = UDim.new(0, 8), Parent = notif })

    TweenService:Create(notif, TweenInfo.new(0.4), {
        Position = UDim2.new(1, -260, 1, -120)
    }):Play()

    task.delay(duration or 3, function()
        if notif then
            TweenService:Create(notif, TweenInfo.new(0.4), {
                Position = UDim2.new(1, 20, 1, -100)
            }):Play()
            task.wait(0.4)
            notif:Destroy()
        end
    end)
end

return NoxUI
