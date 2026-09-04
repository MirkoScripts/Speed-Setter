-- Speed Gui By MirkoScripts
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Check if player has a character and humanoid
local function getHumanoid()
	local character = Player.Character
	if character then
		return character:FindFirstChild("Humanoid")
	end
	return nil
end

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpeedGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = Player:WaitForChild("PlayerGui")

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 350, 0, 200)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(80, 80, 120)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Add corner rounding
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Shadow effect
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1.05, 0, 1.05, 0)
shadow.Position = UDim2.new(-0.025, 0, -0.025, 0)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045614"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.6
shadow.ZIndex = 0
shadow.Parent = mainFrame

-- Title with rainbow effect
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -80, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Speed Gui Made By MirkoScripts"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Center
title.Parent = mainFrame

-- Rainbow animation for title
local hue = 0
local rainbowConnection
rainbowConnection = RunService.Heartbeat:Connect(function()
	hue = hue + 0.005
	if hue > 1 then hue = 0 end
	title.TextColor3 = Color3.fromHSV(hue, 1, 1)
end)

-- Mini Button (when minimized) - IMPROVED VISIBILITY
local miniButton = Instance.new("TextButton")
miniButton.Name = "MiniButton"
miniButton.Size = UDim2.new(0, 160, 0, 55)   -- bigger
miniButton.Position = UDim2.new(0.02, 0, 0.5, -27)
miniButton.BackgroundColor3 = Color3.fromRGB(25, 25, 45) -- slightly lighter but still dark
miniButton.Text = "Speed Setter"
miniButton.TextColor3 = Color3.fromRGB(255, 255, 255)
miniButton.TextSize = 24                       -- larger
miniButton.Font = Enum.Font.GothamBold
miniButton.BorderSizePixel = 3
miniButton.BorderColor3 = Color3.fromRGB(150, 150, 220)
miniButton.Visible = false
miniButton.Parent = screenGui

-- Strong text stroke (glow effect)
miniButton.TextStrokeTransparency = 0.2
miniButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0) -- dark outline for contrast

-- Shadow under the button
local miniShadow = Instance.new("ImageLabel")
miniShadow.Name = "Shadow"
miniShadow.Size = UDim2.new(1.1, 0, 1.1, 0)
miniShadow.Position = UDim2.new(-0.05, 0, -0.05, 0)
miniShadow.BackgroundTransparency = 1
miniShadow.Image = "rbxassetid://1316045614"
miniShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
miniShadow.ImageTransparency = 0.5
miniShadow.ZIndex = 0
miniShadow.Parent = miniButton

-- Glow behind text (ImageLabel)
local miniGlow = Instance.new("ImageLabel")
miniGlow.Name = "Glow"
miniGlow.Size = UDim2.new(1.3, 0, 1.3, 0)
miniGlow.Position = UDim2.new(-0.15, 0, -0.15, 0)
miniGlow.BackgroundTransparency = 1
miniGlow.Image = "rbxassetid://1316045614"
miniGlow.ImageColor3 = Color3.fromRGB(255, 200, 100)
miniGlow.ImageTransparency = 0.3
miniGlow.ZIndex = 0
miniGlow.Parent = miniButton

-- Gradient background (slightly brighter)
local miniGradient = Instance.new("UIGradient")
miniGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 60)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 40, 80))
})
miniGradient.Parent = miniButton

-- Corner rounding
local miniCorner = Instance.new("UICorner")
miniCorner.CornerRadius = UDim.new(0, 12)
miniCorner.Parent = miniButton

-- Rainbow animation for mini button text AND glow color
local miniHue = 0
local miniRainbowConnection
miniRainbowConnection = RunService.Heartbeat:Connect(function()
	miniHue = miniHue + 0.008
	if miniHue > 1 then miniHue = 0 end
	if miniButton.Visible then
		-- Make text rainbow with full saturation and value
		miniButton.TextColor3 = Color3.fromHSV(miniHue, 1, 1)
		-- Update glow color to match
		if miniGlow then
			miniGlow.ImageColor3 = Color3.fromHSV(miniHue, 0.9, 1)
		end
	end
end)

-- Mini button hover
miniButton.MouseEnter:Connect(function()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(50, 50, 80)}):Play()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {Size = UDim2.new(0, 170, 0, 60)}):Play()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {Position = UDim2.new(0.02, 0, 0.5, -30)}):Play()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {TextSize = 26}):Play()
	TweenService:Create(miniGlow, TweenInfo.new(0.3), {ImageTransparency = 0.1}):Play()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {BorderColor3 = Color3.fromRGB(200, 200, 255)}):Play()
end)
miniButton.MouseLeave:Connect(function()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(25, 25, 45)}):Play()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {Size = UDim2.new(0, 160, 0, 55)}):Play()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {Position = UDim2.new(0.02, 0, 0.5, -27)}):Play()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {TextSize = 24}):Play()
	TweenService:Create(miniGlow, TweenInfo.new(0.3), {ImageTransparency = 0.3}):Play()
	TweenService:Create(miniButton, TweenInfo.new(0.15), {BorderColor3 = Color3.fromRGB(150, 150, 220)}):Play()
