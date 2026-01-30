local RemoteObjects = {}
local ViewportSize = workspace.Camera.ViewportSize
local TweenService = game:GetService("TweenService")
local TweenInfo = Instance.new
local BlurEffect = Instance.new("BlurEffect", game:GetService("Lighting"))
BlurEffect.Size = 0.1
local Highlight = Instance.new("Highlight", game.workspace)
Highlight.FillTransparency = 2
Highlight.OutlineTransparency = 2
Highlight.FillColor = Color3.fromRGB(0, 0, 0)
Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
RemoteObjects["1"] = Instance.new("ScreenGui", game.CoreGui)
RemoteObjects["1"].Name = "intro"
RemoteObjects["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
RemoteObjects["1"]["2"] = Instance.new("ImageLabel", RemoteObjects["1"])
RemoteObjects["1"]["2"].BorderSizePixel = 0
RemoteObjects["1"]["2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RemoteObjects["1"]["2"].Image = "rbxassetid://11963368259"
RemoteObjects["1"]["2"].Size = UDim2.new(0, 140, 0, 140)
RemoteObjects["1"]["2"].BorderColor3 = Color3.fromRGB(0, 0, 0)
RemoteObjects["1"]["2"].Name = "icon"
RemoteObjects["1"]["2"].BackgroundTransparency = 2
RemoteObjects["1"]["2"].ImageTransparency = 2
RemoteObjects["1"]["2"].Position = UDim2.fromOffset(ViewportSize.X / 2 - RemoteObjects["1"]["2"].Size.X.Offset / 2, ViewportSize.Y / 2 - RemoteObjects["1"]["2"].Size.Y.Offset / 2)
wait(1)
Highlight.FillTransparency = 2
Highlight.OutlineTransparency = 2
TweenService:Create(Highlight, TweenInfo(1), {
   FillTransparency = 0.5
}):Play()
TweenService:Create(Highlight, TweenInfo(1), {
   OutlineTransparency = 0
}):Play()
TweenService:Create(BlurEffect, TweenInfo(1), {
   Size = 25
}):Play()
TweenService:Create(RemoteObjects["1"]["2"], TweenInfo(1), {
   ImageTransparency = 0
}):Play()
wait(2)
TweenService:Create(RemoteObjects["1"]["2"], TweenInfo(1), {
   ImageTransparency = 2
}):Play()
TweenService:Create(BlurEffect, TweenInfo(1), {
   Size = 0.1
}):Play()
TweenService:Create(Highlight, TweenInfo(1), {
   FillTransparency = 2
}):Play()
TweenService:Create(Highlight, TweenInfo(1), {
   OutlineTransparency = 2
}):Play()
wait(2)
BlurEffect:Destroy()
Highlight:Destroy()
RemoteObjects["1"]:Destroy()
for var0, var1 in pairs(game.CoreGui:GetChildren()) do
   if var1.Name == "AtomicUi" or var1.Name == "Abyss" or var1.Name == "FlyGui" or var1.Name == "OpenButton" then
      var1:Destroy()
   end
end
local function PlayerTargeting(playerOrName)
   local targets = {
      playerOrName
   }
   local Players = game:GetService("Players")
   local LocalPlayer = Players.LocalPlayer
   local targetOthers = false
   local function GetPlayer(name)
      name = name:lower()
      if name == "all" or name == "others" then
         targetOthers = true
         return
      end
      if name == "random" then
         local allPlayers = Players:GetPlayers()
         if table.find(allPlayers, LocalPlayer) then
            table.remove(allPlayers, table.find(allPlayers, LocalPlayer))
         end
         return allPlayers[math.random(#allPlayers)]
      end
      if name ~= "random" and name ~= "all" and name ~= "others" then
         for _, player in next, Players:GetPlayers() do
            if player ~= LocalPlayer then
               if player.Name:lower():match("^"..name) then
                  return player
               end
               if player.DisplayName:lower():match("^"..name) then
                  return player
               end
            end
         end
      else
         return
      end
   end
   local function KillPlayer(targetPlayer)
      local character = LocalPlayer.Character
      local humanoid = not character or character:FindFirstChildOfClass("Humanoid")
      local rootPart = not humanoid or humanoid.RootPart
      local targetCharacter = targetPlayer.Character
      local targetHumanoid = nil
      local targetRootPart = nil
      local targetHead = nil
      local targetAccessory = nil
      local targetHandle = nil
      if targetCharacter:FindFirstChildOfClass("Humanoid") then
         targetHumanoid = targetCharacter:FindFirstChildOfClass("Humanoid")
      end
      if targetHumanoid and targetHumanoid.RootPart then
         targetRootPart = targetHumanoid.RootPart
      end
      if targetCharacter:FindFirstChild("Head") then
         targetHead = targetCharacter.Head
      end
      if targetCharacter:FindFirstChildOfClass("Accessory") then
         targetAccessory = targetCharacter:FindFirstChildOfClass("Accessory")
      end
      if targetAccessory and targetAccessory:FindFirstChild("Handle") then
         targetHandle = targetAccessory.Handle
      end
      if character and humanoid and rootPart then
         if rootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = rootPart.CFrame
         end
         if targetHumanoid and targetHumanoid.Sit and not targetOthers then
            return
         end
         if targetHead then
            workspace.CurrentCamera.CameraSubject = targetHead
         else
            if not targetHead and targetHandle then
               workspace.CurrentCamera.CameraSubject = targetHandle
            else
               if targetHumanoid and targetRootPart then
                  workspace.CurrentCamera.CameraSubject = targetHumanoid
               end
            end
         end
         if not targetCharacter:FindFirstChildWhichIsA("BasePart") then
            return
         end
         do
            local function MoveCharacter(part, cframeRotation, cframeAngle)
               rootPart.CFrame = CFrame.new(part.Position) * cframeRotation * cframeAngle
               character:SetPrimaryPartCFrame(CFrame.new(part.Position) * cframeRotation * cframeAngle)
               rootPart.Velocity = Vector3.new(90000000, 900000000, 90000000)
               rootPart.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
            end
            local function DoFly(part)
               local flyDuration = 2
               local startTime = tick()
               local addedHeight = 0
               rootPart
               if targetHumanoid then
                  if part.Velocity.Magnitude < 50 then
                     addedHeight = addedHeight + 100
                     MoveCharacter(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(addedHeight), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, -1.5, 0) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(addedHeight), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(2.25, 1.5, -2.25) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(addedHeight), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(-2.25, -1.5, 2.25) + targetHumanoid.MoveDirection * part.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(addedHeight), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, 1.5, 0) + targetHumanoid.MoveDirection, CFrame.Angles(math.rad(addedHeight), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, -1.5, 0) + targetHumanoid.MoveDirection, CFrame.Angles(math.rad(addedHeight), 0, 0))
                     task.wait()
                  else
                     MoveCharacter(part, CFrame.new(0, 1.5, targetHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, -1.5, -targetHumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, 1.5, targetHumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, 1.5, rootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, -1.5, -rootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, 1.5, rootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                     task.wait()
                     MoveCharacter(part, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                     task.wait()
                  end
               end
               500 >= part.Velocity.Magnitude
               part.Parent == targetCharacter
               targetPlayer.Parent == Players
               not targetCharacter ~= targetCharacter
               not targetHumanoid.Sit
               humanoid.Health > 0
               tick() > startTime + flyDuration
            end
            workspace.FallenPartsDestroyHeight = 0 / 0
            local BodyVelocity = Instance.new("BodyVelocity")
            BodyVelocity.Name = "EpixVel"
            BodyVelocity.Parent = rootPart
            BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
            BodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            if targetRootPart and targetHead then
               if 5 < targetRootPart.CFrame.p - targetHead.CFrame.p.Magnitude then
                  DoFly(targetHead)
               else
                  DoFly(targetRootPart)
               end
            else
               if targetRootPart and not targetHead then
                  DoFly(targetRootPart)
               else
                  if not targetRootPart and targetHead then
                     DoFly(targetHead)
                  else
                     if not targetRootPart and not targetHead and targetAccessory and targetHandle then
                        DoFly(targetHandle)
                     else
                        return
                     end
                  end
               end
            end
            BodyVelocity:Destroy()
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            workspace.CurrentCamera.CameraSubject = humanoid
            repeat
               rootPart.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)
               character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, 0.5, 0))
               humanoid:ChangeState("GettingUp")
               table.foreach(character:GetChildren(), function(obj, prop)
                  if prop:IsA("BasePart") then
                     prop.Velocity, prop.RotVelocity = Vector3.new(), Vector3.new()
                  end
               end)
               task.wait()
            until rootPart.Position - getgenv().OldPos.p.Magnitude < 25
            workspace.FallenPartsDestroyHeight = getgenv().FPDH
         end
      end
   end
end
local QueueOnTeleport = (syn and syn.queue_on_teleport) or queue_on_teleport or not fluxus or fluxus.queue_on_teleport
local GuiObjects = {}
local Toggles = {}
local LocalPlayer = game.Players.LocalPlayer
local PlayerCharacter = game.Players.LocalPlayer.Character
local PlayerHumanoid = not PlayerCharacter or PlayerCharacter:FindFirstChildWhichIsA("Humanoid")
local IsActive = false
local SpeedMultiplier = 1
local FlyGui = Instance.new("ScreenGui")
local FlyButton = Instance.new("ImageButton")
local FlyButtonCorner = Instance.new("UICorner")
FlyGui.Name = "FlyGui"
FlyGui.Parent = game.CoreGui
FlyButton.Parent, FlyGui.ZIndexBehavior = FlyGui, Enum.ZIndexBehavior.Sibling
FlyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FlyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyButton.BorderSizePixel = 0
FlyButton.Position = UDim2.new(0.929370999, 0, 0.510522664, 0)
FlyButton.Size = UDim2.new(0, 40, 0, 40)
FlyButton.Image = "rbxassetid://11419709766"
FlyButtonCorner.Parent, FlyButton.Visible = FlyButton, false
FlyButton.MouseButton1Down:connect(function()
   if IsActive == true then
      IsActive = false
      FlyButton.Image = "rbxassetid://11419709766"
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
      LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
   else
      IsActive = true
      FlyButton.Image = "rbxassetid://11419719540"
      for i = 1, SpeedMultiplier, 1 do
         spawn(function()
            local RunService = game:GetService("RunService").Heartbeat
            tpwalking = true
            local character = game.Players.LocalPlayer.Character
            local humanoid = not character or character:FindFirstChildWhichIsA("Humanoid")
            while tpwalking and RunService:Wait() and character and humanoid and humanoid.Parent do
               if 0 < humanoid.MoveDirection.Magnitude then
                  character:TranslateBy(humanoid.MoveDirection)
               end
            end
         end)
      end
      LocalPlayer.Character.Animate.Disabled = true
      local character = LocalPlayer.Character
      local humanoid = character:FindFirstChildOfClass("Humanoid") or character:FindFirstChildOfClass("AnimationController")
      for _, animationTrack in ipairs(humanoid:GetPlayingAnimationTracks()) do
         animationTrack:AdjustSpeed(0)
      end
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
      LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
   end
   if game:GetService("Players").LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
      local char = LocalPlayer
      local torso = char.Character.Torso
      local canFly = true
      local canMove = true
      local directionalForces = {
         f = 0, b = 0, l = 0, r = 0
      }
      local lastDirectionalForces = {
         f = 0, b = 0, l = 0, r = 0
      }
      local maxSpeed = 50
      local currentSpeed = 0
      local bodyGyro = Instance.new("BodyGyro", torso)
      bodyGyro.P = 90000
      bodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyGyro.cframe = torso.CFrame
      local bodyVelocity = Instance.new("BodyVelocity", torso)
      bodyVelocity.velocity = Vector3.new(0, 0.1, 0)
      bodyVelocity.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)
      if IsActive == true then
         LocalPlayer.Character.Humanoid.PlatformStand = true
      end
      while IsActive == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
         game:GetService("RunService").RenderStepped:Wait()
         if directionalForces.l + directionalForces.r ~= 0 or directionalForces.f + directionalForces.b ~= 0 then
            currentSpeed = currentSpeed + 0.5 + currentSpeed / maxSpeed
            if maxSpeed < currentSpeed then
               currentSpeed = maxSpeed
            end
         else
            if directionalForces.l + directionalForces.r == 0 and directionalForces.f + directionalForces.b == 0 and currentSpeed ~= 0 then
               currentSpeed = currentSpeed - 1
               if currentSpeed < 0 then
                  currentSpeed = 0
               end
            end
         end
         if directionalForces.l + directionalForces.r ~= 0 or directionalForces.f + directionalForces.b ~= 0 then
            bodyVelocity.velocity = game.Workspace.CurrentCamera.CoordinateFrame.lookVector * directionalForces.f + directionalForces.b + game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(directionalForces.l + directionalForces.r, directionalForces.f + directionalForces.b * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p * currentSpeed
            lastDirectionalForces = {
               f = directionalForces.f, b = directionalForces.b, l = directionalForces.l, r = directionalForces.r
            }
         else
            if directionalForces.l + directionalForces.r == 0 and directionalForces.f + directionalForces.b == 0 and currentSpeed ~= 0 then
               bodyVelocity.velocity = game.Workspace.CurrentCamera.CoordinateFrame.lookVector * lastDirectionalForces.f + lastDirectionalForces.b + game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastDirectionalForces.l + lastDirectionalForces.r, lastDirectionalForces.f + lastDirectionalForces.b * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p * currentSpeed
            else
               bodyVelocity.velocity = Vector3.new(0, 0, 0)
            end
         end
         bodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(directionalForces.f + directionalForces.b * 50 * currentSpeed / maxSpeed), 0, 0)
      end
      directionalForces = {
         f = 0, b = 0, l = 0, r = 0
      }
      lastDirectionalForces = {
         f = 0, b = 0, l = 0, r = 0
      }
      currentSpeed = 0
      bodyGyro:Destroy()
      bodyVelocity:Destroy()
      LocalPlayer.Character.Humanoid.PlatformStand = false
      LocalPlayer.Character.Animate.Disabled = false
      tpwalking = false
   else
      local char = LocalPlayer
      local torso = char.Character.UpperTorso
      local canFly = true
      local canMove = true
      local directionalForces = {
         f = 0, b = 0, l = 0, r = 0
      }
      local lastDirectionalForces = {
         f = 0, b = 0, l = 0, r = 0
      }
      local maxSpeed = 50
      local currentSpeed = 0
      local bodyGyro = Instance.new("BodyGyro", torso)
      bodyGyro.P = 90000
      bodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
      bodyGyro.cframe = torso.CFrame
      local bodyVelocity = Instance.new("BodyVelocity", torso)
      bodyVelocity.velocity = Vector3.new(0, 0.1, 0)
      bodyVelocity.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)
      if IsActive == true then
         LocalPlayer.Character.Humanoid.PlatformStand = true
      end
      while IsActive == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
         wait()
         if directionalForces.l + directionalForces.r ~= 0 or directionalForces.f + directionalForces.b ~= 0 then
            currentSpeed = currentSpeed + 0.5 + currentSpeed / maxSpeed
            if maxSpeed < currentSpeed then
               currentSpeed = maxSpeed
            end
         else
            if directionalForces.l + directionalForces.r == 0 and directionalForces.f + directionalForces.b == 0 and currentSpeed ~= 0 then
               currentSpeed = currentSpeed - 1
               if currentSpeed < 0 then
                  currentSpeed = 0
               end
            end
         end
         if directionalForces.l + directionalForces.r ~= 0 or directionalForces.f + directionalForces.b ~= 0 then
            bodyVelocity.velocity = game.Workspace.CurrentCamera.CoordinateFrame.lookVector * directionalForces.f + directionalForces.b + game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(directionalForces.l + directionalForces.r, directionalForces.f + directionalForces.b * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p * currentSpeed
            lastDirectionalForces = {
               f = directionalForces.f, b = directionalForces.b, l = directionalForces.l, r = directionalForces.r
            }
         else
            if directionalForces.l + directionalForces.r == 0 and directionalForces.f + directionalForces.b == 0 and currentSpeed ~= 0 then
               bodyVelocity.velocity = game.Workspace.CurrentCamera.CoordinateFrame.lookVector * lastDirectionalForces.f + lastDirectionalForces.b + game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastDirectionalForces.l + lastDirectionalForces.r, lastDirectionalForces.f + lastDirectionalForces.b * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p * currentSpeed
            else
               bodyVelocity.velocity = Vector3.new(0, 0, 0)
            end
         end
         bodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad(directionalForces.f + directionalForces.b * 50 * currentSpeed / maxSpeed), 0, 0)
      end
      directionalForces = {
         f = 0, b = 0, l = 0, r = 0
      }
      lastDirectionalForces = {
         f = 0, b = 0, l = 0, r = 0
      }
      currentSpeed = 0
      bodyGyro:Destroy()
      bodyVelocity:Destroy()
      LocalPlayer.Character.Humanoid.PlatformStand = false
      LocalPlayer.Character.Animate.Disabled = false
      tpwalking = false
   end
end)
local AbyssGui = Instance.new("ScreenGui")
AbyssGui.Name = "Abyss"
AbyssGui.Parent = game.CoreGui
AbyssGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GuiObjects.Notify = function(title, text, description, duration)
   local Frame = Instance.new("Frame")
   local Line = Instance.new("Frame")
   local Icon = Instance.new("ImageLabel")
   local IconCorner = Instance.new("UICorner")
   local TitleLabel = Instance.new("TextLabel")
   local DescriptionLabel = Instance.new("TextLabel")
   Frame.Name = "Notification"
   Frame.Parent = AbyssGui
   Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
   Frame.BackgroundTransparency = 0.4
   Frame.BorderSizePixel = 0
   Frame.Position = UDim2.new(1, 5, 0, 75)
   Frame.Size = UDim2.new(0, 450, 0, 60)
   Line.Parent, Line.Name = Frame, "Line"
   Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Line.BorderSizePixel = 0
   Line.Position = UDim2.new(0, 0, 0.938461304, 0)
   Line.Size = UDim2.new(0, 0, 0, 4)
   Icon.Parent, Icon.Name = Frame, "Warning"
   Icon.BackgroundTransparency = 1
   Icon.Position = UDim2.new(0.0258302614, 0, 0.0897435844, 0)
   Icon.Size = UDim2.new(0, 44, 0, 49)
   Icon.Image = "rbxassetid://3944668821"
   Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
   Icon.ScaleType = Enum.ScaleType.Fit
   IconCorner.Parent, IconCorner.CornerRadius = Icon, UDim.new(0, 20)
   TitleLabel.Parent, TitleLabel.Name = Frame, "Title"
   TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TitleLabel.BackgroundTransparency = 1
   TitleLabel.Position = UDim2.new(0.161, 0, 0.155, 0)
   TitleLabel.Text, TitleLabel.Size = title, UDim2.new(0, 205, 0, 15)
   TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
   TitleLabel.TextSize = 12
   TitleLabel.TextStrokeTransparency = 2
   TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
   DescriptionLabel.Name = "Description"
   DescriptionLabel.Parent = Frame
   DescriptionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   DescriptionLabel.BackgroundTransparency = 1
   DescriptionLabel.Position = UDim2.new(0.161, 0, 0.483, 0)
   DescriptionLabel.Size = UDim2.new(0, 205, 0, 18)
   DescriptionLabel.Text = description
   DescriptionLabel.TextColor3 = Color3.fromRGB(199, 199, 199)
   DescriptionLabel.TextSize = 12
   DescriptionLabel.TextStrokeTransparency = 2
   DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
   Frame:TweenPosition(UDim2.new(1, -400, 0, 75), "Out", "Sine", 0.35)
   wait(0.35)
   Line:TweenSize(UDim2.new(0, 450, 0, 4), "Out", "Linear", duration)
   wait(duration)
   Frame:TweenPosition(UDim2.new(1, 5, 0, 75), "Out", "Sine", 0.35)
   wait(0.35)
   Frame:Destroy()
