-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Menu = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Bar = Instance.new("Folder")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local Topbar = Instance.new("Frame")
local Label = Instance.new("TextLabel")
local User = Instance.new("Frame")
local AvatarImage = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Subtitle = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Menu.Name = "Menu"
Menu.Parent = ScreenGui
Menu.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Menu.BorderColor3 = Color3.fromRGB(0, 0, 0)
Menu.BorderSizePixel = 0
Menu.Position = UDim2.new(0.396950394, 0, 0.102686875, 0)
Menu.Size = UDim2.new(0, 751, 0, 417)

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Menu

Bar.Name = "Bar"
Bar.Parent = Menu

Frame.Parent = Bar
Frame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 0.0933071673, 0)
Frame.Size = UDim2.new(0, 751, 0, 3)

TextButton.Parent = Bar
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.929085314, 0, 0, 0)
TextButton.Size = UDim2.new(0, 50, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

ImageLabel.Parent = TextButton
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.40000245, 0, 0.316803575, 0)
ImageLabel.Size = UDim2.new(0, 15, 0, 16)
ImageLabel.Image = "rbxassetid://10747384394"

Topbar.Name = "Topbar"
Topbar.Parent = Menu
Topbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topbar.BackgroundTransparency = 1.000
Topbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Topbar.BorderSizePixel = 0
Topbar.Size = UDim2.new(0, 179, 0, 41)

Label.Name = "Label"
Label.Parent = Topbar
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1.000
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0.147338867, 0, -0.024390243, 0)
Label.Size = UDim2.new(0, 264, 0, 50)
Label.Font = Enum.Font.GothamBold
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.TextSize = 14.000
Label.TextXAlignment = Enum.TextXAlignment.Left

User.Name = "User"
User.Parent = Menu
User.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
User.BackgroundTransparency = 1.000
User.BorderColor3 = Color3.fromRGB(27, 42, 53)
User.Position = UDim2.new(0, 0, 0, 49)
User.Size = UDim2.new(0, 356, 0, 90)

AvatarImage.Name = "AvatarImage"
AvatarImage.Parent = User
AvatarImage.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
AvatarImage.BackgroundTransparency = 0.800
AvatarImage.BorderColor3 = Color3.fromRGB(27, 42, 53)
AvatarImage.Position = UDim2.new(0.0561797693, 0, 0.216059744, 0)
AvatarImage.Size = UDim2.new(0, 50, 0, 50)
AvatarImage.Image = "rbxassetid://9333366626"

UICorner_2.CornerRadius = UDim.new(1, 0)
UICorner_2.Parent = AvatarImage

Title.Name = "Title"
Title.Parent = User
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
Title.Position = UDim2.new(0.229906753, 0, 0.312222302, 0)
Title.Size = UDim2.new(0, 225, 0, 20)
Title.Font = Enum.Font.GothamBlack
Title.Text = "DisplayName"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

Subtitle.Name = "Subtitle"
Subtitle.Parent = User
Subtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Subtitle.BackgroundTransparency = 1.000
Subtitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
Subtitle.Position = UDim2.new(0.229906753, 0, 0.531167924, 0)
Subtitle.Size = UDim2.new(0, 224, 0, 12)
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.Text = "username"
Subtitle.TextColor3 = Color3.fromRGB(240, 240, 240)
Subtitle.TextScaled = true
Subtitle.TextSize = 14.000
Subtitle.TextTransparency = 0.300
Subtitle.TextWrapped = true
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function MPEIXNJ_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local closeButton = script.Parent
	local menuFrame = closeButton.Parent.Parent -- TextButton is child of Bar, Bar is child of Menu
	
	-- Validate that we found the menu frame and it's what we expect
	if not menuFrame or not menuFrame:IsA("Frame") then
		warn("CloseButton script: Could not find the parent Menu Frame to close. Expected hierarchy: TextButton -> Folder (Bar) -> Frame (Menu). Found: " .. (menuFrame and menuFrame:GetFullName() or "nil"))
		return
	end
	
	closeButton.MouseButton1Click:Connect(function()
		menuFrame:Destroy()
	end)
	
	
