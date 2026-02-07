--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║      🌟 Ultimate Premium Hub - Perfect Edition 🌟           ║
    ║           النسخة المثالية الفخمة مع كل المميزات              ║
    ╚═══════════════════════════════════════════════════════════════╝
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer

local UltimateHub = {}
UltimateHub.__index = UltimateHub

-- ═══════════════════════════════════════════════════════════════
--                    🎨 نظام الثيمات المتقدم
-- ═══════════════════════════════════════════════════════════════
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

-- ═══════════════════════════════════════════════════════════════
--                    🎯 أيقونات متقدمة
-- ═══════════════════════════════════════════════════════════════
local Icons = {
    Close = "rbxassetid://10747384394",
    Minimize = "rbxassetid://10734896206",
    Maximize = "rbxassetid://10734950309",
    Expand = "rbxassetid://10747372992",
    Theme = "rbxassetid://10734950309",
    Palette = "rbxassetid://10734920149",
    Menu = "rbxassetid://10734896206",
    Search = "rbxassetid://10734898102",
    Play = "rbxassetid://10734942024",
    Star = "rbxassetid://10734952273",
    Users = "rbxassetid://10747373176",
    Check = "rbxassetid://10734896144",
    Back = "rbxassetid://10734884548",
    User = "rbxassetid://10747373176",
    PlayerJoin = "rbxassetid://10723407389",
    Info = "rbxassetid://10723434711",
    Settings = "rbxassetid://10734949856",
    Clock = "rbxassetid://10734896206",
    Activity = "rbxassetid://10723407389"
}

-- ═══════════════════════════════════════════════════════════════
--                    🔊 نظام الأصوات
-- ═══════════════════════════════════════════════════════════════
local Sounds = {
    Notification = "rbxassetid://9770089602",
    Success = "rbxassetid://9770089602", 
    Error = "rbxassetid://9770089119",
    Click = "rbxassetid://9770089602",
    Toggle = "rbxassetid://9770089602",
    PlayerJoin = "rbxassetid://9770089602"
}

local function PlaySound(soundId, volume)
    volume = volume or 0.5
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = volume
    sound.Parent = SoundService
    sound:Play()
    
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- ═══════════════════════════════════════════════════════════════
--                    📊 نظام عد المستخدمين المحسّن
-- ═══════════════════════════════════════════════════════════════
local UserCountData = {
    TotalUsers = 0,
    ActiveUsers = {},
    SessionStart = os.time(),
    DataFile = "HubUserData_" .. game.PlaceId .. ".json"
}

-- حفظ البيانات
local function SaveUserData()
    local data = {
        users = UserCountData.ActiveUsers,
        total = UserCountData.TotalUsers,
        lastUpdate = os.time()
    }
    -- في التطبيق الحقيقي، استخدم DataStore
    return data
end

-- تحميل البيانات
local function LoadUserData()
    -- في التطبيق الحقيقي، استخدم DataStore
    return nil
end

local function UpdateUserCount()
    UserCountData.TotalUsers = #UserCountData.ActiveUsers
    return UserCountData.TotalUsers
end

local function AddUser(userId, username, displayName)
    local userExists = false
    for _, user in pairs(UserCountData.ActiveUsers) do
        if user.UserId == userId then
            userExists = true
            user.LastSeen = os.time()
            break
        end
    end
    
    if not userExists then
        table.insert(UserCountData.ActiveUsers, {
            UserId = userId,
            Username = username,
            DisplayName = displayName,
            JoinTime = os.time(),
            LastSeen = os.time()
        })
        UpdateUserCount()
        return true -- مستخدم جديد
    end
    
    UpdateUserCount()
    return false -- مستخدم موجود
end

local function RemoveUser(userId)
    for i, user in pairs(UserCountData.ActiveUsers) do
        if user.UserId == userId then
            table.remove(UserCountData.ActiveUsers, i)
            UpdateUserCount()
            return true
        end
    end
    return false
end

-- تسجيل المستخدم الحالي
AddUser(LocalPlayer.UserId, LocalPlayer.Name, LocalPlayer.DisplayName)

-- ═══════════════════════════════════════════════════════════════
--                    👨‍💻 معلومات المطورين
-- ═══════════════════════════════════════════════════════════════
local DeveloperInfo = {
    {
        Name = "مطور السكربت",
        Username = "@DevPro",
        UserId = 1,
        Rank = "مطور رئيسي",
        Verified = true,
        RankColor = Color3.fromRGB(255, 215, 0)
    }
}

-- ═══════════════════════════════════════════════════════════════
--                    ✨ وظائف التأثيرات
-- ═══════════════════════════════════════════════════════════════

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
    
    spawn(function()
        while Gradient and Gradient.Parent do
            local tween = TweenService:Create(Gradient, TweenInfo.new(4, Enum.EasingStyle.Linear), {
                Rotation = rotation + 360
            })
            tween:Play()
            tween.Completed:Wait()
            Gradient.Rotation = rotation
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
    Glow.ZIndex = parent.ZIndex - 1
    Glow.Parent = parent
    
    spawn(function()
        while Glow and Glow.Parent do
            TweenService:Create(Glow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                ImageColor3 = CurrentTheme.Secondary,
                ImageTransparency = 1 - (intensity + 0.1)
            }):Play()
            wait(2)
            TweenService:Create(Glow, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                ImageColor3 = color,
                ImageTransparency = 1 - intensity
            }):Play()
            wait(2)
        end
    end)
    
    return Glow
end

local function CreateStroke(parent, color, thickness, transparency)
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = color or CurrentTheme.Primary
    Stroke.Thickness = thickness or 2
    Stroke.Transparency = transparency or 0.5
    Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Stroke.Parent = parent
    
    spawn(function()
        while Stroke and Stroke.Parent do
            TweenService:Create(Stroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Color = CurrentTheme.Secondary
            }):Play()
            wait(2)
            TweenService:Create(Stroke, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Color = color or CurrentTheme.Primary
            }):Play()
            wait(2)
        end
    end)
    
    return Stroke
end

local function CreateCorner(radius)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, radius)
    return Corner
end

-- ═══════════════════════════════════════════════════════════════
--                    🔔 نظام الإشعارات الفخم الجديد
-- ═══════════════════════════════════════════════════════════════
local NotificationQueue = {}
local NotificationContainer = nil

