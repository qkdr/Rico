--[[
    ╔══════════════════════════════════════════════════════════╗
    ║          Premium Script Hub - Lua UI Library            ║
    ║                  نظام واجهة فخم واحترافي                 ║
    ╚══════════════════════════════════════════════════════════╝
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local PremiumUI = {}
PremiumUI.__index = PremiumUI

-- ═══════════════════════════════════════════════════════════
--                    الألوان الفخمة
-- ═══════════════════════════════════════════════════════════
local Colors = {
    Primary = Color3.fromRGB(88, 101, 242),      -- بنفسجي فخم
    Secondary = Color3.fromRGB(114, 137, 218),   -- أزرق ناعم
    Background = Color3.fromRGB(32, 34, 37),     -- خلفية داكنة
    Surface = Color3.fromRGB(47, 49, 54),        -- سطح متوسط
    Success = Color3.fromRGB(67, 181, 129),      -- أخضر نجاح
    Warning = Color3.fromRGB(250, 166, 26),      -- برتقالي تحذير
    Error = Color3.fromRGB(240, 71, 71),         -- أحمر خطأ
    Text = Color3.fromRGB(255, 255, 255),        -- نص أبيض
    TextSecondary = Color3.fromRGB(185, 187, 190) -- نص ثانوي
}

-- ═══════════════════════════════════════════════════════════
--                    أيقونات فخمة (Lucide Icons)
-- ═══════════════════════════════════════════════════════════
local Icons = {
    Search = "rbxassetid://7072719338",
    Play = "rbxassetid://7072717643",
    Users = "rbxassetid://7072718006",
    Check = "rbxassetid://7072706796",
    Star = "rbxassetid://7072718799",
    Home = "rbxassetid://7072717159",
    Settings = "rbxassetid://7072718900",
    Close = "rbxassetid://7072725342",
    ChevronRight = "rbxassetid://7072706935",
    Map = "rbxassetid://7072718661"
}

-- ═══════════════════════════════════════════════════════════
--                    نظام الإشعارات الفخم
-- ═══════════════════════════════════════════════════════════
function PremiumUI:CreateNotification(title, message, notifType, duration)
    duration = duration or 5
    
    local NotificationContainer = Instance.new("ScreenGui")
    NotificationContainer.Name = "PremiumNotification"
    NotificationContainer.Parent = CoreGui
    NotificationContainer.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 350, 0, 100)
    NotifFrame.Position = UDim2.new(1, -370, 0, 20)
    NotifFrame.BackgroundColor3 = Colors.Surface
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = NotificationContainer
    NotifFrame.ClipsDescendants = true
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = NotifFrame
    
    local UIShadow = Instance.new("ImageLabel")
    UIShadow.Name = "Shadow"
    UIShadow.BackgroundTransparency = 1
    UIShadow.Position = UDim2.new(0, -15, 0, -15)
    UIShadow.Size = UDim2.new(1, 30, 1, 30)
    UIShadow.ZIndex = 0
    UIShadow.Image = "rbxassetid://6014261993"
    UIShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    UIShadow.ImageTransparency = 0.5
    UIShadow.ScaleType = Enum.ScaleType.Slice
    UIShadow.SliceCenter = Rect.new(49, 49, 450, 450)
    UIShadow.Parent = NotifFrame
    
    local AccentLine = Instance.new("Frame")
    AccentLine.Size = UDim2.new(0, 4, 1, 0)
    AccentLine.Position = UDim2.new(0, 0, 0, 0)
    AccentLine.BorderSizePixel = 0
    AccentLine.Parent = NotifFrame
    
    if notifType == "success" then
        AccentLine.BackgroundColor3 = Colors.Success
    elseif notifType == "warning" then
        AccentLine.BackgroundColor3 = Colors.Warning
    elseif notifType == "error" then
        AccentLine.BackgroundColor3 = Colors.Error
    else
        AccentLine.BackgroundColor3 = Colors.Primary
    end
    
    local IconFrame = Instance.new("ImageLabel")
    IconFrame.Size = UDim2.new(0, 32, 0, 32)
    IconFrame.Position = UDim2.new(0, 20, 0.5, -16)
    IconFrame.BackgroundTransparency = 1
    IconFrame.ImageColor3 = AccentLine.BackgroundColor3
    IconFrame.Image = notifType == "success" and Icons.Check or Icons.Star
    IconFrame.Parent = NotifFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -70, 0, 25)
    TitleLabel.Position = UDim2.new(0, 60, 0, 15)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Colors.Text
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = NotifFrame
    
    local MessageLabel = Instance.new("TextLabel")
    MessageLabel.Size = UDim2.new(1, -70, 0, 45)
    MessageLabel.Position = UDim2.new(0, 60, 0, 40)
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Text = message
    MessageLabel.TextColor3 = Colors.TextSecondary
    MessageLabel.TextSize = 13
    MessageLabel.Font = Enum.Font.Gotham
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
    MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
    MessageLabel.TextWrapped = true
    MessageLabel.Parent = NotifFrame
    
    -- أنيميشن الدخول
    NotifFrame.Position = UDim2.new(1, 0, 0, 20)
    local slideIn = TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -370, 0, 20)
    })
    slideIn:Play()
    
    -- أنيميشن الخروج
    wait(duration)
    local slideOut = TweenService:Create(NotifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(1, 0, 0, 20)
    })
    slideOut:Play()
    slideOut.Completed:Connect(function()
        NotificationContainer:Destroy()
    end)
