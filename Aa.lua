--[[
    ================================================================
      Ultimate Hub Premium - النسخة الفخمة المطورة
      نظام إشعارات متطور + عداد مستخدمين حقيقي + أزرار فخمة
    ================================================================
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")
local LocalPlayer = Players.LocalPlayer

local UltimateHub = {}
UltimateHub.__index = UltimateHub

-- ================================================================
--                    نظام الأصوات
-- ================================================================
local SoundEffects = {
    Click        = "rbxassetid://6895079853",
    Success      = "rbxassetid://6895079091",
    Error        = "rbxassetid://882376116",
    Notification = "rbxassetid://9126066432",
    Whoosh       = "rbxassetid://9118826269",
    Toggle       = "rbxassetid://6895079853",
    PlayerJoin   = "rbxassetid://9126066432",
}

local function PlaySound(soundId, volume, pitch)
    local ok, sound = pcall(function()
        local s = Instance.new("Sound")
        s.SoundId = soundId
        s.Volume = volume or 0.5
        s.PlaybackSpeed = pitch or 1
        s.Parent = SoundService
        s:Play()
        Debris:AddItem(s, 4)
        return s
    end)
    if ok then return sound end
end

-- ================================================================
--                    نظام الثيمات
-- ================================================================
local Themes = {
    Glass = {
        Name = "زجاجي شفاف",
        Primary = Color3.fromRGB(100, 150, 255),
        Secondary = Color3.fromRGB(150, 100, 255),
        Accent = Color3.fromRGB(80, 200, 255),
        Background = Color3.fromRGB(15, 20, 30),
        Surface = Color3.fromRGB(25, 30, 45),
        Card = Color3.fromRGB(30, 40, 60),
        Success = Color3.fromRGB(46, 213, 115),
        Error = Color3.fromRGB(255, 71, 87),
        Warning = Color3.fromRGB(255, 159, 67),
        Info = Color3.fromRGB(72, 219, 251),
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 190, 210),
        GradientStart = Color3.fromRGB(106, 17, 203),
        GradientEnd = Color3.fromRGB(37, 117, 252),
        Transparency = 0.25,
        GlassBlur = 0.3
    },
    Neon = {
        Name = "نيون متوهج",
        Primary = Color3.fromRGB(255, 0, 255),
        Secondary = Color3.fromRGB(0, 255, 255),
        Accent = Color3.fromRGB(255, 105, 180),
        Background = Color3.fromRGB(8, 8, 15),
        Surface = Color3.fromRGB(15, 15, 25),
        Card = Color3.fromRGB(20, 20, 35),
        Success = Color3.fromRGB(0, 255, 127),
        Error = Color3.fromRGB(255, 0, 100),
        Warning = Color3.fromRGB(255, 215, 0),
        Info = Color3.fromRGB(0, 191, 255),
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 255),
        GradientStart = Color3.fromRGB(255, 0, 255),
        GradientEnd = Color3.fromRGB(0, 255, 255),
        Transparency = 0.2,
        GlassBlur = 0.25
    },
    Royal = {
        Name = "ذهبي ملكي",
        Primary = Color3.fromRGB(255, 215, 0),
        Secondary = Color3.fromRGB(218, 165, 32),
        Accent = Color3.fromRGB(255, 223, 0),
        Background = Color3.fromRGB(12, 8, 20),
        Surface = Color3.fromRGB(25, 18, 35),
        Card = Color3.fromRGB(35, 25, 50),
        Success = Color3.fromRGB(50, 205, 50),
        Error = Color3.fromRGB(220, 20, 60),
        Warning = Color3.fromRGB(255, 140, 0),
        Info = Color3.fromRGB(135, 206, 250),
        TextPrimary = Color3.fromRGB(255, 250, 205),
        TextSecondary = Color3.fromRGB(218, 165, 32),
        GradientStart = Color3.fromRGB(255, 215, 0),
        GradientEnd = Color3.fromRGB(255, 105, 180),
        Transparency = 0.22,
        GlassBlur = 0.28
    }
}

local CurrentTheme = Themes.Glass
local CurrentThemeIndex = 1
local ThemeNames = {"Glass", "Neon", "Royal"}

-- ================================================================
--                    الأيقونات
-- ================================================================
local Icons = {
    Close      = "rbxassetid://7072725342",
    Minimize   = "rbxassetid://7072716830",
    Maximize   = "rbxassetid://7072718230",
    Expand     = "rbxassetid://7072707997",
    Theme      = "rbxassetid://7072718863",
    Menu       = "rbxassetid://7072718409",
    Search     = "rbxassetid://7072719338",
    Play       = "rbxassetid://7072717643",
    Star       = "rbxassetid://7072718799",
    Users      = "rbxassetid://7072718006",
    Check      = "rbxassetid://7072706796",
    Back       = "rbxassetid://7072719070",
    Power      = "rbxassetid://7072706796",
    Info       = "rbxassetid://7072719338",
    UserPlus   = "rbxassetid://7072718006",
    UserMinus  = "rbxassetid://7072725342",
    Shield     = "rbxassetid://7072718799",
    Bell       = "rbxassetid://7072719338",
}

-- ================================================================
--        نظام عدّ المستخدمين الحقيقي (يعمل فعلياً)
--   يزيد الرقم عند تفعيل السكربت، وينقص عند خروج اللاعب
-- ================================================================
local UserDatabase = {
    RegisteredUsers = {},   -- كل من فعّل السكربت من قبل (بيانات دائمة خلال الجلسة)
    ActiveNow = {},         -- قائمة UserId لكل من فعّل السكربت الآن ولم يخرج
    TotalActivations = 0,   -- إجمالي عدد مرات التفعيل (تراكمي)
    PlaceId = game.PlaceId,
}

-- تسجيل بيانات مستخدم فعّل السكربت
local function RegisterUser(userId, username, displayName)
    if not UserDatabase.RegisteredUsers[userId] then
        UserDatabase.RegisteredUsers[userId] = {
            UserId = userId,
            Username = username,
            DisplayName = displayName,
            FirstActivated = os.time(),
            TimesActivated = 1,
        }
        UserDatabase.TotalActivations = UserDatabase.TotalActivations + 1
    else
        UserDatabase.RegisteredUsers[userId].TimesActivated = UserDatabase.RegisteredUsers[userId].TimesActivated + 1
        UserDatabase.TotalActivations = UserDatabase.TotalActivations + 1
    end
end

-- عند تفعيل شخص للسكربت -> يزيد العداد "النشط الآن"
local function ActivateUser(userId, username, displayName)
    if not table.find(UserDatabase.ActiveNow, userId) then
        table.insert(UserDatabase.ActiveNow, userId)
        RegisterUser(userId, username, displayName)
        return true -- تفعيل جديد
    end
    return false -- كان مفعّل أصلاً
end

-- عند خروج لاعب من السيرفر -> ينقص العداد "النشط الآن"
local function DeactivateUser(userId)
    local index = table.find(UserDatabase.ActiveNow, userId)
    if index then
        table.remove(UserDatabase.ActiveNow, index)
        return true
    end
    return false
end

local function GetActiveCount()
    return #UserDatabase.ActiveNow
end

local function GetTotalActivations()
    return UserDatabase.TotalActivations
end

local function GetRegisteredCount()
    local count = 0
    for _ in pairs(UserDatabase.RegisteredUsers) do
        count = count + 1
    end
    return count
end

-- ================================================================
--                    معلومات المطورين
-- ================================================================
local DeveloperInfo = {
    {
        Name = "مطور السكربت",
        Username = "@ScriptDev",
        UserId = 1,
        Rank = "مطور رئيسي",
        Verified = true,
        RankColor = Color3.fromRGB(255, 215, 0)
    }
}

-- ================================================================
--                    وظائف التأثيرات البصرية
-- ================================================================
local function CreateGlassEffect(parent)
    local Glass = Instance.new("Frame")
    Glass.Name = "GlassEffect"
    Glass.Size = UDim2.new(1, 0, 1, 0)
    Glass.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Glass.BackgroundTransparency = 0.98
    Glass.BorderSizePixel = 0
    Glass.ZIndex = parent.ZIndex - 1
    Glass.Parent = parent

    local Blur = Instance.new("ImageLabel")
    Blur.Name = "Blur"
    Blur.Size = UDim2.new(1, 0, 1, 0)
    Blur.BackgroundTransparency = 1
    Blur.Image = "rbxassetid://8992230677"
    Blur.ImageColor3 = CurrentTheme.Primary
    Blur.ImageTransparency = CurrentTheme.GlassBlur
    Blur.ScaleType = Enum.ScaleType.Slice
    Blur.SliceCenter = Rect.new(99, 99, 99, 99)
    Blur.Parent = Glass

    return Glass
end

local function CreateGradient(parent, rotation, colorStart, colorEnd)
    colorStart = colorStart or CurrentTheme.GradientStart
    colorEnd = colorEnd or CurrentTheme.GradientEnd
    rotation = rotation or 45

    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, colorStart),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(
            (colorStart.R + colorEnd.R) * 127.5,
            (colorStart.G + colorEnd.G) * 127.5,
            (colorStart.B + colorEnd.B) * 127.5
        )),
        ColorSequenceKeypoint.new(1, colorEnd)
    })
    Gradient.Rotation = rotation
    Gradient.Parent = parent

    task.spawn(function()
        while Gradient and Gradient.Parent do
            local tween = TweenService:Create(Gradient, TweenInfo.new(4, Enum.EasingStyle.Linear), {
                Rotation = rotation + 360
            })
            tween:Play()
            tween.Completed:Wait()
            if Gradient and Gradient.Parent then
                Gradient.Rotation = rotation
            end
        end
    end)

    return Gradient
end

