-- NoxUI Initialization Code

local NoxUI = {}  -- Initialize NoxUI table

-- Theme (Customize colors here)
local theme = {
    Background = Color3.fromRGB(30, 30, 30),
    Accent = Color3.fromRGB(75, 75, 75),
    Button = Color3.fromRGB(255, 100, 100),
    Text = Color3.fromRGB(255, 255, 255)
}

-- Function to create the main UI window
function NoxUI:CreateWindow(options)
    -- Create the main ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = options.Title or "NoxUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    -- Create the main frame for the window
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 300) -- Default size
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150) -- Centered on screen
    mainFrame.BackgroundColor3 = theme.Background
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    -- Add a title to the window
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundColor3 = theme.Accent
    title.Text = options.Title or "NoxUI Window"
    title.TextColor3 = theme.Text
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Center
    title.Parent = mainFrame

    -- Add a close button
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 50, 0, 25)
    closeButton.Position = UDim2.new(1, -60, 0, 5)
    closeButton.Text = "Close"
    closeButton.BackgroundColor3 = theme.Button
    closeButton.TextColor3 = theme.Text
    closeButton.Font = Enum.Font.Gotham
    closeButton.TextSize = 14
    closeButton.Parent = mainFrame

    -- Close the window when the button is clicked
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Add a version label if needed
    if options.Version then
        local versionLabel = Instance.new("TextLabel")
        versionLabel.Text = "Version: " .. options.Version
        versionLabel.Size = UDim2.new(0, 150, 0, 20)
        versionLabel.Position = UDim2.new(1, -160, 1, -30)
        versionLabel.BackgroundTransparency = 1
        versionLabel.TextColor3 = theme.Text
        versionLabel.Font = Enum.Font.Gotham
        versionLabel.TextSize = 12
        versionLabel.Parent = mainFrame
    end

    -- Return the ScreenGui and mainFrame for further customization
    return {ScreenGui = screenGui, MainFrame = mainFrame}
end

-- Example of usage
local ui = NoxUI:CreateWindow({Title = "My UI Window", Version = "1.0"})

-- Add Divider (Example)
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, 0, 0, 2)
divider.Position = UDim2.new(0, 0, 0, 40)
divider.BackgroundColor3 = theme.Accent
divider.Parent = ui.MainFrame

-- Add Selection Title (Example)
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 150, 0, 25)
titleLabel.Position = UDim2.new(0, 10, 0, 50)
titleLabel.Text = "Settings"
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = theme.Text
titleLabel.Font = Enum.Font.Gotham
titleLabel.TextSize = 14
titleLabel.Parent = ui.MainFrame

-- Add a Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 200, 0, 30)
toggleButton.Position = UDim2.new(0, 10, 0, 100)
toggleButton.Text = "Enable Feature"
toggleButton.BackgroundColor3 = theme.Button
toggleButton.TextColor3 = theme.Text
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextSize = 14
toggleButton.Parent = ui.MainFrame

toggleButton.MouseButton1Click:Connect(function()
    print("Feature toggled")
end)

-- Add a Slider (Example)
local slider = Instance.new("TextButton")
slider.Size = UDim2.new(0, 200, 0, 30)
slider.Position = UDim2.new(0, 10, 0, 150)
slider.Text = "Volume: 50"
slider.BackgroundColor3 = theme.Button
slider.TextColor3 = theme.Text
slider.Font = Enum.Font.Gotham
slider.TextSize = 14
slider.Parent = ui.MainFrame

slider.MouseButton1Click:Connect(function()
    local value = math.random(0, 100)
    slider.Text = "Volume: " .. value
    print("Volume set to:", value)
end)

-- Add a Dropdown (Example)
local dropdownLabel = Instance.new("TextLabel")
dropdownLabel.Size = UDim2.new(0, 200, 0, 25)
dropdownLabel.Position = UDim2.new(0, 10, 0, 200)
dropdownLabel.Text = "Select Option"
dropdownLabel.BackgroundTransparency = 1
dropdownLabel.TextColor3 = theme.Text
dropdownLabel.Font = Enum.Font.Gotham
dropdownLabel.TextSize = 14
dropdownLabel.Parent = ui.MainFrame

local dropdown = Instance.new("TextButton")
dropdown.Size = UDim2.new(0, 200, 0, 30)
dropdown.Position = UDim2.new(0, 10, 0, 230)
dropdown.Text = "Choose"
dropdown.BackgroundColor3 = theme.Button
dropdown.TextColor3 = theme.Text
dropdown.Font = Enum.Font.Gotham
dropdown.TextSize = 14
dropdown.Parent = ui.MainFrame

