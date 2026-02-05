--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║     🌟 Premium Mobile UI Library - Redesigned 2026 🌟        ║
    ║          واجهة فخمة شفافة متجاوبة مع الجوال                  ║
    ║              iOS Style - Beautiful & Smooth                   ║
    ╚═══════════════════════════════════════════════════════════════╝
]]

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local MobileUI = {}
MobileUI.__index = MobileUI

-- ═══════════════════════════════════════════════════════════════
--                    🎨 نظام الألوان الفخم الشفاف
-- ═══════════════════════════════════════════════════════════════
local Colors = {
    -- ألوان رئيسية شفافة فخمة
    GlassPrimary = Color3.fromRGB(120, 140, 255),      -- بنفسجي زجاجي
    GlassSecondary = Color3.fromRGB(90, 200, 250),     -- أزرق سماوي
    GlassPink = Color3.fromRGB(255, 105, 180),         -- وردي فخم
    GlassGreen = Color3.fromRGB(100, 255, 150),        -- أخضر نيون
    
    -- خلفيات شفافة
    Background = Color3.fromRGB(15, 15, 25),           -- خلفية داكنة شفافة
    Surface = Color3.fromRGB(25, 28, 45),              -- سطح شفاف
    Card = Color3.fromRGB(35, 38, 55),                 -- بطاقة شفافة
    
    -- ألوان الحالة
    Success = Color3.fromRGB(80, 250, 123),            -- أخضر نيون
    Warning = Color3.fromRGB(255, 184, 108),           -- برتقالي ذهبي
    Error = Color3.fromRGB(255, 85, 85),               -- أحمر فخم
    Info = Color3.fromRGB(139, 233, 253),              -- أزرق فاتح
    
    -- نصوص
    TextPrimary = Color3.fromRGB(255, 255, 255),       -- أبيض نقي
    TextSecondary = Color3.fromRGB(170, 180, 200),     -- رمادي فاتح
    TextMuted = Color3.fromRGB(120, 130, 150),         -- رمادي خفيف
    
    -- تدرجات فخمة
    GradientStart = Color3.fromRGB(138, 35, 135),      -- بنفسجي غامق
    GradientEnd = Color3.fromRGB(233, 64, 87),         -- وردي أحمر
}

-- ═══════════════════════════════════════════════════════════════
--                    🎯 أيقونات iOS الفخمة
-- ═══════════════════════════════════════════════════════════════
local Icons = {
    Home = "rbxassetid://7072717697",
    Search = "rbxassetid://7072725342",
    Play = "rbxassetid://7072717643",
    Folder = "rbxassetid://7072707198",
    Check = "rbxassetid://7072706796",
    Close = "rbxassetid://7072725539",
    Back = "rbxassetid://7072719070",
    Menu = "rbxassetid://7072718409",
    Star = "rbxassetid://7072718799",
    Users = "rbxassetid://7072718006",
    Settings = "rbxassetid://7072718900",
    Image = "rbxassetid://7072717327",
    ChevronRight = "rbxassetid://7072706935",
    Download = "rbxassetid://7072706839",
    Heart = "rbxassetid://7072706886",
    Eye = "rbxassetid://7072707198",
}

-- ═══════════════════════════════════════════════════════════════
--                    ✨ وظائف مساعدة للتأثيرات
-- ═══════════════════════════════════════════════════════════════

-- إنشاء تأثير زجاجي شفاف
local function CreateGlassEffect(parent, transparency)
    transparency = transparency or 0.3
    
    local Blur = Instance.new("ImageLabel")
    Blur.Name = "GlassBlur"
    Blur.Size = UDim2.new(1, 0, 1, 0)
    Blur.BackgroundTransparency = 1
    Blur.Image = "rbxassetid://8992230677"
    Blur.ImageColor3 = Color3.fromRGB(200, 220, 255)
    Blur.ImageTransparency = transparency
    Blur.ScaleType = Enum.ScaleType.Slice
    Blur.SliceCenter = Rect.new(99, 99, 99, 99)
    Blur.Parent = parent
    
    return Blur
end

