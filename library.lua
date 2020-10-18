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
	
	local UIWelcome = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")

	UIWelcome.Name = "UI-Welcome"
	UIWelcome.Parent = UIContents
	UIWelcome.Active = true
	UIWelcome.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	UIWelcome.BackgroundTransparency = 1.000
	UIWelcome.BorderColor3 = Color3.fromRGB(60, 60, 60)
	UIWelcome.ClipsDescendants = true
	UIWelcome.Position = UDim2.new(0.268844217, 3, 0.5, -135)
	UIWelcome.Selectable = true
	UIWelcome.Size = UDim2.new(0, 281, 0, 270)

	TextLabel.Parent = UIWelcome
	TextLabel.RichText = true
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.125, 0, 0.162962958, 0)
	TextLabel.Size = UDim2.new(0, 216, 0, 157)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = "<b><font color= \"rgb(242, 140, 255)\">"..GUIName.."</font></b>\nthis ui uses uilib by keda :3"
	
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 20.000
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
					v.Value.Value = false
					GUI["UI-Contents"][v.Name].Visible = false
					TweenService:Create(v.TextButton, ti, {BackgroundColor3 = Color3.fromRGB(38, 38, 38)}):Play()
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
	local ButtonEnabled = Instance.new("BoolValue")

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
	
	ButtonEnabled.Parent = Button_2
	ButtonEnabled.Value = true
	
	local TweenIn = TweenService:Create(Button_2, ti, {BackgroundColor3 = Color3.fromRGB(59, 59, 59)}) 
	local TweenOut = TweenService:Create(Button_2, ti, {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}) 
	local TweenDisable = TweenService:Create(Button_2, ti, {BackgroundTransparency = 1})
	local TweenEnable = TweenService:Create(Button_2, ti, {BackgroundTransparency = 0})
	
	if ButtonEnabled.Value then
		Button.MouseEnter:Connect(function()
			TweenIn:Play()
		end)

		Button.MouseLeave:Connect(function()
			TweenOut:Play()
		end)
	end
	
	ButtonEnabled:GetPropertyChangedSignal("Value"):Connect(function()
		if ButtonEnabled.Value == false then
			TweenDisable:Play()
		else
			TweenEnable:Play()
		end
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
	
	local function SetStatus()
		if BoolValue.Value then
			TweenIn:Play()
		else
			TweenOut:Play()
		end
	end
	
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
		SetStatus()
	end)
	
	BoolValue:GetPropertyChangedSignal("Value"):Connect(function()
		SetStatus()
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

module.CreateKeybind = function(Player, Section, Name, PlaceHolder)
	local Keybind = Instance.new("Frame")
	local Keybind_2 = Instance.new("TextLabel")
	local TextBox = Instance.new("TextBox")
	local StringVal = Instance.new("StringValue")
	PlaceHolder = string.upper(string.sub(PlaceHolder, 1, 1))
	local KeybindButton = PlaceHolder
	
	Keybind.Name = "Keybind"
	Keybind.Parent = Section
	Keybind.Active = true
	Keybind.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Keybind.BackgroundTransparency = 1.000
	Keybind.BorderColor3 = Color3.fromRGB(60, 60, 60)
	Keybind.ClipsDescendants = true
	Keybind.Position = UDim2.new(0.5, -62, 0.0274509806, 0)
	Keybind.Selectable = true
	Keybind.Size = UDim2.new(0, 125, 0, 30)

	Keybind_2.Name = "Keybind"
	Keybind_2.Parent = Keybind
	Keybind_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Keybind_2.BackgroundTransparency = 1.000
	Keybind_2.Position = UDim2.new(0.075000003, 0, 0, 0)
	Keybind_2.Size = UDim2.new(0, 55, 0, 30)
	Keybind_2.Font = Enum.Font.SourceSans
	Keybind_2.Text = "Keybind"
	Keybind_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	Keybind_2.TextSize = 14.000
	Keybind_2.TextXAlignment = Enum.TextXAlignment.Left

	TextBox.Parent = Keybind
	TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	TextBox.BorderColor3 = Color3.fromRGB(30, 30, 30)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0.65, 0, 0.13333334, 0)
	TextBox.Size = UDim2.new(0, 33, 0, 20)
	TextBox.Font = Enum.Font.SourceSans
	TextBox.PlaceholderText = ""
	TextBox.Text = PlaceHolder
	TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox.TextSize = 14.000
	
	StringVal.Parent = TextBox
	StringVal.Value = PlaceHolder
	
	TextBox.FocusLost:Connect(function()
		KeybindButton = string.upper(string.sub(TextBox.Text, 1, 1))
		TextBox.Text = KeybindButton
		StringVal.Value = string.lower(KeybindButton)
	end)
	
	return StringVal
end
return module
