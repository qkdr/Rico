-- ts file was generated at discord.gg/25ms

local v1, v2, v3 = pairs(game.CoreGui:GetChildren())

while true do
    local v4

    v3, v4 = v1(v2, v3)

    if v3 == nil then
        break
    end
    if v4.Name == 'AtomicUi' or v4.Name == 'Abyss' or (v4.Name == 'FlyGui' or v4.Name == 'OpenButton') then
        v4:Destroy()
    end
end

local function u59(p5)
    local v6 = {p5}
    local _Players = game:GetService('Players')
    local _LocalPlayer = _Players.LocalPlayer
    local u9 = false

    local function v17(p10)
        local v11 = p10:lower()

        if v11 == 'all' or v11 == 'others' then
            u9 = true

            return
        elseif v11 == 'random' then
            local v12 = _Players:GetPlayers()

            if table.find(v12, _LocalPlayer) then
                table.remove(v12, table.find(v12, _LocalPlayer))
            end

            return v12[math.random(#v12)]
        elseif v11 ~= 'random' and v11 ~= 'all' and v11 ~= 'others' then
            local v13 = next
            local v14, v15 = _Players:GetPlayers()

            while true do
                local v16

                v15, v16 = v13(v14, v15)

                if v15 == nil then
                    break
                end
                if v16 ~= _LocalPlayer then
                    if v16.Name:lower():match('^' .. v11) then
                        return v16
                    end
                    if v16.DisplayName:lower():match('^' .. v11) then
                        return v16
                    end
                end
            end
        end
    end
    local function v43(p18)
        local _Character = _LocalPlayer.Character
        local u20

        if _Character then
            u20 = _Character:FindFirstChildOfClass('Humanoid')
        else
            u20 = _Character
        end

        local u21

        if u20 then
            u21 = u20.RootPart
        else
            u21 = u20
        end

        local _Character2 = p18.Character
        local u23 = nil
        local v24 = nil
        local v25 = nil
        local v26 = nil
        local u27

        if _Character2:FindFirstChildOfClass('Humanoid') then
            u27 = _Character2:FindFirstChildOfClass('Humanoid')
        else
            u27 = nil
        end
        if u27 and u27.RootPart then
            u23 = u27.RootPart
        end
        if _Character2:FindFirstChild('Head') then
            v24 = _Character2.Head
        end
        if _Character2:FindFirstChildOfClass('Accessory') then
            v25 = _Character2:FindFirstChildOfClass('Accessory')
        end
        if Accessoy and v25:FindFirstChild('Handle') then
            v26 = v25.Handle
        end
        if _Character and u20 and u21 then
            if u21.Velocity.Magnitude < 50 then
                getgenv().OldPos = u21.CFrame
            end
            if u27 and u27.Sit and not u9 then
                return
            else
                if v24 then
                    workspace.CurrentCamera.CameraSubject = v24
                elseif v24 or not v26 then
                    if u27 and u23 then
                        workspace.CurrentCamera.CameraSubject = u27
                    end
                else
                    workspace.CurrentCamera.CameraSubject = v26
                end
                if _Character2:FindFirstChildWhichIsA('BasePart') then
                    local function u31(p28, p29, p30)
                        u21.CFrame = CFrame.new(p28.Position) * p29 * p30

                        _Character:SetPrimaryPartCFrame(CFrame.new(p28.Position) * p29 * p30)

                        u21.Velocity = Vector3.new(90000000, 900000000, 90000000)
                        u21.RotVelocity = Vector3.new(900000000, 900000000, 900000000)
                    end
                    local function v36(p32)
                        local v33 = tick()
                        local v34 = 2
                        local v35 = 0

                        while u21 and u27 do
                            if p32.Velocity.Magnitude >= 50 then
                                u31(p32, CFrame.new(0, 1.5, u27.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, -u27.WalkSpeed), CFrame.Angles(0, 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, 1.5, u27.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, 1.5, u23.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, -u23.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, 1.5, u23.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                task.wait()
                            else
                                v35 = v35 + 100

                                u31(p32, CFrame.new(0, 1.5, 0) + u27.MoveDirection * p32.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0) + u27.MoveDirection * p32.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(2.25, 1.5, -2.25) + u27.MoveDirection * p32.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(-2.25, -1.5, 2.25) + u27.MoveDirection * p32.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, 1.5, 0) + u27.MoveDirection, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                                u31(p32, CFrame.new(0, -1.5, 0) + u27.MoveDirection, CFrame.Angles(math.rad(v35), 0, 0))
                                task.wait()
                            end
                            if p32.Velocity.Magnitude > 500 or p32.Parent ~= p18.Character or (p18.Parent ~= _Players or not p18.Character == _Character2) or (u27.Sit or u20.Health <= 0 or tick() > v33 + v34) then
                                break
                            end
                        end
                    end

                    workspace.FallenPartsDestroyHeight = 0 / 0

                    local _BodyVelocity = Instance.new('BodyVelocity')

                    _BodyVelocity.Name = 'EpixVel'
                    _BodyVelocity.Parent = u21
                    _BodyVelocity.Velocity = Vector3.new(900000000, 900000000, 900000000)
                    _BodyVelocity.MaxForce = Vector3.new(1 / 0, 1 / 0, 1 / 0)

                    u20:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if u23 and v24 then
                        if (u23.CFrame.p - v24.CFrame.p).Magnitude <= 5 then
                            v36(u23)
                        else
                            v36(v24)
                        end
                    elseif u23 and not v24 then
                        v36(u23)
                    elseif u23 or not v24 then
                        if u23 or v24 or not (v25 and v26) then
                            return
                        end

                        v36(v26)
                    else
                        v36(v24)
                    end

                    _BodyVelocity:Destroy()
                    u20:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

                    workspace.CurrentCamera.CameraSubject = u20

                    repeat
                        u21.CFrame = getgenv().OldPos * CFrame.new(0, 0.5, 0)

                        local v38 = _Character

                        _Character.SetPrimaryPartCFrame(v38, getgenv().OldPos * CFrame.new(0, 0.5, 0))

                        local v39 = u20

                        u20.ChangeState(v39, 'GettingUp')

                        local v40 = _Character

                        table.foreach(_Character.GetChildren(v40), function(_, p41)
                            if p41:IsA('BasePart') then
                                local v42 = Vector3.new()

                                p41.RotVelocity = Vector3.new()
                                p41.Velocity = v42
                            end
                        end)
                        task.wait()
                    until (u21.Position - getgenv().OldPos.p).Magnitude < 25

                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                end
            end
        else
            return
        end
    end

    getgenv().Welcome = true

    if v6[1] then
        local v44 = next
        local v45 = _LocalPlayer
        local v46 = v6
        local v47 = _Players
        local v48 = u9
        local v49 = nil

        while true do
            local v50

            v49, v50 = v44(v6, v49)

            if v49 == nil then
                break
            end

            v17(v50)
        end

        if v48 then
            local v51 = next
            local v52, v53 = v47:GetPlayers()

            while true do
                local v54

                v53, v54 = v51(v52, v53)

                if v53 == nil then
                    break
                end

                v43(v54)
            end
        end

        local v55 = next
        local v56 = nil

        while true do
            local v57

            v56, v57 = v55(v46, v56)

            if v56 == nil then
                break
            end
            if v17(v57) and v17(v57) ~= v45 then
                local v58 = v17(v57)

                if v58 then
                    v43(v58)
                end
            end
        end
    end
end

if not (syn and syn.queue_on_teleport) and (not queue_on_teleport and fluxus) then
    local _ = fluxus.queue_on_teleport
end

local v60 = {}
local v61 = {}
local _LocalPlayer2 = game.Players.LocalPlayer
local _Character3 = game.Players.LocalPlayer.Character

if _Character3 then
    _Character3:FindFirstChildWhichIsA('Humanoid')
end

nowe = false
speeds = 1

local _ScreenGui = Instance.new('ScreenGui')
local _ImageButton = Instance.new('ImageButton')
local _UICorner = Instance.new('UICorner')

_ScreenGui.Name = 'FlyGui'
_ScreenGui.Parent = game.CoreGui
_ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
_ImageButton.Parent = _ScreenGui
_ImageButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
_ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
_ImageButton.BorderSizePixel = 0
_ImageButton.Position = UDim2.new(0.929370999, 0, 0.510522664, 0)
_ImageButton.Size = UDim2.new(0, 40, 0, 40)
_ImageButton.Image = 'rbxassetid://11419709766'
_ImageButton.Visible = false
_UICorner.Parent = _ImageButton

_ImageButton.MouseButton1Down:connect(function()
    if nowe ~= true then
        nowe = true
        _ImageButton.Image = 'rbxassetid://11419719540'

        for _ = 1, speeds do
            spawn(function()
                local _Heartbeat = game:GetService('RunService').Heartbeat

                tpwalking = true

                local _Character4 = game.Players.LocalPlayer.Character
                local v69

                if _Character4 then
                    v69 = _Character4:FindFirstChildWhichIsA('Humanoid')
                else
                    v69 = _Character4
                end

                while tpwalking and _Heartbeat:Wait() and (_Character4 and v69) and v69.Parent do
                    if v69.MoveDirection.Magnitude > 0 then
                        _Character4:TranslateBy(v69.MoveDirection)
                    end
                end
            end)
        end

        game.Players.LocalPlayer.Character.Animate.Disabled = true

        local _Character5 = game.Players.LocalPlayer.Character
        local v71 = _Character5:FindFirstChildOfClass('Humanoid') or _Character5:FindFirstChildOfClass('AnimationController')
        local v72 = next
        local v73, v74 = v71:GetPlayingAnimationTracks()

        while true do
            local v75

            v74, v75 = v72(v73, v74)

            if v74 == nil then
                break
            end

            v75:AdjustSpeed(0)
        end

        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, false)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
        _LocalPlayer2.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
    else
        nowe = false
        _ImageButton.Image = 'rbxassetid://11419709766'

        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics, true)
        _LocalPlayer2.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
        _LocalPlayer2.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
    if game:GetService('Players').LocalPlayer.Character:FindFirstChildOfClass('Humanoid').RigType ~= Enum.HumanoidRigType.R6 then
        local _LocalPlayer3 = game.Players.LocalPlayer
        local _UpperTorso = _LocalPlayer3.Character.UpperTorso
        local v78 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local v79 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local v80 = 50
        local v81 = 0
        local _BodyGyro = Instance.new('BodyGyro', _UpperTorso)

        _BodyGyro.P = 90000
        _BodyGyro.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        _BodyGyro.cframe = _UpperTorso.CFrame

        local _BodyVelocity2 = Instance.new('BodyVelocity', _UpperTorso)

        _BodyVelocity2.velocity = Vector3.new(0, 0.1, 0)
        _BodyVelocity2.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)

        if nowe == true then
            _LocalPlayer3.Character.Humanoid.PlatformStand = true
        end

        while nowe == true or game:GetService('Players').LocalPlayer.Character.Humanoid.Health == 0 do
            wait()

            if v78.l + v78.r ~= 0 or v78.f + v78.b ~= 0 then
                v81 = v81 + 0.5 + v81 / v80

                if v80 < v81 then
                    v81 = v80
                end
            elseif v78.l + v78.r == 0 and v78.f + v78.b == 0 and v81 ~= 0 then
                local v84 = v81 - 1

                v81 = v84 < 0 and 0 or v84
            end
            if v78.l + v78.r ~= 0 or v78.f + v78.b ~= 0 then
                _BodyVelocity2.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (v78.f + v78.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(v78.l + v78.r, (v78.f + v78.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v81
                v79 = {
                    f = v78.f,
                    b = v78.b,
                    l = v78.l,
                    r = v78.r,
                }
            elseif v78.l + v78.r ~= 0 or v78.f + v78.b ~= 0 or v81 == 0 then
                _BodyVelocity2.velocity = Vector3.new(0, 0, 0)
            else
                _BodyVelocity2.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (v79.f + v79.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(v79.l + v79.r, (v79.f + v79.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v81
            end

            _BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((v78.f + v78.b) * 50 * v81 / v80), 0, 0)
        end

        _BodyGyro:Destroy()
        _BodyVelocity2:Destroy()

        _LocalPlayer3.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    else
        local _LocalPlayer4 = game.Players.LocalPlayer
        local _Torso = _LocalPlayer4.Character.Torso
        local v87 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local v88 = {
            f = 0,
            b = 0,
            l = 0,
            r = 0,
        }
        local v89 = 50
        local v90 = 0
        local _BodyGyro2 = Instance.new('BodyGyro', _Torso)

        _BodyGyro2.P = 90000
        _BodyGyro2.maxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        _BodyGyro2.cframe = _Torso.CFrame

        local _BodyVelocity3 = Instance.new('BodyVelocity', _Torso)

        _BodyVelocity3.velocity = Vector3.new(0, 0.1, 0)
        _BodyVelocity3.maxForce = Vector3.new(9000000000, 9000000000, 9000000000)

        if nowe == true then
            _LocalPlayer4.Character.Humanoid.PlatformStand = true
        end

        while nowe == true or game:GetService('Players').LocalPlayer.Character.Humanoid.Health == 0 do
            game:GetService('RunService').RenderStepped:Wait()

            if v87.l + v87.r ~= 0 or v87.f + v87.b ~= 0 then
                v90 = v90 + 0.5 + v90 / v89

                if v89 < v90 then
                    v90 = v89
                end
            elseif v87.l + v87.r == 0 and v87.f + v87.b == 0 and v90 ~= 0 then
                local v93 = v90 - 1

                v90 = v93 < 0 and 0 or v93
            end
            if v87.l + v87.r ~= 0 or v87.f + v87.b ~= 0 then
                _BodyVelocity3.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (v87.f + v87.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(v87.l + v87.r, (v87.f + v87.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v90
                v88 = {
                    f = v87.f,
                    b = v87.b,
                    l = v87.l,
                    r = v87.r,
                }
            elseif v87.l + v87.r ~= 0 or v87.f + v87.b ~= 0 or v90 == 0 then
                _BodyVelocity3.velocity = Vector3.new(0, 0, 0)
            else
                _BodyVelocity3.velocity = (game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (v88.f + v88.b) + (game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(v88.l + v88.r, (v88.f + v88.b) * 0.2, 0).p - game.Workspace.CurrentCamera.CoordinateFrame.p)) * v90
            end

            _BodyGyro2.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((v87.f + v87.b) * 50 * v90 / v89), 0, 0)
        end

        _BodyGyro2:Destroy()
        _BodyVelocity3:Destroy()

        _LocalPlayer4.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    end
end)

local _ScreenGui2 = Instance.new('ScreenGui')

_ScreenGui2.Name = 'Abyss'
_ScreenGui2.Parent = game.CoreGui
_ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function v60.Notify(_, p95, p96, p97)
    local _Frame = Instance.new('Frame')
    local _Frame2 = Instance.new('Frame')
    local _ImageLabel = Instance.new('ImageLabel')
    local _UICorner2 = Instance.new('UICorner')
    local _TextLabel = Instance.new('TextLabel')
    local _TextLabel2 = Instance.new('TextLabel')

    _Frame.Name = 'Notification'
    _Frame.Parent = _ScreenGui2
    _Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    _Frame.BackgroundTransparency = 0.4
    _Frame.BorderSizePixel = 0
    _Frame.Position = UDim2.new(1, 5, 0, 75)
    _Frame.Size = UDim2.new(0, 450, 0, 60)
    _Frame2.Name = 'Line'
    _Frame2.Parent = _Frame
    _Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame2.BorderSizePixel = 0
    _Frame2.Position = UDim2.new(0, 0, 0.938461304, 0)
    _Frame2.Size = UDim2.new(0, 0, 0, 4)
    _ImageLabel.Name = 'Warning'
    _ImageLabel.Parent = _Frame
    _ImageLabel.BackgroundTransparency = 1
    _ImageLabel.Position = UDim2.new(0.0258302614, 0, 0.0897435844, 0)
    _ImageLabel.Size = UDim2.new(0, 44, 0, 49)
    _ImageLabel.Image = 'rbxassetid://3944668821'
    _ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
    _ImageLabel.ScaleType = Enum.ScaleType.Fit
    _UICorner2.CornerRadius = UDim.new(0, 20)
    _UICorner2.Parent = _ImageLabel
    _TextLabel.Name = 'Title'
    _TextLabel.Parent = _Frame
    _TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.BackgroundTransparency = 1
    _TextLabel.Position = UDim2.new(0.161, 0, 0.155, 0)
    _TextLabel.Size = UDim2.new(0, 205, 0, 15)
    _TextLabel.Text = p95
    _TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel.TextSize = 12
    _TextLabel.TextStrokeTransparency = 2
    _TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    _TextLabel2.Name = 'Description'
    _TextLabel2.Parent = _Frame
    _TextLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel2.BackgroundTransparency = 1
    _TextLabel2.Position = UDim2.new(0.161, 0, 0.483, 0)
    _TextLabel2.Size = UDim2.new(0, 205, 0, 18)
    _TextLabel2.Text = p96
    _TextLabel2.TextColor3 = Color3.fromRGB(199, 199, 199)
    _TextLabel2.TextSize = 12
    _TextLabel2.TextStrokeTransparency = 2
    _TextLabel2.TextXAlignment = Enum.TextXAlignment.Left

    _Frame:TweenPosition(UDim2.new(1, -400, 0, 75), 'Out', 'Sine', 0.35)
    wait(0.35)
    _Frame2:TweenSize(UDim2.new(0, 450, 0, 4), 'Out', 'Linear', p97)
    wait(p97)
    _Frame:TweenPosition(UDim2.new(1, 5, 0, 75), 'Out', 'Sine', 0.35)
    wait(0.35)
    _Frame:Destroy()
end
function v61.Win(_, p104, _)
    local _ScreenGui3 = Instance.new('ScreenGui')
    local _Frame3 = Instance.new('Frame')
    local _UICorner3 = Instance.new('UICorner')
    local _UIStroke = Instance.new('UIStroke')
    local _ImageLabel2 = Instance.new('ImageLabel')
    local _ImageLabel3 = Instance.new('ImageLabel')
    local _Frame4 = Instance.new('Frame')
    local _UICorner4 = Instance.new('UICorner')
    local _UIStroke2 = Instance.new('UIStroke')
    local _ImageButton2 = Instance.new('ImageButton')
    local _TextLabel3 = Instance.new('TextLabel')
    local _Frame5 = Instance.new('Frame')
    local _UICorner5 = Instance.new('UICorner')
    local _UIStroke3 = Instance.new('UIStroke')
    local _Frame6 = Instance.new('Frame')
    local _UICorner6 = Instance.new('UICorner')
    local _UIStroke4 = Instance.new('UIStroke')
    local _ImageLabel4 = Instance.new('ImageLabel')
    local _ScrollingFrame = Instance.new('ScrollingFrame')
    local _UIListLayout = Instance.new('UIListLayout')
    local _Frame7 = Instance.new('Frame')

    _ScreenGui3.Name = 'AtomicUi'
    _ScreenGui3.Parent = game.CoreGui
    _ScreenGui3.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _Frame3.Parent = _ScreenGui3
    _Frame3.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
    _Frame3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame3.BorderSizePixel = 0
    _Frame3.Position = UDim2.new(0.263157904, 0, 0.298927605, 0)
    _Frame3.Size = UDim2.new(0, 440, 0, 300)
    _UICorner3.Name = 'FrameCorner'
    _UICorner3.Parent = _Frame3
    _UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    _UIStroke.Color = Color3.fromRGB(135, 135, 135)
    _UIStroke.Name = 'FrameStroke'
    _UIStroke.Parent = _Frame3
    _ImageLabel2.Name = 'FrameShadow2'
    _ImageLabel2.Parent = _Frame3
    _ImageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel2.BackgroundTransparency = 1
    _ImageLabel2.BorderSizePixel = 0
    _ImageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel2.Size = UDim2.new(1, 47, 1, 47)
    _ImageLabel2.ZIndex = 0
    _ImageLabel2.Image = 'rbxassetid://6015897843'
    _ImageLabel2.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel2.ImageTransparency = 0.5
    _ImageLabel2.ScaleType = Enum.ScaleType.Slice
    _ImageLabel2.SliceCenter = Rect.new(49, 49, 450, 450)
    _Frame6.Name = 'Tabs'
    _Frame6.Parent = _Frame3
    _Frame6.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    _Frame6.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame6.BorderSizePixel = 0
    _Frame6.Position = UDim2.new(0.0181818176, 0, 0.163333327, 0)
    _Frame6.Size = UDim2.new(0, 116, 0, 238)
    _UICorner6.CornerRadius = UDim.new(0, 4)
    _UICorner6.Name = 'TabsCorner'
    _UICorner6.Parent = _Frame6
    _UIStroke4.Color = Color3.fromRGB(74, 74, 74)
    _UIStroke4.Name = 'TabsStroke'
    _UIStroke4.Parent = _Frame6
    _ImageLabel4.Name = 'TabsShadow'
    _ImageLabel4.Parent = _Frame6
    _ImageLabel4.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel4.BackgroundTransparency = 1
    _ImageLabel4.BorderSizePixel = 0
    _ImageLabel4.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel4.Size = UDim2.new(1, 47, 1, 47)
    _ImageLabel4.ZIndex = 0
    _ImageLabel4.Image = 'rbxassetid://6014261993'
    _ImageLabel4.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel4.ImageTransparency = 0.5
    _ImageLabel4.ScaleType = Enum.ScaleType.Slice
    _ImageLabel4.SliceCenter = Rect.new(49, 49, 450, 450)
    _ScrollingFrame.Name = 'TabsScrolling'
    _ScrollingFrame.Parent = _Frame6
    _ScrollingFrame.Active = true
    _ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ScrollingFrame.BackgroundTransparency = 2
    _ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ScrollingFrame.BorderSizePixel = 0
    _ScrollingFrame.Size = UDim2.new(0, 116, 0, 238)
    _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    _ScrollingFrame.ScrollBarThickness = 4
    _UIListLayout.Name = 'TabsListLayout'
    _UIListLayout.Parent = _ScrollingFrame
    _UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    _UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    _UIListLayout.Padding = UDim.new(0, 5)
    _Frame7.Name = 'TabsFixFrame'
    _Frame7.Parent = _ScrollingFrame
    _Frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _Frame7.BackgroundTransparency = 2
    _Frame7.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame7.BorderSizePixel = 0
    _Frame7.Position = UDim2.new(0.068965517, 0, 0, 0)
    _Frame7.Size = UDim2.new(0, 100, 0, 6)
    _ImageLabel3.Name = 'PagesShadow'
    _ImageLabel3.Parent = _Frame5
    _ImageLabel3.AnchorPoint = Vector2.new(0.5, 0.5)
    _ImageLabel3.BackgroundTransparency = 1
    _ImageLabel3.BorderSizePixel = 0
    _ImageLabel3.Position = UDim2.new(0.5, 0, 0.5, 0)
    _ImageLabel3.Size = UDim2.new(1, 47, 1, 47)
    _ImageLabel3.ZIndex = 0
    _ImageLabel3.Image = 'rbxassetid://6014261993'
    _ImageLabel3.ImageColor3 = Color3.fromRGB(0, 0, 0)
    _ImageLabel3.ImageTransparency = 0.5
    _ImageLabel3.ScaleType = Enum.ScaleType.Slice
    _ImageLabel3.SliceCenter = Rect.new(49, 49, 450, 450)
    _Frame4.Name = 'Line'
    _Frame4.Parent = _Frame3
    _Frame4.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    _Frame4.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame4.BorderSizePixel = 0
    _Frame4.Size = UDim2.new(0, 440, 0, 34)
    _UICorner4.CornerRadius = UDim.new(0, 4)
    _UICorner4.Name = 'LineCorner'
    _UICorner4.Parent = _Frame4
    _UIStroke2.Color = Color3.fromRGB(74, 74, 74)
    _UIStroke2.Name = 'LineStroke'
    _UIStroke2.Parent = _Frame4

    local _ScreenGui4 = Instance.new('ScreenGui')
    local _ImageButton3 = Instance.new('ImageButton')
    local _UICorner7 = Instance.new('UICorner')

    _ScreenGui4.Name = 'OpenButton'
    _ScreenGui4.Parent = game.CoreGui
    _ScreenGui4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    _ImageButton3.Name = 'OpenButtonImage'
    _ImageButton3.Parent = _ScreenGui4
    _ImageButton3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    _ImageButton3.BackgroundTransparency = 0.65
    _ImageButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ImageButton3.BorderSizePixel = 0
    _ImageButton3.Position = UDim2.new(0.102097899, 0, 0.0742971897, 0)
    _ImageButton3.Size = UDim2.new(0, 45, 0, 45)
    _ImageButton3.Image = 'rbxassetid://11963368259'
    _ImageButton3.Draggable = true
    _ImageButton3.Selectable = true
    _ImageButton3.Active = true
    _UICorner7.CornerRadius = UDim.new(0, 50)
    _UICorner7.Name = 'OpenButtonCorner'
    _UICorner7.Parent = _ImageButton3

    _ImageButton3.MouseButton1Down:Connect(function()
        _Frame3.Visible = not _Frame3.Visible
    end)

    _ImageButton2.Name = 'CloseButton'
    _ImageButton2.Parent = _Frame4
    _ImageButton2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _ImageButton2.BackgroundTransparency = 2
    _ImageButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _ImageButton2.BorderSizePixel = 0
    _ImageButton2.Position = UDim2.new(0.936363637, 0, 0.235294119, 0)
    _ImageButton2.Size = UDim2.new(0, 17, 0, 17)
    _ImageButton2.Image = 'rbxassetid://11293981586'

    _ImageButton2.MouseButton1Down:Connect(function()
        _Frame3.Visible = not _Frame3.Visible
    end)
    _ImageButton2.MouseEnter:Connect(function()
        game:GetService('TweenService'):Create(_ImageButton2, TweenInfo.new(0.25), {
            ImageColor3 = Color3.fromRGB(120, 0, 0),
        }):Play()
    end)
    _ImageButton2.MouseLeave:Connect(function()
        game:GetService('TweenService'):Create(_ImageButton2, TweenInfo.new(0.25), {
            ImageColor3 = Color3.fromRGB(255, 255, 255),
        }):Play()
    end)

    _TextLabel3.Name = 'Text'
    _TextLabel3.Parent = _Frame4
    _TextLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel3.BackgroundTransparency = 2
    _TextLabel3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _TextLabel3.BorderSizePixel = 0
    _TextLabel3.Position = UDim2.new(0.0181818176, 0, 0, 0)
    _TextLabel3.Size = UDim2.new(0, 366, 0, 34)
    _TextLabel3.Font = Enum.Font.RobotoCondensed
    _TextLabel3.Text = p104
    _TextLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
    _TextLabel3.TextSize = 19
    _TextLabel3.TextXAlignment = Enum.TextXAlignment.Left
    _Frame5.Name = 'Pages'
    _Frame5.Parent = _Frame3
    _Frame5.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    _Frame5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    _Frame5.BorderSizePixel = 0
    _Frame5.Position = UDim2.new(0.302272737, 0, 0.163333327, 0)
    _Frame5.Size = UDim2.new(0, 296, 0, 238)
    _UICorner5.CornerRadius = UDim.new(0, 4)
    _UICorner5.Name = 'PagesCorner'
    _UICorner5.Parent = _Frame5
    _UIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    _UIStroke3.Color = Color3.fromRGB(74, 74, 74)
    _UIStroke3.Name = 'PagesStroke'
    _UIStroke3.Parent = _Frame5;

    (function()
        local _LocalScript = Instance.new('LocalScript', _Frame3)
        local _UserInputService = game:GetService('UserInputService')

        function dragify(p131)
            dragToggle = nil
            dragInput = nil
            dragStart = nil

            function updateInput(p132)
                local v133 = p132.Position - dragStart
                local v134 = UDim2.new(startPos.X.Scale, startPos.X.Offset + v133.X, startPos.Y.Scale, startPos.Y.Offset + v133.Y)

                game:GetService('TweenService'):Create(p131, TweenInfo.new(0.25), {Position = v134}):Play()
                game:GetService('TweenService'):Create(_UIStroke, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(255, 255, 255),
                }):Play()
                game:GetService('TweenService'):Create(_UIStroke2, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(155, 155, 155),
                }):Play()
            end

            p131.InputBegan:Connect(function(p135)
                if (p135.UserInputType == Enum.UserInputType.MouseButton1 or p135.UserInputType == Enum.UserInputType.Touch) and _UserInputService:GetFocusedTextBox() == nil then
                    dragToggle = true
                    dragStart = p135.Position
                    startPos = p131.Position

                    p135.Changed:Connect(function()
                        if p135.UserInputState == Enum.UserInputState.End then
                            dragToggle = false

                            game:GetService('TweenService'):Create(_UIStroke, TweenInfo.new(0.25), {
                                Color = Color3.fromRGB(135, 135, 135),
                            }):Play()
                            game:GetService('TweenService'):Create(_UIStroke2, TweenInfo.new(0.25), {
                                Color = Color3.fromRGB(74, 74, 74),
                            }):Play()
                        end
                    end)
                end
            end)
            p131.InputChanged:Connect(function(p136)
                if p136.UserInputType == Enum.UserInputType.MouseMovement or p136.UserInputType == Enum.UserInputType.Touch then
                    dragInput = p136
                end
            end)
            game:GetService('UserInputService').InputChanged:Connect(function(p137)
                if p137 == dragInput and dragToggle then
                    updateInput(p137)
                end
            end)
        end

        dragify(_LocalScript.Parent)
    end)()

    local _UserInputService2 = game:GetService('UserInputService')
    local _V = Enum.KeyCode.V
    local u140 = false

    function onKeyPress(p141, p142)
        pcall(function()
            if not p142 and p141.KeyCode == _V then
                if u140 ~= false then
                    if u140 == true then
                        _Frame3.Visible = true
                        u140 = false
                    end
                else
                    _Frame3.Visible = false
                    u140 = true
                end
            end
        end)
    end

    _UserInputService2.InputBegan:connect(onKeyPress)

    return {
        Tab = function(_, p143, p144)
            local _TextButton = Instance.new('TextButton')
            local _UICorner8 = Instance.new('UICorner')
            local _UIStroke5 = Instance.new('UIStroke')
            local _ScrollingFrame2 = Instance.new('ScrollingFrame')
            local _UIListLayout2 = Instance.new('UIListLayout')
            local _Frame8 = Instance.new('Frame')

            _TextButton.Name = 'TabButton'
            _TextButton.Parent = _ScrollingFrame
            _TextButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
            _TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _TextButton.BorderSizePixel = 0
            _TextButton.Position = UDim2.new(0.116379313, 0, 0.0420168079, 0)
            _TextButton.Size = UDim2.new(0, 89, 0, 23)
            _TextButton.AutoButtonColor = false
            _TextButton.Text = p143
            _TextButton.Font = Enum.Font.RobotoCondensed
            _TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            _TextButton.TextSize = 14
            _UICorner8.CornerRadius = UDim.new(0, 4)
            _UICorner8.Parent = _TextButton
            _UIStroke5.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            _UIStroke5.Color = Color3.fromRGB(62, 62, 62)
            _UIStroke5.Parent = _TextButton
            _Frame8.Name = 'Page'
            _Frame8.Parent = _Frame5
            _Frame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _Frame8.BackgroundTransparency = 2
            _Frame8.BorderColor3 = Color3.fromRGB(0, 0, 0)
            _Frame8.BorderSizePixel = 0
            _Frame8.Size = UDim2.new(0, 296, 0, 238)
            _Frame8.Visible = p144 or false
            _ScrollingFrame2.Name = 'PageScrolling'
            _ScrollingFrame2.Parent = _Frame8
            _ScrollingFrame2.Active = true
            _ScrollingFrame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            _ScrollingFrame2.BackgroundTransparency = 2
            _ScrollingFrame2.BorderColor3 = Color3.fromRGB(35, 35, 35)
            _ScrollingFrame2.BorderSizePixel = 0
            _ScrollingFrame2.Size = UDim2.new(0, 296, 0, 238)
            _ScrollingFrame2.CanvasPosition = Vector2.new(0, 300)
            _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
            _ScrollingFrame2.ScrollBarThickness = 4
            _UIListLayout2.Name = 'PageListLayout'
            _UIListLayout2.Parent = _ScrollingFrame2
            _UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
            _UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
            _UIListLayout2.Padding = UDim.new(0, 10)
            _ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout.AbsoluteContentSize.Y)

            _TextButton.MouseButton1Down:Connect(function()
                local v151 = _Frame5
                local v152, v153, v154 = pairs(v151:GetChildren())

                while true do
                    local v155

                    v154, v155 = v152(v153, v154)

                    if v154 == nil then
                        break
                    end
                    if v155:IsA('Frame') then
                        v155.Visible = false
                    end

                    _Frame8.Visible = true
                end

                game:GetService('TweenService'):Create(_UIStroke5, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(100, 100, 100),
                }):Play()
                wait(0.2)
                game:GetService('TweenService'):Create(_UIStroke5, TweenInfo.new(0.1), {
                    Color = Color3.fromRGB(62, 62, 62),
                }):Play()
            end)
            _TextButton.MouseEnter:Connect(function()
                game:GetService('TweenService'):Create(_UIStroke5, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(80, 80, 80),
                }):Play()
            end)
            _TextButton.MouseLeave:Connect(function()
                game:GetService('TweenService'):Create(_UIStroke5, TweenInfo.new(0.25), {
                    Color = Color3.fromRGB(62, 62, 62),
                }):Play()
            end)

            local u159 = {
                PageFix = function(_, p156)
                    local _Frame9 = Instance.new('Frame')

                    _Frame9.Name = 'FixFrame'
                    _Frame9.Parent = p156
                    _Frame9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame9.BackgroundTransparency = 2
                    _Frame9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame9.BorderSizePixel = 0
                    _Frame9.Position = UDim2.new(0.331081092, 0, 0, 0)
                    _Frame9.Size = UDim2.new(0, 100, 0, 0)
                end,
                TabFix = function(_)
                    local _Frame10 = Instance.new('Frame')

                    _Frame10.Name = 'FixFrame'
                    _Frame10.Parent = _ScrollingFrame2
                    _Frame10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    _Frame10.BackgroundTransparency = 2
                    _Frame10.BorderColor3 = Color3.fromRGB(0, 0, 0)
                    _Frame10.BorderSizePixel = 0
                    _Frame10.Position = UDim2.new(0.331081092, 0, 0, 0)
                    _Frame10.Size = UDim2.new(0, 100, 0, 0)
                    _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)
                end,
            }
            local v160 = u159

            u159.PageFix(v160, _ScrollingFrame2)

            local v161 = u159

            u159.PageFix(v161, _ScrollingFrame)

            function u159.ImageLabel(_, p162, p163, p164)
                local _Frame11 = Instance.new('Frame')
                local _UICorner9 = Instance.new('UICorner')
                local _UIStroke6 = Instance.new('UIStroke')
                local _ImageLabel5 = Instance.new('ImageLabel')
                local _UICorner10 = Instance.new('UICorner')
                local _TextLabel4 = Instance.new('TextLabel')
                local _TextLabel5 = Instance.new('TextLabel')

                _Frame11.Name = 'WlcFrame'
                _Frame11.Parent = _ScrollingFrame2
                _Frame11.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame11.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame11.BorderSizePixel = 0
                _Frame11.Position = UDim2.new(-0.256756753, 0, 0.0882352963, 0)
                _Frame11.Size = UDim2.new(0, 274, 0, 100)
                _UICorner9.Name = 'WlcFrameCorner'
                _UICorner9.Parent = _Frame11
                _UIStroke6.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke6.Name = 'WlcFrameStroke'
                _UIStroke6.Parent = _Frame11
                _ImageLabel5.Name = 'PlayerImage'
                _ImageLabel5.Parent = _Frame11
                _ImageLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel5.BackgroundTransparency = 2
                _ImageLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel5.BorderSizePixel = 0
                _ImageLabel5.Position = UDim2.new(0.0729926974, 0, 0.150000006, 0)
                _ImageLabel5.Size = UDim2.new(0, 70, 0, 70)
                _ImageLabel5.Image = p162
                _UICorner10.CornerRadius = UDim.new(0, 444)
                _UICorner10.Name = 'PlayerImageCorner'
                _UICorner10.Parent = _ImageLabel5
                _TextLabel4.Name = 'PlayerName'
                _TextLabel4.Parent = _Frame11
                _TextLabel4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel4.BackgroundTransparency = 2
                _TextLabel4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel4.BorderSizePixel = 0
                _TextLabel4.Position = UDim2.new(0.37956205, 0, 0.25999999, 0)
                _TextLabel4.Size = UDim2.new(0, 164, 0, 27)
                _TextLabel4.Font = Enum.Font.RobotoCondensed
                _TextLabel4.Text = p163
                _TextLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel4.TextSize = 20
                _TextLabel4.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel5.Name = 'PlayerDisplayName'
                _TextLabel5.Parent = _Frame11
                _TextLabel5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel5.BackgroundTransparency = 2
                _TextLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel5.BorderSizePixel = 0
                _TextLabel5.Position = UDim2.new(0.37956205, 0, 0.529999971, 0)
                _TextLabel5.Size = UDim2.new(0, 144, 0, 18)
                _TextLabel5.Font = Enum.Font.RobotoCondensed
                _TextLabel5.Text = p164
                _TextLabel5.TextColor3 = Color3.fromRGB(134, 134, 134)
                _TextLabel5.TextSize = 15
                _TextLabel5.TextXAlignment = Enum.TextXAlignment.Left
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)
            end
            function u159.Info(_, p172, p173, p174)
                local _Frame12 = Instance.new('Frame')
                local _UICorner11 = Instance.new('UICorner')
                local _UIStroke7 = Instance.new('UIStroke')
                local _Frame13 = Instance.new('Frame')
                local _UICorner12 = Instance.new('UICorner')
                local _UIStroke8 = Instance.new('UIStroke')
                local _TextLabel6 = Instance.new('TextLabel')
                local _TextLabel7 = Instance.new('TextLabel')
                local _Frame14 = Instance.new('Frame')
                local _UICorner13 = Instance.new('UICorner')
                local _UIStroke9 = Instance.new('UIStroke')
                local _TextLabel8 = Instance.new('TextLabel')
                local _TextLabel9 = Instance.new('TextLabel')
                local _Frame15 = Instance.new('Frame')
                local _UICorner14 = Instance.new('UICorner')
                local _UIStroke10 = Instance.new('UIStroke')
                local _TextLabel10 = Instance.new('TextLabel')
                local _TextLabel11 = Instance.new('TextLabel')
                local _Frame16 = Instance.new('Frame')
                local _UICorner15 = Instance.new('UICorner')
                local _UIStroke11 = Instance.new('UIStroke')
                local _TextLabel12 = Instance.new('TextLabel')

                _Frame12.Name = 'InfoFrame'
                _Frame12.Parent = _ScrollingFrame2
                _Frame12.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame12.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame12.BorderSizePixel = 0
                _Frame12.Position = UDim2.new(0.0371621624, 0, -0.126050428, 0)
                _Frame12.Size = UDim2.new(0, 274, 0, 117)
                _UICorner11.Name = 'WlcFrameCorner'
                _UICorner11.Parent = _Frame12
                _UIStroke7.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke7.Name = 'WlcFrameStroke'
                _UIStroke7.Parent = _Frame12
                _Frame13.Name = 'VersionFrame'
                _Frame13.Parent = _Frame12
                _Frame13.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame13.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame13.BorderSizePixel = 0
                _Frame13.Position = UDim2.new(0.0437956192, 0, 0.200000003, 0)
                _Frame13.Size = UDim2.new(0, 78, 0, 34)
                _UICorner12.Name = 'VersionFrameCorner'
                _UICorner12.Parent = _Frame13
                _UIStroke8.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke8.Name = 'VersionFrameStroke'
                _UIStroke8.Parent = _Frame13
                _TextLabel6.Name = 'VersionLabel'
                _TextLabel6.Parent = _Frame13
                _TextLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel6.BackgroundTransparency = 2
                _TextLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel6.BorderSizePixel = 0
                _TextLabel6.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
                _TextLabel6.Size = UDim2.new(0, 74, 0, 8)
                _TextLabel6.Font = Enum.Font.RobotoCondensed
                _TextLabel6.Text = '\u{627}\u{644}\u{62a}\u{62d}\u{62f}\u{64a}\u{62b}'
                _TextLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel6.TextSize = 14
                _TextLabel6.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel7.Name = 'Version'
                _TextLabel7.Parent = _Frame13
                _TextLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel7.BackgroundTransparency = 2
                _TextLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel7.BorderSizePixel = 0
                _TextLabel7.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
                _TextLabel7.Size = UDim2.new(0, 50, 0, 27)
                _TextLabel7.Font = Enum.Font.RobotoCondensed
                _TextLabel7.Text = p172
                _TextLabel7.TextColor3 = Color3.fromRGB(144, 144, 144)
                _TextLabel7.TextSize = 14
                _TextLabel7.TextXAlignment = Enum.TextXAlignment.Left
                _Frame14.Name = 'RankFrame'
                _Frame14.Parent = _Frame12
                _Frame14.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame14.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame14.BorderSizePixel = 0
                _Frame14.Position = UDim2.new(0.357664227, 0, 0.200000003, 0)
                _Frame14.Size = UDim2.new(0, 78, 0, 34)
                _UICorner13.Name = 'RankFrameCorner'
                _UICorner13.Parent = _Frame14
                _UIStroke9.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke9.Name = 'RankFrameStroke'
                _UIStroke9.Parent = _Frame14
                _TextLabel8.Name = 'RankLabel'
                _TextLabel8.Parent = _Frame14
                _TextLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel8.BackgroundTransparency = 2
                _TextLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel8.BorderSizePixel = 0
                _TextLabel8.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
                _TextLabel8.Size = UDim2.new(0, 74, 0, 8)
                _TextLabel8.Font = Enum.Font.RobotoCondensed
                _TextLabel8.Text = '\u{627}\u{644}\u{631}\u{627}\u{646}\u{643}'
                _TextLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel8.TextSize = 14
                _TextLabel8.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel9.Name = ''
                _TextLabel9.Parent = _Frame14
                _TextLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel9.BackgroundTransparency = 2
                _TextLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel9.BorderSizePixel = 0
                _TextLabel9.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
                _TextLabel9.Size = UDim2.new(0, 50, 0, 27)
                _TextLabel9.Font = Enum.Font.RobotoCondensed
                _TextLabel9.Text = p173
                _TextLabel9.TextColor3 = Color3.fromRGB(144, 144, 144)
                _TextLabel9.TextSize = 14
                _TextLabel9.TextXAlignment = Enum.TextXAlignment.Left
                _Frame15.Name = 'StatusFrame'
                _Frame15.Parent = _Frame12
                _Frame15.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame15.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame15.BorderSizePixel = 0
                _Frame15.Position = UDim2.new(0.671532869, 0, 0.200000003, 0)
                _Frame15.Size = UDim2.new(0, 78, 0, 34)
                _UICorner14.Name = 'StatusFrameCorner'
                _UICorner14.Parent = _Frame15
                _UIStroke10.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke10.Name = 'StatusFrameStroke'
                _UIStroke10.Parent = _Frame15
                _TextLabel10.Name = 'StatusLabel'
                _TextLabel10.Parent = _Frame15
                _TextLabel10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel10.BackgroundTransparency = 2
                _TextLabel10.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel10.BorderSizePixel = 0
                _TextLabel10.Position = UDim2.new(0.051282052, 0, -0.411764711, 0)
                _TextLabel10.Size = UDim2.new(0, 74, 0, 8)
                _TextLabel10.Font = Enum.Font.RobotoCondensed
                _TextLabel10.Text = '\u{627}\u{62e}\u{631} \u{62a}\u{62d}\u{62f}\u{64a}\u{62b}'
                _TextLabel10.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel10.TextSize = 14
                _TextLabel10.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel11.Name = 'Status'
                _TextLabel11.Parent = _Frame15
                _TextLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel11.BackgroundTransparency = 2
                _TextLabel11.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel11.BorderSizePixel = 0
                _TextLabel11.Position = UDim2.new(0.128205135, 0, 0.0882352963, 0)
                _TextLabel11.Size = UDim2.new(0, 50, 0, 27)
                _TextLabel11.Font = Enum.Font.RobotoCondensed
                _TextLabel11.Text = p174
                _TextLabel11.TextColor3 = Color3.fromRGB(122, 122, 122)
                _TextLabel11.TextSize = 14
                _TextLabel11.TextXAlignment = Enum.TextXAlignment.Left
                _Frame16.Name = 'CloseFrame'
                _Frame16.Parent = _Frame12
                _Frame16.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame16.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame16.BorderSizePixel = 0
                _Frame16.Position = UDim2.new(0.0437956192, 0, 0.649999917, 0)
                _Frame16.Size = UDim2.new(0, 250, 0, 28)
                _UICorner15.Name = 'CloseFrameCorner'
                _UICorner15.Parent = _Frame16
                _UIStroke11.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke11.Name = 'CloseFrameStroke'
                _UIStroke11.Parent = _Frame16
                _TextLabel12.Name = 'Close'
                _TextLabel12.Parent = _Frame16
                _TextLabel12.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel12.BackgroundTransparency = 2
                _TextLabel12.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel12.BorderSizePixel = 0
                _TextLabel12.Position = UDim2.new(0.0399999991, 0, 0.0882327408, 0)
                _TextLabel12.Size = UDim2.new(0, 226, 0, 26)
                _TextLabel12.Font = Enum.Font.RobotoCondensed
                _TextLabel12.Text = '\u{627}\u{636}\u{63a}\u{637} "V" \u{644}\u{627}\u{63a}\u{644}\u{627}\u{642} \u{627}\u{648} \u{641}\u{62a}\u{62d} \u{627}\u{644}\u{642}\u{627}\u{626}\u{645}\u{629}'
                _TextLabel12.TextColor3 = Color3.fromRGB(122, 122, 122)
                _TextLabel12.TextSize = 14
                _TextLabel12.TextXAlignment = Enum.TextXAlignment.Left
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)
            end
            function u159.Label(_, p197)
                local _TextLabel13 = Instance.new('TextLabel')

                _TextLabel13.Name = 'ButtonLabel'
                _TextLabel13.Parent = _ScrollingFrame2
                _TextLabel13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel13.BackgroundTransparency = 2
                _TextLabel13.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel13.BorderSizePixel = 0
                _TextLabel13.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
                _TextLabel13.Size = UDim2.new(0, 272, 0, 33)
                _TextLabel13.Font = Enum.Font.RobotoCondensed
                _TextLabel13.Text = p197
                _TextLabel13.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel13.TextSize = 17
            end
            function u159.BigButton(_, p199, p200, p201)
                local _TextButton2 = Instance.new('TextButton')
                local _UICorner16 = Instance.new('UICorner')
                local _UIStroke12 = Instance.new('UIStroke')
                local _TextLabel14 = Instance.new('TextLabel')
                local _ImageLabel6 = Instance.new('ImageLabel')
                local u207 = p201 or function() end

                _TextButton2.Name = 'BigButton'
                _TextButton2.Parent = _ScrollingFrame2
                _TextButton2.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _TextButton2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton2.BorderSizePixel = 0
                _TextButton2.Position = UDim2.new(0.0540540554, 0, 0.352941185, 0)
                _TextButton2.Size = UDim2.new(0, 272, 0, 86)
                _TextButton2.AutoButtonColor = false
                _TextButton2.Font = Enum.Font.SourceSans
                _TextButton2.Text = ''
                _TextButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton2.TextSize = 14
                _UICorner16.Name = 'BigButtonCorner'
                _UICorner16.Parent = _TextButton2
                _UIStroke12.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke12.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke12.Name = 'BigButtonStroke'
                _UIStroke12.Parent = _TextButton2
                _TextLabel14.Name = 'BigButtonLabel'
                _TextLabel14.Parent = _TextButton2
                _TextLabel14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel14.BackgroundTransparency = 2
                _TextLabel14.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel14.BorderSizePixel = 0
                _TextLabel14.Position = UDim2.new(0.0551470593, 0, 0.519027352, 0)
                _TextLabel14.Size = UDim2.new(0, 176, 0, 34)
                _TextLabel14.Text = p199
                _TextLabel14.Font = Enum.Font.RobotoCondensed
                _TextLabel14.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel14.TextSize = 28
                _TextLabel14.TextXAlignment = Enum.TextXAlignment.Left
                _ImageLabel6.Name = 'BigButtonImage'
                _ImageLabel6.Parent = _TextButton2
                _ImageLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel6.BackgroundTransparency = 2
                _ImageLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel6.BorderSizePixel = 0
                _ImageLabel6.Position = UDim2.new(0.702205896, 0, 0.0863285512, 0)
                _ImageLabel6.Size = UDim2.new(0, 70, 0, 70)
                _ImageLabel6.Image = p200
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                _TextButton2.MouseButton1Down:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke12, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(255, 255, 255),
                    }):Play()
                    wait(0.01)
                    game:GetService('TweenService'):Create(_UIStroke12, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                    pcall(u207)
                end)
                _TextButton2.MouseEnter:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke12, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(100, 100, 100),
                    }):Play()
                end)
                _TextButton2.MouseLeave:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke12, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                end)
            end
            function u159.Button(_, p208, p209)
                local _TextButton3 = Instance.new('TextButton')
                local _UICorner17 = Instance.new('UICorner')
                local _UIStroke13 = Instance.new('UIStroke')
                local _TextLabel15 = Instance.new('TextLabel')
                local _ImageLabel7 = Instance.new('ImageLabel')
                local u215 = p209 or function() end

                _TextButton3.Name = 'Button'
                _TextButton3.Parent = _ScrollingFrame2
                _TextButton3.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _TextButton3.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton3.BorderSizePixel = 0
                _TextButton3.Position = UDim2.new(0.0371621624, 0, 0.70168066, 0)
                _TextButton3.Size = UDim2.new(0, 272, 0, 33)
                _TextButton3.AutoButtonColor = false
                _TextButton3.Font = Enum.Font.SourceSans
                _TextButton3.Text = ''
                _TextButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton3.TextSize = 14
                _UICorner17.Name = 'ButtonCorner'
                _UICorner17.Parent = _TextButton3
                _UIStroke13.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke13.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke13.Name = 'ButtonStroke'
                _UIStroke13.Parent = _TextButton3
                _TextLabel15.Name = 'ButtonLabel'
                _TextLabel15.Parent = _TextButton3
                _TextLabel15.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel15.BackgroundTransparency = 2
                _TextLabel15.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel15.BorderSizePixel = 0
                _TextLabel15.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
                _TextLabel15.Size = UDim2.new(0, 228, 0, 20)
                _TextLabel15.Font = Enum.Font.RobotoCondensed
                _TextLabel15.Text = p208
                _TextLabel15.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel15.TextSize = 17
                _TextLabel15.TextXAlignment = Enum.TextXAlignment.Left
                _ImageLabel7.Name = 'ButtonImage'
                _ImageLabel7.Parent = _TextButton3
                _ImageLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel7.BackgroundTransparency = 2
                _ImageLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel7.BorderSizePixel = 0
                _ImageLabel7.Position = UDim2.new(0.0073529412, 0, 0.121212125, 0)
                _ImageLabel7.Size = UDim2.new(0, 25, 0, 25)
                _ImageLabel7.Image = 'rbxassetid://11295279987'
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                _TextButton3.MouseButton1Down:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke13, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(255, 255, 255),
                    }):Play()
                    wait(0.01)
                    game:GetService('TweenService'):Create(_UIStroke13, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                    pcall(u215)
                end)
                _TextButton3.MouseEnter:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke13, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(100, 100, 100),
                    }):Play()
                end)
                _TextButton3.MouseLeave:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke13, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                end)
            end
            function u159.Toggle(_, p216, p217)
                local _TextButton4 = Instance.new('TextButton')
                local _UICorner18 = Instance.new('UICorner')
                local _UIStroke14 = Instance.new('UIStroke')
                local _TextLabel16 = Instance.new('TextLabel')
                local _ImageLabel8 = Instance.new('ImageLabel')
                local u223 = p217 or function() end
                local u224 = false

                _TextButton4.Name = 'Toggle'
                _TextButton4.Parent = _ScrollingFrame2
                _TextButton4.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _TextButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton4.BorderSizePixel = 0
                _TextButton4.Position = UDim2.new(0.0371621624, 0, 0.70168066, 0)
                _TextButton4.Size = UDim2.new(0, 272, 0, 33)
                _TextButton4.AutoButtonColor = false
                _TextButton4.Font = Enum.Font.SourceSans
                _TextButton4.Text = ''
                _TextButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton4.TextSize = 14
                _UICorner18.Name = 'ToggleCorner'
                _UICorner18.Parent = _TextButton4
                _UIStroke14.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke14.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke14.Name = 'ToggleStroke'
                _UIStroke14.Parent = _TextButton4
                _TextLabel16.Name = 'ToggleLabel'
                _TextLabel16.Parent = _TextButton4
                _TextLabel16.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel16.BackgroundTransparency = 2
                _TextLabel16.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel16.BorderSizePixel = 0
                _TextLabel16.Position = UDim2.new(0.121323526, 0, 0.181818187, 0)
                _TextLabel16.Size = UDim2.new(0, 228, 0, 20)
                _TextLabel16.Font = Enum.Font.RobotoCondensed
                _TextLabel16.Text = p216
                _TextLabel16.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel16.TextSize = 17
                _TextLabel16.TextXAlignment = Enum.TextXAlignment.Left
                _ImageLabel8.Name = 'ToggleImage'
                _ImageLabel8.Parent = _TextButton4
                _ImageLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel8.BackgroundTransparency = 2
                _ImageLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel8.BorderSizePixel = 0
                _ImageLabel8.Position = UDim2.new(0.0149999997, 0, 0.0909999982, 2)
                _ImageLabel8.Size = UDim2.new(0, 23, 0, 23)
                _ImageLabel8.Image = 'rbxassetid://11293978956'
                _ImageLabel8.ImageColor3 = Color3.fromRGB(255, 0, 0)
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                _TextButton4.MouseButton1Down:Connect(function()
                    u224 = not u224

                    if u224 then
                        game:GetService('TweenService'):Create(_ImageLabel8, TweenInfo.new(0.25), {
                            ImageColor3 = Color3.fromRGB(0, 211, 0),
                        }):Play()
                    else
                        game:GetService('TweenService'):Create(_ImageLabel8, TweenInfo.new(0.25), {
                            ImageColor3 = Color3.fromRGB(211, 0, 0),
                        }):Play()
                    end

                    pcall(u223, u224)
                end)
                _TextButton4.MouseEnter:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke14, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(100, 100, 100),
                    }):Play()
                end)
                _TextButton4.MouseLeave:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke14, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                end)
            end
            function u159.Slider(_, p225, p226, p227, p228)
                local _Frame17 = Instance.new('Frame')
                local _UICorner19 = Instance.new('UICorner')
                local _UIStroke15 = Instance.new('UIStroke')
                local _TextLabel17 = Instance.new('TextLabel')
                local _TextLabel18 = Instance.new('TextLabel')
                local _TextButton5 = Instance.new('TextButton')
                local _UICorner20 = Instance.new('UICorner')
                local _UIStroke16 = Instance.new('UIStroke')
                local _Frame18 = Instance.new('Frame')
                local _UICorner21 = Instance.new('UICorner')
                local u239 = p228 or function() end
                local u240 = game.Players.LocalPlayer:GetMouse()
                local _UserInputService3 = game:GetService('UserInputService')
                local u242 = nil

                _Frame17.Name = 'SliderFrame'
                _Frame17.Parent = _ScrollingFrame2
                _Frame17.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame17.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame17.BorderSizePixel = 0
                _Frame17.Position = UDim2.new(0.0405405387, 0, 0.39915967, 0)
                _Frame17.Size = UDim2.new(0, 272, 0, 45)
                _UICorner19.Name = 'SliderFrameCorner'
                _UICorner19.Parent = _Frame17
                _UIStroke15.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke15.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke15.Name = 'SliderFrameStroke'
                _UIStroke15.Parent = _Frame17
                _TextLabel17.Name = 'SliderLabel'
                _TextLabel17.Parent = _Frame17
                _TextLabel17.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel17.BackgroundTransparency = 2
                _TextLabel17.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel17.BorderSizePixel = 0
                _TextLabel17.Position = UDim2.new(0.0698529407, 0, 0.13333334, 0)
                _TextLabel17.Size = UDim2.new(0, 187, 0, 12)
                _TextLabel17.Font = Enum.Font.RobotoCondensed
                _TextLabel17.Text = p225
                _TextLabel17.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel17.TextSize = 17
                _TextLabel17.TextWrapped = true
                _TextLabel17.TextXAlignment = Enum.TextXAlignment.Left
                _TextLabel18.Name = 'SliderNumber'
                _TextLabel18.Parent = _Frame17
                _TextLabel18.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel18.BackgroundTransparency = 2
                _TextLabel18.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel18.BorderSizePixel = 0
                _TextLabel18.Position = UDim2.new(0.841911793, 0, 0.13333334, 0)
                _TextLabel18.Size = UDim2.new(0, 32, 0, 12)
                _TextLabel18.Font = Enum.Font.RobotoCondensed
                _TextLabel18.Text = '1'
                _TextLabel18.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel18.TextSize = 13
                _TextLabel18.TextWrapped = true
                _TextButton5.Name = 'SliderButton'
                _TextButton5.Parent = _Frame17
                _TextButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextButton5.BackgroundTransparency = 2
                _TextButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton5.BorderSizePixel = 0
                _TextButton5.Position = UDim2.new(0.0661764741, 0, 0.577777803, 0)
                _TextButton5.Size = UDim2.new(0, 235, 0, 13)
                _TextButton5.Font = Enum.Font.SourceSans
                _TextButton5.Text = ''
                _TextButton5.TextColor3 = Color3.fromRGB(0, 0, 0)
                _TextButton5.TextSize = 14
                _UICorner20.Name = 'SliderButtonCorner'
                _UICorner20.Parent = _TextButton5
                _UIStroke16.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke16.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke16.Name = 'SliderButtonStroke'
                _UIStroke16.Parent = _TextButton5
                _Frame18.Name = 'SliderLine'
                _Frame18.Parent = _TextButton5
                _Frame18.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
                _Frame18.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame18.BorderSizePixel = 0
                _Frame18.Size = UDim2.new(0, 0, 0, 13)
                _UICorner21.Name = 'SliderLineCorner'
                _UICorner21.Parent = _Frame18
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                _TextButton5.MouseButton1Down:Connect(function()
                    u242 = math.floor((tonumber(p227) - tonumber(p226)) / 234 * _Frame18.AbsoluteSize.X + tonumber(p226)) or 0

                    pcall(function()
                        u239(u242)
                    end)
                    _Frame18:TweenSize(UDim2.new(0, math.clamp(u240.X - _Frame18.AbsolutePosition.X, 0, 234), 0, 13), 'Out', 'Linear', 0.1)

                    moveconnection = u240.Move:Connect(function()
                        _TextLabel18.Text = u242

                        game:GetService('TweenService'):Create(_UIStroke16, TweenInfo.new(0.1), {
                            Color = Color3.fromRGB(255, 255, 255),
                        }):Play()

                        u242 = math.floor((tonumber(p227) - tonumber(p226)) / 234 * _Frame18.AbsoluteSize.X + tonumber(p226))

                        pcall(function()
                            u239(u242)
                        end)
                        _Frame18:TweenSize(UDim2.new(0, math.clamp(u240.X - _Frame18.AbsolutePosition.X, 0, 234), 0, 13), 'Out', 'Linear', 0.1)
                    end)
                    releaseconnection = _UserInputService3.InputEnded:Connect(function(p243)
                        if p243.UserInputType == Enum.UserInputType.MouseButton1 then
                            u242 = math.floor((tonumber(p227) - tonumber(p226)) / 234 * _Frame18.AbsoluteSize.X + tonumber(p226))

                            pcall(function()
                                u239(u242)
                            end)
                            _Frame18:TweenSize(UDim2.new(0, math.clamp(u240.X - _Frame18.AbsolutePosition.X, 0, 234), 0, 13), 'Out', 'Linear', 0.1)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                            game:GetService('TweenService'):Create(_UIStroke16, TweenInfo.new(0.25), {
                                Color = Color3.fromRGB(74, 74, 74),
                            }):Play()
                        end
                    end)
                end)
                _TextButton5.MouseEnter:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke15, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(100, 100, 100),
                    }):Play()
                end)
                _TextButton5.MouseLeave:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke15, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()
                end)
            end
            function u159.Textbox(_, p244, p245, p246, p247)
                local _Frame19 = Instance.new('Frame')
                local _UICorner22 = Instance.new('UICorner')
                local _UIStroke17 = Instance.new('UIStroke')
                local _TextBox = Instance.new('TextBox')
                local _UICorner23 = Instance.new('UICorner')
                local _UIStroke18 = Instance.new('UIStroke')
                local _TextLabel19 = Instance.new('TextLabel')
                local u255 = p247 or function() end

                _Frame19.Name = 'TextBoxFrame'
                _Frame19.Parent = _ScrollingFrame2
                _Frame19.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame19.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame19.BorderSizePixel = 0
                _Frame19.Position = UDim2.new(0.0371621624, 0, 0.613445401, 0)
                _Frame19.Size = UDim2.new(0, 272, 0, 45)
                _UICorner22.Name = 'TextBoxFrameCorner'
                _UICorner22.Parent = _Frame19
                _UIStroke17.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke17.Name = 'TextBoxFrameStroke'
                _UIStroke17.Parent = _Frame19
                _TextBox.Parent = _Frame19
                _TextBox.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
                _TextBox.BackgroundTransparency = 2
                _TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextBox.BorderSizePixel = 0
                _TextBox.Position = UDim2.new(0.577205896, 0, 0.150000006, 0)
                _TextBox.Size = UDim2.new(0, 103, 0, 31)
                _TextBox.Font = Enum.Font.RobotoCondensed
                _TextBox.Text = p245
                _TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextBox.TextSize = 14
                _UICorner23.Name = 'TargetTextBoxCorner'
                _UICorner23.Parent = _TextBox
                _UIStroke18.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke18.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke18.Thickness = 0.699999988079071
                _UIStroke18.Name = 'TargetTextBoxStroke'
                _UIStroke18.Parent = _TextBox
                _TextLabel19.Name = 'TextBoxLabel'
                _TextLabel19.Parent = _Frame19
                _TextLabel19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel19.BackgroundTransparency = 2
                _TextLabel19.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel19.BorderSizePixel = 0
                _TextLabel19.Position = UDim2.new(0.0404411778, 0, 0.244444445, 0)
                _TextLabel19.Size = UDim2.new(0, 137, 0, 22)
                _TextLabel19.Text = p244
                _TextLabel19.Font = Enum.Font.RobotoCondensed
                _TextLabel19.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel19.TextSize = 17
                _TextLabel19.TextWrapped = true
                _TextLabel19.TextXAlignment = Enum.TextXAlignment.Left

                _TextBox.Focused:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(130, 130, 130),
                    }):Play()
                end)

                if (p246 or false) == false then
                    _TextBox.FocusLost:Connect(function()
                        game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                            Color = Color3.fromRGB(255, 255, 255),
                        }):Play()
                        wait(0.2)
                        game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                            Color = Color3.fromRGB(74, 74, 74),
                        }):Play()
                        u255(_TextBox.Text)

                        _TextBox.Text = p245
                    end)
                else
                    _TextBox.Focused:Connect(function()
                        game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                            Color = Color3.fromRGB(130, 130, 130),
                        }):Play()
                    end)
                    _TextBox.FocusLost:Connect(function(p256)
                        if p256 then
                            if _TextBox.Text:match('^%d+$') then
                                game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                }):Play()
                                wait(0.2)
                                game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                                    Color = Color3.fromRGB(74, 74, 74),
                                }):Play()
                                u255(_TextBox.Text)

                                _TextBox.Text = p245
                            else
                                _TextBox.Text = '\u{627}\u{631}\u{642}\u{627}\u{645} \u{641}\u{642}\u{637} !'

                                game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                                    Color = Color3.fromRGB(255, 0, 0),
                                }):Play()
                                wait(0.8)

                                _TextBox.Text = p245

                                game:GetService('TweenService'):Create(_UIStroke18, TweenInfo.new(0.25), {
                                    Color = Color3.fromRGB(74, 74, 74),
                                }):Play()
                            end
                        end
                    end)
                end
            end
            function u159.TargetTextBox(_, p257, p258, p259)
                local _Frame20 = Instance.new('Frame')
                local _UICorner24 = Instance.new('UICorner')
                local _UIStroke19 = Instance.new('UIStroke')
                local _ImageLabel9 = Instance.new('ImageLabel')
                local _UICorner25 = Instance.new('UICorner')
                local _TextLabel20 = Instance.new('TextLabel')
                local _TextBox2 = Instance.new('TextBox')
                local _UICorner26 = Instance.new('UICorner')
                local _UIStroke20 = Instance.new('UIStroke')
                local _TextLabel21 = Instance.new('TextLabel')

                _Frame20.Name = 'TargetFrame'
                _Frame20.Parent = _ScrollingFrame2
                _Frame20.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                _Frame20.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _Frame20.BorderSizePixel = 0
                _Frame20.Position = UDim2.new(0.0540540554, 0, 0.369747907, 0)
                _Frame20.Size = UDim2.new(0, 274, 0, 100)
                _UICorner24.Name = 'TargetFrameCorner'
                _UICorner24.Parent = _Frame20
                _UIStroke19.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke19.Name = 'TargetFrameStroke'
                _UIStroke19.Parent = _Frame20
                _ImageLabel9.Name = 'TargetImage'
                _ImageLabel9.Parent = _Frame20
                _ImageLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _ImageLabel9.BackgroundTransparency = 2
                _ImageLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _ImageLabel9.BorderSizePixel = 0
                _ImageLabel9.Position = UDim2.new(0.0729926974, 0, 0.150000006, 0)
                _ImageLabel9.Size = UDim2.new(0, 70, 0, 70)
                _ImageLabel9.Image = p257
                _UICorner25.CornerRadius = UDim.new(0, 444)
                _UICorner25.Name = 'PlayerImageCorner'
                _UICorner25.Parent = _ImageLabel9
                _TextLabel20.Name = 'TargetName'
                _TextLabel20.Parent = _Frame20
                _TextLabel20.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel20.BackgroundTransparency = 2
                _TextLabel20.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel20.BorderSizePixel = 0
                _TextLabel20.Position = UDim2.new(0.394160599, 0, 0.519999981, 0)
                _TextLabel20.Size = UDim2.new(0, 140, 0, 18)
                _TextLabel20.Font = Enum.Font.RobotoCondensed
                _TextLabel20.Text = 'Target Name : ' .. p258
                _TextLabel20.TextColor3 = Color3.fromRGB(134, 134, 134)
                _TextLabel20.TextSize = 15
                _TextLabel20.TextXAlignment = Enum.TextXAlignment.Left
                _TextBox2.Name = 'TargetTextBox'
                _TextBox2.Parent = _Frame20
                _TextBox2.BackgroundColor3 = Color3.fromRGB(112, 112, 112)
                _TextBox2.BackgroundTransparency = 2
                _TextBox2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextBox2.BorderSizePixel = 0
                _TextBox2.Position = UDim2.new(0.394160599, 0, 0.150000006, 0)
                _TextBox2.Size = UDim2.new(0, 118, 0, 31)
                _TextBox2.Font = Enum.Font.RobotoCondensed
                _TextBox2.Text = ''
                _TextBox2.TextColor3 = Color3.fromRGB(255, 255, 255)
                _TextBox2.TextSize = 14
                _UICorner26.Name = 'TargetTextBoxCorner'
                _UICorner26.Parent = _TextBox2
                _UIStroke20.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                _UIStroke20.Color = Color3.fromRGB(74, 74, 74)
                _UIStroke20.Thickness = 0.699999988079071
                _UIStroke20.Name = 'TargetTextBoxStroke'
                _UIStroke20.Parent = _TextBox2
                _TextLabel21.Name = 'TargetId'
                _TextLabel21.Parent = _Frame20
                _TextLabel21.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                _TextLabel21.BackgroundTransparency = 2
                _TextLabel21.BorderColor3 = Color3.fromRGB(0, 0, 0)
                _TextLabel21.BorderSizePixel = 0
                _TextLabel21.Position = UDim2.new(0.394160599, 0, 0.699999988, 0)
                _TextLabel21.Size = UDim2.new(0, 140, 0, 18)
                _TextLabel21.Font = Enum.Font.RobotoCondensed
                _TextLabel21.Text = 'ID : ' .. p259
                _TextLabel21.TextColor3 = Color3.fromRGB(134, 134, 134)
                _TextLabel21.TextSize = 15
                _TextLabel21.TextXAlignment = Enum.TextXAlignment.Left
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)
                _ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, _UIListLayout2.AbsoluteContentSize.Y)

                local function u275(p270)
                    if p270 == '' then
                        return nil
                    end
                    if p270 == 'random' then
                        return game:GetService('Players'):GetPlayers()[math.random(1, #game:GetService('Players'):GetPlayers())]
                    end

                    local v271, v272, v273 = pairs(game:GetService('Players'):GetPlayers())

                    while true do
                        local v274

                        v273, v274 = v271(v272, v273)

                        if v273 == nil then
                            break
                        end
                        if v274.Name:lower():sub(1, #p270) == p270:lower() or v274.DisplayName:lower():sub(1, #p270) == p270 then
                            return v274
                        end
                    end
                end

                game.Workspace.FallenPartsDestroyHeight = -50000

                _TextBox2.FocusLost:Connect(function()
                    game:GetService('TweenService'):Create(_UIStroke20, TweenInfo.new(0.25), {
                        Color = Color3.fromRGB(74, 74, 74),
                    }):Play()

                    local v276 = u275(_TextBox2.Text)

                    if v276 ~= game:GetService('Players').LocalPlayer then
                        _TextBox2.Text = v276.Name
                        _TextLabel20.Text = 'Target Name : @' .. v276.DisplayName
                        _TextLabel21.Text = 'ID : ' .. v276.UserId
                        _ImageLabel9.Image = game:GetService('Players'):GetUserThumbnailAsync(v276.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                    end
                end)
                u159:TabFix()
                u159:TabFix()
                u159:Button('\u{627}\u{646}\u{62a}\u{642}\u{627}\u{644}', function()
                    Benx = false
                    Bang = false
                    Suck = false
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    local v277 = u275(_TextBox2.Text)

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v277.Character.HumanoidRootPart.CFrame
                end)
                u159:Button('\u{641}\u{644}\u{64a}\u{646}\u{642}', function()
                    Benx = false
                    Bang = false
                    Suck = false
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    local v278 = u275(_TextBox2.Text)

                    game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
                        ';char me',
                    }))
                    wait(0.4)
                    u59(v278.Name)
                    game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
                        ';unchar',
                    }))
                end)
                u159:TabFix()
                u159:TabFix()

                local function u280(p279)
                    return p279.Character.Humanoid.Sit == false
                end

                _G.Wait = false

                u159:Button('\u{642}\u{62a}\u{644}', function()
                    if _G.Wait ~= true then
                        _G.Wait = true

                        local u281 = u275(_TextBox2.Text)
                        local _CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                        wait(1)
                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('ShoppingCart')
                        wait(1)
                        game:GetService('RunService'):BindToRenderStep('Teleport', 0, function()
                            game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1.6')

                            local v283, v284, v285 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                            while true do
                                local v286

                                v285, v286 = v283(v284, v285)

                                if v285 == nil then
                                    break
                                end
                                if v286:IsA('Tool') and v286.Name == 'ShoppingCart' then
                                    v286.Parent = game.Players.LocalPlayer.Character
                                end
                            end

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u281.Character.HumanoidRootPart.CFrame + u281.Character.Humanoid.MoveDirection * 8
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u281.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)

                            if not u280(u281) then
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport')
                                wait(0.5)
                                game:GetService('RunService'):BindToRenderStep('Teleport To Void', 0, function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -1000.51605, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                                end)
                                wait(0.4)
                                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                                wait(3)
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport To Void')

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame

                                game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1')

                                _G.Wait = false
                            end
                        end)
                    end
                end)
                u159:Button('\u{627}\u{631}\u{633}\u{627}\u{644}\u{647} \u{644}\u{644}\u{641}\u{636}\u{627}\u{621}', function()
                    if _G.Wait ~= true then
                        _G.Wait = true

                        local u287 = u275(_TextBox2.Text)
                        local _CFrame2 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                        wait(1)
                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('ShoppingCart')
                        wait(1)
                        game:GetService('RunService'):BindToRenderStep('Teleport', 0, function()
                            game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1.6')

                            local v289, v290, v291 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                            while true do
                                local v292

                                v291, v292 = v289(v290, v291)

                                if v291 == nil then
                                    break
                                end
                                if v292:IsA('Tool') and v292.Name == 'ShoppingCart' then
                                    v292.Parent = game.Players.LocalPlayer.Character
                                end
                            end

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u287.Character.HumanoidRootPart.CFrame + u287.Character.Humanoid.MoveDirection * 8
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u287.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)

                            if not u280(u287) then
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport')
                                wait(0.5)
                                game:GetService('RunService'):BindToRenderStep('Teleport To Void', 0, function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame2
                                end)
                                wait(0.4)
                                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                                wait(3)
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport To Void')

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame2

                                game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1')

                                _G.Wait = false
                            end
                        end)
                    end
                end)
                u159:Button('\u{633}\u{62d}\u{628}', function()
                    if _G.Wait ~= true then
                        _G.Wait = true

                        local u293 = u275(_TextBox2.Text)
                        local _CFrame3 = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                        wait(1)
                        game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('ShoppingCart')
                        wait(1)
                        game:GetService('RunService'):BindToRenderStep('Teleport', 0, function()
                            game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1.6')

                            local v295, v296, v297 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())

                            while true do
                                local v298

                                v297, v298 = v295(v296, v297)

                                if v297 == nil then
                                    break
                                end
                                if v298:IsA('Tool') and v298.Name == 'ShoppingCart' then
                                    v298.Parent = game.Players.LocalPlayer.Character
                                end
                            end

                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u293.Character.HumanoidRootPart.CFrame + u293.Character.Humanoid.MoveDirection * 8
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u293.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)

                            if not u280(u293) then
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport')
                                wait(0.5)
                                game:GetService('RunService'):BindToRenderStep('Teleport To Void', 0, function()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(3265700, 72336392, 17749450))
                                end)
                                wait(0.4)
                                game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                                wait(3)
                                game:GetService('RunService'):UnbindFromRenderStep('Teleport To Void')

                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = _CFrame3

                                game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1')

                                _G.Wait = false
                            end
                        end)
                    end
                end)
                u159:Button('\u{627}\u{64a}\u{642}\u{627}\u{641} \u{627}\u{644}\u{642}\u{62a}\u{644} / \u{627}\u{644}\u{633}\u{62d}\u{628}', function()
                    game:GetService('ReplicatedStorage'):WaitForChild('Remotes'):WaitForChild('EquipTool'):FireServer('all')
                    game:GetService('RunService'):UnbindFromRenderStep('Teleport')
                    game:GetService('RunService'):UnbindFromRenderStep('Teleport To Void')
                    game:GetService('ReplicatedStorage').HDAdminClient.Signals.RequestCommand:InvokeServer(unpack({
                        ';vis',
                    }))
                    game:GetService('ReplicatedStorage').Functions:WaitForChild('ChangeSizeRF'):InvokeServer('1')

                    _G.Wait = false
                end)
                u159:TabFix()
                u159:TabFix()
                u159:Toggle('Benx', function(p299)
                    local u300 = u275(_TextBox2.Text)

                    Benx = p299
                    Bang = false
                    Suck = false
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer5 = game.Players.LocalPlayer

                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.3) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.8) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.3) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.8) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -2.3) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.8) * CFrame.Angles(-1.5, math.rad(0), 0)

                            task.wait()

                            _LocalPlayer5.Character.Humanoid.Sit = true
                            _LocalPlayer5.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer5.Character.HumanoidRootPart.CFrame = u300.Character.LowerTorso.CFrame * CFrame.new(0, 0, -1.3) * CFrame.Angles(-1.5, math.rad(0), 0)
                        end)
                    until Benx == false

                    if Benx == false then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false

                        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end)
                u159:Toggle('Bang', function(p302)
                    local u303 = u275(_TextBox2.Text)

                    bang = p302
                    Benx = false
                    Suck = false
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer6 = game.Players.LocalPlayer

                            _LocalPlayer6.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.3)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.8)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.3)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.8)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 2.3)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.8)

                            task.wait()

                            _LocalPlayer6.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer6.Character.HumanoidRootPart.CFrame = u303.Character.LowerTorso.CFrame * CFrame.new(0, 0, 1.3)
                        end)
                    until bang == false

                    if bang == false then
                        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                    end
                end)
                u159:Toggle('Face Bang', function(p305)
                    local u306 = u275(_TextBox2.Text)

                    bang = false
                    Benx = false
                    Suck = false
                    HeadSit = false
                    FaceBang = p305
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer7 = game.Players.LocalPlayer

                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -1.3) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -1.8) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -2.3) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -2.8) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -2.3) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -1.8) * CFrame.Angles(0, -3.3, 0)

                            task.wait()

                            _LocalPlayer7.Character.Humanoid.Sit = true
                            _LocalPlayer7.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer7.Character.HumanoidRootPart.CFrame = u306.Character.Head.CFrame * CFrame.new(0, 0.5, -1.3) * CFrame.Angles(0, -3.3, 0)
                        end)
                    until FaceBang == false

                    if FaceBang == false then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
                    end
                end)
                u159:Toggle('Suck', function(p308)
                    local u309 = u275(_TextBox2.Text)

                    bang = false
                    Benx = false
                    Suck = p308
                    HeadSit = false
                    FaceBang = false
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer8 = game.Players.LocalPlayer

                            _LocalPlayer8.Character.Humanoid.Sit = true
                            _LocalPlayer8.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = u309.Character.LowerTorso.CFrame * CFrame.new(0, -1, -1.7) * CFrame.Angles(0, -3.3, 0)
                        end)
                    until Suck == false

                    if Suck == false then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    end
                end)
                u159:Toggle('Head Sit', function(p311)
                    local u312 = u275(_TextBox2.Text)

                    bang = false
                    Benx = false
                    Suck = false
                    HeadSit = p311
                    FaceBang = false
                    Stand = false

                    repeat
                        task.wait()
                        pcall(function()
                            local _LocalPlayer9 = game.Players.LocalPlayer

                            _LocalPlayer9.Character.Humanoid.Sit = true
                            _LocalPlayer9.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            _LocalPlayer9.Character.HumanoidRootPart.CFrame = u312.Character.Head.CFrame * CFrame.new(0, 1.3, 1)
                        end)
                    until HeadSit == false

                    if HeadSit == false then
                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                    end
                end)
                u159:TabFix()
                u159:TabFix()
            end

            return u159
        end,
    }
end

local _AtomicHub = v61:Win("Atomic Hub | ماب البيوت العربي")

local v315 = _AtomicHub:Tab("الرئيسية", true)
local v316 = _AtomicHub:Tab("القيم")
local v317 = _AtomicHub:Tab("اللاعب")
local v318 = _AtomicHub:Tab("الاستهداف")
local v319 = _AtomicHub:Tab("اخرى تجربه يابه")
local v320 = _AtomicHub:Tab("الانميشن")
local v321 = _AtomicHub:Tab("المطورين")
v315:ImageLabel('https://www.roblox.com/headshot-thumbnail/image?userId=' .. game.Players.LocalPlayer.UserId .. '&width=420&height=420&format=png', '\u{645}\u{631}\u{62d}\u{628}\u{627}\u{64b} ' .. game.Players.LocalPlayer.DisplayName, '@' .. game.Players.LocalPlayer.Name)

if game.Players.LocalPlayer.Name ~= 'NiQ' then
    v315:Info('V1', 'User', 'nil')
else
    v315:Info('V1', '\u{627}\u{644}\u{627}\u{648}\u{646}\u{631}', 'nil')
end