-- إنشاء تدرج لوني فخم
local function CreateGradient(parent, rotation)
    rotation = rotation or 45
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Colors.GradientStart),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(180, 50, 150)),
        ColorSequenceKeypoint.new(1, Colors.GradientEnd)
    })
    Gradient.Rotation = rotation
    Gradient.Parent = parent
    
    -- أنيميشن التدرج
    spawn(function()
        while Gradient and Gradient.Parent do
            local tween = TweenService:Create(Gradient, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = rotation + 360
            })
            tween:Play()
            tween.Completed:Wait()
            Gradient.Rotation = rotation
        end
    end)
    
    return Gradient
end

-- إنشاء ظل متوهج
local function CreateGlow(parent, color, intensity)
    color = color or Colors.GlassPrimary
    intensity = intensity or 0.5
    
    local Glow = Instance.new("ImageLabel")
    Glow.Name = "Glow"
    Glow.AnchorPoint = Vector2.new(0.5, 0.5)
    Glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Glow.Size = UDim2.new(1.3, 0, 1.3, 0)
    Glow.BackgroundTransparency = 1
    Glow.Image = "rbxassetid://6015897843"
    Glow.ImageColor3 = color
    Glow.ImageTransparency = 1 - intensity
    Glow.ZIndex = 0
    Glow.Parent = parent
    
    return Glow
end

-- إنشاء زوايا مستديرة
local function CreateCorner(radius)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, radius)
    return Corner
end

-- إنشاء حد متوهج
local function CreateStroke(color, thickness, transparency)
    local Stroke = Instance.new("UIStroke")
    Stroke.Color = color or Colors.GlassPrimary
    Stroke.Thickness = thickness or 2
    Stroke.Transparency = transparency or 0.5
    Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return Stroke
end

-- ═══════════════════════════════════════════════════════════════
--                    🔔 نظام الإشعارات الفخم
-- ═══════════════════════════════════════════════════════════════
function MobileUI:ShowNotification(title, message, icon, notifType, duration)
    duration = duration or 4
    
    local NotifGui = Instance.new("ScreenGui")
    NotifGui.Name = "MobileNotification"
    NotifGui.DisplayOrder = 999
    NotifGui.ResetOnSpawn = false
    NotifGui.Parent = CoreGui
    
    local NotifFrame = Instance.new("Frame")
    NotifFrame.Size = UDim2.new(0, 320, 0, 90)
    NotifFrame.Position = UDim2.new(0.5, -160, 0, -100)
    NotifFrame.BackgroundColor3 = Colors.Surface
    NotifFrame.BackgroundTransparency = 0.1
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Parent = NotifGui
    
    CreateCorner(16).Parent = NotifFrame
    CreateGlassEffect(NotifFrame, 0.2)
    
    local NotifGlow = CreateGlow(NotifFrame, notifType == "success" and Colors.Success or 
                                            notifType == "error" and Colors.Error or 
                                            notifType == "warning" and Colors.Warning or 
                                            Colors.GlassPrimary, 0.4)
    
    local AccentBar = Instance.new("Frame")
    AccentBar.Size = UDim2.new(1, 0, 0, 3)
    AccentBar.Position = UDim2.new(0, 0, 0, 0)
    AccentBar.BorderSizePixel = 0
    AccentBar.Parent = NotifFrame
    
    if notifType == "success" then
        AccentBar.BackgroundColor3 = Colors.Success
    elseif notifType == "error" then
        AccentBar.BackgroundColor3 = Colors.Error
    elseif notifType == "warning" then
        AccentBar.BackgroundColor3 = Colors.Warning
    else
        AccentBar.BackgroundColor3 = Colors.GlassPrimary
    end
    
    CreateGradient(AccentBar, 90)
    
    local IconFrame = Instance.new("ImageLabel")
    IconFrame.Size = UDim2.new(0, 40, 0, 40)
    IconFrame.Position = UDim2.new(0, 15, 0.5, -20)
    IconFrame.BackgroundTransparency = 1
    IconFrame.Image = icon or Icons.Star
    IconFrame.ImageColor3 = AccentBar.BackgroundColor3
    IconFrame.Parent = NotifFrame
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -70, 0, 25)
    TitleLabel.Position = UDim2.new(0, 65, 0, 15)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Colors.TextPrimary
    TitleLabel.TextSize = 16
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = NotifFrame
    
    local MessageLabel = Instance.new("TextLabel")
    MessageLabel.Size = UDim2.new(1, -70, 0, 40)
    MessageLabel.Position = UDim2.new(0, 65, 0, 38)
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
    local slideIn = TweenService:Create(NotifFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, -160, 0, 20)
    })
    slideIn:Play()
    
    -- نبض الأيقونة
    spawn(function()
        while IconFrame and IconFrame.Parent do
            TweenService:Create(IconFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = 10
            }):Play()
            wait(1)
            TweenService:Create(IconFrame, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Rotation = -10
            }):Play()
            wait(1)
        end
    end)
    
    wait(duration)
    
    local slideOut = TweenService:Create(NotifFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -160, 0, -100)
    })
    slideOut:Play()
    slideOut.Completed:Connect(function()
        NotifGui:Destroy()
    end)
