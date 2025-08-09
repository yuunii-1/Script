-- Load your external script first
loadstring(game:HttpGet("https://lunor.dev/loader"))()

-- Delay before showing the message (in seconds)
local delayTime = 5  

task.delay(delayTime, function()
    -- Create ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

    -- Create Frame (the box)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    -- Create TextLabel (the message)
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "⚠ Moderation Notice: Your account is under review."
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextScaled = true
    textLabel.Parent = frame
end)
