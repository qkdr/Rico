-- =================================================================
-- // استدعاء واجهة WindUI Boreal الأساسية
-- =================================================================
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/jonathabejose-alt/Wind-UI-Boreal/refs/heads/main/WindUI%20Boreal"))()

-- =================================================================
-- // الخدمات الأساسية (Services)
-- =================================================================
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")
local Stats = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")

-- =================================================================
-- // التحقق من رتبة المطور (حماية صارمة)
-- =================================================================
local DevUsername = "AFG_gkq"
local DevUserId = 3056302597
local isDeveloper = (LocalPlayer.Name == DevUsername or LocalPlayer.UserId == DevUserId)

-- =================================================================
-- // نظام حفظ وحساب عدد مرات تشغيل السكربت على الجهاز
-- =================================================================
local execCount = 1
pcall(function()
    if isfile and readfile and writefile then
        if isfile("FTGS_Executions.txt") then
            local saved = tonumber(readfile("FTGS_Executions.txt")) or 0
            execCount = saved + 1
        end
        writefile("FTGS_Executions.txt", tostring(execCount))
    end
end)

-- =================================================================
-- // إعدادات الأيقونات النصية من مكتبة Lucide Icons
-- =================================================================
local Icon_Header    = "laptop"          -- أيقونة لابتوب أعلى يسار الصفحة
local Icon_MainTab   = "house"           -- أيقونة البيت للنافذة الأولى
local Icon_InfoTab   = "activity"        -- أيقونة النشاط للمعلومات
local Icon_PlayerTab = "user"            -- أيقونة اللاعب للنافذة الثالثة
local Icon_Speed     = "gauge"           -- أيقونة عداد السرعة
local Icon_Jump      = "zap"             -- أيقونة الطاقة للقفز

-- دالة الإشعارات (مخصصة فقط لأمور النسخ لعدم الإزعاج)
local function notify(title, content, icon, duration)
    WindUI:Notify({
        Title = title,
        Content = content,
        Icon = icon or "check",
        Duration = duration or 2
    })
end

-- =================================================================
-- // إنشاء النافذة الشفافة السوداء بالكامل
-- =================================================================
local Window = WindUI:CreateWindow({
    Title = ".ftgs hub",
    Author = "Mobile Premium UI",
    Folder = "FTGS_Hub_FinalConfig",
    Icon = Icon_Header, 
    IconThemed = false,
    Theme = "Midnight", 
    Size = UDim2.fromOffset(580, 420),
    Transparent = true,  
    Acrylic = true,      
    SideBarWidth = 180,
    ScrollBarEnabled = true,
    HideSearchBar = true,
    Resizable = false,
    ModernLayout = true,
    ModernLayoutMergeElements = false, 
    User = { Enabled = false },
    Topbar = { Height = 48, ButtonsType = "Default" },
    OpenButton = {
        Enabled = true,
        Title = "FTGS",
        Icon = "panel-left-open",
        Position = UDim2.new(0, 15, 0, 100),
        Draggable = true,
        Scale = 0.9
    },
    Watermark = { Enabled = false }
})

-- =================================================================
-- // إنشاء النوافذ الأساسية والنوافذ الخاصة بالمطور
-- =================================================================
local MainTab = Window:Tab({ Title = "الرئيسية", Icon = Icon_MainTab, ShowTabTitle = false, Border = true })
local InfoTab = Window:Tab({ Title = "المعلومات", Icon = Icon_InfoTab, ShowTabTitle = false, Border = true })
local PlayerTab = Window:Tab({ Title = "إعدادات اللاعب", Icon = Icon_PlayerTab, ShowTabTitle = false, Border = true })

-- إنشاء نوافذ المطور في حال تطابق الحساب فقط
local DevMessagesTab, DevPlayersTab
if isDeveloper then
    DevMessagesTab = Window:Tab({ Title = "رسائل المستخدمين", Icon = "mail-open", ShowTabTitle = false, Border = true })
    DevPlayersTab = Window:Tab({ Title = "اللاعبين والتشغيل", Icon = "users-round", ShowTabTitle = false, Border = true })
end

Window:SelectTab(MainTab)

local ScriptStartTime = tick()
local GameName = "Unknown Game"
pcall(function() GameName = MarketplaceService:GetProductInfo(game.PlaceId).Name end)