local function CreateInnerGlow(parent, color, intensity)
    color = color or CurrentTheme.Primary
    intensity = intensity or 0.3

    local Glow = Instance.new("ImageLabel")
    Glow.Name = "InnerGlow"
    Glow.Size = UDim2.new(1, 0, 1, 0)
    Glow.Position = UDim2.new(0, 0, 0, 0)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://8992230677"
    Glow.ImageColor3 = color
    Glow.ImageTransparency = 1 - intensity
    Glow.ScaleType = Enum.ScaleType.Slice
    Glow.SliceCenter = Rect.new(99, 99, 99, 99)
    Glow.ZIndex = parent.ZIndex + 1
    Glow.Parent = parent

    return Glow
end

local function MakeDraggable(frame, dragHandle)
    local dragging, dragInput, dragStart, startPos

    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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

    dragHandle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- ================================================================
--        نظام الإشعارات الفخم (مضغوط، أنيميشن، صوت)
-- ================================================================
local NotifGui = nil
local NotifContainer = nil

local function EnsureNotifGui()
    if NotifGui and NotifGui.Parent then return end

    NotifGui = Instance.new("ScreenGui")
    NotifGui.Name = "PremiumNotifications"
    NotifGui.ResetOnSpawn = false
    NotifGui.IgnoreGuiInset = true
    NotifGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    NotifGui.DisplayOrder = 999

    if gethui then
        NotifGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(NotifGui)
        NotifGui.Parent = CoreGui
    else
        NotifGui.Parent = CoreGui
    end

    NotifContainer = Instance.new("Frame")
    NotifContainer.Name = "Container"
    NotifContainer.Size = UDim2.new(0, 320, 1, -40)
    NotifContainer.Position = UDim2.new(1, -335, 0, 20)
    NotifContainer.BackgroundTransparency = 1
    NotifContainer.Parent = NotifGui

    local Layout = Instance.new("UIListLayout")
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 10)
    Layout.Parent = NotifContainer
end

-- إشعار فخم مضغوط الحجم (بدل الإشعار الكبير القديم)
function UltimateHub:ShowNotification(title, message, icon, notifType, duration)
    duration = duration or 4
    notifType = notifType or "info"
    icon = icon or Icons.Bell

    EnsureNotifGui()

    local colorMap = {
        success = CurrentTheme.Success,
        error   = CurrentTheme.Error,
        warning = CurrentTheme.Warning,
        info    = CurrentTheme.Info,
    }
    local accentColor = colorMap[notifType] or CurrentTheme.Info

    -- الحجم الفعلي يعتمد على طول النص (مضغوط، مو كبير)
    local lineCount = 1
    for _ in string.gmatch(message, "\n") do lineCount = lineCount + 1 end
    local bodyHeight = 34 + (lineCount * 16)
    local cardHeight = math.clamp(58 + bodyHeight - 34, 64, 130)

    local Notif = Instance.new("Frame")
    Notif.Name = "Notif"
    Notif.Size = UDim2.new(0, 0, 0, cardHeight)
    Notif.Position = UDim2.new(1, 0, 0, 0)
    Notif.BackgroundColor3 = CurrentTheme.Surface
    Notif.BackgroundTransparency = 0.06
    Notif.BorderSizePixel = 0
    Notif.ClipsDescendants = true
    Notif.AutomaticSize = Enum.AutomaticSize.None
    Notif.LayoutOrder = -os.clock() * 1000
    Notif.Parent = NotifContainer

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 14)
    Corner.Parent = Notif

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = accentColor
    Stroke.Thickness = 1.5
    Stroke.Transparency = 0.35
    Stroke.Parent = Notif

    CreateGradient(Notif, 60, accentColor, CurrentTheme.Secondary)

    -- توهج خفيف خلف البطاقة
    local Glow = Instance.new("ImageLabel")
    Glow.Name = "Glow"
    Glow.Size = UDim2.new(1, 30, 1, 30)
    Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Glow.AnchorPoint = Vector2.new(0.5, 0.5)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://8992230677"
    Glow.ImageColor3 = accentColor
    Glow.ImageTransparency = 0.75
    Glow.ScaleType = Enum.ScaleType.Slice
    Glow.SliceCenter = Rect.new(99, 99, 99, 99)
    Glow.ZIndex = 0
    Glow.Parent = Notif

    -- شريط لوني جانبي (يمين البطاقة، متوافق مع اتجاه عربي)
    local SideBar = Instance.new("Frame")
    SideBar.Name = "SideBar"
    SideBar.Size = UDim2.new(0, 4, 1, 0)
    SideBar.Position = UDim2.new(1, -4, 0, 0)
    SideBar.BackgroundColor3 = accentColor
    SideBar.BorderSizePixel = 0
    SideBar.Parent = Notif
    local SideCorner = Instance.new("UICorner")
    SideCorner.CornerRadius = UDim.new(0, 14)
    SideCorner.Parent = SideBar

    -- دائرة الأيقونة
    local IconFrame = Instance.new("Frame")
    IconFrame.Name = "IconFrame"
    IconFrame.Size = UDim2.new(0, 40, 0, 40)
    IconFrame.Position = UDim2.new(0, 12, 0, 12)
    IconFrame.BackgroundColor3 = accentColor
    IconFrame.BackgroundTransparency = 0.78
    IconFrame.BorderSizePixel = 0
    IconFrame.Parent = Notif

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(1, 0)
    IconCorner.Parent = IconFrame

    local IconStroke = Instance.new("UIStroke")
    IconStroke.Color = accentColor
    IconStroke.Thickness = 1.5
    IconStroke.Transparency = 0.3
    IconStroke.Parent = IconFrame

    local IconImage = Instance.new("ImageLabel")
    IconImage.Name = "Icon"
    IconImage.Size = UDim2.new(0, 20, 0, 20)
    IconImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    IconImage.AnchorPoint = Vector2.new(0.5, 0.5)
    IconImage.BackgroundTransparency = 1
    IconImage.Image = icon
    IconImage.ImageColor3 = accentColor
    IconImage.Parent = IconFrame

    -- النصوص
    local TitleLbl = Instance.new("TextLabel")
    TitleLbl.Name = "Title"
    TitleLbl.Size = UDim2.new(1, -66, 0, 18)
    TitleLbl.Position = UDim2.new(0, 60, 0, 12)
    TitleLbl.BackgroundTransparency = 1
    TitleLbl.Text = title
    TitleLbl.TextColor3 = CurrentTheme.TextPrimary
    TitleLbl.TextSize = 14
    TitleLbl.Font = Enum.Font.GothamBold
    TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
    TitleLbl.TextTruncate = Enum.TextTruncate.AtEnd
    TitleLbl.Parent = Notif

    local MsgLbl = Instance.new("TextLabel")
    MsgLbl.Name = "Message"
    MsgLbl.Size = UDim2.new(1, -66, 0, bodyHeight)
    MsgLbl.Position = UDim2.new(0, 60, 0, 32)
    MsgLbl.BackgroundTransparency = 1
    MsgLbl.Text = message
    MsgLbl.TextColor3 = CurrentTheme.TextSecondary
    MsgLbl.TextSize = 12
    MsgLbl.Font = Enum.Font.Gotham
    MsgLbl.TextXAlignment = Enum.TextXAlignment.Left
    MsgLbl.TextYAlignment = Enum.TextYAlignment.Top
    MsgLbl.TextWrapped = true
    MsgLbl.Parent = Notif

    -- شريط التقدم أسفل البطاقة
    local ProgressBg = Instance.new("Frame")
    ProgressBg.Name = "ProgressBg"
    ProgressBg.Size = UDim2.new(1, 0, 0, 3)
    ProgressBg.Position = UDim2.new(0, 0, 1, -3)
    ProgressBg.BackgroundColor3 = CurrentTheme.Card
    ProgressBg.BackgroundTransparency = 0.5
    ProgressBg.BorderSizePixel = 0
    ProgressBg.Parent = Notif

    local ProgressBar = Instance.new("Frame")
    ProgressBar.Name = "ProgressBar"
    ProgressBar.Size = UDim2.new(1, 0, 1, 0)
    ProgressBar.BackgroundColor3 = accentColor
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Parent = ProgressBg

    -- صوت الإشعار (نغمة مختلفة بسيطة حسب النوع)
    local pitch = 1
    if notifType == "success" then pitch = 1.12
    elseif notifType == "error" then pitch = 0.85
    elseif notifType == "warning" then pitch = 0.95 end
    PlaySound(SoundEffects.Notification, 0.45, pitch)

    -- أنيميشن الدخول: انزلاق + تكبير ناعم
    Notif.Size = UDim2.new(0, 0, 0, cardHeight)
    local entryTween = TweenService:Create(Notif,
        TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 310, 0, cardHeight)}
    )
    entryTween:Play()

    -- أنيميشن الأيقونة: دوران خفيف عند الدخول
    IconImage.Rotation = -90
    IconImage.ImageTransparency = 1
    TweenService:Create(IconImage, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Rotation = 0,
        ImageTransparency = 0
    }):Play()

    -- نبض خفيف للتوهج
    task.spawn(function()
        while Notif and Notif.Parent do
            local t1 = TweenService:Create(Glow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.55})
            t1:Play()
            task.wait(1.2)
            if not (Notif and Notif.Parent) then break end
            local t2 = TweenService:Create(Glow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {ImageTransparency = 0.8})
            t2:Play()
            task.wait(1.2)
        end
    end)

    -- شريط التقدم يتناقص
    task.spawn(function()
        task.wait(0.45)
        TweenService:Create(ProgressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
            Size = UDim2.new(0, 0, 1, 0)
        }):Play()
    end)

    -- إغلاق تلقائي بأنيميشن خروج
    task.spawn(function()
        task.wait(duration + 0.45)
        if not (Notif and Notif.Parent) then return end

        local exitTween = TweenService:Create(Notif,
            TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {Size = UDim2.new(0, 0, 0, cardHeight), BackgroundTransparency = 1}
        )
        exitTween:Play()
        exitTween.Completed:Wait()
        if Notif then Notif:Destroy() end
    end)

    return Notif
