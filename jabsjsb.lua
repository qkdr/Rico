--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║   🌟 Ultimate Premium Mobile UI - النسخة النهائية 2026 🌟   ║
    ║        واجهة فخمة مع تكبير/تصغير وتغيير الثيمات            ║
    ║     Resize, Theme Switcher, Dual Color Notifications        ║
    ╚═══════════════════════════════════════════════════════════════╝
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local UltimateUI = {}
UltimateUI.__index = UltimateUI

-- ═══════════════════════════════════════════════════════════════
--                    🎨 نظام الثيمات المتعددة الفخمة
-- ═══════════════════════════════════════════════════════════════
local Themes = {
    -- ثيم زجاجي شفاف (Glass)
    Glass = {
        Name = "زجاجي شفاف",
        Primary = Color3.fromRGB(138, 180, 255),
        Secondary = Color3.fromRGB(155, 89, 182),
        Accent = Color3.fromRGB(52, 152, 219),
        Background = Color3.fromRGB(20, 25, 35),
        Surface = Color3.fromRGB(30, 35, 50),
        Card = Color3.fromRGB(40, 45, 65),
        Success = Color3.fromRGB(46, 213, 115),
        Error = Color3.fromRGB(255, 71, 87),
        Warning = Color3.fromRGB(255, 159, 67),
        Info = Color3.fromRGB(72, 219, 251),
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(180, 190, 210),
        GradientStart = Color3.fromRGB(106, 17, 203),
        GradientEnd = Color3.fromRGB(37, 117, 252),
        Transparency = 0.15,
        GlassBlur = 0.2
    },
    
    -- ثيم نيون فخم (Neon)
    Neon = {
        Name = "نيون فخم",
        Primary = Color3.fromRGB(255, 0, 255),
        Secondary = Color3.fromRGB(0, 255, 255),
        Accent = Color3.fromRGB(255, 105, 180),
        Background = Color3.fromRGB(10, 10, 20),
        Surface = Color3.fromRGB(20, 20, 35),
        Card = Color3.fromRGB(25, 25, 45),
        Success = Color3.fromRGB(0, 255, 127),
        Error = Color3.fromRGB(255, 0, 100),
        Warning = Color3.fromRGB(255, 215, 0),
        Info = Color3.fromRGB(0, 191, 255),
        TextPrimary = Color3.fromRGB(255, 255, 255),
        TextSecondary = Color3.fromRGB(200, 200, 255),
        GradientStart = Color3.fromRGB(255, 0, 255),
        GradientEnd = Color3.fromRGB(0, 255, 255),
        Transparency = 0.1,
        GlassBlur = 0.15
    },
    
    -- ثيم ذهبي ملكي (Royal Gold)
    Royal = {
        Name = "ذهبي ملكي",
        Primary = Color3.fromRGB(255, 215, 0),
        Secondary = Color3.fromRGB(218, 165, 32),
        Accent = Color3.fromRGB(255, 223, 0),
        Background = Color3.fromRGB(15, 10, 25),
        Surface = Color3.fromRGB(30, 20, 40),
        Card = Color3.fromRGB(40, 30, 55),
        Success = Color3.fromRGB(50, 205, 50),
        Error = Color3.fromRGB(220, 20, 60),
        Warning = Color3.fromRGB(255, 140, 0),
        Info = Color3.fromRGB(135, 206, 250),
        TextPrimary = Color3.fromRGB(255, 250, 205),
        TextSecondary = Color3.fromRGB(218, 165, 32),
        GradientStart = Color3.fromRGB(255, 215, 0),
        GradientEnd = Color3.fromRGB(255, 105, 180),
        Transparency = 0.12,
        GlassBlur = 0.18
    },
    
    -- ثيم أزرق سماوي (Ocean)
    Ocean = {
        Name = "محيط أزرق",
        Primary = Color3.fromRGB(52, 152, 219),
        Secondary = Color3.fromRGB(41, 128, 185),
        Accent = Color3.fromRGB(26, 188, 156),
        Background = Color3.fromRGB(12, 18, 28),
        Surface = Color3.fromRGB(22, 30, 45),
        Card = Color3.fromRGB(32, 42, 60),
        Success = Color3.fromRGB(26, 188, 156),
        Error = Color3.fromRGB(231, 76, 60),
        Warning = Color3.fromRGB(230, 126, 34),
        Info = Color3.fromRGB(52, 152, 219),
        TextPrimary = Color3.fromRGB(236, 240, 241),
        TextSecondary = Color3.fromRGB(149, 165, 166),
        GradientStart = Color3.fromRGB(52, 152, 219),
        GradientEnd = Color3.fromRGB(142, 68, 173),
        Transparency = 0.15,
        GlassBlur = 0.2
    },
    
    -- ثيم وردي فخم (Pink Dream)
    Pink = {
        Name = "وردي أحلام",
        Primary = Color3.fromRGB(255, 105, 180),
        Secondary = Color3.fromRGB(255, 20, 147),
        Accent = Color3.fromRGB(255, 192, 203),
        Background = Color3.fromRGB(20, 15, 25),
        Surface = Color3.fromRGB(35, 25, 40),
        Card = Color3.fromRGB(50, 35, 55),
        Success = Color3.fromRGB(144, 238, 144),
        Error = Color3.fromRGB(255, 69, 0),
        Warning = Color3.fromRGB(255, 165, 0),
        Info = Color3.fromRGB(255, 182, 193),
        TextPrimary = Color3.fromRGB(255, 250, 250),
        TextSecondary = Color3.fromRGB(255, 192, 203),
        GradientStart = Color3.fromRGB(255, 105, 180),
        GradientEnd = Color3.fromRGB(138, 43, 226),
        Transparency = 0.12,
        GlassBlur = 0.17
    }
}

local CurrentTheme = Themes.Glass
local CurrentThemeIndex = 1
local ThemeNames = {"Glass", "Neon", "Royal", "Ocean", "Pink"}

