-- Gui to Lua (customized with Toggle, Dropdown, TextBox, Tabs)
-- Version: 1.0

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CustomMenu"
ScreenGui.Parent = playerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Menu Frame
local Menu = Instance.new("Frame")
Menu.Name = "Menu"
Menu.Parent = ScreenGui
Menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Menu.Position = UDim2.new(0.25, 0, 0.25, 0)
Menu.Size = UDim2.new(0, 700, 0, 400)
Menu.ClipsDescendants = true
Menu.AnchorPoint = Vector2.new(0.5, 0.5)
Menu.Position = UDim2.new(0.5, 0, 0.5, 0)
local UICorner = Instance.new("UICorner", Menu)
UICorner.CornerRadius = UDim.new(0.03, 0)

-- Header Label
local Header = Instance.new("TextLabel")
Header.Name = "Header"
Header.Parent = Menu
Header.BackgroundTransparency = 1
Header.Size = UDim2.new(1, 0, 0, 40)
Header.Font = Enum.Font.GothamBold
Header.Text = "Custom UI Menu"
Header.TextColor3 = Color3.new(1, 1, 1)
Header.TextSize = 22
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.PaddingLeft = UDim.new(0, 15)

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Menu
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.TextSize = 24

-- Close Button Tween and Hide Logic
CloseButton.MouseButton1Click:Connect(function()
    local tweenInfoShrink = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local shrinkTween = TweenService:Create(Menu, tweenInfoShrink, {
        Size = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1
    })
    shrinkTween:Play()
    shrinkTween.Completed:Wait()
    ScreenGui.Enabled = false
end)

-- Tabs Frame (left side)
local TabsFrame = Instance.new("Frame")
TabsFrame.Name = "TabsFrame"
TabsFrame.Parent = Menu
TabsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TabsFrame.Size = UDim2.new(0, 150, 1, -40)
TabsFrame.Position = UDim2.new(0, 0, 0, 40)
local tabsUICorner = Instance.new("UICorner", TabsFrame)
tabsUICorner.CornerRadius = UDim.new(0.03, 0)

-- Content Frame (right side)
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = Menu
ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ContentFrame.Size = UDim2.new(1, -150, 1, -40)
ContentFrame.Position = UDim2.new(0, 150, 0, 40)
local contentUICorner = Instance.new("UICorner", ContentFrame)
contentUICorner.CornerRadius = UDim.new(0.03, 0)

-- Utility function: create Tab Buttons
local function createTab(name)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = name .. "Tab"
    tabBtn.Parent = TabsFrame
    tabBtn.Size = UDim2.new(1, 0, 0, 40)
    tabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tabBtn.Font = Enum.Font.Gotham
    tabBtn.Text = name
    tabBtn.TextColor3 = Color3.new(1, 1, 1)
    tabBtn.TextSize = 18
    tabBtn.BorderSizePixel = 0
    tabBtn.LayoutOrder = #TabsFrame:GetChildren()
    local corner = Instance.new("UICorner", tabBtn)
    corner.CornerRadius = UDim.new(0.1, 0)
    return tabBtn
end

-- Utility function: clear content frame
local function clearContent()
    for _, child in pairs(ContentFrame:GetChildren()) do
        if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
            child:Destroy()
        end
    end
end

-- Tab: Toggle Button Page
local toggleTab = createTab("Toggle")
toggleTab.Position = UDim2.new(0, 0, 0, 0)

local function createTogglePage()
    clearContent()
    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Parent = ContentFrame
    toggleLabel.Size = UDim2.new(1, -20, 0, 40)
    toggleLabel.Position = UDim2.new(0, 10, 0, 10)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Text = "Toggle Button:"
    toggleLabel.TextColor3 = Color3.new(1, 1, 1)
    toggleLabel.Font = Enum.Font.GothamBold
    toggleLabel.TextSize = 20
    toggleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Parent = ContentFrame
    toggleBtn.Size = UDim2.new(0, 120, 0, 40)
    toggleBtn.Position = UDim2.new(0, 10, 0, 60)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggleBtn.Font = Enum.Font.Gotham
    toggleBtn.TextColor3 = Color3.new(1, 1, 1)
    toggleBtn.TextSize = 18
    toggleBtn.Text = "OFF"
    toggleBtn.AutoButtonColor = false
    local corner = Instance.new("UICorner", toggleBtn)
    corner.CornerRadius = UDim.new(0.2, 0)

    local toggled = false
    toggleBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            toggleBtn.Text = "ON"
            toggleBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        else
            toggleBtn.Text = "OFF"
            toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end
    end)
end

-- Tab: Dropdown Page
local dropdownTab = createTab("Dropdown")

