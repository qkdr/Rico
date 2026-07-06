local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DeltaWelcome"
gui.ResetOnSpawn = false

local main = Instance.new("Frame")
main.Parent = gui
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.4, 0)
main.Size = UDim2.new(0, 450, 0, 150)
main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
main.BackgroundTransparency = 0.2
main.BorderSizePixel = 0
main.Visible = false

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 20)

-- الأيقونة على اليسار
local icon = Instance.new("ImageLabel", main)
icon.Size = UDim2.new(0, 60, 0, 60)
icon.Position = UDim2.new(0, 10, 0, 10)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://96720179320058"

-- النص
local text = Instance.new("TextLabel", main)
text.Size = UDim2.new(1, -80, 1, -20)
text.Position = UDim2.new(0, 80, 0, 10)
text.BackgroundTransparency = 1
text.Text = "مطور سكربت غالي!"
text.TextColor3 = Color3.new(1, 1, 1)
text.Font = Enum.Font.GothamBold
text.TextScaled = true
text.TextWrapped = true
text.TextXAlignment = Enum.TextXAlignment.Left
text.TextYAlignment = Enum.TextYAlignment.Center

-- أنميشن الدخول
main.Visible = true
main.BackgroundTransparency = 1
text.TextTransparency = 1
icon.ImageTransparency = 1

for i = 1, 10 do
 main.BackgroundTransparency -= 0.08
 text.TextTransparency -= 0.1
 icon.ImageTransparency -= 0.1
 wait(0.03)
end

wait(5) -- كم ثانية تبقى

-- أنميشن الخروج
for i = 1, 10 do
 main.BackgroundTransparency += 0.08
 text.TextTransparency += 0.1
 icon.ImageTransparency += 0.1
 wait(0.03)
end