-- ═══════════════════════════════════════════════════════════════
--                    🎯 أيقونات فخمة محسّنة
-- ═══════════════════════════════════════════════════════════════
local Icons = {
    -- أيقونات التحكم
    Close = "rbxassetid://7072725342",
    Minimize = "rbxassetid://7072719697",
    Maximize = "rbxassetid://7072719338",
    Resize = "rbxassetid://7072718230",
    Menu = "rbxassetid://7072718409",
    Settings = "rbxassetid://7072718900",
    
    -- أيقونات الثيمات
    Theme = "rbxassetid://7072718863",
    Palette = "rbxassetid://7072719071",
    Brush = "rbxassetid://7072706895",
    
    -- أيقونات التنقل
    Home = "rbxassetid://7072717697",
    Search = "rbxassetid://7072725342",
    Back = "rbxassetid://7072719070",
    Forward = "rbxassetid://7072706935",
    
    -- أيقونات الإجراءات
    Play = "rbxassetid://7072717643",
    Folder = "rbxassetid://7072707198",
    Check = "rbxassetid://7072706796",
    Star = "rbxassetid://7072718799",
    Heart = "rbxassetid://7072707412",
    
    -- أيقونات المعلومات
    Users = "rbxassetid://7072718006",
    Info = "rbxassetid://7072717384",
    Alert = "rbxassetid://7072706859",
    Bell = "rbxassetid://7072706462",
    
    -- أيقونات الوسائط
    Image = "rbxassetid://7072717327",
    Download = "rbxassetid://7072706839",
    Upload = "rbxassetid://7072719079",
    
    -- أيقونات الحالة
    Success = "rbxassetid://7072706796",
    Error = "rbxassetid://7072725342",
    Warning = "rbxassetid://7072706859",
}

-- ═══════════════════════════════════════════════════════════════
--                    ✨ وظائف التأثيرات المحسّنة
-- ═══════════════════════════════════════════════════════════════

-- تأثير زجاجي متقدم
local function CreateAdvancedGlass(parent)
    local Glass = Instance.new("ImageLabel")
    Glass.Name = "AdvancedGlass"
    Glass.Size = UDim2.new(1, 0, 1, 0)
    Glass.BackgroundTransparency = 1
    Glass.Image = "rbxassetid://8992230677"
    Glass.ImageColor3 = CurrentTheme.Primary
    Glass.ImageTransparency = CurrentTheme.GlassBlur
    Glass.ScaleType = Enum.ScaleType.Slice
    Glass.SliceCenter = Rect.new(99, 99, 99, 99)
    Glass.ZIndex = parent.ZIndex - 1
    Glass.Parent = parent
    
    return Glass
end

-- تدرج مزدوج متحرك
local function CreateDualGradient(parent, rotation)
    rotation = rotation or 45
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, CurrentTheme.GradientStart),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(
            (CurrentTheme.GradientStart.R + CurrentTheme.GradientEnd.R) * 127.5,
            (CurrentTheme.GradientStart.G + CurrentTheme.GradientEnd.G) * 127.5,
            (CurrentTheme.GradientStart.B + CurrentTheme.GradientEnd.B) * 127.5
        )),
        ColorSequenceKeypoint.new(1, CurrentTheme.GradientEnd)
    })
    Gradient.Rotation = rotation
    Gradient.Parent = parent
    
    -- أنيميشن مستمر
    spawn(function()
        while Gradient and Gradient.Parent do
            local tween = TweenService:Create(Gradient, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = rotation + 360
            })
            tween:Play()
            tween.Completed:Wait()
            Gradient.Rotation = rotation
        end
    end)
    
    return Gradient
end

-- توهج متعدد الألوان
local function CreateRainbowGlow(parent, intensity)
    intensity = intensity or 0.5
    
    local Glow = Instance.new("ImageLabel")
    Glow.Name = "RainbowGlow"
    Glow.AnchorPoint = Vector2.new(0.5, 0.5)
    Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Glow.Size = UDim2.new(1.4, 0, 1.4, 0)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://6015897843"
    Glow.ImageColor3 = CurrentTheme.Primary
    Glow.ImageTransparency = 1 - intensity
    Glow.ZIndex = 0
    Glow.Parent = parent
    
    -- تأثير قوس قزح
    spawn(function()
        while Glow and Glow.Parent do
            TweenService:Create(Glow, TweenInfo.new(2), {ImageColor3 = CurrentTheme.Primary}):Play()
            wait(2)
            TweenService:Create(Glow, TweenInfo.new(2), {ImageColor3 = CurrentTheme.Secondary}):Play()
            wait(2)
            TweenService:Create(Glow, TweenInfo.new(2), {ImageColor3 = CurrentTheme.Accent}):Play()
            wait(2)
        end
    end)
    
    return Glow
end

