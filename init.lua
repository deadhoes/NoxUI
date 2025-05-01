-- NoxUI by İlke
-- Theme options: "dark", "blue"
local NoxUI = {}
local CoreGui = game:GetService("CoreGui")

function NoxUI:CreateWindow(config)
    local Title = config.Title or "NoxUI Window"
    local Version = config.Version or "v1.0"
    local Theme = config.Theme or "dark"

    -- Remove existing UI if reloaded
    if CoreGui:FindFirstChild("NoxUI_Main") then
        CoreGui:FindFirstChild("NoxUI_Main"):Destroy()
    end

    -- Theme colors
    local themes = {
        dark = {
            Background = Color3.fromRGB(30,30,30),
            Accent = Color3.fromRGB(60,60,60),
            Text = Color3.fromRGB(255,255,255),
            Button = Color3.fromRGB(40,40,40)
        },
        blue = {
            Background = Color3.fromRGB(20,25,35),
            Accent = Color3.fromRGB(45,60,90),
            Text = Color3.fromRGB(255,255,255),
            Button = Color3.fromRGB(40,60,100)
        }
    }

    local colors = themes[Theme] or themes["dark"]

    -- UI Main
    local ScreenGui = Instance.new("ScreenGui", CoreGui)
    ScreenGui.Name = "NoxUI_Main"
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 500, 0, 350)
    MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
    MainFrame.BackgroundColor3 = colors.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Name = "MainFrame"
    MainFrame.ClipsDescendants = true

    local UICorner = Instance.new("UICorner", MainFrame)
    UICorner.CornerRadius = UDim.new(0, 6)

    local TitleLabel = Instance.new("TextLabel", MainFrame)
    TitleLabel.Text = Title .. " - " .. Version
    TitleLabel.Size = UDim2.new(1, -30, 0, 30)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = colors.Text
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 16

    local Close = Instance.new("TextButton", MainFrame)
    Close.Size = UDim2.new(0, 25, 0, 25)
    Close.Position = UDim2.new(1, -30, 0, 5)
    Close.Text = "X"
    Close.BackgroundColor3 = colors.Button
    Close.TextColor3 = colors.Text
    Close.Font = Enum.Font.GothamBold
    Close.TextSize = 14
    Close.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local TabHolder = Instance.new("Frame", MainFrame)
    TabHolder.Position = UDim2.new(0, 10, 0, 40)
    TabHolder.Size = UDim2.new(1, -20, 0, 30)
    TabHolder.BackgroundTransparency = 1

    local Pages = Instance.new("Frame", MainFrame)
    Pages.Position = UDim2.new(0, 10, 0, 80)
    Pages.Size = UDim2.new(1, -20, 1, -90)
    Pages.BackgroundTransparency = 1
    Pages.Name = "Pages"

    local Tabs = {}
    local CurrentTab

    function NoxUI:CreateTab(name)
        local tabButton = Instance.new("TextButton", TabHolder)
        tabButton.Size = UDim2.new(0, 100, 1, 0)
        tabButton.Text = name
        tabButton.BackgroundColor3 = colors.Button
        tabButton.TextColor3 = colors.Text
        tabButton.Font = Enum.Font.Gotham
        tabButton.TextSize = 14

        local page = Instance.new("ScrollingFrame", Pages)
        page.Size = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.ScrollBarThickness = 6
        page.Visible = false
        page.CanvasSize = UDim2.new(0, 0, 10, 0)

        local layout = Instance.new("UIListLayout", page)
        layout.Padding = UDim.new(0, 8)
        layout.SortOrder = Enum.SortOrder.LayoutOrder

        tabButton.MouseButton1Click:Connect(function()
            if CurrentTab then
                CurrentTab.Visible = false
            end
            page.Visible = true
            CurrentTab = page
        end)

        if not CurrentTab then
            page.Visible = true
            CurrentTab = page
        end

        local function addComponent(instance)
            instance.Parent = page
        end

        return {
            AddButton = function(text, callback)
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -10, 0, 30)
                btn.Text = text
                btn.BackgroundColor3 = colors.Button
                btn.TextColor3 = colors.Text
                btn.Font = Enum.Font.Gotham
                btn.TextSize = 14
                btn.MouseButton1Click:Connect(callback)
                addComponent(btn)
            end,

            AddToggle = function(text, callback)
                local toggle = Instance.new("TextButton")
                toggle.Size = UDim2.new(1, -10, 0, 30)
                toggle.Text = text .. ": OFF"
                toggle.BackgroundColor3 = colors.Button
                toggle.TextColor3 = colors.Text
                toggle.Font = Enum.Font.Gotham
                toggle.TextSize = 14

                local state = false
                toggle.MouseButton1Click:Connect(function()
                    state = not state
                    toggle.Text = text .. ": " .. (state and "ON" or "OFF")
                    callback(state)
                end)
                addComponent(toggle)
            end,

            AddTextBox = function(placeholder, callback)
                local box = Instance.new("TextBox")
                box.Size = UDim2.new(1, -10, 0, 30)
                box.PlaceholderText = placeholder
                box.Text = ""
                box.BackgroundColor3 = colors.Button
                box.TextColor3 = colors.Text
                box.Font = Enum.Font.Gotham
                box.TextSize = 14
                box.FocusLost:Connect(function()
                    callback(box.Text)
                end)
                addComponent(box)
            end,

            AddSlider = function(label, min, max, default, callback)
                local sliderFrame = Instance.new("Frame")
                sliderFrame.Size = UDim2.new(1, -10, 0, 40)
                sliderFrame.BackgroundTransparency = 1

                local slider = Instance.new("TextButton", sliderFrame)
                slider.Size = UDim2.new(1, 0, 0, 30)
                slider.BackgroundColor3 = colors.Button
                slider.TextColor3 = colors.Text
                slider.Font = Enum.Font.Gotham
                slider.TextSize = 14
                slider.Text = label .. ": " .. tostring(default)

                local value = default
                slider.MouseButton1Click:Connect(function()
                    value = (value + 1) > max and min or (value + 1)
                    slider.Text = label .. ": " .. tostring(value)
                    callback(value)
                end)
                addComponent(sliderFrame)
            end,

            AddDropdown = function(label, options, callback)
                local dropdown = Instance.new("TextButton")
                dropdown.Size = UDim2.new(1, -10, 0, 30)
                dropdown.BackgroundColor3 = colors.Button
                dropdown.TextColor3 = colors.Text
                dropdown.Font = Enum.Font.Gotham
                dropdown.TextSize = 14
                dropdown.Text = label

                local open = false
                dropdown.MouseButton1Click:Connect(function()
                    open = not open
                    for _, v in ipairs(Pages:GetChildren()) do
                        if v:IsA("TextButton") and v.Name == "DropdownOption" then
                            v:Destroy()
                        end
                    end
                    if open then
                        for _, option in ipairs(options) do
                            local opt = Instance.new("TextButton", page)
                            opt.Name = "DropdownOption"
                            opt.Text = "   ↳ " .. option
                            opt.Size = UDim2.new(1, -10, 0, 25)
                            opt.BackgroundColor3 = colors.Accent
                            opt.TextColor3 = colors.Text
                            opt.Font = Enum.Font.Gotham
                            opt.TextSize = 13
                            opt.MouseButton1Click:Connect(function()
                                dropdown.Text = label .. ": " .. option
                                callback(option)
                            end)
                        end
                    end
                end)

                addComponent(dropdown)
            end
        }
    end

    return NoxUI
end

return NoxUI