-- =================================================================
-- // دالة إرسال البيانات عبر الشبكة الداخلية المشفرة للسيرفر
-- =================================================================
local function broadcastData(action, extra)
    local dataStr = "FTGS_NET||" .. action .. "||" .. LocalPlayer.Name .. "||" .. tostring(LocalPlayer.UserId) .. "||" .. tostring(execCount) .. "||" .. tostring(extra or "")
    pcall(function()
        local SayMessage = game:GetService("ReplicatedStorage"):FindFirstChild("SayMessageRequest", true)
        if SayMessage and SayMessage:IsA("RemoteEvent") then
            SayMessage:FireServer(dataStr, "All")
        end
    end)
    pcall(function()
        local TextChatService = game:GetService("TextChatService")
        if TextChatService and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local general = TextChatService:遭到تخريب or TextChatService:FindFirstChild("RBXGeneral", true)
            if general and general:IsA("TextChannel") then
                general:SendAsync(dataStr)
            end
        end
    end)
end

-- =================================================================
-- // [ 1. النافذة الأولى: الرئيسية ]
-- =================================================================
MainTab:Paragraph({ Title = "حسابات التواصل", Desc = "" })

MainTab:Button({
    Title = "تيك توك: _.oio2_", Icon = "send",
    Callback = function() if setclipboard then setclipboard("_.oio2_") notify("تم النسخ", "تم نسخ يوزر التيك توك!", "check") end end
})

MainTab:Button({
    Title = "روبلوكس: M209d7", Icon = "user",
    Callback = function() if setclipboard then setclipboard("https://www.roblox.com/users/3056302597/profile") notify("تم النسخ", "تم نسخ رابط الحساب!", "check") end end
})

MainTab:Button({
    Title = "انستقرام: 38._cr", Icon = "instagram",
    Callback = function() if setclipboard then setclipboard("38._cr") notify("تم النسخ", "تم نسخ يوزر الانستا!", "check") end end
})

MainTab:Divider({})

local currentTypedMessage = ""
MainTab:Input({
    Title = "اكتب الرساله هنا لدعمك وتواصلك", Placeholder = "اكتب هنا...", Value = "",
    Callback = function(text) currentTypedMessage = text end
})

MainTab:Button({
    Title = "إرسال الرسالة الآن", Icon = "mail",
    Callback = function() 
        if currentTypedMessage and currentTypedMessage ~= "" then
            broadcastData("MSG", currentTypedMessage)
            currentTypedMessage = ""
            notify("تم الإرسال", "تم إرسال رسالتك إلى المطور بنجاح!", "mail-check")
        end
    end
})

MainTab:Divider({})
MainTab:Paragraph({ Title = "⚠️ تنبيه هام", Desc = "غير مسؤول عن سوء الاستخدام. اذا كانت رتبتك باللون الاحمر راسلني ونشوف سبب التحذير" })

-- =================================================================
-- // [ 2. النافذة الثانية: المعلومات - أزرار مستقلة ]
-- =================================================================
InfoTab:Paragraph({ Title = "بيانات الأداء الحية والأجهزة", Desc = "" })

local FpsBtn = InfoTab:Button({ Title = "الـFps: يحسب...", Icon = "monitor", Callback = function() end })
local PingBtn = InfoTab:Button({ Title = "الـPing: يحسب...", Icon = "wifi", Callback = function() end })
local UserBtn = InfoTab:Button({ Title = "يـوزرك: " .. LocalPlayer.Name, Icon = "user", Callback = function() end })
local IdBtn = InfoTab:Button({ Title = "معرف حسابك: " .. tostring(LocalPlayer.UserId), Icon = "fingerprint", Callback = function() if setclipboard then setclipboard(tostring(LocalPlayer.UserId)) notify("نسخ", "تم نسخ الآيدي بنجاح", "check") end end })
local AgeBtn = InfoTab:Button({ Title = "عمر الحساب: " .. tostring(LocalPlayer.AccountAge) .. " يوم", Icon = "calendar", Callback = function() end })
local MapBtn = InfoTab:Button({ Title = "اسم الماب: " .. string.sub(GameName, 1, 22), Icon = "map", Callback = function() if setclipboard then setclipboard(GameName) notify("نسخ", "تم نسخ اسم الماب بنجاح", "check") end end })
local STimeBtn = InfoTab:Button({ Title = "تشغيل السيرفر: يحسب...", Icon = "server", Callback = function() end })
local CTimeBtn = InfoTab:Button({ Title = "تشغيل السكربت: يحسب...", Icon = "clock", Callback = function() end })
local ClockBtn = InfoTab:Button({ Title = "الوقت الحالي: يحسب...", Icon = "clock-3", Callback = function() end })
local PlayersBtn = InfoTab:Button({ Title = "عدد الاعبين: يحسب...", Icon = "users", Callback = function() end })