-- حد متوهج مزدوج
local function CreateDualStroke(parent, thickness)
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = CurrentTheme.Primary
    Stroke.Thickness = thickness or 2
    Stroke.Transparency = 0.4
    Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    Stroke.Parent = parent
    
    -- تأثير نبض اللون
    spawn(function()
        while Stroke and Stroke.Parent do
            TweenService:Create(Stroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Color = CurrentTheme.Secondary
            }):Play()
            wait(1.5)
            TweenService:Create(Stroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Color = CurrentTheme.Primary
            }):Play()
            wait(1.5)
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
--                    🔔 نظام الإشعارات المحسّن مع لونين
-- ═══════════════════════════════════════════════════════════════
function UltimateUI:ShowNotification(title, message, icon, notifType, duration)
    duration = duration or 4
    
    local NotifGui = Instance.new("ScreenGui")
    NotifGui.Name = "UltimateNotification"
    NotifGui.DisplayOrder = 999
    NotifGui.ResetOnSpawn = false
    NotifGui.Parent = CoreGui
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 340, 0, 95)
    NotifFrame.Position = UDim2.new(0.5, -170, 0, -110)
    NotifFrame.BackgroundColor3 = CurrentTheme.Surface
    NotifFrame.BackgroundTransparency = CurrentTheme.Transparency
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = NotifGui
    
    CreateCorner(18).Parent = NotifFrame
    CreateAdvancedGlass(NotifFrame)
    
    -- تحديد الألوان بناءً على النوع
    local primaryColor, secondaryColor
    if notifType == "success" then
        primaryColor = CurrentTheme.Success
        secondaryColor = Color3.fromRGB(
            math.min(CurrentTheme.Success.R * 255 + 50, 255),
            math.min(CurrentTheme.Success.G * 255 + 50, 255),
            math.min(CurrentTheme.Success.B * 255 + 50, 255)
        )
    elseif notifType == "error" then
        primaryColor = CurrentTheme.Error
        secondaryColor = Color3.fromRGB(255, 100, 100)
    elseif notifType == "warning" then
        primaryColor = CurrentTheme.Warning
        secondaryColor = Color3.fromRGB(255, 200, 100)
    else
        primaryColor = CurrentTheme.Primary
        secondaryColor = CurrentTheme.Secondary
    end
    
    -- شريط علوي بتدرج مزدوج
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 4)
    TopBar.BackgroundColor3 = primaryColor
    TopBar.BorderSizePixel = 0
    TopBar.Parent = NotifFrame
    
    local BarGradient = Instance.new("UIGradient")
    BarGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, primaryColor),
        ColorSequenceKeypoint.new(0.5, secondaryColor),
        ColorSequenceKeypoint.new(1, primaryColor)
    })
    BarGradient.Rotation = 0
    BarGradient.Parent = TopBar
    
    -- أنيميشن التدرج
    spawn(function()
        while BarGradient and BarGradient.Parent do
            TweenService:Create(BarGradient, TweenInfo.new(2, Enum.EasingStyle.Linear), {
                Rotation = 360
            }):Play()
            wait(2)
            BarGradient.Rotation = 0
        end
    end)
    
    -- توهج خلفي مزدوج
    local BackGlow = Instance.new("ImageLabel")
    BackGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    BackGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    BackGlow.Size = UDim2.new(1.3, 0, 1.3, 0)
    BackGlow.BackgroundTransparency = 1
    BackGlow.Image = "rbxassetid://6015897843"
    BackGlow.ImageColor3 = primaryColor
    BackGlow.ImageTransparency = 0.6
    BackGlow.ZIndex = 0
    BackGlow.Parent = NotifFrame
    
    -- نبض التوهج بين لونين
    spawn(function()
        while BackGlow and BackGlow.Parent do
            TweenService:Create(BackGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                ImageColor3 = secondaryColor,
                Size = UDim2.new(1.4, 0, 1.4, 0)
            }):Play()
            wait(1.5)
            TweenService:Create(BackGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                ImageColor3 = primaryColor,
                Size = UDim2.new(1.3, 0, 1.3, 0)
            }):Play()
            wait(1.5)
        end
    end)
    
    -- حاوية الأيقونة مع خلفية ملونة
    local IconContainer = Instance.new("Frame")
    IconContainer.Size = UDim2.new(0, 50, 0, 50)
    IconContainer.Position = UDim2.new(0, 15, 0.5, -25)
    IconContainer.BackgroundColor3 = primaryColor
    IconContainer.BackgroundTransparency = 0.3
    IconContainer.BorderSizePixel = 0
    IconContainer.Parent = NotifFrame
    
    CreateCorner(14).Parent = IconContainer
    CreateDualGradient(IconContainer, 135)
    
    local IconImage = Instance.new("ImageLabel")
    IconImage.Size = UDim2.new(0, 30, 0, 30)
    IconImage.Position = UDim2.new(0.5, -15, 0.5, -15)
    IconImage.BackgroundTransparency = 1
    IconImage.Image = icon or Icons.Star
    IconImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
    IconImage.Parent = IconContainer
    
    -- دوران ونبض الأيقونة
    spawn(function()
        while IconImage and IconImage.Parent do
            TweenService:Create(IconImage, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = 15,
                Size = UDim2.new(0, 34, 0, 34)
            }):Play()
            wait(2)
            TweenService:Create(IconImage, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = -15,
                Size = UDim2.new(0, 30, 0, 30)
            }):Play()
            wait(2)
        end
    end)
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -80, 0, 28)
    TitleLabel.Position = UDim2.new(0, 75, 0, 12)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = CurrentTheme.TextPrimary
    TitleLabel.TextSize = 17
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = NotifFrame
    
    local MessageLabel = Instance.new("TextLabel")
    MessageLabel.Size = UDim2.new(1, -80, 0, 45)
    MessageLabel.Position = UDim2.new(0, 75, 0, 38)
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Text = message
    MessageLabel.TextColor3 = CurrentTheme.TextSecondary
    MessageLabel.TextSize = 14
    MessageLabel.Font = Enum.Font.Gotham
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
    MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
    MessageLabel.TextWrapped = true
    MessageLabel.Parent = NotifFrame
    
    -- شريط تقدم
    local ProgressBar = Instance.new("Frame")
    ProgressBar.Size = UDim2.new(1, 0, 0, 3)
    ProgressBar.Position = UDim2.new(0, 0, 1, -3)
    ProgressBar.BackgroundColor3 = primaryColor
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Parent = NotifFrame
    
    local ProgressGradient = Instance.new("UIGradient")
    ProgressGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, primaryColor),
        ColorSequenceKeypoint.new(1, secondaryColor)
    })
    ProgressGradient.Parent = ProgressBar
    
    -- أنيميشن الدخول
    local slideIn = TweenService:Create(NotifFrame, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -170, 0, 20)
    })
    slideIn:Play()
    
    -- تقليص شريط التقدم
    TweenService:Create(ProgressBar, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 0, 3)
    }):Play()
    
    wait(duration)
    
    local slideOut = TweenService:Create(NotifFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -170, 0, -110)
    })
    slideOut:Play()
    slideOut.Completed:Connect(function()
        NotifGui:Destroy()
    end)
