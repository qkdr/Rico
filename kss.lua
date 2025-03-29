---------------------------------------------
-- مكتبة Luna للواجهات الفخمة في Roblox
-- تُتيح إضافة مجلدات (مفتوحة أو مغلقة) تحتوي على سكربتات خارجية وتشغيلها عبر واجهة ثنائية المستوى.
-- حجم الواجهة الرئيسية (MainInterface) ونافذة المعلومات (InfoInterface) هو 500×400.
-- كل مجلد يظهر كزر شفاف عريض (450×60) مع تأثير "زجاج" (Glass effect) متحرك،
-- يحتوي داخل الزر على:
--    • إذا كان المجلد مفتوح: أيقونة مجلد (يمكن تعديلها عبر settings.folderIcon) مع اسم المجلد (FolderNameLabel) ووصفه (FolderDescLabel) وعرض عدد السكربتات ("سكربتات: X").
--    • وإذا كان المجلد مغلق: أيقونة قفل (من الرابط المطلوب) مع نص "مغلق" بتأثير ظل جذاب، وعدم السماح بفتحه.
-- في نافذة الواجهة تظهر صورة اللاعب واسمه في أعلى اليسار، وزر إغلاق (X) في أعلى اليمين.
-- يوجد أيضًا زر بحث لتصفية المجلدات، وزر دائري (CircularButton) قابل للسحب.
-- بالإضافة إلى ذلك، هناك نافذة مطورين (DeveloperInterface) تُفتح عند النقر على زر "المطورين" في لوحة الخيارات، وتتيح للمطور إدخال مجلد جديد (مع الحقول المناسبة) وإضافة سكربتات إليه ليظهر للمستخدمين.
---------------------------------------------

local Luna = {}

---------------------------------------------
-- إعدادات عامة قابلة للتعديل
---------------------------------------------
local settings = {
    openSound = "rbxassetid://6042053626",
    buttonSound = "rbxassetid://6026984224",
    warningSound = "rbxassetid://6042055798",
    backgroundImage = "rbxassetid://13577851314", -- صورة خلفية الواجهة
    buttonColor = Color3.fromRGB(40, 40, 40),
    accentColor = Color3.fromRGB(0, 170, 100),
    textColor = Color3.fromRGB(255, 255, 255),
    cornerRadius = UDim.new(0, 12),
    transparency = 0.2,
    telegramLink = "https://t.me/YourChannelLink",
    folderIcon = "rbxassetid://123456789", -- أيقونة المجلد المفتوح (يمكن تغييرها)
    lockIcon = "rbxassetid://4224275681" -- أيقونة القفل للمجلد المغلق
}

---------------------------------------------
-- بيانات المجلدات الخارجية
-- كل مجلد عبارة عن جدول يحتوي على folderName، folderDescription، scripts، وخاصية locked (اختياري)
---------------------------------------------
local externalFolders = {}

---------------------------------------------
-- خدمات Roblox
---------------------------------------------
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

---------------------------------------------
-- دالة عرض إشعار أنيق على الشاشة
---------------------------------------------
local function showNotification(parentGui, message)
    local notification = Instance.new("Frame")
    notification.Name = "Notification"
    notification.Size = UDim2.new(0, 300, 0, 50)
    notification.Position = UDim2.new(0.5, -150, 0, -60)
    notification.BackgroundColor3 = settings.accentColor
    notification.BackgroundTransparency = 0.3
    notification.BorderSizePixel = 0
    notification.Parent = parentGui
    notification.ZIndex = 10

    local notifCorner = Instance.new("UICorner")
    notifCorner.CornerRadius = UDim.new(0, 8)
    notifCorner.Parent = notification

    local notifText = Instance.new("TextLabel")
    notifText.Name = "NotifText"
    notifText.Size = UDim2.new(1, -20, 1, 0)
    notifText.Position = UDim2.new(0, 10, 0, 0)
    notifText.BackgroundTransparency = 1
    notifText.Font = Enum.Font.GothamBold
    notifText.Text = message
    notifText.TextSize = 18
    notifText.TextColor3 = settings.textColor
    notifText.Parent = notification
    notifText.ZIndex = 10

    TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 300, 0, 50),
        Position = UDim2.new(0.5, -150, 0, 20)
    }):Play()

    wait(2)
    local hideTween = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0, -60)
    })
    hideTween:Play()
    wait(0.3)
    notification:Destroy()
end

