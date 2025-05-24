-- Gui to Lua
-- Version: 3.2

-- Instances:

local PrismUI = Instance.new("ScreenGui")
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
local shadowHolder = Instance.new("Frame")
local umbraShadow = Instance.new("ImageLabel")
local penumbraShadow = Instance.new("ImageLabel")
local ambientShadow = Instance.new("ImageLabel")
local shadowHolder_2 = Instance.new("Frame")
local umbraShadow_2 = Instance.new("ImageLabel")
local penumbraShadow_2 = Instance.new("ImageLabel")
local ambientShadow_2 = Instance.new("ImageLabel")
local shadowHolder_3 = Instance.new("Frame")
local umbraShadow_3 = Instance.new("ImageLabel")
local penumbraShadow_3 = Instance.new("ImageLabel")
local ambientShadow_3 = Instance.new("ImageLabel")
local Serverhop = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local Interact = Instance.new("TextButton")
local Title_2 = Instance.new("TextLabel")
local Rejoin = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local Interact_2 = Instance.new("TextButton")
local Title_3 = Instance.new("TextLabel")

--Properties:

PrismUI.Name = "PrismUI"
PrismUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PrismUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Menu.Name = "Menu"
Menu.Parent = PrismUI
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

shadowHolder.Name = "shadowHolder"
shadowHolder.Parent = Menu
shadowHolder.BackgroundTransparency = 1.000
shadowHolder.Size = UDim2.new(1, 0, 1, 0)
shadowHolder.ZIndex = 0

umbraShadow.Name = "umbraShadow"
umbraShadow.Parent = shadowHolder
umbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
umbraShadow.BackgroundTransparency = 1.000
umbraShadow.Position = UDim2.new(0.5, 0, 0.5, 2)
umbraShadow.Size = UDim2.new(1, 4, 1, 4)
umbraShadow.ZIndex = 0
umbraShadow.Image = "rbxassetid://1316045217"
umbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
umbraShadow.ImageTransparency = 0.860
umbraShadow.ScaleType = Enum.ScaleType.Slice
umbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

penumbraShadow.Name = "penumbraShadow"
penumbraShadow.Parent = shadowHolder
penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
penumbraShadow.BackgroundTransparency = 1.000
penumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 2)
penumbraShadow.Size = UDim2.new(1, 4, 1, 4)
penumbraShadow.ZIndex = 0
penumbraShadow.Image = "rbxassetid://1316045217"
penumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
penumbraShadow.ImageTransparency = 0.880
penumbraShadow.ScaleType = Enum.ScaleType.Slice
penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

ambientShadow.Name = "ambientShadow"
ambientShadow.Parent = shadowHolder
ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
ambientShadow.BackgroundTransparency = 1.000
ambientShadow.Position = UDim2.new(0.5, 0, 0.5, 2)
ambientShadow.Size = UDim2.new(1, 4, 1, 4)
ambientShadow.ZIndex = 0
ambientShadow.Image = "rbxassetid://1316045217"
ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
ambientShadow.ImageTransparency = 0.880
ambientShadow.ScaleType = Enum.ScaleType.Slice
ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

shadowHolder_2.Name = "shadowHolder"
shadowHolder_2.Parent = Menu
shadowHolder_2.BackgroundTransparency = 1.000
shadowHolder_2.Size = UDim2.new(1, 0, 1, 0)
shadowHolder_2.ZIndex = 0

umbraShadow_2.Name = "umbraShadow"
umbraShadow_2.Parent = shadowHolder_2
umbraShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
umbraShadow_2.BackgroundTransparency = 1.000
umbraShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
umbraShadow_2.Size = UDim2.new(1, 2, 1, 2)
umbraShadow_2.ZIndex = 0
umbraShadow_2.Image = "rbxassetid://1316045217"
umbraShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
umbraShadow_2.ImageTransparency = 0.860
umbraShadow_2.ScaleType = Enum.ScaleType.Slice
umbraShadow_2.SliceCenter = Rect.new(10, 10, 118, 118)