end)

miniButton.MouseButton1Click:Connect(function()
	local miniPos = miniButton.Position
	miniButton.Visible = false
	mainFrame.Visible = true

	mainFrame.Size = UDim2.new(0, 0, 0, 0)
	mainFrame.Position = UDim2.new(miniPos.X.Scale, miniPos.X.Offset + 80, miniPos.Y.Scale, miniPos.Y.Offset + 27)

	TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 350, 0, 200),
		Position = UDim2.new(0.5, -175, 0.5, -100)
	}):Play()
end)

-- Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 35, 0, 35)
closeButton.Position = UDim2.new(1, -42, 0, 3)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 100, 100)
closeButton.TextSize = 22
closeButton.Font = Enum.Font.GothamBold
closeButton.TextXAlignment = Enum.TextXAlignment.Center
closeButton.TextYAlignment = Enum.TextYAlignment.Center
closeButton.Parent = mainFrame

closeButton.MouseEnter:Connect(function()
	TweenService:Create(closeButton, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 50, 50)}):Play()
	TweenService:Create(closeButton, TweenInfo.new(0.15), {TextSize = 26}):Play()
end)
closeButton.MouseLeave:Connect(function()
	TweenService:Create(closeButton, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 100, 100)}):Play()
	TweenService:Create(closeButton, TweenInfo.new(0.15), {TextSize = 22}):Play()
end)

closeButton.MouseButton1Click:Connect(function()
	TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	}):Play()
	TweenService:Create(title, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
	TweenService:Create(input, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
	TweenService:Create(setButton, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextTransparency = 1}):Play()
	TweenService:Create(closeButton, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
	TweenService:Create(minimizeButton, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
	TweenService:Create(shadow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
	task.wait(0.3)
	screenGui:Destroy()
end)

-- Minimize Button (-)
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 35, 0, 35)
minimizeButton.Position = UDim2.new(1, -80, 0, 3)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 180)
minimizeButton.TextSize = 26
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextXAlignment = Enum.TextXAlignment.Center
minimizeButton.TextYAlignment = Enum.TextYAlignment.Center
minimizeButton.Parent = mainFrame

minimizeButton.MouseEnter:Connect(function()
	TweenService:Create(minimizeButton, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 255, 100)}):Play()
	TweenService:Create(minimizeButton, TweenInfo.new(0.15), {TextSize = 30}):Play()
end)
minimizeButton.MouseLeave:Connect(function()
	TweenService:Create(minimizeButton, TweenInfo.new(0.15), {TextColor3 = Color3.fromRGB(255, 255, 180)}):Play()
	TweenService:Create(minimizeButton, TweenInfo.new(0.15), {TextSize = 26}):Play()
end)

minimizeButton.MouseButton1Click:Connect(function()
	local miniPos = miniButton.Position
	TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
		Size = UDim2.new(0, 0, 0, 0),
		Position = UDim2.new(miniPos.X.Scale, miniPos.X.Offset + 80, miniPos.Y.Scale, miniPos.Y.Offset + 27)
	}):Play()

	task.wait(0.25)
	mainFrame.Visible = false
	miniButton.Visible = true
	mainFrame.Size = UDim2.new(0, 350, 0, 200)
	mainFrame.Position = UDim2.new(0.5, -175, 0.5, -100)
end)

-- Input
local input = Instance.new("TextBox")
input.Name = "Input"
input.Size = UDim2.new(0, 220, 0, 45)
input.Position = UDim2.new(0.5, -110, 0.35, 0)
input.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.Text = "16"
input.PlaceholderText = "Enter speed..."
input.PlaceholderColor3 = Color3.fromRGB(150, 150, 170)
input.Font = Enum.Font.GothamBold
input.TextSize = 22
input.BorderSizePixel = 2
input.BorderColor3 = Color3.fromRGB(60, 60, 100)
input.ClearTextOnFocus = false
input.Parent = mainFrame

-- Input corner rounding
local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 6)
inputCorner.Parent = input

-- Input focus effects
input.Focused:Connect(function()
	TweenService:Create(input, TweenInfo.new(0.2), {BorderColor3 = Color3.fromRGB(0, 150, 255)}):Play()
end)

input.FocusLost:Connect(function()
	TweenService:Create(input, TweenInfo.new(0.2), {BorderColor3 = Color3.fromRGB(60, 60, 100)}):Play()
end)