---------------------------------------------
-- دالة إنشاء مربع التأكيد
---------------------------------------------
local function showConfirmationDialog(parentGui, message, confirmCallback)
    local warningSound = Instance.new("Sound")
    warningSound.SoundId = settings.warningSound
    warningSound.Volume = 0.5
    warningSound.Parent = parentGui
    warningSound:Play()

    local confirmationFrame = Instance.new("Frame")
    confirmationFrame.Name = "ConfirmationDialog"
    confirmationFrame.Size = UDim2.new(0, 400, 0, 200)
    confirmationFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    confirmationFrame.BackgroundColor3 = settings.buttonColor
    confirmationFrame.BackgroundTransparency = 0.1
    confirmationFrame.BorderSizePixel = 0
    confirmationFrame.Parent = parentGui
    confirmationFrame.ZIndex = 10

    confirmationFrame.Size = UDim2.new(0, 0, 0, 0)
    confirmationFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(confirmationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 400, 0, 200),
        Position = UDim2.new(0.5, -200, 0.5, -100)
    }):Play()

    local confirmCorner = Instance.new("UICorner")
    confirmCorner.CornerRadius = settings.cornerRadius
    confirmCorner.Parent = confirmationFrame

    local warningIcon = Instance.new("ImageLabel")
    warningIcon.Name = "WarningIcon"
    warningIcon.Size = UDim2.new(0, 50, 0, 50)
    warningIcon.Position = UDim2.new(0.5, -25, 0, 30)
    warningIcon.BackgroundTransparency = 1
    warningIcon.Image = "rbxassetid://7734056608"
    warningIcon.ImageColor3 = Color3.fromRGB(255, 200, 0)
    warningIcon.Parent = confirmationFrame
    warningIcon.ZIndex = 10

    local confirmationText = Instance.new("TextLabel")
    confirmationText.Name = "ConfirmationText"
    confirmationText.Size = UDim2.new(0, 350, 0, 60)
    confirmationText.Position = UDim2.new(0.5, -175, 0, 90)
    confirmationText.BackgroundTransparency = 1
    confirmationText.Font = Enum.Font.GothamMedium
    confirmationText.Text = message
    confirmationText.TextSize = 16
    confirmationText.TextColor3 = settings.textColor
    confirmationText.TextWrapped = true
    confirmationText.Parent = confirmationFrame
    confirmationText.ZIndex = 10

    local confirmButton = Instance.new("TextButton")
    confirmButton.Name = "ConfirmButton"
    confirmButton.Size = UDim2.new(0, 120, 0, 40)
    confirmButton.Position = UDim2.new(0.5, -130, 0, 140)
    confirmButton.BackgroundColor3 = settings.accentColor
    confirmButton.Font = Enum.Font.GothamBold
    confirmButton.Text = "تأكيد"
    confirmButton.TextSize = 16
    confirmButton.TextColor3 = settings.textColor
    confirmButton.Parent = confirmationFrame
    confirmButton.ZIndex = 10

    local confirmButtonCorner = Instance.new("UICorner")
    confirmButtonCorner.CornerRadius = settings.cornerRadius
    confirmButtonCorner.Parent = confirmButton

    local cancelButton = Instance.new("TextButton")
    cancelButton.Name = "CancelButton"
    cancelButton.Size = UDim2.new(0, 120, 0, 40)
    cancelButton.Position = UDim2.new(0.5, 10, 0, 140)
    cancelButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    cancelButton.Font = Enum.Font.GothamBold
    cancelButton.Text = "إلغاء"
    cancelButton.TextSize = 16
    cancelButton.TextColor3 = settings.textColor
    cancelButton.Parent = confirmationFrame
    cancelButton.ZIndex = 10

    local cancelButtonCorner = Instance.new("UICorner")
    cancelButtonCorner.CornerRadius = settings.cornerRadius
    cancelButtonCorner.Parent = cancelButton

    confirmButton.MouseEnter:Connect(function()
        TweenService:Create(confirmButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 120)}):Play()
    end)
    confirmButton.MouseLeave:Connect(function()
        TweenService:Create(confirmButton, TweenInfo.new(0.3), {BackgroundColor3 = settings.accentColor}):Play()
    end)
    cancelButton.MouseEnter:Connect(function()
        TweenService:Create(cancelButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(230, 70, 70)}):Play()
    end)
    cancelButton.MouseLeave:Connect(function()
        TweenService:Create(cancelButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(200, 60, 60)}):Play()
    end)

    confirmButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = parentGui
        btnSound:Play()
        TweenService:Create(confirmationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        wait(0.3)
        confirmationFrame:Destroy()
        if confirmCallback then
            confirmCallback()
        end
    end)
    cancelButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = parentGui
        btnSound:Play()
        TweenService:Create(confirmationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        wait(0.3)
        confirmationFrame:Destroy()
    end)
end

---------------------------------------------
-- دالة تطبيق تأثير "زجاج" (Glass effect) على زر المجلد
---------------------------------------------
local function applyGlassEffect(folderButton)
    local glassEffect = Instance.new("Frame")
    glassEffect.Name = "GlassEffect"
    glassEffect.Size = UDim2.new(0, 50, 1, 0)
    glassEffect.Position = UDim2.new(-1, 0, 0, 0)
    glassEffect.BackgroundTransparency = 0.5
    glassEffect.BackgroundColor3 = Color3.new(1, 1, 1)
    glassEffect.Parent = folderButton
    glassEffect.ZIndex = folderButton.ZIndex + 1

    local glassGradient = Instance.new("UIGradient")
    glassGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1,1,1)),
        ColorSequenceKeypoint.new(0.5, Color3.new(1,1,1)),
        ColorSequenceKeypoint.new(1, Color3.new(1,1,1))
    })
    glassGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.8),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(1, 0.8)
    })
    glassGradient.Parent = glassEffect

    local function tweenGlass()
        local tween1 = TweenService:Create(glassEffect, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, 0, 0, 0)})
        local tween2 = TweenService:Create(glassEffect, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(-1, 0, 0, 0)})
        tween1:Play()
        tween1.Completed:Wait()
        tween2:Play()
        tween2.Completed:Wait()
        tweenGlass()
    end
    spawn(tweenGlass)
end