penumbraShadow_2.Name = "penumbraShadow"
penumbraShadow_2.Parent = shadowHolder_2
penumbraShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
penumbraShadow_2.BackgroundTransparency = 1.000
penumbraShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
penumbraShadow_2.Size = UDim2.new(1, 2, 1, 2)
penumbraShadow_2.ZIndex = 0
penumbraShadow_2.Image = "rbxassetid://1316045217"
penumbraShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
penumbraShadow_2.ImageTransparency = 0.880
penumbraShadow_2.ScaleType = Enum.ScaleType.Slice
penumbraShadow_2.SliceCenter = Rect.new(10, 10, 118, 118)

ambientShadow_2.Name = "ambientShadow"
ambientShadow_2.Parent = shadowHolder_2
ambientShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
ambientShadow_2.BackgroundTransparency = 1.000
ambientShadow_2.Position = UDim2.new(0.5, 0, 0.5, 0)
ambientShadow_2.Size = UDim2.new(1, 2, 1, 2)
ambientShadow_2.ZIndex = 0
ambientShadow_2.Image = "rbxassetid://1316045217"
ambientShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
ambientShadow_2.ImageTransparency = 0.880
ambientShadow_2.ScaleType = Enum.ScaleType.Slice
ambientShadow_2.SliceCenter = Rect.new(10, 10, 118, 118)

shadowHolder_3.Name = "shadowHolder"
shadowHolder_3.Parent = Menu
shadowHolder_3.BackgroundTransparency = 1.000
shadowHolder_3.Size = UDim2.new(1, 0, 1, 0)
shadowHolder_3.ZIndex = 0

umbraShadow_3.Name = "umbraShadow"
umbraShadow_3.Parent = shadowHolder_3
umbraShadow_3.AnchorPoint = Vector2.new(0.5, 0.5)
umbraShadow_3.BackgroundTransparency = 1.000
umbraShadow_3.Position = UDim2.new(0.5, 0, 0.5, 0)
umbraShadow_3.Size = UDim2.new(1, 2, 1, 2)
umbraShadow_3.ZIndex = 0
umbraShadow_3.Image = "rbxassetid://1316045217"
umbraShadow_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
umbraShadow_3.ImageTransparency = 0.860
umbraShadow_3.ScaleType = Enum.ScaleType.Slice
umbraShadow_3.SliceCenter = Rect.new(10, 10, 118, 118)

penumbraShadow_3.Name = "penumbraShadow"
penumbraShadow_3.Parent = shadowHolder_3
penumbraShadow_3.AnchorPoint = Vector2.new(0.5, 0.5)
penumbraShadow_3.BackgroundTransparency = 1.000
penumbraShadow_3.Position = UDim2.new(0.5, 0, 0.5, 0)
penumbraShadow_3.Size = UDim2.new(1, 2, 1, 2)
penumbraShadow_3.ZIndex = 0
penumbraShadow_3.Image = "rbxassetid://1316045217"
penumbraShadow_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
penumbraShadow_3.ImageTransparency = 0.880
penumbraShadow_3.ScaleType = Enum.ScaleType.Slice
penumbraShadow_3.SliceCenter = Rect.new(10, 10, 118, 118)

ambientShadow_3.Name = "ambientShadow"
ambientShadow_3.Parent = shadowHolder_3
ambientShadow_3.AnchorPoint = Vector2.new(0.5, 0.5)
ambientShadow_3.BackgroundTransparency = 1.000
ambientShadow_3.Position = UDim2.new(0.501331568, 0, 0.497601926, 0)
ambientShadow_3.Size = UDim2.new(1, 2, 1, 2)
ambientShadow_3.ZIndex = 0
ambientShadow_3.Image = "rbxassetid://1316045217"
ambientShadow_3.ImageColor3 = Color3.fromRGB(0, 0, 0)
ambientShadow_3.ImageTransparency = 0.880
ambientShadow_3.ScaleType = Enum.ScaleType.Slice
ambientShadow_3.SliceCenter = Rect.new(10, 10, 118, 118)

Serverhop.Name = "Serverhop"
Serverhop.Parent = Menu
Serverhop.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Serverhop.BorderColor3 = Color3.fromRGB(27, 42, 53)
Serverhop.BorderSizePixel = 0
Serverhop.Position = UDim2.new(0.0337913707, 0, 0.318345338, 0)
Serverhop.Size = UDim2.new(0, 118, 0, 35)

UICorner_3.CornerRadius = UDim.new(0, 7)
UICorner_3.Parent = Serverhop