end

-- ═══════════════════════════════════════════════════════════
--                    إنشاء الواجهة الرئيسية
-- ═══════════════════════════════════════════════════════════
function PremiumUI:CreateWindow(scriptName)
    local PremiumHub = {}
    
    -- إنشاء ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "PremiumScriptHub"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    -- الإطار الرئيسي
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 800, 0, 550)
    MainFrame.Position = UDim2.new(0.5, -400, 0.5, -275)
    MainFrame.BackgroundColor3 = Colors.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    MainFrame.ClipsDescendants = true
    
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 16)
    MainCorner.Parent = MainFrame
    
    -- ظل فخم
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0, -20, 0, -20)
    Shadow.Size = UDim2.new(1, 40, 1, 40)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://6014261993"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 0.3
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    Shadow.Parent = MainFrame
    
    -- شريط العنوان
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 60)
    TitleBar.BackgroundColor3 = Colors.Surface
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 16)
    TitleCorner.Parent = TitleBar
    
    local TitleFix = Instance.new("Frame")
    TitleFix.Size = UDim2.new(1, 0, 0, 16)
    TitleFix.Position = UDim2.new(0, 0, 1, -16)
    TitleFix.BackgroundColor3 = Colors.Surface
    TitleFix.BorderSizePixel = 0
    TitleFix.Parent = TitleBar
    
    -- أيقونة السكربت
    local ScriptIcon = Instance.new("ImageLabel")
    ScriptIcon.Size = UDim2.new(0, 32, 0, 32)
    ScriptIcon.Position = UDim2.new(0, 20, 0.5, -16)
    ScriptIcon.BackgroundTransparency = 1
    ScriptIcon.Image = Icons.Star
    ScriptIcon.ImageColor3 = Colors.Primary
    ScriptIcon.Parent = TitleBar
    
    -- اسم السكربت
    local ScriptTitle = Instance.new("TextLabel")
    ScriptTitle.Size = UDim2.new(0, 300, 1, 0)
    ScriptTitle.Position = UDim2.new(0, 60, 0, 0)
    ScriptTitle.BackgroundTransparency = 1
    ScriptTitle.Text = scriptName
    ScriptTitle.TextColor3 = Colors.Text
    ScriptTitle.TextSize = 20
    ScriptTitle.Font = Enum.Font.GothamBold
    ScriptTitle.TextXAlignment = Enum.TextXAlignment.Left
    ScriptTitle.Parent = TitleBar
    
    -- زر الإغلاق
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 40, 0, 40)
    CloseButton.Position = UDim2.new(1, -50, 0.5, -20)
    CloseButton.BackgroundColor3 = Colors.Error
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = ""
    CloseButton.Parent = TitleBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 10)
    CloseCorner.Parent = CloseButton
    
    local CloseIcon = Instance.new("ImageLabel")
    CloseIcon.Size = UDim2.new(0, 20, 0, 20)
    CloseIcon.Position = UDim2.new(0.5, -10, 0.5, -10)
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Image = Icons.Close
    CloseIcon.ImageColor3 = Colors.Text
    CloseIcon.Parent = CloseButton
    
    CloseButton.MouseButton1Click:Connect(function()
        local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
        closeTween:Play()
        closeTween.Completed:Connect(function()
            ScreenGui:Destroy()
        end)
    end)
    
    -- مربع البحث
    local SearchContainer = Instance.new("Frame")
    SearchContainer.Size = UDim2.new(1, -40, 0, 50)
    SearchContainer.Position = UDim2.new(0, 20, 0, 80)
    SearchContainer.BackgroundColor3 = Colors.Surface
    SearchContainer.BorderSizePixel = 0
    SearchContainer.Parent = MainFrame
    
    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 12)
    SearchCorner.Parent = SearchContainer
    
    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Size = UDim2.new(0, 24, 0, 24)
    SearchIcon.Position = UDim2.new(0, 15, 0.5, -12)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Image = Icons.Search
    SearchIcon.ImageColor3 = Colors.TextSecondary
    SearchIcon.Parent = SearchContainer
    
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(1, -50, 1, 0)
    SearchBox.Position = UDim2.new(0, 50, 0, 0)
    SearchBox.BackgroundTransparency = 1
    SearchBox.PlaceholderText = "ابحث عن السكربتات..."
    SearchBox.PlaceholderColor3 = Colors.TextSecondary
    SearchBox.Text = ""
    SearchBox.TextColor3 = Colors.Text
    SearchBox.TextSize = 15
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.Parent = SearchContainer
    
    -- قائمة الخرائط (ScrollingFrame)
    local MapsContainer = Instance.new("ScrollingFrame")
    MapsContainer.Size = UDim2.new(1, -40, 1, -160)
    MapsContainer.Position = UDim2.new(0, 20, 0, 145)
    MapsContainer.BackgroundTransparency = 1
    MapsContainer.BorderSizePixel = 0
    MapsContainer.ScrollBarThickness = 6
    MapsContainer.ScrollBarImageColor3 = Colors.Primary
    MapsContainer.Parent = MainFrame
    
    local MapsLayout = Instance.new("UIGridLayout")
    MapsLayout.CellSize = UDim2.new(0, 240, 0, 280)
    MapsLayout.CellPadding = UDim2.new(0, 15, 0, 15)
    MapsLayout.SortOrder = Enum.SortOrder.Name
    MapsLayout.Parent = MapsContainer
    
    -- أنيميشن الفتح
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 800, 0, 550),
        Position = UDim2.new(0.5, -400, 0.5, -275)
    })
    openTween:Play()
    
    -- وظيفة إضافة خريطة
    function PremiumHub:AddMap(mapData)
        local MapCard = Instance.new("Frame")
        MapCard.Name = mapData.name
        MapCard.BackgroundColor3 = Colors.Surface
        MapCard.BorderSizePixel = 0
        MapCard.Parent = MapsContainer
        
        local CardCorner = Instance.new("UICorner")
        CardCorner.CornerRadius = UDim.new(0, 12)
        CardCorner.Parent = MapCard
        
        -- صورة الخريطة
        local MapImage = Instance.new("ImageLabel")
        MapImage.Size = UDim2.new(1, 0, 0, 140)
        MapImage.BackgroundColor3 = Colors.Background
        MapImage.BorderSizePixel = 0
        MapImage.Image = mapData.image or Icons.Map
        MapImage.ScaleType = Enum.ScaleType.Crop
        MapImage.Parent = MapCard
        
        local ImageCorner = Instance.new("UICorner")
        ImageCorner.CornerRadius = UDim.new(0, 12)
        ImageCorner.Parent = MapImage
        
        -- اسم الخريطة
        local MapName = Instance.new("TextLabel")
        MapName.Size = UDim2.new(1, -20, 0, 30)
        MapName.Position = UDim2.new(0, 10, 0, 150)
        MapName.BackgroundTransparency = 1
        MapName.Text = mapData.name
        MapName.TextColor3 = Colors.Text
        MapName.TextSize = 16
        MapName.Font = Enum.Font.GothamBold
        MapName.TextXAlignment = Enum.TextXAlignment.Left
        MapName.Parent = MapCard
        
        -- عدد السكربتات
        local ScriptCount = Instance.new("TextLabel")
        ScriptCount.Size = UDim2.new(1, -20, 0, 20)
        ScriptCount.Position = UDim2.new(0, 10, 0, 185)
        ScriptCount.BackgroundTransparency = 1
        ScriptCount.Text = "السكربتات: " .. (mapData.scriptCount or 0)
        ScriptCount.TextColor3 = Colors.TextSecondary
        ScriptCount.TextSize = 13
        ScriptCount.Font = Enum.Font.Gotham
        ScriptCount.TextXAlignment = Enum.TextXAlignment.Left
        ScriptCount.Parent = MapCard
        
        -- زر الدخول
        local EnterButton = Instance.new("TextButton")
        EnterButton.Size = UDim2.new(1, -20, 0, 40)
        EnterButton.Position = UDim2.new(0, 10, 1, -50)
        EnterButton.BackgroundColor3 = Colors.Primary
        EnterButton.BorderSizePixel = 0
        EnterButton.Text = ""
        EnterButton.Parent = MapCard
        
        local ButtonCorner = Instance.new("UICorner")
        ButtonCorner.CornerRadius = UDim.new(0, 10)
        ButtonCorner.Parent = EnterButton
        
        local ButtonIcon = Instance.new("ImageLabel")
        ButtonIcon.Size = UDim2.new(0, 20, 0, 20)
        ButtonIcon.Position = UDim2.new(0, 15, 0.5, -10)
        ButtonIcon.BackgroundTransparency = 1
        ButtonIcon.Image = Icons.ChevronRight
        ButtonIcon.ImageColor3 = Colors.Text
        ButtonIcon.Parent = EnterButton
        
        local ButtonText = Instance.new("TextLabel")
        ButtonText.Size = UDim2.new(1, -50, 1, 0)
        ButtonText.Position = UDim2.new(0, 40, 0, 0)
        ButtonText.BackgroundTransparency = 1
        ButtonText.Text = "عرض السكربتات"
        ButtonText.TextColor3 = Colors.Text
        ButtonText.TextSize = 14
        ButtonText.Font = Enum.Font.GothamBold
        ButtonText.TextXAlignment = Enum.TextXAlignment.Left
        ButtonText.Parent = EnterButton
        
        -- أنيميشن الزر
        EnterButton.MouseEnter:Connect(function()
            TweenService:Create(EnterButton, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Secondary}):Play()
        end)
        
        EnterButton.MouseLeave:Connect(function()
            TweenService:Create(EnterButton, TweenInfo.new(0.2), {BackgroundColor3 = Colors.Primary}):Play()
        end)
        
        EnterButton.MouseButton1Click:Connect(function()
            self:OpenScriptsList(mapData)
        end)
        
        MapsContainer.CanvasSize = UDim2.new(0, 0, 0, MapsLayout.AbsoluteContentSize.Y + 10)
    end
    
    -- وظيفة فتح قائمة السكربتات
    function PremiumHub:OpenScriptsList(mapData)
        local ScriptsGui = Instance.new("ScreenGui")
        ScriptsGui.Name = "ScriptsList"
        ScriptsGui.Parent = CoreGui
        ScriptsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        local ScriptsFrame = Instance.new("Frame")
        ScriptsFrame.Size = UDim2.new(0, 700, 0, 500)
        ScriptsFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
        ScriptsFrame.BackgroundColor3 = Colors.Background
        ScriptsFrame.BorderSizePixel = 0
        ScriptsFrame.Parent = ScriptsGui
        
        local FrameCorner = Instance.new("UICorner")
        FrameCorner.CornerRadius = UDim.new(0, 16)
        FrameCorner.Parent = ScriptsFrame
        
        -- شريط العنوان
        local Header = Instance.new("Frame")
        Header.Size = UDim2.new(1, 0, 0, 60)
        Header.BackgroundColor3 = Colors.Surface
        Header.BorderSizePixel = 0
        Header.Parent = ScriptsFrame
        
        local HeaderCorner = Instance.new("UICorner")
        HeaderCorner.CornerRadius = UDim.new(0, 16)
        HeaderCorner.Parent = Header
        
        local HeaderTitle = Instance.new("TextLabel")
        HeaderTitle.Size = UDim2.new(1, -100, 1, 0)
        HeaderTitle.Position = UDim2.new(0, 20, 0, 0)
        HeaderTitle.BackgroundTransparency = 1
        HeaderTitle.Text = "سكربتات: " .. mapData.name
        HeaderTitle.TextColor3 = Colors.Text
        HeaderTitle.TextSize = 18
        HeaderTitle.Font = Enum.Font.GothamBold
        HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
        HeaderTitle.Parent = Header
        
        local BackButton = Instance.new("TextButton")
        BackButton.Size = UDim2.new(0, 40, 0, 40)
        BackButton.Position = UDim2.new(1, -50, 0.5, -20)
        BackButton.BackgroundColor3 = Colors.Primary
        BackButton.BorderSizePixel = 0
        BackButton.Text = "×"
        BackButton.TextColor3 = Colors.Text
        BackButton.TextSize = 24
        BackButton.Font = Enum.Font.GothamBold
        BackButton.Parent = Header
        
        local BackCorner = Instance.new("UICorner")
        BackCorner.CornerRadius = UDim.new(0, 10)
        BackCorner.Parent = BackButton
        
        BackButton.MouseButton1Click:Connect(function()
            ScriptsGui:Destroy()
        end)
        
        -- قائمة السكربتات
        local ScriptsList = Instance.new("ScrollingFrame")
        ScriptsList.Size = UDim2.new(1, -40, 1, -100)
        ScriptsList.Position = UDim2.new(0, 20, 0, 75)
        ScriptsList.BackgroundTransparency = 1
        ScriptsList.BorderSizePixel = 0
        ScriptsList.ScrollBarThickness = 6
        ScriptsList.ScrollBarImageColor3 = Colors.Primary
        ScriptsList.Parent = ScriptsFrame
        
        local ListLayout = Instance.new("UIListLayout")
        ListLayout.Padding = UDim.new(0, 10)
        ListLayout.SortOrder = Enum.SortOrder.Name
        ListLayout.Parent = ScriptsList
        
        -- إضافة السكربتات
        if mapData.scripts then
            for _, script in pairs(mapData.scripts) do
                local ScriptItem = Instance.new("Frame")
                ScriptItem.Size = UDim2.new(1, 0, 0, 80)
                ScriptItem.BackgroundColor3 = Colors.Surface
                ScriptItem.BorderSizePixel = 0
                ScriptItem.Parent = ScriptsList
                
                local ItemCorner = Instance.new("UICorner")
                ItemCorner.CornerRadius = UDim.new(0, 12)
                ItemCorner.Parent = ScriptItem
                
                local ScriptName = Instance.new("TextLabel")
                ScriptName.Size = UDim2.new(0.6, 0, 0, 25)
                ScriptName.Position = UDim2.new(0, 15, 0, 15)
                ScriptName.BackgroundTransparency = 1
                ScriptName.Text = script.name
                ScriptName.TextColor3 = Colors.Text
                ScriptName.TextSize = 16
                ScriptName.Font = Enum.Font.GothamBold
                ScriptName.TextXAlignment = Enum.TextXAlignment.Left
                ScriptName.Parent = ScriptItem
                
                local UserCount = Instance.new("Frame")
                UserCount.Size = UDim2.new(0, 100, 0, 30)
                UserCount.Position = UDim2.new(0, 15, 1, -40)
                UserCount.BackgroundColor3 = Colors.Background
                UserCount.BorderSizePixel = 0
                UserCount.Parent = ScriptItem
                
                local CountCorner = Instance.new("UICorner")
                CountCorner.CornerRadius = UDim.new(0, 8)
                CountCorner.Parent = UserCount
                
                local UserIcon = Instance.new("ImageLabel")
                UserIcon.Size = UDim2.new(0, 18, 0, 18)
                UserIcon.Position = UDim2.new(0, 8, 0.5, -9)
                UserIcon.BackgroundTransparency = 1
                UserIcon.Image = Icons.Users
                UserIcon.ImageColor3 = Colors.Primary
                UserIcon.Parent = UserCount
                
                local CountText = Instance.new("TextLabel")
                CountText.Size = UDim2.new(1, -35, 1, 0)
                CountText.Position = UDim2.new(0, 30, 0, 0)
                CountText.BackgroundTransparency = 1
                CountText.Text = tostring(script.users or 0)
                CountText.TextColor3 = Colors.Text
                CountText.TextSize = 13
                CountText.Font = Enum.Font.GothamBold
                CountText.TextXAlignment = Enum.TextXAlignment.Left
                CountText.Parent = UserCount
                
                local ExecuteButton = Instance.new("TextButton")
                ExecuteButton.Size = UDim2.new(0, 140, 0, 45)
                ExecuteButton.Position = UDim2.new(1, -155, 0.5, -22.5)
                ExecuteButton.BackgroundColor3 = Colors.Success
                ExecuteButton.BorderSizePixel = 0
                ExecuteButton.Text = ""
                ExecuteButton.Parent = ScriptItem
                
                local ExecCorner = Instance.new("UICorner")
                ExecCorner.CornerRadius = UDim.new(0, 10)
                ExecCorner.Parent = ExecuteButton
                
                local ExecIcon = Instance.new("ImageLabel")
                ExecIcon.Size = UDim2.new(0, 20, 0, 20)
                ExecIcon.Position = UDim2.new(0, 15, 0.5, -10)
                ExecIcon.BackgroundTransparency = 1
                ExecIcon.Image = Icons.Play
                ExecIcon.ImageColor3 = Colors.Text
                ExecIcon.Parent = ExecuteButton
                
                local ExecText = Instance.new("TextLabel")
                ExecText.Size = UDim2.new(1, -50, 1, 0)
                ExecText.Position = UDim2.new(0, 40, 0, 0)
                ExecText.BackgroundTransparency = 1
                ExecText.Text = "تفعيل"
                ExecText.TextColor3 = Colors.Text
                ExecText.TextSize = 15
                ExecText.Font = Enum.Font.GothamBold
                ExecText.TextXAlignment = Enum.TextXAlignment.Left
                ExecText.Parent = ExecuteButton
                
                ExecuteButton.MouseButton1Click:Connect(function()
                    if script.loadstring then
                        loadstring(script.loadstring)()
                        PremiumUI:CreateNotification(
                            "تم التفعيل!",
                            "تم تفعيل سكربت: " .. script.name,
                            "success",
                            3
                        )
                    end
                end)
            end
            
            ScriptsList.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 10)
        end
        
        -- أنيميشن الفتح
        ScriptsFrame.Size = UDim2.new(0, 0, 0, 0)
        ScriptsFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
        
        local openTween = TweenService:Create(ScriptsFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 700, 0, 500),
            Position = UDim2.new(0.5, -350, 0.5, -250)
        })
        openTween:Play()
    end
    
    -- نظام البحث
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = SearchBox.Text:lower()
        for _, mapCard in pairs(MapsContainer:GetChildren()) do
            if mapCard:IsA("Frame") then
                if searchText == "" or mapCard.Name:lower():find(searchText) then
                    mapCard.Visible = true
                else
                    mapCard.Visible = false
                end
            end
        end
    end)
    
    return PremiumHub
end

return PremiumUI
