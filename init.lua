-- NoxUI Library (Roblox UI Kütüphanesi)
local NoxUI = {}

-- **1. Create Window**
function NoxUI:CreateWindow(title)
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui", playerGui)
    screenGui.Name = "NoxUI_Main"
    screenGui.ResetOnSpawn = false
    screenGui.Visible = true

    -- Main window
    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Name = "NoxUI_Window"
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true

    -- Title Bar
    local titleBar = Instance.new("Frame", mainFrame)
    titleBar.Name = "NoxUI_TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 50)
    titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

    local titleLabel = Instance.new("TextLabel", titleBar)
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 1, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextScaled = true

    -- Content area
    local content = Instance.new("Frame", mainFrame)
    content.Name = "NoxUI_Content"
    content.Position = UDim2.new(0, 0, 0, 50)
    content.Size = UDim2.new(1, 0, 1, -50)
    content.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    content.BorderSizePixel = 0

    -- Layout for content items
    local listLayout = Instance.new("UIListLayout", content)
    listLayout.Padding = UDim.new(0, 6)
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    -- **2. Add List Item**
    function NoxUI:AddListItem(text, callback)
        local listItem = Instance.new("TextButton", content)
        listItem.Size = UDim2.new(1, -20, 0, 40)
        listItem.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        listItem.Text = text
        listItem.TextColor3 = Color3.fromRGB(255, 255, 255)
        listItem.Font = Enum.Font.Gotham
        listItem.TextScaled = true
        listItem.AutoButtonColor = true
        listItem.BorderSizePixel = 0
        listItem.MouseButton1Click:Connect(callback)
    end

    -- **3. Add Input Field**
    function NoxUI:AddInputField(placeholder, callback)
        local inputBox = Instance.new("TextBox", content)
        inputBox.Size = UDim2.new(1, -20, 0, 40)
        inputBox.Position = UDim2.new(0, 0, 0, 10)
        inputBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        inputBox.PlaceholderText = placeholder
        inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
        inputBox.Font = Enum.Font.Gotham
        inputBox.TextScaled = true
        inputBox.BorderSizePixel = 0
        inputBox.ClearTextOnFocus = true
        inputBox.FocusLost:Connect(function()
            callback(inputBox.Text)
        end)
    end

    -- **4. Modal (Pop-up)**
    function NoxUI:CreateModal(message, buttonText, callback)
        local modal = Instance.new("Frame", screenGui)
        modal.Size = UDim2.new(0, 300, 0, 150)
        modal.Position = UDim2.new(0.5, -150, 0.5, -75)
        modal.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        modal.BorderSizePixel = 0
        modal.Visible = true

        local textLabel = Instance.new("TextLabel", modal)
        textLabel.Text = message
        textLabel.Size = UDim2.new(1, 0, 0.6, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextScaled = true

        local button = Instance.new("TextButton", modal)
        button.Size = UDim2.new(0.5, 0, 0.3, 0)
        button.Position = UDim2.new(0.25, 0, 0.6, 0)
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        button.Text = buttonText
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.Gotham
        button.TextScaled = true
        button.BorderSizePixel = 0
        button.MouseButton1Click:Connect(function()
            modal:Destroy()
            callback()
        end)
    end

    return NoxUI
end

return NoxUI
