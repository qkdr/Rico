--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║          🎮 Mobile Premium UI - نسخة مُحسّنة وآمنة             ║
    ║       Safe + robust version: fallbacks, pcall, load checks     ║
    ╚═══════════════════════════════════════════════════════════════╝
]]

-- ======= إعداد دوال مساعدة =======
local function safeHttpGet(url)
    -- يحاول استخدام game:HttpGet ثم HttpService:GetAsync كبديل
    local ok, res = pcall(function() return game:HttpGet(url) end)
    if ok and res then return res end

    local HttpService = game:GetService("HttpService")
    ok, res = pcall(function() return HttpService:GetAsync(url) end)
    if ok and res then return res end

    return nil -- فشل التحميل
end

local function safeLoadString(code)
    -- يحاول loadstring ثم load
    local loader = loadstring or load
    if not loader then
        return nil, "no loader available (loadstring/load not present)"
    end
    local ok, chunkOrErr = pcall(function() return loader(code) end)
    if not ok then
        return nil, chunkOrErr
    end
    return chunkOrErr -- إما function أو load() return value
end

local function safeCall(fn, ...)
    if type(fn) ~= "function" then
        return false, "not a function"
    end
    local ok, a, b, c = pcall(fn, ...)
    if not ok then return false, a end
    return true, a, b, c
end

-- ======= محاولة تحميل مكتبة MobileUI من الرابط =======
local MOBILEUI_URL = "https://raw.githubusercontent.com/qkdr/Rico/refs/heads/main/jabsjsb.lua"
local MobileUI = nil

do
    local ok, body = pcall(safeHttpGet, MOBILEUI_URL)
    if ok and body then
        local loader, err = safeLoadString(body)
        if loader then
            local success, result = pcall(function() return loader() end)
            if success and result then
                MobileUI = result
            end
        end
    end
end