---------------------------------------------
-- دالة إنشاء واجهة المطورين (Developer Interface)
---------------------------------------------
local function createDeveloperInterface(parentGui)
    local devFrame = Instance.new("Frame")
    devFrame.Name = "DeveloperInterface"
    devFrame.Size = UDim2.new(0, 500, 0, 400)
    devFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    devFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    devFrame.BackgroundTransparency = settings.transparency
    devFrame.BorderSizePixel = 0
    devFrame.ClipsDescendants = true
    devFrame.Parent = parentGui

    local devCorner = Instance.new("UICorner")
    devCorner.CornerRadius = settings.cornerRadius
    devCorner.Parent = devFrame

    local devTitle = Instance.new("TextLabel")
    devTitle.Name = "DeveloperTitle"
    devTitle.Size = UDim2.new(0, 400, 0, 50)
    devTitle.Position = UDim2.new(0.5, -200, 0, 10)
    devTitle.BackgroundTransparency = 1
    devTitle.Font = Enum.Font.GothamBold
    devTitle.Text = "صفحة المطورين"
    devTitle.TextSize = 28
    devTitle.TextColor3 = settings.textColor
    devTitle.Parent = devFrame

    -- حقول إدخال بيانات المجلد الجديد
    local folderNameBox = Instance.new("TextBox")
    folderNameBox.Name = "FolderNameBox"
    folderNameBox.Size = UDim2.new(0, 300, 0, 30)
    folderNameBox.Position = UDim2.new(0, 100, 0, 70)
    folderNameBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
    folderNameBox.BackgroundTransparency = 0.3
    folderNameBox.Font = Enum.Font.GothamBold
    folderNameBox.PlaceholderText = "اسم المجلد"
    folderNameBox.Text = ""
    folderNameBox.TextSize = 18
    folderNameBox.TextColor3 = settings.textColor
    folderNameBox.Parent = devFrame

    local folderDescBox = Instance.new("TextBox")
    folderDescBox.Name = "FolderDescBox"
    folderDescBox.Size = UDim2.new(0, 300, 0, 30)
    folderDescBox.Position = UDim2.new(0, 100, 0, 110)
    folderDescBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
    folderDescBox.BackgroundTransparency = 0.3
    folderDescBox.Font = Enum.Font.Gotham
    folderDescBox.PlaceholderText = "وصف المجلد"
    folderDescBox.Text = ""
    folderDescBox.TextSize = 16
    folderDescBox.TextColor3 = settings.textColor
    folderDescBox.Parent = devFrame

    -- قائمة مؤقتة لسكربتات المجلد الجديد
    local tempScripts = {}

    local scriptsFrame = Instance.new("ScrollingFrame")
    scriptsFrame.Name = "ScriptsFrame"
    scriptsFrame.Size = UDim2.new(0, 450, 0, 150)
    scriptsFrame.Position = UDim2.new(0, 25, 0, 160)
    scriptsFrame.BackgroundTransparency = 0.5
    scriptsFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    scriptsFrame.ScrollBarThickness = 4
    scriptsFrame.Parent = devFrame

    local scriptsList = Instance.new("UIListLayout")
    scriptsList.Padding = UDim.new(0, 5)
    scriptsList.Parent = scriptsFrame

    -- زر لإضافة سكربت جديد للمجلد
    local addScriptButton = Instance.new("TextButton")
    addScriptButton.Name = "AddScriptButton"
    addScriptButton.Size = UDim2.new(0, 150, 0, 30)
    addScriptButton.Position = UDim2.new(0, 175, 0, 320)
    addScriptButton.BackgroundColor3 = settings.accentColor
    addScriptButton.Font = Enum.Font.GothamBold
    addScriptButton.Text = "إضافة سكربت"
    addScriptButton.TextSize = 18
    addScriptButton.TextColor3 = settings.textColor
    addScriptButton.Parent = devFrame

    addScriptButton.MouseButton1Click:Connect(function()
        -- نافذة صغيرة لإدخال بيانات السكربت
        local scriptFrame = Instance.new("Frame")
        scriptFrame.Name = "NewScriptFrame"
        scriptFrame.Size = UDim2.new(0, 300, 0, 150)
        scriptFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
        scriptFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
        scriptFrame.BackgroundTransparency = 0.2
        scriptFrame.Parent = devFrame
        local sCorner = Instance.new("UICorner", scriptFrame)
        sCorner.CornerRadius = settings.cornerRadius

        local scriptNameBox = Instance.new("TextBox")
        scriptNameBox.Name = "ScriptNameBox"
        scriptNameBox.Size = UDim2.new(0, 280, 0, 30)
        scriptNameBox.Position = UDim2.new(0, 10, 0, 10)
        scriptNameBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
        scriptNameBox.BackgroundTransparency = 0.3
        scriptNameBox.Font = Enum.Font.GothamBold
        scriptNameBox.PlaceholderText = "اسم السكربت"
        scriptNameBox.Text = ""
        scriptNameBox.TextSize = 18
        scriptNameBox.TextColor3 = settings.textColor
        scriptNameBox.Parent = scriptFrame

        local scriptDescBox = Instance.new("TextBox")
        scriptDescBox.Name = "ScriptDescBox"
        scriptDescBox.Size = UDim2.new(0, 280, 0, 30)
        scriptDescBox.Position = UDim2.new(0, 10, 0, 50)
        scriptDescBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
        scriptDescBox.BackgroundTransparency = 0.3
        scriptDescBox.Font = Enum.Font.Gotham
        scriptDescBox.PlaceholderText = "وصف السكربت"
        scriptDescBox.Text = ""
        scriptDescBox.TextSize = 16
        scriptDescBox.TextColor3 = settings.textColor
        scriptDescBox.Parent = scriptFrame

        local scriptURLBox = Instance.new("TextBox")
        scriptURLBox.Name = "ScriptURLBox"
        scriptURLBox.Size = UDim2.new(0, 280, 0, 30)
        scriptURLBox.Position = UDim2.new(0, 10, 0, 90)
        scriptURLBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
        scriptURLBox.BackgroundTransparency = 0.3
        scriptURLBox.Font = Enum.Font.Gotham
        scriptURLBox.PlaceholderText = "رابط السكربت"
        scriptURLBox.Text = ""
        scriptURLBox.TextSize = 16
        scriptURLBox.TextColor3 = settings.textColor
        scriptURLBox.Parent = scriptFrame

        local saveScriptButton = Instance.new("TextButton")
        saveScriptButton.Name = "SaveScriptButton"
        saveScriptButton.Size = UDim2.new(0, 100, 0, 30)
        saveScriptButton.Position = UDim2.new(0.5, -50, 1, -40)
        saveScriptButton.BackgroundColor3 = settings.accentColor
        saveScriptButton.Font = Enum.Font.GothamBold
        saveScriptButton.Text = "حفظ السكربت"
        saveScriptButton.TextSize = 16
        saveScriptButton.TextColor3 = settings.textColor
        saveScriptButton.Parent = scriptFrame

        saveScriptButton.MouseButton1Click:Connect(function()
            local newScript = {
                name = scriptNameBox.Text,
                description = scriptDescBox.Text,
                url = scriptURLBox.Text
            }
            table.insert(tempScripts, newScript)
            local entry = Instance.new("TextLabel")
            entry.Name = newScript.name
            entry.Size = UDim2.new(1, 0, 0, 25)
            entry.BackgroundTransparency = 1
            entry.Font = Enum.Font.Gotham
            entry.Text = newScript.name .. " - " .. newScript.description
            entry.TextSize = 16
            entry.TextColor3 = settings.textColor
            entry.Parent = scriptsFrame
            scriptFrame:Destroy()
        end)
    end)

    -- زر لحفظ المجلد الجديد مع السكربتات المضافة
    local saveFolderButton = Instance.new("TextButton")
    saveFolderButton.Name = "SaveFolderButton"
    saveFolderButton.Size = UDim2.new(0, 150, 0, 30)
    saveFolderButton.Position = UDim2.new(0, 175, 0, 360)
    saveFolderButton.BackgroundColor3 = settings.accentColor
    saveFolderButton.Font = Enum.Font.GothamBold
    saveFolderButton.Text = "حفظ المجلد"
    saveFolderButton.TextSize = 18
    saveFolderButton.TextColor3 = settings.textColor
    saveFolderButton.Parent = devFrame

    saveFolderButton.MouseButton1Click:Connect(function()
        if folderNameBox.Text ~= "" then
            local newFolder = {
                folderName = folderNameBox.Text,
                folderDescription = folderDescBox.Text,
                scripts = tempScripts,
                locked = false
            }
            table.insert(externalFolders, newFolder)
            showNotification(parentGui, "تم إضافة المجلد!")
            -- إعادة تحميل الواجهة الرئيسية حتى تظهر المجلدات الجديدة
            if parentGui:FindFirstChild("MainInterface") then
                parentGui.MainInterface:Destroy()
            end
            createMainInterface(parentGui)
            devFrame:Destroy()
        else
            showNotification(parentGui, "يجب إدخال اسم المجلد!")
        end
    end)

    -- زر إغلاق واجهة المطورين
    local devCloseButton = Instance.new("TextButton")
    devCloseButton.Name = "DevCloseButton"
    devCloseButton.Size = UDim2.new(0, 30, 0, 30)
    devCloseButton.Position = UDim2.new(1, -40, 0, 10)
    devCloseButton.BackgroundTransparency = 0.5
    devCloseButton.BackgroundColor3 = settings.buttonColor
    devCloseButton.Text = "X"
    devCloseButton.Font = Enum.Font.GothamBold
    devCloseButton.TextSize = 24
    devCloseButton.TextColor3 = settings.textColor
    devCloseButton.Parent = devFrame
    devCloseButton.ZIndex = 10

    devCloseButton.MouseButton1Click:Connect(function()
        devFrame:Destroy()
    end)

    return devFrame