end

-- ═══════════════════════════════════════════════════════════════
--                    📱 إنشاء زر بنمط iOS
-- ═══════════════════════════════════════════════════════════════
local function CreateIOSButton(parent, text, icon, color, position, size, callback)
    local Button = Instance.new("TextButton")
    Button.Size = size or UDim2.new(0, 280, 0, 55)
    Button.Position = position or UDim2.new(0.5, -140, 0, 0)
    Button.BackgroundColor3 = color or Colors.GlassPrimary
    Button.BackgroundTransparency = 0.2
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = parent
    
    CreateCorner(16).Parent = Button
    CreateGlassEffect(Button, 0.3)
    CreateStroke(color or Colors.GlassPrimary, 2, 0.6).Parent = Button
    CreateGlow(Button, color or Colors.GlassPrimary, 0.3)
    
    if icon then
        local IconImage = Instance.new("ImageLabel")
        IconImage.Size = UDim2.new(0, 28, 0, 28)
        IconImage.Position = UDim2.new(0, 15, 0.5, -14)
        IconImage.BackgroundTransparency = 1
        IconImage.Image = icon
        IconImage.ImageColor3 = Colors.TextPrimary
        IconImage.Parent = Button
    end
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, icon and -55 or -30, 1, 0)
    TextLabel.Position = UDim2.new(0, icon and 50 or 15, 0, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Text = text
    TextLabel.TextColor3 = Colors.TextPrimary
    TextLabel.TextSize = 16
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Parent = Button
    
    -- تأثيرات الضغط
    Button.MouseButton1Down:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.1), {
            Size = (size or UDim2.new(0, 280, 0, 55)) - UDim2.new(0, 5, 0, 3)
        }):Play()
        TweenService:Create(Button, TweenInfo.new(0.1), {
            BackgroundTransparency = 0.1
        }):Play()
    end)
    
    Button.MouseButton1Up:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Elastic), {
            Size = size or UDim2.new(0, 280, 0, 55)
        }):Play()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.2
        }):Play()
    end)
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.1
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.2
        }):Play()
    end)
    
    if callback then
        Button.MouseButton1Click:Connect(callback)
    end
    
    return Button
end

