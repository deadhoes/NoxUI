local MyUILib = {}

-- Tema (tema renkleri)
MyUILib.Theme = {
    Background = Color3.fromRGB(30,30,30),
    Accent = Color3.fromRGB(0,170,255),
    TextColor = Color3.fromRGB(255,255,255),
    ToggleOn = Color3.fromRGB(0,200,120),
    ToggleOff = Color3.fromRGB(150,150,150),
}

-- Ana pencere oluşturma
function MyUILib:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MyUILibGui"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 600, 0, 400)
    Frame.Position = UDim2.new(0.5, -300, 0.5, -200)
    Frame.BackgroundColor3 = self.Theme.Background
    Frame.Parent = ScreenGui
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.ClipsDescendants = true

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Text = title or "My UI"
    TitleLabel.Size = UDim2.new(1, 0, 0, 50)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = self.Theme.TextColor
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 24
    TitleLabel.Parent = Frame

    -- Buraya tab sistemi, sectionlar, buttonlar eklenecek
    
    -- Basit tab sistemi için:
    local tabs = {}
    local function createTab(tabName)
        local tabButton = Instance.new("TextButton")
        tabButton.Text = tabName
        tabButton.Size = UDim2.new(0, 100, 0, 40)
        tabButton.Position = UDim2.new(#tabs * 0.16, 0, 0, 50)
        tabButton.BackgroundColor3 = self.Theme.Accent
        tabButton.TextColor3 = Color3.new(1,1,1)
        tabButton.Parent = Frame

        local tabContent = Instance.new("Frame")
        tabContent.Size = UDim2.new(1, -20, 1, -110)
        tabContent.Position = UDim2.new(0, 10, 0, 90)
        tabContent.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        tabContent.Visible = false
        tabContent.Parent = Frame

        tabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(tabs) do
                v.content.Visible = false
                v.button.BackgroundColor3 = self.Theme.Accent
            end
            tabContent.Visible = true
            tabButton.BackgroundColor3 = Color3.fromRGB(0,120,200)
        end)

        table.insert(tabs, {button = tabButton, content = tabContent})

        return tabContent
    end

    -- Kullanıcıya kolaylık için
    Frame.CreateTab = createTab

    return Frame
end

return MyUILib
