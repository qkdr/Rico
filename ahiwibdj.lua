--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║          🎮 مثال كامل للاستخدام - Mobile Premium UI          ║
    ║                   Complete Usage Example                      ║
    ╚═══════════════════════════════════════════════════════════════╝
]]

-- تحميل المكتبة
local MobileUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/qkdr/Rico/refs/heads/main/jabsjsb.lua"))()

-- إنشاء النافذة الرئيسية
local Hub = MobileUI:CreateWindow("🌟 Hub Premium")

-- ═══════════════════════════════════════════════════════════════
--                    إضافة الخرائط مع السكربتات
-- ═══════════════════════════════════════════════════════════════

--[[
    ملاحظة: استبدل "rbxassetid://XXXXXXX" برابط صورة الخريطة الحقيقي
    للحصول على صور:
    1. اذهب إلى create.roblox.com
    2. ارفع الصورة كـ Decal
    3. احصل على الـ Asset ID
    4. استخدم: rbxassetid://[Asset ID]
]]

-- ═══════════════════════════════════════════════════════════════
--                    خريطة 1: Adopt Me
-- ═══════════════════════════════════════════════════════════════
Hub:AddMap({
    name = "Adopt Me",
    image = "rbxassetid://7074883987", -- صورة توضيحية
    scriptCount = 8,
    scripts = {
        {
            name = "🐾 Auto Farm Pets",
            users = 2450,
            loadstring = [[
                print("✅ تم تفعيل Auto Farm Pets!")
                -- ضع كود السكربت الكامل هنا
                MobileUI:ShowNotification("نجح!", "تم تشغيل Auto Farm", "rbxassetid://7072706796", "success", 3)
            ]]
        },
        {
            name = "🎁 Auto Collect Gifts",
            users = 1890,
            loadstring = [[
                print("✅ تم تفعيل Auto Collect Gifts!")
                -- كود السكربت هنا
            ]]
        },
        {
            name = "🏃 Speed Boost",
            users = 3210,
            loadstring = [[
                print("✅ تم تفعيل Speed Boost!")
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
            ]]
        },
        {
            name = "✈️ Fly Hack",
            users = 2870,
            loadstring = [[
                print("✅ تم تفعيل Fly Hack!")
                -- كود الطيران هنا
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

-- ═══════════════════════════════════════════════════════════════
--                    خريطة 2: Blox Fruits
-- ═══════════════════════════════════════════════════════════════
Hub:AddMap({
    name = "Blox Fruits",
    image = "rbxassetid://7074878619",
    scriptCount = 10,
    scripts = {
        {
            name = "⚔️ Auto Farm Level",
            users = 8900,
            loadstring = [[
                print("✅ تم تفعيل Auto Farm Level!")
                -- كود تطوير المستوى التلقائي
            ]]
        },
        {
            name = "🏆 Auto Boss",
            users = 5600,
            loadstring = [[
                print("✅ تم تفعيل Auto Boss!")
            ]]
        },
        {
            name = "🍎 Fruit ESP",
            users = 6700,
            loadstring = [[
                print("✅ تم تفعيل Fruit ESP!")
            ]]
        },
        {
            name = "⚡ Auto Raid",
            users = 4200,
            loadstring = [[
                print("✅ تم تفعيل Auto Raid!")
            ]]
        },
        {
            name = "🌊 Auto Sea Event",
            users = 3100,
            loadstring = [[
                print("✅ تم تفعيل Auto Sea Event!")
            ]]
        },
        {
            name = "💪 Mastery Farm",
            users = 3890,
            loadstring = [[
                print("✅ تم تفعيل Mastery Farm!")
            ]]
        },
        {
            name = "🗺️ Auto Quest",
            users = 2450,
            loadstring = [[
                print("✅ تم تفعيل Auto Quest!")
            ]]
        },
        {
            name = "🎯 Auto Stats",
            users = 2100,
            loadstring = [[
                print("✅ تم تفعيل Auto Stats!")
            ]]
        },
        {
            name = "⚔️ PvP Farm",
            users = 1670,
            loadstring = [[
                print("✅ تم تفعيل PvP Farm!")
            ]]
        },
        {
            name = "🌟 Premium Hub",
            users = 7200,
            loadstring = [[
                print("✅ تم تفعيل Premium Hub!")
            ]]
        }
    }
})

-- ═══════════════════════════════════════════════════════════════
--                    خريطة 3: Jailbreak
-- ═══════════════════════════════════════════════════════════════
Hub:AddMap({
    name = "Jailbreak",
    image = "rbxassetid://7074871549",
    scriptCount = 7,
    scripts = {
        {
            name = "🏦 Auto Rob All",
            users = 5400,
            loadstring = [[
                print("✅ تم تفعيل Auto Rob All!")
            ]]
        },
        {
            name = "🚗 Infinite Nitro",
            users = 3200,
            loadstring = [[
                print("✅ تم تفعيل Infinite Nitro!")
            ]]
        },
        {
            name = "👁️ ESP Players",
            users = 2900,
            loadstring = [[
                print("✅ تم تفعيل ESP Players!")
            ]]
        },
        {
            name = "🗺️ Teleport GUI",
            users = 4100,
            loadstring = [[
                print("✅ تم تفعيل Teleport GUI!")
            ]]
        },
        {
            name = "🔓 Auto Arrest",
            users = 1800,
            loadstring = [[
                print("✅ تم تفعيل Auto Arrest!")
            ]]
        },
        {
            name = "💨 No Clip",
            users = 2400,
            loadstring = [[
                print("✅ تم تفعيل No Clip!")
            ]]
        },
        {
            name = "⚡ Full Features",
            users = 6700,
            loadstring = [[
                print("✅ تم تفعيل Full Features!")
            ]]
        }
    }
})

-- ═══════════════════════════════════════════════════════════════
--                    خريطة 4: Arsenal
-- ═══════════════════════════════════════════════════════════════
Hub:AddMap({
    name = "Arsenal",
    image = "rbxassetid://7074869053",
    scriptCount = 6,
    scripts = {
        {
            name = "🎯 Aimbot Pro",
            users = 7800,
            loadstring = [[
                print("✅ تم تفعيل Aimbot Pro!")
            ]]
        },
        {
            name = "👁️ ESP Walls",
            users = 5600,
            loadstring = [[
                print("✅ تم تفعيل ESP Walls!")
            ]]
        },
        {
            name = "🎯 Silent Aim",
            users = 6200,
            loadstring = [[
                print("✅ تم تفعيل Silent Aim!")
            ]]
        },
        {
            name = "🔫 No Recoil",
            users = 4100,
            loadstring = [[
                print("✅ تم تفعيل No Recoil!")
            ]]
        },
        {
            name = "⚡ Speed Hack",
            users = 3400,
            loadstring = [[
                print("✅ تم تفعيل Speed Hack!")
            ]]
        },
        {
            name = "🌟 Premium Scripts",
            users = 8900,
            loadstring = [[
                print("✅ تم تفعيل Premium Scripts!")
            ]]
        }
    }
})

-- ═══════════════════════════════════════════════════════════════
--                    خريطة 5: Da Hood
-- ═══════════════════════════════════════════════════════════════
Hub:AddMap({
    name = "Da Hood",
    image = "rbxassetid://7074876061",
    scriptCount = 9,
    scripts = {
        {
            name = "🔒 Lock Player",
            users = 9200,
            loadstring = [[
                print("✅ تم تفعيل Lock Player!")
            ]]
        },
        {
            name = "💰 Auto Farm Cash",
            users = 6700,
            loadstring = [[
                print("✅ تم تفعيل Auto Farm Cash!")
            ]]
        },
        {
            name = "🎯 Silent Aim",
            users = 8100,
            loadstring = [[
                print("✅ تم تفعيل Silent Aim!")
            ]]
        },
        {
            name = "👁️ ESP All",
            users = 5400,
            loadstring = [[
                print("✅ تم تفعيل ESP All!")
            ]]
        },
        {
            name = "🏃 Infinite Stamina",
            users = 3900,
            loadstring = [[
                print("✅ تم تفعيل Infinite Stamina!")
            ]]
        },
        {
            name = "✈️ Fly Mode",
            users = 4600,
            loadstring = [[
                print("✅ تم تفعيل Fly Mode!")
            ]]
        },
        {
            name = "🔫 Gun Mods",
            users = 5800,
            loadstring = [[
                print("✅ تم تفعيل Gun Mods!")
            ]]
        },
        {
            name = "🚗 Vehicle Speed",
            users = 2900,
            loadstring = [[
                print("✅ تم تفعيل Vehicle Speed!")
            ]]
        },
        {
            name = "⚡ Full Scripts",
            users = 10500,
            loadstring = [[
                print("✅ تم تفعيل Full Scripts!")
            ]]
        }
    }
})

-- ═══════════════════════════════════════════════════════════════
--                    خريطة 6: Murder Mystery 2
-- ═══════════════════════════════════════════════════════════════
Hub:AddMap({
    name = "Murder Mystery 2",
    image = "rbxassetid://7074872294",
    scriptCount = 5,
    scripts = {
        {
            name = "👁️ Show Roles ESP",
            users = 6400,
            loadstring = [[
                print("✅ تم تفعيل Show Roles ESP!")
            ]]
        },
        {
            name = "💰 Auto Collect Coins",
            users = 3800,
            loadstring = [[
                print("✅ تم تفعيل Auto Collect Coins!")
            ]]
        },
        {
            name = "🔫 Gun Mods",
            users = 4500,
            loadstring = [[
                print("✅ تم تفعيل Gun Mods!")
            ]]
        },
        {
            name = "🔪 Knife Reach",
            users = 2900,
            loadstring = [[
                print("✅ تم تفعيل Knife Reach!")
            ]]
        },
        {
            name = "⚡ Full GUI",
            users = 7800,
            loadstring = [[
                print("✅ تم تفعيل Full GUI!")
            ]]
        }
    }
})

-- ═══════════════════════════════════════════════════════════════
--                    خريطة 7: Brookhaven
-- ═══════════════════════════════════════════════════════════════
Hub:AddMap({
    name = "Brookhaven",
    image = "rbxassetid://7074863416",
    scriptCount = 6,
    scripts = {
        {
            name = "🏠 House Customizer",
            users = 4200,
            loadstring = [[
                print("✅ تم تفعيل House Customizer!")
            ]]
        },
        {
            name = "🚗 Vehicle Mods",
            users = 3600,
            loadstring = [[
                print("✅ تم تفعيل Vehicle Mods!")
            ]]
        },
        {
            name = "✈️ Fly Hack",
            users = 5100,
            loadstring = [[
                print("✅ تم تفعيل Fly Hack!")
            ]]
        },
        {
            name = "🎭 Avatar Mods",
            users = 2800,
            loadstring = [[
                print("✅ تم تفعيل Avatar Mods!")
            ]]
        },
        {
            name = "🗺️ Teleport GUI",
            users = 3900,
            loadstring = [[
                print("✅ تم تفعيل Teleport GUI!")
            ]]
        },
        {
            name = "⚡ Premium Hub",
            users = 6700,
            loadstring = [[
                print("✅ تم تفعيل Premium Hub!")
            ]]
        }
    }
})

-- ═══════════════════════════════════════════════════════════════
--                    خريطة 8: Anime Fighting
-- ═══════════════════════════════════════════════════════════════
Hub:AddMap({
    name = "Anime Fighting",
    image = "rbxassetid://7074859385",
    scriptCount = 7,
    scripts = {
        {
            name = "⚔️ Auto Train",
            users = 5600,
            loadstring = [[
                print("✅ تم تفعيل Auto Train!")
            ]]
        },
        {
            name = "💪 Auto Farm Stats",
            users = 4800,
            loadstring = [[
                print("✅ تم تفعيل Auto Farm Stats!")
            ]]
        },
        {
            name = "🏆 Auto Quest",
            users = 3400,
            loadstring = [[
                print("✅ تم تفعيل Auto Quest!")
            ]]
        },
        {
            name = "⚡ Fast Attack",
            users = 4200,
            loadstring = [[
                print("✅ تم تفعيل Fast Attack!")
            ]]
        },
        {
            name = "👁️ Player ESP",
            users = 2900,
            loadstring = [[
                print("✅ تم تفعيل Player ESP!")
            ]]
        },
        {
            name = "🎯 Auto Collect",
            users = 3600,
            loadstring = [[
                print("✅ تم تفعيل Auto Collect!")
            ]]
        },
        {
            name = "🌟 Full Features",
            users = 7300,
            loadstring = [[
                print("✅ تم تفعيل Full Features!")
            ]]
        }
    }
})

-- ═══════════════════════════════════════════════════════════════
--                    إشعار ترحيبي
-- ═══════════════════════════════════════════════════════════════
wait(1)
MobileUI:ShowNotification(
    "🎉 مرحباً بك!",
    "تم تحميل Hub Premium بنجاح",
    "rbxassetid://7072718799",
    "success",
    4
)

wait(2)
MobileUI:ShowNotification(
    "📱 متوافق مع الجوال",
    "الواجهة محسّنة للجوال والايباد",
    "rbxassetid://7072717697",
    "info",
    4
)

--[[
    ═══════════════════════════════════════════════════════════════
                        🎨 ملاحظات التخصيص
    ═══════════════════════════════════════════════════════════════
    
    ✨ المميزات:
    ✅ تصميم شفاف فخم مع تأثيرات زجاجية
    ✅ أزرار iOS حديثة ومتحركة
    ✅ نظام مجلدات مع أنيميشن انتقال سلس
    ✅ زر عائم قابل للسحب
    ✅ متجاوب مع الجوال والايباد
    ✅ إشعارات فخمة مع أنيميشن
    ✅ صور الخرائط مع إطارات جميلة
    ✅ تأثيرات ضغط الأزرار
    
    🎯 كيفية الاستخدام:
    1. ارفع صور الخرائط على Roblox
    2. استبدل rbxassetid:// بأرقام صورك
    3. ضع كود السكربتات في loadstring
    4. شغّل السكربت واستمتع!
    
    💡 نصائح:
    - الزر العائم يمكن سحبه لأي مكان
    - استخدم البحث للعثور على الخرائط
    - زر الرجوع يعيدك للقائمة الرئيسية
    - الإشعارات تظهر تلقائياً عند التفعيل
    
    ═══════════════════════════════════════════════════════════════
]]
