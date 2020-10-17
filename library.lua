local module = {}
local first = true

local TweenService = game:GetService("TweenService")
local ti = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out) 

module.CreateGUI = function(Player, GUIName)
	local UIGUI = Instance.new("ScreenGui")
	local UIFrame = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local UIContents = Instance.new("Frame")
	local UISelect = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")
	UIGUI.Name = "UI-GUI"
	UIGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	UIGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	UIGUI.ResetOnSpawn = false

	UIFrame.Name = "UI-Frame"
	UIFrame.Parent = UIGUI
	UIFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	UIFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
	UIFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
	UIFrame.Size = UDim2.new(0, 400, 0, 300)
	UIFrame.Draggable = true
	UIFrame.Active = true
	UIFrame.Selectable = true

	Title.Name = "Title"
	Title.Parent = UIFrame
	Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Title.BorderColor3 = Color3.fromRGB(60, 60, 60)
	Title.Position = UDim2.new(0.5, -200, 0, -2)
	Title.Size = UDim2.new(0, 400, 0, 20)
	Title.Font = Enum.Font.SourceSans
	Title.Text = GUIName
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000

	UIContents.Name = "UI-Contents"
	UIContents.Parent = UIFrame
	UIContents.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UIContents.BackgroundTransparency = 1.000
	UIContents.Position = UDim2.new(0.00498748757, 0, 0.0662444085, 0)
	UIContents.Size = UDim2.new(0, 398, 0, 280)

	UISelect.Name = "UI-Select"
	UISelect.Parent = UIContents
	UISelect.Active = true
	UISelect.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	UISelect.BorderColor3 = Color3.fromRGB(60, 60, 60)
	UISelect.ClipsDescendants = true
	UISelect.Position = UDim2.new(0, 3, 0.5, -135)
	UISelect.Selectable = true
	UISelect.Size = UDim2.new(0, 100, 0, 270)

	UIGridLayout.Parent = UISelect
	UIGridLayout.FillDirection = Enum.FillDirection.Vertical
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(0, 100, 0, 30)
	return UIFrame
end

module.CreateTab = function(Player, GUI, TabName)
	local Section = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local Active = Instance.new("BoolValue")

	Section.Name = TabName
	Section.Parent = GUI["UI-Contents"]
	Section.Active = true
	Section.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Section.BorderColor3 = Color3.fromRGB(60, 60, 60)
	Section.ClipsDescendants = true
	Section.Position = UDim2.new(0.268844217, 3, 0.5, -135)
	Section.Selectable = true
	Section.Size = UDim2.new(0, 281, 0, 270)
	Section.Visible = false

	UIGridLayout.Parent = Section
	UIGridLayout.FillDirection = Enum.FillDirection.Vertical
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(0, 140, 0, 270)

	local SectionPadding = Instance.new("Frame")
	local TextButton = Instance.new("TextButton")

	SectionPadding.Name = TabName
	SectionPadding.Parent = GUI["UI-Contents"]["UI-Select"]
	SectionPadding.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SectionPadding.BackgroundTransparency = 1.000
	SectionPadding.Size = UDim2.new(0, 100, 0, 30)

	TextButton.Name = "TextButton"
	TextButton.Parent = SectionPadding
	TextButton.Active = false
	TextButton.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.5, -45, 0.5, -10)
	TextButton.Selectable = false
	TextButton.Size = UDim2.new(0, 90, 0, 20)
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Text = TabName
	TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextSize = 14.000
	TextButton.AutoButtonColor = false

	Active.Parent = SectionPadding
	Active.Value = false

	local TweenIn = TweenService:Create(TextButton, ti, {BackgroundColor3 = Color3.fromRGB(69, 69, 69)}) 
	local TweenOut = TweenService:Create(TextButton, ti, {BackgroundColor3 = Color3.fromRGB(38, 38, 38)}) 

	TextButton.MouseEnter:Connect(function()
		if not Active.Value then
			TweenIn:Play()
		end
	end)

	TextButton.MouseLeave:Connect(function()
		if not Active.Value then
			TweenOut:Play()
		end
	end)

	TextButton.MouseButton1Click:Connect(function()
		if not Active.Value then
			for i,v in pairs(GUI["UI-Contents"]["UI-Select"]:GetChildren()) do
				if v:IsA("Frame") and v.Name ~= TabName then
					v.Active.Value = false
					v.TextButton.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
				end
			end
			Active.Value = true
			Section.Visible = true
			TextButton.BackgroundColor3 = Color3.fromRGB(69, 69, 69)
		end
	end)

	return Section