Interact.Name = "Interact"
Interact.Parent = Serverhop
Interact.AnchorPoint = Vector2.new(0.5, 0.5)
Interact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Interact.BackgroundTransparency = 1.000
Interact.BorderColor3 = Color3.fromRGB(27, 42, 53)
Interact.BorderSizePixel = 0
Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
Interact.Size = UDim2.new(1, 0, 1, 0)
Interact.ZIndex = 10
Interact.Font = Enum.Font.SourceSans
Interact.TextColor3 = Color3.fromRGB(0, 0, 0)
Interact.TextSize = 14.000
Interact.TextTransparency = 1.000

Title_2.Name = "Title"
Title_2.Parent = Serverhop
Title_2.AnchorPoint = Vector2.new(0.5, 0.5)
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Title_2.Size = UDim2.new(0.899999976, 0, 0, 14)
Title_2.ZIndex = 9
Title_2.Font = Enum.Font.GothamMedium
Title_2.Text = "Serverhop"
Title_2.TextColor3 = Color3.fromRGB(240, 240, 240)
Title_2.TextScaled = true
Title_2.TextSize = 14.000
Title_2.TextTransparency = 0.500
Title_2.TextWrapped = true

Rejoin.Name = "Rejoin"
Rejoin.Parent = Menu
Rejoin.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Rejoin.BorderColor3 = Color3.fromRGB(27, 42, 53)
Rejoin.BorderSizePixel = 0
Rejoin.Position = UDim2.new(0.21879372, 0, 0.318345338, 0)
Rejoin.Size = UDim2.new(0, 84, 0, 35)

UICorner_4.CornerRadius = UDim.new(0, 7)
UICorner_4.Parent = Rejoin

Interact_2.Name = "Interact"
Interact_2.Parent = Rejoin
Interact_2.AnchorPoint = Vector2.new(0.5, 0.5)
Interact_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Interact_2.BackgroundTransparency = 1.000
Interact_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Interact_2.BorderSizePixel = 0
Interact_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Interact_2.Size = UDim2.new(1, 0, 1, 0)
Interact_2.ZIndex = 10
Interact_2.Font = Enum.Font.SourceSans
Interact_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Interact_2.TextSize = 14.000
Interact_2.TextTransparency = 1.000

Title_3.Name = "Title"
Title_3.Parent = Rejoin
Title_3.AnchorPoint = Vector2.new(0.5, 0.5)
Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_3.BackgroundTransparency = 1.000
Title_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(0.523809671, 0, 0.5, 0)
Title_3.Size = UDim2.new(0.899999976, 0, 0, 14)
Title_3.ZIndex = 9
Title_3.Font = Enum.Font.GothamMedium
Title_3.Text = "Rejoin"
Title_3.TextColor3 = Color3.fromRGB(240, 240, 240)
Title_3.TextScaled = true
Title_3.TextSize = 14.000
Title_3.TextTransparency = 0.500
Title_3.TextWrapped = true

-- Scripts:

local function JLTO_fake_script() -- TextButton.LocalScript 
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
coroutine.wrap(JLTO_fake_script)()
local function NUNMYKJ_fake_script() -- AvatarImage.LocalScript 
	local script = Instance.new('LocalScript', AvatarImage)

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	local PLACEHOLDER_IMAGE = "rbxasset://textures/ui/ImagePlaceholder.png" -- Replace with your placeholder image
	
	local imageLabel = script.Parent
	
	-- fetch the thumbnail
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	
	local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
	
	imageLabel.Image = (isReady and content) or PLACEHOLDER_IMAGE
	