function UltimateHub:ShowNotification(title, message, icon, notifType, duration)
    duration = duration or 4
    
    if not NotificationContainer then
        NotificationContainer = Instance.new("ScreenGui")
        NotificationContainer.Name = "NotificationContainer"
        NotificationContainer.DisplayOrder = 999
        NotificationContainer.ResetOnSpawn = false
        NotificationContainer.Parent = CoreGui
    end
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 320, 0, 80)
    NotifFrame.Position = UDim2.new(1, 350, 0, 20 + (#NotificationQueue * 90))
    NotifFrame.BackgroundColor3 = CurrentTheme.Surface
    NotifFrame.BackgroundTransparency = 0.15
    NotifFrame.BorderSizePixel = 0
    NotifFrame.ZIndex = 10
    NotifFrame.Parent = NotificationContainer
    
    CreateCorner(18).Parent = NotifFrame
    CreateGlassEffect(NotifFrame)
    
    local primaryColor, secondaryColor, soundId
    if notifType == "success" then
        primaryColor = CurrentTheme.Success
        secondaryColor = Color3.fromRGB(100, 255, 150)
        soundId = Sounds.Success
    elseif notifType == "error" then
        primaryColor = CurrentTheme.Error
        secondaryColor = Color3.fromRGB(255, 120, 120)
        soundId = Sounds.Error
    elseif notifType == "warning" then
        primaryColor = CurrentTheme.Warning
        secondaryColor = Color3.fromRGB(255, 200, 100)
        soundId = Sounds.Notification
    else
        primaryColor = CurrentTheme.Primary
        secondaryColor = CurrentTheme.Secondary
        soundId = Sounds.Notification
    end
    
    CreateStroke(NotifFrame, primaryColor, 1.5, 0.3)
    CreateInnerGlow(NotifFrame, primaryColor, 0.15)
    
    -- شريط جانبي
    local SideBar = Instance.new("Frame")
    SideBar.Size = UDim2.new(0, 4, 1, 0)
    SideBar.BackgroundColor3 = primaryColor
    SideBar.BorderSizePixel = 0
    SideBar.ZIndex = 11
    SideBar.Parent = NotifFrame
    
    CreateGradient(SideBar, 90, primaryColor, secondaryColor)
    
    -- أيقونة
    local IconContainer = Instance.new("Frame")
    IconContainer.Size = UDim2.new(0, 45, 0, 45)
    IconContainer.Position = UDim2.new(0, 12, 0.5, -22.5)
    IconContainer.BackgroundColor3 = primaryColor
    IconContainer.BackgroundTransparency = 0.7
    IconContainer.BorderSizePixel = 0
    IconContainer.ZIndex = 11
    IconContainer.Parent = NotifFrame
    
    CreateCorner(12).Parent = IconContainer
    
    local IconImage = Instance.new("ImageLabel")
    IconImage.Size = UDim2.new(0, 28, 0, 28)
    IconImage.Position = UDim2.new(0.5, -14, 0.5, -14)
    IconImage.BackgroundTransparency = 1
    IconImage.Image = icon or Icons.Star
    IconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
    IconImage.ZIndex = 12
    IconImage.Parent = IconContainer
    
    -- أنيميشن الأيقونة
    spawn(function()
        for i = 1, 3 do
            TweenService:Create(IconImage, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Rotation = 15,
                Size = UDim2.new(0, 32, 0, 32)
            }):Play()
            wait(0.3)
            TweenService:Create(IconImage, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Rotation = -15,
                Size = UDim2.new(0, 28, 0, 28)
            }):Play()
            wait(0.3)
        end
        IconImage.Rotation = 0
    end)
    
    -- العنوان
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -70, 0, 24)
    TitleLabel.Position = UDim2.new(0, 64, 0, 12)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = CurrentTheme.TextPrimary
    TitleLabel.TextSize = 15
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 11
    TitleLabel.Parent = NotifFrame
    
    -- الرسالة
    local MessageLabel = Instance.new("TextLabel")
    MessageLabel.Size = UDim2.new(1, -70, 0, 36)
    MessageLabel.Position = UDim2.new(0, 64, 0, 36)
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Text = message
    MessageLabel.TextColor3 = CurrentTheme.TextSecondary
    MessageLabel.TextSize = 13
    MessageLabel.Font = Enum.Font.Gotham
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
    MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
    MessageLabel.TextWrapped = true
    MessageLabel.ZIndex = 11
    MessageLabel.Parent = NotifFrame
    
    -- شريط التقدم
    local ProgressBar = Instance.new("Frame")
    ProgressBar.Size = UDim2.new(1, 0, 0, 2)
    ProgressBar.Position = UDim2.new(0, 0, 1, -2)
    ProgressBar.BackgroundColor3 = primaryColor
    ProgressBar.BorderSizePixel = 0
    ProgressBar.ZIndex = 11
    ProgressBar.Parent = NotifFrame
    
    CreateGradient(ProgressBar, 90, primaryColor, secondaryColor)
    
    table.insert(NotificationQueue, NotifFrame)
    
    -- صوت
    PlaySound(soundId, 0.4)
    
    -- أنيميشن الدخول
    local slideIn = TweenService:Create(NotifFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -330, 0, 20 + ((#NotificationQueue - 1) * 90))
    })
    slideIn:Play()
    
    -- أنيميشن شريط التقدم
    TweenService:Create(ProgressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 0, 2)
    }):Play()
    
    wait(duration)
    
    -- أنيميشن الخروج
    local slideOut = TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(1, 350, 0, NotifFrame.Position.Y.Offset),
        BackgroundTransparency = 1
    })
    slideOut:Play()
    
    slideOut.Completed:Connect(function()
        for i, notif in pairs(NotificationQueue) do
            if notif == NotifFrame then
                table.remove(NotificationQueue, i)
                break
            end
        end
        NotifFrame:Destroy()
        
        -- إعادة ترتيب الإشعارات
        for i, notif in pairs(NotificationQueue) do
            TweenService:Create(notif, TweenInfo.new(0.3), {
                Position = UDim2.new(1, -330, 0, 20 + ((i - 1) * 90))
            }):Play()
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════
--                    👥 إشعار دخول لاعب جديد
-- ═══════════════════════════════════════════════════════════════
function UltimateHub:ShowPlayerJoinNotification(player)
    if not NotificationContainer then
        NotificationContainer = Instance.new("ScreenGui")
        NotificationContainer.Name = "NotificationContainer"
        NotificationContainer.DisplayOrder = 999
        NotificationContainer.ResetOnSpawn = false
        NotificationContainer.Parent = CoreGui
    end
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 350, 0, 110)
    NotifFrame.Position = UDim2.new(1, 370, 0, 20 + (#NotificationQueue * 120))
    NotifFrame.BackgroundColor3 = CurrentTheme.Card
    NotifFrame.BackgroundTransparency = 0.1
    NotifFrame.BorderSizePixel = 0
    NotifFrame.ZIndex = 10
    NotifFrame.Parent = NotificationContainer
    
    CreateCorner(20).Parent = NotifFrame
    CreateGlassEffect(NotifFrame)
    CreateStroke(NotifFrame, CurrentTheme.Info, 2, 0.3)
    CreateInnerGlow(NotifFrame, CurrentTheme.Info, 0.2)
    
    -- صورة اللاعب
    local PlayerImage = Instance.new("ImageLabel")
    PlayerImage.Size = UDim2.new(0, 60, 0, 60)
    PlayerImage.Position = UDim2.new(0, 15, 0, 15)
    PlayerImage.BackgroundColor3 = CurrentTheme.Surface
    PlayerImage.BackgroundTransparency = 0.3
    PlayerImage.BorderSizePixel = 0
    PlayerImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=150&height=150&format=png"
    PlayerImage.ZIndex = 11
    PlayerImage.Parent = NotifFrame
    
    CreateCorner(30).Parent = PlayerImage
    CreateStroke(PlayerImage, CurrentTheme.Primary, 2, 0.4)
    
    -- العنوان
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -90, 0, 22)
    TitleLabel.Position = UDim2.new(0, 85, 0, 12)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "🎮 دخل لاعب جديد!"
    TitleLabel.TextColor3 = CurrentTheme.Info
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 11
    TitleLabel.Parent = NotifFrame
    
    -- الاسم
    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1, -90, 0, 18)
    NameLabel.Position = UDim2.new(0, 85, 0, 36)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = "👤 الاسم: " .. player.DisplayName
    NameLabel.TextColor3 = CurrentTheme.TextPrimary
    NameLabel.TextSize = 13
    NameLabel.Font = Enum.Font.Gotham
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.ZIndex = 11
    NameLabel.Parent = NotifFrame
    
    -- اليوزر
    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Size = UDim2.new(1, -90, 0, 18)
    UsernameLabel.Position = UDim2.new(0, 85, 0, 54)
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.Text = "📝 اليوزر: @" .. player.Name
    UsernameLabel.TextColor3 = CurrentTheme.TextSecondary
    UsernameLabel.TextSize = 12
    UsernameLabel.Font = Enum.Font.Gotham
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsernameLabel.ZIndex = 11
    UsernameLabel.Parent = NotifFrame
    
    -- الآيدي
    local IdLabel = Instance.new("TextLabel")
    IdLabel.Size = UDim2.new(1, -90, 0, 18)
    IdLabel.Position = UDim2.new(0, 85, 0, 72)
    IdLabel.BackgroundTransparency = 1
    IdLabel.Text = "🆔 الآيدي: " .. player.UserId
    IdLabel.TextColor3 = CurrentTheme.TextSecondary
    IdLabel.TextSize = 12
    IdLabel.Font = Enum.Font.Gotham
    IdLabel.TextXAlignment = Enum.TextXAlignment.Left
    IdLabel.ZIndex = 11
    IdLabel.Parent = NotifFrame
    
    -- شريط جانبي متحرك
    local SideBar = Instance.new("Frame")
    SideBar.Size = UDim2.new(0, 5, 0, 0)
    SideBar.Position = UDim2.new(0, 0, 0, 0)
    SideBar.BackgroundColor3 = CurrentTheme.Info
    SideBar.BorderSizePixel = 0
    SideBar.ZIndex = 12
    SideBar.Parent = NotifFrame
    
    CreateGradient(SideBar, 90, CurrentTheme.Info, CurrentTheme.Primary)
    
    TweenService:Create(SideBar, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 5, 1, 0)
    }):Play()
    
    table.insert(NotificationQueue, NotifFrame)
    
    -- صوت
    PlaySound(Sounds.PlayerJoin, 0.5)
    
    -- أنيميشن الدخول
    local slideIn = TweenService:Create(NotifFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(1, -360, 0, 20 + ((#NotificationQueue - 1) * 120))
    })
    slideIn:Play()
    
    -- أنيميشن الصورة
    spawn(function()
        for i = 1, 2 do
            TweenService:Create(PlayerImage, TweenInfo.new(0.5, Enum.EasingStyle.Elastic), {
                Size = UDim2.new(0, 65, 0, 65)
            }):Play()
            wait(0.5)
            TweenService:Create(PlayerImage, TweenInfo.new(0.5, Enum.EasingStyle.Elastic), {
                Size = UDim2.new(0, 60, 0, 60)
            }):Play()
            wait(0.5)
        end
    end)
    
    wait(6)
    
    -- أنيميشن الخروج
    local slideOut = TweenService:Create(NotifFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(1, 370, 0, NotifFrame.Position.Y.Offset),
        BackgroundTransparency = 1
    })
    slideOut:Play()
    
    slideOut.Completed:Connect(function()
        for i, notif in pairs(NotificationQueue) do
            if notif == NotifFrame then
                table.remove(NotificationQueue, i)
                break
            end
        end
        NotifFrame:Destroy()
        
        for i, notif in pairs(NotificationQueue) do
            TweenService:Create(notif, TweenInfo.new(0.3), {
                Position = UDim2.new(1, notif.Size.X.Offset > 330 and -360 or -330, 0, 20 + ((i - 1) * (notif.Size.Y.Offset + 10)))
            }):Play()
        end
    end)
end

-- مراقبة دخول اللاعبين
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        local isNew = AddUser(player.UserId, player.Name, player.DisplayName)
        if isNew then
            wait(1)
            UltimateHub:ShowPlayerJoinNotification(player)
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveUser(player.UserId)
end)