end

module.CreateSection = function(Player, Tab, SectionName)
	local Section = Instance.new("Frame")
	local SelectPadding = Instance.new("Frame")
	local Select = Instance.new("Frame")
	local UIGridLayout = Instance.new("UIGridLayout")
	local TextLabel = Instance.new("TextLabel")

	Section.Name = SectionName
	Section.Parent = Tab
	Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Section.BackgroundTransparency = 1.000
	Section.BorderSizePixel = 0
	Section.Size = UDim2.new(0, 140, 0, 270)

	SelectPadding.Name = "SelectPadding"
	SelectPadding.Parent = Section
	SelectPadding.Active = true
	SelectPadding.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SelectPadding.BorderColor3 = Color3.fromRGB(60, 60, 60)
	SelectPadding.ClipsDescendants = true
	SelectPadding.Position = UDim2.new(0.5, -62, 0.528939605, -135)
	SelectPadding.Selectable = true
	SelectPadding.Size = UDim2.new(0, 125, 0, 255)

	Select.Name = "Select"
	Select.Parent = SelectPadding
	Select.Active = true
	Select.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Select.BackgroundTransparency = 1.000
	Select.BorderColor3 = Color3.fromRGB(60, 60, 60)
	Select.ClipsDescendants = true
	Select.Position = UDim2.new(0.5, -62, 0.0274509806, 0)
	Select.Selectable = true
	Select.Size = UDim2.new(0, 125, 0, 248)

	UIGridLayout.Parent = Select
	UIGridLayout.FillDirection = Enum.FillDirection.Vertical
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
	UIGridLayout.CellSize = UDim2.new(0, 125, 0, 30)

	TextLabel.Parent = Section
	TextLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextLabel.BorderColor3 = Color3.fromRGB(30, 30, 30)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.100000001, 0, -0.000690036337, 0)
	TextLabel.Size = UDim2.new(0, 45, 0, 15)
	TextLabel.ZIndex = 2
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = SectionName
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	return Select
end

module.CreateTextBox = function(Player, Section, Name, PlaceHolder)
	local Value = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local TextBox = Instance.new("TextBox")

	Value.Name = "Value"
	Value.Parent = Section
	Value.Active = true
	Value.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Value.BackgroundTransparency = 1.000
	Value.BorderColor3 = Color3.fromRGB(60, 60, 60)
	Value.ClipsDescendants = true
	Value.Position = UDim2.new(0.5, -62, 0.0274509806, 0)
	Value.Selectable = true
	Value.Size = UDim2.new(0, 125, 0, 30)

	TextLabel.Parent = Value
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.075000003, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 55, 0, 30)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.Text = Name

	TextBox.Parent = Value
	TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TextBox.BorderColor3 = Color3.fromRGB(30, 30, 30)
	TextBox.Position = UDim2.new(0.925000012, -55, 0.666666627, -15)
	TextBox.Size = UDim2.new(0, 55, 0, 20)
	TextBox.Font = Enum.Font.SourceSans

	if PlaceHolder then
		TextBox.PlaceholderText = PlaceHolder
	else
		TextBox.PlaceholderText = "Value"
	end
	TextBox.Text = ""
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextSize = 14.000

	return TextBox
end

