local Library = {}
    
function Library:CreateGui(Gui_Name)
    local CoreWindow = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    CoreWindow.Name = Gui_Name
    CoreWindow.Parent = game.CoreGui

    Main.Name = "Table Layout"
    Main.Parent = CoreWindow
    Main.BackgroundColor3 = Color3.new(1, 1, 1)
    Main.BackgroundTransparency = 1
    Main.Position = UDim2.new(0.00789889414, 0, 0.0145772593, 0)
    Main.Size = UDim2.new(0, 1246, 0, 366)
    
	UIListLayout.Parent = Main
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 4)
    
    ------------------------------ [ Window Library Start] ------------------------------
    local WindowLibrary = {}

    function WindowLibrary:Window(Window_Name)
        --[Frames]
        local Window = Instance.new("Frame")
        local WindowBar = Instance.new("Frame")
        local WindowTitle = Instance.new("TextLabel")
        local Toggle = Instance.new("TextButton")
        

        -- [Corners]
        local BarUICorner = Instance.new("UICorner")
        local TitleUICorner = Instance.new("UICorner")
        local WindowUICorner = Instance.new("UICorner")
        local ToggleUICorner = Instance.new("UICorner")

        -- [Frame Properties]
	    Window.Name = Window_Name .." Window"
	    Window.Parent = Main
	    Window.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
	    Window.Position = UDim2.new(0.0151757188, 0, 0, 0)
        Window.Size = UDim2.new(0, 204, 0, 376)
        
        WindowUICorner.Name = "Window Corner"
        WindowUICorner.Parent = Window
        WindowUICorner.CornerRadius = UDim.new(0, 4)

	    WindowBar.Name = Window_Name .." Bar"
	    WindowBar.Parent = Window
        WindowBar.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
        WindowBar.Size = UDim2.new(0, 204, 0, 33)
        
        BarUICorner.Name = "Window Corner"
        BarUICorner.Parent = WindowBar
        BarUICorner.CornerRadius = UDim.new(0, 4)
 
        Toggle.Name = "Toggle"
        Toggle.Parent = WindowBar
        Toggle.BackgroundColor3 = Color3.new(0.0862745, 0.0862745, 0.0862745)
        Toggle.BackgroundTransparency = 1
        Toggle.Position = UDim2.new(0.852941036, 0, 0.175612509, 0)
        Toggle.Rotation = 275
        Toggle.Size = UDim2.new(0, 20, 0, 20)
        Toggle.Font = Enum.Font.Gotham
        Toggle.Text = "<"
        Toggle.TextColor3 = Color3.new(0.372549, 0.372549, 0.372549)
        Toggle.TextSize = 20

        ToggleUICorner.Name = "Window Corner"
        ToggleUICorner.Parent = Toggle
        ToggleUICorner.CornerRadius = UDim.new(0, 4)

	   	WindowTitle.Name = Window_Name.." Title"
		WindowTitle.Parent = WindowBar
		WindowTitle.BackgroundColor3 = Color3.new(1, 1, 1)
		WindowTitle.BackgroundTransparency = 1
		WindowTitle.Size = UDim2.new(0, 174, 0, 33)
		WindowTitle.Font = Enum.Font.Code
		WindowTitle.Text = "  "..Window_Name..""
		WindowTitle.TextColor3 = Color3.new(1, 1, 1)
		WindowTitle.TextSize = 15
        WindowTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        TitleUICorner.Name = "Window Corner"
        TitleUICorner.Parent = WindowTitle
        TitleUICorner.CornerRadius = UDim.new(0, 4)
		
		-- [Frame Containor]
        local Containor = Instance.new("Frame")
        local ContainorLayout = Instance.new("UIListLayout")
        
        -- [Toggle Script]
        Toggle.MouseButton1Down:Connect(function()
            if Toggle.Rotation == 275 then
                Window:TweenSize(UDim2.new(0, 204,0, 31))
                Toggle.Rotation = 0
                Containor.Visible = false
            else
                Window:TweenSize(UDim2.new(0, 204,0, 376))
                Toggle.Rotation = 275
                Containor.Visible = true
            end
        end)
        
        -- [Properties]
        Containor.Name = "Containor"
        Containor.Parent = Window
        Containor.BackgroundColor3 = Color3.new(1, 1, 1)
        Containor.BackgroundTransparency = 1
        Containor.Position = UDim2.new(0, 0, 0.0957446769, 0)
        Containor.Size = UDim2.new(0, 204, 0, 340)

        -- [Containor Layout]
        ContainorLayout.Parent = Containor
        ContainorLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        ContainorLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContainorLayout.Padding = UDim.new(0, 3)


        ------------------------------ [ Tools Library Start] ------------------------------
        local ToolLibrary = {}

        function ToolLibrary:CreateButton(Button_Name, callback)
            local Button = Instance.new("TextButton")
            local ButtonUICorner = Instance.new("UICorner")
            local callback = callback or function() end
    
            Button.Name = "Button"
            Button.Parent = Containor
            Button.BackgroundColor3 = Color3.new(0.0627451, 0.0627451, 0.0627451)
            Button.Position = UDim2.new(0.00980392192, 0, 0, 0)
            Button.Size = UDim2.new(0, 191, 0, 30)
            Button.Font = Enum.Font.Code
            Button.Text = "  "..Button_Name..""
            Button.TextColor3 = Color3.new(1, 1, 1)
            Button.TextSize = 14
            Button.TextWrapped = true
            Button.TextXAlignment = Enum.TextXAlignment.Left

            ButtonUICorner.Name = "Button Corner"
            ButtonUICorner.Parent = Button
            ButtonUICorner.CornerRadius = UDim.new(0, 2)

            Button.MouseButton1Down:Connect(function()
                pcall(callback)
            end)
        end

        function ToolLibrary:CreateSlider(Slider_Name, min, max, callback)
            MinValue = min or 0
            MaxValue = max or 100
            callback = callback or function() end

            local SliderContainor = Instance.new("Frame")
            local SliderUiCorner1 = Instance.new("UICorner")
            local SliderUiCorner2 = Instance.new("UICorner")
            local SliderUiCorner3 = Instance.new("UICorner")
            local SilderText = Instance.new("TextLabel")
            local SliderColor = Instance.new("Frame")
            local SliderButton = Instance.new("TextButton")

            SliderContainor.Name = "SliderContainor"
            SliderContainor.Parent = Containor
            SliderContainor.BackgroundColor3 = Color3.new(0.0627451, 0.0627451, 0.0627451)
            SliderContainor.Size = UDim2.new(0, 191, 0, 30)

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = SliderContainor
            SliderButton.BackgroundColor3 = Color3.new(1, 1, 1)
            SliderButton.Size = UDim2.new(0, 200, 0, 50)
            SliderButton.Font = Enum.Font.SourceSans
            SliderButton.TextColor3 = Color3.new(0, 0, 0)
            SliderButton.Size = UDim2.new(0, 187, 0, 30)
            SliderButton.BackgroundTransparency= "1"
            SliderButton.TextSize = 14

            SliderColor.Name = "SliderColor"
            SliderColor.Parent = SliderButton
            SliderColor.BackgroundColor3 = Color3.new(1, 0.541176, 0.541176)
            SliderColor.BorderSizePixel = 0
            SliderColor.Size = UDim2.new(0, 0, 0, 30)

            SilderText.Name = "SilderText"
            SilderText.Parent = SliderButton
            SilderText.BackgroundColor3 = Color3.new(1, 1, 1)
            SilderText.BackgroundTransparency = 1
            SilderText.Size = UDim2.new(0, 187, 0, 30)
            SilderText.Font = Enum.Font.Code
            SilderText.Text = "  "..Slider_Name.." ["..min.."]"
            SilderText.TextColor3 = Color3.new(1, 1, 1)
            SilderText.TextSize = 14
            SilderText.TextXAlignment = Enum.TextXAlignment.Left

            SliderUiCorner1.Name = "Slider Corner"
            SliderUiCorner1.Parent = SliderContainor
            SliderUiCorner1.CornerRadius = UDim.new(0, 2)

            SliderUiCorner2.Name = "Slider Corner"
            SliderUiCorner2.Parent = SliderButton
            SliderUiCorner2.CornerRadius = UDim.new(0, 2)

            SliderUiCorner3.Name = "Slider Corner"
            SliderUiCorner3.Parent = SliderColor
            SliderUiCorner3.CornerRadius = UDim.new(0, 2)

            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local Value;
            
            SliderButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(MaxValue) - tonumber(MinValue)) / 190) * SliderColor.AbsoluteSize.X) + tonumber(MinValue)) or 0
                pcall(function()
                    callback(Value)
                end)
                SliderColor.Size = UDim2.new(0, math.clamp(mouse.X - SliderColor.AbsolutePosition.X, 0, 190), 0, 30)
                moveconnection = mouse.Move:Connect(function()
                    SilderText.Text = "  "..Slider_Name.." ["..Value.."]"
                    Value = math.floor((((tonumber(MaxValue) - tonumber(MinValue)) / 190) * SliderColor.AbsoluteSize.X) + tonumber(MinValue))
                    pcall(function()
                        callback(Value)
                    end)
                    SliderColor.Size = UDim2.new(0, math.clamp(mouse.X - SliderColor.AbsolutePosition.X, 0, 190), 0, 30)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(MaxValue) - tonumber(MinValue)) / 190) * SliderColor.AbsoluteSize.X) + tonumber(MinValue))
                        pcall(function()
                            callback(Value)
                        end)
                        SliderColor.Size = UDim2.new(0, math.clamp(mouse.X - SliderColor.AbsolutePosition.X, 0, 190), 0, 30)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
        end

        function ToolLibrary:CreateLabel(LabelName)
            local Label = Instance.new("TextLabel")
 
            Label.Name = "Label"
            Label.Parent = Containor
            Label.BackgroundColor3 = Color3.new(0.0627451, 0.0627451, 0.0627451)
            Label.Size = UDim2.new(0, 191, 0, 30)
            Label.Font = Enum.Font.Code
            Label.Text = "  "..LabelName..""
            Label.TextColor3 = Color3.new(1, 1, 1)
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
        end

        function ToolLibrary:CreateClipboard(ClipBoard_Text, URL)
            local Button = Instance.new("TextButton")
            local ButtonUICorner = Instance.new("UICorner")
    
            Button.Name = "Button"
            Button.Parent = Containor
            Button.BackgroundColor3 = Color3.new(0.0627451, 0.0627451, 0.0627451)
            Button.Position = UDim2.new(0.00980392192, 0, 0, 0)
            Button.Size = UDim2.new(0, 191, 0, 30)
            Button.Font = Enum.Font.Code
            Button.Text = "  "..ClipBoard_Text..""
            Button.TextColor3 = Color3.new(1, 1, 1)
            Button.TextSize = 14
            Button.TextWrapped = true
            Button.TextXAlignment = Enum.TextXAlignment.Left

            ButtonUICorner.Name = "Button Corner"
            ButtonUICorner.Parent = Button
            ButtonUICorner.CornerRadius = UDim.new(0, 2)

            Button.MouseButton1Down:Connect(function()
                setclipboard(URL)
            end)
        end

        return ToolLibrary
        ------------------------------ [ Tools Library End] ------------------------------
    end
    return WindowLibrary
    ------------------------------ [ Window Library End] ------------------------------
end