end
coroutine.wrap(NUNMYKJ_fake_script)()
local function SVNSG_fake_script() -- Title.LocalScript 
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
coroutine.wrap(SVNSG_fake_script)()
local function XHQS_fake_script() -- Subtitle.LocalScript 
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
coroutine.wrap(XHQS_fake_script)()
local function WSUN_fake_script() -- Menu.SmoothDrag 
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
coroutine.wrap(WSUN_fake_script)()
local function ZPTKACD_fake_script() -- Serverhop.LocalScript 
	local script = Instance.new('LocalScript', Serverhop)

	-- Bu LocalScript, TextButton içinde olmalı
	local button = script.Parent
	local tweenService = game:GetService("TweenService")
	local info = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	local normalColor = Color3.fromRGB(35, 35, 35)
	local hoverColor = Color3.fromRGB(93, 93, 93)
	button.BackgroundColor3 = normalColor
	
	button.MouseEnter:Connect(function()
		local tween = tweenService:Create(button, info, {BackgroundColor3 = hoverColor})
		tween:Play()
	end)
	
	button.MouseLeave:Connect(function()
		local tween = tweenService:Create(button, info, {BackgroundColor3 = normalColor})
		tween:Play()
	end)
	
	-- Bu LocalScript, Frame içinde olmalı
	local frame = script.Parent
	local tweenService = game:GetService("TweenService")
	local clickInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	-- Tıklanabilirlik ayarı
	frame.Active = true
	frame.Selectable = true
	
	-- Orijinal boyutu yedekle
	local originalSize = frame.Size
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			-- Biraz büyüt
			local growTween = tweenService:Create(frame, clickInfo, {Size = originalSize + UDim2.new(0, 5, 0, 5)})
			growTween:Play()
			growTween.Completed:Wait()
			-- Tekrar küçült (orijinal boyuta dön)
			local shrinkTween = tweenService:Create(frame, clickInfo, {Size = originalSize})
			shrinkTween:Play()
		end
	end)
	-- Bu LocalScript, Frame içinde olmalı
	local frame = script.Parent
	local tweenService = game:GetService("TweenService")
	local clickInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	-- Tıklanabilirlik ayarı
	frame.Active = true
	frame.Selectable = true
	
	-- Orijinal boyutu yedekle
	local originalSize = frame.Size
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			-- Biraz büyüt
			local growTween = tweenService:Create(frame, clickInfo, {Size = originalSize + UDim2.new(0, 5, 0, 5)})
			growTween:Play()
			growTween.Completed:Wait()
			-- Tekrar küçült (orijinal boyuta dön)
			local shrinkTween = tweenService:Create(frame, clickInfo, {Size = originalSize})
			shrinkTween:Play()
		end
	end)
	
	
end
coroutine.wrap(ZPTKACD_fake_script)()
local function DAKQDH_fake_script() -- Rejoin.LocalScript 
	local script = Instance.new('LocalScript', Rejoin)

	-- Bu LocalScript, TextButton içinde olmalı
	local button = script.Parent
	local tweenService = game:GetService("TweenService")
	local info = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	local normalColor = Color3.fromRGB(35, 35, 35)
	local hoverColor = Color3.fromRGB(93, 93, 93)
	button.BackgroundColor3 = normalColor
	
	button.MouseEnter:Connect(function()
		local tween = tweenService:Create(button, info, {BackgroundColor3 = hoverColor})
		tween:Play()
	end)
	
	button.MouseLeave:Connect(function()
		local tween = tweenService:Create(button, info, {BackgroundColor3 = normalColor})
		tween:Play()
	end)
	
	-- Bu LocalScript, Frame içinde olmalı
	local frame = script.Parent
	local tweenService = game:GetService("TweenService")
	local clickInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	
	-- Tıklanabilirlik ayarı
	frame.Active = true
	frame.Selectable = true
	
	-- Orijinal boyutu yedekle
	local originalSize = frame.Size
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			-- Biraz büyüt
			local growTween = tweenService:Create(frame, clickInfo, {Size = originalSize + UDim2.new(0, 5, 0, 5)})
			growTween:Play()
			growTween.Completed:Wait()
			-- Tekrar küçült (orijinal boyuta dön)
			local shrinkTween = tweenService:Create(frame, clickInfo, {Size = originalSize})
			shrinkTween:Play()
		end
	end)
	
end
coroutine.wrap(DAKQDH_fake_script)()
local function UWMUX_fake_script() -- PrismUI.LocalScript 
	local script = Instance.new('LocalScript', PrismUI)

	local player = game.Players.LocalPlayer
	local scriptName = "Noctalis Test GUI"
	
	if not scriptName or scriptName:match("^%s*$") then
		scriptName = "Unnamed Script"
	end
	
	local menu = script.Parent:WaitForChild("Menu")
	local topbar = menu:WaitForChild("Topbar")
	local label = topbar:WaitForChild("Label")
	
	label.Text = scriptName
	
	
	
	
end
coroutine.wrap(UWMUX_fake_script)()