-- ======= إن لم تُحمّل المكتبة: نُنشئ Stub آمن =======
if not MobileUI or type(MobileUI) ~= "table" then
    warn("[MobileUI Loader] تعذر تحميل المكتبة من الإنترنت - سيتم استخدام Stub آمن.")
    MobileUI = {}

    function MobileUI:ShowNotification(title, text, image, typ, duration)
        -- stub بسيط يعرض في الـ output بدل GUI
        print(("[MobileUI] Notification — %s: %s (type=%s, duration=%s)"):format(tostring(title), tostring(text), tostring(typ), tostring(duration)))
    end

    function MobileUI:CreateWindow(title)
        print(("[MobileUI] CreateWindow (stub): %s"):format(tostring(title)))
        local maps = {}

        local hub = {}

        function hub:AddMap(mapTable)
            -- تحقق من صحة البيانات الأساسية
            if type(mapTable) ~= "table" then
                warn("[MobileUI Stub] AddMap: expected table")
                return
            end
            table.insert(maps, mapTable)
            print(("[MobileUI Stub] Added map: %s (scripts=%s)"):format(tostring(mapTable.name), tostring(mapTable.scriptCount or #mapTable.scripts)))
            -- نهيئ كل سكربت لتشغيل آمن عند الطلب
            if type(mapTable.scripts) == "table" then
                for i, s in ipairs(mapTable.scripts) do
                    s._run = function()
                        if not s.loadstring then
                            print(("Script %s has no loadstring"):format(tostring(s.name)))
                            return
                        end
                        local fn, err = safeLoadString(s.loadstring)
                        if not fn then
                            warn(("Failed to load script '%s': %s"):format(tostring(s.name), tostring(err)))
                            return
                        end
                        local ok, runErr = pcall(fn)
                        if not ok then warn(("Error running script '%s': %s"):format(tostring(s.name), tostring(runErr))) end
                    end
                end
            end
        end

        function hub:GetMaps()
            return maps
        end

        function hub:RunScriptByName(scriptName)
            for _, m in ipairs(maps) do
                if type(m.scripts) == "table" then
                    for _, s in ipairs(m.scripts) do
                        if s.name == scriptName and type(s._run) == "function" then
                            return pcall(s._run)
                        end
                    end
                end
            end
            return false, "script not found"
        end

        return hub
    end
end

-- ======= الآن إنشاء الـ Hub (آمن) =======
local ok, Hub = pcall(function() return MobileUI:CreateWindow("🌟 Hub Premium") end)
if not ok or not Hub then
    -- إن حدث خطأ غير متوقع نستخدم stub محلي
    warn("[MobileUI] CreateWindow فشل؛ إنشاء hub stub محلي.")
    MobileUI:ShowNotification("خطأ", "تعذر إنشاء الواجهة؛ يتم تشغيل نسخة آمنة", nil, "error", 4)
    -- إنشأنا hub احتياطي:
    Hub = {
        AddMap = function(self, t) print("Adding map (fallback):", t and t.name or "nil") end
    }
end

-- ======= دالة مساعدة لإضافة الخريطة بأمان =======
local function safeAddMap(hub, mapDef)
    if type(hub) ~= "table" or type(hub.AddMap) ~= "function" then
        warn("Hub غير صالح أو لا يحتوي AddMap")
        return
    end
    local success, err = pcall(function() hub:AddMap(mapDef) end)
    if not success then
        warn("فشل إضافة الخريطة: " .. tostring(err))
    end
end

-- ======= الآن نضيف الخرائط بنفس بياناتك لكن بطريقة آمنة =======
-- ملاحظة: لا نُشغّل السكربتات فوراً هنا — فقط نُسجلها بحيث الواجهة (أو stub) تستطيع تشغيلها عند الطلب

-- خريطة 1: Adopt Me
safeAddMap(Hub, {
    name = "Adopt Me",
    image = "rbxassetid://7074883987",
    scriptCount = 8,
    scripts = {
        {
            name = "🐾 Auto Farm Pets",
            users = 2450,
            loadstring = [[
                print("✅ تم تفعيل Auto Farm Pets!")
                -- ضع كود السكربت الكامل هنا
                if MobileUI and MobileUI.ShowNotification then
                    MobileUI:ShowNotification("نجح!", "تم تشغيل Auto Farm", "rbxassetid://7072706796", "success", 3)
                end
            ]]
        },
        {
            name = "🎁 Auto Collect Gifts",
            users = 1890,
            loadstring = [[
                print("✅ تم تفعيل Auto Collect Gifts!")
            ]]
        },
        {
            name = "🏃 Speed Boost",
            users = 3210,
            loadstring = [[
                print("✅ تم تفعيل Speed Boost!")
                local plr = game.Players.LocalPlayer
                if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
                    plr.Character.Humanoid.WalkSpeed = 100
                end
            ]]
        },
        {
            name = "✈️ Fly Hack",
            users = 2870,
            loadstring = [[
                print("✅ تم تفعيل Fly Hack!")
            ]]
        },
        {
            name = "💰 Money Farm",
            users = 4100,
            loadstring = [[
                print("✅ تم تفعيل Money Farm!")
            ]]
        },
        {
            name = "🎯 Teleport GUI",
            users = 1560,
            loadstring = [[
                print("✅ تم تفعيل Teleport GUI!")
            ]]
        },
        {
            name = "🌟 Premium Features",
            users = 980,
            loadstring = [[
                print("✅ تم تفعيل Premium Features!")
            ]]
        },
        {
            name = "🔧 All Tools",
            users = 1230,
            loadstring = [[
                print("✅ تم تفعيل All Tools!")
            ]]
        }
    }
})

-- خريطة 2: Blox Fruits
safeAddMap(Hub, {
    name = "Blox Fruits",
    image = "rbxassetid://7074878619",
    scriptCount = 10,
    scripts = {
        { name = "⚔️ Auto Farm Level", users = 8900, loadstring = [[ print("✅ تم تفعيل Auto Farm Level!") ]] },
        { name = "🏆 Auto Boss", users = 5600, loadstring = [[ print("✅ تم تفعيل Auto Boss!") ]] },
        { name = "🍎 Fruit ESP", users = 6700, loadstring = [[ print("✅ تم تفعيل Fruit ESP!") ]] },
        { name = "⚡ Auto Raid", users = 4200, loadstring = [[ print("✅ تم تفعيل Auto Raid!") ]] },
        { name = "🌊 Auto Sea Event", users = 3100, loadstring = [[ print("✅ تم تفعيل Auto Sea Event!") ]] },
        { name = "💪 Mastery Farm", users = 3890, loadstring = [[ print("✅ تم تفعيل Mastery Farm!") ]] },
        { name = "🗺️ Auto Quest", users = 2450, loadstring = [[ print("✅ تم تفعيل Auto Quest!") ]] },
        { name = "🎯 Auto Stats", users = 2100, loadstring = [[ print("✅ تم تفعيل Auto Stats!") ]] },
        { name = "⚔️ PvP Farm", users = 1670, loadstring = [[ print("✅ تم تفعيل PvP Farm!") ]] },
        { name = "🌟 Premium Hub", users = 7200, loadstring = [[ print("✅ تم تفعيل Premium Hub!") ]] }
    }
})

-- خريطة 3: Jailbreak
safeAddMap(Hub, {
    name = "Jailbreak",
    image = "rbxassetid://7074871549",
    scriptCount = 7,
    scripts = {
        { name = "🏦 Auto Rob All", users = 5400, loadstring = [[ print("✅ تم تفعيل Auto Rob All!") ]] },
        { name = "🚗 Infinite Nitro", users = 3200, loadstring = [[ print("✅ تم تفعيل Infinite Nitro!") ]] },
        { name = "👁️ ESP Players", users = 2900, loadstring = [[ print("✅ تم تفعيل ESP Players!") ]] },
        { name = "🗺️ Teleport GUI", users = 4100, loadstring = [[ print("✅ تم تفعيل Teleport GUI!") ]] },
        { name = "🔓 Auto Arrest", users = 1800, loadstring = [[ print("✅ تم تفعيل Auto Arrest!") ]] },
        { name = "💨 No Clip", users = 2400, loadstring = [[ print("✅ تم تفعيل No Clip!") ]] },
        { name = "⚡ Full Features", users = 6700, loadstring = [[ print("✅ تم تفعيل Full Features!") ]] }
    }
})

-- خريطة 4: Arsenal
safeAddMap(Hub, {
    name = "Arsenal",
    image = "rbxassetid://7074869053",
    scriptCount = 6,
    scripts = {
        { name = "🎯 Aimbot Pro", users = 7800, loadstring = [[ print("✅ تم تفعيل Aimbot Pro!") ]] },
        { name = "👁️ ESP Walls", users = 5600, loadstring = [[ print("✅ تم تفعيل ESP Walls!") ]] },
        { name = "🎯 Silent Aim", users = 6200, loadstring = [[ print("✅ تم تفعيل Silent Aim!") ]] },
        { name = "🔫 No Recoil", users = 4100, loadstring = [[ print("✅ تم تفعيل No Recoil!") ]] },
        { name = "⚡ Speed Hack", users = 3400, loadstring = [[ print("✅ تم تفعيل Speed Hack!") ]] },
        { name = "🌟 Premium Scripts", users = 8900, loadstring = [[ print("✅ تم تفعيل Premium Scripts!") ]] }
    }
})

-- خريطة 5: Da Hood
safeAddMap(Hub, {
    name = "Da Hood",
    image = "rbxassetid://7074876061",
    scriptCount = 9,
    scripts = {
        { name = "🔒 Lock Player", users = 9200, loadstring = [[ print("✅ تم تفعيل Lock Player!") ]] },
        { name = "💰 Auto Farm Cash", users = 6700, loadstring = [[ print("✅ تم تفعيل Auto Farm Cash!") ]] },
        { name = "🎯 Silent Aim", users = 8100, loadstring = [[ print("✅ تم تفعيل Silent Aim!") ]] },
        { name = "👁️ ESP All", users = 5400, loadstring = [[ print("✅ تم تفعيل ESP All!") ]] },
        { name = "🏃 Infinite Stamina", users = 3900, loadstring = [[ print("✅ تم تفعيل Infinite Stamina!") ]] },
        { name = "✈️ Fly Mode", users = 4600, loadstring = [[ print("✅ تم تفعيل Fly Mode!") ]] },
        { name = "🔫 Gun Mods", users = 5800, loadstring = [[ print("✅ تم تفعيل Gun Mods!") ]] },
        { name = "🚗 Vehicle Speed", users = 2900, loadstring = [[ print("✅ تم تفعيل Vehicle Speed!") ]] },
        { name = "⚡ Full Scripts", users = 10500, loadstring = [[ print("✅ تم تفعيل Full Scripts!") ]] }
    }
})

-- خريطة 6: Murder Mystery 2
safeAddMap(Hub, {
    name = "Murder Mystery 2",
    image = "rbxassetid://7074872294",
    scriptCount = 5,
    scripts = {
        { name = "👁️ Show Roles ESP", users = 6400, loadstring = [[ print("✅ تم تفعيل Show Roles ESP!") ]] },
        { name = "💰 Auto Collect Coins", users = 3800, loadstring = [[ print("✅ تم تفعيل Auto Collect Coins!") ]] },
        { name = "🔫 Gun Mods", users = 4500, loadstring = [[ print("✅ تم تفعيل Gun Mods!") ]] },
        { name = "🔪 Knife Reach", users = 2900, loadstring = [[ print("✅ تم تفعيل Knife Reach!") ]] },
        { name = "⚡ Full GUI", users = 7800, loadstring = [[ print("✅ تم تفعيل Full GUI!") ]] }
    }
})

-- خريطة 7: Brookhaven
safeAddMap(Hub, {
    name = "Brookhaven",
    image = "rbxassetid://7074863416",
    scriptCount = 6,
    scripts = {
        { name = "🏠 House Customizer", users = 4200, loadstring = [[ print("✅ تم تفعيل House Customizer!") ]] },
        { name = "🚗 Vehicle Mods", users = 3600, loadstring = [[ print("✅ تم تفعيل Vehicle Mods!") ]] },
        { name = "✈️ Fly Hack", users = 5100, loadstring = [[ print("✅ تم تفعيل Fly Hack!") ]] },
        { name = "🎭 Avatar Mods", users = 2800, loadstring = [[ print("✅ تم تفعيل Avatar Mods!") ]] },
        { name = "🗺️ Teleport GUI", users = 3900, loadstring = [[ print("✅ تم تفعيل Teleport GUI!") ]] },
        { name = "⚡ Premium Hub", users = 6700, loadstring = [[ print("✅ تم تفعيل Premium Hub!") ]] }
    }
})

-- خريطة 8: Anime Fighting
safeAddMap(Hub, {
    name = "Anime Fighting",
    image = "rbxassetid://7074859385",
    scriptCount = 7,
    scripts = {
        { name = "⚔️ Auto Train", users = 5600, loadstring = [[ print("✅ تم تفعيل Auto Train!") ]] },
        { name = "💪 Auto Farm Stats", users = 4800, loadstring = [[ print("✅ تم تفعيل Auto Farm Stats!") ]] },
        { name = "🏆 Auto Quest", users = 3400, loadstring = [[ print("✅ تم تفعيل Auto Quest!") ]] },
        { name = "⚡ Fast Attack", users = 4200, loadstring = [[ print("✅ تم تفعيل Fast Attack!") ]] },
        { name = "👁️ Player ESP", users = 2900, loadstring = [[ print("✅ تم تفعيل Player ESP!") ]] },
        { name = "🎯 Auto Collect", users = 3600, loadstring = [[ print("✅ تم تفعيل Auto Collect!") ]] },
        { name = "🌟 Full Features", users = 7300, loadstring = [[ print("✅ تم تفعيل Full Features!") ]] }
    }
})

-- ======= إشعارات ترحيب (محمية) =======
pcall(function()
    if MobileUI and MobileUI.ShowNotification then
        MobileUI:ShowNotification("🎉 مرحباً بك!", "تم تحميل Hub Premium بنجاح", "rbxassetid://7072718799", "success", 4)
        wait(1)
        MobileUI:ShowNotification("📱 متوافق مع الجوال", "الواجهة محسّنة للجوال والايباد", "rbxassetid://7072717697", "info", 4)
    else
        print("Welcome: Hub Premium (no GUI available)")
    end
end)

-- ======= مثال: كيفية تشغيل سكربت مسجل بواسطة اسم (إذا واجهت Stub) =======
-- مثال: hub:RunScriptByName("🏃 Speed Boost")
-- لو تستخدم stub، فعل السطر التالي في التنفيذ لتجربة تشغيل أحد السكربتات:
-- pcall(function() Hub:RunScriptByName("🏃 Speed Boost") end)

-- ======= انتهى السكربت =======
print("[Hub Premium] loaded (safe mode). إذا ظهرت أي اخطاء أرسل لي الـ Output.")
