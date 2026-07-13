--[[
    ================================================================
      Ultimate Hub Premium - النسخة الفخمة المطورة (V3)
      قائمة جانبية ثابتة على اليسار + شريط أدوات سريع + ربط API
      سكربتات (ScriptBlox) و API ترجمة (Google) + إعدادات لاعب محسّنة
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
    Bolt       = "rbxassetid://7072719338",
    Copy       = "rbxassetid://7072706796",
}

-- ================================================================
--        نظام عدّ المستخدمين الحقيقي (يعمل فعلياً)
-- ================================================================
local UserDatabase = {
    RegisteredUsers = {},
    ActiveNow = {},
    TotalActivations = 0,
    PlaceId = game.PlaceId,
}

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

local function ActivateUser(userId, username, displayName)
    if not table.find(UserDatabase.ActiveNow, userId) then
        table.insert(UserDatabase.ActiveNow, userId)
        RegisterUser(userId, username, displayName)
        return true
    end
    return false
end

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
--        معلومات جاهزة للنسخ (تظهر في إعدادات اللاعب)
--   عدّل النصوص هنا بما تريد (عنوان + وصف لكل مربع، 3 مربعات فقط)
-- ================================================================
local CopyInfoBoxes = {
    { Title = "الديسكورد الرسمي", Description = "انضم لسيرفر الدعم الرسمي لمتابعة التحديثات والدعم الفني." },
    { Title = "قناة التيليجرام", Description = "تابع آخر إصدارات السكربت وطرق الاستخدام هنا." },
    { Title = "ملاحظة مهمة", Description = "استخدم السكربت على مسؤوليتك الخاصة، ولا تستخدم حسابك الرئيسي." },
}

-- ================================================================
--            ربط APIs خارجية: ترجمة Google + بحث ScriptBlox
--   (تم استخراج الجزء المطلوب فقط، ولا يوجد أي كود إضافي غيره)
-- ================================================================
local ScriptAPI = {}

-- طلب HTTP عام يعمل مع أغلب أدوات التنفيذ (Executors)
local function HttpRequest(options)
    local ok, response

    if syn and syn.request then
        ok, response = pcall(syn.request, options)
    elseif http_request then
        ok, response = pcall(http_request, options)
    elseif request then
        ok, response = pcall(request, options)
    elseif fluxus and fluxus.request then
        ok, response = pcall(fluxus.request, options)
    elseif game and game.HttpGetAsync and (options.Method == nil or options.Method == "GET") then
        ok, response = pcall(function()
            return { Body = game:HttpGetAsync(options.Url), StatusCode = 200 }
        end)
    else
        return false, "الأداة (Executor) الحالية لا تدعم طلبات HTTP خارجية"
    end

    if not ok then
        return false, tostring(response)
    end
    if response and response.StatusCode and response.StatusCode ~= 200 then
        return false, "فشل الطلب - رمز الحالة: " .. tostring(response.StatusCode)
    end

    return true, response
end

-- API الترجمة (Google) - يترجم أي نص إلى الإنجليزية تلقائياً
function ScriptAPI.TranslateToEnglish(text)
    if not text or text == "" then return nil, "النص فاضي" end

    local url = "https://translate.googleapis.com/translate_a/single?client=gtx&dt=t&sl=auto&tl=en&q="
        .. HttpService:UrlEncode(text)

    local ok, response = HttpRequest({ Url = url, Method = "GET" })
    if not ok then return nil, response end

    local okDecode, decoded = pcall(function()
        return HttpService:JSONDecode(response.Body)
    end)
    if not okDecode then return nil, "تعذر قراءة رد الترجمة" end

    local translated = decoded and decoded[1] and decoded[1][1] and decoded[1][1][1]
    if not translated then return nil, "لم يتم العثور على ترجمة" end

    return translated
end

-- API سكربتات (ScriptBlox) - بحث باسم الماب بالإنجليزية
function ScriptAPI.SearchScripts(englishQuery)
    if not englishQuery or englishQuery == "" then return nil, "النص فاضي" end

    local url = "https://scriptblox.com/api/script/search?q=" .. HttpService:UrlEncode(englishQuery)

    local ok, response = HttpRequest({ Url = url, Method = "GET" })
    if not ok then return nil, response end

    local okDecode, decoded = pcall(function()
        return HttpService:JSONDecode(response.Body)
    end)
    if not okDecode then return nil, "تعذر قراءة رد البحث" end

    if decoded and decoded.result and decoded.result.scripts then
        return decoded.result.scripts
    end

    return nil, (decoded and decoded.message) or "لا توجد نتائج"
end

-- ترجمة اسم الماب ثم البحث عنه دفعة واحدة (هذا ما يستخدمه زر البحث بالواجهة)
function ScriptAPI.TranslateThenSearch(anyLanguageQuery)
    local translated, err = ScriptAPI.TranslateToEnglish(anyLanguageQuery)
    if not translated then
        return nil, err
    end
    local scripts, err2 = ScriptAPI.SearchScripts(translated)
    if not scripts then
        return nil, err2
    end
    return scripts, nil, translated
end

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
--   + دعم كتم الإشعارات بالكامل عند تعطيل السكربت
-- ================================================================
local NotifGui = nil
local NotifContainer = nil
local NotificationsMuted = false -- يتحكم بها زر التفعيل/التعطيل

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

function UltimateHub:ShowNotification(title, message, icon, notifType, duration, forceShow)
    if NotificationsMuted and not forceShow then return end

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

    local IconFrame = Instance.new("Frame")
    IconFrame.Name = "IconFrame"
    IconFrame.Size = UDim2.new(0, 40, 0, 40)
    IconFrame.Position = UDim2.new(0, 12, 0, 12)
    IconFrame.BackgroundColor3 = accentColor
    IconFrame.BackgroundTransparency = 0.78
    IconFrame.BorderSizePixel = 0
    IconFrame.Parent = Notif

    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = IconFrame

    local IconImage = Instance.new("ImageLabel")
    IconImage.Name = "Icon"
    IconImage.Size = UDim2.new(0, 22, 0, 22)
    IconImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    IconImage.AnchorPoint = Vector2.new(0.5, 0.5)
    IconImage.BackgroundTransparency = 1
    IconImage.Image = icon
    IconImage.ImageColor3 = accentColor
    IconImage.Parent = IconFrame

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

    local pitch = 1
    if notifType == "success" then pitch = 1.12
    elseif notifType == "error" then pitch = 0.85
    elseif notifType == "warning" then pitch = 0.95 end
    PlaySound(SoundEffects.Notification, 0.45, pitch)

    Notif.Size = UDim2.new(0, 0, 0, cardHeight)
    local entryTween = TweenService:Create(Notif,
        TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 310, 0, cardHeight)}
    )
    entryTween:Play()

    IconImage.Rotation = -90
    IconImage.ImageTransparency = 1
    TweenService:Create(IconImage, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Rotation = 0,
        ImageTransparency = 0
    }):Play()

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

    task.spawn(function()
        task.wait(0.45)
        TweenService:Create(ProgressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
            Size = UDim2.new(0, 0, 1, 0)
        }):Play()
    end)

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