local dropdownMenu = Instance.new("Frame")
dropdownMenu.Size = UDim2.new(0, 200, 0, 100)
dropdownMenu.Position = UDim2.new(0, 10, 0, 260)
dropdownMenu.BackgroundColor3 = theme.Background
dropdownMenu.Visible = false
dropdownMenu.Parent = ui.MainFrame

-- Add options to dropdown menu
local option1 = Instance.new("TextButton")
option1.Size = UDim2.new(0, 200, 0, 30)
option1.Position = UDim2.new(0, 0, 0, 0)
option1.Text = "Option 1"
option1.BackgroundColor3 = theme.Button
option1.TextColor3 = theme.Text
option1.Font = Enum.Font.Gotham
option1.TextSize = 14
option1.Parent = dropdownMenu

local option2 = Instance.new("TextButton")
option2.Size = UDim2.new(0, 200, 0, 30)
option2.Position = UDim2.new(0, 0, 0, 35)
option2.Text = "Option 2"
option2.BackgroundColor3 = theme.Button
option2.TextColor3 = theme.Text
option2.Font = Enum.Font.Gotham
option2.TextSize = 14
option2.Parent = dropdownMenu

local option3 = Instance.new("TextButton")
option3.Size = UDim2.new(0, 200, 0, 30)
option3.Position = UDim2.new(0, 0, 0, 70)
option3.Text = "Option 3"
option3.BackgroundColor3 = theme.Button
option3.TextColor3 = theme.Text
option3.Font = Enum.Font.Gotham
option3.TextSize = 14
option3.Parent = dropdownMenu

-- Show or hide the dropdown menu when the dropdown button is clicked
dropdown.MouseButton1Click:Connect(function()
    dropdownMenu.Visible = not dropdownMenu.Visible
end)

-- When an option is selected, close the dropdown and display the selected option
option1.MouseButton1Click:Connect(function()
    dropdown.Text = "Option 1"
    dropdownMenu.Visible = false
end)

option2.MouseButton1Click:Connect(function()
    dropdown.Text = "Option 2"
    dropdownMenu.Visible = false
end)

option3.MouseButton1Click:Connect(function()
    dropdown.Text = "Option 3"
    dropdownMenu.Visible = false
end)

-- Add a progress bar (Example)
local progressLabel = Instance.new("TextLabel")
progressLabel.Size = UDim2.new(0, 200, 0, 25)
progressLabel.Position = UDim2.new(0, 10, 0, 320)
progressLabel.Text = "Loading..."
progressLabel.BackgroundTransparency = 1
progressLabel.TextColor3 = theme.Text
progressLabel.Font = Enum.Font.Gotham
progressLabel.TextSize = 14
progressLabel.Parent = ui.MainFrame

local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 200, 0, 20)
progressBar.Position = UDim2.new(0, 10, 0, 350)
progressBar.BackgroundColor3 = theme.Accent
progressBar.Parent = ui.MainFrame

local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = theme.Button
progressFill.Parent = progressBar

-- Simulate loading progress
local function simulateLoading()
    for i = 0, 100 do
        progressFill.Size = UDim2.new(i / 100, 0, 1, 0)
        wait(0.05)
    end
    progressLabel.Text = "Loaded"
end

simulateLoading()

-- Add a text input field (Example)
local textInputLabel = Instance.new("TextLabel")
textInputLabel.Size = UDim2.new(0, 200, 0, 25)
textInputLabel.Position = UDim2.new(0, 10, 0, 380)
textInputLabel.Text = "Enter your name:"
textInputLabel.BackgroundTransparency = 1
textInputLabel.TextColor3 = theme.Text
textInputLabel.Font = Enum.Font.Gotham
textInputLabel.TextSize = 14
textInputLabel.Parent = ui.MainFrame

local textInput = Instance.new("TextBox")
textInput.Size = UDim2.new(0, 200, 0, 30)
textInput.Position = UDim2.new(0, 10, 0, 410)
textInput.Text = ""
textInput.BackgroundColor3 = theme.Button
textInput.TextColor3 = theme.Text
textInput.Font = Enum.Font.Gotham
textInput.TextSize = 14
textInput.PlaceholderText = "Type here..."
textInput.Parent = ui.MainFrame

-- When text input is changed, print the value
textInput.Changed:Connect(function()
    print("Text entered: " .. textInput.Text)
end)