local function createDropdownPage()
    clearContent()
    local dropdownLabel = Instance.new("TextLabel")
    dropdownLabel.Parent = ContentFrame
    dropdownLabel.Size = UDim2.new(1, -20, 0, 40)
    dropdownLabel.Position = UDim2.new(0, 10, 0, 10)
    dropdownLabel.BackgroundTransparency = 1
    dropdownLabel.Text = "Dropdown List:"
    dropdownLabel.TextColor3 = Color3.new(1, 1, 1)
    dropdownLabel.Font = Enum.Font.GothamBold
    dropdownLabel.TextSize = 20
    dropdownLabel.TextXAlignment = Enum.TextXAlignment.Left

    local dropdownBtn = Instance.new("TextButton")
    dropdownBtn.Parent = ContentFrame
    dropdownBtn.Size = UDim2.new(0, 200, 0, 40)
    dropdownBtn.Position = UDim2.new(0, 10, 0, 60)
    dropdownBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    dropdownBtn.Font = Enum.Font.Gotham
    dropdownBtn.TextColor3 = Color3.new(1, 1, 1)
    dropdownBtn.TextSize = 18
    dropdownBtn.Text = "Select an option"
    dropdownBtn.AutoButtonColor = false
    local corner = Instance.new("UICorner", dropdownBtn)
    corner.CornerRadius = UDim.new(0.2, 0)

    -- Dropdown Frame (hidden initially)
    local dropdownList = Instance.new("Frame")
    dropdownList.Parent = ContentFrame
    dropdownList.Position = UDim2.new(0, 10, 0, 100)
    dropdownList.Size = UDim2.new(0, 200, 0, 0)
    dropdownList.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    local dlCorner = Instance.new("UICorner", dropdownList)
    dlCorner.CornerRadius = UDim.new(0.2, 0)
    dropdownList.ClipsDescendants = true

    -- Options
    local options = {"Option 1", "Option 2", "Option 3"}
    local optionButtons = {}

    local function closeDropdown()
        local tween = TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 200, 0, 0)})
        tween:Play()
    end

    local function openDropdown()
        local tween = TweenService:Create(dropdownList, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 200, 0, #options * 35)})
        tween:Play()
    end

    local dropdownOpen = false
    dropdownBtn.MouseButton1Click:Connect(function()
        if dropdownOpen then
            closeDropdown()
            dropdownOpen = false
        else
            openDropdown()
            dropdownOpen = true
        end
    end)

    for i, option in ipairs(options) do
        local btn = Instance.new("TextButton")
        btn.Parent = dropdownList
        btn.Size = UDim2.new(1, 0, 0, 35)
        btn.Position = UDim2.new(0, 0, 0, (i - 1) * 35)
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        btn.Text = option
        btn.Font = Enum.Font.Gotham
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.TextSize = 16
        btn.BorderSizePixel = 0
        local c = Instance.new("UICorner", btn)
        c.CornerRadius = UDim.new(0.2, 0)

        btn.MouseEnter:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
        end)
        btn.MouseLeave:Connect(function()
            btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        end)

        btn.MouseButton1Click:Connect(function()
            dropdownBtn.Text = option
            dropdownOpen = false
            closeDropdown()
        end)

        table.insert(optionButtons, btn)
    end
end

-- Tab: TextBox Page
local textboxTab = createTab("TextBox")

local function createTextBoxPage()
    clearContent()
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = ContentFrame
    textLabel.Size = UDim2.new(1, -20, 0, 40)
    textLabel.Position = UDim2.new(0, 10, 0, 10)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "Enter text:"
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 20
    textLabel.TextXAlignment = Enum.TextXAlignment.Left

    local textBox = Instance.new("TextBox")
    textBox.Parent = ContentFrame
    textBox.Size = UDim2.new(0, 300, 0, 40)
    textBox.Position = UDim2.new(0, 10, 0, 60)
    textBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    textBox.TextColor3 = Color3.new(1, 1, 1)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 18
    textBox.ClearTextOnFocus = false
    local c = Instance.new("UICorner", textBox)
    c.CornerRadius = UDim.new(0.2, 0)

    -- Optional: Handle input submission
    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            print("Text entered:", textBox.Text)
        end
    end)
end

-- Tab selection logic
local tabs = {toggleTab, dropdownTab, textboxTab}
local pages = {createTogglePage, createDropdownPage, createTextBoxPage}

local currentTab = nil
local function selectTab(tab)
    for i, t in ipairs(tabs) do
        if t == tab then
            t.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
            pages[i]()
            currentTab = tab
        else
            t.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end
end

-- Connect tabs to select
for _, tabBtn in ipairs(tabs) do
    tabBtn.MouseButton1Click:Connect(function()
        selectTab(tabBtn)
    end)
end

-- Initialize first tab as selected
selectTab(tabs[1])