-- نسخ نص للحافظة مع دعم أغلب أدوات التنفيذ
local function CopyToClipboard(hub, text)
    local ok = pcall(function()
        if setclipboard then
            setclipboard(text)
        elseif toclipboard then
            toclipboard(text)
        else
            error("no clipboard function")
        end
    end)

    if ok then
        hub:ShowNotification("📋 تم النسخ", "تم نسخ المحتوى إلى الحافظة بنجاح", Icons.Copy, "success", 2, true)
    else
        hub:ShowNotification("⚠️ تعذر النسخ", "الأداة الحالية لا تدعم النسخ التلقائي للحافظة", Icons.Info, "warning", 3, true)
    end
end

-- ================================================================
--                    إنشاء النافذة الرئيسية
-- ================================================================
function UltimateHub:CreateWindow(scriptName, scriptVersion)
    local Hub = setmetatable({}, {__index = UltimateHub})
    Hub.Name = scriptName or "Ultimate Hub Premium"
    Hub.Version = scriptVersion or "3.0"
    Hub.Maps = {}
    Hub.CurrentPage = "main"
    Hub.IsEnabled = true

    ActivateUser(LocalPlayer.UserId, LocalPlayer.Name, LocalPlayer.DisplayName)

    Players.PlayerAdded:Connect(function(player)
        task.wait(1)
        UltimateHub:ShowPlayerJoinNotification(player)
    end)

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
        Minimized = {Width = 560, Height = 360},
        Normal    = {Width = 780, Height = 480},
        Maximized = {Width = 980, Height = 640},
    }
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

    -- صورة اللاعب (شريط العنوان) - تُستبدل بـ GetUserThumbnailAsync لضمان ظهورها دائماً
    local PlayerAvatar = Instance.new("ImageLabel")
    PlayerAvatar.Name = "Avatar"
    PlayerAvatar.Size = UDim2.new(0, 40, 0, 40)
    PlayerAvatar.Position = UDim2.new(0, 10, 0, 10)
    PlayerAvatar.BackgroundColor3 = CurrentTheme.Primary
    PlayerAvatar.BorderSizePixel = 0
    PlayerAvatar.Image = ""
    PlayerAvatar.Parent = TitleBar

    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = PlayerAvatar

    local AvatarStroke = Instance.new("UIStroke")
    AvatarStroke.Color = CurrentTheme.Primary
    AvatarStroke.Thickness = 2
    AvatarStroke.Parent = PlayerAvatar

    -- تحميل صورة اللاعب بالطريقة الرسمية (تحل مشكلة عدم ظهور الصورة)
    local function LoadAvatar(imageLabel, userId)
        task.spawn(function()
            local ok, content = pcall(function()
                return Players:GetUserThumbnailAsync(
                    userId,
                    Enum.ThumbnailType.HeadShot,
                    Enum.ThumbnailSize.Size150x150
                )
            end)
            if ok and content then
                imageLabel.Image = content
            else
                -- احتياطي في حال فشل الطلب الرسمي
                imageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="
                    .. userId .. "&width=150&height=150&format=png"
            end
        end)
    end

    LoadAvatar(PlayerAvatar, LocalPlayer.UserId)

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
    -- أزرار التحكم (ثيم / تكبير / إغلاق)
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
    local ResizeButton = CreateIconButton("ResizeButton", Icons.Maximize, CurrentTheme.Warning)
    local CloseButton = CreateIconButton("CloseButton", Icons.Close, CurrentTheme.Error)

    -- ------------------------------------------------------------
    -- جسم النافذة: قائمة جانبية ثابتة (يسار) + منطقة محتوى (يمين)
    -- ------------------------------------------------------------
    local Body = Instance.new("Frame")
    Body.Name = "Body"
    Body.Size = UDim2.new(1, 0, 1, -60)
    Body.Position = UDim2.new(0, 0, 0, 60)
    Body.BackgroundTransparency = 1
    Body.Parent = MainFrame

    local SIDEBAR_WIDTH = 210

    -- ===================== الشريط الجانبي (يسار) =====================
    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, SIDEBAR_WIDTH, 1, -10)
    Sidebar.Position = UDim2.new(0, 10, 0, 0)
    Sidebar.BackgroundColor3 = CurrentTheme.Card
    Sidebar.BackgroundTransparency = 0.25
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = Body

    local SidebarCorner = Instance.new("UICorner")
    SidebarCorner.CornerRadius = UDim.new(0, 14)
    SidebarCorner.Parent = Sidebar

    local SidebarStroke = Instance.new("UIStroke")
    SidebarStroke.Color = CurrentTheme.Primary
    SidebarStroke.Thickness = 1.5
    SidebarStroke.Transparency = 0.6
    SidebarStroke.Parent = Sidebar

    -- صندوق البحث داخل القائمة الجانبية (يبحث ضمن المجلدات المضافة محلياً)
    local SearchContainer = Instance.new("Frame")
    SearchContainer.Name = "Search"
    SearchContainer.Size = UDim2.new(1, -20, 0, 38)
    SearchContainer.Position = UDim2.new(0, 10, 0, 10)
    SearchContainer.BackgroundColor3 = CurrentTheme.Surface
    SearchContainer.BackgroundTransparency = 0.25
    SearchContainer.BorderSizePixel = 0
    SearchContainer.Parent = Sidebar

    local SearchCorner = Instance.new("UICorner")
    SearchCorner.CornerRadius = UDim.new(0, 9)
    SearchCorner.Parent = SearchContainer

    local SearchBox = Instance.new("TextBox")
    SearchBox.Name = "SearchBox"
    SearchBox.Size = UDim2.new(1, -16, 1, 0)
    SearchBox.Position = UDim2.new(0, 8, 0, 0)
    SearchBox.BackgroundTransparency = 1
    SearchBox.PlaceholderText = "🔍 بحث عن ماب..."
    SearchBox.Text = ""
    SearchBox.TextColor3 = CurrentTheme.TextPrimary
    SearchBox.PlaceholderColor3 = CurrentTheme.TextSecondary
    SearchBox.TextSize = 12
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.ClearTextOnFocus = false
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.Parent = SearchContainer

    -- قائمة المجلدات (سكرول)
    local FoldersScroll = Instance.new("ScrollingFrame")
    FoldersScroll.Name = "FoldersScroll"
    FoldersScroll.Size = UDim2.new(1, -20, 1, -160)
    FoldersScroll.Position = UDim2.new(0, 10, 0, 58)
    FoldersScroll.BackgroundTransparency = 1
    FoldersScroll.BorderSizePixel = 0
    FoldersScroll.ScrollBarThickness = 4
    FoldersScroll.ScrollBarImageColor3 = CurrentTheme.Primary
    FoldersScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    FoldersScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    FoldersScroll.Parent = Sidebar

    local FoldersLayout = Instance.new("UIListLayout")
    FoldersLayout.Padding = UDim.new(0, 8)
    FoldersLayout.SortOrder = Enum.SortOrder.LayoutOrder
    FoldersLayout.Parent = FoldersScroll

    -- زر البحث عبر API (يفتح لوحة البحث بالخارج - ScriptBlox + ترجمة)
    local ApiSearchButton = Instance.new("TextButton")
    ApiSearchButton.Name = "ApiSearchButton"
    ApiSearchButton.Size = UDim2.new(1, -20, 0, 42)
    ApiSearchButton.Position = UDim2.new(0, 10, 1, -96)
    ApiSearchButton.BackgroundColor3 = CurrentTheme.Info
    ApiSearchButton.BackgroundTransparency = 0.15
    ApiSearchButton.BorderSizePixel = 0
    ApiSearchButton.Text = "🌐 بحث سكربتات (API)"
    ApiSearchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ApiSearchButton.TextSize = 13
    ApiSearchButton.Font = Enum.Font.GothamBold
    ApiSearchButton.AutoButtonColor = false
    ApiSearchButton.Parent = Sidebar

    local ApiSearchCorner = Instance.new("UICorner")
    ApiSearchCorner.CornerRadius = UDim.new(0, 9)
    ApiSearchCorner.Parent = ApiSearchButton

    -- زر الإعدادات السريعة (نفس صفحة إعدادات اللاعب)
    local SettingsButton = Instance.new("TextButton")
    SettingsButton.Name = "SettingsButton"
    SettingsButton.Size = UDim2.new(1, -20, 0, 42)
    SettingsButton.Position = UDim2.new(0, 10, 1, -46)
    SettingsButton.BackgroundColor3 = CurrentTheme.Primary
    SettingsButton.BackgroundTransparency = 0.15
    SettingsButton.BorderSizePixel = 0
    SettingsButton.Text = "⚙️ إعدادات اللاعب"
    SettingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SettingsButton.TextSize = 13
    SettingsButton.Font = Enum.Font.GothamBold
    SettingsButton.AutoButtonColor = false
    SettingsButton.Parent = Sidebar

    local SettingsCorner = Instance.new("UICorner")
    SettingsCorner.CornerRadius = UDim.new(0, 9)
    SettingsCorner.Parent = SettingsButton

    -- ===================== منطقة المحتوى (يمين) =====================
    local ContentPane = Instance.new("Frame")
    ContentPane.Name = "ContentPane"
    ContentPane.Size = UDim2.new(1, -(SIDEBAR_WIDTH + 20), 1, -10)
    ContentPane.Position = UDim2.new(0, SIDEBAR_WIDTH + 20, 0, 0)
    ContentPane.BackgroundTransparency = 1
    ContentPane.Parent = Body

    -- ---------- طبقة عرض المجلدات/السكربتات ----------
    local FolderView = Instance.new("Frame")
    FolderView.Name = "FolderView"
    FolderView.Size = UDim2.new(1, 0, 1, 0)
    FolderView.BackgroundTransparency = 1
    FolderView.Parent = ContentPane

    local FolderTitle = Instance.new("TextLabel")
    FolderTitle.Name = "FolderTitle"
    FolderTitle.Size = UDim2.new(1, -260, 0, 30)
    FolderTitle.BackgroundTransparency = 1
    FolderTitle.Text = "⬅ اختر مجلداً من القائمة الجانبية"
    FolderTitle.TextColor3 = CurrentTheme.TextPrimary
    FolderTitle.TextSize = 17
    FolderTitle.Font = Enum.Font.GothamBold
    FolderTitle.TextXAlignment = Enum.TextXAlignment.Left
    FolderTitle.TextTruncate = Enum.TextTruncate.AtEnd
    FolderTitle.Parent = FolderView

    -- ---------- شريط الأدوات السريع (سرعة / قفز / ... إلخ) ----------
    local QuickToolbar = Instance.new("Frame")
    QuickToolbar.Name = "QuickToolbar"
    QuickToolbar.Size = UDim2.new(0, 250, 0, 34)
    QuickToolbar.Position = UDim2.new(1, -250, 0, 0)
    QuickToolbar.BackgroundTransparency = 1
    QuickToolbar.Parent = FolderView

    local QuickLayout = Instance.new("UIListLayout")
    QuickLayout.FillDirection = Enum.FillDirection.Horizontal
    QuickLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    QuickLayout.Padding = UDim.new(0, 6)
    QuickLayout.Parent = QuickToolbar

    -- دالة عامة لإنشاء زر تفعيل/تعطيل ميزة سريعة (سرعة، قفز، وأي ميزة تضيفها لاحقاً بنفس الطريقة)
    local function CreateQuickToggle(labelText, onEnable, onDisable)
        local state = false

        local Btn = Instance.new("TextButton")
        Btn.Size = UDim2.new(0, 78, 1, 0)
        Btn.BackgroundColor3 = CurrentTheme.Card
        Btn.BackgroundTransparency = 0.15
        Btn.BorderSizePixel = 0
        Btn.Text = labelText
        Btn.TextColor3 = CurrentTheme.TextSecondary
        Btn.TextSize = 12
        Btn.Font = Enum.Font.GothamBold
        Btn.AutoButtonColor = false
        Btn.Parent = QuickToolbar

        local BtnCorner = Instance.new("UICorner")
        BtnCorner.CornerRadius = UDim.new(0, 8)
        BtnCorner.Parent = Btn

        local BtnStroke = Instance.new("UIStroke")
        BtnStroke.Color = CurrentTheme.Primary
        BtnStroke.Thickness = 1
        BtnStroke.Transparency = 0.6
        BtnStroke.Parent = Btn

        Btn.MouseButton1Click:Connect(function()
            state = not state
            PlaySound(SoundEffects.Toggle, 0.4, state and 1.1 or 0.9)

            if state then
                TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = CurrentTheme.Success, BackgroundTransparency = 0.1}):Play()
                Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                if onEnable then onEnable() end
            else
                TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = CurrentTheme.Card, BackgroundTransparency = 0.15}):Play()
                Btn.TextColor3 = CurrentTheme.TextSecondary
                if onDisable then onDisable() end
            end
        end)

        return Btn
    end

    -- الحصول على الهيومنويد الحالي مع إعادة الربط عند الموت/إعادة الظهور
    local function GetHumanoid()
        local char = LocalPlayer.Character
        return char and char:FindFirstChildOfClass("Humanoid")
    end

    -- زر السرعة
    local DefaultWalkSpeed = 16
    CreateQuickToggle("🏃 سرعة", function()
        local hum = GetHumanoid()
        if hum then hum.WalkSpeed = 50 end
        Hub._SpeedEnabled = true
    end, function()
        local hum = GetHumanoid()
        if hum then hum.WalkSpeed = DefaultWalkSpeed end
        Hub._SpeedEnabled = false
    end)

    -- زر القفز
    local DefaultJumpPower = 50
    CreateQuickToggle("⬆ قفز", function()
        local hum = GetHumanoid()
        if hum then hum.JumpPower = 100 end
        Hub._JumpEnabled = true
    end, function()
        local hum = GetHumanoid()
        if hum then hum.JumpPower = DefaultJumpPower end
        Hub._JumpEnabled = false
    end)

    -- إعادة تطبيق السرعة/القفز عند إعادة ظهور الشخصية (لو كانت الميزة مفعّلة)
    LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            if Hub._SpeedEnabled then hum.WalkSpeed = 50 end
            if Hub._JumpEnabled then hum.JumpPower = 100 end
        end
    end)

    -- ---------- منطقة عرض السكربتات الخاصة بالمجلد المختار ----------
    local ScriptsScroll = Instance.new("ScrollingFrame")
    ScriptsScroll.Name = "ScriptsScroll"
    ScriptsScroll.Size = UDim2.new(1, 0, 1, -46)
    ScriptsScroll.Position = UDim2.new(0, 0, 0, 46)
    ScriptsScroll.BackgroundTransparency = 1
    ScriptsScroll.BorderSizePixel = 0
    ScriptsScroll.ScrollBarThickness = 5
    ScriptsScroll.ScrollBarImageColor3 = CurrentTheme.Primary
    ScriptsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScriptsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScriptsScroll.Parent = FolderView

    local ScriptsLayout = Instance.new("UIListLayout")
    ScriptsLayout.Padding = UDim.new(0, 10)
    ScriptsLayout.Parent = ScriptsScroll

    -- ---------- طبقة عرض البحث عبر API (ترجمة + ScriptBlox) ----------
    local SearchView = Instance.new("Frame")
    SearchView.Name = "SearchView"
    SearchView.Size = UDim2.new(1, 0, 1, 0)
    SearchView.BackgroundTransparency = 1
    SearchView.Visible = false
    SearchView.Parent = ContentPane

    local SearchViewTitle = Instance.new("TextLabel")
    SearchViewTitle.Size = UDim2.new(1, 0, 0, 26)
    SearchViewTitle.BackgroundTransparency = 1
    SearchViewTitle.Text = "🌐 بحث سكربتات (ScriptBlox) - اكتب اسم الماب بأي لغة"
    SearchViewTitle.TextColor3 = CurrentTheme.TextPrimary
    SearchViewTitle.TextSize = 15
    SearchViewTitle.Font = Enum.Font.GothamBold
    SearchViewTitle.TextXAlignment = Enum.TextXAlignment.Left
    SearchViewTitle.Parent = SearchView

    local ApiInputBox = Instance.new("TextBox")
    ApiInputBox.Size = UDim2.new(1, -120, 0, 38)
    ApiInputBox.Position = UDim2.new(0, 0, 0, 34)
    ApiInputBox.BackgroundColor3 = CurrentTheme.Card
    ApiInputBox.BackgroundTransparency = 0.2
    ApiInputBox.BorderSizePixel = 0
    ApiInputBox.PlaceholderText = "مثال: بلوكس فروت / adopt me..."
    ApiInputBox.Text = ""
    ApiInputBox.TextColor3 = CurrentTheme.TextPrimary
    ApiInputBox.PlaceholderColor3 = CurrentTheme.TextSecondary
    ApiInputBox.TextSize = 13
    ApiInputBox.Font = Enum.Font.Gotham
    ApiInputBox.ClearTextOnFocus = false
    ApiInputBox.TextXAlignment = Enum.TextXAlignment.Left
    ApiInputBox.Parent = SearchView

    local ApiInputCorner = Instance.new("UICorner")
    ApiInputCorner.CornerRadius = UDim.new(0, 9)
    ApiInputCorner.Parent = ApiInputBox

    local ApiSearchGoButton = Instance.new("TextButton")
    ApiSearchGoButton.Size = UDim2.new(0, 108, 0, 38)
    ApiSearchGoButton.Position = UDim2.new(1, -108, 0, 34)
    ApiSearchGoButton.BackgroundColor3 = CurrentTheme.Success
    ApiSearchGoButton.BackgroundTransparency = 0.1
    ApiSearchGoButton.BorderSizePixel = 0
    ApiSearchGoButton.Text = "ترجمة و بحث"
    ApiSearchGoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ApiSearchGoButton.TextSize = 13
    ApiSearchGoButton.Font = Enum.Font.GothamBold
    ApiSearchGoButton.AutoButtonColor = false
    ApiSearchGoButton.Parent = SearchView

    local ApiGoCorner = Instance.new("UICorner")
    ApiGoCorner.CornerRadius = UDim.new(0, 9)
    ApiGoCorner.Parent = ApiSearchGoButton

    local ApiStatusLabel = Instance.new("TextLabel")
    ApiStatusLabel.Size = UDim2.new(1, 0, 0, 20)
    ApiStatusLabel.Position = UDim2.new(0, 0, 0, 78)
    ApiStatusLabel.BackgroundTransparency = 1
    ApiStatusLabel.Text = ""
    ApiStatusLabel.TextColor3 = CurrentTheme.TextSecondary
    ApiStatusLabel.TextSize = 12
    ApiStatusLabel.Font = Enum.Font.Gotham
    ApiStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    ApiStatusLabel.Parent = SearchView

    local ApiResultsScroll = Instance.new("ScrollingFrame")
    ApiResultsScroll.Size = UDim2.new(1, 0, 1, -104)
    ApiResultsScroll.Position = UDim2.new(0, 0, 0, 104)
    ApiResultsScroll.BackgroundTransparency = 1
    ApiResultsScroll.BorderSizePixel = 0
    ApiResultsScroll.ScrollBarThickness = 5
    ApiResultsScroll.ScrollBarImageColor3 = CurrentTheme.Primary
    ApiResultsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ApiResultsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ApiResultsScroll.Parent = SearchView

    local ApiResultsLayout = Instance.new("UIListLayout")
    ApiResultsLayout.Padding = UDim.new(0, 10)
    ApiResultsLayout.Parent = ApiResultsScroll

    -- بطاقة نتيجة بحث (من ScriptBlox) مع زر تنفيذ + زر نسخ
    local function CreateApiResultCard(scriptData)
        local Card = Instance.new("Frame")
        Card.Size = UDim2.new(1, 0, 0, 78)
        Card.BackgroundColor3 = CurrentTheme.Card
        Card.BackgroundTransparency = 0.25
        Card.BorderSizePixel = 0
        Card.Parent = ApiResultsScroll

        local CardCorner = Instance.new("UICorner")
        CardCorner.CornerRadius = UDim.new(0, 10)
        CardCorner.Parent = Card

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1, -190, 0, 22)
        Title.Position = UDim2.new(0, 14, 0, 10)
        Title.BackgroundTransparency = 1
        Title.Text = (scriptData.title or "بدون عنوان") .. (scriptData.verified and "  ✓" or "")
        Title.TextColor3 = CurrentTheme.TextPrimary
        Title.TextSize = 14
        Title.Font = Enum.Font.GothamBold
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.TextTruncate = Enum.TextTruncate.AtEnd
        Title.Parent = Card

        local GameName = Instance.new("TextLabel")
        GameName.Size = UDim2.new(1, -190, 0, 18)
        GameName.Position = UDim2.new(0, 14, 0, 34)
        GameName.BackgroundTransparency = 1
        GameName.Text = "🎮 " .. ((scriptData.game and scriptData.game.name) or "غير معروف")
            .. "   •   👁 " .. tostring(scriptData.views or 0)
        GameName.TextColor3 = CurrentTheme.TextSecondary
        GameName.TextSize = 11
        GameName.Font = Enum.Font.Gotham
        GameName.TextXAlignment = Enum.TextXAlignment.Left
        GameName.TextTruncate = Enum.TextTruncate.AtEnd
        GameName.Parent = Card

        local RunBtn = Instance.new("TextButton")
        RunBtn.Size = UDim2.new(0, 80, 0, 30)
        RunBtn.Position = UDim2.new(1, -172, 0.5, 0)
        RunBtn.AnchorPoint = Vector2.new(0, 0.5)
        RunBtn.BackgroundColor3 = CurrentTheme.Success
        RunBtn.BackgroundTransparency = 0.1
        RunBtn.BorderSizePixel = 0
        RunBtn.Text = "▶ تشغيل"
        RunBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        RunBtn.TextSize = 12
        RunBtn.Font = Enum.Font.GothamBold
        RunBtn.AutoButtonColor = false
        RunBtn.Parent = Card

        local RunCorner = Instance.new("UICorner")
        RunCorner.CornerRadius = UDim.new(0, 8)
        RunCorner.Parent = RunBtn

        local CopyBtn = Instance.new("TextButton")
        CopyBtn.Size = UDim2.new(0, 80, 0, 30)
        CopyBtn.Position = UDim2.new(1, -86, 0.5, 0)
        CopyBtn.AnchorPoint = Vector2.new(0, 0.5)
        CopyBtn.BackgroundColor3 = CurrentTheme.Info
        CopyBtn.BackgroundTransparency = 0.1
        CopyBtn.BorderSizePixel = 0
        CopyBtn.Text = "📋 نسخ"
        CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        CopyBtn.TextSize = 12
        CopyBtn.Font = Enum.Font.GothamBold
        CopyBtn.AutoButtonColor = false
        CopyBtn.Parent = Card

        local CopyCorner = Instance.new("UICorner")
        CopyCorner.CornerRadius = UDim.new(0, 8)
        CopyCorner.Parent = CopyBtn

        RunBtn.MouseButton1Click:Connect(function()
            PlaySound(SoundEffects.Success, 0.5)
            local code = scriptData.script
            if not code or code == "" then
                Hub:ShowNotification("⚠️ لا يوجد كود", "هذا السكربت يحتاج مفتاح (Key) أو غير متوفر مباشرة", Icons.Info, "warning", 3)
                return
            end
            local ok, err = pcall(function()
                local f = loadstring(code)
                if f then f() end
            end)
            if ok then
                Hub:ShowNotification("✅ تم التشغيل", "تم تشغيل: " .. (scriptData.title or ""), Icons.Check, "success", 3)
            else
                Hub:ShowNotification("❌ خطأ بالتشغيل", tostring(err), Icons.Info, "error", 4)
            end
        end)

        CopyBtn.MouseButton1Click:Connect(function()
            PlaySound(SoundEffects.Click, 0.4)
            CopyToClipboard(Hub, scriptData.script or "")
        end)

        return Card
    end

    local function ClearApiResults()
        for _, child in ipairs(ApiResultsScroll:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end
    end

    local function RunApiSearch()
        local query = ApiInputBox.Text
        if query == "" then
            ApiStatusLabel.Text = "⚠️ اكتب اسم الماب أولاً"
            ApiStatusLabel.TextColor3 = CurrentTheme.Warning
            return
        end

        ApiStatusLabel.Text = "⏳ يتم الترجمة والبحث..."
        ApiStatusLabel.TextColor3 = CurrentTheme.Info
        ClearApiResults()

        task.spawn(function()
            local scripts, err, translated = ScriptAPI.TranslateThenSearch(query)

            if not scripts then
                ApiStatusLabel.Text = "❌ " .. tostring(err)
                ApiStatusLabel.TextColor3 = CurrentTheme.Error
                return
            end

            ApiStatusLabel.Text = "✅ تمت الترجمة إلى: \"" .. tostring(translated) .. "\" - عدد النتائج: " .. #scripts
            ApiStatusLabel.TextColor3 = CurrentTheme.Success

            for _, scriptData in ipairs(scripts) do
                CreateApiResultCard(scriptData)
            end
        end)
    end

    ApiSearchGoButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.4)
        RunApiSearch()
    end)

    ApiInputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then RunApiSearch() end
    end)

    -- ---------- التبديل بين طبقة المجلدات وطبقة البحث ----------
    local function ShowFolderView()
        FolderView.Visible = true
        SearchView.Visible = false
    end

    local function ShowSearchView()
        FolderView.Visible = false
        SearchView.Visible = true
    end

    ApiSearchButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.4)
        ShowSearchView()
    end)

    -- ------------------------------------------------------------
    -- صفحة إعدادات اللاعب (Profile) - تظهر كطبقة كاملة فوق الجسم
    -- ------------------------------------------------------------
    local ProfilePage = Instance.new("ScrollingFrame")
    ProfilePage.Name = "ProfilePage"
    ProfilePage.Size = UDim2.new(1, 0, 1, -10)
    ProfilePage.Position = UDim2.new(1, 0, 0, 0)
    ProfilePage.BackgroundTransparency = 1
    ProfilePage.BorderSizePixel = 0
    ProfilePage.ScrollBarThickness = 5
    ProfilePage.ScrollBarImageColor3 = CurrentTheme.Primary
    ProfilePage.Visible = false
    ProfilePage.CanvasSize = UDim2.new(0, 0, 0, 0)
    ProfilePage.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ProfilePage.Parent = Body

    local ProfilePadding = Instance.new("UIPadding")
    ProfilePadding.PaddingTop = UDim.new(0, 46)
    ProfilePadding.PaddingBottom = UDim.new(0, 20)
    ProfilePadding.Parent = ProfilePage

    local ProfileLayout = Instance.new("UIListLayout")
    ProfileLayout.Padding = UDim.new(0, 14)
    ProfileLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ProfileLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ProfileLayout.Parent = ProfilePage

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

    CreateGradient(PlayerInfoCard, 90, CurrentTheme.Primary, CurrentTheme.Secondary)

    local ProfileAvatar = Instance.new("ImageLabel")
    ProfileAvatar.Size = UDim2.new(0, 84, 0, 84)
    ProfileAvatar.Position = UDim2.new(0, 13, 0, 13)
    ProfileAvatar.BackgroundColor3 = CurrentTheme.Surface
    ProfileAvatar.BorderSizePixel = 0
    ProfileAvatar.Image = ""
    ProfileAvatar.Parent = PlayerInfoCard

    local ProfileAvatarCorner = Instance.new("UICorner")
    ProfileAvatarCorner.CornerRadius = UDim.new(1, 0)
    ProfileAvatarCorner.Parent = ProfileAvatar

    local ProfileAvatarStroke = Instance.new("UIStroke")
    ProfileAvatarStroke.Color = CurrentTheme.Primary
    ProfileAvatarStroke.Thickness = 2
    ProfileAvatarStroke.Parent = ProfileAvatar

    LoadAvatar(ProfileAvatar, LocalPlayer.UserId)

    local ProfileName = Instance.new("TextLabel")
    ProfileName.Size = UDim2.new(1, -115, 0, 26)
    ProfileName.Position = UDim2.new(0, 110, 0, 18)
    ProfileName.BackgroundTransparency = 1
    ProfileName.Text = LocalPlayer.DisplayName
    ProfileName.TextColor3 = CurrentTheme.TextPrimary
    ProfileName.TextSize = 18
    ProfileName.Font = Enum.Font.GothamBold
    ProfileName.TextXAlignment = Enum.TextXAlignment.Left
    ProfileName.TextTruncate = Enum.TextTruncate.AtEnd
    ProfileName.Parent = PlayerInfoCard

    local ProfileUsername = Instance.new("TextLabel")
    ProfileUsername.Size = UDim2.new(1, -115, 0, 20)
    ProfileUsername.Position = UDim2.new(0, 110, 0, 46)
    ProfileUsername.BackgroundTransparency = 1
    ProfileUsername.Text = "@" .. LocalPlayer.Name
    ProfileUsername.TextColor3 = CurrentTheme.TextSecondary
    ProfileUsername.TextSize = 13
    ProfileUsername.Font = Enum.Font.Gotham
    ProfileUsername.TextXAlignment = Enum.TextXAlignment.Left
    ProfileUsername.Parent = PlayerInfoCard

    local ProfileUserId = Instance.new("TextLabel")
    ProfileUserId.Size = UDim2.new(1, -115, 0, 20)
    ProfileUserId.Position = UDim2.new(0, 110, 0, 70)
    ProfileUserId.BackgroundTransparency = 1
    ProfileUserId.Text = "ID: " .. tostring(LocalPlayer.UserId)
    ProfileUserId.TextColor3 = CurrentTheme.TextSecondary
    ProfileUserId.TextSize = 12
    ProfileUserId.Font = Enum.Font.Gotham
    ProfileUserId.TextXAlignment = Enum.TextXAlignment.Left
    ProfileUserId.Parent = PlayerInfoCard

    -- بطاقة الإحصائيات
    local StatsCard = Instance.new("Frame")
    StatsCard.Name = "StatsCard"
    StatsCard.Size = UDim2.new(1, 0, 0, 200)
    StatsCard.BackgroundColor3 = CurrentTheme.Card
    StatsCard.BackgroundTransparency = 0.15
    StatsCard.BorderSizePixel = 0
    StatsCard.LayoutOrder = 2
    StatsCard.Parent = ProfilePage

    local StatsCardCorner = Instance.new("UICorner")
    StatsCardCorner.CornerRadius = UDim.new(0, 12)
    StatsCardCorner.Parent = StatsCard

    local StatsTitle = Instance.new("TextLabel")
    StatsTitle.Size = UDim2.new(1, -30, 0, 26)
    StatsTitle.Position = UDim2.new(0, 15, 0, 10)
    StatsTitle.BackgroundTransparency = 1
    StatsTitle.Text = "📊 إحصائيات المستخدمين"
    StatsTitle.TextColor3 = CurrentTheme.TextPrimary
    StatsTitle.TextSize = 16
    StatsTitle.Font = Enum.Font.GothamBold
    StatsTitle.TextXAlignment = Enum.TextXAlignment.Left
    StatsTitle.Parent = StatsCard

    local StatsGrid = Instance.new("Frame")
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

    -- بطاقة التشغيل/التعطيل - الآن تكتم/تفعّل إشعارات اللاعب فعلياً
    local PowerCard = Instance.new("Frame")
    PowerCard.Name = "PowerToggleCard"
    PowerCard.Size = UDim2.new(1, 0, 0, 74)
    PowerCard.BackgroundColor3 = CurrentTheme.Card
    PowerCard.BackgroundTransparency = 0.1
    PowerCard.BorderSizePixel = 0
    PowerCard.LayoutOrder = 3
    PowerCard.Parent = ProfilePage

    local PowerCorner = Instance.new("UICorner")
    PowerCorner.CornerRadius = UDim.new(0, 14)
    PowerCorner.Parent = PowerCard

    CreateGradient(PowerCard, 45, CurrentTheme.Success, CurrentTheme.Info)

    local PowerStroke = Instance.new("UIStroke")
    PowerStroke.Color = CurrentTheme.Success
    PowerStroke.Thickness = 1.5
    PowerStroke.Transparency = 0.5
    PowerStroke.Parent = PowerCard

    local PowerLabel = Instance.new("TextLabel")
    PowerLabel.Size = UDim2.new(1, -120, 0, 24)
    PowerLabel.Position = UDim2.new(0, 18, 0, 15)
    PowerLabel.BackgroundTransparency = 1
    PowerLabel.Text = "⚡ تفعيل / تعطيل إشعارات اللاعب"
    PowerLabel.TextColor3 = CurrentTheme.TextPrimary
    PowerLabel.TextSize = 15
    PowerLabel.Font = Enum.Font.GothamBold
    PowerLabel.TextXAlignment = Enum.TextXAlignment.Left
    PowerLabel.Parent = PowerCard

    local PowerStatus = Instance.new("TextLabel")
    PowerStatus.Size = UDim2.new(1, -120, 0, 20)
    PowerStatus.Position = UDim2.new(0, 18, 0, 40)
    PowerStatus.BackgroundTransparency = 1
    PowerStatus.Text = "✅ الإشعارات مفعّلة حالياً"
    PowerStatus.TextColor3 = CurrentTheme.Success
    PowerStatus.TextSize = 12
    PowerStatus.Font = Enum.Font.Gotham
    PowerStatus.TextXAlignment = Enum.TextXAlignment.Left
    PowerStatus.Parent = PowerCard

    local ToggleButton = Instance.new("TextButton")
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
    ToggleCircle.Size = UDim2.new(0, 28, 0, 28)
    ToggleCircle.Position = UDim2.new(0, 35, 0.5, 0)
    ToggleCircle.AnchorPoint = Vector2.new(0, 0.5)
    ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ToggleCircle.BorderSizePixel = 0
    ToggleCircle.Parent = ToggleButton

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = ToggleCircle

    ToggleButton.MouseButton1Click:Connect(function()
        Hub.IsEnabled = not Hub.IsEnabled
        NotificationsMuted = not Hub.IsEnabled -- التبديل الفعلي لكتم/تفعيل إشعارات الهَب

        if Hub.IsEnabled then
            PlaySound(SoundEffects.Toggle, 0.5, 1.15)
            TweenService:Create(ToggleButton, TweenInfo.new(0.28, Enum.EasingStyle.Quad), {BackgroundColor3 = CurrentTheme.Success}):Play()
            TweenService:Create(ToggleStroke, TweenInfo.new(0.28), {Color = CurrentTheme.Success}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 35, 0.5, 0)}):Play()

            PowerStatus.Text = "✅ الإشعارات مفعّلة حالياً"
            PowerStatus.TextColor3 = CurrentTheme.Success

            -- forceShow = true لضمان ظهور تأكيد إعادة التفعيل حتى لو كانت مكتومة قبل قليل
            UltimateHub:ShowNotification("⚡ تم تفعيل الإشعارات", "ستظهر لك إشعارات الهَب من جديد", Icons.Power, "success", 3, true)
        else
            PlaySound(SoundEffects.Toggle, 0.5, 0.85)
            TweenService:Create(ToggleButton, TweenInfo.new(0.28, Enum.EasingStyle.Quad), {BackgroundColor3 = CurrentTheme.Error}):Play()
            TweenService:Create(ToggleStroke, TweenInfo.new(0.28), {Color = CurrentTheme.Error}):Play()
            TweenService:Create(ToggleCircle, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0, 3, 0.5, 0)}):Play()

            PowerStatus.Text = "⛔ الإشعارات معطّلة حالياً"
            PowerStatus.TextColor3 = CurrentTheme.Error

            -- إشعار تأكيد التعطيل يظهر مرة واحدة فقط (forceShow) ثم تُكتم كل الإشعارات التالية
            UltimateHub:ShowNotification("⛔ تم كتم الإشعارات", "لن تظهر إشعارات الهَب حتى تُعيد تفعيلها", Icons.Close, "warning", 3, true)
        end
    end)

    -- بطاقة معلومات جاهزة للنسخ - 3 مربعات شفافة فقط (عنوان + وصف + زر نسخ)
    local InfoBoxesCard = Instance.new("Frame")
    InfoBoxesCard.Name = "InfoBoxesCard"
    InfoBoxesCard.Size = UDim2.new(1, 0, 0, 36 + (#CopyInfoBoxes * 76))
    InfoBoxesCard.BackgroundTransparency = 1
    InfoBoxesCard.LayoutOrder = 4
    InfoBoxesCard.Parent = ProfilePage

    local InfoBoxesTitle = Instance.new("TextLabel")
    InfoBoxesTitle.Size = UDim2.new(1, 0, 0, 26)
    InfoBoxesTitle.BackgroundTransparency = 1
    InfoBoxesTitle.Text = "ℹ️ معلومات"
    InfoBoxesTitle.TextColor3 = CurrentTheme.TextPrimary
    InfoBoxesTitle.TextSize = 16
    InfoBoxesTitle.Font = Enum.Font.GothamBold
    InfoBoxesTitle.TextXAlignment = Enum.TextXAlignment.Left
    InfoBoxesTitle.Parent = InfoBoxesCard

    local InfoBoxesList = Instance.new("Frame")
    InfoBoxesList.Size = UDim2.new(1, 0, 0, #CopyInfoBoxes * 76)
    InfoBoxesList.Position = UDim2.new(0, 0, 0, 32)
    InfoBoxesList.BackgroundTransparency = 1
    InfoBoxesList.Parent = InfoBoxesCard

    local InfoBoxesLayout = Instance.new("UIListLayout")
    InfoBoxesLayout.Padding = UDim.new(0, 8)
    InfoBoxesLayout.Parent = InfoBoxesList

    for i, entry in ipairs(CopyInfoBoxes) do
        local Box = Instance.new("Frame")
        Box.Name = "InfoBox" .. i
        Box.Size = UDim2.new(1, 0, 0, 68)
        Box.BackgroundColor3 = CurrentTheme.Surface
        Box.BackgroundTransparency = 0.85 -- شفاف كما طُلب
        Box.BorderSizePixel = 0
        Box.LayoutOrder = i
        Box.Parent = InfoBoxesList

        local BoxCorner = Instance.new("UICorner")
        BoxCorner.CornerRadius = UDim.new(0, 10)
        BoxCorner.Parent = Box

        local BoxStroke = Instance.new("UIStroke")
        BoxStroke.Color = CurrentTheme.Primary
        BoxStroke.Thickness = 1
        BoxStroke.Transparency = 0.7
        BoxStroke.Parent = Box

        local BoxTitle = Instance.new("TextLabel")
        BoxTitle.Size = UDim2.new(1, -100, 0, 22)
        BoxTitle.Position = UDim2.new(0, 14, 0, 8)
        BoxTitle.BackgroundTransparency = 1
        BoxTitle.Text = entry.Title
        BoxTitle.TextColor3 = CurrentTheme.TextPrimary
        BoxTitle.TextSize = 14
        BoxTitle.Font = Enum.Font.GothamBold
        BoxTitle.TextXAlignment = Enum.TextXAlignment.Left
        BoxTitle.TextTruncate = Enum.TextTruncate.AtEnd
        BoxTitle.Parent = Box

        local BoxDesc = Instance.new("TextLabel")
        BoxDesc.Size = UDim2.new(1, -100, 0, 34)
        BoxDesc.Position = UDim2.new(0, 14, 0, 30)
        BoxDesc.BackgroundTransparency = 1
        BoxDesc.Text = entry.Description
        BoxDesc.TextColor3 = CurrentTheme.TextSecondary
        BoxDesc.TextSize = 11
        BoxDesc.Font = Enum.Font.Gotham
        BoxDesc.TextXAlignment = Enum.TextXAlignment.Left
        BoxDesc.TextYAlignment = Enum.TextYAlignment.Top
        BoxDesc.TextWrapped = true
        BoxDesc.Parent = Box

        local BoxCopyBtn = Instance.new("TextButton")
        BoxCopyBtn.Size = UDim2.new(0, 74, 0, 30)
        BoxCopyBtn.Position = UDim2.new(1, -84, 0.5, 0)
        BoxCopyBtn.AnchorPoint = Vector2.new(0, 0.5)
        BoxCopyBtn.BackgroundColor3 = CurrentTheme.Primary
        BoxCopyBtn.BackgroundTransparency = 0.15
        BoxCopyBtn.BorderSizePixel = 0
        BoxCopyBtn.Text = "📋 نسخ"
        BoxCopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        BoxCopyBtn.TextSize = 12
        BoxCopyBtn.Font = Enum.Font.GothamBold
        BoxCopyBtn.AutoButtonColor = false
        BoxCopyBtn.Parent = Box

        local BoxCopyCorner = Instance.new("UICorner")
        BoxCopyCorner.CornerRadius = UDim.new(0, 8)
        BoxCopyCorner.Parent = BoxCopyBtn

        BoxCopyBtn.MouseButton1Click:Connect(function()
            PlaySound(SoundEffects.Click, 0.4)
            CopyToClipboard(Hub, entry.Title .. ": " .. entry.Description)
        end)
    end

    -- ------------------------------------------------------------
    -- التنقل: فتح/إغلاق صفحة إعدادات اللاعب
    -- ------------------------------------------------------------
    local function OpenProfile()
        Hub.CurrentPage = "profile"
        ProfilePage.Visible = true
        ProfilePage.Position = UDim2.new(1, 0, 0, 0)

        TweenService:Create(Sidebar, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(-1, 0, 0, 0)
        }):Play()
        TweenService:Create(ContentPane, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, 0, 0, 0)
        }):Play()

        local slideIn = TweenService:Create(ProfilePage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0)
        })
        slideIn:Play()

        PlaySound(SoundEffects.Whoosh, 0.3)
    end

    local function CloseProfile()
        Hub.CurrentPage = "main"

        TweenService:Create(ProfilePage, TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, 0, 0, 0)
        }):Play()

        Sidebar.Position = UDim2.new(0, 10, 0, 0)
        ContentPane.Position = UDim2.new(0, SIDEBAR_WIDTH + 20, 0, 0)

        task.wait(0.38)
        ProfilePage.Visible = false
    end

    ProfileBackButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.3)
        CloseProfile()
    end)

    TitleAvatarButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.35)
        OpenProfile()
    end)

    SettingsButton.MouseButton1Click:Connect(function()
        PlaySound(SoundEffects.Click, 0.35)
        OpenProfile()
    end)

    -- ------------------------------------------------------------
    -- بطاقة مجلد بالقائمة الجانبية
    -- ------------------------------------------------------------
    local function CreateFolderCard(image, name, scriptCount, onClick)
        local Card = Instance.new("TextButton")
        Card.Name = name
        Card.Size = UDim2.new(1, 0, 0, 60)
        Card.BackgroundColor3 = CurrentTheme.Surface
        Card.BackgroundTransparency = 0.2
        Card.BorderSizePixel = 0
        Card.Text = ""
        Card.AutoButtonColor = false
        Card.Parent = FoldersScroll

        local CardCorner = Instance.new("UICorner")
        CardCorner.CornerRadius = UDim.new(0, 10)
        CardCorner.Parent = Card

        local CardStroke = Instance.new("UIStroke")
        CardStroke.Color = CurrentTheme.Primary
        CardStroke.Thickness = 1.5
        CardStroke.Transparency = 0.6
        CardStroke.Parent = Card

        local Icon = Instance.new("ImageLabel")
        Icon.Size = UDim2.new(0, 40, 0, 40)
        Icon.Position = UDim2.new(0, 8, 0.5, 0)
        Icon.AnchorPoint = Vector2.new(0, 0.5)
        Icon.BackgroundColor3 = CurrentTheme.Card
        Icon.BorderSizePixel = 0
        Icon.Image = image or ""
        Icon.Parent = Card

        local IconCorner = Instance.new("UICorner")
        IconCorner.CornerRadius = UDim.new(0, 8)
        IconCorner.Parent = Icon

        local NameLabel = Instance.new("TextLabel")
        NameLabel.Size = UDim2.new(1, -60, 0, 20)
        NameLabel.Position = UDim2.new(0, 56, 0, 8)
        NameLabel.BackgroundTransparency = 1
        NameLabel.Text = name
        NameLabel.TextColor3 = CurrentTheme.TextPrimary
        NameLabel.TextSize = 13
        NameLabel.Font = Enum.Font.GothamBold
        NameLabel.TextXAlignment = Enum.TextXAlignment.Left
        NameLabel.TextTruncate = Enum.TextTruncate.AtEnd
        NameLabel.Parent = Card

        local CountLabel = Instance.new("TextLabel")
        CountLabel.Size = UDim2.new(1, -60, 0, 16)
        CountLabel.Position = UDim2.new(0, 56, 0, 30)
        CountLabel.BackgroundTransparency = 1
        CountLabel.Text = string.format("📜 %d سكربت", scriptCount or 0)
        CountLabel.TextColor3 = CurrentTheme.TextSecondary
        CountLabel.TextSize = 11
        CountLabel.Font = Enum.Font.Gotham
        CountLabel.TextXAlignment = Enum.TextXAlignment.Left
        CountLabel.Parent = Card

        Card.MouseEnter:Connect(function()
            TweenService:Create(Card, TweenInfo.new(0.18), {BackgroundTransparency = 0.05}):Play()
        end)
        Card.MouseLeave:Connect(function()
            TweenService:Create(Card, TweenInfo.new(0.18), {BackgroundTransparency = 0.2}):Play()
        end)

        Card.MouseButton1Click:Connect(function()
            PlaySound(SoundEffects.Click, 0.45)
            if onClick then onClick() end
        end)

        return Card
    end

    -- ------------------------------------------------------------
    -- بطاقة سكربت داخل مجلد
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

            RegisterUser(LocalPlayer.UserId, LocalPlayer.Name, LocalPlayer.DisplayName)

            UltimateHub:ShowNotification("✅ تم تفعيل السكربت", "تم تشغيل: " .. scriptName, Icons.Check, "success", 3)

            if onExecute then onExecute() end

            task.wait(1.4)
            if ExecuteBtn and ExecuteBtn.Parent then
                ExecuteBtn.Text = "تشغيل"
            end
        end)

        return Button
    end

    -- ------------------------------------------------------------
    -- التنقل: اختيار مجلد من القائمة الجانبية يعرض سكربتاته يميناً
    -- ------------------------------------------------------------
    local function SelectFolder(mapData)
        Hub.CurrentPage = "folder"
        Hub.CurrentMap = mapData

        ShowFolderView()
        FolderTitle.Text = "📁 " .. mapData.name

        for _, child in ipairs(ScriptsScroll:GetChildren()) do
            if child:IsA("Frame") then
                child:Destroy()
            end
        end

        if mapData.scripts then
            for _, scr in ipairs(mapData.scripts) do
                CreateScriptButton(ScriptsScroll, scr.name, scr.description, scr.execute)
            end
        end
    end

    -- ------------------------------------------------------------
    -- إضافة مجلد/خريطة (تظهر كبطاقة بالقائمة الجانبية)
    -- ------------------------------------------------------------
    function Hub:AddMap(mapData)
        table.insert(Hub.Maps, mapData)

        local card = CreateFolderCard(
            mapData.image,
            mapData.name,
            mapData.scriptCount or (mapData.scripts and #mapData.scripts) or 0,
            function()
                SelectFolder(mapData)
            end
        )
        card.Name = mapData.name
    end

    -- ------------------------------------------------------------
    -- نظام بحث المجلدات المحلية
    -- ------------------------------------------------------------
    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local searchText = SearchBox.Text:lower()
        for _, card in ipairs(FoldersScroll:GetChildren()) do
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
        TweenService:Create(Sidebar, tweenInfo, {BackgroundColor3 = theme.Card}):Play()

        UltimateHub:ShowNotification("🎨 تم تغيير الثيم", "الثيم الحالي: " .. theme.Name, Icons.Theme, "info", 3)
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
    -- التكبير/التصغير
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