end

---------------------------------------------
-- دالة إنشاء لوحة الخيارات (Option Panel)
-- تم إضافة زر "المطورين" ضمنها
---------------------------------------------
local function createOptionPanel(parentGui)
    if parentGui:FindFirstChild("OptionPanel") then
        parentGui.OptionPanel:Destroy()
    end

    local optionPanel = Instance.new("Frame")
    optionPanel.Name = "OptionPanel"
    optionPanel.Size = UDim2.new(0, 200, 0, 130)
    optionPanel.Position = UDim2.new(0.95, -220, 0.5, -65)
    optionPanel.BackgroundColor3 = settings.buttonColor
    optionPanel.BackgroundTransparency = 0.2
    optionPanel.BorderSizePixel = 0
    optionPanel.Parent = parentGui

    local optionCorner = Instance.new("UICorner")
    optionCorner.CornerRadius = settings.cornerRadius
    optionCorner.Parent = optionPanel

    local infoButton = Instance.new("TextButton")
    infoButton.Name = "InfoButton"
    infoButton.Size = UDim2.new(1, -20, 0, 40)
    infoButton.Position = UDim2.new(0, 10, 0, 10)
    infoButton.BackgroundColor3 = settings.accentColor
    infoButton.Font = Enum.Font.GothamBold
    infoButton.Text = "معلومات"
    infoButton.TextSize = 18
    infoButton.TextColor3 = settings.textColor
    infoButton.Parent = optionPanel

    local infoButtonCorner = Instance.new("UICorner")
    infoButtonCorner.CornerRadius = settings.cornerRadius
    infoButtonCorner.Parent = infoButton

    infoButton.MouseEnter:Connect(function()
        TweenService:Create(infoButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 120)}):Play()
    end)
    infoButton.MouseLeave:Connect(function()
        TweenService:Create(infoButton, TweenInfo.new(0.3), {BackgroundColor3 = settings.accentColor}):Play()
    end)

    infoButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = parentGui
        btnSound:Play()
        if parentGui:FindFirstChild("InfoInterface") then
            parentGui.InfoInterface:Destroy()
        else
            local infoUI = createInfoInterface(parentGui)
            infoUI.Name = "InfoInterface"
        end
        optionPanel:Destroy()
    end)

    local mainButton = Instance.new("TextButton")
    mainButton.Name = "MainButton"
    mainButton.Size = UDim2.new(1, -20, 0, 40)
    mainButton.Position = UDim2.new(0, 10, 0, 55)
    mainButton.BackgroundColor3 = settings.accentColor
    mainButton.Font = Enum.Font.GothamBold
    mainButton.Text = "الواجهة"
    mainButton.TextSize = 18
    mainButton.TextColor3 = settings.textColor
    mainButton.Parent = optionPanel

    local mainButtonCorner = Instance.new("UICorner")
    mainButtonCorner.CornerRadius = settings.cornerRadius
    mainButtonCorner.Parent = mainButton

    mainButton.MouseEnter:Connect(function()
        TweenService:Create(mainButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 120)}):Play()
    end)
    mainButton.MouseLeave:Connect(function()
        TweenService:Create(mainButton, TweenInfo.new(0.3), {BackgroundColor3 = settings.accentColor}):Play()
    end)

    mainButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = parentGui
        btnSound:Play()
        if parentGui:FindFirstChild("MainInterface") then
            parentGui.MainInterface:Destroy()
        else
            local mainUI = createMainInterface(parentGui)
            mainUI.Name = "MainInterface"
        end
        optionPanel:Destroy()
    end)

    local devButton = Instance.new("TextButton")
    devButton.Name = "DevButton"
    devButton.Size = UDim2.new(1, -20, 0, 40)
    devButton.Position = UDim2.new(0, 10, 0, 100)
    devButton.BackgroundColor3 = settings.accentColor
    devButton.Font = Enum.Font.GothamBold
    devButton.Text = "المطورين"
    devButton.TextSize = 18
    devButton.TextColor3 = settings.textColor
    devButton.Parent = optionPanel

    local devButtonCorner = Instance.new("UICorner")
    devButtonCorner.CornerRadius = settings.cornerRadius
    devButtonCorner.Parent = devButton

    devButton.MouseEnter:Connect(function()
        TweenService:Create(devButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 120)}):Play()
    end)
    devButton.MouseLeave:Connect(function()
        TweenService:Create(devButton, TweenInfo.new(0.3), {BackgroundColor3 = settings.accentColor}):Play()
    end)

    devButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = parentGui
        btnSound:Play()
        createDeveloperInterface(parentGui)
        optionPanel:Destroy()
    end)

    return optionPanel
