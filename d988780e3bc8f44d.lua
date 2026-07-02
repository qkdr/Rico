--[[
    UILibrary.lua
    مكتبة واجهة مستخدم بسيطة لروبلوكس - نافذة + تابات + أزرار
    مبنية من الصفر - لا تحتوي على أي أدوات استغلال أو استهداف لاعبين
    الاستخدام: ضع هذا الملف كـ LocalScript أو استدعِه كـ ModuleScript
--]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Library = {}
Library.__index = Library

-- ==========================================================
-- إنشاء نافذة جديدة
-- Params:
--   title (string)      : عنوان النافذة
--   toggleKey (Enum.KeyCode, اختياري) : الزر لإخفاء/إظهار الواجهة (افتراضي: V)
-- ==========================================================
function Library:CreateWindow(title, toggleKey)
    toggleKey = toggleKey or Enum.KeyCode.V

    -- تنظيف أي واجهة سابقة بنفس الاسم لتفادي التكرار
    for _, gui in pairs(game.CoreGui:GetChildren()) do
        if gui.Name == "UILibraryWindow" or gui.Name == "UILibraryOpenButton" then
            gui:Destroy()
        end
    end

    -- ===================== الحاوية الرئيسية =====================
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UILibraryWindow"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.26, 0, 0.3, 0)
    MainFrame.Size = UDim2.new(0, 440, 0, 300)

    local MainCorner = Instance.new("UICorner")
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = Color3.fromRGB(135, 135, 135)
    MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    MainStroke.Parent = MainFrame

    -- ===================== شريط العنوان =====================
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Parent = MainFrame
    TitleBar.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    TitleBar.BorderSizePixel = 0
    TitleBar.Size = UDim2.new(0, 440, 0, 34)

    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 4)
    TitleCorner.Parent = TitleBar

    local TitleStroke = Instance.new("UIStroke")
    TitleStroke.Color = Color3.fromRGB(74, 74, 74)
    TitleStroke.Parent = TitleBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Parent = TitleBar
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0.018, 0, 0, 0)
    TitleLabel.Size = UDim2.new(0, 366, 0, 34)
    TitleLabel.Font = Enum.Font.RobotoCondensed
    TitleLabel.Text = title or "UI Library"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 19
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local CloseButton = Instance.new("ImageButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = TitleBar
    CloseButton.BackgroundTransparency = 1
    CloseButton.Position = UDim2.new(0.936, 0, 0.235, 0)
    CloseButton.Size = UDim2.new(0, 17, 0, 17)
    CloseButton.Image = "rbxassetid://11293981586"

    CloseButton.MouseButton1Down:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(200, 60, 60)}):Play()
    end)
    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(CloseButton, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(255, 255, 255)}):Play()
    end)

    -- ===================== شريط التابات =====================
    local TabsFrame = Instance.new("Frame")
    TabsFrame.Name = "Tabs"
    TabsFrame.Parent = MainFrame
    TabsFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    TabsFrame.BorderSizePixel = 0
    TabsFrame.Position = UDim2.new(0.018, 0, 0.163, 0)
    TabsFrame.Size = UDim2.new(0, 116, 0, 238)

    local TabsCorner = Instance.new("UICorner")
    TabsCorner.CornerRadius = UDim.new(0, 4)
    TabsCorner.Parent = TabsFrame

    local TabsStroke = Instance.new("UIStroke")
    TabsStroke.Color = Color3.fromRGB(74, 74, 74)
    TabsStroke.Parent = TabsFrame

    local TabsScrolling = Instance.new("ScrollingFrame")
    TabsScrolling.Name = "TabsScrolling"
    TabsScrolling.Parent = TabsFrame
    TabsScrolling.Active = true
    TabsScrolling.BackgroundTransparency = 1
    TabsScrolling.BorderSizePixel = 0
    TabsScrolling.Size = UDim2.new(0, 116, 0, 238)
    TabsScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabsScrolling.ScrollBarThickness = 4

    local TabsListLayout = Instance.new("UIListLayout")
    TabsListLayout.Parent = TabsScrolling
    TabsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabsListLayout.Padding = UDim.new(0, 5)

    -- ===================== منطقة الصفحات =====================
    local PagesFrame = Instance.new("Frame")
    PagesFrame.Name = "Pages"
    PagesFrame.Parent = MainFrame
    PagesFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    PagesFrame.BorderSizePixel = 0
    PagesFrame.Position = UDim2.new(0.302, 0, 0.163, 0)
    PagesFrame.Size = UDim2.new(0, 296, 0, 238)

    local PagesCorner = Instance.new("UICorner")
    PagesCorner.CornerRadius = UDim.new(0, 4)
    PagesCorner.Parent = PagesFrame

    local PagesStroke = Instance.new("UIStroke")
    PagesStroke.Color = Color3.fromRGB(74, 74, 74)
    PagesStroke.Parent = PagesFrame

    -- ===================== زر فتح/إغلاق عائم =====================
    local OpenScreenGui = Instance.new("ScreenGui")
    OpenScreenGui.Name = "UILibraryOpenButton"
    OpenScreenGui.Parent = game.CoreGui
    OpenScreenGui.ResetOnSpawn = false

    local OpenButton = Instance.new("ImageButton")
    OpenButton.Parent = OpenScreenGui
    OpenButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    OpenButton.BackgroundTransparency = 0.65
    OpenButton.Position = UDim2.new(0.1, 0, 0.07, 0)
    OpenButton.Size = UDim2.new(0, 45, 0, 45)
    OpenButton.Image = "rbxassetid://11963368259"
    OpenButton.Draggable = true
    OpenButton.Active = true

    local OpenCorner = Instance.new("UICorner")
    OpenCorner.CornerRadius = UDim.new(0, 50)
    OpenCorner.Parent = OpenButton

    OpenButton.MouseButton1Down:Connect(function()
        MainFrame.Visible = not MainFrame.Visible
    end)

    -- ===================== السحب (Drag) =====================
    local function makeDraggable(frame)
        local dragging, dragInput, dragStart, startPos

        frame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1
                or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = frame.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        frame.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                local newPos = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )
                TweenService:Create(frame, TweenInfo.new(0.15), {Position = newPos}):Play()
            end
        end)
    end

    makeDraggable(TitleBar)

    -- ===================== زر لوحة المفاتيح لإظهار/إخفاء =====================
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == toggleKey then
            MainFrame.Visible = not MainFrame.Visible
        end
    end)

    -- ==========================================================
    -- كائن التاب (Tab)
    -- ==========================================================
    local WindowObj = {}
    WindowObj.__index = WindowObj

    function WindowObj:Tab(tabName, isDefault)
        local TabButton = Instance.new("TextButton")
        TabButton.Parent = TabsScrolling
        TabButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(0, 100, 0, 25)
        TabButton.AutoButtonColor = false
        TabButton.Text = tabName
        TabButton.Font = Enum.Font.RobotoCondensed
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 14

        local TabBtnCorner = Instance.new("UICorner")
        TabBtnCorner.CornerRadius = UDim.new(0, 4)
        TabBtnCorner.Parent = TabButton

        local TabBtnStroke = Instance.new("UIStroke")
        TabBtnStroke.Color = Color3.fromRGB(62, 62, 62)
        TabBtnStroke.Parent = TabButton

        local Page = Instance.new("Frame")
        Page.Parent = PagesFrame
        Page.BackgroundTransparency = 1
        Page.BorderSizePixel = 0
        Page.Size = UDim2.new(0, 296, 0, 238)
        Page.Visible = isDefault or false

        local PageScrolling = Instance.new("ScrollingFrame")
        PageScrolling.Parent = Page
        PageScrolling.Active = true
        PageScrolling.BackgroundTransparency = 1
        PageScrolling.BorderSizePixel = 0
        PageScrolling.Size = UDim2.new(0, 296, 0, 238)
        PageScrolling.CanvasSize = UDim2.new(0, 0, 0, 0)
        PageScrolling.ScrollBarThickness = 4

        local PageListLayout = Instance.new("UIListLayout")
        PageListLayout.Parent = PageScrolling
        PageListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageListLayout.Padding = UDim.new(0, 8)

        local function updateCanvas()
            PageScrolling.CanvasSize = UDim2.new(0, 0, 0, PageListLayout.AbsoluteContentSize.Y + 10)
        end
        PageListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)

        TabButton.MouseButton1Down:Connect(function()
            for _, otherPage in pairs(PagesFrame:GetChildren()) do
                if otherPage:IsA("Frame") then
                    otherPage.Visible = false
                end
            end
            Page.Visible = true

            TweenService:Create(TabBtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(100, 100, 100)}):Play()
            task.wait(0.15)
            TweenService:Create(TabBtnStroke, TweenInfo.new(0.1), {Color = Color3.fromRGB(62, 62, 62)}):Play()
        end)
        TabButton.MouseEnter:Connect(function()
            TweenService:Create(TabBtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(80, 80, 80)}):Play()
        end)
        TabButton.MouseLeave:Connect(function()
            TweenService:Create(TabBtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(62, 62, 62)}):Play()
        end)

        -- ================= عناصر التاب =================
        local TabAPI = {}

        -- --- نص/تسمية ---
        function TabAPI:Label(text)
            local Lbl = Instance.new("TextLabel")
            Lbl.Parent = PageScrolling
            Lbl.BackgroundTransparency = 1
            Lbl.Size = UDim2.new(0, 272, 0, 25)
            Lbl.Font = Enum.Font.RobotoCondensed
            Lbl.Text = text
            Lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
            Lbl.TextSize = 16
            return Lbl
        end

        -- --- زر ضغطة واحدة (Button) ---
        function TabAPI:Button(text, callback)
            callback = callback or function() end

            local Btn = Instance.new("TextButton")
            Btn.Parent = PageScrolling
            Btn.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            Btn.BorderSizePixel = 0
            Btn.Size = UDim2.new(0, 272, 0, 33)
            Btn.AutoButtonColor = false
            Btn.Font = Enum.Font.RobotoCondensed
            Btn.Text = ""
            Btn.TextSize = 14

            local BtnCorner = Instance.new("UICorner")
            BtnCorner.Parent = Btn

            local BtnStroke = Instance.new("UIStroke")
            BtnStroke.Color = Color3.fromRGB(74, 74, 74)
            BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            BtnStroke.Parent = Btn

            local BtnLabel = Instance.new("TextLabel")
            BtnLabel.Parent = Btn
            BtnLabel.BackgroundTransparency = 1
            BtnLabel.Position = UDim2.new(0.05, 0, 0, 0)
            BtnLabel.Size = UDim2.new(0, 228, 1, 0)
            BtnLabel.Font = Enum.Font.RobotoCondensed
            BtnLabel.Text = text
            BtnLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            BtnLabel.TextSize = 17
            BtnLabel.TextXAlignment = Enum.TextXAlignment.Left

            Btn.MouseButton1Down:Connect(function()
                TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(255, 255, 255)}):Play()
                task.wait(0.05)
                TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(74, 74, 74)}):Play()
                pcall(callback)
            end)
            Btn.MouseEnter:Connect(function()
                TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(110, 110, 110)}):Play()
            end)
            Btn.MouseLeave:Connect(function()
                TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(74, 74, 74)}):Play()
            end)

            return Btn
        end

        -- --- زر تفعيل/تعطيل (Toggle) ---
        function TabAPI:Toggle(text, default, callback)
            callback = callback or function() end
            local state = default or false

            local Tgl = Instance.new("TextButton")
            Tgl.Parent = PageScrolling
            Tgl.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            Tgl.BorderSizePixel = 0
            Tgl.Size = UDim2.new(0, 272, 0, 33)
            Tgl.AutoButtonColor = false
            Tgl.Text = ""

            local TglCorner = Instance.new("UICorner")
            TglCorner.Parent = Tgl

            local TglStroke = Instance.new("UIStroke")
            TglStroke.Color = Color3.fromRGB(74, 74, 74)
            TglStroke.Parent = Tgl

            local TglLabel = Instance.new("TextLabel")
            TglLabel.Parent = Tgl
            TglLabel.BackgroundTransparency = 1
            TglLabel.Position = UDim2.new(0.12, 0, 0, 0)
            TglLabel.Size = UDim2.new(0, 200, 1, 0)
            TglLabel.Font = Enum.Font.RobotoCondensed
            TglLabel.Text = text
            TglLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TglLabel.TextSize = 17
            TglLabel.TextXAlignment = Enum.TextXAlignment.Left

            local TglIndicator = Instance.new("Frame")
            TglIndicator.Parent = Tgl
            TglIndicator.AnchorPoint = Vector2.new(0, 0.5)
            TglIndicator.Position = UDim2.new(0.02, 0, 0.5, 0)
            TglIndicator.Size = UDim2.new(0, 20, 0, 20)
            TglIndicator.BackgroundColor3 = state and Color3.fromRGB(0, 211, 0) or Color3.fromRGB(211, 0, 0)

            local TglIndicatorCorner = Instance.new("UICorner")
            TglIndicatorCorner.CornerRadius = UDim.new(1, 0)
            TglIndicatorCorner.Parent = TglIndicator

            local function refresh()
                TweenService:Create(TglIndicator, TweenInfo.new(0.2), {
                    BackgroundColor3 = state and Color3.fromRGB(0, 211, 0) or Color3.fromRGB(211, 0, 0)
                }):Play()
            end

            Tgl.MouseButton1Down:Connect(function()
                state = not state
                refresh()
                pcall(callback, state)
            end)
            Tgl.MouseEnter:Connect(function()
                TweenService:Create(TglStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(100, 100, 100)}):Play()
            end)
            Tgl.MouseLeave:Connect(function()
                TweenService:Create(TglStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(74, 74, 74)}):Play()
            end)

            return {
                Instance = Tgl,
                SetState = function(_, newState)
                    state = newState
                    refresh()
                end,
                GetState = function()
                    return state
                end,
            }
        end

        -- --- سلايدر (مثلاً للسرعة) ---
        function TabAPI:Slider(text, min, max, default, callback)
            callback = callback or function() end
            min, max = tonumber(min) or 0, tonumber(max) or 100
            local value = tonumber(default) or min

            local SliderFrame = Instance.new("Frame")
            SliderFrame.Parent = PageScrolling
            SliderFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            SliderFrame.BorderSizePixel = 0
            SliderFrame.Size = UDim2.new(0, 272, 0, 45)

            local SliderCorner = Instance.new("UICorner")
            SliderCorner.Parent = SliderFrame

            local SliderStroke = Instance.new("UIStroke")
            SliderStroke.Color = Color3.fromRGB(74, 74, 74)
            SliderStroke.Parent = SliderFrame

            local SliderLabel = Instance.new("TextLabel")
            SliderLabel.Parent = SliderFrame
            SliderLabel.BackgroundTransparency = 1
            SliderLabel.Position = UDim2.new(0.07, 0, 0.13, 0)
            SliderLabel.Size = UDim2.new(0, 180, 0, 15)
            SliderLabel.Font = Enum.Font.RobotoCondensed
            SliderLabel.Text = text
            SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderLabel.TextSize = 16
            SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

            local SliderValueLabel = Instance.new("TextLabel")
            SliderValueLabel.Parent = SliderFrame
            SliderValueLabel.BackgroundTransparency = 1
            SliderValueLabel.Position = UDim2.new(0.84, 0, 0.13, 0)
            SliderValueLabel.Size = UDim2.new(0, 32, 0, 15)
            SliderValueLabel.Font = Enum.Font.RobotoCondensed
            SliderValueLabel.Text = tostring(value)
            SliderValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValueLabel.TextSize = 13

            local SliderTrack = Instance.new("TextButton")
            SliderTrack.Parent = SliderFrame
            SliderTrack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SliderTrack.BackgroundTransparency = 1
            SliderTrack.BorderSizePixel = 0
            SliderTrack.Position = UDim2.new(0.066, 0, 0.58, 0)
            SliderTrack.Size = UDim2.new(0, 235, 0, 13)
            SliderTrack.Text = ""

            local SliderTrackCorner = Instance.new("UICorner")
            SliderTrackCorner.Parent = SliderTrack

            local SliderFill = Instance.new("Frame")
            SliderFill.Parent = SliderTrack
            SliderFill.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
            SliderFill.BorderSizePixel = 0
            SliderFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)

            local SliderFillCorner = Instance.new("UICorner")
            SliderFillCorner.Parent = SliderFill

            local function setFromX(xPos)
                local relative = math.clamp((xPos - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
                value = math.floor(min + (max - min) * relative)
                SliderValueLabel.Text = tostring(value)
                SliderFill:TweenSize(UDim2.new(relative, 0, 1, 0), "Out", "Linear", 0.1, true)
                pcall(callback, value)
            end

            local dragging = false
            SliderTrack.MouseButton1Down:Connect(function()
                dragging = true
                local mouse = LocalPlayer:GetMouse()
                setFromX(mouse.X)
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    setFromX(input.Position.X)
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)

            return {
                Instance = SliderFrame,
                SetValue = function(_, newValue)
                    value = math.clamp(newValue, min, max)
                    SliderValueLabel.Text = tostring(value)
                    SliderFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)
                end,
                GetValue = function()
                    return value
                end,
            }
        end

        -- --- صندوق نص (Textbox) ---
        function TabAPI:Textbox(labelText, placeholder, callback)
            callback = callback or function() end

            local BoxFrame = Instance.new("Frame")
            BoxFrame.Parent = PageScrolling
            BoxFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            BoxFrame.BorderSizePixel = 0
            BoxFrame.Size = UDim2.new(0, 272, 0, 45)

            local BoxCorner = Instance.new("UICorner")
            BoxCorner.Parent = BoxFrame

            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = Color3.fromRGB(74, 74, 74)
            BoxStroke.Parent = BoxFrame

            local BoxLabel = Instance.new("TextLabel")
            BoxLabel.Parent = BoxFrame
            BoxLabel.BackgroundTransparency = 1
            BoxLabel.Position = UDim2.new(0.04, 0, 0.24, 0)
            BoxLabel.Size = UDim2.new(0, 137, 0, 22)
            BoxLabel.Font = Enum.Font.RobotoCondensed
            BoxLabel.Text = labelText
            BoxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            BoxLabel.TextSize = 16
            BoxLabel.TextXAlignment = Enum.TextXAlignment.Left

            local TextBox = Instance.new("TextBox")
            TextBox.Parent = BoxFrame
            TextBox.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
            TextBox.BorderSizePixel = 0
            TextBox.Position = UDim2.new(0.577, 0, 0.15, 0)
            TextBox.Size = UDim2.new(0, 103, 0, 31)
            TextBox.Font = Enum.Font.RobotoCondensed
            TextBox.Text = placeholder or ""
            TextBox.PlaceholderText = placeholder or ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 14

            local TBCorner = Instance.new("UICorner")
            TBCorner.Parent = TextBox

            local TBStroke = Instance.new("UIStroke")
            TBStroke.Color = Color3.fromRGB(74, 74, 74)
            TBStroke.Parent = TextBox

            TextBox.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    pcall(callback, TextBox.Text)
                end
            end)

            return TextBox
        end

        -- --- معلومات (Info Card) ---
        function TabAPI:Info(version, status)
            local InfoFrame = Instance.new("Frame")
            InfoFrame.Parent = PageScrolling
            InfoFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            InfoFrame.BorderSizePixel = 0
            InfoFrame.Size = UDim2.new(0, 272, 0, 60)

            local InfoCorner = Instance.new("UICorner")
            InfoCorner.Parent = InfoFrame

            local InfoStroke = Instance.new("UIStroke")
            InfoStroke.Color = Color3.fromRGB(74, 74, 74)
            InfoStroke.Parent = InfoFrame

            local VersionLabel = Instance.new("TextLabel")
            VersionLabel.Parent = InfoFrame
            VersionLabel.BackgroundTransparency = 1
            VersionLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
            VersionLabel.Size = UDim2.new(0, 100, 0, 30)
            VersionLabel.Font = Enum.Font.RobotoCondensed
            VersionLabel.Text = "الإصدار: " .. tostring(version)
            VersionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            VersionLabel.TextSize = 14
            VersionLabel.TextXAlignment = Enum.TextXAlignment.Left

            local StatusLabel = Instance.new("TextLabel")
            StatusLabel.Parent = InfoFrame
            StatusLabel.BackgroundTransparency = 1
            StatusLabel.Position = UDim2.new(0.5, 0, 0.15, 0)
            StatusLabel.Size = UDim2.new(0, 120, 0, 30)
            StatusLabel.Font = Enum.Font.RobotoCondensed
            StatusLabel.Text = "الحالة: " .. tostring(status)
            StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            StatusLabel.TextSize = 14
            StatusLabel.TextXAlignment = Enum.TextXAlignment.Left

            return InfoFrame
        end

        return TabAPI
    end

    return setmetatable(WindowObj, WindowObj)
end

return Library

--[[
    ==================== مثال استخدام ====================

    local Library = loadstring(readfile("UILibrary.lua"))()
    -- أو require() لو استخدمته كـ ModuleScript

    local Window = Library:CreateWindow("مكتبتي")

    local MainTab = Window:Tab("الرئيسية", true)

    MainTab:Label("مرحباً بك في المكتبة")

    MainTab:Button("زر ضغطة واحدة", function()
        print("تم الضغط على الزر!")
    end)

    MainTab:Toggle("تفعيل / تعطيل", false, function(state)
        print("الحالة:", state)
    end)

    MainTab:Slider("السرعة", 0, 100, 16, function(value)
        print("القيمة الحالية:", value)
    end)

    MainTab:Textbox("اسم اللاعب", "اكتب هنا...", function(text)
        print("تم إدخال:", text)
    end)

    MainTab:Info("1.0", "يعمل")

    ========================================================
--]]
