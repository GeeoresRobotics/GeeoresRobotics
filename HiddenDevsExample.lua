local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TweenService = game:GetService("TweenService")
local npcHighlight = script.NpcHighlight:Clone()

local player = game.Players.LocalPlayer
local AwakenAnim

local awakened = false
local cameraShaker = require(game.ReplicatedStorage:WaitForChild("CameraShaker"))
local camera = game.Workspace.CurrentCamera

local Lighting = game:GetService("Lighting")
local ContractTween = TweenService:Create(Lighting.AwakenLev, TweenInfo.new(1, Enum.EasingStyle.Sine), {Brightness = 0.2,  Contrast = 1, Saturation = -1})
local blurTween = TweenService:Create(Lighting.Blur, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {Size = 26})
local character = player.Character or player.CharacterAdded:Wait()

local orbModule = require(ReplicatedStorage.Modules.Orbs)
local function shakeCamera(shakeCF)
	camera.CFrame = camera.CFrame * shakeCF
end

local renderpriority = Enum.RenderPriority.Camera.Value + 1
local camShake = cameraShaker.new(renderpriority, shakeCamera)

camShake:Start()


UIS.InputBegan:Connect(function(input, gpe)
	if not gpe then
		if input.KeyCode == Enum.KeyCode.X then
			if player.Path.Value == "Levi" and awakened == false then
				player.Character.Humanoid.WalkSpeed = 0
				workspace.MainBackgroundMusic.Playing = false
				task.wait(1)
				script.AwakenStart.Playing = true
				task.spawn(function()
					task.wait(1)
					script.Awaken.Playing = true
				end)
				local purpleExplo = ReplicatedStorage.Core.vfx.ExplosionPurple.Hit:Clone()
				purpleExplo.Parent = player.Character.HumanoidRootPart
				purpleExplo.Position = purpleExplo.Position - Vector3.new(0, 0, 3)

				AwakenAnim = character.Humanoid.Animator:LoadAnimation(script.Activate)
				
				AwakenAnim:Play()
				
				task.spawn(function()
					
					task.spawn(function()
						
						task.wait(4)
						purpleExplo:Destroy()
						player.Character.Humanoid.WalkSpeed = 16
						
						task.spawn(function()
							
							ContractTween:Play()
							Lighting.AwakenLev.Enabled = true
							orbModule.spawn(character, ReplicatedStorage.Core.vfx.BlackholeOrb, 3, 8, 3)
							script.AwakenSoundtrack.Playing = true
							
						end)
						
						task.spawn(function()
							local gui = script.Awakening:Clone()
							gui.Parent = player.PlayerGui
							TweenService:Create(gui.TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 885,0, 75)}):Play()
							task.wait(0.4)
							TweenService:Create(gui.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 885,0, 59)}):Play()
							task.wait(0.4)
							TweenService:Create(gui.TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 885,0, 75)}):Play()
							task.wait(0.4)
							TweenService:Create(gui.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 885,0, 59)}):Play()
							task.wait(0.4)
							TweenService:Create(gui.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 0)}):Play()
							task.wait(0.2)
							gui:Destroy()
						end)
					end)
					task.wait(1)
					task.spawn(function()
						camShake:ShakeOnce(40, 35, .3, .4)
					end)
					
					task.spawn(function()
						task.spawn(function()
							camShake:ShakeOnce(40, 35, .3, .4)
							for _, efx in pairs(ReplicatedStorage.Core.vfx.Aura.Levi.Torso:GetChildren()) do
								local effectt = efx:Clone()
								effectt.Parent = player.Character.HumanoidRootPart
							end
							
						end)
						blurTween:Play()
						
						task.wait(1.2)
						
						task.spawn(function()
							
							camShake:ShakeOnce(40, 35, .3, .4)
							
						end)
						
						blurTween:Play()
					end)
				end)
				
			end
		end
	end
end)

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe then
		if input.KeyCode == Enum.KeyCode.X and player.Path.Value == "Diavolo" then
			player.Character.Humanoid.WalkSpeed = 0
			workspace.MainBackgroundMusic.Playing = false
			task.wait(1)
			script.AwakenStart.Playing = true
			task.spawn(function()
				task.wait(1)
				script.Awaken.Playing = true
			end)
			local purpleExplo = ReplicatedStorage.Core.vfx.ExplosionPurple.Hit:Clone()
			purpleExplo.Parent = player.Character.HumanoidRootPart
			purpleExplo.Position = purpleExplo.Position - Vector3.new(0, 0, 3)

			AwakenAnim = character.Humanoid.Animator:LoadAnimation(script.Activate)
			AwakenAnim:Play()
			task.spawn(function()
				
				task.spawn(function()
					
					task.wait(4)
					purpleExplo:Destroy()
					player.Character.Humanoid.WalkSpeed = 16
					
					task.spawn(function()
						
						ContractTween:Play()
						Lighting.AwakenLev.Enabled = true
						orbModule.spawn(character, ReplicatedStorage.Core.vfx.BlackholeOrb, 3, 8, 3)
						script.AwakenSoundtrack.Playing = true
						
					end)
					task.spawn(function()
						
						local gui = script.Awakening:Clone()
						gui.Parent = player.PlayerGui
						TweenService:Create(gui.TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 885,0, 75)}):Play()
						task.wait(0.4)
						
						TweenService:Create(gui.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 885,0, 59)}):Play()
						
						task.wait(0.4)
						
						TweenService:Create(gui.TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 885,0, 75)}):Play()
						
						task.wait(0.4)
						
						TweenService:Create(gui.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 885,0, 59)}):Play()
						
						task.wait(0.4)
						
						TweenService:Create(gui.TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {Size = UDim2.new(0, 0, 0, 0)}):Play()
						
						task.wait(0.2)
						gui:Destroy()
					end)
				end)
				task.wait(1)
				task.spawn(function()
					camShake:ShakeOnce(40, 35, .3, .4)
				end)
				task.spawn(function()
					task.spawn(function()
						camShake:ShakeOnce(40, 35, .3, .4)
						
						for _, efx in pairs(ReplicatedStorage.Core.vfx.Aura.Levi.Torso:GetChildren()) do
							
							local effectt = efx:Clone()
							
							effectt.Parent = player.Character.HumanoidRootPart
							
						end
						
					end)
					
					blurTween:Play()
					
					task.wait(1.2)
					
					task.spawn(function()
						
						camShake:ShakeOnce(40, 35, .3, .4)
						
					end)
					
					blurTween:Play()
				end)
				
			end)

		end
		
	end
	
end)