end

---------------------------------------------
-- دالة إنشاء القائمة الدائرية (Circular Menu) مع سحب سلس
---------------------------------------------
local function createCircularMenu()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")

    if playerGui:FindFirstChild("CircularMenuGUI") then
        playerGui.CircularMenuGUI:Destroy()
    end

    local circularMenuGUI = Instance.new("ScreenGui")
    circularMenuGUI.Name = "CircularMenuGUI"
    circularMenuGUI.ResetOnSpawn = false
    circularMenuGUI.Parent = playerGui

    local circularButton = Instance.new("ImageButton")
    circularButton.Name = "CircularButton"
    circularButton.Size = UDim2.new(0, 60, 0, 60)
    circularButton.Position = UDim2.new(0.95, -30, 0.5, -30)
    circularButton.BackgroundColor3 = settings.accentColor
    circularButton.Image = "rbxassetid://7059346373" -- أيقونة القائمة
    circularButton.ImageColor3 = Color3.new(1, 1, 1)
    circularButton.BackgroundTransparency = 0.1
    circularButton.Parent = circularMenuGUI

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = settings.cornerRadius
    buttonCorner.Parent = circularButton

    local buttonUIStroke = Instance.new("UIStroke")
    buttonUIStroke.Color = Color3.fromRGB(255, 255, 255)
    buttonUIStroke.Thickness = 2
    buttonUIStroke.Transparency = 0.5
    buttonUIStroke.Parent = circularButton

    -- السحب السلس
    local dragging = false
    local dragInput, dragStart, startPos

    circularButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = circularButton.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    circularButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            circularButton.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    circularButton.MouseEnter:Connect(function()
        TweenService:Create(circularButton, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 70, 0, 70),
            Position = UDim2.new(0.95, -35, 0.5, -35)
        }):Play()
        TweenService:Create(buttonUIStroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
    end)

    circularButton.MouseLeave:Connect(function()
        TweenService:Create(circularButton, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 60, 0, 60),
            Position = UDim2.new(0.95, -30, 0.5, -30)
        }):Play()
        TweenService:Create(buttonUIStroke, TweenInfo.new(0.3), {Transparency = 0.5}):Play()
    end)

    circularButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = circularMenuGUI
        btnSound:Play()
        createOptionPanel(circularMenuGUI)
    end)

    return circularButton, circularMenuGUI
end

---------------------------------------------
-- دالة إظهار الواجهة الرئيسية للمكتبة (Show)
---------------------------------------------
function Luna:Show()
    local _, screenGui = createCircularMenu()
    local mainUI = createMainInterface(screenGui)
    mainUI.Name = "MainInterface"
end

---------------------------------------------
-- دالة إضافة مجلد مفتوح يحتوي على سكربتات (AddFolder)
---------------------------------------------
function Luna:AddFolder(folderData)
    if not folderData.timestamp then
        folderData.timestamp = os.time()
    end
    folderData.locked = false
    table.insert(externalFolders, folderData)
end

---------------------------------------------
-- دالة إضافة مجلد مغلق يحتوي على سكربتات (AddLockedFolder)
---------------------------------------------
function Luna:AddLockedFolder(folderData)
    if not folderData.timestamp then
        folderData.timestamp = os.time()
    end
    folderData.locked = true
    table.insert(externalFolders, folderData)
end