module.CreateButton = function(Player, Section, Name)
	local Button = Instance.new("Frame")
	local Button_2 = Instance.new("TextButton")

	Button.Name = Name
	Button.Parent = Section
	Button.Active = true
	Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Button.BackgroundTransparency = 1.000
	Button.BorderColor3 = Color3.fromRGB(60, 60, 60)
	Button.ClipsDescendants = true
	Button.Position = UDim2.new(0.5, -62, 0.0274509806, 0)
	Button.Selectable = true
	Button.Size = UDim2.new(0, 125, 0, 30)

	Button_2.Name = "Button"
	Button_2.Parent = Button
	Button_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Button_2.BorderColor3 = Color3.fromRGB(50, 50, 50)
	Button_2.BorderSizePixel = 0
	Button_2.Position = UDim2.new(0.514999986, -55, 0.666666687, -15)
	Button_2.Size = UDim2.new(0, 105, 0, 20)
	Button_2.AutoButtonColor = false
	Button_2.Font = Enum.Font.SourceSans
	Button_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button_2.TextSize = 14.000
	Button_2.Text = Name

	local TweenIn = TweenService:Create(Button_2, ti, {BackgroundColor3 = Color3.fromRGB(59, 59, 59)}) 
	local TweenOut = TweenService:Create(Button_2, ti, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}) 

	Button.MouseEnter:Connect(function()
		TweenIn:Play()
	end)

	Button.MouseLeave:Connect(function()
		TweenOut:Play()
	end)
	return Button_2
end

module.CreateToggle = function(Player, Section, Name, Colour)
	local Toggle = Instance.new("Frame")
	local Toggle_2 = Instance.new("TextLabel")
	local Button = Instance.new("TextButton")
	local BoolValue = Instance.new("BoolValue")

	if not Colour then
		Colour = Color3.fromRGB(99, 99, 99)
	end

	Toggle.Name = Name
	Toggle.Parent = Section
	Toggle.Active = true
	Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Toggle.BackgroundTransparency = 1.000
	Toggle.BorderColor3 = Color3.fromRGB(60, 60, 60)
	Toggle.ClipsDescendants = true
	Toggle.Position = UDim2.new(0.5, -62, 0.0274509806, 0)
	Toggle.Selectable = true
	Toggle.Size = UDim2.new(0, 125, 0, 30)

	Toggle_2.Name = Name
	Toggle_2.Parent = Toggle
	Toggle_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Toggle_2.BackgroundTransparency = 1.000
	Toggle_2.Position = UDim2.new(0.075000003, 0, 0, 0)
	Toggle_2.Size = UDim2.new(0, 55, 0, 30)
	Toggle_2.Font = Enum.Font.SourceSans
	Toggle_2.Text = Name
	Toggle_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Toggle_2.TextSize = 14.000
	Toggle_2.TextXAlignment = Enum.TextXAlignment.Left

	Button.Name = "Button"
	Button.Parent = Toggle
	Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Button.BorderColor3 = Color3.fromRGB(50, 50, 50)
	Button.BorderSizePixel = 4
	Button.Position = UDim2.new(1.19700003, -55, 0.666666627, -15)
	Button.Size = UDim2.new(0, 20, 0, 20)
	Button.AutoButtonColor = false
	Button.Font = Enum.Font.SourceSans
	Button.Text = ""
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.TextSize = 14.000
	Button.BorderMode = 2

	BoolValue.Parent = Button

	local TweenIn = TweenService:Create(Button, ti, {BackgroundColor3 = Colour}) 
	local TweenOut = TweenService:Create(Button, ti, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}) 

	Button.MouseEnter:Connect(function()
		if not BoolValue.Value then
			TweenIn:Play()
		end
	end)

	Button.MouseLeave:Connect(function()
		if not BoolValue.Value then
			TweenOut:Play()
		end
	end)

	Button.MouseButton1Click:Connect(function()
		BoolValue.Value = not BoolValue.Value
		if BoolValue.Value then
			TweenIn:Play()
		else
			TweenOut:Play()
		end
	end)

	return BoolValue
end

module.CreateText = function(Player, Section, Name)
	local Text = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")

	Text.Name = Name
	Text.Parent = Section
	Text.Active = true
	Text.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Text.BackgroundTransparency = 1.000
	Text.BorderColor3 = Color3.fromRGB(60, 60, 60)
	Text.ClipsDescendants = true
	Text.Position = UDim2.new(0.5, -62, 0.0274509806, 0)
	Text.Selectable = true
	Text.Size = UDim2.new(0, 125, 0, 30)

	TextLabel.Parent = Text
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.075000003, 0, 0, 0)
	TextLabel.Size = UDim2.new(0, 106, 0, 30)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = Name
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
end

local UILib = module
local LocalPlayer = game:GetService("Players").LocalPlayer

local GUI = UILib:CreateGUI("Reacher")
local Tab = UILib:CreateTab(GUI,"Reach")