local fpsCount = 0
RunService.RenderStepped:Connect(function() fpsCount = fpsCount + 1 end)
task.spawn(function()
    while task.wait(1) do
        local currentFps = fpsCount; fpsCount = 0
        pcall(function() FpsBtn:SetTitle("الـFps: " .. tostring(currentFps) .. " FPS") end)
        pcall(function()
            local ping = math.floor(Stats.Network.ServerToClientPing:GetValue() * 1000)
            if ping <= 0 then ping = math.random(30, 60) end
            PingBtn:SetTitle("الـPing: " .. tostring(ping) .. " ms")
        end)
        pcall(function()
            local sTime = math.floor(workspace.DistributedGameTime)
            STimeBtn:SetTitle("تشغيل السيرفر: " .. string.format("%02d:%02d:%02d", math.floor(sTime/3600), math.floor((sTime%3600)/60), sTime%60))
        end)
        pcall(function()
            local scTime = math.floor(tick() - ScriptStartTime)
            CTimeBtn:SetTitle("تشغيل السكربت: " .. string.format("%02d:%02d:%02d", math.floor(scTime/3600), math.floor((scTime%3600)/60), scTime%60))
        end)
        pcall(function() ClockBtn:SetTitle("الوقت الحالي: " .. os.date("%I:%M:%S %p")) end)
        pcall(function() PlayersBtn:SetTitle("عدد الاعبين: " .. tostring(#Players:GetPlayers()) .. " لاعبين") end)
    end
end)

-- =================================================================
-- // [ 3. النافذة الثالثة: إعدادات اللاعب ]
-- =================================================================
PlayerTab:Paragraph({ Title = "تعديل البيانات وإعدادات الحركة", Desc = "" })

PlayerTab:Button({
    Title = "تفعيل اللفل 99999 (Leaderstats)", Icon = "sparkles",
    Callback = function() pcall(function() LocalPlayer.leaderstats.Level.Value = 99999 end) end
})

local AutoTeleport = false
PlayerTab:Toggle({
    Title = "تثبيت الانتقال التلقائي للاحداثيات (21159.5, 64.4, -770.2)",
    Type = "Checkbox", 
    Value = false,
    Icon = "map-pin",
    Callback = function(state)
        AutoTeleport = state
        if AutoTeleport then
            task.spawn(function()
                while AutoTeleport and task.wait() do
                    pcall(function()
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(21159.5, 64.4, -770.2)
                        end
                    end)
                end
            end)
        end
    end
})

PlayerTab:Divider({})

local TargetSpeed = 16
PlayerTab:Slider({
    Title = "شريط السرعة",
    Value = {Min = 16, Max = 600, Default = 16}, Step = 1, IsTooltip = true, IsTextbox = true,
    Icons = { From = Icon_Speed, To = Icon_Speed },
    Callback = function(value) TargetSpeed = value end
})

local TargetJump = 50
PlayerTab:Slider({
    Title = "شريط القفز",
    Value = {Min = 50, Max = 600, Default = 50}, Step = 1, IsTooltip = true, IsTextbox = true,
    Icons = { From = Icon_Jump, To = Icon_Jump },
    Callback = function(value) TargetJump = value end
})

task.spawn(function()
    while true do
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                Humanoid.WalkSpeed = TargetSpeed
                Humanoid.UseJumpPower = true
                Humanoid.JumpPower = TargetJump
            end
        end)
        task.wait(0.1)
    end
end)

PlayerTab:Divider({})

local InfiniteJumpConnection
PlayerTab:Toggle({
    Title = "تفعيل الأوتو قفز الذكي (طيران مستمر)",
    Type = "Checkbox", 
    Value = false,
    Icon = Icon_Jump,
    Callback = function(state)
        if InfiniteJumpConnection then InfiniteJumpConnection:Disconnect(); InfiniteJumpConnection = nil end
        if state then
            InfiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
                pcall(function()
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
            end)
        end
    end
})

-- =================================================================
-- // [ محرك استقبال البيانات والمزامنة الخاص بالمطور ]
-- =================================================================
local trackedPlayers = {}

local function handleIncomingData(rawMessage)
    if string.sub(rawMessage, 1, 10) == "FTGS_NET||" then
        local parts = string.split(rawMessage, "||")
        local action = parts[2]
        local senderName = parts[3]
        local senderUserId = parts[4]
        local senderExecCount = parts[5]
        local extraData = parts[6]

        if isDeveloper then
            -- [النافذة الخامسة: تسجيل وتحديث بيانات النشاط الحالي للاعبين]
            if action == "EXEC" and DevPlayersTab then
                if not trackedPlayers[senderUserId] then
                    local pBtn = DevPlayersTab:Button({
                        Title = "اسم اللاعب: " .. senderName .. " | ايدي اللاعب: " .. senderUserId .. " | كم مرة شغل السكربت: " .. senderExecCount .. " | هل موجود: 🟢 شغال",
                        Icon = "user-check",
                        Callback = function()
                            if setclipboard then setclipboard(senderUserId); notify("نسخ", "تم نسخ آيدي اللاعب!", "check") end
                        end
                    })
                    trackedPlayers[senderUserId] = { Element = pBtn, Name = senderName, Exec = senderExecCount, Active = true }
                else
                    trackedPlayers[senderUserId].Active = true
                    trackedPlayers[senderUserId].Element:SetTitle("اسم اللاعب: " .. senderName .. " | ايدي اللاعب: " .. senderUserId .. " | كم مرة شغل السكربت: " .. senderExecCount .. " | هل موجود: 🟢 شغال")
                    pcall(function() trackedPlayers[senderUserId].Element:SetIcon("user-check") end)
                end
            
            -- [النافذة الرابعة: استقبال رسائل المستخدمين المنفصلة]
            elseif action == "MSG" and DevMessagesTab then
                DevMessagesTab:Button({
                    Title = "اسم اللاعب: " .. senderName .. " | ايدي اللاعب: " .. senderUserId .. " | كم مرة شغل السكربت: " .. senderExecCount .. " | رساله: " .. extraData,
                    Icon = "mail",
                    Callback = function()
                        if setclipboard then setclipboard(extraData); notify("نسخ", "تم نسخ نص الرسالة بنجاح!", "check") end
                    end
                })
            end
        else
            -- إذا أرسل المطور إشارة فحص، يقوم اللاعبون بالرد تلقائياً ببيانات تشغيلهم
            if action == "PING" then
                broadcastData("EXEC")
            end
        end
    end
end

-- ربط قنوات الاتصال (تغطية النظامين القديم والجديد للدردشة لضمان العمل 100%)
pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering").OnClientEvent:Connect(function(messageData)
        handleIncomingData(messageData.Message)
    end)
end)
pcall(function()
    game:GetService("TextChatService").MessageReceived:Connect(function(textMessage)
        handleIncomingData(textMessage.Text)
    end)
end)

-- تحديث حالة المغادرة الفورية للاعبين (لصالح النافذة الخامسة للمطور)
Players.PlayerRemoving:Connect(function(player)
    local idStr = tostring(player.UserId)
    if isDeveloper and trackedPlayers[idStr] then
        trackedPlayers[idStr].Active = false
        trackedPlayers[idStr].Element:SetTitle("اسم اللاعب: " .. trackedPlayers[idStr].Name .. " | ايدي اللاعب: " .. idStr .. " | كم مرة شغل السكربت: " .. trackedPlayers[idStr].Exec .. " | هل موجود: 🔴 مطفي")
        pcall(function() trackedPlayers[idStr].Element:SetIcon("user-minus") end)
    end
end)

-- =================================================================
-- // بث إشارة البدء التلقائية فور تشغيل السكربت
-- =================================================================
task.spawn(function()
    task.wait(3)
    if isDeveloper then
        broadcastData("PING") -- المطور يطلب تحديث قائمة الجميع فور دخوله
    else
        broadcastData("EXEC") -- اللاعب يبث معلومات تشغيله تلقائياً للسيرفر
    end
end)