-- ═══════════════════════════════════════════════════════════════
--                    🖼️ إنشاء صورة اللاعب
-- ═══════════════════════════════════════════════════════════════
local function CreatePlayerAvatar(parent, userId, size, position)
    local AvatarFrame = Instance.new("Frame")
    AvatarFrame.Size = size or UDim2.new(0, 80, 0, 80)
    AvatarFrame.Position = position or UDim2.new(0, 0, 0, 0)
    AvatarFrame.BackgroundColor3 = CurrentTheme.Card
    AvatarFrame.BackgroundTransparency = CurrentTheme.Transparency
    AvatarFrame.BorderSizePixel = 0
    AvatarFrame.Parent = parent
    
    CreateCorner(size and size.X.Offset / 2 or 40).Parent = AvatarFrame
    CreateGlassEffect(AvatarFrame)
    CreateStroke(AvatarFrame, CurrentTheme.Primary, 3, 0.3)
    CreateInnerGlow(AvatarFrame, CurrentTheme.Primary, 0.2)
    
    local Avatar = Instance.new("ImageLabel")
    Avatar.Size = UDim2.new(1, -8, 1, -8)
    Avatar.Position = UDim2.new(0, 4, 0, 4)
    Avatar.BackgroundTransparency = 1
    Avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=150&height=150&format=png"
    Avatar.Parent = AvatarFrame
    
    CreateCorner((size and size.X.Offset / 2 or 40) - 4).Parent = Avatar
    
    spawn(function()
        while AvatarFrame and AvatarFrame.Parent do
            TweenService:Create(AvatarFrame, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = 5
            }):Play()
            wait(3)
            TweenService:Create(AvatarFrame, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = -5
            }):Play()
            wait(3)
        end
    end)
    
    return AvatarFrame
end

-- ═══════════════════════════════════════════════════════════════
--                    🔘 زر تشغيل/إيقاف iOS
-- ═══════════════════════════════════════════════════════════════
local function CreateIOSToggle(parent, position, defaultState, callback)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(0, 56, 0, 32)
    ToggleFrame.Position = position
    ToggleFrame.BackgroundColor3 = defaultState and CurrentTheme.Success or Color3.fromRGB(60, 60, 70)
    ToggleFrame.BackgroundTransparency = 0.3
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.Parent = parent
    
    CreateCorner(16).Parent = ToggleFrame
    CreateGlassEffect(ToggleFrame)
    CreateStroke(ToggleFrame, defaultState and CurrentTheme.Success or Color3.fromRGB(80, 80, 90), 2, 0.4)
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 26, 0, 26)
    ToggleButton.Position = defaultState and UDim2.new(0, 27, 0, 3) or UDim2.new(0, 3, 0, 3)
    ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.BackgroundTransparency = 0.1
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Text = ""
    ToggleButton.AutoButtonColor = false
    ToggleButton.ZIndex = 2
    ToggleButton.Parent = ToggleFrame
    
    CreateCorner(13).Parent = ToggleButton
    CreateStroke(ToggleButton, Color3.fromRGB(200, 200, 200), 1, 0.3)
    
    local isOn = defaultState
    
    ToggleButton.MouseButton1Click:Connect(function()
        isOn = not isOn
        
        -- صوت
        PlaySound(Sounds.Toggle, 0.4)
        
        -- أنيميشن
        TweenService:Create(ToggleFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            BackgroundColor3 = isOn and CurrentTheme.Success or Color3.fromRGB(60, 60, 70)
        }):Play()
        
        TweenService:Create(ToggleButton, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = isOn and UDim2.new(0, 27, 0, 3) or UDim2.new(0, 3, 0, 3)
        }):Play()
        
        -- تغيير الحد
        for _, child in pairs(ToggleFrame:GetChildren()) do
            if child:IsA("UIStroke") then
                TweenService:Create(child, TweenInfo.new(0.3), {
                    Color = isOn and CurrentTheme.Success or Color3.fromRGB(80, 80, 90)
                }):Play()
            end
        end
        
        if callback then
            callback(isOn)
        end
        
        -- إشعار
        UltimateHub:ShowNotification(
            isOn and "✅ تم التفعيل" or "⏸️ تم الإيقاف",
            isOn and "تم تشغيل الميزة بنجاح" or "تم إيقاف الميزة مؤقتاً",
            isOn and Icons.Check or Icons.Close,
            isOn and "success" or "info",
            2
        )
    end)
    
    return ToggleFrame, isOn
end

-- ═══════════════════════════════════════════════════════════════
--                    📱 إنشاء زر
-- ═══════════════════════════════════════════════════════════════
local function CreateButton(parent, text, icon, color, position, size, callback)
    local Button = Instance.new("TextButton")
    Button.Size = size or UDim2.new(0, 290, 0, 58)
    Button.Position = position or UDim2.new(0.5, -145, 0, 0)
    Button.BackgroundColor3 = color or CurrentTheme.Primary
    Button.BackgroundTransparency = CurrentTheme.Transparency
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = parent
    
    CreateCorner(17).Parent = Button
    CreateGlassEffect(Button)
    CreateStroke(Button, color or CurrentTheme.Primary, 2, 0.4)
    CreateInnerGlow(Button, color or CurrentTheme.Primary, 0.15)
    CreateGradient(Button, 45)
    
    if icon then
        local IconImage = Instance.new("ImageLabel")
        IconImage.Size = UDim2.new(0, 30, 0, 30)
        IconImage.Position = UDim2.new(0, 16, 0.5, -15)
        IconImage.BackgroundTransparency = 1
        IconImage.Image = icon
        IconImage.ImageColor3 = CurrentTheme.TextPrimary
        IconImage.Parent = Button
    end
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, icon and -58 or -32, 1, 0)
    TextLabel.Position = UDim2.new(0, icon and 52 or 16, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = text
    TextLabel.TextColor3 = CurrentTheme.TextPrimary
    TextLabel.TextSize = 17
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Button
    
    Button.MouseButton1Down:Connect(function()
        PlaySound(Sounds.Click, 0.3)
        TweenService:Create(Button, TweenInfo.new(0.1), {
            Size = (size or UDim2.new(0, 290, 0, 58)) - UDim2.new(0, 6, 0, 4),
            BackgroundTransparency = CurrentTheme.Transparency - 0.05
        }):Play()
    end)
    
    Button.MouseButton1Up:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.3, Enum.EasingStyle.Elastic), {
            Size = size or UDim2.new(0, 290, 0, 58),
            BackgroundTransparency = CurrentTheme.Transparency
        }):Play()
    end)
    
    if callback then
        Button.MouseButton1Click:Connect(callback)
    end
    
    return Button
