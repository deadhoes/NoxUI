-- Roblox UI Library
local UILib = {}

-- Services
local RunService = game:GetService("RunService")

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UILibrary_ScreenGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("StarterGui") -- or game.Players.LocalPlayer:WaitForChild("PlayerGui") if local

-- Utility function to create UI instances
local function createInstance(class, properties, parent)
    local inst = Instance.new(class)
    for prop, value in pairs(properties) do
        inst[prop] = value
    end
    if parent then
        inst.Parent = parent
    end
    return inst
end

-- Create a new window
function UILib.CreateWindow(title, position, size)
    local window = createInstance("Frame", {
        Size = size or UDim2.new(0, 350, 0, 250),
        Position = position or UDim2.new(0.5, -175, 0.5, -125),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderSizePixel = 0,
        CornerRadius = UDim.new(0, 10),
        ClipsDescendants = true,
    }, ScreenGui)

    -- Title Bar
    local titleBar = createInstance("Frame", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = Color3.fromRGB(40, 40, 40),
        BorderSizePixel = 0,
    }, window)

    local titleLabel = createInstance("TextLabel", {
        Text = title or "Window",
        Size = UDim2.new(1, -10, 1, 0),
        Position = UDim2.new(0, 5, 0, 0),
        BackgroundTransparency = 1,
        TextColor3 = Color3.new(1, 1, 1),
        Font = Enum.Font.SourceSansBold,
        TextSize = 18,
        VerticalAlignment = Enum.VerticalAlignment.Center,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, titleBar)

    -- Make the window draggable
    local dragging = false
    local dragStart, startPos

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = window.Position
        end
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    RunService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Content Container
    local content = createInstance("Frame", {
        Size = UDim2.new(1, 0, 1, -30),
        Position = UDim2.new(0, 0, 0, 30),
        BackgroundTransparency = 1,
    }, window)

    -- Store for future additions
    window._content = content

    return {
        Window = window,
        Content = content,
    }
end

-- Add a button
function UILib.CreateButton(parent, text, callback)
    local button = createInstance("TextButton", {
        Text = text or "Button",
        Size = UDim2.new(1, -10, 0, 30),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        TextColor3 = Color3.new(1, 1, 1),
        Font = Enum.Font.SourceSans,
        TextSize = 16,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 5, 0, 5),
        AutomaticSize = Enum.AutomaticSize.Y,
        CornerRadius = UDim.new(0, 5),
        LayoutOrder = 0,
    }, parent)

    button.MouseButton1Click:Connect(callback)
    return button
end

-- Add a label
function UILib.CreateLabel(parent, text)
    local label = createInstance("TextLabel", {
        Text = text or "Label",
        Size = UDim2.new(1, -10, 0, 20),
        BackgroundTransparency = 1,
        TextColor3 = Color3.new(1, 1, 1),
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Position = UDim2.new(0, 5, 0, 5),
        TextXAlignment = Enum.TextXAlignment.Left,
        AutomaticSize = Enum.AutomaticSize.Y,
    }, parent)
    return label
end

-- Add a divider (a simple horizontal line)
function UILib.CreateDivider(parent, thickness, color)
    local divider = createInstance("Frame", {
        Size = UDim2.new(1, 0, 0, thickness or 2),
        BackgroundColor3 = color or Color3.fromRGB(80, 80, 80),
        BorderSizePixel = 0,
        Position = UDim2.new(0, 0, 0, 0),
    }, parent)
    return divider
end

-- Add a slider
function UILib.CreateSlider(parent, min, max, default, callback)
    local container = createInstance("Frame", {
        Size = UDim2.new(1, -10, 0, 50),
        BackgroundTransparency = 1,
        LayoutOrder = 0,
    }, parent)

    local label = UILib.CreateLabel(container, "Value: " .. tostring(default))
    label.Position = UDim2.new(0, 5, 0, 0)

    local sliderTrack = createInstance("Frame", {
        Size = UDim2.new(1, -10, 0, 20),
        Position = UDim2.new(0, 5, 0, 25),
        BackgroundColor3 = Color3.fromRGB(60, 60, 60),
        BorderSizePixel = 0,
        CornerRadius = UDim.new(0, 5),
    }, container)

    local fill = createInstance("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 170, 255),
        BorderSizePixel = 0,
        CornerRadius = UDim.new(0, 5),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
    }, sliderTrack)

    local knob = createInstance("Frame", {
        Size = UDim2.new(0, 10, 0, 20),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        CornerRadius = UDim.new(0, 3),
        Position = UDim2.new(0, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, sliderTrack)

    local dragging = false

    local function updateSlider(mouseX)
        local sliderStart = sliderTrack.AbsolutePosition.X
        local sliderWidth = sliderTrack.AbsoluteSize.X
        local percent = math.clamp((mouseX - sliderStart) / sliderWidth, 0, 1)
        fill.Size = UDim2.new(percent, 0, 1, 0)
        knob.Position = UDim2.new(percent, 0, 0.5, 0)
        local value = min + percent * (max - min)
        if callback then
            callback(value)
        end
        label.Text = "Value: " .. string.format("%.2f", value)
    end

    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    RunService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            updateSlider(input.Position.X)
        end
    end)

    knob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    -- Initialize slider to default value
    local initialPercent = (default - min) / (max - min)
    local sliderPosX = sliderTrack.AbsolutePosition.X + initialPercent * sliderTrack.AbsoluteSize.X
    updateSlider(sliderPosX)

    return {
        SetValue = function(self, value)
            value = math.clamp(value, min, max)
            local percent = (value - min) / (max - min)
            fill.Size = UDim2.new(percent, 0, 1, 0)
            knob.Position = UDim2.new(percent, 0, 0.5, 0)
            if callback then
                callback(value)
            end
        end,
        GetValue = function()
            local sizeX = fill.Size.X.Scale
            return min + sizeX * (max - min)
        end,
        Container = container,
    }
end

-- Add a textbox
function UILib.CreateTextBox(parent, placeholderText, callback)
    local textbox = createInstance("TextBox", {
        Text = "",
        PlaceholderText = placeholderText or "Enter text...",
        Size = UDim2.new(1, -10, 0, 30),
        BackgroundColor3 = Color3.fromRGB(50, 50, 50),
        TextColor3 = Color3.new(1, 1, 1),
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 5, 0, 5),
        CornerRadius = UDim.new(0, 5),
    }, parent)

    if callback then
        textbox.FocusLost:Connect(function()
            callback(textbox.Text)
        end)
    end
    return textbox
end

-- Make the UI library return itself
return UILib