end
Toggles.Win = function(title, content)
   local MainGui = Instance.new("ScreenGui")
   local MainFrame = Instance.new("Frame")
   local FrameCorner = Instance.new("UICorner")
   local FrameStroke = Instance.new("UIStroke")
   local FrameShadow2 = Instance.new("ImageLabel")
   local PagesShadow = Instance.new("ImageLabel")
   local Line = Instance.new("Frame")
   local LineCorner = Instance.new("UICorner")
   local LineStroke = Instance.new("UIStroke")
   local CloseButton = Instance.new("ImageButton")
   local TextLabel = Instance.new("TextLabel")
   local PagesFrame = Instance.new("Frame")
   local PagesCorner = Instance.new("UICorner")
   local PagesStroke = Instance.new("UIStroke")
   local TabsFrame = Instance.new("Frame")
   local TabsCorner = Instance.new("UICorner")
   local TabsStroke = Instance.new("UIStroke")
   local TabsShadow = Instance.new("ImageLabel")
   local TabsScrollingFrame = Instance.new("ScrollingFrame")
   local TabsListLayout = Instance.new("UIListLayout")
   local TabsFixFrame = Instance.new("Frame")
   MainGui.Name = "AtomicUi"
   MainGui.Parent = game.CoreGui
   MainFrame.Parent, MainGui.ZIndexBehavior = MainGui, Enum.ZIndexBehavior.Sibling
   MainFrame.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
   MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
   MainFrame.BorderSizePixel = 0
   MainFrame.Position = UDim2.new(0.263157904, 0, 0.298927605, 0)
   MainFrame.Size = UDim2.new(0, 440, 0, 300)
   FrameCorner.Parent, FrameCorner.Name = MainFrame, "FrameCorner"
   FrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
   FrameStroke.Color = Color3.fromRGB(135, 135, 135)
   FrameStroke.Parent, FrameStroke.Name = MainFrame, "FrameStroke"
   FrameShadow2.Parent, FrameShadow2.Name = MainFrame, "FrameShadow2"
   FrameShadow2.AnchorPoint = Vector2.new(0.5, 0.5)
   FrameShadow2.BackgroundTransparency = 1
   FrameShadow2.BorderSizePixel = 0
   FrameShadow2.Position = UDim2.new(0.5, 0, 0.5, 0)
   FrameShadow2.Size = UDim2.new(1, 47, 1, 47)
   FrameShadow2.ZIndex = 0
   FrameShadow2.Image = "rbxassetid://6015897843"
   FrameShadow2.ImageColor3 = Color3.fromRGB(0, 0, 0)
   FrameShadow2.ImageTransparency = 0.5
   FrameShadow2.ScaleType = Enum.ScaleType.Slice
   FrameShadow2.SliceCenter = Rect.new(49, 49, 450, 450)
   TabsFrame.Parent, TabsFrame.Name = MainFrame, "Tabs"
   TabsFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
   TabsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
   TabsFrame.BorderSizePixel = 0
   TabsFrame.Position = UDim2.new(0.0181818176, 0, 0.163333327, 0)
   TabsFrame.Size = UDim2.new(0, 116, 0, 238)
   TabsCorner.CornerRadius = UDim.new(0, 4)
   TabsCorner.Parent, TabsCorner.Name = TabsFrame, "TabsCorner"
   TabsStroke.Color = Color3.fromRGB(74, 74, 74)
   TabsStroke.Parent, TabsStroke.Name = TabsFrame, "TabsStroke"
   TabsShadow.Parent, TabsShadow.Name = TabsFrame, "TabsShadow"
   TabsShadow.AnchorPoint = Vector2.new(0.5, 0.5)
   TabsShadow.BackgroundTransparency = 1
   TabsShadow.BorderSizePixel = 0
   TabsShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
   TabsShadow.Size = UDim2.new(1, 47, 1, 47)
   TabsShadow.ZIndex = 0
   TabsShadow.Image = "rbxassetid://6014261993"
   TabsShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
   TabsShadow.ImageTransparency = 0.5
   TabsShadow.ScaleType = Enum.ScaleType.Slice
   TabsShadow.SliceCenter = Rect.new(49, 49, 450, 450)
   TabsScrollingFrame.Parent, TabsScrollingFrame.Name = TabsFrame, "TabsScrolling"
   TabsScrollingFrame.Active = true
   TabsScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TabsScrollingFrame.BackgroundTransparency = 2
   TabsScrollingFrame.BorderColor3 = Color3.fromRGB(35, 35, 35)
   TabsScrollingFrame.BorderSizePixel = 0
   TabsScrollingFrame.Size = UDim2.new(0, 116, 0, 238)
   TabsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
   TabsScrollingFrame.ScrollBarThickness = 4
   TabsListLayout.Parent, TabsListLayout.Name = TabsScrollingFrame, "TabsListLayout"
   TabsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
   TabsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
   TabsListLayout.Padding = UDim.new(0, 5)
   TabsFixFrame.Name = "TabsFixFrame"
   TabsFixFrame.Parent = TabsScrollingFrame
   TabsFixFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TabsFixFrame.BackgroundTransparency = 2
   TabsFixFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
   TabsFixFrame.BorderSizePixel = 0
   TabsFixFrame.Position = UDim2.new(0.068965517, 0, 0, 0)
   TabsFixFrame.Size = UDim2.new(0, 100, 0, 6)
   PagesShadow.Parent, PagesShadow.Name = PagesFrame, "PagesShadow"
   PagesShadow.AnchorPoint = Vector2.new(0.5, 0.5)
   PagesShadow.BackgroundTransparency = 1
   PagesShadow.BorderSizePixel = 0
   PagesShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
   PagesShadow.Size = UDim2.new(1, 47, 1, 47)
   PagesShadow.ZIndex = 0
   PagesShadow.Image = "rbxassetid://6014261993"
   PagesShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
   PagesShadow.ImageTransparency = 0.5
   PagesShadow.ScaleType = Enum.ScaleType.Slice
   PagesShadow.SliceCenter = Rect.new(49, 49, 450, 450)
   Line.Parent, Line.Name = MainFrame, "Line"
   Line.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
   Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
   Line.BorderSizePixel = 0
   Line.Size = UDim2.new(0, 440, 0, 34)
   LineCorner.CornerRadius = UDim.new(0, 4)
   LineCorner.Parent, LineCorner.Name = Line, "LineCorner"
   LineStroke.Color = Color3.fromRGB(74, 74, 74)
   LineStroke.Parent, LineStroke.Name = Line, "LineStroke"
   local OpenButtonGui = Instance.new("ScreenGui")
   local OpenButtonImage = Instance.new("ImageButton")
   local OpenButtonCorner = Instance.new("UICorner")
   OpenButtonGui.Name = "OpenButton"
   OpenButtonGui.Parent = game.CoreGui
   OpenButtonGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
   OpenButtonImage.Parent, OpenButtonImage.Name = OpenButtonGui, "OpenButtonImage"
   OpenButtonImage.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
   OpenButtonImage.BackgroundTransparency = 0.65
   OpenButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
   OpenButtonImage.BorderSizePixel = 0
   OpenButtonImage.Position = UDim2.new(0.102097899, 0, 0.0742971897, 0)
   OpenButtonImage.Size = UDim2.new(0, 45, 0, 45)
   OpenButtonImage.Image = "rbxassetid://11963368259"
   OpenButtonImage.Draggable = true
   OpenButtonImage.Selectable = true
   OpenButtonImage.Active = true
   OpenButtonCorner.CornerRadius = UDim.new(0, 50)
   OpenButtonCorner.Name = "OpenButtonCorner"
   OpenButtonCorner.Parent = OpenButtonImage
   OpenButtonImage.MouseButton1Down:Connect(function()
      MainFrame.Visible = not MainFrame.Visible
   end)
   CloseButton.Parent, CloseButton.Name = Line, "CloseButton"
   CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   CloseButton.BackgroundTransparency = 2
   CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
   CloseButton.BorderSizePixel = 0
   CloseButton.Position = UDim2.new(0.936363637, 0, 0.235294119, 0)
   CloseButton.Size = UDim2.new(0, 17, 0, 17)
   CloseButton.Image = "rbxassetid://11293981586"
   CloseButton.MouseButton1Down:Connect(function()
      MainFrame.Visible = not MainFrame.Visible
   end)
   CloseButton.MouseEnter:Connect(function()
      game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.25), {
         .ImageColor3 = Color3.fromRGB(120, 0, 0)
      }):Play()
   end)
   CloseButton.MouseLeave:Connect(function()
      game:GetService("TweenService"):Create(CloseButton, TweenInfo.new(0.25), {
         .ImageColor3 = Color3.fromRGB(255, 255, 255)
      }):Play()
   end)
   TextLabel.Parent, TextLabel.Name = Line, "Text"
   TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TextLabel.BackgroundTransparency = 2
   TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
   TextLabel.BorderSizePixel = 0
   TextLabel.Position = UDim2.new(0.0181818176, 0, 0, 0)
   TextLabel.Size = UDim2.new(0, 366, 0, 34)
   TextLabel.Text, TextLabel.Font = title, Enum.Font.RobotoCondensed
   TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
   TextLabel.TextSize = 19
   TextLabel.TextXAlignment = Enum.TextXAlignment.Left
   PagesFrame.Parent, PagesFrame.Name = MainFrame, "Pages"
   PagesFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
   PagesFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
   PagesFrame.BorderSizePixel = 0
   PagesFrame.Position = UDim2.new(0.302272737, 0, 0.163333327, 0)
   PagesFrame.Size = UDim2.new(0, 296, 0, 238)
   PagesCorner.CornerRadius = UDim.new(0, 4)
   PagesCorner.Parent, PagesCorner.Name = PagesFrame, "PagesCorner"
   PagesStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
   PagesStroke.Color = Color3.fromRGB(74, 74, 74)
   PagesStroke.Parent, PagesStroke.Name = PagesFrame, "PagesStroke"
   local function Dragify(frame)
      local dragToggle = nil
      local dragInput = nil
      local dragStart = nil
      local startPos = nil
      local function updateInput(input)
         local offset = input.Position - dragStart
         local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + offset.X, startPos.Y.Scale, startPos.Y.Offset + offset.Y)
         game:GetService("TweenService"):Create(frame, TweenInfo.new(0.25), {
            .Position = newPos
         }):Play()
         game:GetService("TweenService"):Create(FrameStroke, TweenInfo.new(0.25), {
            .Color = Color3.fromRGB(255, 255, 255)
         }):Play()
         game:GetService("TweenService"):Create(LineStroke, TweenInfo.new(0.25), {
            .Color = Color3.fromRGB(155, 155, 155)
         }):Play()
      end
      frame.InputBegan:Connect(function(input)
         if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and game:GetService("UserInputService"):GetFocusedTextBox() == nil then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
               if input.UserInputState == Enum.UserInputState.End then
                  dragToggle = false
                  game:GetService("TweenService"):Create(FrameStroke, TweenInfo.new(0.25), {
                     .Color = Color3.fromRGB(135, 135, 135)
                  }):Play()
                  game:GetService("TweenService"):Create(LineStroke, TweenInfo.new(0.25), {
                     .Color = Color3.fromRGB(74, 74, 74)
                  }):Play()
               end
            end)
         end
      end)
      frame.InputChanged:Connect(function(input)
         if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
         end
      end)
      game:GetService("UserInputService").InputChanged:Connect(function(input)
         if input == dragInput and dragToggle then
            updateInput(input)
         end
      end)
   end
   Dragify(MainFrame)
   local UserInputService = game:GetService("UserInputService")
   local VKey = Enum.KeyCode.V
   local IsMenuOpen = false
   local function OnKeyPress(input, gameProcessedEvent)
      pcall(function()
         if not gameProcessedEvent and input.KeyCode == VKey then
            if IsMenuOpen == false then
               MainFrame.Visible = false
               IsMenuOpen = true
            else
               if IsMenuOpen == true then
                  MainFrame.Visible = true
                  IsMenuOpen = false
               end
            end
         end
      end)
   end
   UserInputService.InputBegan:connect(OnKeyPress)
   local UI = {}
   UI.Tab = function(tabName, isFirstTab)
      local TabButton = Instance.new("TextButton")
      local TabCorner = Instance.new("UICorner")
      local TabStroke = Instance.new("UIStroke")
      local PageScrollingFrame = Instance.new("ScrollingFrame")
      local PageListLayout = Instance.new("UIListLayout")
      local PageFrame = Instance.new("Frame")
      TabButton.Name = "TabButton"
      TabButton.Parent = TabsScrollingFrame
      TabButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
      TabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
      TabButton.BorderSizePixel = 0
      TabButton.Position = UDim2.new(0.116379313, 0, 0.0420168079, 0)
      TabButton.Size = UDim2.new(0, 89, 0, 23)
      TabButton.Text, TabButton.AutoButtonColor = tabName, false
      TabButton.Font = Enum.Font.RobotoCondensed
      TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
      TabButton.TextSize = 14
      TabCorner.Parent, TabCorner.Name = TabButton, "TabCorner"
      TabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
      TabStroke.Parent, TabStroke.Color = TabButton, Color3.fromRGB(62, 62, 62)
      PageFrame.Name = "Page"
      PageFrame.Parent = PagesFrame
      PageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      PageFrame.BackgroundTransparency = 2
      PageFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
      PageFrame.BorderSizePixel = 0
      PageFrame.Size = UDim2.new(0, 296, 0, 238)
      PageFrame.Visible = isFirstTab or false
      PageScrollingFrame.Parent, PageScrollingFrame.Name = PageFrame, "PageScrolling"
      PageScrollingFrame.Active = true
      PageScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      PageScrollingFrame.BackgroundTransparency = 2
      PageScrollingFrame.BorderColor3 = Color3.fromRGB(35, 35, 35)
      PageScrollingFrame.BorderSizePixel = 0
      PageScrollingFrame.Size = UDim2.new(0, 296, 0, 238)
      PageScrollingFrame.CanvasPosition = Vector2.new(0, 300)
      PageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
      PageScrollingFrame.ScrollBarThickness = 4
      PageListLayout.Parent, PageListLayout.Name = PageScrollingFrame, "PageListLayout"
      PageListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
      PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder
      PageListLayout.Padding = UDim.new(0, 10)
      TabsScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
      TabButton.MouseButton1Down:Connect(function()
         for _, page in pairs(PagesFrame:GetChildren()) do
            if page:IsA("Frame") then
               page.Visible = false
            end
            PageFrame.Visible = true
         end
         game:GetService("TweenService"):Create(TabStroke, TweenInfo.new(0.25), {
            .Color = Color3.fromRGB(100, 100, 100)
         }):Play()
         wait(0.2)
         game:GetService("TweenService"):Create(TabStroke, TweenInfo.new(0.1), {
            .Color = Color3.fromRGB(62, 62, 62)
         }):Play()
      end)
      TabButton.MouseEnter:Connect(function()
         game:GetService("TweenService"):Create(TabStroke, TweenInfo.new(0.25), {
            .Color = Color3.fromRGB(80, 80, 80)
         }):Play()
      end)
      TabButton.MouseLeave:Connect(function()
         game:GetService("TweenService"):Create(TabStroke, TweenInfo.new(0.25), {
            .Color = Color3.fromRGB(62, 62, 62)
         }):Play()
      end)
      local UIManager = {}
      UIManager.PageFix = function(frame1, frame2)
         local FixFrame1 = Instance.new("Frame")
         FixFrame1.Name = "FixFrame"
         FixFrame1.Parent = frame1
         FixFrame1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         FixFrame1.BackgroundTransparency = 2
         FixFrame1.BorderColor3 = Color3.fromRGB(0, 0, 0)
         FixFrame1.BorderSizePixel = 0
         FixFrame1.Position = UDim2.new(0.331081092, 0, 0, 0)
         FixFrame1.Size = UDim2.new(0, 100, 0, 0)
         local FixFrame2 = Instance.new("Frame")
         FixFrame2.Name = "FixFrame"
         FixFrame2.Parent = frame2
         FixFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         FixFrame2.BackgroundTransparency = 2
         FixFrame2.BorderColor3 = Color3.fromRGB(0, 0, 0)
         FixFrame2.BorderSizePixel = 0
         FixFrame2.Position = UDim2.new(0.331081092, 0, 0, 0)
         FixFrame2.Size = UDim2.new(0, 100, 0, 0)
      end
      UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
      UIManager.ImageLabel = function(image, title, subtitle)
         local Frame = Instance.new("Frame")
         local FrameCorner = Instance.new("UICorner")
         local FrameStroke = Instance.new("UIStroke")
         local PlayerImage = Instance.new("ImageLabel")
         local PlayerImageCorner = Instance.new("UICorner")
         local PlayerName = Instance.new("TextLabel")
         local PlayerDisplayName = Instance.new("TextLabel")
         Frame.Name = "WlcFrame"
         Frame.Parent = PageScrollingFrame
         Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Frame.BorderSizePixel = 0
         Frame.Position = UDim2.new(-0.256756753, 0, 0.0882352963, 0)
         Frame.Size = UDim2.new(0, 274, 0, 100)
         FrameCorner.Parent, FrameCorner.Name = Frame, "WlcFrameCorner"
         FrameStroke.Color = Color3.fromRGB(74, 74, 74)
         FrameStroke.Parent, FrameStroke.Name = Frame, "WlcFrameStroke"
         PlayerImage.Parent, PlayerImage.Name = Frame, "PlayerImage"
         PlayerImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         PlayerImage.BackgroundTransparency = 2
         PlayerImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
         PlayerImage.BorderSizePixel = 0
         PlayerImage.Position = UDim2.new(0.0729926974, 0, 0.150000006, 0)
         PlayerImage.Image, PlayerImage.Size = image, UDim2.new(0, 70, 0, 70)
         PlayerImageCorner.CornerRadius = UDim.new(0, 444)
         PlayerImageCorner.Parent, PlayerImageCorner.Name = PlayerImage, "PlayerImageCorner"
         PlayerName.Parent, PlayerName.Name = Frame, "PlayerName"
         PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         PlayerName.BackgroundTransparency = 2
         PlayerName.BorderColor3 = Color3.fromRGB(0, 0, 0)
         PlayerName.BorderSizePixel = 0
         PlayerName.Position = UDim2.new(0.37956205, 0, 0.25999999, 0)
         PlayerName.Size = UDim2.new(0, 164, 0, 27)
         PlayerName.Text, PlayerName.Font = title, Enum.Font.RobotoCondensed
         PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
         PlayerName.TextSize = 20
         PlayerName.TextXAlignment = Enum.TextXAlignment.Left
         PlayerDisplayName.Name = "PlayerDisplayName"
         PlayerDisplayName.Parent = Frame
         PlayerDisplayName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         PlayerDisplayName.BackgroundTransparency = 2
         PlayerDisplayName.BorderColor3 = Color3.fromRGB(0, 0, 0)
         PlayerDisplayName.BorderSizePixel = 0
         PlayerDisplayName.Position = UDim2.new(0.37956205, 0, 0.529999971, 0)
         PlayerDisplayName.Size = UDim2.new(0, 144, 0, 18)
         PlayerDisplayName.Font = Enum.Font.RobotoCondensed
         PlayerDisplayName.Text = subtitle
         PlayerDisplayName.TextColor3 = Color3.fromRGB(134, 134, 134)
         PlayerDisplayName.TextSize = 15
         PlayerDisplayName.TextXAlignment = Enum.TextXAlignment.Left
         PageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
      end
      UIManager.Info = function(version, rank, status)
         local Frame = Instance.new("Frame")
         local FrameCorner = Instance.new("UICorner")
         local FrameStroke = Instance.new("UIStroke")
         local VersionFrame = Instance.new("Frame")
         local VersionFrameCorner = Instance.new("UICorner")
         local VersionFrameStroke = Instance.new("UIStroke")
         local VersionLabel = Instance.new("TextLabel")
         local Version = Instance.new("TextLabel")
         local RankFrame = Instance.new("Frame")
         local RankFrameCorner = Instance.new("UICorner")
         local RankFrameStroke = Instance.new("UIStroke")
         local RankLabel = Instance.new("TextLabel")
         local Rank = Instance.new("TextLabel")
         local StatusFrame = Instance.new("Frame")
         local StatusFrameCorner = Instance.new("UICorner")
         local StatusFrameStroke = Instance.new("UIStroke")
         local StatusLabel = Instance.new("TextLabel")
         local Status = Instance.new("TextLabel")
         local CloseFrame = Instance.new("Frame")
         local CloseFrameCorner = Instance.new("UICorner")
         local CloseFrameStroke = Instance.new("UIStroke")
         local Close = Instance.new("TextLabel")
         Frame.Name = "InfoFrame"
         Frame.Parent = PageScrollingFrame
         Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Frame.BorderSizePixel = 0
         Frame.Position = UDim2.new(0.0371621624, 0, -0.126050428, 0)
         Frame.Size = UDim2.new(0, 274, 0, 117)
         FrameCorner.Parent, FrameCorner.Name = Frame, "WlcFrameCorner"
         FrameStroke.Color = Color3.fromRGB(74, 74, 74)
         FrameStroke.Parent, FrameStroke.Name = Frame, "WlcFrameStroke"
         VersionFrame.Parent, VersionFrame.Name = Frame, "VersionFrame"
         VersionFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         VersionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         VersionFrame.BorderSizePixel = 0
         VersionFrame.Position = UDim2.new(0.0437956192, 0, 0.200000003, 0)
         VersionFrame.Size = UDim2.new(0, 78, 0, 34)
         VersionFrameCorner.Parent, VersionFrameCorner.Name = VersionFrame, "VersionFrameCorner"
         VersionFrameStroke.Color = Color3.fromRGB(74, 74, 74)
         VersionFrameStroke.Parent, VersionFrameStroke.Name = VersionFrame, "VersionFrameStroke"
         VersionLabel.Parent, VersionLabel.Name = VersionFrame, "VersionLabel"
         VersionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         VersionLabel.BackgroundTransparency = 2
         VersionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         VersionLabel.BorderSizePixel = 0
         VersionLabel.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
         VersionLabel.Size = UDim2.new(0, 74, 0, 8)
         VersionLabel.Font = Enum.Font.RobotoCondensed
         VersionLabel.Text = "Version"
         VersionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         VersionLabel.TextSize = 14
         VersionLabel.TextXAlignment = Enum.TextXAlignment.Left
         Version.Parent, Version.Name = VersionFrame, "Version"
         Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Version.BackgroundTransparency = 2
         Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Version.BorderSizePixel = 0
         Version.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
         Version.Size = UDim2.new(0, 50, 0, 27)
         Version.Text, Version.Font = version, Enum.Font.RobotoCondensed
         Version.TextColor3 = Color3.fromRGB(144, 144, 144)
         Version.TextSize = 14
         Version.TextXAlignment = Enum.TextXAlignment.Left
         RankFrame.Parent, RankFrame.Name = Frame, "RankFrame"
         RankFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         RankFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         RankFrame.BorderSizePixel = 0
         RankFrame.Position = UDim2.new(0.357664227, 0, 0.200000003, 0)
         RankFrame.Size = UDim2.new(0, 78, 0, 34)
         RankFrameCorner.Parent, RankFrameCorner.Name = RankFrame, "RankFrameCorner"
         RankFrameStroke.Color = Color3.fromRGB(74, 74, 74)
         RankFrameStroke.Parent, RankFrameStroke.Name = RankFrame, "RankFrameStroke"
         RankLabel.Parent, RankLabel.Name = RankFrame, "RankLabel"
         RankLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         RankLabel.BackgroundTransparency = 2
         RankLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         RankLabel.BorderSizePixel = 0
         RankLabel.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
         RankLabel.Size = UDim2.new(0, 74, 0, 8)
         RankLabel.Font = Enum.Font.RobotoCondensed
         RankLabel.Text = "Rank"
         RankLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         RankLabel.TextSize = 14
         RankLabel.TextXAlignment = Enum.TextXAlignment.Left
         Rank.Parent, Rank.Name = RankFrame, "Rank"
         Rank.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Rank.BackgroundTransparency = 2
         Rank.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Rank.BorderSizePixel = 0
         Rank.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
         Rank.Size = UDim2.new(0, 50, 0, 27)
         Rank.Text, Rank.Font = rank, Enum.Font.RobotoCondensed
         Rank.TextColor3 = Color3.fromRGB(144, 144, 144)
         Rank.TextSize = 14
         Rank.TextXAlignment = Enum.TextXAlignment.Left
         StatusFrame.Parent, StatusFrame.Name = Frame, "StatusFrame"
         StatusFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         StatusFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         StatusFrame.BorderSizePixel = 0
         StatusFrame.Position = UDim2.new(0.671532869, 0, 0.200000003, 0)
         StatusFrame.Size = UDim2.new(0, 78, 0, 34)
         StatusFrameCorner.Parent, StatusFrameCorner.Name = StatusFrame, "StatusFrameCorner"
         StatusFrameStroke.Color = Color3.fromRGB(74, 74, 74)
         StatusFrameStroke.Parent, StatusFrameStroke.Name = StatusFrame, "StatusFrameStroke"
         StatusLabel.Parent, StatusLabel.Name = StatusFrame, "StatusLabel"
         StatusLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         StatusLabel.BackgroundTransparency = 2
         StatusLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         StatusLabel.BorderSizePixel = 0
         StatusLabel.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
         StatusLabel.Size = UDim2.new(0, 74, 0, 8)
         StatusLabel.Font = Enum.Font.RobotoCondensed
         StatusLabel.Text = "Last Updated"
         StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         StatusLabel.TextSize = 14
         StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
         Status.Parent, Status.Name = StatusFrame, "Status"
         Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Status.BackgroundTransparency = 2
         Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Status.BorderSizePixel = 0
         Status.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
         Status.Size = UDim2.new(0, 50, 0, 27)
         Status.Text, Status.Font = status, Enum.Font.RobotoCondensed
         Status.TextColor3 = Color3.fromRGB(122, 122, 122)
         Status.TextSize = 14
         Status.TextXAlignment = Enum.TextXAlignment.Left
         CloseFrame.Parent, CloseFrame.Name = Frame, "CloseFrame"
         CloseFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         CloseFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         CloseFrame.BorderSizePixel = 0
         CloseFrame.Position = UDim2.new(0.0437956192, 0, 0.649999917, 0)
         CloseFrame.Size = UDim2.new(0, 250, 0, 28)
         CloseFrameCorner.Parent, CloseFrameCorner.Name = CloseFrame, "CloseFrameCorner"
         CloseFrameStroke.Color = Color3.fromRGB(74, 74, 74)
         CloseFrameStroke.Parent, CloseFrameStroke.Name = CloseFrame, "CloseFrameStroke"
         Close.Name = "Close"
         Close.Parent = CloseFrame
         Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         Close.BackgroundTransparency = 2
         Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Close.BorderSizePixel = 0
         Close.Position = UDim2.new(0.0399999991, 0, 0.0882327408, 2)
         Close.Size = UDim2.new(0, 226, 0, 26)
         Close.Font = Enum.Font.RobotoCondensed
         Close.Text = "Press V to close or open the menu"
         Close.TextColor3 = Color3.fromRGB(122, 122, 122)
         Close.TextSize = 14
         Close.TextXAlignment = Enum.TextXAlignment.Left
         PageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
      end
      UIManager.Label = function(text)
         local ButtonLabel = Instance.new("TextLabel")
         ButtonLabel.Name = "ButtonLabel"
         ButtonLabel.Parent = PageScrollingFrame
         ButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ButtonLabel.BackgroundTransparency = 2
         ButtonLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         ButtonLabel.BorderSizePixel = 0
         ButtonLabel.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
         ButtonLabel.Size = UDim2.new(0, 272, 0, 33)
         ButtonLabel.Font = Enum.Font.RobotoCondensed
         ButtonLabel.Text = text
         ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         ButtonLabel.TextSize = 17
      end
      UIManager.BigButton = function(text, image, callback)
         local BigButton = Instance.new("TextButton")
         local BigButtonCorner = Instance.new("UICorner")
         local BigButtonStroke = Instance.new("UIStroke")
         local BigButtonLabel = Instance.new("TextLabel")
         local BigButtonImage = Instance.new("ImageLabel")
         local Callback = callback or function() end
         BigButton.Name = "BigButton"
         BigButton.Parent = PageScrollingFrame
         BigButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         BigButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
         BigButton.BorderSizePixel = 0
         BigButton.Position = UDim2.new(0.0540540554, 0, 0.352941185, 0)
         BigButton.Size = UDim2.new(0, 272, 0, 86)
         BigButton.AutoButtonColor = false
         BigButton.Font = Enum.Font.SourceSans
         BigButton.Text = ""
         BigButton.TextColor3 = Color3.fromRGB(0, 0, 0)
         BigButton.TextSize = 14
         BigButtonCorner.Parent, BigButtonCorner.Name = BigButton, "BigButtonCorner"
         BigButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
         BigButtonStroke.Color = Color3.fromRGB(74, 74, 74)
         BigButtonStroke.Parent, BigButtonStroke.Name = BigButton, "BigButtonStroke"
         BigButtonLabel.Parent, BigButtonLabel.Name = BigButton, "BigButtonLabel"
         BigButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         BigButtonLabel.BackgroundTransparency = 2
         BigButtonLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         BigButtonLabel.BorderSizePixel = 0
         BigButtonLabel.Position = UDim2.new(0.0551470593, 0, 0.519027352, 0)
         BigButtonLabel.Text, BigButtonLabel.Size = text, UDim2.new(0, 176, 0, 34)
         BigButtonLabel.Font = Enum.Font.RobotoCondensed
         BigButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         BigButtonLabel.TextSize = 28
         BigButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
         BigButtonImage.Parent, BigButtonImage.Name = BigButton, "BigButtonImage"
         BigButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         BigButtonImage.BackgroundTransparency = 2
         BigButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
         BigButtonImage.BorderSizePixel = 0
         BigButtonImage.Position = UDim2.new(0.702205896, 0, 0.0863285512, 0)
         BigButtonImage.Image, BigButtonImage.Size = image, UDim2.new(0, 70, 0, 70)
         PageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
         BigButton.MouseButton1Down:Connect(function()
            game:GetService("TweenService"):Create(BigButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(255, 255, 255)
            }):Play()
            wait(0.01)
            game:GetService("TweenService"):Create(BigButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(74, 74, 74)
            }):Play()
            pcall(Callback)
         end)
         BigButton.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(BigButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(100, 100, 100)
            }):Play()
         end)
         BigButton.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(BigButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(74, 74, 74)
            }):Play()
         end)
      end
      UIManager.Button = function(text, callback)
         local Button = Instance.new("TextButton")
         local ButtonCorner = Instance.new("UICorner")
         local ButtonStroke = Instance.new("UIStroke")
         local ButtonLabel = Instance.new("TextLabel")
         local ButtonImage = Instance.new("ImageLabel")
         local Callback = callback or function() end
         Button.Name = "Button"
         Button.Parent = PageScrollingFrame
         Button.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
         Button.BorderSizePixel = 0
         Button.Position = UDim2.new(0.0371621624, 0, 0.70168066, 0)
         Button.Size = UDim2.new(0, 272, 0, 33)
         Button.AutoButtonColor = false
         Button.Font = Enum.Font.SourceSans
         Button.Text = ""
         Button.TextColor3 = Color3.fromRGB(0, 0, 0)
         Button.TextSize = 14
         ButtonCorner.Parent, ButtonCorner.Name = Button, "ButtonCorner"
         ButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
         ButtonStroke.Color = Color3.fromRGB(74, 74, 74)
         ButtonStroke.Parent, ButtonStroke.Name = Button, "ButtonStroke"
         ButtonLabel.Parent, ButtonLabel.Name = Button, "ButtonLabel"
         ButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ButtonLabel.BackgroundTransparency = 2
         ButtonLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         ButtonLabel.BorderSizePixel = 0
         ButtonLabel.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
         ButtonLabel.Size = UDim2.new(0, 228, 0, 20)
         ButtonLabel.Text, ButtonLabel.Font = text, Enum.Font.RobotoCondensed
         ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         ButtonLabel.TextSize = 17
         ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
         ButtonImage.Parent, ButtonImage.Name = Button, "ButtonImage"
         ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ButtonImage.BackgroundTransparency = 2
         ButtonImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
         ButtonImage.BorderSizePixel = 0
         ButtonImage.Position = UDim2.new(0.0073529412, 0, 0.121212125, 0)
         ButtonImage.Size = UDim2.new(0, 25, 0, 25)
         ButtonImage.Image = "rbxassetid://11295279987"
         PageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
         Button.MouseButton1Down:Connect(function()
            game:GetService("TweenService"):Create(ButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(255, 255, 255)
            }):Play()
            wait(0.01)
            game:GetService("TweenService"):Create(ButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(74, 74, 74)
            }):Play()
            pcall(Callback)
         end)
         Button.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(ButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(100, 100, 100)
            }):Play()
         end)
         Button.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(ButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(74, 74, 74)
            }):Play()
         end)
      end
      UIManager.Toggle = function(text, callback)
         local ToggleButton = Instance.new("TextButton")
         local ToggleCorner = Instance.new("UICorner")
         local ToggleStroke = Instance.new("UIStroke")
         local ToggleLabel = Instance.new("TextLabel")
         local ToggleImage = Instance.new("ImageLabel")
         local Callback = callback or function() end
         local IsToggled = false
         ToggleButton.Name = "Toggle"
         ToggleButton.Parent = PageScrollingFrame
         ToggleButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         ToggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
         ToggleButton.BorderSizePixel = 0
         ToggleButton.Position = UDim2.new(0.0371621624, 0, 0.70168066, 0)
         ToggleButton.Size = UDim2.new(0, 272, 0, 33)
         ToggleButton.AutoButtonColor = false
         ToggleButton.Font = Enum.Font.SourceSans
         ToggleButton.Text = ""
         ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
         ToggleButton.TextSize = 14
         ToggleCorner.Parent, ToggleCorner.Name = ToggleButton, "ToggleCorner"
         ToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
         ToggleStroke.Color = Color3.fromRGB(74, 74, 74)
         ToggleStroke.Parent, ToggleStroke.Name = ToggleButton, "ToggleStroke"
         ToggleLabel.Parent, ToggleLabel.Name = ToggleButton, "ToggleLabel"
         ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ToggleLabel.BackgroundTransparency = 2
         ToggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         ToggleLabel.BorderSizePixel = 0
         ToggleLabel.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
         ToggleLabel.Size = UDim2.new(0, 228, 0, 20)
         ToggleLabel.Text, ToggleLabel.Font = text, Enum.Font.RobotoCondensed
         ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         ToggleLabel.TextSize = 17
         ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
         ToggleImage.Parent, ToggleImage.Name = ToggleButton, "ToggleImage"
         ToggleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         ToggleImage.BackgroundTransparency = 2
         ToggleImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
         ToggleImage.BorderSizePixel = 0
         ToggleImage.Position = UDim2.new(0.0149999997, 0, 0.0909999982, 2)
         ToggleImage.Size = UDim2.new(0, 23, 0, 23)
         ToggleImage.Image = "rbxassetid://11293978956"
         ToggleImage.ImageColor3 = Color3.fromRGB(255, 0, 0)
         PageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
         ToggleButton.MouseButton1Down:Connect(function()
            IsToggled = not IsToggled
            if IsToggled then
               game:GetService("TweenService"):Create(ToggleImage, TweenInfo.new(0.25), {
                  .ImageColor3 = Color3.fromRGB(0, 211, 0)
               }):Play()
            else
               game:GetService("TweenService"):Create(ToggleImage, TweenInfo.new(0.25), {
                  .ImageColor3 = Color3.fromRGB(211, 0, 0)
               }):Play()
            end
            pcall(Callback, IsToggled)
         end)
         ToggleButton.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(ToggleStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(100, 100, 100)
            }):Play()
         end)
         ToggleButton.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(ToggleStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(74, 74, 74)
            }):Play()
         end)
      end
      UIManager.Slider = function(label, minValue, maxValue, initialValue, callback)
         local SliderFrame = Instance.new("Frame")
         local SliderFrameCorner = Instance.new("UICorner")
         local SliderFrameStroke = Instance.new("UIStroke")
         local SliderLabel = Instance.new("TextLabel")
         local SliderNumber = Instance.new("TextLabel")
         local SliderButton = Instance.new("TextButton")
         local SliderButtonCorner = Instance.new("UICorner")
         local SliderButtonStroke = Instance.new("UIStroke")
         local SliderLine = Instance.new("Frame")
         local SliderLineCorner = Instance.new("UICorner")
         local Callback = callback or function() end
         local Mouse = game.Players.LocalPlayer:GetMouse()
         local UserInputService = game:GetService("UserInputService")
         local currentSliderValue = nil
         SliderFrame.Name = "SliderFrame"
         SliderFrame.Parent = PageScrollingFrame
         SliderFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         SliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         SliderFrame.BorderSizePixel = 0
         SliderFrame.Position = UDim2.new(0.0405405387, 0, 0.39915967, 0)
         SliderFrame.Size = UDim2.new(0, 272, 0, 45)
         SliderFrameCorner.Parent, SliderFrameCorner.Name = SliderFrame, "SliderFrameCorner"
         SliderFrameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
         SliderFrameStroke.Color = Color3.fromRGB(74, 74, 74)
         SliderFrameStroke.Parent, SliderFrameStroke.Name = SliderFrame, "SliderFrameStroke"
         SliderLabel.Parent, SliderLabel.Name = SliderFrame, "SliderLabel"
         SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         SliderLabel.BackgroundTransparency = 2
         SliderLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         SliderLabel.BorderSizePixel = 0
         SliderLabel.Position = UDim2.new(0.0698529407, 0, 0.13333334, 0)
         SliderLabel.Size = UDim2.new(0, 187, 0, 12)
         SliderLabel.Text, SliderLabel.Font = label, Enum.Font.RobotoCondensed
         SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         SliderLabel.TextSize = 17
         SliderLabel.TextWrapped = true
         SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
         SliderNumber.Parent, SliderNumber.Name = SliderFrame, "SliderNumber"
         SliderNumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         SliderNumber.BackgroundTransparency = 2
         SliderNumber.BorderColor3 = Color3.fromRGB(0, 0, 0)
         SliderNumber.BorderSizePixel = 0
         SliderNumber.Position = UDim2.new(0.841911793, 0, 0.13333334, 0)
         SliderNumber.Size = UDim2.new(0, 32, 0, 12)
         SliderNumber.Font = Enum.Font.RobotoCondensed
         SliderNumber.Text = "1"
         SliderNumber.TextColor3 = Color3.fromRGB(255, 255, 255)
         SliderNumber.TextSize = 13
         SliderNumber.TextWrapped = true
         SliderButton.Parent, SliderButton.Name = SliderFrame, "SliderButton"
         SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         SliderButton.BackgroundTransparency = 2
         SliderButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
         SliderButton.BorderSizePixel = 0
         SliderButton.Position = UDim2.new(0.0661764741, 0, 0.577777803, 0)
         SliderButton.Size = UDim2.new(0, 235, 0, 13)
         SliderButton.Font = Enum.Font.SourceSans
         SliderButton.Text = ""
         SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
         SliderButton.TextSize = 14
         SliderButtonCorner.Parent, SliderButtonCorner.Name = SliderButton, "SliderButtonCorner"
         SliderButtonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
         SliderButtonStroke.Color = Color3.fromRGB(74, 74, 74)
         SliderButtonStroke.Parent, SliderButtonStroke.Name = SliderButton, "SliderButtonStroke"
         SliderLine.Parent, SliderLine.Name = SliderButton, "SliderLine"
         SliderLine.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
         SliderLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
         SliderLine.BorderSizePixel = 0
         SliderLine.Size = UDim2.new(0, 0, 0, 13)
         SliderLineCorner.Parent, SliderLineCorner.Name = SliderLine, "SliderLineCorner"
         PageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
         SliderButton.MouseButton1Down:Connect(function()
            currentSliderValue = math.floor(tonumber(maxValue) - tonumber(minValue) / 234 * SliderLine.AbsoluteSize.X + tonumber(minValue)) or 0
            pcall(function()
               Callback(currentSliderValue)
            end)
            SliderLine:TweenSize(UDim2.new(0, math.clamp(Mouse.X - SliderLine.AbsolutePosition.X, 0, 234), 0, 13), "Out", "Linear", 0.1)
            local moveconnection = Mouse.Move:Connect(function()
               SliderNumber.Text = currentSliderValue
               game:GetService("TweenService"):Create(SliderButtonStroke, TweenInfo.new(0.1), {
                  .Color = Color3.fromRGB(255, 255, 255)
               }):Play()
               currentSliderValue = math.floor(tonumber(maxValue) - tonumber(minValue) / 234 * SliderLine.AbsoluteSize.X + tonumber(minValue))
               pcall(function()
                  Callback(currentSliderValue)
               end)
               SliderLine:TweenSize(UDim2.new(0, math.clamp(Mouse.X - SliderLine.AbsolutePosition.X, 0, 234), 0, 13), "Out", "Linear", 0.1)
            end)
            local releaseconnection = UserInputService.InputEnded:Connect(function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                  currentSliderValue = math.floor(tonumber(maxValue) - tonumber(minValue) / 234 * SliderLine.AbsoluteSize.X + tonumber(minValue))
                  pcall(function()
                     Callback(currentSliderValue)
                  end)
                  SliderLine:TweenSize(UDim2.new(0, math.clamp(Mouse.X - SliderLine.AbsolutePosition.X, 0, 234), 0, 13), "Out", "Linear", 0.1)
                  moveconnection:Disconnect()
                  releaseconnection:Disconnect()
                  game:GetService("TweenService"):Create(SliderButtonStroke, TweenInfo.new(0.25), {
                     .Color = Color3.fromRGB(74, 74, 74)
                  }):Play()
               end
            end)
         end)
         SliderButton.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(SliderButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(100, 100, 100)
            }):Play()
         end)
         SliderButton.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(SliderButtonStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(74, 74, 74)
            }):Play()
         end)
      end
      UIManager.Textbox = function(label, placeholder, callback, isNumberOnly)
         local TextBoxFrame = Instance.new("Frame")
         local TextBoxFrameCorner = Instance.new("UICorner")
         local TextBoxFrameStroke = Instance.new("UIStroke")
         local TextBox = Instance.new("TextBox")
         local TargetTextBoxCorner = Instance.new("UICorner")
         local TargetTextBoxStroke = Instance.new("UIStroke")
         local TextBoxLabel = Instance.new("TextLabel")
         local Callback = callback or function() end
         local IsNumberOnly = isNumberOnly or false
         TextBoxFrame.Name = "TextBoxFrame"
         TextBoxFrame.Parent = PageScrollingFrame
         TextBoxFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         TextBoxFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         TextBoxFrame.BorderSizePixel = 0
         TextBoxFrame.Position = UDim2.new(0.0371621624, 0, 0.613445401, 0)
         TextBoxFrame.Size = UDim2.new(0, 272, 0, 45)
         TextBoxFrameCorner.Parent, TextBoxFrameCorner.Name = TextBoxFrame, "TextBoxFrameCorner"
         TextBoxFrameStroke.Color = Color3.fromRGB(74, 74, 74)
         TextBoxFrameStroke.Parent, TextBoxFrameStroke.Name = TextBoxFrame, "TextBoxFrameStroke"
         TextBox.Parent, TextBox.Name = TextBoxFrame, "TargetTextBox"
         TextBox.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
         TextBox.BackgroundTransparency = 2
         TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
         TextBox.BorderSizePixel = 0
         TextBox.Position = UDim2.new(0.577205896, 0, 0.150000006, 0)
         TextBox.Size = UDim2.new(0, 103, 0, 31)
         TextBox.Font = Enum.Font.RobotoCondensed
         TextBox.Text = placeholder
         TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
         TextBox.TextSize = 14
         TargetTextBoxCorner.Parent, TargetTextBoxCorner.Name = TextBox, "TargetTextBoxCorner"
         TargetTextBoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
         TargetTextBoxStroke.Color = Color3.fromRGB(74, 74, 74)
         TargetTextBoxStroke.Thickness = 0.699999988079071
         TargetTextBoxStroke.Parent, TargetTextBoxStroke.Name = TextBox, "TargetTextBoxStroke"
         TextBoxLabel.Parent, TextBoxLabel.Name = TextBoxFrame, "TextBoxLabel"
         TextBoxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         TextBoxLabel.BackgroundTransparency = 2
         TextBoxLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
         TextBoxLabel.BorderSizePixel = 0
         TextBoxLabel.Position = UDim2.new(0.0404411778, 0, 0.244444445, 0)
         TextBoxLabel.Text, TextBoxLabel.Size = label, UDim2.new(0, 137, 0, 22)
         TextBoxLabel.Font = Enum.Font.RobotoCondensed
         TextBoxLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
         TextBoxLabel.TextSize = 17
         TextBoxLabel.TextWrapped = true
         TextBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
         TextBox.Focused:Connect(function()
            game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(130, 130, 130)
            }):Play()
         end)
         if IsNumberOnly == false then
            TextBox.FocusLost:Connect(function(enterKey)
               game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
                  .Color = Color3.fromRGB(255, 255, 255)
               }):Play()
               wait(0.2)
               game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
                  .Color = Color3.fromRGB(74, 74, 74)
               }):Play()
               Callback(TextBox.Text)
               TextBox.Text = placeholder
            end)
         else
            TextBox.Focused:Connect(function()
               game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
                  .Color = Color3.fromRGB(130, 130, 130)
               }):Play()
            end)
            TextBox.FocusLost:Connect(function(enterKey)
               if not enterKey then
                  return
               end
               if TextBox.Text:match("^%d+$") then
                  game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
                     .Color = Color3.fromRGB(255, 255, 255)
                  }):Play()
                  wait(0.2)
                  game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
                     .Color = Color3.fromRGB(74, 74, 74)
                  }):Play()
                  Callback(TextBox.Text)
                  TextBox.Text = placeholder
               else
                  TextBox.Text = "Numbers only!"
                  game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
                     .Color = Color3.fromRGB(255, 0, 0)
                  }):Play()
                  wait(0.8)
                  TextBox.Text = placeholder
                  game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
                     .Color = Color3.fromRGB(74, 74, 74)
                  }):Play()
               end
            end)
         end
      end
      UIManager.TargetTextBox = function(playerImage, playerName, playerId)
         local TargetFrame = Instance.new("Frame")
         local TargetFrameCorner = Instance.new("UICorner")
         local TargetFrameStroke = Instance.new("UIStroke")
         local TargetImage = Instance.new("ImageLabel")
         local TargetImageCorner = Instance.new("UICorner")
         local TargetName = Instance.new("TextLabel")
         local TargetTextBox = Instance.new("TextBox")
         local TargetTextBoxCorner = Instance.new("UICorner")
         local TargetTextBoxStroke = Instance.new("UIStroke")
         local TargetId = Instance.new("TextLabel")
         TargetFrame.Name = "TargetFrame"
         TargetFrame.Parent = PageScrollingFrame
         TargetFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
         TargetFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
         TargetFrame.BorderSizePixel = 0
         TargetFrame.Position = UDim2.new(0.0540540554, 0, 0.369747907, 0)
         TargetFrame.Size = UDim2.new(0, 274, 0, 100)
         TargetFrameCorner.Parent, TargetFrameCorner.Name = TargetFrame, "TargetFrameCorner"
         TargetFrameStroke.Color = Color3.fromRGB(74, 74, 74)
         TargetFrameStroke.Parent, TargetFrameStroke.Name = TargetFrame, "TargetFrameStroke"
         TargetImage.Parent, TargetImage.Name = TargetFrame, "TargetImage"
         TargetImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         TargetImage.BackgroundTransparency = 2
         TargetImage.BorderColor3 = Color3.fromRGB(0, 0, 0)
         TargetImage.BorderSizePixel = 0
         TargetImage.Position = UDim2.new(0.0729926974, 0, 0.150000006, 0)
         TargetImage.Image, TargetImage.Size = playerImage, UDim2.new(0, 70, 0, 70)
         TargetImageCorner.CornerRadius = UDim.new(0, 444)
         TargetImageCorner.Parent, TargetImageCorner.Name = TargetImage, "PlayerImageCorner"
         TargetName.Parent, TargetName.Name = TargetFrame, "TargetName"
         TargetName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         TargetName.BackgroundTransparency = 2
         TargetName.BorderColor3 = Color3.fromRGB(0, 0, 0)
         TargetName.BorderSizePixel = 0
         TargetName.Position = UDim2.new(0.394160599, 0, 0.519999981, 0)
         TargetName.Size = UDim2.new(0, 140, 0, 18)
         TargetName.Font = Enum.Font.RobotoCondensed
         TargetName.Text = "Target Name : "..playerName
         TargetName.TextColor3 = Color3.fromRGB(134, 134, 134)
         TargetName.TextSize = 15
         TargetName.TextXAlignment = Enum.TextXAlignment.Left
         TargetTextBox.Parent, TargetTextBox.Name = TargetFrame, "TargetTextBox"
         TargetTextBox.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
         TargetTextBox.BackgroundTransparency = 2
         TargetTextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
         TargetTextBox.BorderSizePixel = 0
         TargetTextBox.Position = UDim2.new(0.394160599, 0, 0.150000006, 0)
         TargetTextBox.Size = UDim2.new(0, 118, 0, 31)
         TargetTextBox.Font = Enum.Font.RobotoCondensed
         TargetTextBox.Text = ""
         TargetTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
         TargetTextBox.TextSize = 14
         TargetTextBoxCorner.Parent, TargetTextBoxCorner.Name = TargetTextBox, "TargetTextBoxCorner"
         TargetTextBoxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
         TargetTextBoxStroke.Color = Color3.fromRGB(74, 74, 74)
         TargetTextBoxStroke.Thickness = 0.699999988079071
         TargetTextBoxStroke.Parent, TargetTextBoxStroke.Name = TargetTextBox, "TargetTextBoxStroke"
         TargetId.Name = "TargetId"
         TargetId.Parent = TargetFrame
         TargetId.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
         TargetId.BackgroundTransparency = 2
         TargetId.BorderColor3 = Color3.fromRGB(0, 0, 0)
         TargetId.BorderSizePixel = 0
         TargetId.Position = UDim2.new(0.394160599, 0, 0.699999988, 0)
         TargetId.Size = UDim2.new(0, 140, 0, 18)
         TargetId.Font = Enum.Font.RobotoCondensed
         TargetId.Text = "ID : "..playerId
         TargetId.TextColor3 = Color3.fromRGB(134, 134, 134)
         TargetId.TextSize = 15
         TargetId.TextXAlignment = Enum.TextXAlignment.Left
         PageScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, TabsListLayout.AbsoluteContentSize.Y)
         local function GetPlayerByName(name)
            if name == "" then
               return nil
            end
            if name == "random" then
               return game:GetService("Players"):GetPlayers()[math.random(1, #game:GetService("Players"):GetPlayers())]
            end
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
               if player.Name:lower():sub(1, #name) == name:lower() or name == player.DisplayName:lower():sub(1, #name) then
                  return player
               end
            end
         end
         workspace.FallenPartsDestroyHeight = -50000
         TargetTextBox.FocusLost:Connect(function()
            game:GetService("TweenService"):Create(TargetTextBoxStroke, TweenInfo.new(0.25), {
               .Color = Color3.fromRGB(74, 74, 74)
            }):Play()
            local target = GetPlayerByName(TargetTextBox.Text)
            if target ~= game:GetService("Players").LocalPlayer then
               TargetTextBox.Text = target.Name
               TargetName.Text = "Target Name : @"..target.DisplayName
               TargetId.Text = "ID : "..target.UserId
               TargetImage.Image = game:GetService("Players"):GetUserThumbnailAsync(target.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            end
         end)
         UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
         UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
         UIManager.Button("Teleport", function()
            Benx = false
            Bang = false
            Suck = false
            HeadSit = false
            FaceBang = false
            Stand = false
            local target = GetPlayerByName(TargetTextBox.Text)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
         end)
         UIManager.Button("Link", function()
            Benx = false
            Bang = false
            Suck = false
            HeadSit = false
            FaceBang = false
            Stand = false
            local target = GetPlayerByName(TargetTextBox.Text)
            local linkArgs = {";char me"}
            local unlinkArgs = {";unchar"}
            game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(linkArgs))
            wait(0.4)
            PlayerTargeting(target.Name)
            game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(unlinkArgs))
         end)
         UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
         UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
         UIManager.Button("Kill", function()
            if _G.Wait == true then
               return
            end
            _G.Wait = true
            local target = GetPlayerByName(TargetTextBox.Text)
            local startCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipTool"):FireServer("all")
            wait(1)
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipTool"):FireServer("ShoppingCart")
            wait(1)
            game:GetService("RunService"):BindToRenderStep("Teleport", 0, function()
               game:GetService("ReplicatedStorage").Functions:WaitForChild("ChangeSizeRF"):InvokeServer("1.6")
               for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                  if tool:IsA("Tool") and tool.Name == "ShoppingCart" then
                     tool.Parent = game.Players.LocalPlayer.Character
                  end
               end
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + target.Character.Humanoid.MoveDirection * 8
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
               if not (target.Character.Humanoid.Sit == false or false) then
                  game:GetService("RunService"):UnbindFromRenderStep("Teleport")
                  wait(0.5)
                  game:GetService("RunService"):BindToRenderStep("Teleport To Void", 0, function()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -1000.51605, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                  end)
                  wait(0.4)
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipTool"):FireServer("all")
                  wait(3)
                  game:GetService("RunService"):UnbindFromRenderStep("Teleport To Void")
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = startCFrame
                  game:GetService("ReplicatedStorage").Functions:WaitForChild("ChangeSizeRF"):InvokeServer("1")
                  _G.Wait = false
               end
            end)
         end)
         UIManager.Button("Send to Space", function()
            if _G.Wait == true then
               return
            end
            _G.Wait = true
            local target = GetPlayerByName(TargetTextBox.Text)
            local startCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipTool"):FireServer("all")
            wait(1)
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipTool"):FireServer("ShoppingCart")
            wait(1)
            game:GetService("RunService"):BindToRenderStep("Teleport", 0, function()
               game:GetService("ReplicatedStorage").Functions:WaitForChild("ChangeSizeRF"):InvokeServer("1.6")
               for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                  if tool:IsA("Tool") and tool.Name == "ShoppingCart" then
                     tool.Parent = game.Players.LocalPlayer.Character
                  end
               end
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame + target.Character.Humanoid.MoveDirection * 8
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
               if not (target.Character.Humanoid.Sit == false or false) then
                  game:GetService("RunService"):UnbindFromRenderStep("Teleport")
                  wait(0.5)
                  game:GetService("RunService"):BindToRenderStep("Teleport To Void", 0, function()
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = startCFrame
                  end)
                  wait(0.4)
                  game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipTool"):FireServer("all")
                  wait(3)
                  game:GetService("RunService"):UnbindFromRenderStep("Teleport To Void")
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = startCFrame
                  game:GetService("ReplicatedStorage").Functions:WaitForChild("ChangeSizeRF"):InvokeServer("1")
                  _G.Wait = false
               end
            end)
         end)
         UIManager.Button("Stop Kill / Suck", function()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipTool"):FireServer("all")
            game:GetService("RunService"):UnbindFromRenderStep("Teleport")
            game:GetService("RunService"):UnbindFromRenderStep("Teleport To Void")
            local hideArgs = {";vis"}
            game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(hideArgs))
            game:GetService("ReplicatedStorage").Functions:WaitForChild("ChangeSizeRF"):InvokeServer("1")
            _G.Wait = false
         end)
         UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
         UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
         UIManager.Toggle("Benx", function(ison)
            local target = GetPlayerByName(TargetTextBox.Text)
            Benx = ison
            Bang = false
            Suck = false
            HeadSit = false
            FaceBang = false
            Stand = false
            repeat
               task.wait()
               pcall(function()
                  local LocalPlayerChar = LocalPlayer
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.3) * CFrame.Angles(-1.5, math.rad(0), 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.8) * CFrame.Angles(-1.5, math.rad(0), 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.3) * CFrame.Angles(-1.5, math.rad(0), 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.8) * CFrame.Angles(-1.5, math.rad(0), 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.3) * CFrame.Angles(-1.5, math.rad(0), 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.8) * CFrame.Angles(-1.5, math.rad(0), 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.3) * CFrame.Angles(-1.5, math.rad(0), 0)
               end)
            until Benx == false
            if Benx == false then
               LocalPlayer.Character.Humanoid.Sit = false
               LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
            end
         end)
         UIManager.Toggle("Bang", function(ison)
            local target = GetPlayerByName(TargetTextBox.Text)
            Bang = ison
            Benx = false
            Suck = false
            HeadSit = false
            FaceBang = false
            Stand = false
            repeat
               task.wait()
               pcall(function()
                  local LocalPlayerChar = LocalPlayer
                  LocalPlayerChar.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.3)
                  task.wait()
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.8)
                  task.wait()
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.3)
                  task.wait()
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.8)
                  task.wait()
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.3)
                  task.wait()
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.8)
                  task.wait()
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.3)
               end)
            until Bang == false
            if Bang == false then
               LocalPlayer.Character.Humanoid.PlatformStand = false
            end
         end)
         UIManager.Toggle("Face Bang", function(ison)
            local target = GetPlayerByName(TargetTextBox.Text)
            Bang = false
            Benx = false
            Suck = false
            FaceBang, HeadSit = ison, false
            Stand = false
            repeat
               task.wait()
               pcall(function()
                  local LocalPlayerChar = LocalPlayer
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 0.5, -1.3) * CFrame.Angles(0, -3.3, 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 0.5, -1.8) * CFrame.Angles(0, -3.3, 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 0.5, -2.3) * CFrame.Angles(0, -3.3, 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 0.5, -2.8) * CFrame.Angles(0, -3.3, 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 0.5, -2.3) * CFrame.Angles(0, -3.3, 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 0.5, -1.8) * CFrame.Angles(0, -3.3, 0)
                  task.wait()
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 0.5, -1.3) * CFrame.Angles(0, -3.3, 0)
               end)
            until FaceBang == false
            if FaceBang == false then
               LocalPlayer.Character.Humanoid.Sit = false
               LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
            end
         end)
         UIManager.Toggle("Suck", function(ison)
            local target = GetPlayerByName(TargetTextBox.Text)
            Bang = false
            Suck, Benx = ison, false
            HeadSit = false
            FaceBang = false
            Stand = false
            repeat
               task.wait()
               pcall(function()
                  local LocalPlayerChar = LocalPlayer
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.LowerTorso.CFrame * CFrame.new(0, -1, -1.7) * CFrame.Angles(0, -3.3, 0)
               end)
            until Suck == false
            if Suck == false then
               LocalPlayer.Character.Humanoid.Sit = false
            end
         end)
         UIManager.Toggle("Head Sit", function(ison)
            local target = GetPlayerByName(TargetTextBox.Text)
            Bang = false
            Benx = false
            HeadSit, Suck = ison, false
            FaceBang = false
            Stand = false
            repeat
               task.wait()
               pcall(function()
                  local LocalPlayerChar = LocalPlayer
                  LocalPlayerChar.Character.Humanoid.Sit = true
                  LocalPlayerChar.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                  LocalPlayerChar.Character.HumanoidRootPart.CFrame = target.Character.Head.CFrame * CFrame.new(0, 1.3, 1)
               end)
            until HeadSit == false
            if HeadSit == false then
               LocalPlayer.Character.Humanoid.Sit = false
            end
         end)
         UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
         UIManager.PageFix(PageScrollingFrame, TabsScrollingFrame)
      end
   end
   return UIManager
