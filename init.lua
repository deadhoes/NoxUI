local Library = {}

function Library:Window(name)
    local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.Name = name

    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.Name = "MainFrame"

    local WindowFunctions = {}

    function WindowFunctions:Tab(tabName)
        local tabFrame = Instance.new("Frame", mainFrame)
        tabFrame.Size = UDim2.new(1, 0, 1, 0)
        tabFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        tabFrame.Name = tabName

        local TabFunctions = {}

        function TabFunctions:Section(sectionName)
            local sectionLabel = Instance.new("TextLabel", tabFrame)
            sectionLabel.Size = UDim2.new(1, 0, 0, 30)
            sectionLabel.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            sectionLabel.Text = sectionName
            sectionLabel.TextColor3 = Color3.new(1, 1, 1)
            sectionLabel.Font = Enum.Font.SourceSans
            sectionLabel.TextSize = 20
            sectionLabel.Name = "SectionLabel"

            local SectionFunctions = {}

            function SectionFunctions:Button(text, callback)
                local button = Instance.new("TextButton", tabFrame)
                button.Size = UDim2.new(0, 200, 0, 40)
                button.Position = UDim2.new(0, 100, 0, 40)
                button.Text = text
                button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                button.TextColor3 = Color3.new(1, 1, 1)
                button.Font = Enum.Font.SourceSans
                button.TextSize = 18
                button.MouseButton1Click:Connect(function()
                    callback()
                end)
            end

            return SectionFunctions
        end

        return TabFunctions
    end

    return WindowFunctions
end

-- ÖRNEK KULLANIM:
local myWindow = Library:Window("MyCustomUI")
local tab1 = myWindow:Tab("MainTab")
local section1 = tab1:Section("MainSection")
section1:Button("Click Me!", function()
    print("You clicked the button!")
end)