---------------------------------------------
-- دالة إنشاء واجهة المطورين (Developer Interface)
---------------------------------------------
local function createDeveloperInterface(parentGui)
    local devFrame = Instance.new("Frame")
    devFrame.Name = "DeveloperInterface"
    devFrame.Size = UDim2.new(0, 500, 0, 400)
    devFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    devFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    devFrame.BackgroundTransparency = settings.transparency
    devFrame.BorderSizePixel = 0
    devFrame.ClipsDescendants = true
    devFrame.Parent = parentGui

    local devCorner = Instance.new("UICorner")
    devCorner.CornerRadius = settings.cornerRadius
    devCorner.Parent = devFrame

    local devTitle = Instance.new("TextLabel")
    devTitle.Name = "DeveloperTitle"
    devTitle.Size = UDim2.new(0, 400, 0, 50)
    devTitle.Position = UDim2.new(0.5, -200, 0, 10)
    devTitle.BackgroundTransparency = 1
    devTitle.Font = Enum.Font.GothamBold
    devTitle.Text = "صفحة المطورين"
    devTitle.TextSize = 28
    devTitle.TextColor3 = settings.textColor
    devTitle.Parent = devFrame

    -- حقول إدخال بيانات المجلد الجديد
    local folderNameBox = Instance.new("TextBox")
    folderNameBox.Name = "FolderNameBox"
    folderNameBox.Size = UDim2.new(0, 300, 0, 30)
    folderNameBox.Position = UDim2.new(0, 100, 0, 70)
    folderNameBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
    folderNameBox.BackgroundTransparency = 0.3
    folderNameBox.Font = Enum.Font.GothamBold
    folderNameBox.PlaceholderText = "اسم المجلد"
    folderNameBox.Text = ""
    folderNameBox.TextSize = 18
    folderNameBox.TextColor3 = settings.textColor
    folderNameBox.Parent = devFrame

    local folderDescBox = Instance.new("TextBox")
    folderDescBox.Name = "FolderDescBox"
    folderDescBox.Size = UDim2.new(0, 300, 0, 30)
    folderDescBox.Position = UDim2.new(0, 100, 0, 110)
    folderDescBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
    folderDescBox.BackgroundTransparency = 0.3
    folderDescBox.Font = Enum.Font.Gotham
    folderDescBox.PlaceholderText = "وصف المجلد"
    folderDescBox.Text = ""
    folderDescBox.TextSize = 16
    folderDescBox.TextColor3 = settings.textColor
    folderDescBox.Parent = devFrame

    -- قائمة لعرض السكربتات التي سيتم إضافتها للمجلد الجديد
    local scriptsFrame = Instance.new("ScrollingFrame")
    scriptsFrame.Name = "ScriptsFrame"
    scriptsFrame.Size = UDim2.new(0, 450, 0, 150)
    scriptsFrame.Position = UDim2.new(0, 25, 0, 160)
    scriptsFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    scriptsFrame.BackgroundTransparency = 0.5
    scriptsFrame.ScrollBarThickness = 4
    scriptsFrame.Parent = devFrame

    local scriptsList = Instance.new("UIListLayout")
    scriptsList.Padding = UDim.new(0, 5)
    scriptsList.Parent = scriptsFrame

    local tempScripts = {}

    -- زر لإضافة سكربت جديد للمجلد
    local addScriptButton = Instance.new("TextButton")
    addScriptButton.Name = "AddScriptButton"
    addScriptButton.Size = UDim2.new(0, 150, 0, 30)
    addScriptButton.Position = UDim2.new(0, 175, 0, 320)
    addScriptButton.BackgroundColor3 = settings.accentColor
    addScriptButton.Font = Enum.Font.GothamBold
    addScriptButton.Text = "إضافة سكربت"
    addScriptButton.TextSize = 18
    addScriptButton.TextColor3 = settings.textColor
    addScriptButton.Parent = devFrame

    addScriptButton.MouseButton1Click:Connect(function()
        local scriptFrame = Instance.new("Frame")
        scriptFrame.Name = "NewScriptFrame"
        scriptFrame.Size = UDim2.new(0, 300, 0, 150)
        scriptFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
        scriptFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
        scriptFrame.BackgroundTransparency = 0.2
        scriptFrame.Parent = devFrame
        local sCorner = Instance.new("UICorner", scriptFrame)
        sCorner.CornerRadius = settings.cornerRadius

        local scriptNameBox = Instance.new("TextBox")
        scriptNameBox.Name = "ScriptNameBox"
        scriptNameBox.Size = UDim2.new(0, 280, 0, 30)
        scriptNameBox.Position = UDim2.new(0, 10, 0, 10)
        scriptNameBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
        scriptNameBox.BackgroundTransparency = 0.3
        scriptNameBox.Font = Enum.Font.GothamBold
        scriptNameBox.PlaceholderText = "اسم السكربت"
        scriptNameBox.Text = ""
        scriptNameBox.TextSize = 18
        scriptNameBox.TextColor3 = settings.textColor
        scriptNameBox.Parent = scriptFrame

        local scriptDescBox = Instance.new("TextBox")
        scriptDescBox.Name = "ScriptDescBox"
        scriptDescBox.Size = UDim2.new(0, 280, 0, 30)
        scriptDescBox.Position = UDim2.new(0, 10, 0, 50)
        scriptDescBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
        scriptDescBox.BackgroundTransparency = 0.3
        scriptDescBox.Font = Enum.Font.Gotham
        scriptDescBox.PlaceholderText = "وصف السكربت"
        scriptDescBox.Text = ""
        scriptDescBox.TextSize = 16
        scriptDescBox.TextColor3 = settings.textColor
        scriptDescBox.Parent = scriptFrame

        local scriptURLBox = Instance.new("TextBox")
        scriptURLBox.Name = "ScriptURLBox"
        scriptURLBox.Size = UDim2.new(0, 280, 0, 30)
        scriptURLBox.Position = UDim2.new(0, 10, 0, 90)
        scriptURLBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
        scriptURLBox.BackgroundTransparency = 0.3
        scriptURLBox.Font = Enum.Font.Gotham
        scriptURLBox.PlaceholderText = "رابط السكربت"
        scriptURLBox.Text = ""
        scriptURLBox.TextSize = 16
        scriptURLBox.TextColor3 = settings.textColor
        scriptURLBox.Parent = scriptFrame

        local saveScriptButton = Instance.new("TextButton")
        saveScriptButton.Name = "SaveScriptButton"
        saveScriptButton.Size = UDim2.new(0, 100, 0, 30)
        saveScriptButton.Position = UDim2.new(0.5, -50, 1, -40)
        saveScriptButton.BackgroundColor3 = settings.accentColor
        saveScriptButton.Font = Enum.Font.GothamBold
        saveScriptButton.Text = "حفظ السكربت"
        saveScriptButton.TextSize = 16
        saveScriptButton.TextColor3 = settings.textColor
        saveScriptButton.Parent = scriptFrame

        saveScriptButton.MouseButton1Click:Connect(function()
            local newScript = {
                name = scriptNameBox.Text,
                description = scriptDescBox.Text,
                url = scriptURLBox.Text
            }
            table.insert(tempScripts, newScript)
            local entry = Instance.new("TextLabel")
            entry.Name = newScript.name
            entry.Size = UDim2.new(1, 0, 0, 25)
            entry.BackgroundTransparency = 1
            entry.Font = Enum.Font.Gotham
            entry.Text = newScript.name .. " - " .. newScript.description
            entry.TextSize = 16
            entry.TextColor3 = settings.textColor
            entry.Parent = scriptsFrame
            scriptFrame:Destroy()
        end)
    end)

    local saveFolderButton = Instance.new("TextButton")
    saveFolderButton.Name = "SaveFolderButton"
    saveFolderButton.Size = UDim2.new(0, 150, 0, 30)
    saveFolderButton.Position = UDim2.new(0, 175, 0, 360)
    saveFolderButton.BackgroundColor3 = settings.accentColor
    saveFolderButton.Font = Enum.Font.GothamBold
    saveFolderButton.Text = "حفظ المجلد"
    saveFolderButton.TextSize = 18
    saveFolderButton.TextColor3 = settings.textColor
    saveFolderButton.Parent = devFrame

    saveFolderButton.MouseButton1Click:Connect(function()
        if folderNameBox.Text ~= "" then
            local newFolder = {
                folderName = folderNameBox.Text,
                folderDescription = folderDescBox.Text,
                scripts = tempScripts,
                locked = false
            }
            table.insert(externalFolders, newFolder)
            showNotification(parentGui, "تم إضافة المجلد!")
            if parentGui:FindFirstChild("MainInterface") then
                parentGui.MainInterface:Destroy()
            end
            createMainInterface(parentGui)
            devFrame:Destroy()
        else
            showNotification(parentGui, "يجب إدخال اسم المجلد!")
        end
    end)

    local devCloseButton = Instance.new("TextButton")
    devCloseButton.Name = "DevCloseButton"
    devCloseButton.Size = UDim2.new(0, 30, 0, 30)
    devCloseButton.Position = UDim2.new(1, -40, 0, 10)
    devCloseButton.BackgroundTransparency = 0.5
    devCloseButton.BackgroundColor3 = settings.buttonColor
    devCloseButton.Text = "X"
    devCloseButton.Font = Enum.Font.GothamBold
    devCloseButton.TextSize = 24
    devCloseButton.TextColor3 = settings.textColor
    devCloseButton.Parent = devFrame
    devCloseButton.ZIndex = 10

    devCloseButton.MouseButton1Click:Connect(function()
        devFrame:Destroy()
    end)

    return devFrame