local Section = UILib:CreateSection(Tab,"Resize")
local Size = UILib:CreateTextBox(Section,"Size","Size")
local SelectionBox = UILib:CreateToggle(Section, "SelectionBox")
local SSphere = UILib:CreateToggle(Section, "SSphere")
local Enabled = UILib:CreateToggle(Section, "Enabled")


local Reaching = false
local OriginalSize
local SizeTable = {1, 0.8, 4}
local ReachSize

if Bypass then
	UILib:CreateText(Section, "Bypassing "..Bypass)
else
	UILib:CreateText(Section, "Anti not detected")
end

local function SetOriginalSize(Sword)
	pcall(function()
		if not Reaching then
			local OriginalSize = string.split(tostring(Sword.Handle.Size),", ")
			for i,v in pairs(OriginalSize) do
				OriginalSize[i] = math.floor((v*100)+0.5)/100
			end
			OriginalSize = OriginalSize[1]..", "..OriginalSize[2]..", "..OriginalSize[3]

			SizeTable = string.split(OriginalSize,", ")
			Size.PlaceholderText = OriginalSize
		end
	end)
end

local function Sword()
	for i,v in pairs(LocalPlayer.Character:GetChildren()) do
		if v:IsA("Tool") and v:FindFirstChild("Handle") then
			SetOriginalSize(v)
			return v
		end
	end
	for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
		if v:FindFirstChild("Handle") then
			SetOriginalSize(v)
			return v
		end
	end
	print("Couldn't find sword")
	return nil
end

local function AddSelectionBox(Add)
	if Sword() then
		if Add then
			local Handle = Sword().Handle
			local SelectionBox = Instance.new("SelectionBox")
			SelectionBox.Parent = Handle
			SelectionBox.Adornee = Handle
			SelectionBox.LineThickness = 0.05
			Handle.Massless = true
		else
			if Sword().Handle:FindFirstChild("SelectionBox") then
				Sword().Handle.SelectionBox:Destroy()
			end
		end
	end
end

local function AddSelectionSphere(Add)
	if Sword() then
		if Add then
			local Handle = Sword().Handle
			local SelectionSphere = Instance.new("SelectionSphere")
			SelectionSphere.Parent = Handle
			SelectionSphere.Adornee = Handle
			SelectionSphere.Color3 = Color3.fromRGB(233, 0, 240)
			Handle.Massless = true
		else
			if Sword().Handle:FindFirstChild("SelectionSphere") then
				Sword().Handle.SelectionSphere:Destroy()
			end
		end
	end
end

local function ChangeSize()
	pcall(function()
		local Handle = Sword().Handle
		if Reaching then
			Handle.Size = Vector3.new(ReachSize[1], ReachSize[2], ReachSize[3])
		else
			Handle.Size = Vector3.new(SizeTable[1], SizeTable[2], SizeTable[3])
		end
	end)
end

local function UpdateReach()
	ChangeSize()
	if SelectionBox.Value == true then
		AddSelectionBox(true)
	end
	if SSphere.Value == true then
		AddSelectionSphere(true)
	end
end

Sword()
local FindSwordButton = UILib:CreateButton(Section, "Find Sword")
FindSwordButton.MouseButton1Down:Connect(function()
	if Sword() then
		SetOriginalSize()
		FindSwordButton.Text = "Sword found"
		wait(2)
		FindSwordButton.Text = "Find Sword"
	else
		FindSwordButton.Text = "Couldn't find"
		wait(2)
		FindSwordButton.Text = "Find Sword"
	end
end)

LocalPlayer.CharacterAdded:Connect(UpdateReach)
Size.FocusLost:Connect(function()
	ReachSize = Size.Text
	ReachSize = string.gsub(ReachSize, "%s+", "")
	ReachSize = string.split(ReachSize,",")

	if #ReachSize == 1 and ReachSize[1] ~= "" then
		for i = 2,3 do
			ReachSize[i] = ReachSize[1]
		end
	else
		for i = 1,3 do
			if not tonumber(ReachSize[i]) then
				ReachSize[i] = SizeTable[i]
			end
			tonumber(ReachSize[i])
		end
	end 


	Size.Text = ReachSize[1]..", "..ReachSize[2]..", "..ReachSize[3]
	ChangeSize(ReachSize)
end)

return module
