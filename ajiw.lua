local UILib = {}
UILib.__index = UILib

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Colors = {
    Background = Color3.fromRGB(30, 30, 30),
    Secondary = Color3.fromRGB(40, 40, 40),
    Tertiary = Color3.fromRGB(50, 50, 50),
    Border = Color3.fromRGB(60, 60, 60),
    Text = Color3.fromRGB(255, 255, 255),
    TextDark = Color3.fromRGB(170, 170, 170),
    Accent = Color3.fromRGB(190, 190, 190),
    Hover = Color3.fromRGB(65, 65, 65)
}

local function Create(className, properties)
    local instance = Instance.new(className)
    for prop, value in pairs(properties) do
        instance[prop] = value
    end
    return instance
end

local function Tween(object, properties, duration)
    local tween = TweenService:Create(object, TweenInfo.new(duration or 0.12, Enum.EasingStyle.Quad), properties)
    tween:Play()
    return tween
end

local function AddCorner(parent, radius)
    return Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 4),
        Parent = parent
    })
end

function UILib:CreateWindow(config)
    config = config or {}
    local title = config.Title or "Window"
    local size = config.Size or UDim2.new(0, 380, 0, 260)
    
    local Window = {}
    
    local ScreenGui = Create("ScreenGui", {
        Name = "UILib",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    })
    
    local MainFrame = Create("Frame", {
        Name = "Main",
        Size = size,
        Position = UDim2.new(0.5, -size.X.Offset/2, 0.5, -size.Y.Offset/2),
        BackgroundColor3 = Colors.Background,
        BorderSizePixel = 1,
        BorderColor3 = Colors.Border,
        Parent = ScreenGui
    })
    
    local TitleBar = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 18),
        BackgroundColor3 = Colors.Secondary,
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    
    local TitleLabel = Create("TextLabel", {
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 5, 0, 0),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = Colors.Text,
        TextSize = 10,
        Font = Enum.Font.SourceSans,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TitleBar
    })
    
    local CloseBtn = Create("TextButton", {
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(1, -18, 0, 0),
        BackgroundColor3 = Colors.Secondary,
        BorderSizePixel = 0,
        Text = "x",
        TextColor3 = Colors.TextDark,
        TextSize = 10,
        Font = Enum.Font.SourceSans,
        Parent = TitleBar
    })
    
    CloseBtn.MouseEnter:Connect(function()
        Tween(CloseBtn, {BackgroundColor3 = Color3.fromRGB(160, 50, 50)})
    end)
    
    CloseBtn.MouseLeave:Connect(function()
        Tween(CloseBtn, {BackgroundColor3 = Colors.Secondary})
    end)
    
    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
    
    local MinBtn = Create("TextButton", {
        Size = UDim2.new(0, 18, 0, 18),
        Position = UDim2.new(1, -36, 0, 0),
        BackgroundColor3 = Colors.Secondary,
        BorderSizePixel = 0,
        Text = "-",
        TextColor3 = Colors.TextDark,
        TextSize = 10,
        Font = Enum.Font.SourceSans,
        Parent = TitleBar
    })
    
    MinBtn.MouseEnter:Connect(function()
        Tween(MinBtn, {BackgroundColor3 = Colors.Hover})
    end)
    
    MinBtn.MouseLeave:Connect(function()
        Tween(MinBtn, {BackgroundColor3 = Colors.Secondary})
    end)
    
    local minimized = false
    local originalSize = size
    
    MinBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Tween(MainFrame, {Size = UDim2.new(0, originalSize.X.Offset, 0, 18)})
        else
            Tween(MainFrame, {Size = originalSize})
        end
    end)
    
    local dragging, dragStart, startPos
    
    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
        end
    end)
    
    TitleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    
    local TabContainer = Create("Frame", {
        Size = UDim2.new(0, 65, 1, -19),
        Position = UDim2.new(0, 0, 0, 18),
        BackgroundColor3 = Colors.Secondary,
        BorderSizePixel = 0,
        Parent = MainFrame
    })
    
    local TabList = Create("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        Parent = TabContainer
    })
    
    local TabListLayout = Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 1),
        Parent = TabList
    })
    
    local ContentContainer = Create("Frame", {
        Size = UDim2.new(1, -66, 1, -19),
        Position = UDim2.new(0, 66, 0, 18),
        BackgroundColor3 = Colors.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = MainFrame
    })
    
    local Tabs = {}
    local CurrentTab = nil
    
    function Window:CreateTab(tabName)
        tabName = tabName or "Tab"
        local Tab = {}
        
        local TabButton = Create("TextButton", {
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundColor3 = Colors.Secondary,
            BorderSizePixel = 0,
            Text = tabName,
            TextColor3 = Colors.TextDark,
            TextSize = 9,
            Font = Enum.Font.SourceSans,
            Parent = TabList
        })
        
        local TabContent = Create("ScrollingFrame", {
            Size = UDim2.new(1, -2, 1, -2),
            Position = UDim2.new(0, 1, 0, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = Colors.Border,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            Visible = false,
            Parent = ContentContainer
        })
        
        local ContentLayout = Create("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 2),
            Parent = TabContent
        })
        
        ContentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentLayout.AbsoluteContentSize.Y + 2)
        end)
        
        local function SelectTab()
            for _, t in pairs(Tabs) do
                t.Content.Visible = false
                t.Button.BackgroundColor3 = Colors.Secondary
                t.Button.TextColor3 = Colors.TextDark
            end
            TabContent.Visible = true
            TabButton.BackgroundColor3 = Colors.Background
            TabButton.TextColor3 = Colors.Text
            CurrentTab = Tab
        end
        
        TabButton.MouseButton1Click:Connect(SelectTab)
        
        TabButton.MouseEnter:Connect(function()
            if CurrentTab ~= Tab then
                Tween(TabButton, {BackgroundColor3 = Colors.Hover})
            end
        end)
        
        TabButton.MouseLeave:Connect(function()
            if CurrentTab ~= Tab then
                Tween(TabButton, {BackgroundColor3 = Colors.Secondary})
            end
        end)
        
        TabListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabList.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)
        end)
        
        Tab.Button = TabButton
        Tab.Content = TabContent
        table.insert(Tabs, Tab)
        
        if #Tabs == 1 then
            SelectTab()
        end
        
        function Tab:CreateSection(name)
            local SectionFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 14),
                BackgroundColor3 = Colors.Tertiary,
                BorderSizePixel = 0,
                Parent = TabContent
            })
            AddCorner(SectionFrame, 3)
            
            Create("TextLabel", {
                Size = UDim2.new(1, -4, 1, 0),
                Position = UDim2.new(0, 4, 0, 0),
                BackgroundTransparency = 1,
                Text = name or "Section",
                TextColor3 = Colors.TextDark,
                TextSize = 8,
                Font = Enum.Font.SourceSansBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = SectionFrame
            })
        end
        
        function Tab:CreateButton(config)
            config = config or {}
            local text = config.Text or "Button"
            local callback = config.Callback or function() end
            
            local BtnFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 18),
                BackgroundColor3 = Colors.Secondary,
                BorderSizePixel = 0,
                Parent = TabContent
            })
            AddCorner(BtnFrame, 3)
            
            local Btn = Create("TextButton", {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                Parent = BtnFrame
            })
            
            Btn.MouseEnter:Connect(function()
                Tween(BtnFrame, {BackgroundColor3 = Colors.Hover})
            end)
            
            Btn.MouseLeave:Connect(function()
                Tween(BtnFrame, {BackgroundColor3 = Colors.Secondary})
            end)
            
            Btn.MouseButton1Click:Connect(function()
                Tween(BtnFrame, {BackgroundColor3 = Colors.Accent})
                task.wait(0.08)
                Tween(BtnFrame, {BackgroundColor3 = Colors.Hover})
                callback()
            end)
        end
        
        function Tab:CreateToggle(config)
            config = config or {}
            local text = config.Text or "Toggle"
            local default = config.Default or false
            local callback = config.Callback or function() end
            
            local toggled = default
            
            local ToggleFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 18),
                BackgroundColor3 = Colors.Secondary,
                BorderSizePixel = 0,
                Parent = TabContent
            })
            AddCorner(ToggleFrame, 3)
            
            Create("TextLabel", {
                Size = UDim2.new(1, -24, 1, 0),
                Position = UDim2.new(0, 5, 0, 0),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = ToggleFrame
            })
            
            local ToggleBox = Create("Frame", {
                Size = UDim2.new(0, 12, 0, 12),
                Position = UDim2.new(1, -15, 0.5, -6),
                BackgroundColor3 = toggled and Colors.Accent or Colors.Tertiary,
                BorderSizePixel = 0,
                Parent = ToggleFrame
            })
            AddCorner(ToggleBox, 3)
            
            local ToggleBtn = Create("TextButton", {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = "",
                Parent = ToggleFrame
            })
            
            local function UpdateToggle()
                Tween(ToggleBox, {BackgroundColor3 = toggled and Colors.Accent or Colors.Tertiary})
            end
            
            ToggleBtn.MouseButton1Click:Connect(function()
                toggled = not toggled
                UpdateToggle()
                callback(toggled)
            end)
            
            ToggleBtn.MouseEnter:Connect(function()
                Tween(ToggleFrame, {BackgroundColor3 = Colors.Hover})
            end)
            
            ToggleBtn.MouseLeave:Connect(function()
                Tween(ToggleFrame, {BackgroundColor3 = Colors.Secondary})
            end)
            
            local obj = {}
            function obj:Set(v)
                toggled = v
                UpdateToggle()
                callback(toggled)
            end
            return obj
        end
        
        function Tab:CreateSlider(config)
            config = config or {}
            local text = config.Text or "Slider"
            local min = config.Min or 0
            local max = config.Max or 100
            local default = config.Default or min
            local callback = config.Callback or function() end
            
            local value = default
            
            local SliderFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 28),
                BackgroundColor3 = Colors.Secondary,
                BorderSizePixel = 0,
                Parent = TabContent
            })
            AddCorner(SliderFrame, 3)
            
            Create("TextLabel", {
                Size = UDim2.new(1, -30, 0, 14),
                Position = UDim2.new(0, 5, 0, 0),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = SliderFrame
            })
            
            local ValueLabel = Create("TextLabel", {
                Size = UDim2.new(0, 25, 0, 14),
                Position = UDim2.new(1, -28, 0, 0),
                BackgroundTransparency = 1,
                Text = tostring(value),
                TextColor3 = Colors.TextDark,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                Parent = SliderFrame
            })
            
            local SliderBar = Create("Frame", {
                Size = UDim2.new(1, -10, 0, 4),
                Position = UDim2.new(0, 5, 0, 18),
                BackgroundColor3 = Colors.Tertiary,
                BorderSizePixel = 0,
                Parent = SliderFrame
            })
            AddCorner(SliderBar, 2)
            
            local SliderFill = Create("Frame", {
                Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
                BackgroundColor3 = Colors.Accent,
                BorderSizePixel = 0,
                Parent = SliderBar
            })
            AddCorner(SliderFill, 2)
            
            local SliderBtn = Create("TextButton", {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text = "",
                Parent = SliderBar
            })
            
            local dragging = false
            
            local function Update(input)
                local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
                value = math.floor(min + (max - min) * pos)
                SliderFill.Size = UDim2.new(pos, 0, 1, 0)
                ValueLabel.Text = tostring(value)
                callback(value)
            end
            
            SliderBtn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    Update(input)
                end
            end)
            
            SliderBtn.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    Update(input)
                end
            end)
            
            local obj = {}
            function obj:Set(v)
                value = math.clamp(v, min, max)
                local pos = (value - min) / (max - min)
                SliderFill.Size = UDim2.new(pos, 0, 1, 0)
                ValueLabel.Text = tostring(value)
                callback(value)
            end
            return obj
        end
        
        function Tab:CreateTextBox(config)
            config = config or {}
            local text = config.Text or "Input"
            local placeholder = config.Placeholder or "..."
            local callback = config.Callback or function() end
            
            local TBFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 18),
                BackgroundColor3 = Colors.Secondary,
                BorderSizePixel = 0,
                Parent = TabContent
            })
            AddCorner(TBFrame, 3)
            
            Create("TextLabel", {
                Size = UDim2.new(0.4, 0, 1, 0),
                Position = UDim2.new(0, 5, 0, 0),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = TBFrame
            })
            
            local InputBox = Create("TextBox", {
                Size = UDim2.new(0.55, -5, 0, 14),
                Position = UDim2.new(0.45, 0, 0.5, -7),
                BackgroundColor3 = Colors.Tertiary,
                BorderSizePixel = 0,
                Text = "",
                PlaceholderText = placeholder,
                PlaceholderColor3 = Colors.TextDark,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                ClearTextOnFocus = false,
                Parent = TBFrame
            })
            AddCorner(InputBox, 3)
            
            InputBox.FocusLost:Connect(function(enter)
                if enter then callback(InputBox.Text) end
            end)
            
            return InputBox
        end
        
        function Tab:CreateDropdown(config)
            config = config or {}
            local text = config.Text or "Dropdown"
            local options = config.Options or {}
            local default = config.Default or (options[1] or "")
            local callback = config.Callback or function() end
            
            local selected = default
            local opened = false
            
            local DDFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 18),
                BackgroundColor3 = Colors.Secondary,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                Parent = TabContent
            })
            AddCorner(DDFrame, 3)
            
            Create("TextLabel", {
                Size = UDim2.new(0.4, 0, 0, 18),
                Position = UDim2.new(0, 5, 0, 0),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = DDFrame
            })
            
            local DDBtn = Create("TextButton", {
                Size = UDim2.new(0.55, -5, 0, 14),
                Position = UDim2.new(0.45, 0, 0, 2),
                BackgroundColor3 = Colors.Tertiary,
                BorderSizePixel = 0,
                Text = selected,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                Parent = DDFrame
            })
            AddCorner(DDBtn, 3)
            
            local OptContainer = Create("Frame", {
                Size = UDim2.new(0.55, -5, 0, #options * 16),
                Position = UDim2.new(0.45, 0, 0, 18),
                BackgroundColor3 = Colors.Tertiary,
                BorderSizePixel = 0,
                Visible = false,
                Parent = DDFrame
            })
            AddCorner(OptContainer, 3)
            
            Create("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Parent = OptContainer
            })
            
            local function Toggle()
                opened = not opened
                OptContainer.Visible = opened
                DDFrame.Size = opened and UDim2.new(1, -2, 0, 20 + #options * 16) or UDim2.new(1, -2, 0, 18)
            end
            
            DDBtn.MouseButton1Click:Connect(Toggle)
            
            for _, opt in ipairs(options) do
                local OptBtn = Create("TextButton", {
                    Size = UDim2.new(1, 0, 0, 16),
                    BackgroundColor3 = Colors.Tertiary,
                    BorderSizePixel = 0,
                    Text = opt,
                    TextColor3 = Colors.Text,
                    TextSize = 9,
                    Font = Enum.Font.SourceSans,
                    Parent = OptContainer
                })
                AddCorner(OptBtn, 2)
                
                OptBtn.MouseEnter:Connect(function()
                    Tween(OptBtn, {BackgroundColor3 = Colors.Hover})
                end)
                
                OptBtn.MouseLeave:Connect(function()
                    Tween(OptBtn, {BackgroundColor3 = Colors.Tertiary})
                end)
                
                OptBtn.MouseButton1Click:Connect(function()
                    selected = opt
                    DDBtn.Text = selected
                    Toggle()
                    callback(selected)
                end)
            end
            
            local obj = {}
            function obj:Set(v)
                if table.find(options, v) then
                    selected = v
                    DDBtn.Text = selected
                    callback(selected)
                end
            end
            return obj
        end
        
        function Tab:CreateKeybind(config)
            config = config or {}
            local text = config.Text or "Keybind"
            local default = config.Default or Enum.KeyCode.Unknown
            local callback = config.Callback or function() end
            
            local key = default
            local listening = false
            
            local KBFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 18),
                BackgroundColor3 = Colors.Secondary,
                BorderSizePixel = 0,
                Parent = TabContent
            })
            AddCorner(KBFrame, 3)
            
            Create("TextLabel", {
                Size = UDim2.new(0.6, 0, 1, 0),
                Position = UDim2.new(0, 5, 0, 0),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = KBFrame
            })
            
            local KBBtn = Create("TextButton", {
                Size = UDim2.new(0.35, -5, 0, 14),
                Position = UDim2.new(0.65, 0, 0.5, -7),
                BackgroundColor3 = Colors.Tertiary,
                BorderSizePixel = 0,
                Text = key.Name,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                Parent = KBFrame
            })
            AddCorner(KBBtn, 3)
            
            KBBtn.MouseButton1Click:Connect(function()
                listening = true
                KBBtn.Text = "..."
            end)
            
            UserInputService.InputBegan:Connect(function(input, gpe)
                if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                    key = input.KeyCode
                    KBBtn.Text = key.Name
                    listening = false
                elseif input.KeyCode == key and not gpe then
                    callback(key)
                end
            end)
        end
        
        function Tab:CreateLabel(labelText)
            local LFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 14),
                BackgroundColor3 = Colors.Secondary,
                BorderSizePixel = 0,
                Parent = TabContent
            })
            AddCorner(LFrame, 3)
            
            local Label = Create("TextLabel", {
                Size = UDim2.new(1, -6, 1, 0),
                Position = UDim2.new(0, 3, 0, 0),
                BackgroundTransparency = 1,
                Text = labelText or "Label",
                TextColor3 = Colors.TextDark,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = LFrame
            })
            
            local obj = {}
            function obj:Set(t)
                Label.Text = t
            end
            return obj
        end
        
        function Tab:CreateColorPicker(config)
            config = config or {}
            local text = config.Text or "Color"
            local default = config.Default or Color3.fromRGB(255, 255, 255)
            local callback = config.Callback or function() end
            
            local color = default
            local opened = false
            
            local CPFrame = Create("Frame", {
                Size = UDim2.new(1, -2, 0, 18),
                BackgroundColor3 = Colors.Secondary,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                Parent = TabContent
            })
            AddCorner(CPFrame, 3)
            
            Create("TextLabel", {
                Size = UDim2.new(0.6, 0, 0, 18),
                Position = UDim2.new(0, 5, 0, 0),
                BackgroundTransparency = 1,
                Text = text,
                TextColor3 = Colors.Text,
                TextSize = 9,
                Font = Enum.Font.SourceSans,
                TextXAlignment = Enum.TextXAlignment.Left,
                Parent = CPFrame
            })
            
            local Preview = Create("TextButton", {
                Size = UDim2.new(0, 30, 0, 12),
                Position = UDim2.new(1, -35, 0, 3),
                BackgroundColor3 = color,
                BorderSizePixel = 0,
                Text = "",
                Parent = CPFrame
            })
            AddCorner(Preview, 3)
            
            local Picker = Create("Frame", {
                Size = UDim2.new(1, -10, 0, 60),
                Position = UDim2.new(0, 5, 0, 20),
                BackgroundColor3 = Colors.Tertiary,
                BorderSizePixel = 0,
                Visible = false,
                Parent = CPFrame
            })
            AddCorner(Picker, 3)
            
            local r, g, b = math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255)
            
            local function CreateSlider(name, yPos, init, onChange)
                Create("TextLabel", {
                    Size = UDim2.new(0, 12, 0, 16),
                    Position = UDim2.new(0, 3, 0, yPos),
                    BackgroundTransparency = 1,
                    Text = name,
                    TextColor3 = Colors.Text,
                    TextSize = 9,
                    Font = Enum.Font.SourceSans,
                    Parent = Picker
                })
                
                local Bar = Create("Frame", {
                    Size = UDim2.new(1, -50, 0, 6),
                    Position = UDim2.new(0, 18, 0, yPos + 5),
                    BackgroundColor3 = Colors.Background,
                    BorderSizePixel = 0,
                    Parent = Picker
                })
                AddCorner(Bar, 2)
                
                local Fill = Create("Frame", {
                    Size = UDim2.new(init / 255, 0, 1, 0),
                    BackgroundColor3 = Colors.Accent,
                    BorderSizePixel = 0,
                    Parent = Bar
                })
                AddCorner(Fill, 2)
                
                local Val = Create("TextLabel", {
                    Size = UDim2.new(0, 22, 0, 16),
                    Position = UDim2.new(1, -25, 0, yPos),
                    BackgroundTransparency = 1,
                    Text = tostring(init),
                    TextColor3 = Colors.Text,
                    TextSize = 9,
                    Font = Enum.Font.SourceSans,
                    Parent = Picker
                })
                
                local Btn = Create("TextButton", {
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundTransparency = 1,
                    Text = "",
                    Parent = Bar
                })
                
                local drag = false
                
                Btn.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        drag = true
                    end
                end)
                
                Btn.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        drag = false
                    end
                end)
                
                UserInputService.InputChanged:Connect(function(input)
                    if drag and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local pos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
                        local v = math.floor(pos * 255)
                        Fill.Size = UDim2.new(pos, 0, 1, 0)
                        Val.Text = tostring(v)
                        onChange(v)
                    end
                end)
            end
            
            CreateSlider("R", 2, r, function(v)
                r = v
                color = Color3.fromRGB(r, g, b)
                Preview.BackgroundColor3 = color
                callback(color)
            end)
            
            CreateSlider("G", 20, g, function(v)
                g = v
                color = Color3.fromRGB(r, g, b)
                Preview.BackgroundColor3 = color
                callback(color)
            end)
            
            CreateSlider("B", 38, b, function(v)
                b = v
                color = Color3.fromRGB(r, g, b)
                Preview.BackgroundColor3 = color
                callback(color)
            end)
            
            Preview.MouseButton1Click:Connect(function()
                opened = not opened
                Picker.Visible = opened
                CPFrame.Size = opened and UDim2.new(1, -2, 0, 85) or UDim2.new(1, -2, 0, 18)
            end)
        end
        
        return Tab
    end
    
    function Window:Notify(config)
        config = config or {}
        local title = config.Title or "Notice"
        local text = config.Text or ""
        local duration = config.Duration or 3
        
        local NFrame = Create("Frame", {
            Size = UDim2.new(0, 150, 0, 40),
            Position = UDim2.new(1, -155, 1, 0),
            BackgroundColor3 = Colors.Background,
            BorderSizePixel = 1,
            BorderColor3 = Colors.Border,
            Parent = ScreenGui
        })
        
        Create("TextLabel", {
            Size = UDim2.new(1, -4, 0, 14),
            Position = UDim2.new(0, 2, 0, 1),
            BackgroundTransparency = 1,
            Text = title,
            TextColor3 = Colors.Text,
            TextSize = 9,
            Font = Enum.Font.SourceSansBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            Parent = NFrame
        })
        
        Create("TextLabel", {
            Size = UDim2.new(1, -4, 0, 24),
            Position = UDim2.new(0, 2, 0, 14),
            BackgroundTransparency = 1,
            Text = text,
            TextColor3 = Colors.TextDark,
            TextSize = 9,
            Font = Enum.Font.SourceSans,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            TextWrapped = true,
            Parent = NFrame
        })
        
        Tween(NFrame, {Position = UDim2.new(1, -155, 1, -45)}, 0.25)
        
        task.delay(duration, function()
            Tween(NFrame, {Position = UDim2.new(1, -155, 1, 0)}, 0.25)
            task.wait(0.25)
            NFrame:Destroy()
        end)
    end
    
    return Window
end

return UILib