-- Only numbers
input:GetPropertyChangedSignal("Text"):Connect(function()
	local text = input.Text
	if text ~= "" then
		local num = tonumber(text)
		if not num then
			input.Text = text:sub(1, #text - 1)
		end
	end
end)

-- Set Button
local setButton = Instance.new("TextButton")
setButton.Name = "SetButton"
setButton.Size = UDim2.new(0, 120, 0, 45)
setButton.Position = UDim2.new(0.5, -60, 0.7, 0)
setButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
setButton.TextColor3 = Color3.fromRGB(255, 255, 255)
setButton.Text = "SET"
setButton.Font = Enum.Font.GothamBold
setButton.TextSize = 22
setButton.BorderSizePixel = 0
setButton.Parent = mainFrame

-- Set button corner rounding
local setCorner = Instance.new("UICorner")
setCorner.CornerRadius = UDim.new(0, 8)
setCorner.Parent = setButton

-- Set button glow effect
local setGlow = Instance.new("ImageLabel")
setGlow.Name = "Glow"
setGlow.Size = UDim2.new(1.2, 0, 1.2, 0)
setGlow.Position = UDim2.new(-0.1, 0, -0.1, 0)
setGlow.BackgroundTransparency = 1
setGlow.Image = "rbxassetid://1316045614"
setGlow.ImageColor3 = Color3.fromRGB(0, 150, 255)
setGlow.ImageTransparency = 0.7
setGlow.ZIndex = 0
setGlow.Parent = setButton

-- Set button hover effects
setButton.MouseEnter:Connect(function()
	TweenService:Create(setButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 130, 255)}):Play()
	TweenService:Create(setButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 130, 0, 48)}):Play()
	TweenService:Create(setButton, TweenInfo.new(0.2), {Position = UDim2.new(0.5, -65, 0.7, 0)}):Play()
	TweenService:Create(setGlow, TweenInfo.new(0.3), {ImageTransparency = 0.3}):Play()
end)
setButton.MouseLeave:Connect(function()
	TweenService:Create(setButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 255)}):Play()
	TweenService:Create(setButton, TweenInfo.new(0.2), {Size = UDim2.new(0, 120, 0, 45)}):Play()
	TweenService:Create(setButton, TweenInfo.new(0.2), {Position = UDim2.new(0.5, -60, 0.7, 0)}):Play()
	TweenService:Create(setGlow, TweenInfo.new(0.3), {ImageTransparency = 0.7}):Play()
end)

-- Function to set speed
local function setSpeed()
	local humanoid = getHumanoid()
	if humanoid then
		local num = tonumber(input.Text)
		if num and num > 0 then
			humanoid.WalkSpeed = num
			TweenService:Create(setButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 200, 80)}):Play()
			setButton.Text = "DONE"
			TweenService:Create(setButton, TweenInfo.new(0.2), {TextSize = 20}):Play()
			task.wait(0.4)
			TweenService:Create(setButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 255)}):Play()
			setButton.Text = "SET"
			TweenService:Create(setButton, TweenInfo.new(0.2), {TextSize = 22}):Play()
		else
			TweenService:Create(setButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}):Play()
			setButton.Text = "INVALID"
			TweenService:Create(input, TweenInfo.new(0.1), {BorderColor3 = Color3.fromRGB(255, 50, 50)}):Play()
			task.wait(0.3)
			TweenService:Create(setButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0, 100, 255)}):Play()
			setButton.Text = "SET"
			TweenService:Create(input, TweenInfo.new(0.1), {BorderColor3 = Color3.fromRGB(60, 60, 100)}):Play()
		end
	else
		TweenService:Create(setButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(200, 100, 0)}):Play()
		setButton.Text = "NO CHAR"
		task.wait(0.4)
		TweenService:Create(setButton, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(0, 100, 255)}):Play()
		setButton.Text = "SET"
	end
end

setButton.MouseButton1Click:Connect(setSpeed)

-- Dragging functionality
local draggingEnabled = true
local dragInput, dragStart, startPos

local function updateInput(input)
	local delta = input.Position - dragStart
	mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		draggingEnabled = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				draggingEnabled = false
			end
		end)
	end
end)

mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if draggingEnabled and dragStart then
			updateInput(input)
		end
	end
end)

local dragFrame = Instance.new("Frame")
dragFrame.Name = "DragFrame"
dragFrame.Size = UDim2.new(1, -80, 0, 40)
dragFrame.Position = UDim2.new(0, 0, 0, 0)
dragFrame.BackgroundTransparency = 1
dragFrame.Parent = mainFrame

dragFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		draggingEnabled = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				draggingEnabled = false
			end
		end)
	end
end)

dragFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		if draggingEnabled and dragStart then
			updateInput(input)
		end
	end
end)

-- Keybind: Press Enter to set speed
input.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		setSpeed()
	end
end)

-- Auto-detect character and set speed if humanoid exists
task.wait(0.5)
local humanoid = getHumanoid()
if humanoid then
	input.Text = tostring(humanoid.WalkSpeed)
end

Player.CharacterAdded:Connect(function(character)
	task.wait(0.5)
	local humanoid = character:FindFirstChild("Humanoid")
	if humanoid then
		input.Text = tostring(humanoid.WalkSpeed)
	end
end)

screenGui.AncestryChanged:Connect(function()
	if not screenGui.Parent then
		if rainbowConnection then
			rainbowConnection:Disconnect()
		end
		if miniRainbowConnection then
			miniRainbowConnection:Disconnect()
		end
	end
end)

print("Speed Gui Loaded! Made by MirkoScripts")