end
local AtomicHub = Toggles.Win("Atomic Hub | Sword Fight ", { -- this is a placeholder for the original string, as it was not in the provided code.
})
local HomePageTab = AtomicHub:Tab("Home", true)
local PlayerHeadshot = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"
HomePageTab:ImageLabel(PlayerHeadshot, "Welcome "..game.Players.LocalPlayer.DisplayName, "@"..game.Players.LocalPlayer.Name)
if game.Players.LocalPlayer.Name == "mjsij1" then
   HomePageTab:Info("V1", "Dev", "Latest Version")
else
   HomePageTab:Info("V1", "User", "nil")
end
HomePageTab:PageFix()
HomePageTab:PageFix()
local GameTab = AtomicHub:Tab("Game")
GameTab:Button("Show Player Labels", function()
   local DefaultColor = Color3.new(1, 1, 1)
   local AlwaysOnTop = "AlwaysOnTop"
   local TextTransparency = 0
   local StrokeColor = Color3.new(1, 1, 1)
   local StrokeTransparency = 0
   local CoreGui = game:GetService("CoreGui")
   local Players = game:GetService("Players")
   local HighlightStorage = Instance.new("Folder")
   HighlightStorage.Parent = CoreGui
   HighlightStorage.Name = "Highlight_Storage"
   local function CreateHighlight(player)
      local BillboardGui = Instance.new("BillboardGui")
      BillboardGui.Name = player.Name
      BillboardGui.Adornee = player.Character:WaitForChild("Head")
      BillboardGui.Size = UDim2.new(1, 0, 1, 0)
      BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
      BillboardGui.MaxDistance = 100
      BillboardGui.AlwaysOnTop = true
      local TextLabel = Instance.new("TextLabel")
      TextLabel.Text = "Name: "..player.Name
      TextLabel.Size = UDim2.new(1, 0, 1, 0)
      TextLabel.TextColor3 = DefaultColor
      TextLabel.TextStrokeTransparency = StrokeTransparency
      TextLabel.TextStrokeColor3 = StrokeColor
      TextLabel.TextTransparency = TextTransparency
      TextLabel.Parent = BillboardGui
      BillboardGui.Parent = HighlightStorage
   end
   Players.PlayerAdded:Connect(CreateHighlight)
   for _, player in pairs(Players:GetPlayers()) do
      CreateHighlight(player)
   end
   Players.PlayerRemoving:Connect(function(player)
      local playerName = player.Name
      if HighlightStorage:FindFirstChild(playerName) then
         HighlightStorage[playerName]:Destroy()
      end
   end)
end)
GameTab:Toggle("Noclip", function(ison)
   if ison then
      game:GetService("RunService"):BindToRenderStep("Noclip", 0, function()
         for _, part in pairs(LocalPlayer.Character:GetChildren()) do
            if part:IsA("BasePart") and part.CanCollide == true then
               part.CanCollide = false
            end
         end
      end)
      break
   end
   if ison == false then
      game:GetService("RunService"):UnbindFromRenderStep("Noclip")
      for _, part in pairs(LocalPlayer.Character:GetChildren()) do
         if part:IsA("BasePart") and part.CanCollide == false then
            part.CanCollide = true
         end
      end
   end
end)
_G.Speed = 2
GameTab:PageFix()
GameTab:PageFix()
local AutoTab = AtomicHub:Tab("Auto")
local AutoFarmEnabled = false
AutoTab:Toggle("Auto Farm", function(ison)
   AutoFarmEnabled = ison
   if AutoFarmEnabled then
      LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-783.429688, 109.916542, -629.649048, 0.94764632, 0.000000023627809, -0.31932193, -0.0000000100019149, 1, 0.0000000443111787, 0.31932193, -0.000000038797495, 0.94764632)
   else
      LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-769.833923, 110.01004, -443.783783, -0.999981284, 0, 0.00611704402, 0, 1, 0, -0.00611704402, 0, -0.999981284)
   end
end)
AutoTab:Toggle("Auto Play", function(ison)
end)
local DevTab = AtomicHub:Tab("Developers")
DevTab:ImageLabel("https://www.roblox.com/headshot-thumbnail/image?userId=1847542223&width=420&height=420&format=png", "N0kia", "Scripter / Ui Designer")
DevTab:ImageLabel("https://www.roblox.com/headshot-thumbnail/image?userId=1259903042&width=420&height=420&format=png", "Banda Mod", "Famous / Showcaser/Scripter")
DevTab:PageFix()
local AdminUserIds = {
   4334994690,
   12982577,
   3933568115
}
coroutine.resume(coroutine.create(function()
   while wait(6) do
      pcall(function()
         for _, player in pairs(game.Players:GetChildren()) do
            if player.Character and table.find(AdminUserIds, player.UserId) then
               player.Character.Humanoid.DisplayName = "[Admin]"..player.DisplayName
            end
         end
      end)
   end
end))