end

-- ═══════════════════════════════════════════════════════════════
--                    📱 زر iOS فخم محسّن
-- ═══════════════════════════════════════════════════════════════
local function CreatePremiumButton(parent, text, icon, color, position, size, callback)
    local Button = Instance.new("TextButton")
    Button.Size = size or UDim2.new(0, 280, 0, 56)
    Button.Position = position or UDim2.new(0.5, -140, 0, 0)
    Button.BackgroundColor3 = color or CurrentTheme.Primary
    Button.BackgroundTransparency = CurrentTheme.Transparency
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = parent
    
    CreateCorner(16).Parent = Button
    CreateAdvancedGlass(Button)
    CreateDualStroke(Button, 2)
    CreateRainbowGlow(Button, 0.35)
    CreateDualGradient(Button, 45)
    
    if icon then
        local IconImage = Instance.new("ImageLabel")
        IconImage.Size = UDim2.new(0, 28, 0, 28)
        IconImage.Position = UDim2.new(0, 15, 0.5, -14)
        IconImage.BackgroundTransparency = 1
        IconImage.Image = icon
        IconImage.ImageColor3 = CurrentTheme.TextPrimary
        IconImage.Parent = Button
        
        -- دوران الأيقونة عند التمرير
        Button.MouseEnter:Connect(function()
            TweenService:Create(IconImage, TweenInfo.new(0.3), {Rotation = 15}):Play()
        end)
        Button.MouseLeave:Connect(function()
            TweenService:Create(IconImage, TweenInfo.new(0.3), {Rotation = 0}):Play()
        end)
    end
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, icon and -55 or -30, 1, 0)
    TextLabel.Position = UDim2.new(0, icon and 50 or 15, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = text
    TextLabel.TextColor3 = CurrentTheme.TextPrimary
    TextLabel.TextSize = 17
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Button
    
    -- تأثيرات متقدمة
    Button.MouseButton1Down:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {
            Size = (size or UDim2.new(0, 280, 0, 56)) - UDim2.new(0, 6, 0, 4),
            BackgroundTransparency = CurrentTheme.Transparency - 0.05
        }):Play()
    end)
    
    Button.MouseButton1Up:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.25, Enum.EasingStyle.Elastic), {
            Size = size or UDim2.new(0, 280, 0, 56),
            BackgroundTransparency = CurrentTheme.Transparency
        }):Play()
    end)
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundTransparency = CurrentTheme.Transparency - 0.05
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundTransparency = CurrentTheme.Transparency
        }):Play()
    end)
    
    if callback then
        Button.MouseButton1Click:Connect(callback)
    end
    
    return Button
end

-- ═══════════════════════════════════════════════════════════════
--                    🖼️ بطاقة صورة فخمة محسّنة
-- ═══════════════════════════════════════════════════════════════
local function CreatePremiumCard(parent, imageId, mapName, scriptCount, position, callback)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(0, 165, 0, 205)
    Card.Position = position
    Card.BackgroundColor3 = CurrentTheme.Card
    Card.BackgroundTransparency = CurrentTheme.Transparency
    Card.BorderSizePixel = 0
    Card.Parent = parent
    
    CreateCorner(22).Parent = Card
    CreateAdvancedGlass(Card)
    CreateDualStroke(Card, 1.8)
    
    local ImageContainer = Instance.new("Frame")
    ImageContainer.Size = UDim2.new(1, -12, 0, 115)
    ImageContainer.Position = UDim2.new(0, 6, 0, 6)
    ImageContainer.BackgroundColor3 = CurrentTheme.Background
    ImageContainer.BackgroundTransparency = 0.2
    ImageContainer.BorderSizePixel = 0
    ImageContainer.ClipsDescendants = true
    ImageContainer.Parent = Card
    
    CreateCorner(18).Parent = ImageContainer
    
    local MapImage = Instance.new("ImageLabel")
    MapImage.Size = UDim2.new(1, 0, 1, 0)
    MapImage.BackgroundTransparency = 1
    MapImage.Image = imageId or Icons.Image
    MapImage.ScaleType = Enum.ScaleType.Crop
    MapImage.Parent = ImageContainer
    
    -- تأثير التوهج على الصورة
    local ImageGlow = Instance.new("ImageLabel")
    ImageGlow.Size = UDim2.new(1, 0, 1, 0)
    ImageGlow.BackgroundTransparency = 1
    ImageGlow.Image = "rbxassetid://8992230677"
    ImageGlow.ImageColor3 = CurrentTheme.Primary
    ImageGlow.ImageTransparency = 0.7
    ImageGlow.ScaleType = Enum.ScaleType.Slice
    ImageGlow.SliceCenter = Rect.new(99, 99, 99, 99)
    ImageGlow.Parent = ImageContainer
    
    local MapNameLabel = Instance.new("TextLabel")
    MapNameLabel.Size = UDim2.new(1, -12, 0, 32)
    MapNameLabel.Position = UDim2.new(0, 6, 0, 125)
    MapNameLabel.BackgroundTransparency = 1
    MapNameLabel.Text = mapName
    MapNameLabel.TextColor3 = CurrentTheme.TextPrimary
    MapNameLabel.TextSize = 16
    MapNameLabel.Font = Enum.Font.GothamBold
    MapNameLabel.TextXAlignment = Enum.TextXAlignment.Center
    MapNameLabel.TextWrapped = true
    MapNameLabel.Parent = Card
    
    local CountBadge = Instance.new("Frame")
    CountBadge.Size = UDim2.new(0, 80, 0, 24)
    CountBadge.Position = UDim2.new(0.5, -40, 0, 158)
    CountBadge.BackgroundColor3 = CurrentTheme.Primary
    CountBadge.BackgroundTransparency = 0.2
    CountBadge.BorderSizePixel = 0
    CountBadge.Parent = Card
    
    CreateCorner(12).Parent = CountBadge
    CreateDualGradient(CountBadge, 90)
    
    local CountLabel = Instance.new("TextLabel")
    CountLabel.Size = UDim2.new(1, 0, 1, 0)
    CountLabel.BackgroundTransparency = 1
    CountLabel.Text = "📜 " .. scriptCount
    CountLabel.TextColor3 = CurrentTheme.TextPrimary
    CountLabel.TextSize = 13
    CountLabel.Font = Enum.Font.GothamBold
    CountLabel.Parent = CountBadge
    
    local OpenButton = Instance.new("TextButton")
    OpenButton.Size = UDim2.new(1, -16, 0, 30)
    OpenButton.Position = UDim2.new(0, 8, 1, -36)
    OpenButton.BackgroundColor3 = CurrentTheme.Accent
    OpenButton.BackgroundTransparency = 0.15
    OpenButton.BorderSizePixel = 0
    OpenButton.Text = "فتح ←"
    OpenButton.TextColor3 = CurrentTheme.TextPrimary
    OpenButton.TextSize = 14
    OpenButton.Font = Enum.Font.GothamBold
    OpenButton.AutoButtonColor = false
    OpenButton.Parent = Card
    
    CreateCorner(12).Parent = OpenButton
    CreateDualGradient(OpenButton, 45)
    
    -- أنيميشن البطاقة
    local isHovering = false
    
    OpenButton.MouseEnter:Connect(function()
        isHovering = true
        TweenService:Create(Card, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 175, 0, 215)
        }):Play()
        TweenService:Create(MapImage, TweenInfo.new(0.35), {
            Size = UDim2.new(1.15, 0, 1.15, 0),
            Position = UDim2.new(-0.075, 0, -0.075, 0)
        }):Play()
        TweenService:Create(OpenButton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0
        }):Play()
    end)
    
    OpenButton.MouseLeave:Connect(function()
        isHovering = false
        wait(0.1)
        if not isHovering then
            TweenService:Create(Card, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 165, 0, 205)
            }):Play()
            TweenService:Create(MapImage, TweenInfo.new(0.35), {
                Size = UDim2.new(1, 0, 1, 0),
                Position = UDim2.new(0, 0, 0, 0)
            }):Play()
            TweenService:Create(OpenButton, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.15
            }):Play()
        end
    end)
    
    OpenButton.MouseButton1Down:Connect(function()
        TweenService:Create(OpenButton, TweenInfo.new(0.1), {
            Size = UDim2.new(1, -20, 0, 27)
        }):Play()
    end)
    
    OpenButton.MouseButton1Up:Connect(function()
        TweenService:Create(OpenButton, TweenInfo.new(0.25, Enum.EasingStyle.Elastic), {
            Size = UDim2.new(1, -16, 0, 30)
        }):Play()
    end)
    
    if callback then
        OpenButton.MouseButton1Click:Connect(callback)
    end
    
    return Card
