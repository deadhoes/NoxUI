-- Script Hub Framework
local ScriptHub = {}

-- Table to store all scripts
ScriptHub.Scripts = {}

-- UI Elements
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TemplateButton = Instance.new("TextButton")

-- Initialize the UI
function ScriptHub:InitUI()
    ScreenGui.Name = "ScriptHub"
    ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    
    -- Main frame setup
    Frame.Size = UDim2.new(0, 300, 0, 400)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Frame.Parent = ScreenGui
    
    -- Scrolling frame for scripts list
    ScrollingFrame.Size = UDim2.new(1, -10, 1, -10)
    ScrollingFrame.Position = UDim2.new(0, 5, 0, 5)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.Parent = Frame
    
    -- List layout
    UIListLayout.Parent = ScrollingFrame
    UIListLayout.Padding = UDim.new(0, 5)
    
    -- Template button (hidden by default)
    TemplateButton.Size = UDim2.new(1, 0, 0, 30)
    TemplateButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    TemplateButton.Text = "Script"
    TemplateButton.Visible = false
    TemplateButton.Parent = ScrollingFrame
end

-- Add a script to the hub
function ScriptHub:AddScript(name, func)
    local newButton = TemplateButton:Clone()
    newButton.Name = name
    newButton.Text = name
    newButton.Visible = true
    
    newButton.MouseButton1Click:Connect(function()
        func()
    end)
    
    newButton.Parent = ScrollingFrame
    self.Scripts[name] = func
end

-- Remove a script from the hub
function ScriptHub:RemoveScript(name)
    if self.Scripts[name] then
        self.Scripts[name] = nil
        if ScrollingFrame:FindFirstChild(name) then
            ScrollingFrame:FindFirstChild(name):Destroy()
        end
    end
end

-- Toggle visibility
function ScriptHub:Toggle()
    ScreenGui.Enabled = not ScreenGui.Enabled
end

-- Initialize the UI
ScriptHub:InitUI()

return ScriptHub