end
coroutine.wrap(MPEIXNJ_fake_script)()
local function ODDKZ_fake_script() -- AvatarImage.LocalScript 
	local script = Instance.new('LocalScript', AvatarImage)

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	-- Get the ImageLabel
	local imageLabel = script.Parent:WaitForChild("AvatarImageLabel")
	
	-- Set default image in case loading fails
	imageLabel.Image = "rbxasset://textures/ui/ImagePlaceholder.png"
	
	-- Function to load and set avatar image
	local function setAvatarImage()
		local userId = player.UserId
		local thumbType = Enum.ThumbnailType.HeadShot
		local thumbSize = Enum.ThumbnailSize.Size420x420
	
		-- Try to get the thumbnail
		local success, content, isReady = pcall(function()
			return Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
		end)
	
		-- Set the image if successful
		if success and content and isReady then
			imageLabel.Image = content
		else
			warn("Failed to load avatar image for user", userId)
			-- Optionally set a fallback image
			imageLabel.Image = "rbxasset://textures/ui/ImagePlaceholder.png"
		end
	end
	
	-- Connect to player changes
	player:GetPropertyChangedSignal("UserId"):Connect(setAvatarImage)
	
	-- Initial load
	setAvatarImage()
end
coroutine.wrap(ODDKZ_fake_script)()
local function CXFU_fake_script() -- Title.LocalScript 
	local script = Instance.new('LocalScript', Title)

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	
	-- Player.Name (username) is available immediately upon the LocalPlayer object being instanced
	-- and does not change throughout the game session.
	
	local userName = LocalPlayer.Name
	
	local label = script.Parent -- The script is directly under the TextLabel
	if label:IsA("TextLabel") then
	    label.Text = userName
	else
	    warn("Script's parent is not a TextLabel. Username cannot be set.")
	end
	
	-- No need to listen for property changes for Player.Name as it is immutable.
	
	
end
coroutine.wrap(CXFU_fake_script)()
local function VHIBYC_fake_script() -- Subtitle.LocalScript 
	local script = Instance.new('LocalScript', Subtitle)

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	
	local displayName = LocalPlayer.DisplayName
	
	local label = script.Parent
	if label:IsA("TextLabel") then
	    label.Text = displayName
	else
	    warn("Script's parent is not a TextLabel. DisplayName cannot be set.")
	end
	
	LocalPlayer:GetPropertyChangedSignal("DisplayName"):Connect(function()
	    if label:IsA("TextLabel") then
	        label.Text = LocalPlayer.DisplayName
	    end
	end)
	
	
end
coroutine.wrap(VHIBYC_fake_script)()
local function TVATFO_fake_script() -- Menu.SmoothDrag 
	local script = Instance.new('LocalScript', Menu)

	-- Need help? Check me out on the devforum!
	-- Link: https://devforum.roblox.com/t/smooth-dragging-easily-drag-your-frames/2508276
	
	local Drag = script.Parent
	gsCoreGui = game:GetService("CoreGui")
	gsTween = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
		local dragging
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local dragTime = 0.04
			local SmoothDrag = {}
			SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
			dragSmoothFunction:Play()
		end
		Drag.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = Drag.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		Drag.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging and Drag.Size then
				update(input)
			end
		end)
	
end
coroutine.wrap(TVATFO_fake_script)()
local function ZCHPKUV_fake_script() -- ScreenGui.LocalScript 
	local script = Instance.new('LocalScript', ScreenGui)

	local player = game.Players.LocalPlayer
	local scriptName = "a"
	
	if not scriptName or scriptName:match("^%s*$") then
		scriptName = "Unnamed Script"
	end
	
	local menu = script.Parent:WaitForChild("Menu")
	local topbar = menu:WaitForChild("Topbar")
	local label = topbar:WaitForChild("Label")
	
	label.Text = scriptName
	
	
	
	
end
coroutine.wrap(ZCHPKUV_fake_script)()