-- ═══════════════════════════════════════════════════════════════
--                    🖼️ إنشاء بطاقة صورة فخمة
-- ═══════════════════════════════════════════════════════════════
local function CreateImageCard(parent, imageId, mapName, scriptCount, position, callback)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(0, 160, 0, 200)
    Card.Position = position
    Card.BackgroundColor3 = Colors.Card
    Card.BackgroundTransparency = 0.15
    Card.BorderSizePixel = 0
    Card.Parent = parent
    
    CreateCorner(20).Parent = Card
    CreateGlassEffect(Card, 0.25)
    CreateStroke(Colors.GlassPrimary, 1.5, 0.7).Parent = Card
    
    local ImageContainer = Instance.new("Frame")
    ImageContainer.Size = UDim2.new(1, -10, 0, 110)
    ImageContainer.Position = UDim2.new(0, 5, 0, 5)
    ImageContainer.BackgroundColor3 = Colors.Background
    ImageContainer.BackgroundTransparency = 0.3
    ImageContainer.BorderSizePixel = 0
    ImageContainer.ClipsDescendants = true
    ImageContainer.Parent = Card
    
    CreateCorner(16).Parent = ImageContainer
    
    local MapImage = Instance.new("ImageLabel")
    MapImage.Size = UDim2.new(1, 0, 1, 0)
    MapImage.BackgroundTransparency = 1
    MapImage.Image = imageId or Icons.Image
    MapImage.ScaleType = Enum.ScaleType.Crop
    MapImage.Parent = ImageContainer
    
    -- تأثير تكبير على الصورة
    local imageHoverScale = 1
    
    local MapNameLabel = Instance.new("TextLabel")
    MapNameLabel.Size = UDim2.new(1, -10, 0, 30)
    MapNameLabel.Position = UDim2.new(0, 5, 0, 120)
    MapNameLabel.BackgroundTransparency = 1
    MapNameLabel.Text = mapName
    MapNameLabel.TextColor3 = Colors.TextPrimary
    MapNameLabel.TextSize = 15
    MapNameLabel.Font = Enum.Font.GothamBold
    MapNameLabel.TextXAlignment = Enum.TextXAlignment.Center
    MapNameLabel.TextWrapped = true
    MapNameLabel.Parent = Card
    
    local ScriptCountLabel = Instance.new("TextLabel")
    ScriptCountLabel.Size = UDim2.new(1, 0, 0, 20)
    ScriptCountLabel.Position = UDim2.new(0, 0, 0, 150)
    ScriptCountLabel.BackgroundTransparency = 1
    ScriptCountLabel.Text = "📜 " .. scriptCount .. " سكربت"
    ScriptCountLabel.TextColor3 = Colors.TextSecondary
    ScriptCountLabel.TextSize = 12
    ScriptCountLabel.Font = Enum.Font.Gotham
    ScriptCountLabel.TextXAlignment = Enum.TextXAlignment.Center
    ScriptCountLabel.Parent = Card
    
    local OpenButton = Instance.new("TextButton")
    OpenButton.Size = UDim2.new(1, -20, 0, 28)
    OpenButton.Position = UDim2.new(0, 10, 1, -35)
    OpenButton.BackgroundColor3 = Colors.GlassPrimary
    OpenButton.BackgroundTransparency = 0.2
    OpenButton.BorderSizePixel = 0
    OpenButton.Text = "فتح ←"
    OpenButton.TextColor3 = Colors.TextPrimary
    OpenButton.TextSize = 13
    OpenButton.Font = Enum.Font.GothamBold
    OpenButton.AutoButtonColor = false
    OpenButton.Parent = Card
    
    CreateCorner(10).Parent = OpenButton
    CreateGradient(OpenButton, 45)
    
    -- أنيميشن البطاقة عند التمرير
    local isHovering = false
    
    OpenButton.MouseEnter:Connect(function()
        isHovering = true
        TweenService:Create(Card, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 170, 0, 210)
        }):Play()
        TweenService:Create(MapImage, TweenInfo.new(0.3), {
            Size = UDim2.new(1.1, 0, 1.1, 0),
            Position = UDim2.new(-0.05, 0, -0.05, 0)
        }):Play()
        TweenService:Create(OpenButton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0
        }):Play()
    end)
    
    OpenButton.MouseLeave:Connect(function()
        isHovering = false
        wait(0.1)
        if not isHovering then
            TweenService:Create(Card, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 160, 0, 200)
            }):Play()
            TweenService:Create(MapImage, TweenInfo.new(0.3), {
                Size = UDim2.new(1, 0, 1, 0),
                Position = UDim2.new(0, 0, 0, 0)
            }):Play()
            TweenService:Create(OpenButton, TweenInfo.new(0.2), {
                BackgroundTransparency = 0.2
            }):Play()
        end
    end)
    
    OpenButton.MouseButton1Down:Connect(function()
        TweenService:Create(OpenButton, TweenInfo.new(0.1), {
            Size = UDim2.new(1, -25, 0, 25)
        }):Play()
    end)
    
    OpenButton.MouseButton1Up:Connect(function()
        TweenService:Create(OpenButton, TweenInfo.new(0.2, Enum.EasingStyle.Elastic), {
            Size = UDim2.new(1, -20, 0, 28)
        }):Play()
    end)
    
    if callback then
        OpenButton.MouseButton1Click:Connect(callback)
    end
    
    return Card
end