end

-- إشعار دخول لاعب جديد للسيرفر (فخم، يعرض بياناته الكاملة)
function UltimateHub:ShowPlayerJoinNotification(player)
    local message = string.format(
        "اسم اللاعب: %s\nيوزر: @%s\nايدي: %d",
        player.DisplayName,
        player.Name,
        player.UserId
    )

    self:ShowNotification(
        "🎮 دخل لاعب جديد",
        message,
        Icons.UserPlus,
        "success",
        5
    )
end

-- إشعار خروج لاعب من السيرفر
function UltimateHub:ShowPlayerLeaveNotification(player)
    local message = string.format("اسم اللاعب: %s\nيوزر: @%s", player.DisplayName, player.Name)
    self:ShowNotification(
        "👋 غادر لاعب",
        message,
        Icons.UserMinus,
        "warning",
        3
    )
end

-- ================================================================
--                    إنشاء النافذة الرئيسية
-- ================================================================
function UltimateHub:CreateWindow(scriptName, scriptVersion)
    local Hub = setmetatable({}, {__index = UltimateHub})
    Hub.Name = scriptName or "Ultimate Hub Premium"
    Hub.Version = scriptVersion or "2.0"
    Hub.Maps = {}
    Hub.CurrentPage = "main"
    Hub.IsEnabled = true

    -- تسجيل تفعيل السكربت للاعب الحالي (يزيد العداد فوراً)
    ActivateUser(LocalPlayer.UserId, LocalPlayer.Name, LocalPlayer.DisplayName)

    -- مراقبة دخول لاعبين جدد للسيرفر (وليس بالضرورة أنهم فعّلوا السكربت،
    -- لكن حسب طلبك: إشعار دخول لأي لاعب يدخل الماب)
    Players.PlayerAdded:Connect(function(player)
        task.wait(1)
        UltimateHub:ShowPlayerJoinNotification(player)
    end)

    -- عند خروج لاعب من السيرفر: ينقص العداد إذا كان مسجلاً كمفعّل للسكربت
    Players.PlayerRemoving:Connect(function(player)
        DeactivateUser(player.UserId)
        UltimateHub:ShowPlayerLeaveNotification(player)
    end)

    -- ------------------------------------------------------------
    -- إنشاء ScreenGui
    -- ------------------------------------------------------------
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UltimateHubPremium"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    if gethui then
        ScreenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = CoreGui
    else
        ScreenGui.Parent = CoreGui
    end

    local SizeStates = {
        Minimized = {Width = 420, Height = 320},
        Normal    = {Width = 620, Height = 460},
        Maximized = {Width = 820, Height = 620},
    }
    local SizeOrder = {"Minimized", "Normal", "Maximized"}
    local CurrentSize = "Normal"

    -- ------------------------------------------------------------
    -- الإطار الرئيسي
    -- ------------------------------------------------------------
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = CurrentTheme.Background
    MainFrame.BackgroundTransparency = CurrentTheme.Transparency
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Visible = false
    MainFrame.Parent = ScreenGui

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 16)
    MainCorner.Parent = MainFrame

    CreateGlassEffect(MainFrame)

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = CurrentTheme.Primary
    MainStroke.Thickness = 2
    MainStroke.Transparency = 0.5
    MainStroke.Parent = MainFrame

    -- ------------------------------------------------------------
    -- شريط العنوان
    -- ------------------------------------------------------------
    local TitleBar = Instance.new("Frame")
    TitleBar.Name = "TitleBar"
    TitleBar.Size = UDim2.new(1, 0, 0, 60)
    TitleBar.BackgroundColor3 = CurrentTheme.Surface
    TitleBar.BackgroundTransparency = CurrentTheme.Transparency
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame

    local TitleCorner = Instance.new("UICorner")
    TitleCorner.CornerRadius = UDim.new(0, 16)
    TitleCorner.Parent = TitleBar

    CreateGradient(TitleBar, 90)

    local TitleFix = Instance.new("Frame")
    TitleFix.Name = "TitleFix"
    TitleFix.Size = UDim2.new(1, 0, 0, 20)
    TitleFix.Position = UDim2.new(0, 0, 1, -20)
    TitleFix.BackgroundColor3 = CurrentTheme.Surface
    TitleFix.BackgroundTransparency = CurrentTheme.Transparency
    TitleFix.BorderSizePixel = 0
    TitleFix.Parent = TitleBar

    MakeDraggable(MainFrame, TitleBar)

    -- صورة اللاعب (شريط العنوان)
    local PlayerAvatar = Instance.new("ImageLabel")
    PlayerAvatar.Name = "Avatar"
    PlayerAvatar.Size = UDim2.new(0, 40, 0, 40)
    PlayerAvatar.Position = UDim2.new(0, 10, 0, 10)
    PlayerAvatar.BackgroundColor3 = CurrentTheme.Primary
    PlayerAvatar.BorderSizePixel = 0
    PlayerAvatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=150&height=150&format=png"
    PlayerAvatar.Parent = TitleBar

    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = PlayerAvatar

    local AvatarStroke = Instance.new("UIStroke")
    AvatarStroke.Color = CurrentTheme.Primary
    AvatarStroke.Thickness = 2
    AvatarStroke.Parent = PlayerAvatar

    local TitleAvatarButton = Instance.new("TextButton")
    TitleAvatarButton.Name = "AvatarButton"
    TitleAvatarButton.Size = UDim2.new(1, 0, 1, 0)
    TitleAvatarButton.BackgroundTransparency = 1
    TitleAvatarButton.Text = ""
    TitleAvatarButton.ZIndex = 5
    TitleAvatarButton.Parent = PlayerAvatar

    local TitleText = Instance.new("TextLabel")
    TitleText.Name = "Title"
    TitleText.Size = UDim2.new(0, 220, 0, 20)
    TitleText.Position = UDim2.new(0, 60, 0, 10)
    TitleText.BackgroundTransparency = 1
    TitleText.Text = Hub.Name
    TitleText.TextColor3 = CurrentTheme.TextPrimary
    TitleText.TextSize = 18
    TitleText.Font = Enum.Font.GothamBold
    TitleText.TextXAlignment = Enum.TextXAlignment.Left
    TitleText.Parent = TitleBar

    local VersionText = Instance.new("TextLabel")
    VersionText.Name = "Version"
    VersionText.Size = UDim2.new(0, 220, 0, 15)
    VersionText.Position = UDim2.new(0, 60, 0, 32)
    VersionText.BackgroundTransparency = 1
    VersionText.Text = "v" .. Hub.Version .. " • Premium"
    VersionText.TextColor3 = CurrentTheme.TextSecondary
    VersionText.TextSize = 12
    VersionText.Font = Enum.Font.Gotham
    VersionText.TextXAlignment = Enum.TextXAlignment.Left
    VersionText.Parent = TitleBar

    -- ------------------------------------------------------------
    -- أزرار التحكم (أيقونات: تصغير / تكبير / إغلاق / ثيم)
    -- ------------------------------------------------------------
    local ButtonsContainer = Instance.new("Frame")
    ButtonsContainer.Name = "Buttons"
    ButtonsContainer.Size = UDim2.new(0, 180, 0, 36)
    ButtonsContainer.Position = UDim2.new(1, -190, 0, 12)
    ButtonsContainer.BackgroundTransparency = 1
    ButtonsContainer.Parent = TitleBar

    local ButtonLayout = Instance.new("UIListLayout")
    ButtonLayout.FillDirection = Enum.FillDirection.Horizontal
    ButtonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    ButtonLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    ButtonLayout.Padding = UDim.new(0, 8)
    ButtonLayout.Parent = ButtonsContainer

    local function CreateIconButton(name, icon, tintColor)
        local Button = Instance.new("ImageButton")
        Button.Name = name
        Button.Size = UDim2.new(0, 34, 0, 34)
        Button.BackgroundColor3 = CurrentTheme.Card
        Button.BackgroundTransparency = 0.25
        Button.BorderSizePixel = 0
        Button.Image = icon
        Button.ImageColor3 = tintColor or CurrentTheme.TextPrimary
        Button.ScaleType = Enum.ScaleType.Fit
        Button.AutoButtonColor = false
        Button.Parent = ButtonsContainer

        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 9)
        BtnCorner.Parent = Button

        local BtnStroke = Instance.new("UIStroke")
        BtnStroke.Color = tintColor or CurrentTheme.Primary
        BtnStroke.Thickness = 1
        BtnStroke.Transparency = 0.6
        BtnStroke.Parent = Button

        -- تصغير الأيقونة قليلاً داخل الزر (padding بصري)
        local pad = Instance.new("UIPadding")
        pad.PaddingTop = UDim.new(0, 7)
        pad.PaddingBottom = UDim.new(0, 7)
        pad.PaddingLeft = UDim.new(0, 7)
        pad.PaddingRight = UDim.new(0, 7)
        pad.Parent = Button

        Button.MouseEnter:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.18), {
                BackgroundTransparency = 0.05,
                Size = UDim2.new(0, 37, 0, 37)
            }):Play()
        end)

        Button.MouseLeave:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.18), {
                BackgroundTransparency = 0.25,
                Size = UDim2.new(0, 34, 0, 34)
            }):Play()
        end)

        return Button
    end

    local ThemeButton = CreateIconButton("ThemeButton", Icons.Theme, CurrentTheme.Info)
    local ThemeIcon = ThemeButton -- للتوافق مع دوران الأيقونة نفسها
    local ResizeButton = CreateIconButton("ResizeButton", Icons.Maximize, CurrentTheme.Warning)
    local CloseButton = CreateIconButton("CloseButton", Icons.Close, CurrentTheme.Error)

    -- ------------------------------------------------------------
    -- صفحة المعلومات (Profile) - مُصلحة ومرتبة
    -- ------------------------------------------------------------
    local ProfilePage = Instance.new("ScrollingFrame")
    ProfilePage.Name = "ProfilePage"
    ProfilePage.Size = UDim2.new(1, -40, 1, -90)
    ProfilePage.Position = UDim2.new(1, 0, 0, 70)
    ProfilePage.BackgroundTransparency = 1
    ProfilePage.BorderSizePixel = 0
    ProfilePage.ScrollBarThickness = 5
    ProfilePage.ScrollBarImageColor3 = CurrentTheme.Primary
    ProfilePage.Visible = false
    ProfilePage.CanvasSize = UDim2.new(0, 0, 0, 0)
    ProfilePage.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ProfilePage.Parent = MainFrame

    local ProfilePadding = Instance.new("UIPadding")
    ProfilePadding.PaddingTop = UDim.new(0, 55)
    ProfilePadding.PaddingBottom = UDim.new(0, 20)
    ProfilePadding.Parent = ProfilePage

    local ProfileLayout = Instance.new("UIListLayout")
    ProfileLayout.Padding = UDim.new(0, 14)
    ProfileLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ProfileLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ProfileLayout.Parent = ProfilePage

    -- زر الرجوع (موضوع بشكل ثابت أعلى الصفحة، خارج تدفق القائمة)
    local ProfileBackButton = Instance.new("TextButton")
    ProfileBackButton.Name = "BackButton"
    ProfileBackButton.Size = UDim2.new(0, 90, 0, 34)
    ProfileBackButton.Position = UDim2.new(0, 0, 0, 0)
    ProfileBackButton.BackgroundColor3 = CurrentTheme.Card
    ProfileBackButton.BackgroundTransparency = 0.2
    ProfileBackButton.BorderSizePixel = 0
    ProfileBackButton.Text = "→ رجوع"
    ProfileBackButton.TextColor3 = CurrentTheme.TextPrimary
    ProfileBackButton.TextSize = 13
    ProfileBackButton.Font = Enum.Font.GothamBold
    ProfileBackButton.ZIndex = 10
    ProfileBackButton.Parent = ProfilePage

    local PBackCorner = Instance.new("UICorner")
    PBackCorner.CornerRadius = UDim.new(0, 8)
    PBackCorner.Parent = ProfileBackButton

    -- بطاقة معلومات اللاعب
    local PlayerInfoCard = Instance.new("Frame")
    PlayerInfoCard.Name = "PlayerInfo"
    PlayerInfoCard.Size = UDim2.new(1, 0, 0, 110)
    PlayerInfoCard.BackgroundColor3 = CurrentTheme.Card
    PlayerInfoCard.BackgroundTransparency = 0.15
    PlayerInfoCard.BorderSizePixel = 0
    PlayerInfoCard.LayoutOrder = 1
    PlayerInfoCard.Parent = ProfilePage

    local PlayerCardCorner = Instance.new("UICorner")
    PlayerCardCorner.CornerRadius = UDim.new(0, 12)
    PlayerCardCorner.Parent = PlayerInfoCard

    CreateGradient(PlayerInfoCard, 45)
    CreateInnerGlow(PlayerInfoCard, CurrentTheme.Primary, 0.18)

    local PICStroke = Instance.new("UIStroke")
    PICStroke.Color = CurrentTheme.Primary
    PICStroke.Thickness = 1.5
    PICStroke.Transparency = 0.55
    PICStroke.Parent = PlayerInfoCard

    local ProfileAvatar = Instance.new("ImageLabel")
    ProfileAvatar.Name = "Avatar"
    ProfileAvatar.Size = UDim2.new(0, 78, 0, 78)
    ProfileAvatar.Position = UDim2.new(0, 16, 0.5, 0)
    ProfileAvatar.AnchorPoint = Vector2.new(0, 0.5)
    ProfileAvatar.BackgroundColor3 = CurrentTheme.Primary
    ProfileAvatar.BorderSizePixel = 0
    ProfileAvatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=150&height=150&format=png"
    ProfileAvatar.Parent = PlayerInfoCard

    local PAvatarCorner = Instance.new("UICorner")
    PAvatarCorner.CornerRadius = UDim.new(1, 0)
    PAvatarCorner.Parent = ProfileAvatar

    local PAvatarStroke = Instance.new("UIStroke")
    PAvatarStroke.Color = CurrentTheme.Primary
    PAvatarStroke.Thickness = 3
    PAvatarStroke.Parent = ProfileAvatar

    local PlayerName = Instance.new("TextLabel")
    PlayerName.Name = "PlayerName"
    PlayerName.Size = UDim2.new(1, -180, 0, 24)
    PlayerName.Position = UDim2.new(0, 108, 0, 20)
    PlayerName.BackgroundTransparency = 1
    PlayerName.Text = LocalPlayer.DisplayName
    PlayerName.TextColor3 = CurrentTheme.TextPrimary
    PlayerName.TextSize = 19
    PlayerName.Font = Enum.Font.GothamBold
    PlayerName.TextXAlignment = Enum.TextXAlignment.Left
    PlayerName.TextTruncate = Enum.TextTruncate.AtEnd
    PlayerName.Parent = PlayerInfoCard

    local PlayerUsername = Instance.new("TextLabel")
    PlayerUsername.Name = "Username"
    PlayerUsername.Size = UDim2.new(1, -180, 0, 18)
    PlayerUsername.Position = UDim2.new(0, 108, 0, 46)
    PlayerUsername.BackgroundTransparency = 1
    PlayerUsername.Text = "@" .. LocalPlayer.Name
    PlayerUsername.TextColor3 = CurrentTheme.TextSecondary
    PlayerUsername.TextSize = 13
    PlayerUsername.Font = Enum.Font.Gotham
    PlayerUsername.TextXAlignment = Enum.TextXAlignment.Left
    PlayerUsername.Parent = PlayerInfoCard

    local PlayerID = Instance.new("TextLabel")
    PlayerID.Name = "UserID"
    PlayerID.Size = UDim2.new(1, -180, 0, 18)
    PlayerID.Position = UDim2.new(0, 108, 0, 66)
    PlayerID.BackgroundTransparency = 1
    PlayerID.Text = "ID: " .. LocalPlayer.UserId
    PlayerID.TextColor3 = CurrentTheme.TextSecondary
    PlayerID.TextSize = 12
    PlayerID.Font = Enum.Font.Gotham
    PlayerID.TextXAlignment = Enum.TextXAlignment.Left
    PlayerID.Parent = PlayerInfoCard

    local AccountAgeLbl = Instance.new("TextLabel")
    AccountAgeLbl.Name = "AccountAge"
    AccountAgeLbl.Size = UDim2.new(1, -180, 0, 16)
    AccountAgeLbl.Position = UDim2.new(0, 108, 0, 86)
    AccountAgeLbl.BackgroundTransparency = 1
    AccountAgeLbl.Text = "🗓️ عمر الحساب: " .. tostring(LocalPlayer.AccountAge) .. " يوم"
    AccountAgeLbl.TextColor3 = CurrentTheme.TextSecondary
    AccountAgeLbl.TextSize = 11
    AccountAgeLbl.Font = Enum.Font.Gotham
    AccountAgeLbl.TextXAlignment = Enum.TextXAlignment.Left
    AccountAgeLbl.Parent = PlayerInfoCard

    -- ------------------------------------------------------------
    -- بطاقة إحصائيات المستخدمين (منظمة بشكل صحيح - Grid)
    -- ------------------------------------------------------------
    local StatsCard = Instance.new("Frame")
    StatsCard.Name = "StatsCard"
    StatsCard.Size = UDim2.new(1, 0, 0, 190)
    StatsCard.BackgroundColor3 = CurrentTheme.Card
    StatsCard.BackgroundTransparency = 0.15
    StatsCard.BorderSizePixel = 0
    StatsCard.LayoutOrder = 2
    StatsCard.Parent = ProfilePage

    local StatsCorner = Instance.new("UICorner")
    StatsCorner.CornerRadius = UDim.new(0, 12)
    StatsCorner.Parent = StatsCard

    CreateGradient(StatsCard, 135)
    CreateInnerGlow(StatsCard, CurrentTheme.Secondary, 0.15)

    local SCStroke = Instance.new("UIStroke")
    SCStroke.Color = CurrentTheme.Secondary
    SCStroke.Thickness = 1.5
    SCStroke.Transparency = 0.6
    SCStroke.Parent = StatsCard

    local StatsTitle = Instance.new("TextLabel")
    StatsTitle.Name = "Title"
    StatsTitle.Size = UDim2.new(1, -30, 0, 26)
    StatsTitle.Position = UDim2.new(0, 15, 0, 12)
    StatsTitle.BackgroundTransparency = 1
    StatsTitle.Text = "📊 إحصائيات المستخدمين"
    StatsTitle.TextColor3 = CurrentTheme.TextPrimary
    StatsTitle.TextSize = 16
    StatsTitle.Font = Enum.Font.GothamBold
    StatsTitle.TextXAlignment = Enum.TextXAlignment.Left
    StatsTitle.Parent = StatsCard

    local StatsGrid = Instance.new("Frame")
    StatsGrid.Name = "Grid"
    StatsGrid.Size = UDim2.new(1, -30, 0, 145)
    StatsGrid.Position = UDim2.new(0, 15, 0, 42)
    StatsGrid.BackgroundTransparency = 1
    StatsGrid.Parent = StatsCard

    local GridLayout = Instance.new("UIGridLayout")
    GridLayout.CellSize = UDim2.new(0.5, -6, 0, 66)
    GridLayout.CellPadding = UDim2.new(0, 12, 0, 12)
    GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    GridLayout.Parent = StatsGrid

    local function CreateStatBox(icon, label, value, color, layoutOrder)
        local Box = Instance.new("Frame")
        Box.Name = label
        Box.BackgroundColor3 = CurrentTheme.Surface
        Box.BackgroundTransparency = 0.35
        Box.BorderSizePixel = 0
        Box.LayoutOrder = layoutOrder
        Box.Parent = StatsGrid

        local BoxCorner = Instance.new("UICorner")
        BoxCorner.CornerRadius = UDim.new(0, 10)
        BoxCorner.Parent = Box

        local IconLbl = Instance.new("TextLabel")
        IconLbl.Size = UDim2.new(0, 30, 0, 30)
        IconLbl.Position = UDim2.new(0, 10, 0, 8)
        IconLbl.BackgroundTransparency = 1
        IconLbl.Text = icon
        IconLbl.TextSize = 20
        IconLbl.Font = Enum.Font.GothamBold
        IconLbl.Parent = Box

        local ValueLbl = Instance.new("TextLabel")
        ValueLbl.Name = "Value"
        ValueLbl.Size = UDim2.new(1, -50, 0, 24)
        ValueLbl.Position = UDim2.new(0, 44, 0, 6)
        ValueLbl.BackgroundTransparency = 1
        ValueLbl.Text = tostring(value)
        ValueLbl.TextColor3 = color
        ValueLbl.TextSize = 20
        ValueLbl.Font = Enum.Font.GothamBold
        ValueLbl.TextXAlignment = Enum.TextXAlignment.Left
        ValueLbl.Parent = Box

        local LabelLbl = Instance.new("TextLabel")
        LabelLbl.Size = UDim2.new(1, -20, 0, 24)
        LabelLbl.Position = UDim2.new(0, 10, 0, 36)
        LabelLbl.BackgroundTransparency = 1
        LabelLbl.Text = label
        LabelLbl.TextColor3 = CurrentTheme.TextSecondary
        LabelLbl.TextSize = 11
        LabelLbl.Font = Enum.Font.Gotham
        LabelLbl.TextXAlignment = Enum.TextXAlignment.Left
        LabelLbl.TextWrapped = true
        LabelLbl.Parent = Box

        return Box, ValueLbl
    end

    local _, ActiveValue = CreateStatBox("👥", "مفعّلين الآن", GetActiveCount(), CurrentTheme.Success, 1)
    local _, TotalValue = CreateStatBox("📈", "إجمالي التفعيلات", GetTotalActivations(), CurrentTheme.Info, 2)
    local _, ServerValue = CreateStatBox("🌐", "لاعبين بالسيرفر", #Players:GetPlayers(), CurrentTheme.Warning, 3)
    local _, PingValue = CreateStatBox("📡", "بينغ (ms)", "..", CurrentTheme.Accent, 4)

    -- تحديث الإحصائيات دورياً
    task.spawn(function()
        while task.wait(2) do
            if ActiveValue then ActiveValue.Text = tostring(GetActiveCount()) end
            if TotalValue then TotalValue.Text = tostring(GetTotalActivations()) end
            if ServerValue then ServerValue.Text = tostring(#Players:GetPlayers()) end
            if PingValue then
                local ok, ping = pcall(function()
                    return math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
                end)
                PingValue.Text = ok and (tostring(ping) .. " ms") or "N/A"
            end
        end
    end)

    -- ------------------------------------------------------------
    -- بطاقة المطورين (منظمة)
    -- ------------------------------------------------------------
    local DevCard = Instance.new("Frame")
    DevCard.Name = "DevelopersCard"
    DevCard.Size = UDim2.new(1, 0, 0, 36 + (#DeveloperInfo * 58) + 16)
    DevCard.BackgroundColor3 = CurrentTheme.Card
    DevCard.BackgroundTransparency = 0.15
    DevCard.BorderSizePixel = 0
    DevCard.LayoutOrder = 3
    DevCard.Parent = ProfilePage

    local DevCorner = Instance.new("UICorner")
    DevCorner.CornerRadius = UDim.new(0, 12)
    DevCorner.Parent = DevCard

    CreateGradient(DevCard, 90, CurrentTheme.Primary, CurrentTheme.Accent)
    CreateInnerGlow(DevCard, CurrentTheme.Primary, 0.18)

    local DCStroke = Instance.new("UIStroke")
    DCStroke.Color = CurrentTheme.Primary
    DCStroke.Thickness = 1.5
    DCStroke.Transparency = 0.6
    DCStroke.Parent = DevCard

    local DevTitle = Instance.new("TextLabel")
    DevTitle.Name = "Title"
    DevTitle.Size = UDim2.new(1, -30, 0, 26)
    DevTitle.Position = UDim2.new(0, 15, 0, 12)
    DevTitle.BackgroundTransparency = 1
    DevTitle.Text = "👨‍💻 المطورون"
    DevTitle.TextColor3 = CurrentTheme.TextPrimary
    DevTitle.TextSize = 16
    DevTitle.Font = Enum.Font.GothamBold
    DevTitle.TextXAlignment = Enum.TextXAlignment.Left
    DevTitle.Parent = DevCard

    local DevList = Instance.new("Frame")
    DevList.Name = "DevList"
    DevList.Size = UDim2.new(1, -30, 0, #DeveloperInfo * 58)
    DevList.Position = UDim2.new(0, 15, 0, 42)
    DevList.BackgroundTransparency = 1
    DevList.Parent = DevCard

    local DevLayout = Instance.new("UIListLayout")
    DevLayout.Padding = UDim.new(0, 8)
    DevLayout.Parent = DevList

    for _, dev in ipairs(DeveloperInfo) do
        local DevEntry = Instance.new("Frame")
        DevEntry.Name = dev.Name
        DevEntry.Size = UDim2.new(1, 0, 0, 50)
        DevEntry.BackgroundColor3 = CurrentTheme.Surface
        DevEntry.BackgroundTransparency = 0.45
        DevEntry.BorderSizePixel = 0
        DevEntry.Parent = DevList

        local EntryCorner = Instance.new("UICorner")
        EntryCorner.CornerRadius = UDim.new(0, 9)
        EntryCorner.Parent = DevEntry

        local DevIcon = Instance.new("ImageLabel")
        DevIcon.Name = "Icon"
        DevIcon.Size = UDim2.new(0, 36, 0, 36)
        DevIcon.Position = UDim2.new(0, 8, 0.5, 0)
        DevIcon.AnchorPoint = Vector2.new(0, 0.5)
        DevIcon.BackgroundColor3 = dev.RankColor or CurrentTheme.Primary
        DevIcon.BackgroundTransparency = 0.6
        DevIcon.BorderSizePixel = 0
        DevIcon.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. dev.UserId .. "&width=150&height=150&format=png"
        DevIcon.Parent = DevEntry

        local DevIconCorner = Instance.new("UICorner")
        DevIconCorner.CornerRadius = UDim.new(1, 0)
        DevIconCorner.Parent = DevIcon

        local DevName = Instance.new("TextLabel")
        DevName.Name = "Name"
        DevName.Size = UDim2.new(1, -140, 0, 20)
        DevName.Position = UDim2.new(0, 54, 0, 6)
        DevName.BackgroundTransparency = 1
        DevName.Text = dev.Name .. (dev.Verified and "  ✓" or "")
        DevName.TextColor3 = dev.RankColor or CurrentTheme.TextPrimary
        DevName.TextSize = 14
        DevName.Font = Enum.Font.GothamBold
        DevName.TextXAlignment = Enum.TextXAlignment.Left
        DevName.TextTruncate = Enum.TextTruncate.AtEnd
        DevName.Parent = DevEntry

        local DevSub = Instance.new("TextLabel")
        DevSub.Name = "Sub"
        DevSub.Size = UDim2.new(1, -140, 0, 18)
        DevSub.Position = UDim2.new(0, 54, 0, 26)
        DevSub.BackgroundTransparency = 1
        DevSub.Text = dev.Username .. "  •  " .. dev.Rank
        DevSub.TextColor3 = CurrentTheme.TextSecondary
        DevSub.TextSize = 11
        DevSub.Font = Enum.Font.Gotham
        DevSub.TextXAlignment = Enum.TextXAlignment.Left
        DevSub.TextTruncate = Enum.TextTruncate.AtEnd
        DevSub.Parent = DevEntry

        if dev.Verified then
            local Badge = Instance.new("Frame")
            Badge.Size = UDim2.new(0, 70, 0, 24)
            Badge.Position = UDim2.new(1, -78, 0.5, 0)
            Badge.AnchorPoint = Vector2.new(0, 0.5)
            Badge.BackgroundColor3 = dev.RankColor or CurrentTheme.Primary
            Badge.BackgroundTransparency = 0.75
            Badge.BorderSizePixel = 0
            Badge.Parent = DevEntry

            local BadgeCorner = Instance.new("UICorner")
            BadgeCorner.CornerRadius = UDim.new(1, 0)
            BadgeCorner.Parent = Badge

            local BadgeText = Instance.new("TextLabel")
            BadgeText.Size = UDim2.new(1, 0, 1, 0)
            BadgeText.BackgroundTransparency = 1
            BadgeText.Text = "موثّق"
            BadgeText.TextColor3 = dev.RankColor or CurrentTheme.Primary
            BadgeText.TextSize = 11
            BadgeText.Font = Enum.Font.GothamBold
            BadgeText.Parent = Badge
        end
    end

    -- ------------------------------------------------------------
    -- زر التشغيل/التعطيل الفخم (نمط آيفون) + إشعارات فخمة
    -- ------------------------------------------------------------
    local PowerCard = Instance.new("Frame")
    PowerCard.Name = "PowerToggleCard"
    PowerCard.Size = UDim2.new(1, 0, 0, 74)
    PowerCard.BackgroundColor3 = CurrentTheme.Card
    PowerCard.BackgroundTransparency = 0.1
    PowerCard.BorderSizePixel = 0
    PowerCard.LayoutOrder = 4
    PowerCard.Parent = ProfilePage

    local PowerCorner = Instance.new("UICorner")
    PowerCorner.CornerRadius = UDim.new(0, 14)
    PowerCorner.Parent = PowerCard

    CreateGradient(PowerCard, 45, CurrentTheme.Success, CurrentTheme.Info)
    CreateInnerGlow(PowerCard, CurrentTheme.Success, 0.2)

    local PowerStroke = Instance.new("UIStroke")
    PowerStroke.Color = CurrentTheme.Success
    PowerStroke.Thickness = 1.5
    PowerStroke.Transparency = 0.5
    PowerStroke.Parent = PowerCard

    local PowerLabel = Instance.new("TextLabel")
    PowerLabel.Name = "Label"
    PowerLabel.Size = UDim2.new(1, -120, 0, 24)
    PowerLabel.Position = UDim2.new(0, 18, 0, 15)
    PowerLabel.BackgroundTransparency = 1
    PowerLabel.Text = "⚡ تشغيل / تعطيل السكربت"
    PowerLabel.TextColor3 = CurrentTheme.TextPrimary
    PowerLabel.TextSize = 15
    PowerLabel.Font = Enum.Font.GothamBold
    PowerLabel.TextXAlignment = Enum.TextXAlignment.Left
    PowerLabel.Parent = PowerCard

    local PowerStatus = Instance.new("TextLabel")
    PowerStatus.Name = "Status"
    PowerStatus.Size = UDim2.new(1, -120, 0, 20)
    PowerStatus.Position = UDim2.new(0, 18, 0, 40)
    PowerStatus.BackgroundTransparency = 1
    PowerStatus.Text = "✅ مفعّل حالياً"
    PowerStatus.TextColor3 = CurrentTheme.Success
    PowerStatus.TextSize = 12
    PowerStatus.Font = Enum.Font.Gotham
    PowerStatus.TextXAlignment = Enum.TextXAlignment.Left
    PowerStatus.Parent = PowerCard

    -- زر التبديل بشكل آيفون
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "ToggleButton"
    ToggleButton.Size = UDim2.new(0, 66, 0, 34)
    ToggleButton.Position = UDim2.new(1, -84, 0.5, 0)
    ToggleButton.AnchorPoint = Vector2.new(0, 0.5)
    ToggleButton.BackgroundColor3 = CurrentTheme.Success
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Text = ""
    ToggleButton.AutoButtonColor = false
    ToggleButton.Parent = PowerCard

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleButton

    local ToggleStroke = Instance.new("UIStroke")
    ToggleStroke.Color = CurrentTheme.Success
    ToggleStroke.Thickness = 1.5
    ToggleStroke.Transparency = 0.4
    ToggleStroke.Parent = ToggleButton

    local ToggleCircle = Instance.new("Frame")
    ToggleCircle.Name = "Circle"
    ToggleCircle.Size = UDim2.new(0, 28, 0, 28)
    ToggleCircle.Position = UDim2.new(0, 35, 0.5, 0)
    ToggleCircle.AnchorPoint = Vector2.new(0, 0.5)
    ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleCircle.BorderSizePixel = 0
    ToggleCircle.Parent = ToggleButton

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = ToggleCircle

    local CircleShadow = Instance.new("ImageLabel")
    CircleShadow.Name = "Shadow"
    CircleShadow.Size = UDim2.new(1, 8, 1, 8)
    CircleShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    CircleShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    CircleShadow.BackgroundTransparency = 1
    CircleShadow.Image = "rbxassetid://8992230677"
    CircleShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    CircleShadow.ImageTransparency = 0.65
    CircleShadow.ScaleType = Enum.ScaleType.Slice
    CircleShadow.SliceCenter = Rect.new(99, 99, 99, 99)
    CircleShadow.ZIndex = 0
    CircleShadow.Parent = ToggleCircle

    ToggleButton.MouseButton1Click:Connect(function()
        Hub.IsEnabled = not Hub.IsEnabled

        if Hub.IsEnabled then
            PlaySound(SoundEffects.Toggle, 0.5, 1.15)

            TweenService:Create(ToggleButton, TweenInfo.new(0.28, Enum.EasingStyle.Quad), {
                BackgroundColor3 = CurrentTheme.Success
            }):Play()
            TweenService:Create(ToggleStroke, TweenInfo.new(0.28), {Color = CurrentTheme.Success}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 35, 0.5, 0)
            }):Play()

            PowerStatus.Text = "✅ مفعّل حالياً"
            PowerStatus.TextColor3 = CurrentTheme.Success

            UltimateHub:ShowNotification("⚡ تم التفعيل", "السكربت الآن نشط ويعمل بكامل طاقته", Icons.Power, "success", 3)
        else
            PlaySound(SoundEffects.Toggle, 0.5, 0.85)

            TweenService:Create(ToggleButton, TweenInfo.new(0.28, Enum.EasingStyle.Quad), {
                BackgroundColor3 = CurrentTheme.Error
            }):Play()
            TweenService:Create(ToggleStroke, TweenInfo.new(0.28), {Color = CurrentTheme.Error}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 3, 0.5, 0)
            }):Play()

            PowerStatus.Text = "⛔ معطّل حالياً"
            PowerStatus.TextColor3 = CurrentTheme.Error

            UltimateHub:ShowNotification("⛔ تم التعطيل", "السكربت الآن متوقف مؤقتاً", Icons.Close, "warning", 3)
        end

        -- نبضة بسيطة للدائرة
        TweenService:Create(ToggleCircle, TweenInfo.new(0.12), {Size = UDim2.new(0, 32, 0, 32)}):Play()
        task.wait(0.12)
        TweenService:Create(ToggleCircle, TweenInfo.new(0.12), {Size = UDim2.new(0, 28, 0, 28)}):Play()
    end)

    ToggleButton.MouseEnter:Connect(function()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.15), {Size = UDim2.new(0, 30, 0, 30)}):Play()
    end)
    ToggleButton.MouseLeave:Connect(function()
        TweenService:Create(ToggleCircle, TweenInfo.new(0.15), {Size = UDim2.new(0, 28, 0, 28)}):Play()
    end)

    -- ------------------------------------------------------------
    -- الصفحة الرئيسية (قائمة الخرائط)
    -- ------------------------------------------------------------
    local MainPage = Instance.new("ScrollingFrame")
    MainPage.Name = "MainPage"
    MainPage.Size = UDim2.new(1, -40, 1, -90)
    MainPage.Position = UDim2.new(0, 20, 0, 70)
    MainPage.BackgroundTransparency = 1
    MainPage.BorderSizePixel = 0
    MainPage.ScrollBarThickness = 5
    MainPage.ScrollBarImageColor3 = CurrentTheme.Primary
    MainPage.CanvasSize = UDim2.new(0, 0, 0, 0)
    MainPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
    MainPage.Parent = MainFrame

    local MainLayout = Instance.new("UIListLayout")
    MainLayout.Padding = UDim.new(0, 14)
    MainLayout.Parent = MainPage

    local SearchContainer = Instance.new("Frame")
    SearchContainer.Name = "Search"
    SearchContainer.Size = UDim2.new(1, 0, 0, 44)
    SearchContainer.BackgroundColor3 = CurrentTheme.Card
    SearchContainer.BackgroundTransparency = 0.25
    SearchContainer.BorderSizePixel = 0
    SearchContainer.LayoutOrder = 1
    SearchContainer.Parent = MainPage

    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 10)
    SearchCorner.Parent = SearchContainer

    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Size = UDim2.new(0, 18, 0, 18)
    SearchIcon.Position = UDim2.new(0, 14, 0.5, 0)
    SearchIcon.AnchorPoint = Vector2.new(0, 0.5)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Image = Icons.Search
    SearchIcon.ImageColor3 = CurrentTheme.TextSecondary
    SearchIcon.Parent = SearchContainer

    local SearchBox = Instance.new("TextBox")
    SearchBox.Name = "SearchBox"
    SearchBox.Size = UDim2.new(1, -55, 1, 0)
    SearchBox.Position = UDim2.new(0, 45, 0, 0)
    SearchBox.BackgroundTransparency = 1
    SearchBox.PlaceholderText = "ابحث عن خريطة..."
    SearchBox.PlaceholderColor3 = CurrentTheme.TextSecondary
    SearchBox.Text = ""
    SearchBox.TextColor3 = CurrentTheme.TextPrimary
    SearchBox.TextSize = 14
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.ClearTextOnFocus = false
    SearchBox.Parent = SearchContainer

    local SectionTitle = Instance.new("TextLabel")
    SectionTitle.Size = UDim2.new(1, 0, 0, 22)
    SectionTitle.BackgroundTransparency = 1
    SectionTitle.Text = "🗺️ الخرائط المتاحة"
    SectionTitle.TextColor3 = CurrentTheme.TextPrimary
    SectionTitle.TextSize = 15
    SectionTitle.Font = Enum.Font.GothamBold
    SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    SectionTitle.LayoutOrder = 2
    SectionTitle.Parent = MainPage

    local MapsScroll = Instance.new("Frame")
    MapsScroll.Name = "MapsScroll"
    MapsScroll.Size = UDim2.new(1, 0, 0, 0)
    MapsScroll.AutomaticSize = Enum.AutomaticSize.Y
    MapsScroll.BackgroundTransparency = 1
    MapsScroll.BorderSizePixel = 0
    MapsScroll.LayoutOrder = 3
    MapsScroll.Parent = MainPage

    local MapsLayout = Instance.new("UIListLayout")
    MapsLayout.Padding = UDim.new(0, 10)
    MapsLayout.Parent = MapsScroll

    -- ------------------------------------------------------------
    -- صفحة المجلد (سكربتات الخريطة)
    -- ------------------------------------------------------------
    local FolderPage = Instance.new("ScrollingFrame")
    FolderPage.Name = "FolderPage"
    FolderPage.Size = UDim2.new(1, -40, 1, -90)
    FolderPage.Position = UDim2.new(1, 0, 0, 70)
    FolderPage.BackgroundTransparency = 1
    FolderPage.BorderSizePixel = 0
    FolderPage.ScrollBarThickness = 5
    FolderPage.ScrollBarImageColor3 = CurrentTheme.Primary
    FolderPage.Visible = false
    FolderPage.CanvasSize = UDim2.new(0, 0, 0, 0)
    FolderPage.AutomaticCanvasSize = Enum.AutomaticSize.Y
    FolderPage.Parent = MainFrame

    local FolderPadding = Instance.new("UIPadding")
    FolderPadding.PaddingTop = UDim.new(0, 46)
    FolderPadding.Parent = FolderPage

    local FolderLayout = Instance.new("UIListLayout")
    FolderLayout.Padding = UDim.new(0, 12)
    FolderLayout.Parent = FolderPage

    local BackButton = Instance.new("TextButton")
    BackButton.Name = "BackButton"
    BackButton.Size = UDim2.new(0, 90, 0, 34)
    BackButton.Position = UDim2.new(0, 0, 0, 0)
    BackButton.BackgroundColor3 = CurrentTheme.Card
    BackButton.BackgroundTransparency = 0.2
    BackButton.BorderSizePixel = 0
    BackButton.Text = "→ رجوع"
    BackButton.TextColor3 = CurrentTheme.TextPrimary
    BackButton.TextSize = 13
    BackButton.Font = Enum.Font.GothamBold
    BackButton.ZIndex = 10
    BackButton.Parent = FolderPage

    local BackButtonCorner = Instance.new("UICorner")
    BackButtonCorner.CornerRadius = UDim.new(0, 8)
    BackButtonCorner.Parent = BackButton

    local FolderTitle = Instance.new("TextLabel")
    FolderTitle.Name = "FolderTitle"
    FolderTitle.Size = UDim2.new(1, 0, 0, 28)
    FolderTitle.BackgroundTransparency = 1
    FolderTitle.Text = "المجلد"
    FolderTitle.TextColor3 = CurrentTheme.TextPrimary
    FolderTitle.TextSize = 18
    FolderTitle.Font = Enum.Font.GothamBold
    FolderTitle.TextXAlignment = Enum.TextXAlignment.Left
    FolderTitle.LayoutOrder = 1
    FolderTitle.Parent = FolderPage

    local ScriptsContainer = Instance.new("Frame")
    ScriptsContainer.Name = "ScriptsContainer"
    ScriptsContainer.Size = UDim2.new(1, 0, 0, 0)
    ScriptsContainer.AutomaticSize = Enum.AutomaticSize.Y
    ScriptsContainer.BackgroundTransparency = 1
    ScriptsContainer.LayoutOrder = 2
    ScriptsContainer.Parent = FolderPage

    local ScriptsLayout = Instance.new("UIListLayout")
    ScriptsLayout.Padding = UDim.new(0, 10)
    ScriptsLayout.Parent = ScriptsContainer

    -- ------------------------------------------------------------
    -- دالة إنشاء بطاقة خريطة
    -- ------------------------------------------------------------
    local function CreateMapCard(parent, imagePath, mapName, scriptCount, onClick)
        local Card = Instance.new("TextButton")
        Card.Name = mapName
        Card.Size = UDim2.new(1, 0, 0, 88)
        Card.BackgroundColor3 = CurrentTheme.Card
        Card.BackgroundTransparency = 0.2
        Card.BorderSizePixel = 0
        Card.AutoButtonColor = false
        Card.Text = ""
        Card.Parent = parent

        local CardCorner = Instance.new("UICorner")
        CardCorner.CornerRadius = UDim.new(0, 12)
        CardCorner.Parent = Card

        CreateGradient(Card, 45)
        CreateInnerGlow(Card, CurrentTheme.Primary, 0.15)

        local CardStroke = Instance.new("UIStroke")
        CardStroke.Color = CurrentTheme.Primary
        CardStroke.Thickness = 1.5
        CardStroke.Transparency = 0.6
        CardStroke.Parent = Card

        local MapImage = Instance.new("ImageLabel")
        MapImage.Name = "MapImage"
        MapImage.Size = UDim2.new(0, 68, 0, 68)
        MapImage.Position = UDim2.new(0, 10, 0.5, 0)
        MapImage.AnchorPoint = Vector2.new(0, 0.5)
        MapImage.BackgroundColor3 = CurrentTheme.Surface
        MapImage.BorderSizePixel = 0
        MapImage.Image = imagePath or ""
        MapImage.ScaleType = Enum.ScaleType.Crop
        MapImage.Parent = Card

        local ImageCorner = Instance.new("UICorner")
        ImageCorner.CornerRadius = UDim.new(0, 10)
        ImageCorner.Parent = MapImage

        local NameLabel = Instance.new("TextLabel")
        NameLabel.Size = UDim2.new(1, -160, 0, 24)
        NameLabel.Position = UDim2.new(0, 90, 0, 18)
        NameLabel.BackgroundTransparency = 1
        NameLabel.Text = mapName
        NameLabel.TextColor3 = CurrentTheme.TextPrimary
        NameLabel.TextSize = 15
        NameLabel.Font = Enum.Font.GothamBold
        NameLabel.TextXAlignment = Enum.TextXAlignment.Left
        NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
        NameLabel.Parent = Card

        local CountLabel = Instance.new("TextLabel")
        CountLabel.Size = UDim2.new(1, -160, 0, 18)
        CountLabel.Position = UDim2.new(0, 90, 0, 46)
        CountLabel.BackgroundTransparency = 1
        CountLabel.Text = string.format("📜 %d سكربت متاح", scriptCount or 0)
        CountLabel.TextColor3 = CurrentTheme.TextSecondary
        CountLabel.TextSize = 12
        CountLabel.Font = Enum.Font.Gotham
        CountLabel.TextXAlignment = Enum.TextXAlignment.Left
        CountLabel.Parent = Card

        local Arrow = Instance.new("TextLabel")
        Arrow.Size = UDim2.new(0, 26, 0, 26)
        Arrow.Position = UDim2.new(1, -38, 0.5, 0)
        Arrow.AnchorPoint = Vector2.new(0, 0.5)
        Arrow.BackgroundTransparency = 1
        Arrow.Text = "←"
        Arrow.TextColor3 = CurrentTheme.Primary
        Arrow.TextSize = 18
        Arrow.Font = Enum.Font.GothamBold
        Arrow.Parent = Card

        Card.MouseEnter:Connect(function()
            TweenService:Create(Card, TweenInfo.new(0.18), {BackgroundTransparency = 0.05}):Play()
            TweenService:Create(CardStroke, TweenInfo.new(0.18), {Thickness = 2, Transparency = 0.3}):Play()
        end)

        Card.MouseLeave:Connect(function()
            TweenService:Create(Card, TweenInfo.new(0.18), {BackgroundTransparency = 0.2}):Play()
            TweenService:Create(CardStroke, TweenInfo.new(0.18), {Thickness = 1.5, Transparency = 0.6}):Play()
        end)

        Card.MouseButton1Click:Connect(function()
            PlaySound(SoundEffects.Click, 0.45)
            if onClick then onClick() end
        end)

        return Card
    end

    -- ------------------------------------------------------------
    -- دالة إنشاء زر سكربت (تسجيل تفعيل حقيقي عند الضغط "تشغيل")
    -- ------------------------------------------------------------
    local function CreateScriptButton(parent, scriptName, scriptDescription, onExecute)
        local Button = Instance.new("Frame")
        Button.Name = scriptName
        Button.Size = UDim2.new(1, 0, 0, 68)
        Button.BackgroundColor3 = CurrentTheme.Card
        Button.BackgroundTransparency = 0.3
        Button.BorderSizePixel = 0
        Button.Parent = parent

        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 10)
        BtnCorner.Parent = Button

        CreateGradient(Button, 90)

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -100, 0, 24)
        Title.Position = UDim2.new(0, 15, 0, 10)
        Title.BackgroundTransparency = 1
        Title.Text = scriptName
        Title.TextColor3 = CurrentTheme.TextPrimary
        Title.TextSize = 14
        Title.Font = Enum.Font.GothamBold
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.TextTruncate = Enum.TextTruncate.AtEnd
        Title.Parent = Button

        local Description = Instance.new("TextLabel")
        Description.Size = UDim2.new(1, -100, 0, 18)
        Description.Position = UDim2.new(0, 15, 0, 36)
        Description.BackgroundTransparency = 1
        Description.Text = scriptDescription or "تشغيل السكربت"
        Description.TextColor3 = CurrentTheme.TextSecondary
        Description.TextSize = 11
        Description.Font = Enum.Font.Gotham
        Description.TextXAlignment = Enum.TextXAlignment.Left
        Description.TextTruncate = Enum.TextTruncate.AtEnd
        Description.Parent = Button

        local ExecuteBtn = Instance.new("TextButton")
        ExecuteBtn.Name = "Execute"
        ExecuteBtn.Size = UDim2.new(0, 76, 0, 30)
        ExecuteBtn.Position = UDim2.new(1, -88, 0.5, 0)
        ExecuteBtn.AnchorPoint = Vector2.new(0, 0.5)
        ExecuteBtn.BackgroundColor3 = CurrentTheme.Success
        ExecuteBtn.BackgroundTransparency = 0.15
        ExecuteBtn.BorderSizePixel = 0
        ExecuteBtn.Text = "تشغيل"
        ExecuteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        ExecuteBtn.TextSize = 12
        ExecuteBtn.Font = Enum.Font.GothamBold
        ExecuteBtn.AutoButtonColor = false
        ExecuteBtn.Parent = Button

        local ExeCorner = Instance.new("UICorner")
        ExeCorner.CornerRadius = UDim.new(0, 8)
        ExeCorner.Parent = ExecuteBtn

        ExecuteBtn.MouseEnter:Connect(function()
            TweenService:Create(ExecuteBtn, TweenInfo.new(0.18), {BackgroundTransparency = 0.02}):Play()
        end)
        ExecuteBtn.MouseLeave:Connect(function()
            TweenService:Create(ExecuteBtn, TweenInfo.new(0.18), {BackgroundTransparency = 0.15}):Play()
        end)

        ExecuteBtn.MouseButton1Click:Connect(function()
            PlaySound(SoundEffects.Success, 0.55)

            TweenService:Create(ExecuteBtn, TweenInfo.new(0.1), {Size = UDim2.new(0, 72, 0, 27)}):Play()
            task.wait(0.1)
            TweenService:Create(ExecuteBtn, TweenInfo.new(0.1), {Size = UDim2.new(0, 76, 0, 30)}):Play()

            ExecuteBtn.Text = "✓ تم"

            -- ★ تسجيل حقيقي في نظام العد: يزيد رقم "إجمالي التفعيلات"
            RegisterUser(LocalPlayer.UserId, LocalPlayer.Name, LocalPlayer.DisplayName)

            UltimateHub:ShowNotification(
                "✅ تم تفعيل السكربت",
                "تم تشغيل: " .. scriptName,
                Icons.Check,
                "success",
                3
            )

            if onExecute then onExecute() end

            task.wait(1.4)
            if ExecuteBtn and ExecuteBtn.Parent then
                ExecuteBtn.Text = "تشغيل"
            end
        end)

        return Button
    end

    -- ------------------------------------------------------------
    -- التنقل بين الصفحات
    -- ------------------------------------------------------------
    local function SwitchToFolder(mapData)
        Hub.CurrentPage = "folder"
        Hub.CurrentMap = mapData

        FolderTitle.Text = "📁 " .. mapData.name

        for _, child in ipairs(ScriptsContainer:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end

        if mapData.scripts then
            for _, scr in ipairs(mapData.scripts) do
                CreateScriptButton(ScriptsContainer, scr.name, scr.description, scr.execute)
            end
        end

        MainPage.Visible = true
        FolderPage.Visible = true
        FolderPage.Position = UDim2.new(1, 0, 0, 70)

        TweenService:Create(MainPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(-1, 0, 0, 70)
        }):Play()

        local slideIn = TweenService:Create(FolderPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 20, 0, 70)
        })
        slideIn:Play()
        slideIn.Completed:Wait()
        MainPage.Visible = false
    end

    local function SwitchToMain()
        Hub.CurrentPage = "main"

        MainPage.Visible = true
        MainPage.Position = UDim2.new(-1, 0, 0, 70)

        if FolderPage.Visible then
            TweenService:Create(FolderPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, 0, 0, 70)
            }):Play()
        end

        if ProfilePage.Visible then
            TweenService:Create(ProfilePage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, 0, 0, 70)
            }):Play()
        end

        local slideIn = TweenService:Create(MainPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 20, 0, 70)
        })
        slideIn:Play()
        slideIn.Completed:Wait()
        FolderPage.Visible = false
        ProfilePage.Visible = false
    end

    local function SwitchToProfile()
        Hub.CurrentPage = "profile"

        MainPage.Visible = true
        ProfilePage.Visible = true
        FolderPage.Visible = false
        ProfilePage.Position = UDim2.new(1, 0, 0, 70)

        TweenService:Create(MainPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(-1, 0, 0, 70)
        }):Play()

        local slideIn = TweenService:Create(ProfilePage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 70)
        })
        slideIn:Play()
        slideIn.Completed:Wait()
        MainPage.Visible = false

        PlaySound(SoundEffects.Whoosh, 0.3)
    end

    BackButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.3)
        SwitchToMain()
    end)
    ProfileBackButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.3)
        SwitchToMain()
    end)

    TitleAvatarButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.35)
        SwitchToProfile()
    end)

    -- ------------------------------------------------------------
    -- إضافة خريطة
    -- ------------------------------------------------------------
    function Hub:AddMap(mapData)
        table.insert(Hub.Maps, mapData)

        local card = CreateMapCard(
            MapsScroll,
            mapData.image,
            mapData.name,
            mapData.scriptCount or (mapData.scripts and #mapData.scripts) or 0,
            function()
                SwitchToFolder(mapData)
            end
        )
        card.Name = mapData.name
    end

    -- ------------------------------------------------------------
    -- نظام البحث
    -- ------------------------------------------------------------
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = SearchBox.Text:lower()
        for _, card in ipairs(MapsScroll:GetChildren()) do
            if card:IsA("TextButton") then
                card.Visible = (searchText == "" or card.Name:lower():find(searchText, 1, true) ~= nil)
            end
        end
    end)

    -- ------------------------------------------------------------
    -- تغيير الثيم
    -- ------------------------------------------------------------
    local function ApplyTheme(theme)
        CurrentTheme = theme

        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

        TweenService:Create(MainFrame, tweenInfo, {BackgroundColor3 = theme.Background, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(TitleBar, tweenInfo, {BackgroundColor3 = theme.Surface, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(TitleFix, tweenInfo, {BackgroundColor3 = theme.Surface, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(MainStroke, tweenInfo, {Color = theme.Primary}):Play()

        UltimateHub:ShowNotification(
            "🎨 تم تغيير الثيم",
            "الثيم الحالي: " .. theme.Name,
            Icons.Theme,
            "info",
            3
        )
    end

    ThemeButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.4)
        CurrentThemeIndex = CurrentThemeIndex + 1
        if CurrentThemeIndex > #ThemeNames then
            CurrentThemeIndex = 1
        end

        ApplyTheme(Themes[ThemeNames[CurrentThemeIndex]])

        TweenService:Create(ThemeButton, TweenInfo.new(0.4), {Rotation = 360}):Play()
        task.wait(0.4)
        ThemeButton.Rotation = 0
    end)

    -- ------------------------------------------------------------
    -- التكبير/التصغير (مع تبديل الأيقونة)
    -- ------------------------------------------------------------
    local function ResizeWindow()
        local screenSize = workspace.CurrentCamera.ViewportSize
        local newSize

        if CurrentSize == "Normal" then
            CurrentSize = "Minimized"
            newSize = UDim2.new(0, math.min(screenSize.X - 60, SizeStates.Minimized.Width), 0, math.min(screenSize.Y - 100, SizeStates.Minimized.Height))
            ResizeButton.Image = Icons.Maximize
        elseif CurrentSize == "Minimized" then
            CurrentSize = "Maximized"
            newSize = UDim2.new(0, math.min(screenSize.X - 20, SizeStates.Maximized.Width), 0, math.min(screenSize.Y - 40, SizeStates.Maximized.Height))
            ResizeButton.Image = Icons.Expand
        else
            CurrentSize = "Normal"
            newSize = UDim2.new(0, math.min(screenSize.X - 40, SizeStates.Normal.Width), 0, math.min(screenSize.Y - 80, SizeStates.Normal.Height))
            ResizeButton.Image = Icons.Minimize
        end

        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = newSize
        }):Play()

        PlaySound(SoundEffects.Whoosh, 0.35)

        local sizeLabel = (CurrentSize == "Normal" and "عادي") or (CurrentSize == "Minimized" and "صغير") or "كبير"
        UltimateHub:ShowNotification("📐 تغيير الحجم", "الحجم الحالي: " .. sizeLabel, Icons.Maximize, "info", 2)
    end

    ResizeButton.MouseButton1Click:Connect(ResizeWindow)

    -- ------------------------------------------------------------
    -- الفتح / الإغلاق
    -- ------------------------------------------------------------
    local isOpen = false

    local function ToggleUI()
        isOpen = not isOpen

        if isOpen then
            MainFrame.Visible = true

            local screenSize = workspace.CurrentCamera.ViewportSize
            local targetWidth = math.min(screenSize.X - 40, SizeStates.Normal.Width)
            local targetHeight = math.min(screenSize.Y - 80, SizeStates.Normal.Height)

            TweenService:Create(MainFrame, TweenInfo.new(0.65, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, targetWidth, 0, targetHeight)
            }):Play()

            TweenService:Create(PlayerAvatar, TweenInfo.new(0.5), {Rotation = 180}):Play()

            PlaySound(SoundEffects.Whoosh, 0.4)

            UltimateHub:ShowNotification("🎮 مرحباً بك!", "تم فتح " .. scriptName, Icons.Star, "success", 2.5)
        else
            local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            })
            closeTween:Play()
            closeTween.Completed:Connect(function()
                MainFrame.Visible = false
            end)

            TweenService:Create(PlayerAvatar, TweenInfo.new(0.5), {Rotation = 0}):Play()
            PlaySound(SoundEffects.Whoosh, 0.3, 0.85)
        end
    end

    CloseButton.MouseButton1Click:Connect(ToggleUI)

    task.wait(0.6)
    ToggleUI()

    -- زر عائم لإعادة الفتح بعد الإغلاق
    local FloatButton = Instance.new("ImageButton")
    FloatButton.Name = "FloatButton"
    FloatButton.Size = UDim2.new(0, 52, 0, 52)
    FloatButton.Position = UDim2.new(0, 20, 0.5, 0)
    FloatButton.AnchorPoint = Vector2.new(0, 0.5)
    FloatButton.BackgroundColor3 = CurrentTheme.Primary
    FloatButton.Image = Icons.Menu
    FloatButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
    FloatButton.Visible = false
    FloatButton.Parent = ScreenGui

    local FloatCorner = Instance.new("UICorner")
    FloatCorner.CornerRadius = UDim.new(1, 0)
    FloatCorner.Parent = FloatButton

    MakeDraggable(FloatButton, FloatButton)

    CloseButton.MouseButton1Click:Connect(function()
        task.wait(0.6)
        FloatButton.Visible = true
    end)

    FloatButton.MouseButton1Click:Connect(function()
        FloatButton.Visible = false
        ToggleUI()
    end)

    return Hub
end

return UltimateHub