gui:Destroy()
local args = {
    [1] = "RolePlayName";
    [2] = "سِکْربًتٌ آلَمًطِوٌر غُآلَيَ";
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
local args = {
    [1] = "RolePlayBio",
    [2] = "ŹXË ȞŮB"
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
loadstring(game:HttpGet(("https://raw.githubusercontent.com/Sadfffaj/-/refs/heads/main/%D8%AC%D8%A7%D8%B1%D9%8A%20%D8%AA%D8%B9%D9%84%D9%85%20%D8%A7%D9%84%D9%87.txt")))()
MakeWindow({
  Hub = {
    Title = "ZXE hub",
    Animation = "WELCOME back "
  },
  Key = {
    KeySystem = true,
    Title = "ŹXË ȞŮB",
    Description = " للحصول على مفتاح ادخل التلجرام",
    KeyLink = "https://t.me/+_IsF2PmsSBxkOTE0",
    Keys = {"ASD55"},
    Notifi = {
      Notifications = true,
      CorrectKey = "🎈نظام المفتاح صحيح🎈",
      Incorrectkey = "المفتاح خطأ",
      CopyKeyLink = "لقد تم النسخ بنجاح"
    }
  }
})
MinimizeButton({
  Image = "rbxassetid://96720179320058",
  Size = {40, 40},
  Color = Color3.fromRGB(255, 125, 0),
  Corner = true,
  Stroke = false,
  StrokeColor = Color3.fromRGB(255, 125, 0)
})

local Main = MakeTab({Name = "الحقوق"})
local Image = AddImageLabel(Main, {
  Name = "اهلا بكم",
  Image = "rbxassetid://96720179320058"
})
local section  = AddSection(Main, {"حسابات المطور | اي سؤال | اي فكره | اي تحديث | ادخل قناتي"})


AddDiscord(Main, {
    DiscordLink = "https://t.me/+_IsF2PmsSBxkOTE0",
    DiscordIcon = "rbxassetid://96720179320058",
    DiscordTitle = "اضغط لنسخ قناة التلجرام",
    })

AddButton(Main, {
  Name = "اضغط لنسخ حسابي تيك",
  Callback = function()
   setclipboard("ghali33") 
  end
})

AddButton(Main, {
  Name = " اضغط لنسخ حسابي روب",
  Callback = function()
   setclipboard("ghali0059") 
  end
})

AddButton(Main, {
  Name = " اضغط لنسخ حساب المطور سجاد",
  Callback = function()
   setclipboard("ixef3") 
  end
})

AddButton(Main, {
  Name = "اضغط للنسخ",
  Callback = function()
   setclipboard("مافاضي لك") 
  end
})

local Main = MakeTab({Name = "السكربتات"})
  AddButton(Main, {
    Name = "سكربت جودة  ",
    Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rtx-graphics-25102"))()
    end
  })
  
  AddButton(Main, {
    Name = "سكربت رقصات ",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/S2EXE/GUI12-/refs/heads/main/SaifloveU"))()
    end
  })
  
  AddButton(Main, {
    Name = "مشيات ",
    Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AFEM-14048"))()
    end
  })
  
  AddButton(Main, {
    Name = "سكربت نسخ سكنـات ",
    Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-rochips-universal-18294"))()
    end
  })
  
  AddButton(Main, {
    Name = "سكربت الهلال ",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/n0kc/AtomicHub/main/Map-Al-Biout.lua"))()
    end
  })
  
  AddButton(Main, {
    Name = "سكربت اختفاء ",
    Callback = function()
      loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
    end
  })
  
  AddButton(Main, {
    Name = " سكربت طيران كنبة  ",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
    end
  })
  
  AddButton(Main, {
    Name = " سكربت طيران  ",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/S2EXE/hi/refs/heads/main/fly%20gui%20freee"))()
    end
  })
  
  AddButton(Main, {
    Name = " سكربـت اغاني  ",
    Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script'))()
    end
  })

  AddButton(Main, {
    Name = "سكربت قفل",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Sector9922/SECTOR-SHIFT-LOCK/main/SECTOR%20SHIFT%20LOCK"))()
    end
  })

MakeNotifi({
  Title = "نورت عزيزي",
  Text = "i love you",
  Time = 5
})

local Toggle = AddToggle(Main, {
  Name = "طيران",
  Default = false,
  Callback = function(Value)
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gui-Fly-v3-37111"))()
  end
})

MakeNotifi({
  Title = "كل الشكر والتقدير للمطور سجاد",
  Text = "gg",
  Time = 5
})

AddButton(Main, {
  Name = "ugix",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lx8Lx/UgiX1/refs/heads/main/UgiX.txt"))()
  end
})

local Main = MakeTab({Name = "اغاني"}) 
AddButton(Main, {
  Name = "فونك فخم",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "99409598156364"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "فونك ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "91255363712950"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سب 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"

}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8701632845"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سب 3",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6713993281"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سب 4",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "5849978429"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سب 4",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7183326833"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اكس اكس ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1836685799"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Bigger Than Everything",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "15689446558"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنية عراقية",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "135009652401688"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنية عراقية 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "11463392143"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})

local Main = MakeTab({Name = "اجسام"})
AddButton(Main, {
  Name = "رجل مقطوعه ",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
end
})

AddButton(Main, {
  Name = "رجل حديدة",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 17500249989,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "راس مخفي",
  Callback = function()
    local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 134082579
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
wait(0.1)
  end
})

AddButton(Main, {
  Name = "راس روبوت",
  Callback = function()
    local args = {
    [1] = 3210773801
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "راس روكر",
  Callback = function()
    local args = {
    [1] = 134082579
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "راس كيوت",
  Callback = function()
    local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 746767604
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  end
})


AddButton(Main, {
  Name = "جسم بنت",
  Callback = function()
  local args = {
    [1] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.1)
end
})
  AddButton(Main, {
  Name = " القزم",
  Callback = function()
    print("Clicked")
    local args = {
    [1] = {
        [1] = 14579958702,
        [2] = 14579959062,
        [3] = 14579959191,
        [4] = 14579959249,
        [5] = 14579963667,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.1)
  end
})
AddButton(Main, {
  Name = "قزومي",
  Callback = function()
    print("Clicked")
    local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 18599265011,
        [2] = 18599265151,
        [3] = 18599265190,
        [4] = 18599265270,
        [5] = 18599264796,
        [6] = 1
    },
    [3] = "YinHub"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
wait(0.1)
  end
})

AddButton(Main, {
  Name = "عيون حادة",
  Callback = function()
  local args = {
    [1] = 16580493236
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

   end
})
AddButton(Main, {
  Name = "رجل العظام الرصاصي",
  Callback = function()
    print("Clicked")local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 17500249989,
        [5] = 1,
        [6] = 1
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "رجل العظام السود",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 14547162578,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "رجل رول",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 3230472745,
        [5] = 3230470862,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "جسم بنت ضعيف خصر",
  Callback = function()
local args = {
    [1] = {
        [1] = 74302534603111,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})


AddButton(Main, {
  Name = "بنية جسم",
  Callback = function()
local args = {
    [1] = {
        [1] = 96491916349570,
        [2] = 14854350570,
        [3] = 14854350451,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "بنت جسم",
  Callback = function()
local args = {
    [1] = {
        [1] = 16214246112,
        [2] = 16214249513,
        [3] = 16214251181,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم بنت",
  Callback = function()
local args = {
    [1] = {
        [1] = 15539008532,
        [2] = 15539008875,
        [3] = 15539008680,
        [4] = 15539008795,
        [5] = 15539011945,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم بنت",
  Callback = function()
local args = {
    [1] = {
        [1] = 14861800638,
        [2] = 14861800626,
        [3] = 14861801452,
        [4] = 14861800627,
        [5] = 14861801454,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم ولد",
  Callback = function()
local args = {
    [1] = {
        [1] = 17754346388,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم ولد ضعيفم",
  Callback = function()
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})


AddButton(Main, {
  Name = "جسم ولد كوبي",
  Callback = function()
local args = {
    [1] = {
        [1] = 86499666,
        [2] = 27112039,
        [3] = 27112052,
        [4] = 27112068,
        [5] = 27112056,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "جسم ولد رول",
  Callback = function()
local args = {
    [1] = {
        [1] = 27112025,
        [2] = 27112039,
        [3] = 27112052,
        [4] = 3230472745,
        [5] = 3230470862,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "سيغما بوي",
  Callback = function()
local args = {
    [1] = {
        [1] = 18178775358,
        [2] = 18178775182,
        [3] = 18178775725,
        [4] = 18178777453,
        [5] = 18178775695,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end})

AddButton(Main, {
  Name = "جسم قزم ",
  Callback = function()
local args = {
    [1] = {
        [1] = 14579958702,
        [2] = 14579959062,
        [3] = 14579959191,
        [4] = 14579959249,
        [5] = 14579963667,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم قزم2",
  Callback = function()
local args = {
    [1] = {
        [1] = 77813057823038,
        [2] = 135110043370135,
        [3] = 116607813654019,
        [4] = 138966229804486,
        [5] = 128961183894053,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})
AddButton(Main, {
  Name = "3جسم قزم",
  Callback = function()
local args = {
    [1] = {
        [1] = 120973199097564,
        [2] = 118345433416023,
        [3] = 112849465115864,
        [4] = 78321005147549,
        [5] = 106586789635639,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end
})
AddButton(Main, {
  Name = "جسم قزم",
  Callback = function()
local args = {
    [1] = {
        [1] = 126267841602936,
        [2] = 77530451194918,
        [3] = 123471958406889,
        [4] = 117042768644173,
        [5] = 131948590344338,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})
AddButton(Main, {
  Name = "الهامستر",
  Callback = function()
  local args = {
    [1] = {
        [1] = 14898536974,
        [2] = 14898536957,
        [3] = 14898537277,
        [4] = 14898537300,
        [5] = 14898537292,
        [6] = 14898536975
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

local Main = MakeTab({Name = "3dملابس"})
AddButton(Main, {
  Name = "قفازات ايد سوداء",
  Callback = function()
  local args = {
    [1] = 9239689111
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سترة سوداء",
  Callback = function()
  local args = {
    [1] = 89892588488089
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سترة وردي كيوت",
  Callback = function()
  local args = {
    [1] = 10789914680
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات ايد سودة 1",
  Callback = function()
  local args = {
    [1] = 10789914680
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات ايد سودة 2",
  Callback = function()
  local args = {
    [1] = 11363898043
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات ايد سودة 3",
  Callback = function()
  local args = {
    [1] = 10791180072
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات ايد بيضة",
  Callback = function()
  local args = {
    [1] = 10871965173
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات يد زهري",
  Callback = function()
  local args = {
    [1] = 10789939838
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات يد حمراء",
  Callback = function()
  local args = {
    [1] = 12379676852
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "بنطال للاولاد",
  Callback = function()
  local args = {
    [1] = 17105772334
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "سروال وقميص للبنات",
  Callback = function()
  local args = {
    [1] = 17293916545
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "بدله قطه",
  Callback = function()
  local args = {
    [1] = 16300856317
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "بدله ازرق يجنن",
  Callback = function()
  local args = {
    [1] = 96388463686232
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "تنوره",
  Callback = function()
  local args = {
    [1] = 84064859085947
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "شماغ",
  Callback = function()
  local args = {
    [1] = 12268509034
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "شماغ2",
  Callback = function()
  local args = {
    [1] = 127976569479968
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قبعه",
  Callback = function()
  local args = {
    [1] = 17815399600
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "شعر حرير للبنات",
  Callback = function()
  local args = {
    [1] = 104921728103376
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "ذهب للاولاد",
  Callback = function()
  local args = {
    [1] = 120686477368913
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قلاده للبنات",
  Callback = function()
  local args = {
    [1] = 18925315079
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

local Main = MakeTab({Name = "الاعب"})

local section = AddSection(Main, {"تقدر تتحكم في لاعبك"})

AddButton(Main, {
  Name = "اضغط لنسخ حسابي تيك توك لأي استفسار",
  Callback = function()
    setclipboard("ghali33") 
  end
})

AddTextBox(Main, {
    Name = "سرعة ",
    Default = "",
    PlaceholderText = "هــنــا",
    ClearText = true,
    Callback = function(value)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value     
   end
  })
  AddTextBox(Main, {
    Name = "قفز ",
    Default = "",
    PlaceholderText = "هــنــا",
    ClearText = true,
    Callback = function(value)
  game.Players.LocalPlayer.Character.Humanoid.JumpPower = value    
    end
  })
  AddTextBox(Main, {
    Name = "ابعاد الشاشه",
    Default = "",
    PlaceholderText = "هــنــا",
    ClearText = true,
    Callback = function(value)
  local FovNumber = value
  local Camera = workspace.CurrentCamera
  Camera.FieldOfView = FovNumber  
    end
  })
  AddTextBox(Main, {
    Name = " دوران",
    Default = "",
    PlaceholderText = "هــنــا",
    ClearText = true,
    Callback = function(Value)
      getgenv().Spinspeed = Value
  
  local Spin = Instance.new'BodyAngularVelocity'
  Spin.Parent = game:GetService'Players'.LocalPlayer.Character:FindFirstChild'HumanoidRootPart'
  Spin.MaxTorque = Vector3.new(0, math.huge, 100)
  wait(0.1)
  Spin.AngularVelocity = Vector3.new(100,Spinspeed,0)
    end
  })


AddButton(Main, {
  Name = "امر تعليق السيرفر",
  Callback = function()
tools = "FireX"
        shutdownserver = true
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
            task.wait()
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
        if game:GetService("Workspace"):FindFirstChild("Camera") then
            game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
        end
        wait(0.1)
        if game:GetService("Workspace"):FindFirstChild("Camera") then
            game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
        end
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.CFrame + Vector3.new(0, -15, 0)
        task.wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        ddos = true
        for i = 1, 1350 do
            task.wait()
            if ddos == false then
                local args = {
                    [1] = "ClearAllTools"
                }
 
                cleartoolremote:FireServer(unpack(args))
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999, -475, 9999)
                return
            end
            if game:GetService("Workspace"):FindFirstChild("Camera") then
                game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
            end
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools) then
                game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools):Destroy()
            end
            if ddos == false then return end
            fireclickdetector(game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.ClickDetector, 0)
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -475, 0)
  end
})
AddButton(Main, {
  Name = "طرد الكل ",
  Callback = function()
    local player = game.Players.LocalPlayer
        player:Kick("😂الحلو صدق😂")
  end
})
AddButton(Main, {
  Name = "امر تدمير العالم",
  Callback = function()
    game.Workspace:ClearAllChildren()
  end
})

local infiniteJumpEnabled = false

-- Conectar o evento de pulo somente uma vez
local infiniteJumpConnection

-- Função de callback para o botão de alternância de pulo infinito
local function onInfiniteJumpToggle(value)
    infiniteJumpEnabled = value
    print("Infinite Jump Enabled:", infiniteJumpEnabled)
    
    -- Conectar o evento de pulo somente uma vez
    if not infiniteJumpConnection then
        infiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            if infiniteJumpEnabled then
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character and character:FindFirstChildOfClass("Humanoid") then
                    character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end
        end)
    end
end

-- Adiciona o botão de alternância "Infinitejump"
local Toggle = AddToggle(Main, {
    Name = "قفز لا نهائي ",
    Default = false,
    Callback = onInfiniteJumpToggle
})
function MakeNotifi(notification)
    game.StarterGui:SetCore("SendNotification", {
        Title = notification.Title;
        Text = notification.Text;
        Duration = notification.Time;
    })
end

AddButton(Main, {
  Name = "اختفاء اللاعب",
  Callback = function()
    local args = {
    [1] = "CharacterSizeUp",
    [2] = 6
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "إلغاء اختفاء",
  Callback = function()
    local args = {
    [1] = "CharacterSizeUp",
    [2] = 1
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
-- Variável para controlar o estado do Noclip
local noclipEnabled = false
local runService = game:GetService("RunService")

-- Função para definir CanCollide para todas as partes do personagem
local function setCharacterCanCollide(character, canCollide)
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = canCollide
        end
    end
end

-- Função de callback para o botão de alternância de Noclip
local function onNoclipToggle(value)
    noclipEnabled = value
    print("Noclip Enabled:", noclipEnabled)
    
    local player = game.Players.LocalPlayer
    local character = player.Character

    if noclipEnabled then
        -- Inicia um loop para continuamente definir CanCollide
        noclipLoop = runService.Stepped:Connect(function()
            if character then
                setCharacterCanCollide(character, false)
            end
        end)
    else
        -- Desativa o loop e restaura CanCollide
        if noclipLoop then
            noclipLoop:Disconnect()
        end
        if character then
            setCharacterCanCollide(character, true)
        end
    end
end

-- Adiciona o botão de alternância "Noclip"
local Toggle = AddToggle(Main, {
    Name = " اخترق الجدار",
    Default = false,
    Callback = onNoclipToggle
})

AddButton(Main, {
  Name = "فريمات ",
  Callback = function()
    -- FPS and Ping Checker Script (Improved UI with Movable Frame)

-- Create a ScreenGui to display FPS and Ping
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PerformanceGui"
ScreenGui.ResetOnSpawn = false -- Keep the UI persistent across respawns
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame for FPS and Ping display
local displayFrame = Instance.new("Frame")
displayFrame.Size = UDim2.new(0, 250, 0, 100)
displayFrame.Position = UDim2.new(0, 10, 0, 10)
displayFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
displayFrame.BackgroundTransparency = 0.4
displayFrame.BorderSizePixel = 0
displayFrame.Active = true -- Make the frame active for input events
displayFrame.Draggable = true -- Enable draggable frame
displayFrame.Parent = ScreenGui

-- FPS Label
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, -20, 0, 40)
fpsLabel.Position = UDim2.new(0, 10, 0, 10)
fpsLabel.TextColor3 = Color3.new(1, 1, 1)
fpsLabel.TextStrokeTransparency = 0.7
fpsLabel.TextSize = 24
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: Loading..."
fpsLabel.Parent = displayFrame

-- Ping Label
local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(1, -20, 0, 40)
pingLabel.Position = UDim2.new(0, 10, 0, 50)
pingLabel.TextColor3 = Color3.new(1, 1, 1)
pingLabel.TextStrokeTransparency = 0.7
pingLabel.TextSize = 24
pingLabel.Font = Enum.Font.SourceSansBold
pingLabel.TextXAlignment = Enum.TextXAlignment.Left
pingLabel.BackgroundTransparency = 1
pingLabel.Text = "Ping: Loading..."
pingLabel.Parent = displayFrame

-- FPS Checker
local fps = 0
local lastTime = tick()

game:GetService("RunService").RenderStepped:Connect(function()
    fps = math.floor(1 / (tick() - lastTime))
    lastTime = tick()
    fpsLabel.Text = "FPS: " .. tostring(fps)
end)

-- Ping Checker
local function getPing()
    local player = game.Players.LocalPlayer
    local ping = player:GetNetworkPing() * 1000 -- Convert to milliseconds
    return math.floor(ping)
end

game:GetService("RunService").Stepped:Connect(function()
    local ping = getPing()
    pingLabel.Text = "Ping: " .. tostring(ping) .. " ms"
end)

-- Optional: Auto-adjust label colors based on performance
game:GetService("RunService").Stepped:Connect(function()
    if fps < 30 then
        fpsLabel.TextColor3 = Color3.new(1, 0, 0) -- Red for low FPS
    else
        fpsLabel.TextColor3 = Color3.new(0, 1, 0) -- Green for good FPS
    end

    if getPing() > 200 then
        pingLabel.TextColor3 = Color3.new(1, 0, 0) -- Red for high ping
    else
        pingLabel.TextColor3 = Color3.new(0, 1, 0) -- Green for good ping
    end
end)

-- Optional: Saving frame position locally
local function savePosition()
    local pos = displayFrame.Position
    -- Save the position to a datastore or local storage (optional implementation)
end

-- Saving the position when dragging stops
displayFrame.MouseLeave:Connect(savePosition)
displayFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        savePosition()
    end
end)
    end
    })

local Main = MakeTab({Name = "تنقل"})

local Paragraph = AddParagraph(Main, {"ادوات التنقل", "bom dia meus manos"})
 
local plrs = game.Players
 
-- Fetch all player names
local playerNames = {}
local players = plrs:GetPlayers()
 
for _, player in ipairs(players) do
    table.insert(playerNames, player.Name)
end
 
local Dropdown = AddDropdown(Main, {
  Name = playerNames[1] or "No Players",
  Options = playerNames,
  Default = "2",
  Callback = function(selectedplrName)
    plrs:FindFirstChild(selectedplrName)
        local targetPlayer = plrs:FindFirstChild(selectedplrName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            -- Teleporting your character to the selected player's position
            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local localPlayerRoot = plrs.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
 
            if localPlayerRoot then
                localPlayerRoot.CFrame = CFrame.new(targetPosition)
            end
        end
        print(selectedplrName)
 
  end
})
AddButton(Main, {
  Name = "تنقل ",
  Callback = function()
    mouse = game.Players.LocalPlayer:GetMouse() 

tool = Instance.new("Tool") 

tool.RequiresHandle = false 

tool.Name = "اداة تنقل| by ghali" 

tool.Activated:connect(function() 

local pos = mouse.Hit+Vector3.new(0,2.5,0) 

pos = CFrame.new(pos.X,pos.Y,pos.Z) 

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos 

end) 

tool.Parent = game.Players.LocalPlayer.Backpack
  end
})
local Slider = AddSlider(Main, {
  Name = "مسافة تنقل",
  MinValue = 10,
  MaxValue = 50,
  Default = 25,
  Increase = 1,
  Callback = function(Value)
    
  end
})
local Paragraph = AddParagraph(Main, {"جميع البيوت", "bom dia meus manos"})

-- Function to teleport to Teleport
local function teleportTohome1()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(258, 5, 222)
end

AddButton(Main, {
  Name = "البيت 1",
  Description = "",
  Callback = teleportTohome1
})

-- Function to teleport to Teleport
local function teleportTohome2()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(221, 5, 230)
end

AddButton(Main, {
  Name = "البيت 2",
  Description = "",
  Callback = teleportTohome2
})

-- Function to teleport to Teleport
local function teleportTohome3()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(262, 20, 223)
end

AddButton(Main, {
  Name = "البيت 3",
  Description = "",
  Callback = teleportTohome3
})

-- Function to teleport to Teleport
local function teleportTohome4()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(222, 20, 226)
end

AddButton(Main, {
  Name = "البيت 4",
  Description = "",
  Callback = teleportTohome4
})

-- Function to teleport to Teleport
local function teleportTohome5()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(159, 20, 226)
end

AddButton(Main, {
  Name = "البيت 5",
  Description = "",
  Callback = teleportTohome5
})

-- Function to teleport to Teleport
local function teleportTohome6()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-34, 17, -119)
end

AddButton(Main, {
  Name = "البيت 6",
  Description = "",
  Callback = teleportTohome6
})

-- Function to teleport to Teleport
local function teleportTohome7()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-38, 33, -119)
end

AddButton(Main, {
  Name = "البيت 7",
  Description = "",
  Callback = teleportTohome7
})

-- Function to teleport to Teleport
local function teleportTohome11()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-21, 32, 436)
end

AddButton(Main, {
  Name = "البيت 11",
  Description = "",
  Callback = teleportTohome11
})

-- Function to teleport to Teleport
local function teleportTohome12()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(155, 32, 433)
end

AddButton(Main, {
  Name = "البيت 12",
  Description = "",
  Callback = teleportTohome12
})

-- Function to teleport to Teleport
local function teleportTohome13()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(255, 33, 431)
end

AddButton(Main, {
  Name = "البيت 13",
  Description = "",
  Callback = teleportTohome13
})

-- Function to teleport to Teleport
local function teleportTohome14()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(245, 32, 394)
end

AddButton(Main, {
  Name = "البيت 14",
  Description = "",
  Callback = teleportTohome14
})

-- Function to teleport to Teleport
local function teleportTohome15()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145, 32, 391)
end

AddButton(Main, {
  Name = "البيت 15",
  Description = "",
  Callback = teleportTohome15
})

-- Function to teleport to Teleport
local function teleportTohome16()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-24, 32, 390)
end

AddButton(Main, {
  Name = "البيت 16",
  Description = "",
  Callback = teleportTohome16
})

-- Function to teleport to Teleport
local function teleportTohome17()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-185, 32, -248)
end

AddButton(Main, {
  Name = "البيت 17",
  Description = "",
  Callback = teleportTohome17
})

-- Function to teleport to Teleport
local function teleportToGasStation()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(192, 4, 272)
end

-- Function to teleport to Teleport
local function teleportTohome18()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-346, 32, -248)
end

AddButton(Main, {
  Name = "البيت 18",
  Description = "",
  Callback = teleportTohome18
})

-- Function to teleport to Teleport
local function teleportTohome20()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-460, 32, -291)
end

AddButton(Main, {
  Name = "البيت 20",
  Description = "",
  Callback = teleportTohome20
})

-- Function to teleport to Teleport
local function teleportTohome21()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-353, 32, -291)
end

AddButton(Main, {
  Name = "البيت 21",
  Description = "",
  Callback = teleportTohome21
})

-- Function to teleport to Teleport
local function teleportTohome22()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-193, 32, -291)
end

AddButton(Main, {
  Name = "البيت 22",
  Description = "",
  Callback = teleportTohome22
})

-- Function to teleport to Teleport
local function teleportTohome23()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-409, 64, -441)
end

AddButton(Main, {
  Name = "البيت 23",
  Description = "",
  Callback = teleportTohome23
})

-- Function to teleport to Teleport
local function teleportTohome24()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-359, 63, -495)
end

AddButton(Main, {
  Name = "البيت 24",
  Description = "",
  Callback = teleportTohome24
})

-- Function to teleport to Teleport
local function teleportTohome28()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-98, 1, 1075)
end

AddButton(Main, {
  Name = "البيت 28",
  Description = "",
  Callback = teleportTohome28
})

-- Function to teleport to Teleport
local function teleportTohome29()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-733, 1, 778)
end

AddButton(Main, {
  Name = "البيت 29",
  Description = "",
  Callback = teleportTohome29
})

-- Function to teleport to Teleport
local function teleportTohome30()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-232, -4 , 788)
end

AddButton(Main, {
  Name = "البيت 30",
  Description = "",
  Callback = teleportTohome30
})

-- Function to teleport to Teleport
local function teleportTohome31()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(611, 72, -333)
end

AddButton(Main, {
  Name = "البيت 31",
  Description = "",
  Callback = teleportTohome31
})

-- Function to teleport to Teleport
local function teleportTohome32()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-878, 1, -344)
end

AddButton(Main, {
  Name = "البيت 32",
  Description = "",
  Callback = teleportTohome32
})

-- Function to teleport to Teleport
local function teleportTohome33()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-144, 64, -417)
end

AddButton(Main, {
  Name = "البيت 33",
  Description = "",
  Callback = teleportTohome33
})

-- Function to teleport to Teleport
local function teleportTohome34()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(261, 32, 566)
end

AddButton(Main, {
  Name = "البيت 34",
  Description = "",
  Callback = teleportTohome34
})

-- Function to teleport to Teleport
local function teleportTohome35()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31, 0, 2210)
end

AddButton(Main, {
  Name = "البيت 35",
  Description = "",
  Callback = teleportTohome35
})

-- Function to teleport to Teleport
local function teleportTohome36()
  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(249, 21, -2295)
end

AddButton(Main, {
  Name = "البيت 36",
  Description = "",
  Callback = teleportTohome36
})

AddButton(Main, {
    Name = "خلف البيوت",
    Description = "",
    Callback = teleportToGasStation
})

-- Function to teleport to Teleport
local function teleportToCenter()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136, 4, 117)
end

AddButton(Main, {
    Name = "امام البيوت",
    Description = "",
    Callback = teleportToCenter
})

-- Function to teleport to Criminal
local function teleportToCriminal()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-119, -28, 235)
end

local Paragraph = AddParagraph(Main, {"اماكن ثانيه", "bom dia meus manos"})

AddButton(Main, {
    Name = "مكان اسلحة",
    Description = "Teleporta para as coordenadas do Criminal",
    Callback = teleportToCriminal
})

-- Function to teleport to House Abandoned
local function teleportToHouseAbandoned()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(986, 4, 63)
end

AddButton(Main, {
    Name = "بيت مسكون",
    Description = "Teleporta para as coordenadas da Casa Abandonada",
    Callback = teleportToHouseAbandoned
})

-- Function to teleport to Portal Agency
local function teleportToPortalAgency()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(672, 4, -296)
end

AddButton(Main, {
    Name = "مكان سري",
    Description = "Teleporta para as coordenadas do Portal da Agência",
    Callback = teleportToPortalAgency
})

-- Function to teleport to Brooks Diner
local function teleportToBrooksDiner()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(161, 8, 52)
end

AddButton(Main, {
    Name = "قهوة",
    Description = "Teleporta para as coordenadas do Brooks Diner",
    Callback = teleportToBrooksDiner
})

local function teleportToBrooksDiner()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-26, 4, -23)
end

AddButton(Main, {
    Name = "البداية",
    Description = "Teleporta para as coordenadas do Brooks Diner",
    Callback = teleportToBrooksDiner
})
-- Function to teleport to Hospital
local function teleportToHospital()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-309, 4, 71)
end

AddButton(Main, {
    Name = "مستشفى",
    Description = "Teleporta para as coordenadas do Hospital",
    Callback = teleportToHospital
})

-- Function to teleport to Arch
local function teleportToArch()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-589, 141, -59)
end

AddButton(Main, {
    Name = "فوق الجسر",
    Description = "Teleporta para as coordenadas do Arco",
    Callback = teleportToArch
})

-- Function to teleport to Agency
local function teleportToAgency()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(179, 4, -464)
end

AddButton(Main, {
    Name = "مكان الكهرباء",
    Description = "Teleporta para as coordenadas da Agência",
    Callback = teleportToAgency
})

-- Function to teleport to Secret Room in Workshop
local function teleportToSecretRoomInWorkshop()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 4, -495)
end

AddButton(Main, {
    Name = "جوه الأرض",
    Description = "Teleporta para as coordenadas da Sala Secreta na Oficina",
    Callback = teleportToSecretRoomInWorkshop
})

-- Function to teleport to Secret Room 2
local function teleportToSecretRoom2()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-343, 4, -613)
end

AddButton(Main, {
    Name = "جوه الأرض 2",
    Description = "Teleporta para as coordenadas da Sala Secreta 2",
    Callback = teleportToSecretRoom2
})
-- Function to teleport to Secret Location
local function teleportToSecretLocation()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(505, -75, 143)
end

AddButton(Main, {
    Name = " 3 جوه الأرض",
    Description = "Teleporta para as coordenadas do Local Secreto",
    Callback = teleportToSecretLocation
})
-- Function to teleport to Island 1
local function teleportToIsland1()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1925, 23, 127)
end

AddButton(Main, {
    Name = "جزيرة 1",
    Description = "Teleporta para as coordenadas da Ilha 1",
    Callback = teleportToIsland1
})

-- Function to teleport to Airport
local function teleportToAirport()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(310, 5, 31)
end

AddButton(Main, {
    Name = "مطار",
    Description = "Teleporta para as coordenadas do Aeroporto",
    Callback = teleportToAirport
})

-- Function to teleport to Hotel Center
local function teleportToHotelCenter()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(182, 4, 150)
end

AddButton(Main, {
    Name = "البيوت",
    Description = "Teleporta para as coordenadas do Centro dos Hotéis",
    Callback = teleportToHotelCenter
})

-- Function to teleport to Lower Houses
local function teleportToLowerHouses()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(63, 35, 410)
end

AddButton(Main, {
    Name = " نص الشارع",
    Description = "Teleporta para as coordenadas das Casas Inferiores",
    Callback = teleportToLowerHouses
})

-- Function to teleport to Mountain 1
local function teleportToMountain1()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-670, 251, 765)
end

AddButton(Main, {
    Name = "فوق الجبل",
    Description = "Teleporta para as coordenadas da Montanha 1",
    Callback = teleportToMountain1
})

-- Function to teleport to On Top of School
local function teleportToOnTopOfSchool()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-370, 50, 173)
end

AddButton(Main, {
    Name = "فوق المدرسة",
    Description = "Teleporta para as coordenadas Em Cima da Escola",
    Callback = teleportToOnTopOfSchool
}) 

local Main = MakeTab({Name = "الاسماء"})


local colors = {
    Color3.fromRGB(255, 0, 0),    
    Color3.fromRGB(255, 127, 0),  
    Color3.fromRGB(255, 255, 0),  
    Color3.fromRGB(0, 255, 0),    
    Color3.fromRGB(0, 0, 255),   
    Color3.fromRGB(75, 0, 130),   

    Color3.fromRGB(148, 0, 211),  
}

local rainbowRunning = false

AddButton(Main, {
    Name = "اسم ملون",
    Callback = function()
        if rainbowRunning then return end
        rainbowRunning = true

        task.spawn(function()
            while rainbowRunning do
                for _, color in ipairs(colors) do
                    local args = {
                        [1] = "PickingRPNameColor",
                        [2] = color,
                    }

                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
