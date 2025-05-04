local UILib = {}

-- Ana GUI oluşturucu
function UILib:CreateScreen(name)
    local screen = Instance.new("ScreenGui")
    screen.Name = name or "ModernUI"
    screen.ResetOnSpawn = false
    screen.IgnoreGuiInset = true
    screen.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    return screen
end

-- Modern ve şık frame oluşturucu
function UILib:CreateFrame(parent, props)
    local frame = Instance.new("Frame")
    frame.Size = props.Size or UDim2.new(0, 400, 0, 250)
    frame.Position = props.Position or UDim2.new(0.5, -200, 0.5, -125)
    frame.BackgroundColor3 = props.Color or Color3.fromRGB(50, 50, 50)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = parent

    -- Gölge efekti ekleme
    local shadow = Instance.new("ImageLabel")
    shadow.Size = UDim2.new(1, 10, 1, 10)
    shadow.Position = UDim2.new(0, -5, 0, -5)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://2310179834"  -- Varsayılan bir gölge resmi
    shadow.Parent = frame

    return frame
end

-- Modern label oluşturucu
function UILib:CreateLabel(parent, text, props)
    local label = Instance.new("TextLabel")
    label.Text = text or "Label"
    label.Size = props.Size or UDim2.new(1, 0, 0, 40)
    label.Position = props.Position or UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = props.Color or Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamSemibold
    label.TextScaled = true
    label.TextStrokeTransparency = 0.8
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.Parent = parent
    return label
end

-- Modern buton oluşturucu
function UILib:CreateButton(parent, text, onClick, props)
    local button = Instance.new("TextButton")
    button.Text = text or "Button"
    button.Size = props.Size or UDim2.new(0, 200, 0, 50)
    button.Position = props.Position or UDim2.new(0.5, -100, 0.5, -25)
    button.BackgroundColor3 = props.Color or Color3.fromRGB(72, 157, 255)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextScaled = true
    button.BorderSizePixel = 0
    button.Parent = parent
    
    -- Hover efekti
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = props.Color or Color3.fromRGB(72, 157, 255)
    end)

    -- Butona tıklama işlevi
    button.MouseButton1Click:Connect(onClick)

    return button
end

return UILib