end

-- ═══════════════════════════════════════════════════════════════
--                    🖼️ بطاقة الخريطة
-- ═══════════════════════════════════════════════════════════════
local function CreateMapCard(parent, imageId, mapName, scriptCount, position, callback)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(0, 170, 0, 210)
    Card.Position = position
    Card.BackgroundColor3 = CurrentTheme.Card
    Card.BackgroundTransparency = CurrentTheme.Transparency
    Card.BorderSizePixel = 0
    Card.Parent = parent
    
    CreateCorner(24).Parent = Card
    CreateGlassEffect(Card)
    CreateStroke(Card, CurrentTheme.Primary, 2, 0.5)
    
    local ImageContainer = Instance.new("Frame")
    ImageContainer.Size = UDim2.new(1, -14, 0, 120)
    ImageContainer.Position = UDim2.new(0, 7, 0, 7)
    ImageContainer.BackgroundColor3 = CurrentTheme.Background
    ImageContainer.BackgroundTransparency = 0.2
    ImageContainer.BorderSizePixel = 0
    ImageContainer.ClipsDescendants = true
    ImageContainer.Parent = Card
    
    CreateCorner(20).Parent = ImageContainer
    
    local MapImage = Instance.new("ImageLabel")
    MapImage.Size = UDim2.new(1, 0, 1, 0)
    MapImage.BackgroundTransparency = 1
    MapImage.Image = imageId or ""
    MapImage.ScaleType = Enum.ScaleType.Crop
    MapImage.Parent = ImageContainer
    
    local MapNameLabel = Instance.new("TextLabel")
    MapNameLabel.Size = UDim2.new(1, -14, 0, 34)
    MapNameLabel.Position = UDim2.new(0, 7, 0, 130)
    MapNameLabel.BackgroundTransparency = 1
    MapNameLabel.Text = mapName
    MapNameLabel.TextColor3 = CurrentTheme.TextPrimary
    MapNameLabel.TextSize = 16
    MapNameLabel.Font = Enum.Font.GothamBold
    MapNameLabel.TextXAlignment = Enum.TextXAlignment.Center
    MapNameLabel.TextWrapped = true
    MapNameLabel.Parent = Card
    
    local CountBadge = Instance.new("Frame")
    CountBadge.Size = UDim2.new(0, 90, 0, 26)
    CountBadge.Position = UDim2.new(0.5, -45, 0, 166)
    CountBadge.BackgroundColor3 = CurrentTheme.Primary
    CountBadge.BackgroundTransparency = 0.2
    CountBadge.BorderSizePixel = 0
    CountBadge.Parent = Card
    
    CreateCorner(13).Parent = CountBadge
    CreateGradient(CountBadge, 90)
    
    local CountLabel = Instance.new("TextLabel")
    CountLabel.Size = UDim2.new(1, 0, 1, 0)
    CountLabel.BackgroundTransparency = 1
    CountLabel.Text = scriptCount .. " سكربت 📜"
    CountLabel.TextColor3 = CurrentTheme.TextPrimary
    CountLabel.TextSize = 14
    CountLabel.Font = Enum.Font.GothamBold
    CountLabel.Parent = CountBadge
    
    local OpenButton = Instance.new("TextButton")
    OpenButton.Size = UDim2.new(1, -18, 0, 32)
    OpenButton.Position = UDim2.new(0, 9, 1, -38)
    OpenButton.BackgroundColor3 = CurrentTheme.Accent
    OpenButton.BackgroundTransparency = 0.15
    OpenButton.BorderSizePixel = 0
    OpenButton.Text = "فتح ←"
    OpenButton.TextColor3 = CurrentTheme.TextPrimary
    OpenButton.TextSize = 15
    OpenButton.Font = Enum.Font.GothamBold
    OpenButton.AutoButtonColor = false
    OpenButton.Parent = Card
    
    CreateCorner(14).Parent = OpenButton
    CreateGradient(OpenButton, 45)
    
    OpenButton.MouseEnter:Connect(function()
        TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 180, 0, 220)
        }):Play()
        TweenService:Create(MapImage, TweenInfo.new(0.4), {
            Size = UDim2.new(1.15, 0, 1.15, 0),
            Position = UDim2.new(-0.075, 0, -0.075, 0)
        }):Play()
    end)
    
    OpenButton.MouseLeave:Connect(function()
        TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 170, 0, 210)
        }):Play()
        TweenService:Create(MapImage, TweenInfo.new(0.4), {
            Size = UDim2.new(1, 0, 1, 0),
            Position = UDim2.new(0, 0, 0, 0)
        }):Play()
    end)
    
    if callback then
        OpenButton.MouseButton1Click:Connect(callback)
    end
    
    return Card
end

-- تابع في الجزء التالي...

