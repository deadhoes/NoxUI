-- NoxUI Example: Simple UI Library

local NoxUI = {}
local CoreGui = game:GetService("CoreGui")

-- Theme Settings (colors)
local theme = {
    Background = Color3.fromRGB(30, 30, 30),
    Accent = Color3.fromRGB(60, 60, 60),
    Text = Color3.fromRGB(255, 255, 255),
    Button = Color3.fromRGB(40, 40, 40)
}

-- Create the main window
function NoxUI:CreateWindow(config)
    local Title = config.Title or "NoxUI Window"
    local Version = config.Version or "v1.0"

    -- Create the main ScreenGui
    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "NoxUI_Main"
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    MainFrame.BackgroundColor3 = theme.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Name = "MainFrame"
    MainFrame.ClipsDescendants = true

    local UICorner = Instance.new("UICorner", MainFrame)
    UICorner.CornerRadius = UDim.new(0, 6)

    -- Create the title label
    local TitleLabel = Instance.new("TextLabel", MainFrame)
    TitleLabel.Text = Title .. " - " .. Version
    TitleLabel.Size = UDim2.new(1, -30, 0, 30)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = theme.Text
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 16

    -- Create the Close button
    local CloseButton = Instance.new("TextButton", MainFrame)
    CloseButton.Size = UDim2.new(0, 25, 0, 25)
    CloseButton.Position = UDim2.new(1, -30, 0, 5)
    CloseButton.Text = "X"
    CloseButton.BackgroundColor3 = theme.Button
    CloseButton.TextColor3 = theme.Text
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 14
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Add a button to the window
    local ExampleButton = Instance.new("TextButton", MainFrame)
    ExampleButton.Size = UDim2.new(0, 150, 0, 40)
    ExampleButton.Position = UDim2.new(0.5, -75, 0.5, -20)
    ExampleButton.Text = "Click Me"
    ExampleButton.BackgroundColor3 = theme.Button
    ExampleButton.TextColor3 = theme.Text
    ExampleButton.Font = Enum.Font.Gotham
    ExampleButton.TextSize = 16
    ExampleButton.MouseButton1Click:Connect(function()
        print("Button clicked!")
    end)

    return NoxUI
end

-- Example usage
local ui = NoxUI:CreateWindow({Title = "My Custom UI", Version = "v1.0"})

-- NoxUI Example: Add More Features

-- Add Divider
function NoxUI:AddDivider(parent, size, position)
    local Divider = Instance.new("Frame")
    Divider.Size = UDim2.new(1, 0, 0, size or 2)
    Divider.Position = position or UDim2.new(0, 0, 0, 0)
    Divider.BackgroundColor3 = theme.Accent
    Divider.BorderSizePixel = 0
    Divider.Parent = parent
    return Divider
end

-- Add Selection Title
function NoxUI:AddSelectionTitle(parent, title)
    local SelectionTitle = Instance.new("TextLabel")
    SelectionTitle.Text = title
    SelectionTitle.Size = UDim2.new(1, -20, 0, 30)
    SelectionTitle.Position = UDim2.new(0, 10, 0, 30)
    SelectionTitle.BackgroundTransparency = 1
    SelectionTitle.TextColor3 = theme.Text
    SelectionTitle.Font = Enum.Font.GothamBold
    SelectionTitle.TextSize = 18
    SelectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    SelectionTitle.Parent = parent
    return SelectionTitle
end

-- Add Toggle Button
function NoxUI:AddToggleButton(parent, title, defaultValue, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, -20, 0, 40)
    ToggleFrame.Position = UDim2.new(0, 10, 0, 70)
    ToggleFrame.BackgroundColor3 = theme.Background
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = parent
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = title
    TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = theme.Text
    TitleLabel.Font = Enum.Font.Gotham
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = ToggleFrame
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 50, 0, 25)
    ToggleButton.Position = UDim2.new(1, -60, 0, 7)
    ToggleButton.Text = defaultValue and "ON" or "OFF"
    ToggleButton.BackgroundColor3 = theme.Button
    ToggleButton.TextColor3 = theme.Text
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.TextSize = 14
    ToggleButton.Parent = ToggleFrame
    
    ToggleButton.MouseButton1Click:Connect(function()
        defaultValue = not defaultValue
        ToggleButton.Text = defaultValue and "ON" or "OFF"
        if callback then
            callback(defaultValue)
        end
    end)

    return ToggleButton
end

-- Add Slider
function NoxUI:AddSlider(parent, title, min, max, defaultValue, callback)
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, -20, 0, 40)
    SliderFrame.Position = UDim2.new(0, 10, 0, 110)
    SliderFrame.BackgroundColor3 = theme.Background
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = parent
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = title
    TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
    TitleLabel.Position = UDim2.new(0, 10, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = theme.Text
    TitleLabel.Font = Enum.Font.Gotham
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = SliderFrame
    
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(1, -20, 0, 5)
    Slider.Position = UDim2.new(0, 10, 1, -10)
    Slider.BackgroundColor3 = theme.Accent
    Slider.BorderSizePixel = 0
    Slider.Parent = SliderFrame
    
    local Handle = Instance.new("Frame")
    Handle.Size = UDim2.new(0, 20, 0, 20)
    Handle.Position = UDim2.new(0, (defaultValue - min) / (max - min) * (Slider.Size.X.Offset - 20), 0, -7)
    Handle.BackgroundColor3 = theme.Button
    Handle.BorderSizePixel = 0
    Handle.Parent = Slider
    
    local SliderInput = Instance.new("TextButton")
    SliderInput.Size = UDim2.new(1, 0, 1, 0)
    SliderInput.Position = UDim2.new(0, 0, 0, 0)
    SliderInput.BackgroundTransparency = 1
    SliderInput.Parent = Slider
    
    SliderInput.MouseButton1Drag:Connect(function()
        local mousePos = game:GetService("UserInputService"):GetMouseLocation()
        local offset = math.clamp(mousePos.X - Slider.AbsolutePosition.X, 0, Slider.Size.X.Offset - 20)
        local newValue = min + (offset / (Slider.Size.X.Offset - 20)) * (max - min)
        Handle.Position = UDim2.new(0, offset, 0, -7)
        if callback then
            callback(newValue)
        end
    end)

    return Slider
end

-- Example usage with additional features
local ui = NoxUI:CreateWindow({Title = "My Extended UI", Version = "v1.1"})

-- Add Divider
NoxUI:AddDivider(ui.MainFrame, 2, UDim2.new(0, 0, 0, 40))

-- Add Selection Title
NoxUI:AddSelectionTitle(ui.MainFrame, "Settings")

-- Add Toggle Button
NoxUI:AddToggleButton(ui.MainFrame, "Enable Feature", true, function(value)
    print("Feature enabled:", value)
end)

-- Add Slider
NoxUI:AddSlider(ui.MainFrame, "Volume", 0, 100, 50, function(value)
    print("Volume set to:", value)
end)