end

-- ═══════════════════════════════════════════════════════════════
--                    📱 إنشاء الواجهة الرئيسية الكاملة
-- ═══════════════════════════════════════════════════════════════
function UltimateUI:CreateWindow(scriptName)
    local Hub = {}
    Hub.CurrentPage = "main"
    Hub.Maps = {}
    Hub.IsMinimized = false
    Hub.IsMaximized = false
    
    -- أحجام مختلفة
    local SizeStates = {
        Normal = {Width = 400, Height = 600},
        Minimized = {Width = 350, Height = 450},
        Maximized = {Width = 500, Height = 700}
    }
    
    local CurrentSize = "Normal"
    
    -- ═══════════════════════════════════════════════════════════
    --                    إنشاء ScreenGui
    -- ═══════════════════════════════════════════════════════════
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UltimatePremiumHub"
    ScreenGui.DisplayOrder = 100
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = CoreGui
    
    -- ═══════════════════════════════════════════════════════════
    --                    زر الفتح/الإغلاق العائم
    -- ═══════════════════════════════════════════════════════════
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "ToggleButton"
    ToggleButton.Size = UDim2.new(0, 65, 0, 65)
    ToggleButton.Position = UDim2.new(1, -80, 0, 15)
    ToggleButton.BackgroundColor3 = CurrentTheme.Primary
    ToggleButton.BackgroundTransparency = CurrentTheme.Transparency
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Text = ""
    ToggleButton.AutoButtonColor = false
    ToggleButton.ZIndex = 1000
    ToggleButton.Parent = ScreenGui
    
    CreateCorner(32).Parent = ToggleButton
    CreateAdvancedGlass(ToggleButton)
    CreateDualStroke(ToggleButton, 3)
    CreateRainbowGlow(ToggleButton, 0.6)
    CreateDualGradient(ToggleButton, 135)
    
    local ToggleIcon = Instance.new("ImageLabel")
    ToggleIcon.Size = UDim2.new(0, 38, 0, 38)
    ToggleIcon.Position = UDim2.new(0.5, -19, 0.5, -19)
    ToggleIcon.BackgroundTransparency = 1
    ToggleIcon.Image = Icons.Menu
    ToggleIcon.ImageColor3 = CurrentTheme.TextPrimary
    ToggleIcon.Parent = ToggleButton
    
    -- نبض مستمر
    spawn(function()
        while ToggleButton and ToggleButton.Parent do
            TweenService:Create(ToggleButton, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 70, 0, 70)
            }):Play()
            wait(2.5)
            TweenService:Create(ToggleButton, TweenInfo.new(2.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 65, 0, 65)
            }):Play()
            wait(2.5)
        end
    end)
    
    -- سحب الزر
    local dragging = false
    local dragInput, mousePos, framePos
    
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
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = CurrentTheme.Background
    MainFrame.BackgroundTransparency = CurrentTheme.Transparency
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = false
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    CreateCorner(28).Parent = MainFrame
    CreateAdvancedGlass(MainFrame)
    CreateDualStroke(MainFrame, 2.5)
    
    -- ═══════════════════════════════════════════════════════════
    --                    شريط العنوان مع الأزرار
    -- ═══════════════════════════════════════════════════════════
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 68)
    TitleBar.BackgroundColor3 = CurrentTheme.Surface
    TitleBar.BackgroundTransparency = CurrentTheme.Transparency
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    CreateCorner(28).Parent = TitleBar
    CreateDualGradient(TitleBar, 90)
    
    local TitleFix = Instance.new("Frame")
    TitleFix.Size = UDim2.new(1, 0, 0, 28)
    TitleFix.Position = UDim2.new(0, 0, 1, -28)
    TitleFix.BackgroundColor3 = CurrentTheme.Surface
    TitleFix.BackgroundTransparency = CurrentTheme.Transparency
    TitleFix.BorderSizePixel = 0
    TitleFix.Parent = TitleBar
    
    local TitleIcon = Instance.new("ImageLabel")
    TitleIcon.Size = UDim2.new(0, 38, 0, 38)
    TitleIcon.Position = UDim2.new(0, 16, 0.5, -19)
    TitleIcon.BackgroundTransparency = 1
    TitleIcon.Image = Icons.Star
    TitleIcon.ImageColor3 = CurrentTheme.Primary
    TitleIcon.Parent = TitleBar
    
    spawn(function()
        while TitleIcon and TitleIcon.Parent do
            TweenService:Create(TitleIcon, TweenInfo.new(3.5, Enum.EasingStyle.Linear), {
                Rotation = 360
            }):Play()
            wait(3.5)
            TitleIcon.Rotation = 0
        end
    end)
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -200, 1, 0)
    TitleLabel.Position = UDim2.new(0, 60, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = scriptName
    TitleLabel.TextColor3 = CurrentTheme.TextPrimary
    TitleLabel.TextSize = 21
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
    -- ═══════════════════════════════════════════════════════════
    --          أزرار التحكم: تغيير الثيم، تكبير/تصغير، إغلاق
    -- ═══════════════════════════════════════════════════════════
    
    -- زر تغيير الثيم
    local ThemeButton = Instance.new("TextButton")
    ThemeButton.Size = UDim2.new(0, 48, 0, 48)
    ThemeButton.Position = UDim2.new(1, -160, 0.5, -24)
    ThemeButton.BackgroundColor3 = CurrentTheme.Primary
    ThemeButton.BackgroundTransparency = 0.2
    ThemeButton.BorderSizePixel = 0
    ThemeButton.Text = ""
    ThemeButton.AutoButtonColor = false
    ThemeButton.Parent = TitleBar
    
    CreateCorner(14).Parent = ThemeButton
    CreateAdvancedGlass(ThemeButton)
    CreateDualGradient(ThemeButton, 45)
    
    local ThemeIcon = Instance.new("ImageLabel")
    ThemeIcon.Size = UDim2.new(0, 28, 0, 28)
    ThemeIcon.Position = UDim2.new(0.5, -14, 0.5, -14)
    ThemeIcon.BackgroundTransparency = 1
    ThemeIcon.Image = Icons.Palette
    ThemeIcon.ImageColor3 = CurrentTheme.TextPrimary
    ThemeIcon.Parent = ThemeButton
    
    -- زر تكبير/تصغير/تعريض
    local ResizeButton = Instance.new("TextButton")
    ResizeButton.Size = UDim2.new(0, 48, 0, 48)
    ResizeButton.Position = UDim2.new(1, -105, 0.5, -24)
    ResizeButton.BackgroundColor3 = CurrentTheme.Accent
    ResizeButton.BackgroundTransparency = 0.2
    ResizeButton.BorderSizePixel = 0
    ResizeButton.Text = ""
    ResizeButton.AutoButtonColor = false
    ResizeButton.Parent = TitleBar
    
    CreateCorner(14).Parent = ResizeButton
    CreateAdvancedGlass(ResizeButton)
    CreateDualGradient(ResizeButton, 135)
    
    local ResizeIcon = Instance.new("ImageLabel")
    ResizeIcon.Size = UDim2.new(0, 28, 0, 28)
    ResizeIcon.Position = UDim2.new(0.5, -14, 0.5, -14)
    ResizeIcon.BackgroundTransparency = 1
    ResizeIcon.Image = Icons.Resize
    ResizeIcon.ImageColor3 = CurrentTheme.TextPrimary
    ResizeIcon.Parent = ResizeButton
    
    -- زر الإغلاق
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 48, 0, 48)
    CloseButton.Position = UDim2.new(1, -50, 0.5, -24)
    CloseButton.BackgroundColor3 = CurrentTheme.Error
    CloseButton.BackgroundTransparency = 0.2
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = ""
    CloseButton.AutoButtonColor = false
    CloseButton.Parent = TitleBar
    
    CreateCorner(14).Parent = CloseButton
    CreateAdvancedGlass(CloseButton)
    
    local CloseIcon = Instance.new("ImageLabel")
    CloseIcon.Size = UDim2.new(0, 26, 0, 26)
    CloseIcon.Position = UDim2.new(0.5, -13, 0.5, -13)
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Image = Icons.Close
    CloseIcon.ImageColor3 = CurrentTheme.TextPrimary
    CloseIcon.Parent = CloseButton
    
    -- ═══════════════════════════════════════════════════════════
    --                    الصفحة الرئيسية
    -- ═══════════════════════════════════════════════════════════
    local MainPage = Instance.new("Frame")
    MainPage.Name = "MainPage"
    MainPage.Size = UDim2.new(1, 0, 1, -68)
    MainPage.Position = UDim2.new(0, 0, 0, 68)
    MainPage.BackgroundTransparency = 1
    MainPage.Parent = MainFrame
    
    local SearchContainer = Instance.new("Frame")
    SearchContainer.Size = UDim2.new(1, -30, 0, 52)
    SearchContainer.Position = UDim2.new(0, 15, 0, 15)
    SearchContainer.BackgroundColor3 = CurrentTheme.Surface
    SearchContainer.BackgroundTransparency = CurrentTheme.Transparency
    SearchContainer.BorderSizePixel = 0
    SearchContainer.Parent = MainPage
    
    CreateCorner(16).Parent = SearchContainer
    CreateAdvancedGlass(SearchContainer)
    CreateDualStroke(SearchContainer, 1.5)
    
    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Size = UDim2.new(0, 26, 0, 26)
    SearchIcon.Position = UDim2.new(0, 13, 0.5, -13)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Image = Icons.Search
    SearchIcon.ImageColor3 = CurrentTheme.TextSecondary
    SearchIcon.Parent = SearchContainer
    
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(1, -52, 1, 0)
    SearchBox.Position = UDim2.new(0, 46, 0, 0)
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
    MapsScroll.Size = UDim2.new(1, -30, 1, -82)
    MapsScroll.Position = UDim2.new(0, 15, 0, 77)
    MapsScroll.BackgroundTransparency = 1
    MapsScroll.BorderSizePixel = 0
    MapsScroll.ScrollBarThickness = 5
    MapsScroll.ScrollBarImageColor3 = CurrentTheme.Primary
    MapsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    MapsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    MapsScroll.Parent = MainPage
    
    local MapsGrid = Instance.new("UIGridLayout")
    MapsGrid.CellSize = UDim2.new(0, 165, 0, 205)
    MapsGrid.CellPadding = UDim2.new(0, 12, 0, 12)
    MapsGrid.HorizontalAlignment = Enum.HorizontalAlignment.Center
    MapsGrid.SortOrder = Enum.SortOrder.Name
    MapsGrid.Parent = MapsScroll
    
    -- ═══════════════════════════════════════════════════════════
    --                    صفحة المجلد
    -- ═══════════════════════════════════════════════════════════
    local FolderPage = Instance.new("Frame")
    FolderPage.Name = "FolderPage"
    FolderPage.Size = UDim2.new(1, 0, 1, -68)
    FolderPage.Position = UDim2.new(0, 0, 0, 68)
    FolderPage.BackgroundTransparency = 1
    FolderPage.Visible = false
    FolderPage.Parent = MainFrame
    
    local BackButton = Instance.new("TextButton")
    BackButton.Size = UDim2.new(0, 105, 0, 48)
    BackButton.Position = UDim2.new(0, 15, 0, 15)
    BackButton.BackgroundColor3 = CurrentTheme.Primary
    BackButton.BackgroundTransparency = CurrentTheme.Transparency
    BackButton.BorderSizePixel = 0
    BackButton.Text = ""
    BackButton.AutoButtonColor = false
    BackButton.Parent = FolderPage
    
    CreateCorner(14).Parent = BackButton
    CreateAdvancedGlass(BackButton)
    CreateDualGradient(BackButton, 45)
    
    local BackIcon = Instance.new("ImageLabel")
    BackIcon.Size = UDim2.new(0, 24, 0, 24)
    BackIcon.Position = UDim2.new(0, 12, 0.5, -12)
    BackIcon.BackgroundTransparency = 1
    BackIcon.Image = Icons.Back
    BackIcon.ImageColor3 = CurrentTheme.TextPrimary
    BackIcon.Parent = BackButton
    
    local BackText = Instance.new("TextLabel")
    BackText.Size = UDim2.new(1, -45, 1, 0)
    BackText.Position = UDim2.new(0, 42, 0, 0)
    BackText.BackgroundTransparency = 1
    BackText.Text = "رجوع"
    BackText.TextColor3 = CurrentTheme.TextPrimary
    BackText.TextSize = 16
    BackText.Font = Enum.Font.GothamBold
    BackText.TextXAlignment = Enum.TextXAlignment.Left
    BackText.Parent = BackButton
    
    local FolderTitle = Instance.new("TextLabel")
    FolderTitle.Size = UDim2.new(1, -135, 0, 48)
    FolderTitle.Position = UDim2.new(0, 130, 0, 15)
    FolderTitle.BackgroundTransparency = 1
    FolderTitle.Text = "السكربتات"
    FolderTitle.TextColor3 = CurrentTheme.TextPrimary
    FolderTitle.TextSize = 19
    FolderTitle.Font = Enum.Font.GothamBold
    FolderTitle.TextXAlignment = Enum.TextXAlignment.Left
    FolderTitle.Parent = FolderPage
    
    local ScriptsScroll = Instance.new("ScrollingFrame")
    ScriptsScroll.Size = UDim2.new(1, -30, 1, -78)
    ScriptsScroll.Position = UDim2.new(0, 15, 0, 73)
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
    --                    وظائف التبديل
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
                local yPos = (index - 1) * 66
                
                local ScriptButton = CreatePremiumButton(
                    ScriptsScroll,
                    script.name,
                    Icons.Play,
                    CurrentTheme.Success,
                    UDim2.new(0.5, -145, 0, yPos),
                    UDim2.new(0, 290, 0, 56),
                    function()
                        if script.loadstring then
                            local success, err = pcall(function()
                                loadstring(script.loadstring)()
                            end)
                            
                            if success then
                                UltimateUI:ShowNotification(
                                    "✅ تم التفعيل",
                                    "تم تفعيل: " .. script.name,
                                    Icons.Check,
                                    "success",
                                    3
                                )
                            else
                                UltimateUI:ShowNotification(
                                    "❌ خطأ",
                                    "فشل تفعيل السكربت",
                                    Icons.Error,
                                    "error",
                                    4
                                )
                            end
                        end
                    end
                )
                
                local UsersBadge = Instance.new("Frame")
                UsersBadge.Size = UDim2.new(0, 70, 0, 24)
                UsersBadge.Position = UDim2.new(1, -78, 0, 8)
                UsersBadge.BackgroundColor3 = CurrentTheme.Background
                UsersBadge.BackgroundTransparency = 0.2
                UsersBadge.BorderSizePixel = 0
                UsersBadge.Parent = ScriptButton
                
                CreateCorner(12).Parent = UsersBadge
                CreateDualGradient(UsersBadge, 90)
                
                local UsersIcon = Instance.new("ImageLabel")
                UsersIcon.Size = UDim2.new(0, 16, 0, 16)
                UsersIcon.Position = UDim2.new(0, 6, 0.5, -8)
                UsersIcon.BackgroundTransparency = 1
                UsersIcon.Image = Icons.Users
                UsersIcon.ImageColor3 = CurrentTheme.Primary
                UsersIcon.Parent = UsersBadge
                
                local UsersText = Instance.new("TextLabel")
                UsersText.Size = UDim2.new(1, -26, 1, 0)
                UsersText.Position = UDim2.new(0, 24, 0, 0)
                UsersText.BackgroundTransparency = 1
                UsersText.Text = tostring(script.users or 0)
                UsersText.TextColor3 = CurrentTheme.TextPrimary
                UsersText.TextSize = 12
                UsersText.Font = Enum.Font.GothamBold
                UsersText.TextXAlignment = Enum.TextXAlignment.Left
                UsersText.Parent = UsersBadge
            end
        end
        
        MainPage.Visible = true
        FolderPage.Visible = true
        FolderPage.Position = UDim2.new(1, 0, 0, 68)
        
        TweenService:Create(MainPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(-1, 0, 0, 68)
        }):Play()
        
        local slideIn = TweenService:Create(FolderPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 68)
        })
        slideIn:Play()
        slideIn.Completed:Wait()
        MainPage.Visible = false
    end
    
    local function SwitchToMain()
        Hub.CurrentPage = "main"
        
        MainPage.Visible = true
        MainPage.Position = UDim2.new(-1, 0, 0, 68)
        
        TweenService:Create(FolderPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, 0, 0, 68)
        }):Play()
        
        local slideIn = TweenService:Create(MainPage, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 68)
        })
        slideIn:Play()
        slideIn.Completed:Wait()
        FolderPage.Visible = false
    end
    
    BackButton.MouseButton1Click:Connect(SwitchToMain)
    
    -- ═══════════════════════════════════════════════════════════
    --                    وظيفة إضافة خريطة
    -- ═══════════════════════════════════════════════════════════
    function Hub:AddMap(mapData)
        table.insert(Hub.Maps, mapData)
        
        local card = CreatePremiumCard(
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
        
        -- تحديث جميع الألوان بأنيميشن
        local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        
        TweenService:Create(MainFrame, tweenInfo, {BackgroundColor3 = theme.Background, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(TitleBar, tweenInfo, {BackgroundColor3 = theme.Surface, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(TitleFix, tweenInfo, {BackgroundColor3 = theme.Surface, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(ToggleButton, tweenInfo, {BackgroundColor3 = theme.Primary, BackgroundTransparency = theme.Transparency}):Play()
        TweenService:Create(ThemeButton, tweenInfo, {BackgroundColor3 = theme.Primary}):Play()
        TweenService:Create(ResizeButton, tweenInfo, {BackgroundColor3 = theme.Accent}):Play()
        TweenService:Create(CloseButton, tweenInfo, {BackgroundColor3 = theme.Error}):Play()
        TweenService:Create(SearchContainer, tweenInfo, {BackgroundColor3 = theme.Surface, BackgroundTransparency = theme.Transparency}):Play()
        
        TweenService:Create(TitleLabel, tweenInfo, {TextColor3 = theme.TextPrimary}):Play()
        TweenService:Create(SearchBox, tweenInfo, {TextColor3 = theme.TextPrimary, PlaceholderColor3 = theme.TextSecondary}):Play()
        TweenService:Create(TitleIcon, tweenInfo, {ImageColor3 = theme.Primary}):Play()
        TweenService:Create(SearchIcon, tweenInfo, {ImageColor3 = theme.TextSecondary}):Play()
        
        UltimateUI:ShowNotification(
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
        
        -- أنيميشن الأيقونة
        TweenService:Create(ThemeIcon, TweenInfo.new(0.3), {Rotation = 360}):Play()
        wait(0.3)
        ThemeIcon.Rotation = 0
    end)
    
    -- ═══════════════════════════════════════════════════════════
    --                    وظيفة التكبير/التصغير/التعريض
    -- ═══════════════════════════════════════════════════════════
    local function ResizeWindow()
        local screenSize = workspace.CurrentCamera.ViewportSize
        local newSize
        
        if CurrentSize == "Normal" then
            CurrentSize = "Minimized"
            newSize = UDim2.new(0, math.min(screenSize.X - 60, SizeStates.Minimized.Width), 0, math.min(screenSize.Y - 100, SizeStates.Minimized.Height))
            ResizeIcon.Image = Icons.Minimize
        elseif CurrentSize == "Minimized" then
            CurrentSize = "Maximized"
            newSize = UDim2.new(0, math.min(screenSize.X - 20, SizeStates.Maximized.Width), 0, math.min(screenSize.Y - 40, SizeStates.Maximized.Height))
            ResizeIcon.Image = Icons.Maximize
        else
            CurrentSize = "Normal"
            newSize = UDim2.new(0, math.min(screenSize.X - 40, SizeStates.Normal.Width), 0, math.min(screenSize.Y - 80, SizeStates.Normal.Height))
            ResizeIcon.Image = Icons.Resize
        end
        
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = newSize
        }):Play()
        
        UltimateUI:ShowNotification(
            "📐 تغيير الحجم",
            "الحجم: " .. (CurrentSize == "Normal" and "عادي" or CurrentSize == "Minimized" and "صغير" or "كبير"),
            Icons.Resize,
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
            
            TweenService:Create(ToggleIcon, TweenInfo.new(0.4), {Rotation = 180}):Play()
            
            UltimateUI:ShowNotification(
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
            
            TweenService:Create(ToggleIcon, TweenInfo.new(0.4), {Rotation = 0}):Play()
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(ToggleUI)
    CloseButton.MouseButton1Click:Connect(ToggleUI)
    
    -- فتح تلقائي
    wait(0.6)
    ToggleUI()
    
    return Hub
end

return UltimateUI