-- ═══════════════════════════════════════════════════════════════
--                    📱 إنشاء الواجهة الرئيسية
-- ═══════════════════════════════════════════════════════════════
function UltimateHub:CreateWindow(scriptName)
    local Hub = {}
    Hub.CurrentPage = "main"
    Hub.Maps = {}
    
    local SizeStates = {
        Normal = {Width = 420, Height = 620},
        Minimized = {Width = 360, Height = 480},
        Maximized = {Width = 520, Height = 720}
    }
    local CurrentSize = "Normal"
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UltimateHub"
    ScreenGui.DisplayOrder = 100
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = CoreGui
    
    -- ═══════════════════════════════════════════════════════════
    --                    الزر العائم
    -- ═══════════════════════════════════════════════════════════
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 68, 0, 68)
    ToggleButton.Position = UDim2.new(1, -83, 0, 15)
    ToggleButton.BackgroundColor3 = CurrentTheme.Primary
    ToggleButton.BackgroundTransparency = CurrentTheme.Transparency
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Text = ""
    ToggleButton.AutoButtonColor = false
    ToggleButton.ZIndex = 1000
    ToggleButton.Parent = ScreenGui
    
    CreateCorner(34).Parent = ToggleButton
    CreateGlassEffect(ToggleButton)
    CreateStroke(ToggleButton, CurrentTheme.Primary, 3, 0.3)
    CreateInnerGlow(ToggleButton, CurrentTheme.Primary, 0.25)
    CreateGradient(ToggleButton, 135)
    
    local PlayerAvatar = Instance.new("ImageLabel")
    PlayerAvatar.Size = UDim2.new(1, -12, 1, -12)
    PlayerAvatar.Position = UDim2.new(0, 6, 0, 6)
    PlayerAvatar.BackgroundTransparency = 1
    PlayerAvatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=150&height=150&format=png"
    PlayerAvatar.Parent = ToggleButton
    
    CreateCorner(28).Parent = PlayerAvatar
    
    spawn(function()
        while ToggleButton and ToggleButton.Parent do
            TweenService:Create(ToggleButton, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 73, 0, 73)
            }):Play()
            wait(2.5)
            TweenService:Create(ToggleButton, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 68, 0, 68)
            }):Play()
            wait(2.5)
        end
    end)
    
    local dragging, dragInput, mousePos, framePos = false
    
    ToggleButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            mousePos = input.Position
            framePos = ToggleButton.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    ToggleButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            ToggleButton.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
    
    -- ═══════════════════════════════════════════════════════════
    --                    الإطار الرئيسي
    -- ═══════════════════════════════════════════════════════════
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = CurrentTheme.Background
    MainFrame.BackgroundTransparency = CurrentTheme.Transparency
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = false
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    CreateCorner(30).Parent = MainFrame
    CreateGlassEffect(MainFrame)
    CreateStroke(MainFrame, CurrentTheme.Primary, 2.5, 0.4)
    
    -- ═══════════════════════════════════════════════════════════
    --                    شريط العنوان
    -- ═══════════════════════════════════════════════════════════
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 70)
    TitleBar.BackgroundColor3 = CurrentTheme.Surface
    TitleBar.BackgroundTransparency = CurrentTheme.Transparency
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    CreateCorner(30).Parent = TitleBar
    CreateGradient(TitleBar, 90)
    
    local TitleFix = Instance.new("Frame")
    TitleFix.Size = UDim2.new(1, 0, 0, 30)
    TitleFix.Position = UDim2.new(0, 0, 1, -30)
    TitleFix.BackgroundColor3 = CurrentTheme.Surface
    TitleFix.BackgroundTransparency = CurrentTheme.Transparency
    TitleFix.BorderSizePixel = 0
    TitleFix.Parent = TitleBar
    
    local TitleAvatarButton = Instance.new("TextButton")
    TitleAvatarButton.Size = UDim2.new(0, 45, 0, 45)
    TitleAvatarButton.Position = UDim2.new(0, 14, 0.5, -22.5)
    TitleAvatarButton.BackgroundTransparency = 1
    TitleAvatarButton.Text = ""
    TitleAvatarButton.AutoButtonColor = false
    TitleAvatarButton.Parent = TitleBar
    
    local TitleAvatar = CreatePlayerAvatar(TitleAvatarButton, LocalPlayer.UserId, UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0))
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -240, 1, 0)
    TitleLabel.Position = UDim2.new(0, 66, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = scriptName
    TitleLabel.TextColor3 = CurrentTheme.TextPrimary
    TitleLabel.TextSize = 22
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
    -- أزرار التحكم مع أيقونات جديدة
    local ThemeButton = Instance.new("TextButton")
    ThemeButton.Size = UDim2.new(0, 50, 0, 50)
    ThemeButton.Position = UDim2.new(1, -165, 0.5, -25)
    ThemeButton.BackgroundColor3 = CurrentTheme.Primary
    ThemeButton.BackgroundTransparency = 0.2
    ThemeButton.BorderSizePixel = 0
    ThemeButton.Text = ""
    ThemeButton.AutoButtonColor = false
    ThemeButton.Parent = TitleBar
    
    CreateCorner(15).Parent = ThemeButton
    CreateGlassEffect(ThemeButton)
    CreateGradient(ThemeButton, 45)
    
    local ThemeIcon = Instance.new("ImageLabel")
    ThemeIcon.Size = UDim2.new(0, 30, 0, 30)
    ThemeIcon.Position = UDim2.new(0.5, -15, 0.5, -15)
    ThemeIcon.BackgroundTransparency = 1
    ThemeIcon.Image = Icons.Palette
    ThemeIcon.ImageColor3 = CurrentTheme.TextPrimary
    ThemeIcon.Parent = ThemeButton
    
    local ResizeButton = Instance.new("TextButton")
    ResizeButton.Size = UDim2.new(0, 50, 0, 50)
    ResizeButton.Position = UDim2.new(1, -108, 0.5, -25)
    ResizeButton.BackgroundColor3 = CurrentTheme.Accent
    ResizeButton.BackgroundTransparency = 0.2
    ResizeButton.BorderSizePixel = 0
    ResizeButton.Text = ""
    ResizeButton.AutoButtonColor = false
    ResizeButton.Parent = TitleBar
    
    CreateCorner(15).Parent = ResizeButton
    CreateGlassEffect(ResizeButton)
    CreateGradient(ResizeButton, 135)
    
    local ResizeIcon = Instance.new("ImageLabel")
    ResizeIcon.Size = UDim2.new(0, 30, 0, 30)
    ResizeIcon.Position = UDim2.new(0.5, -15, 0.5, -15)
    ResizeIcon.BackgroundTransparency = 1
    ResizeIcon.Image = Icons.Expand
    ResizeIcon.ImageColor3 = CurrentTheme.TextPrimary
    ResizeIcon.Parent = ResizeButton
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 50, 0, 50)
    CloseButton.Position = UDim2.new(1, -51, 0.5, -25)
    CloseButton.BackgroundColor3 = CurrentTheme.Error
    CloseButton.BackgroundTransparency = 0.2
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = ""
    CloseButton.AutoButtonColor = false
    CloseButton.Parent = TitleBar
    
    CreateCorner(15).Parent = CloseButton
    CreateGlassEffect(CloseButton)
    
    local CloseIcon = Instance.new("ImageLabel")
    CloseIcon.Size = UDim2.new(0, 28, 0, 28)
    CloseIcon.Position = UDim2.new(0.5, -14, 0.5, -14)
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Image = Icons.Close
    CloseIcon.ImageColor3 = CurrentTheme.TextPrimary
    CloseIcon.Parent = CloseButton
    
    -- ═══════════════════════════════════════════════════════════
    --                    الصفحة الرئيسية
    -- ═══════════════════════════════════════════════════════════
    local MainPage = Instance.new("Frame")
    MainPage.Size = UDim2.new(1, 0, 1, -70)
    MainPage.Position = UDim2.new(0, 0, 0, 70)
    MainPage.BackgroundTransparency = 1
    MainPage.Parent = MainFrame
    
    local SearchContainer = Instance.new("Frame")
    SearchContainer.Size = UDim2.new(1, -30, 0, 54)
    SearchContainer.Position = UDim2.new(0, 15, 0, 15)
    SearchContainer.BackgroundColor3 = CurrentTheme.Surface
    SearchContainer.BackgroundTransparency = CurrentTheme.Transparency
    SearchContainer.BorderSizePixel = 0
    SearchContainer.Parent = MainPage
    
    CreateCorner(17).Parent = SearchContainer
    CreateGlassEffect(SearchContainer)
    CreateStroke(SearchContainer, CurrentTheme.Primary, 1.5, 0.5)
    
    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Size = UDim2.new(0, 28, 0, 28)
    SearchIcon.Position = UDim2.new(0, 14, 0.5, -14)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Image = Icons.Search
    SearchIcon.ImageColor3 = CurrentTheme.TextSecondary
    SearchIcon.Parent = SearchContainer
    
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(1, -54, 1, 0)
    SearchBox.Position = UDim2.new(0, 48, 0, 0)
    SearchBox.BackgroundTransparency = 1
    SearchBox.PlaceholderText = "ابحث عن الخرائط..."
    SearchBox.PlaceholderColor3 = CurrentTheme.TextSecondary
    SearchBox.Text = ""
    SearchBox.TextColor3 = CurrentTheme.TextPrimary
    SearchBox.TextSize = 16
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.ClearTextOnFocus = false
    SearchBox.Parent = SearchContainer
    
    local MapsScroll = Instance.new("ScrollingFrame")
    MapsScroll.Size = UDim2.new(1, -30, 1, -84)
    MapsScroll.Position = UDim2.new(0, 15, 0, 79)
    MapsScroll.BackgroundTransparency = 1
    MapsScroll.BorderSizePixel = 0
    MapsScroll.ScrollBarThickness = 5
    MapsScroll.ScrollBarImageColor3 = CurrentTheme.Primary
    MapsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    MapsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    MapsScroll.Parent = MainPage
    
    local MapsGrid = Instance.new("UIGridLayout")
    MapsGrid.CellSize = UDim2.new(0, 170, 0, 210)
    MapsGrid.CellPadding = UDim2.new(0, 12, 0, 12)
    MapsGrid.HorizontalAlignment = Enum.HorizontalAlignment.Center
    MapsGrid.SortOrder = Enum.SortOrder.Name
    MapsGrid.Parent = MapsScroll
    
    -- ═══════════════════════════════════════════════════════════
    --                    صفحة المجلد
    -- ═══════════════════════════════════════════════════════════
    local FolderPage = Instance.new("Frame")
    FolderPage.Size = UDim2.new(1, 0, 1, -70)
    FolderPage.Position = UDim2.new(0, 0, 0, 70)
    FolderPage.BackgroundTransparency = 1
    FolderPage.Visible = false
    FolderPage.Parent = MainFrame
    
    local BackButton = Instance.new("TextButton")
    BackButton.Size = UDim2.new(0, 110, 0, 50)
    BackButton.Position = UDim2.new(0, 15, 0, 15)
    BackButton.BackgroundColor3 = CurrentTheme.Primary
    BackButton.BackgroundTransparency = CurrentTheme.Transparency
    BackButton.BorderSizePixel = 0
    BackButton.Text = ""
    BackButton.AutoButtonColor = false
    BackButton.Parent = FolderPage
    
    CreateCorner(15).Parent = BackButton
    CreateGlassEffect(BackButton)
    CreateGradient(BackButton, 45)
    
    local BackIcon = Instance.new("ImageLabel")
    BackIcon.Size = UDim2.new(0, 26, 0, 26)
    BackIcon.Position = UDim2.new(0, 12, 0.5, -13)
    BackIcon.BackgroundTransparency = 1
    BackIcon.Image = Icons.Back
    BackIcon.ImageColor3 = CurrentTheme.TextPrimary
    BackIcon.Parent = BackButton
    
    local BackText = Instance.new("TextLabel")
    BackText.Size = UDim2.new(1, -48, 1, 0)
    BackText.Position = UDim2.new(0, 44, 0, 0)
    BackText.BackgroundTransparency = 1
    BackText.Text = "رجوع"
    BackText.TextColor3 = CurrentTheme.TextPrimary
    BackText.TextSize = 17
    BackText.Font = Enum.Font.GothamBold
    BackText.TextXAlignment = Enum.TextXAlignment.Left
    BackText.Parent = BackButton
    
    local FolderTitle = Instance.new("TextLabel")
    FolderTitle.Size = UDim2.new(1, -140, 0, 50)
    FolderTitle.Position = UDim2.new(0, 135, 0, 15)
    FolderTitle.BackgroundTransparency = 1
    FolderTitle.Text = "السكربتات"
    FolderTitle.TextColor3 = CurrentTheme.TextPrimary
    FolderTitle.TextSize = 20
    FolderTitle.Font = Enum.Font.GothamBold
    FolderTitle.TextXAlignment = Enum.TextXAlignment.Left
    FolderTitle.Parent = FolderPage
    
    local ScriptsScroll = Instance.new("ScrollingFrame")
    ScriptsScroll.Size = UDim2.new(1, -30, 1, -80)
    ScriptsScroll.Position = UDim2.new(0, 15, 0, 75)
    ScriptsScroll.BackgroundTransparency = 1
    ScriptsScroll.BorderSizePixel = 0
    ScriptsScroll.ScrollBarThickness = 5
    ScriptsScroll.ScrollBarImageColor3 = CurrentTheme.Primary
    ScriptsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScriptsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScriptsScroll.Parent = FolderPage
    
    local ScriptsList = Instance.new("UIListLayout")
    ScriptsList.Padding = UDim.new(0, 10)
    ScriptsList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ScriptsList.SortOrder = Enum.SortOrder.Name
    ScriptsList.Parent = ScriptsScroll
    
    -- ═══════════════════════════════════════════════════════════
    --                    صفحة معلومات اللاعب المحسّنة
    -- ═══════════════════════════════════════════════════════════
    local ProfilePage = Instance.new("Frame")
    ProfilePage.Size = UDim2.new(1, 0, 1, -70)
    ProfilePage.Position = UDim2.new(0, 0, 0, 70)
    ProfilePage.BackgroundTransparency = 1
    ProfilePage.Visible = false
    ProfilePage.Parent = MainFrame
    
    local ProfileBackButton = Instance.new("TextButton")
    ProfileBackButton.Size = UDim2.new(0, 110, 0, 50)
    ProfileBackButton.Position = UDim2.new(0, 15, 0, 15)
    ProfileBackButton.BackgroundColor3 = CurrentTheme.Primary
    ProfileBackButton.BackgroundTransparency = CurrentTheme.Transparency
    ProfileBackButton.BorderSizePixel = 0
    ProfileBackButton.Text = ""
    ProfileBackButton.AutoButtonColor = false
    ProfileBackButton.Parent = ProfilePage
    
    CreateCorner(15).Parent = ProfileBackButton
    CreateGlassEffect(ProfileBackButton)
    CreateGradient(ProfileBackButton, 45)
    
    local ProfileBackIcon = Instance.new("ImageLabel")
    ProfileBackIcon.Size = UDim2.new(0, 26, 0, 26)
    ProfileBackIcon.Position = UDim2.new(0, 12, 0.5, -13)
    ProfileBackIcon.BackgroundTransparency = 1
    ProfileBackIcon.Image = Icons.Back
    ProfileBackIcon.ImageColor3 = CurrentTheme.TextPrimary
    ProfileBackIcon.Parent = ProfileBackButton
    
    local ProfileBackText = Instance.new("TextLabel")
    ProfileBackText.Size = UDim2.new(1, -48, 1, 0)
    ProfileBackText.Position = UDim2.new(0, 44, 0, 0)
    ProfileBackText.BackgroundTransparency = 1
    ProfileBackText.Text = "رجوع"
    ProfileBackText.TextColor3 = CurrentTheme.TextPrimary
    ProfileBackText.TextSize = 17
    ProfileBackText.Font = Enum.Font.GothamBold
    ProfileBackText.TextXAlignment = Enum.TextXAlignment.Left
    ProfileBackText.Parent = ProfileBackButton
    
    -- صورة اللاعب الكبيرة
    local BigAvatar = CreatePlayerAvatar(ProfilePage, LocalPlayer.UserId, UDim2.new(0, 100, 0, 100), UDim2.new(0, 15, 0, 80))
    
    -- الترحيب
    local WelcomeLabel = Instance.new("TextLabel")
    WelcomeLabel.Size = UDim2.new(1, -130, 0, 35)
    WelcomeLabel.Position = UDim2.new(0, 125, 0, 85)
    WelcomeLabel.BackgroundTransparency = 1
    WelcomeLabel.Text = "مرحباً، " .. LocalPlayer.DisplayName .. "! 👋"
    WelcomeLabel.TextColor3 = CurrentTheme.TextPrimary
    WelcomeLabel.TextSize = 20
    WelcomeLabel.Font = Enum.Font.GothamBold
    WelcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
    WelcomeLabel.Parent = ProfilePage
    
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, -130, 0, 20)
    StatusLabel.Position = UDim2.new(0, 125, 0, 120)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Text = "🟢 متصل الآن"
    StatusLabel.TextColor3 = CurrentTheme.Success
    StatusLabel.TextSize = 13
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatusLabel.Parent = ProfilePage
    
    -- مربع الإحصائيات
    local StatsBox = Instance.new("Frame")
    StatsBox.Size = UDim2.new(1, -30, 0, 180)
    StatsBox.Position = UDim2.new(0, 15, 0, 195)
    StatsBox.BackgroundColor3 = CurrentTheme.Card
    StatsBox.BackgroundTransparency = CurrentTheme.Transparency
    StatsBox.BorderSizePixel = 0
    StatsBox.Parent = ProfilePage
    
    CreateCorner(20).Parent = StatsBox
    CreateGlassEffect(StatsBox)
    CreateStroke(StatsBox, CurrentTheme.Primary, 2, 0.4)
    
    -- عداد المستخدمين المحسّن
    local UsersContainer = Instance.new("Frame")
    UsersContainer.Size = UDim2.new(0.5, -10, 0, 70)
    UsersContainer.Position = UDim2.new(0, 10, 0, 10)
    UsersContainer.BackgroundColor3 = CurrentTheme.Surface
    UsersContainer.BackgroundTransparency = 0.5
    UsersContainer.BorderSizePixel = 0
    UsersContainer.Parent = StatsBox
    
    CreateCorner(15).Parent = UsersContainer
    CreateGradient(UsersContainer, 45)
    
    local UsersIcon = Instance.new("ImageLabel")
    UsersIcon.Size = UDim2.new(0, 32, 0, 32)
    UsersIcon.Position = UDim2.new(0, 12, 0, 12)
    UsersIcon.BackgroundTransparency = 1
    UsersIcon.Image = Icons.Users
    UsersIcon.ImageColor3 = CurrentTheme.Primary
    UsersIcon.Parent = UsersContainer
    
    local UsersCountLabel = Instance.new("TextLabel")
    UsersCountLabel.Size = UDim2.new(1, -52, 0, 18)
    UsersCountLabel.Position = UDim2.new(0, 48, 0, 10)
    UsersCountLabel.BackgroundTransparency = 1
    UsersCountLabel.Text = "المستخدمين"
    UsersCountLabel.TextColor3 = CurrentTheme.TextSecondary
    UsersCountLabel.TextSize = 12
    UsersCountLabel.Font = Enum.Font.Gotham
    UsersCountLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsersCountLabel.Parent = UsersContainer
    
    local UsersCountValue = Instance.new("TextLabel")
    UsersCountValue.Size = UDim2.new(1, -52, 0, 32)
    UsersCountValue.Position = UDim2.new(0, 48, 0, 28)
    UsersCountValue.BackgroundTransparency = 1
    UsersCountValue.Text = tostring(UpdateUserCount())
    UsersCountValue.TextColor3 = CurrentTheme.Primary
    UsersCountValue.TextSize = 24
    UsersCountValue.Font = Enum.Font.GothamBold
    UsersCountValue.TextXAlignment = Enum.TextXAlignment.Left
    UsersCountValue.Parent = UsersContainer
    
    -- وقت الجلسة
    local TimeContainer = Instance.new("Frame")
    TimeContainer.Size = UDim2.new(0.5, -10, 0, 70)
    TimeContainer.Position = UDim2.new(0.5, 5, 0, 10)
    TimeContainer.BackgroundColor3 = CurrentTheme.Surface
    TimeContainer.BackgroundTransparency = 0.5
    TimeContainer.BorderSizePixel = 0
    TimeContainer.Parent = StatsBox
    
    CreateCorner(15).Parent = TimeContainer
    CreateGradient(TimeContainer, 135)
    
    local TimeIcon = Instance.new("ImageLabel")
    TimeIcon.Size = UDim2.new(0, 32, 0, 32)
    TimeIcon.Position = UDim2.new(0, 12, 0, 12)
    TimeIcon.BackgroundTransparency = 1
    TimeIcon.Image = Icons.Clock
    TimeIcon.ImageColor3 = CurrentTheme.Accent
    TimeIcon.Parent = TimeContainer
    
    local TimeLabel = Instance.new("TextLabel")
    TimeLabel.Size = UDim2.new(1, -52, 0, 18)
    TimeLabel.Position = UDim2.new(0, 48, 0, 10)
    TimeLabel.BackgroundTransparency = 1
    TimeLabel.Text = "وقت الجلسة"
    TimeLabel.TextColor3 = CurrentTheme.TextSecondary
    TimeLabel.TextSize = 12
    TimeLabel.Font = Enum.Font.Gotham
    TimeLabel.TextXAlignment = Enum.TextXAlignment.Left
    TimeLabel.Parent = TimeContainer
    
    local TimeValue = Instance.new("TextLabel")
    TimeValue.Size = UDim2.new(1, -52, 0, 32)
    TimeValue.Position = UDim2.new(0, 48, 0, 28)
    TimeValue.BackgroundTransparency = 1
    TimeValue.Text = "0:00"
    TimeValue.TextColor3 = CurrentTheme.Accent
    TimeValue.TextSize = 20
    TimeValue.Font = Enum.Font.GothamBold
    TimeValue.TextXAlignment = Enum.TextXAlignment.Left
    TimeValue.Parent = TimeContainer
    
    -- تحديث وقت الجلسة
    spawn(function()
        while TimeValue and TimeValue.Parent do
            wait(1)
            local elapsed = os.time() - UserCountData.SessionStart
            local minutes = math.floor(elapsed / 60)
            local seconds = elapsed % 60
            TimeValue.Text = string.format("%d:%02d", minutes, seconds)
        end
    end)
    
    -- معلومات المطور
    local DevContainer = Instance.new("Frame")
    DevContainer.Size = UDim2.new(1, -20, 0, 80)
    DevContainer.Position = UDim2.new(0, 10, 0, 90)
    DevContainer.BackgroundColor3 = CurrentTheme.Surface
    DevContainer.BackgroundTransparency = 0.5
    DevContainer.BorderSizePixel = 0
    DevContainer.Parent = StatsBox
    
    CreateCorner(15).Parent = DevContainer
    CreateGradient(DevContainer, 90)
    
    local DevTitle = Instance.new("TextLabel")
    DevTitle.Size = UDim2.new(1, -20, 0, 20)
    DevTitle.Position = UDim2.new(0, 10, 0, 8)
    DevTitle.BackgroundTransparency = 1
    DevTitle.Text = "👨‍💻 المطور"
    DevTitle.TextColor3 = CurrentTheme.TextSecondary
    DevTitle.TextSize = 13
    DevTitle.Font = Enum.Font.GothamBold
    DevTitle.TextXAlignment = Enum.TextXAlignment.Left
    DevTitle.Parent = DevContainer
    
    local DevAvatar = CreatePlayerAvatar(DevContainer, DeveloperInfo[1].UserId, UDim2.new(0, 45, 0, 45), UDim2.new(0, 10, 0, 30))
    
    local DevUsername = Instance.new("TextLabel")
    DevUsername.Size = UDim2.new(1, -70, 0, 18)
    DevUsername.Position = UDim2.new(0, 62, 0, 32)
    DevUsername.BackgroundTransparency = 1
    DevUsername.Text = DeveloperInfo[1].Username
    DevUsername.TextColor3 = CurrentTheme.TextPrimary
    DevUsername.TextSize = 14
    DevUsername.Font = Enum.Font.GothamBold
    DevUsername.TextXAlignment = Enum.TextXAlignment.Left
    DevUsername.Parent = DevContainer
    
    local VerifiedIcon = Instance.new("ImageLabel")
    VerifiedIcon.Size = UDim2.new(0, 16, 0, 16)
    VerifiedIcon.Position = UDim2.new(0, 62 + DevUsername.TextBounds.X + 4, 0, 33)
    VerifiedIcon.BackgroundTransparency = 1
    VerifiedIcon.Image = Icons.Check
    VerifiedIcon.ImageColor3 = CurrentTheme.Primary
    VerifiedIcon.Parent = DevContainer
    
    local DevRank = Instance.new("TextLabel")
    DevRank.Size = UDim2.new(1, -70, 0, 16)
    DevRank.Position = UDim2.new(0, 62, 0, 52)
    DevRank.BackgroundTransparency = 1
    DevRank.Text = DeveloperInfo[1].Rank
    DevRank.TextColor3 = DeveloperInfo[1].RankColor
    DevRank.TextSize = 12
    DevRank.Font = Enum.Font.Gotham
    DevRank.TextXAlignment = Enum.TextXAlignment.Left
    DevRank.Parent = DevContainer
    
    -- زر التشغيل/الإيقاف iOS
    local ToggleLabel = Instance.new("TextLabel")
    ToggleLabel.Size = UDim2.new(1, -30, 0, 22)
    ToggleLabel.Position = UDim2.new(0, 15, 0, 390)
    ToggleLabel.BackgroundTransparency = 1
    ToggleLabel.Text = "⚙️ تفعيل الميزات المتقدمة"
    ToggleLabel.TextColor3 = CurrentTheme.TextPrimary
    ToggleLabel.TextSize = 15
    ToggleLabel.Font = Enum.Font.GothamBold
    ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
    ToggleLabel.Parent = ProfilePage
    
    local FeatureToggle, toggleState = CreateIOSToggle(ProfilePage, UDim2.new(1, -71, 0, 390), true, function(state)
        print("الميزات المتقدمة:", state and "مفعلة" or "معطلة")
    end)
    
    -- تحديث عداد المستخدمين
    spawn(function()
        while UsersCountValue and UsersCountValue.Parent do
            wait(2)
            local count = UpdateUserCount()
            TweenService:Create(UsersCountValue, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                TextSize = 28
            }):Play()
            UsersCountValue.Text = tostring(count)
            wait(0.3)
            TweenService:Create(UsersCountValue, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                TextSize = 24
            }):Play()
        end
    end)
    
    -- تابع في الجزء الأخير...
    
    return Hub, MainFrame, MainPage, FolderPage, ProfilePage, TitleAvatarButton, BackButton, ProfileBackButton, MapsScroll, ScriptsScroll, SearchBox, ThemeButton, ResizeButton, CloseButton, ToggleButton, PlayerAvatar, ResizeIcon, ThemeIcon
