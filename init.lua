local ScreenGui = Instance.new("ScreenGui")
local Menu = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIScale = Instance.new("UIScale")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local UIGradient = Instance.new("UIGradient")
local Bar = Instance.new("Folder")
local Divider = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local Text = Instance.new("Folder")
local Topbar = Instance.new("Frame")
local Label = Instance.new("TextLabel")
local Tabs = Instance.new("Folder")
local Page = Instance.new("Folder")
local Home = Instance.new("Frame")
local Avatar = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local Subtitle = Instance.new("TextLabel")
local Title = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Menu.Name = "Menu"
Menu.Parent = ScreenGui
Menu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
Menu.BorderSizePixel = 0
Menu.Position = UDim2.new(0.252083331, 0, 0.266575754, 0)
Menu.Size = UDim2.new(0, 751, 0, 417)

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Menu

UIScale.Parent = Menu

UIAspectRatioConstraint.Parent = Menu
UIAspectRatioConstraint.AspectRatio = 1.750

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(236, 236, 236)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(216, 216, 216))}
UIGradient.Parent = Menu

Bar.Name = "Bar"
Bar.Parent = Menu

Divider.Name = "Divider"
Divider.Parent = Bar
Divider.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0, 0, 0.098321341, 0)
Divider.Size = UDim2.new(0, 729, 0, 2)

TextButton.Parent = Bar
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.929085314, 0, 0, 0)
TextButton.Size = UDim2.new(0, 50, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

ImageLabel.Parent = TextButton
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.340002447, 0, 0.336803585, 0)
ImageLabel.Size = UDim2.new(0, 15, 0, 16)
ImageLabel.Image = "rbxassetid://10747384394"

Text.Name = "Text"
Text.Parent = Menu

Topbar.Name = "Topbar"
Topbar.Parent = Menu
Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topbar.BackgroundTransparency = 1.000
Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Topbar.BorderSizePixel = 0
Topbar.Size = UDim2.new(0, 179, 0, 41)

Label.Name = "Label"
Label.Parent = Topbar
Label.BackgroundColor3 = Color3.fromRGB(226, 226, 226)
Label.BackgroundTransparency = 1.000
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0.100558661, 0, -0.024390243, 0)
Label.Size = UDim2.new(0, 344, 0, 50)
Label.Font = Enum.Font.GothamBold
Label.TextColor3 = Color3.fromRGB(226, 226, 226)
Label.TextSize = 14.000
Label.TextXAlignment = Enum.TextXAlignment.Left

Tabs.Name = "Tabs"
Tabs.Parent = Menu

Page.Name = "Page"
Page.Parent = Tabs

Home.Name = "Home"
Home.Parent = Page
Home.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home.BackgroundTransparency = 1.000
Home.BorderColor3 = Color3.fromRGB(0, 0, 0)
Home.BorderSizePixel = 0
Home.Position = UDim2.new(0, 0, 0.117505923, 0)
Home.Size = UDim2.new(0, 729, 0, 367)

Avatar.Name = "Avatar"
Avatar.Parent = Home
Avatar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
Avatar.BackgroundTransparency = 0.800
Avatar.BorderColor3 = Color3.fromRGB(27, 42, 53)
Avatar.Position = UDim2.new(0.0356247723, 0, 0.0415719263, 0)
Avatar.Size = UDim2.new(0, 50, 0, 50)
Avatar.Image = "rbxassetid://9333366626"

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = Avatar

Subtitle.Name = "Subtitle"
Subtitle.Parent = Home
Subtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Subtitle.BackgroundTransparency = 1.000
Subtitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
Subtitle.Position = UDim2.new(0.12850219, 0, 0.122961313, 0)
Subtitle.Size = UDim2.new(0, 224, 0, 12)
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.Text = "username"
Subtitle.TextColor3 = Color3.fromRGB(240, 240, 240)
Subtitle.TextScaled = true
Subtitle.TextSize = 14.000
Subtitle.TextTransparency = 0.300
Subtitle.TextWrapped = true
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

Title.Name = "Title"
Title.Parent = Home
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
Title.Position = UDim2.new(0.127131879, 0, 0.0561995767, 0)
Title.Size = UDim2.new(0, 225, 0, 20)
Title.Font = Enum.Font.GothamBlack
Title.Text = "DisplayName"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function SQLSZV_fake_script() -- Avatar.LocalScript 
	local script = Instance.new('LocalScript', Avatar)

	local player = game.Players.LocalPlayer
	local imageLabel = script.Parent
	
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	
	local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
	
	imageLabel.Image = content
	
end
coroutine.wrap(SQLSZV_fake_script)()
local function RERNPU_fake_script() -- Subtitle.LocalScript 
	local script = Instance.new('LocalScript', Subtitle)

	local player = game.Players.LocalPlayer
	local label = script.Parent
	
	label.Text = player.Name
	
end
coroutine.wrap(RERNPU_fake_script)()
local function PRBPFXI_fake_script() -- Title.LocalScript 
	local script = Instance.new('LocalScript', Title)

	
	local player = game.Players.LocalPlayer
	local label = script.Parent
	
	label.Text = "Welcome "..player.DisplayName.."!"
	
end
coroutine.wrap(PRBPFXI_fake_script)()
local function WMDHFE_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)


	
	if ScriptName == nil or ScriptName:match("^%s*$") then
		ScriptName = "Unnamed Script"
	end
	
	local player = game.Players.LocalPlayer
	local gui = player:WaitForChild("PlayerGui"):WaitForChild("ScreenGui")
	local topbar = gui:WaitForChild("Menu"):WaitForChild("Topbar")
	local label = topbar:WaitForChild("Label")
	
	label.Text = ScriptName
	
end
coroutine.wrap(WMDHFE_fake_script)()