-- ═══════════════════════════════════════════════════════════════
--                    📱 إنشاء الواجهة الرئيسية
-- ═══════════════════════════════════════════════════════════════
function MobileUI:CreateWindow(scriptName)
    local Hub = {}
    Hub.CurrentPage = "main"
    Hub.Maps = {}
    
    -- ═══════════════════════════════════════════════════════════
    --                    إنشاء ScreenGui
    -- ═══════════════════════════════════════════════════════════
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "MobilePremiumHub"
    ScreenGui.DisplayOrder = 100
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.Parent = CoreGui
    
    -- ═══════════════════════════════════════════════════════════
    --                    زر الفتح/الإغلاق العائم
    -- ═══════════════════════════════════════════════════════════
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "ToggleButton"
    ToggleButton.Size = UDim2.new(0, 60, 0, 60)
    ToggleButton.Position = UDim2.new(1, -75, 0, 15)
    ToggleButton.BackgroundColor3 = Colors.GlassPrimary
    ToggleButton.BackgroundTransparency = 0.15
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Text = ""
    ToggleButton.AutoButtonColor = false
    ToggleButton.ZIndex = 1000
    ToggleButton.Parent = ScreenGui
    
    CreateCorner(30).Parent = ToggleButton
    CreateGlassEffect(ToggleButton, 0.2)
    CreateStroke(Colors.GlassPrimary, 3, 0.5).Parent = ToggleButton
    CreateGlow(ToggleButton, Colors.GlassPrimary, 0.6)
    CreateGradient(ToggleButton, 135)
    
    local ToggleIcon = Instance.new("ImageLabel")
    ToggleIcon.Size = UDim2.new(0, 35, 0, 35)
    ToggleIcon.Position = UDim2.new(0.5, -17.5, 0.5, -17.5)
    ToggleIcon.BackgroundTransparency = 1
    ToggleIcon.Image = Icons.Menu
    ToggleIcon.ImageColor3 = Colors.TextPrimary
    ToggleIcon.Parent = ToggleButton
    
    -- نبض الزر
    spawn(function()
        while ToggleButton and ToggleButton.Parent do
            TweenService:Create(ToggleButton, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 65, 0, 65)
            }):Play()
            wait(2)
            TweenService:Create(ToggleButton, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Size = UDim2.new(0, 60, 0, 60)
            }):Play()
            wait(2)
        end
    end)
    
    -- جعل الزر قابل للسحب
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
    MainFrame.BackgroundColor3 = Colors.Background
    MainFrame.BackgroundTransparency = 0.05
    MainFrame.BorderSizePixel = 0
    MainFrame.Visible = false
    MainFrame.ClipsDescendants = true
    MainFrame.Parent = ScreenGui
    
    CreateCorner(25).Parent = MainFrame
    CreateGlassEffect(MainFrame, 0.15)
    CreateStroke(Colors.GlassPrimary, 2, 0.6).Parent = MainFrame
    
    -- ═══════════════════════════════════════════════════════════
    --                    شريط العنوان
    -- ═══════════════════════════════════════════════════════════
    local TitleBar = Instance.new("Frame")
    TitleBar.Size = UDim2.new(1, 0, 0, 65)
    TitleBar.BackgroundColor3 = Colors.Surface
    TitleBar.BackgroundTransparency = 0.2
    TitleBar.BorderSizePixel = 0
    TitleBar.Parent = MainFrame
    
    CreateCorner(25).Parent = TitleBar
    CreateGradient(TitleBar, 90)
    
    local TitleFix = Instance.new("Frame")
    TitleFix.Size = UDim2.new(1, 0, 0, 25)
    TitleFix.Position = UDim2.new(0, 0, 1, -25)
    TitleFix.BackgroundColor3 = Colors.Surface
    TitleFix.BackgroundTransparency = 0.2
    TitleFix.BorderSizePixel = 0
    TitleFix.Parent = TitleBar
    
    local TitleIcon = Instance.new("ImageLabel")
    TitleIcon.Size = UDim2.new(0, 35, 0, 35)
    TitleIcon.Position = UDim2.new(0, 15, 0.5, -17.5)
    TitleIcon.BackgroundTransparency = 1
    TitleIcon.Image = Icons.Star
    TitleIcon.ImageColor3 = Colors.GlassPrimary
    TitleIcon.Parent = TitleBar
    
    -- دوران الأيقونة
    spawn(function()
        while TitleIcon and TitleIcon.Parent do
            TweenService:Create(TitleIcon, TweenInfo.new(3, Enum.EasingStyle.Linear), {
                Rotation = 360
            }):Play()
            wait(3)
            TitleIcon.Rotation = 0
        end
    end)
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -110, 1, 0)
    TitleLabel.Position = UDim2.new(0, 55, 0, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = scriptName
    TitleLabel.TextColor3 = Colors.TextPrimary
    TitleLabel.TextSize = 20
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TitleBar
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 45, 0, 45)
    CloseButton.Position = UDim2.new(1, -55, 0.5, -22.5)
    CloseButton.BackgroundColor3 = Colors.Error
    CloseButton.BackgroundTransparency = 0.2
    CloseButton.BorderSizePixel = 0
    CloseButton.Text = ""
    CloseButton.AutoButtonColor = false
    CloseButton.Parent = TitleBar
    
    CreateCorner(12).Parent = CloseButton
    CreateGlassEffect(CloseButton, 0.3)
    
    local CloseIcon = Instance.new("ImageLabel")
    CloseIcon.Size = UDim2.new(0, 25, 0, 25)
    CloseIcon.Position = UDim2.new(0.5, -12.5, 0.5, -12.5)
    CloseIcon.BackgroundTransparency = 1
    CloseIcon.Image = Icons.Close
    CloseIcon.ImageColor3 = Colors.TextPrimary
    CloseIcon.Parent = CloseButton
    
    -- ═══════════════════════════════════════════════════════════
    --                    الصفحة الرئيسية (الخرائط)
    -- ═══════════════════════════════════════════════════════════
    local MainPage = Instance.new("Frame")
    MainPage.Name = "MainPage"
    MainPage.Size = UDim2.new(1, 0, 1, -65)
    MainPage.Position = UDim2.new(0, 0, 0, 65)
    MainPage.BackgroundTransparency = 1
    MainPage.Parent = MainFrame
    
    local SearchContainer = Instance.new("Frame")
    SearchContainer.Size = UDim2.new(1, -30, 0, 50)
    SearchContainer.Position = UDim2.new(0, 15, 0, 15)
    SearchContainer.BackgroundColor3 = Colors.Surface
    SearchContainer.BackgroundTransparency = 0.2
    SearchContainer.BorderSizePixel = 0
    SearchContainer.Parent = MainPage
    
    CreateCorner(15).Parent = SearchContainer
    CreateGlassEffect(SearchContainer, 0.3)
    CreateStroke(Colors.GlassPrimary, 1.5, 0.7).Parent = SearchContainer
    
    local SearchIcon = Instance.new("ImageLabel")
    SearchIcon.Size = UDim2.new(0, 24, 0, 24)
    SearchIcon.Position = UDim2.new(0, 12, 0.5, -12)
    SearchIcon.BackgroundTransparency = 1
    SearchIcon.Image = Icons.Search
    SearchIcon.ImageColor3 = Colors.TextSecondary
    SearchIcon.Parent = SearchContainer
    
    local SearchBox = Instance.new("TextBox")
    SearchBox.Size = UDim2.new(1, -50, 1, 0)
    SearchBox.Position = UDim2.new(0, 45, 0, 0)
    SearchBox.BackgroundTransparency = 1
    SearchBox.PlaceholderText = "ابحث عن الخرائط..."
    SearchBox.PlaceholderColor3 = Colors.TextMuted
    SearchBox.Text = ""
    SearchBox.TextColor3 = Colors.TextPrimary
    SearchBox.TextSize = 15
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextXAlignment = Enum.TextXAlignment.Left
    SearchBox.ClearTextOnFocus = false
    SearchBox.Parent = SearchContainer
    
    local MapsScroll = Instance.new("ScrollingFrame")
    MapsScroll.Size = UDim2.new(1, -30, 1, -80)
    MapsScroll.Position = UDim2.new(0, 15, 0, 75)
    MapsScroll.BackgroundTransparency = 1
    MapsScroll.BorderSizePixel = 0
    MapsScroll.ScrollBarThickness = 4
    MapsScroll.ScrollBarImageColor3 = Colors.GlassPrimary
    MapsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    MapsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    MapsScroll.Parent = MainPage
    
    local MapsGrid = Instance.new("UIGridLayout")
    MapsGrid.CellSize = UDim2.new(0, 160, 0, 200)
    MapsGrid.CellPadding = UDim2.new(0, 12, 0, 12)
    MapsGrid.HorizontalAlignment = Enum.HorizontalAlignment.Center
    MapsGrid.SortOrder = Enum.SortOrder.Name
    MapsGrid.Parent = MapsScroll
    
    -- ═══════════════════════════════════════════════════════════
    --                    صفحة المجلد (السكربتات)
    -- ═══════════════════════════════════════════════════════════
    local FolderPage = Instance.new("Frame")
    FolderPage.Name = "FolderPage"
    FolderPage.Size = UDim2.new(1, 0, 1, -65)
    FolderPage.Position = UDim2.new(0, 0, 0, 65)
    FolderPage.BackgroundTransparency = 1
    FolderPage.Visible = false
    FolderPage.Parent = MainFrame
    
    local BackButton = Instance.new("TextButton")
    BackButton.Size = UDim2.new(0, 100, 0, 45)
    BackButton.Position = UDim2.new(0, 15, 0, 15)
    BackButton.BackgroundColor3 = Colors.GlassPrimary
    BackButton.BackgroundTransparency = 0.2
    BackButton.BorderSizePixel = 0
    BackButton.Text = ""
    BackButton.AutoButtonColor = false
    BackButton.Parent = FolderPage
    
    CreateCorner(12).Parent = BackButton
    CreateGlassEffect(BackButton, 0.3)
    
    local BackIcon = Instance.new("ImageLabel")
    BackIcon.Size = UDim2.new(0, 22, 0, 22)
    BackIcon.Position = UDim2.new(0, 12, 0.5, -11)
    BackIcon.BackgroundTransparency = 1
    BackIcon.Image = Icons.Back
    BackIcon.ImageColor3 = Colors.TextPrimary
    BackIcon.Parent = BackButton
    
    local BackText = Instance.new("TextLabel")
    BackText.Size = UDim2.new(1, -45, 1, 0)
    BackText.Position = UDim2.new(0, 40, 0, 0)
    BackText.BackgroundTransparency = 1
    BackText.Text = "رجوع"
    BackText.TextColor3 = Colors.TextPrimary
    BackText.TextSize = 15
    BackText.Font = Enum.Font.GothamBold
    BackText.TextXAlignment = Enum.TextXAlignment.Left
    BackText.Parent = BackButton
    
    local FolderTitle = Instance.new("TextLabel")
    FolderTitle.Size = UDim2.new(1, -130, 0, 45)
    FolderTitle.Position = UDim2.new(0, 125, 0, 15)
    FolderTitle.BackgroundTransparency = 1
    FolderTitle.Text = "السكربتات"
    FolderTitle.TextColor3 = Colors.TextPrimary
    FolderTitle.TextSize = 18
    FolderTitle.Font = Enum.Font.GothamBold
    FolderTitle.TextXAlignment = Enum.TextXAlignment.Left
    FolderTitle.Parent = FolderPage
    
    local ScriptsScroll = Instance.new("ScrollingFrame")
    ScriptsScroll.Size = UDim2.new(1, -30, 1, -75)
    ScriptsScroll.Position = UDim2.new(0, 15, 0, 70)
    ScriptsScroll.BackgroundTransparency = 1
    ScriptsScroll.BorderSizePixel = 0
    ScriptsScroll.ScrollBarThickness = 4
    ScriptsScroll.ScrollBarImageColor3 = Colors.GlassPrimary
    ScriptsScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScriptsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    ScriptsScroll.Parent = FolderPage
    
    local ScriptsList = Instance.new("UIListLayout")
    ScriptsList.Padding = UDim.new(0, 10)
    ScriptsList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ScriptsList.SortOrder = Enum.SortOrder.Name
    ScriptsList.Parent = ScriptsScroll
    
    -- ═══════════════════════════════════════════════════════════
    --                    وظائف التبديل بين الصفحات
    -- ═══════════════════════════════════════════════════════════
    local function SwitchToFolder(mapData)
        Hub.CurrentPage = "folder"
        
        -- تنظيف السكربتات القديمة
        for _, child in pairs(ScriptsScroll:GetChildren()) do
            if child:IsA("Frame") or child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        FolderTitle.Text = "📂 " .. mapData.name
        
        -- إضافة السكربتات
        if mapData.scripts then
            for index, script in pairs(mapData.scripts) do
                local yPos = (index - 1) * 65
                
                local ScriptButton = CreateIOSButton(
                    ScriptsScroll,
                    script.name,
                    Icons.Play,
                    Colors.GlassGreen,
                    UDim2.new(0.5, -140, 0, yPos),
                    UDim2.new(0, 280, 0, 55),
                    function()
                        if script.loadstring then
                            local success, err = pcall(function()
                                loadstring(script.loadstring)()
                            end)
                            
                            if success then
                                MobileUI:ShowNotification(
                                    "✅ تم التفعيل",
                                    "تم تفعيل: " .. script.name,
                                    Icons.Check,
                                    "success",
                                    3
                                )
                            else
                                MobileUI:ShowNotification(
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
                
                -- عداد المستخدمين
                local UsersBadge = Instance.new("Frame")
                UsersBadge.Size = UDim2.new(0, 65, 0, 22)
                UsersBadge.Position = UDim2.new(1, -75, 0, 8)
                UsersBadge.BackgroundColor3 = Colors.Background
                UsersBadge.BackgroundTransparency = 0.3
                UsersBadge.BorderSizePixel = 0
                UsersBadge.Parent = ScriptButton
                
                CreateCorner(11).Parent = UsersBadge
                
                local UsersIcon = Instance.new("ImageLabel")
                UsersIcon.Size = UDim2.new(0, 14, 0, 14)
                UsersIcon.Position = UDim2.new(0, 5, 0.5, -7)
                UsersIcon.BackgroundTransparency = 1
                UsersIcon.Image = Icons.Users
                UsersIcon.ImageColor3 = Colors.GlassPrimary
                UsersIcon.Parent = UsersBadge
                
                local UsersText = Instance.new("TextLabel")
                UsersText.Size = UDim2.new(1, -25, 1, 0)
                UsersText.Position = UDim2.new(0, 22, 0, 0)
                UsersText.BackgroundTransparency = 1
                UsersText.Text = tostring(script.users or 0)
                UsersText.TextColor3 = Colors.TextPrimary
                UsersText.TextSize = 11
                UsersText.Font = Enum.Font.GothamBold
                UsersText.TextXAlignment = Enum.TextXAlignment.Left
                UsersText.Parent = UsersBadge
            end
        end
        
        -- أنيميشن الانتقال
        MainPage.Visible = true
        FolderPage.Visible = true
        FolderPage.Position = UDim2.new(1, 0, 0, 65)
        
        TweenService:Create(MainPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(-1, 0, 0, 65)
        }):Play()
        
        local slideIn = TweenService:Create(FolderPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 65)
        })
        slideIn:Play()
        slideIn.Completed:Wait()
        MainPage.Visible = false
    end
    
    local function SwitchToMain()
        Hub.CurrentPage = "main"
        
        MainPage.Visible = true
        MainPage.Position = UDim2.new(-1, 0, 0, 65)
        
        TweenService:Create(FolderPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(1, 0, 0, 65)
        }):Play()
        
        local slideIn = TweenService:Create(MainPage, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 65)
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
        
        local cardIndex = #MapsScroll:GetChildren() - 1
        local card = CreateImageCard(
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
    --                    وظائف الفتح والإغلاق
    -- ═══════════════════════════════════════════════════════════
    local isOpen = false
    
    local function ToggleUI()
        isOpen = not isOpen
        
        if isOpen then
            MainFrame.Visible = true
            
            -- حجم متجاوب
            local screenSize = workspace.CurrentCamera.ViewportSize
            local targetWidth = math.min(screenSize.X - 40, 400)
            local targetHeight = math.min(screenSize.Y - 80, 600)
            
            local openTween = TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, targetWidth, 0, targetHeight)
            })
            openTween:Play()
            
            TweenService:Create(ToggleIcon, TweenInfo.new(0.3), {
                Rotation = 90
            }):Play()
            
            MobileUI:ShowNotification(
                "🎮 مرحباً!",
                "تم فتح " .. scriptName,
                Icons.Star,
                "info",
                2
            )
        else
            local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            })
            closeTween:Play()
            closeTween.Completed:Connect(function()
                MainFrame.Visible = false
            end)
            
            TweenService:Create(ToggleIcon, TweenInfo.new(0.3), {
                Rotation = 0
            }):Play()
        end
    end
    
    ToggleButton.MouseButton1Click:Connect(ToggleUI)
    CloseButton.MouseButton1Click:Connect(ToggleUI)
    
    -- فتح تلقائي عند التحميل
    wait(0.5)
    ToggleUI()
    
    return Hub
end

return MobileUI