end

---------------------------------------------
-- دالة إنشاء لوحة الخيارات (Option Panel)
-- تمت إضافة زر "المطورين" ضمنها
---------------------------------------------
local function createOptionPanel(parentGui)
    if parentGui:FindFirstChild("OptionPanel") then
        parentGui.OptionPanel:Destroy()
    end

    local optionPanel = Instance.new("Frame")
    optionPanel.Name = "OptionPanel"
    optionPanel.Size = UDim2.new(0, 200, 0, 130)
    optionPanel.Position = UDim2.new(0.95, -220, 0.5, -65)
    optionPanel.BackgroundColor3 = settings.buttonColor
    optionPanel.BackgroundTransparency = 0.2
    optionPanel.BorderSizePixel = 0
    optionPanel.Parent = parentGui

    local optionCorner = Instance.new("UICorner")
    optionCorner.CornerRadius = settings.cornerRadius
    optionCorner.Parent = optionPanel

    local infoButton = Instance.new("TextButton")
    infoButton.Name = "InfoButton"
    infoButton.Size = UDim2.new(1, -20, 0, 40)
    infoButton.Position = UDim2.new(0, 10, 0, 10)
    infoButton.BackgroundColor3 = settings.accentColor
    infoButton.Font = Enum.Font.GothamBold
    infoButton.Text = "معلومات"
    infoButton.TextSize = 18
    infoButton.TextColor3 = settings.textColor
    infoButton.Parent = optionPanel

    local infoButtonCorner = Instance.new("UICorner")
    infoButtonCorner.CornerRadius = settings.cornerRadius
    infoButtonCorner.Parent = infoButton

    infoButton.MouseEnter:Connect(function()
        TweenService:Create(infoButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 120)}):Play()
    end)
    infoButton.MouseLeave:Connect(function()
        TweenService:Create(infoButton, TweenInfo.new(0.3), {BackgroundColor3 = settings.accentColor}):Play()
    end)

    infoButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = parentGui
        btnSound:Play()
        if parentGui:FindFirstChild("InfoInterface") then
            parentGui.InfoInterface:Destroy()
        else
            local infoUI = createInfoInterface(parentGui)
            infoUI.Name = "InfoInterface"
        end
        optionPanel:Destroy()
    end)

    local mainButton = Instance.new("TextButton")
    mainButton.Name = "MainButton"
    mainButton.Size = UDim2.new(1, -20, 0, 40)
    mainButton.Position = UDim2.new(0, 10, 0, 55)
    mainButton.BackgroundColor3 = settings.accentColor
    mainButton.Font = Enum.Font.GothamBold
    mainButton.Text = "الواجهة"
    mainButton.TextSize = 18
    mainButton.TextColor3 = settings.textColor
    mainButton.Parent = optionPanel

    local mainButtonCorner = Instance.new("UICorner")
    mainButtonCorner.CornerRadius = settings.cornerRadius
    mainButtonCorner.Parent = mainButton

    mainButton.MouseEnter:Connect(function()
        TweenService:Create(mainButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 120)}):Play()
    end)
    mainButton.MouseLeave:Connect(function()
        TweenService:Create(mainButton, TweenInfo.new(0.3), {BackgroundColor3 = settings.accentColor}):Play()
    end)

    mainButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = parentGui
        btnSound:Play()
        if parentGui:FindFirstChild("MainInterface") then
            parentGui.MainInterface:Destroy()
        else
            local mainUI = createMainInterface(parentGui)
            mainUI.Name = "MainInterface"
        end
        optionPanel:Destroy()
    end)

    local devButton = Instance.new("TextButton")
    devButton.Name = "DevButton"
    devButton.Size = UDim2.new(1, -20, 0, 40)
    devButton.Position = UDim2.new(0, 10, 0, 100)
    devButton.BackgroundColor3 = settings.accentColor
    devButton.Font = Enum.Font.GothamBold
    devButton.Text = "المطورين"
    devButton.TextSize = 18
    devButton.TextColor3 = settings.textColor
    devButton.Parent = optionPanel

    local devButtonCorner = Instance.new("UICorner")
    devButtonCorner.CornerRadius = settings.cornerRadius
    devButtonCorner.Parent = devButton

    devButton.MouseEnter:Connect(function()
        TweenService:Create(devButton, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 120)}):Play()
    end)
    devButton.MouseLeave:Connect(function()
        TweenService:Create(devButton, TweenInfo.new(0.3), {BackgroundColor3 = settings.accentColor}):Play()
    end)

    devButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = parentGui
        btnSound:Play()
        createDeveloperInterface(parentGui)
        optionPanel:Destroy()
    end)

    return optionPanel