end

-- يتم إضافته للجزء الثاني

    -- ═══════════════════════════════════════════════════════════
    --                    وظائف التبديل بين الصفحات
    -- ═══════════════════════════════════════════════════════════
    local function SwitchToFolder(mapData)
        Hub.CurrentPage = "folder"
        
        for _, child in pairs(ScriptsScroll:GetChildren()) do
            if child:IsA("Frame") or child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        FolderTitle.Text = "📂 " .. mapData.name
        
        if mapData.scripts then
            for index, script in pairs(mapData.scripts) do
                local yPos = (index - 1) * 68
                
                local ScriptButton = CreateButton(
                    ScriptsScroll,
                    script.name,
                    Icons.Play,
                    CurrentTheme.Success,
                    UDim2.new(0.5, -145, 0, yPos),
                    UDim2.new(0, 290, 0, 58),
                    function()
                        if script.loadstring then
                            local success, err = pcall(function()
                                loadstring(script.loadstring)()
                            end)
                            
                            if success then
                                UltimateHub:ShowNotification(
                                    "✅ تم التفعيل",
                                    "تم تفعيل: " .. script.name,
                                    Icons.Check,
                                    "success",
                                    3
                                )
                            else
                                UltimateHub:ShowNotification(
                                    "❌ خطأ",
                                    "فشل تفعيل السكربت",
                                    Icons.Close,
                                    "error",
                                    4
                                )
                            end
                        end
                    end
                )
                
                local UsersBadge = Instance.new("Frame")
                UsersBadge.Size = UDim2.new(0, 72, 0, 26)
                UsersBadge.Position = UDim2.new(1, -80, 0, 8)
                UsersBadge.BackgroundColor3 = CurrentTheme.Background
                UsersBadge.BackgroundTransparency = 0.2
                UsersBadge.BorderSizePixel = 0
                UsersBadge.Parent = ScriptButton
                
                CreateCorner(13).Parent = UsersBadge
                CreateGradient(UsersBadge, 90)
                
                local UsersIcon = Instance.new("ImageLabel")
                UsersIcon.Size = UDim2.new(0, 18, 0, 18)
                UsersIcon.Position = UDim2.new(0, 6, 0.5, -9)
                UsersIcon.BackgroundTransparency = 1
                UsersIcon.Image = Icons.Users
                UsersIcon.ImageColor3 = CurrentTheme.Primary
                UsersIcon.Parent = UsersBadge
                
                local UsersText = Instance.new("TextLabel")
                UsersText.Size = UDim2.new(1, -28, 1, 0)
                UsersText.Position = UDim2.new(0, 26, 0, 0)
                UsersText.BackgroundTransparency = 1
                UsersText.Text = tostring(script.users or 0)
                UsersText.TextColor3 = CurrentTheme.TextPrimary
                UsersText.TextSize = 13
                UsersText.Font = Enum.Font.GothamBold
                UsersText.TextXAlignment = Enum.TextXAlignment.Left
                UsersText.Parent = UsersBadge
            end
        end
        
        MainPage.Visible = true
        FolderPage.Visible = true
        ProfilePage.Visible = false
        FolderPage.Position = UDim2.new(1, 0, 0, 70)
        
        TweenService:Create(MainPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(-1, 0, 0, 70)
        }):Play()
        
        local slideIn = TweenService:Create(FolderPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 70)
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
            TweenService:Create(FolderPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, 0, 0, 70)
            }):Play()
        end
        
        if ProfilePage.Visible then
            TweenService:Create(ProfilePage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(1, 0, 0, 70)
            }):Play()
        end
        
        local slideIn = TweenService:Create(MainPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 70)
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
        
        TweenService:Create(MainPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(-1, 0, 0, 70)
        }):Play()
        
        local slideIn = TweenService:Create(ProfilePage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 70)
        })
        slideIn:Play()
        slideIn.Completed:Wait()
        MainPage.Visible = false
    end
    
    BackButton.MouseButton1Click:Connect(SwitchToMain)
    ProfileBackButton.MouseButton1Click:Connect(SwitchToMain)
    TitleAvatarButton.MouseButton1Click:Connect(function()
        SwitchToProfile()
    end)
    
    -- ═══════════════════════════════════════════════════════════
    --                    وظيفة إضافة خريطة
    -- ═══════════════════════════════════════════════════════════
    function Hub:AddMap(mapData)
        table.insert(Hub.Maps, mapData)
        
        local card = CreateMapCard(
            MapsScroll,
            mapData.image,
            mapData.name,
            mapData.scriptCount or 0,
            UDim2.new(0, 0, 0, 0),
            function()
                SwitchToFolder(mapData)
            end
        )
        
        card.Name = mapData.name
    end
    
    -- ═══════════════════════════════════════════════════════════
    --                    نظام البحث
    -- ═══════════════════════════════════════════════════════════
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = SearchBox.Text:lower()
        for _, card in pairs(MapsScroll:GetChildren()) do
            if card:IsA("Frame") then
                if searchText == "" or card.Name:lower():find(searchText) then
                    card.Visible = true
                else
                    card.Visible = false
                end
            end
        end
    end)
    
    -- ═══════════════════════════════════════════════════════════
    --                    وظيفة تغيير الثيم
    -- ═══════════════════════════════════════════════════════════
    local function ApplyTheme(theme)
        CurrentTheme = theme
        
        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        
        TweenService:Create(MainFrame, tweenInfo, {BackgroundColor3 = theme.Background, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(TitleBar, tweenInfo, {BackgroundColor3 = theme.Surface, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(TitleFix, tweenInfo, {BackgroundColor3 = theme.Surface, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(ToggleButton, tweenInfo, {BackgroundColor3 = theme.Primary, BackgroundTransparency = theme.Transparency}):Play()
        
        UltimateHub:ShowNotification(
            "🎨 تم تغيير الثيم",
            "الثيم الحالي: " .. theme.Name,
            Icons.Palette,
            "info",
            3
        )
    end
    
    ThemeButton.MouseButton1Click:Connect(function()
        CurrentThemeIndex = CurrentThemeIndex + 1
        if CurrentThemeIndex > #ThemeNames then
            CurrentThemeIndex = 1
        end
        
        ApplyTheme(Themes[ThemeNames[CurrentThemeIndex]])
        
        TweenService:Create(ThemeIcon, TweenInfo.new(0.4), {Rotation = 360}):Play()
        wait(0.4)
        ThemeIcon.Rotation = 0
    end)
    
    -- ═══════════════════════════════════════════════════════════
    --                    وظيفة التكبير/التصغير
    -- ═══════════════════════════════════════════════════════════
    local function ResizeWindow()
        local screenSize = workspace.CurrentCamera.ViewportSize
        local newSize
        local iconImage
        
        if CurrentSize == "Normal" then
            CurrentSize = "Minimized"
            newSize = UDim2.new(0, math.min(screenSize.X - 60, SizeStates.Minimized.Width), 0, math.min(screenSize.Y - 100, SizeStates.Minimized.Height))
            iconImage = Icons.Minimize
        elseif CurrentSize == "Minimized" then
            CurrentSize = "Maximized"
            newSize = UDim2.new(0, math.min(screenSize.X - 20, SizeStates.Maximized.Width), 0, math.min(screenSize.Y - 40, SizeStates.Maximized.Height))
            iconImage = Icons.Maximize
        else
            CurrentSize = "Normal"
            newSize = UDim2.new(0, math.min(screenSize.X - 40, SizeStates.Normal.Width), 0, math.min(screenSize.Y - 80, SizeStates.Normal.Height))
            iconImage = Icons.Expand
        end
        
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = newSize
        }):Play()
        
        ResizeIcon.Image = iconImage
        
        UltimateHub:ShowNotification(
            "📐 تغيير الحجم",
            "الحجم: " .. (CurrentSize == "Normal" and "عادي" or CurrentSize == "Minimized" and "صغير" or "كبير"),
            iconImage,
            "info",
            2
        )
    end
    
    ResizeButton.MouseButton1Click:Connect(ResizeWindow)
    
    -- ═══════════════════════════════════════════════════════════
    --                    وظائف الفتح والإغلاق
    -- ═══════════════════════════════════════════════════════════
    local isOpen = false
    
    local function ToggleUI()
        isOpen = not isOpen
        
        if isOpen then
            MainFrame.Visible = true
            
            local screenSize = workspace.CurrentCamera.ViewportSize
            local targetWidth = math.min(screenSize.X - 40, SizeStates.Normal.Width)
            local targetHeight = math.min(screenSize.Y - 80, SizeStates.Normal.Height)
            
            local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, targetWidth, 0, targetHeight)
            })
            openTween:Play()
            
            TweenService:Create(PlayerAvatar, TweenInfo.new(0.5), {Rotation = 180}):Play()
            
            UltimateHub:ShowNotification(
                "🎮 مرحباً!",
                "تم فتح " .. scriptName,
                Icons.Star,
                "success",
                2.5
            )
        else
            local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            })
            closeTween:Play()
            closeTween.Completed:Connect(function()
                MainFrame.Visible = false
            end)
            
            TweenService:Create(PlayerAvatar, TweenInfo.new(0.5), {Rotation = 0}):Play()
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(ToggleUI)
    CloseButton.MouseButton1Click:Connect(ToggleUI)
    
    wait(0.6)
    ToggleUI()
    
    return Hub
end

return UltimateHub