end

---------------------------------------------
-- دالة إنشاء القائمة الدائرية (Circular Menu) مع سحب سلس
---------------------------------------------
local function createCircularMenu()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")

    if playerGui:FindFirstChild("CircularMenuGUI") then
        playerGui.CircularMenuGUI:Destroy()
    end

    local circularMenuGUI = Instance.new("ScreenGui")
    circularMenuGUI.Name = "CircularMenuGUI"
    circularMenuGUI.ResetOnSpawn = false
    circularMenuGUI.Parent = playerGui

    local circularButton = Instance.new("ImageButton")
    circularButton.Name = "CircularButton"
    circularButton.Size = UDim2.new(0, 60, 0, 60)
    circularButton.Position = UDim2.new(0.95, -30, 0.5, -30)
    circularButton.BackgroundColor3 = settings.accentColor
    circularButton.Image = "rbxassetid://7059346373" -- أيقونة القائمة
    circularButton.ImageColor3 = Color3.new(1, 1, 1)
    circularButton.BackgroundTransparency = 0.1
    circularButton.Parent = circularMenuGUI

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = settings.cornerRadius
    buttonCorner.Parent = circularButton

    local buttonUIStroke = Instance.new("UIStroke")
    buttonUIStroke.Color = Color3.fromRGB(255, 255, 255)
    buttonUIStroke.Thickness = 2
    buttonUIStroke.Transparency = 0.5
    buttonUIStroke.Parent = circularButton

    -- السحب السلس
    local dragging = false
    local dragInput, dragStart, startPos

    circularButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = circularButton.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    circularButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            circularButton.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    circularButton.MouseEnter:Connect(function()
        TweenService:Create(circularButton, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 70, 0, 70),
            Position = UDim2.new(0.95, -35, 0.5, -35)
        }):Play()
        TweenService:Create(buttonUIStroke, TweenInfo.new(0.3), {Transparency = 0}):Play()
    end)

    circularButton.MouseLeave:Connect(function()
        TweenService:Create(circularButton, TweenInfo.new(0.3), {
            Size = UDim2.new(0, 60, 0, 60),
            Position = UDim2.new(0.95, -30, 0.5, -30)
        }):Play()
        TweenService:Create(buttonUIStroke, TweenInfo.new(0.3), {Transparency = 0.5}):Play()
    end)

    circularButton.MouseButton1Click:Connect(function()
        local btnSound = Instance.new("Sound")
        btnSound.SoundId = settings.buttonSound
        btnSound.Volume = 0.5
        btnSound.Parent = circularMenuGUI
        btnSound:Play()
        createOptionPanel(circularMenuGUI)
    end)

    return circularButton, circularMenuGUI
end

---------------------------------------------
-- دالة إظهار الواجهة الرئيسية للمكتبة (Show)
---------------------------------------------
function Luna:Show()
    local _, screenGui = createCircularMenu()
    local mainUI = createMainInterface(screenGui)
    mainUI.Name = "MainInterface"
end

---------------------------------------------
-- دالة إضافة مجلد مفتوح يحتوي على سكربتات (AddFolder)
---------------------------------------------
function Luna:AddFolder(folderData)
    if not folderData.timestamp then
        folderData.timestamp = os.time()
    end
    folderData.locked = false
    table.insert(externalFolders, folderData)
end

---------------------------------------------
-- دالة إضافة مجلد مغلق يحتوي على سكربتات (AddLockedFolder)
---------------------------------------------
function Luna:AddLockedFolder(folderData)
    if not folderData.timestamp then
        folderData.timestamp = os.time()
    end
    folderData.locked = true
    table.insert(externalFolders, folderData)
end

---------------------------------------------
-- يمكن إضافة المزيد من الوظائف حسب الحاجة
---------------------------------------------

return Luna
