print ("Hello, World!")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Egg ESP by KenriScripts",
   Icon = 0,
   LoadingTitle = "Egg ESP Loading...",
   LoadingSubtitle = "by KenriScripts",
   ShowText = "Rayfield",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "KenriScripts_EggESP"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local PetData = {
    ["Common Egg"] = {
        ["Golden Lab"] = 33.33,
        ["Dog"] = 33.33,
        ["Bunny"] = 33.33
    },
    ["Uncommon Egg"] = {
        ["Black Bunny"] = 25,
        ["Chicken"] = 25,
        ["Cat"] = 25,
        ["Deer"] = 25
    },
    ["Rare Egg"] = {
        ["Orange Tabby"] = 33.33,
        ["Spotted Deer"] = 25,
        ["Pig"] = 16.67,
        ["Rooster"] = 16.67,
        ["Monkey"] = 8.33
    },
    ["Legendary Egg"] = {
        ["Cow"] = 42.55,
        ["Silver Monkey"] = 42.55,
        ["Sea Otter"] = 10.64,
        ["Turtle"] = 2.13,
        ["Polar Bear"] = 2.13
    },
    ["Mythical Egg"] = {
        ["Grey Mouse"] = 35.71,
        ["Brown Mouse"] = 26.79,
        ["Squirrel"] = 26.79,
        ["Red Giant Ant"] = 8.93,
        ["Red Fox"] = 1.79
    },
    ["Bug Egg"] = {
        ["Snail"] = 40,
        ["Giant Ant"] = 30,
        ["Caterpillar"] = 25,
        ["Praying Mantis"] = 4,
        ["Dragonfly"] = 1
    },
    ["Night Egg"] = {
        ["Hedgehog"] = 47,
        ["Mole"] = 23.5,
        ["Frog"] = 17.63,
        ["Echo Frog"] = 8.23,
        ["Night Owl"] = 3.53,
        ["Raccoon"] = 0.12
    },
    ["Premium Night Egg"] = {
        ["Hedgehog"] = 49,
        ["Mole"] = 22,
        ["Frog"] = 14,
        ["Echo Frog"] = 10,
        ["Night Owl"] = 4,
        ["Raccoon"] = 1
    },
    ["Bee Egg"] = {
        ["Bee"] = 65,
        ["Honey Bee"] = 25,
        ["Bear Bee"] = 5,
        ["Petal Bee"] = 4,
        ["Queen Bee (Pet)"] = 1
    },
    ["Anti Bee Egg"] = {
        ["Wasp"] = 55,
        ["Tarantula Hawk"] = 30,
        ["Moth"] = 13.75,
        ["Butterfly"] = 1,
        ["Disco Bee"] = 0.25
    },
    ["Common Summer Egg"] = {
        ["Starfish"] = 50,
        ["Seagull"] = 25,
        ["Crab"] = 25
    },
    ["Rare Summer Egg"] = {
        ["Flamingo"] = 30,
        ["Toucan"] = 25,
        ["Sea Turtle"] = 20,
        ["Orangutan"] = 15,
        ["Seal"] = 10
    },
    ["Paradise Egg"] = {
        ["Ostrich"] = 40,
        ["Peacock"] = 30,
        ["Capybara"] = 21,
        ["Scarlet Macaw"] = 8,
        ["Mimic Octopus"] = 1
    },
    ["Oasis Egg"] = {
        ["Meerkat"] = 45,
        ["Sand Snake"] = 34.5,
        ["Axolotl"] = 15,
        ["Hyacinth Macaw"] = 5,
        ["Fennec Fox"] = 0.5
    },
    ["Premium Oasis Egg"] = {
        ["Meerkat"] = 45,
        ["Sand Snake"] = 34.5,
        ["Axolotl"] = 15,
        ["Hyacinth Macaw"] = 5,
        ["Fennec Fox"] = 0.5
    },
    ["Dinosaur Egg"] = {
        ["Raptor"] = 35,
        ["Triceratops"] = 32.5,
        ["Stegosaurus"] = 28,
        ["Pterodactyl"] = 3,
        ["Brontosaurus"] = 1,
        ["T-Rex"] = 0.5
    },
    ["Primal Egg"] = {
        ["Parasaurolophus"] = 35,
        ["Iguanodon"] = 32.5,
        ["Pachycephalosaurus"] = 28,
        ["Dilophosaurus"] = 3,
        ["Ankylosaurus"] = 1,
        ["Spinosaurus"] = 0.5
    },
    ["Premium Primal Egg"] = {
        ["Parasaurolophus"] = 35,
        ["Iguanodon"] = 32.5,
        ["Pachycephalosaurus"] = 28,
        ["Dilophosaurus"] = 3,
        ["Ankylosaurus"] = 1,
        ["Spinosaurus"] = 0.5
    },
    ["Zen Egg"] = {
        ["Shiba Inu"] = 40,
        ["Nihonzaru"] = 31,
        ["Tanuki"] = 20.82,
        ["Tanchozuru"] = 4.6,
        ["Kappa"] = 3.5,
        ["Kitsune"] = 0.08
    },
    ["Gourmet Egg"] = {
        ["Bagel Bunny"] = 50,
        ["Pancake Mole"] = 38,
        ["Sushi Bear"] = 7,
        ["Spaghetti Sloth"] = 4,
        ["French Fry Ferret"] = 1
    }
}

local EggVisuals = {}
local VisualsEnabled = false
local AutoRerollEnabled = false
local RerollSpeed = 0.5
local SelectedPet = ""
local AutoRerollConnection
local PausedEggs = {}
local SavedPredictions = {}

local function getAllUniquePets()
    local uniquePets = {}
    local petSet = {}
    for egg, visual in pairs(EggVisuals) do
        if visual.eggName and PetData[visual.eggName] then
            for petName, _ in pairs(PetData[visual.eggName]) do
                if not petSet[petName] then
                    petSet[petName] = true
                    table.insert(uniquePets, petName)
                end
            end
        end
    end
    table.sort(uniquePets)
    return uniquePets
end

local function getRandomPet(eggName)
    local pets = PetData[eggName]
    if not pets then return "Unknown Pet" end
    local totalWeight = 0
    local weightedPets = {}
    for petName, chance in pairs(pets) do
        totalWeight = totalWeight + chance
        table.insert(weightedPets, {name = petName, weight = chance})
    end
    local randomValue = math.random() * totalWeight
    local currentWeight = 0
    for _, petData in pairs(weightedPets) do
        currentWeight = currentWeight + petData.weight
        if randomValue <= currentWeight then
            return petData.name
        end
    end
    return weightedPets[1].name
end
local function findPlayerFarm()
    local player = game.Players.LocalPlayer
    if not workspace:FindFirstChild("Farm") then return nil end
    local playerName = player.Name
    for _, farm in pairs(workspace.Farm:GetChildren()) do
        if farm.Name == "Farm" and farm:FindFirstChild("Important") then
            local important = farm.Important
            local data = important:FindFirstChild("Data")
            if data and data:FindFirstChild("Owner") then
                local ownerValue = data.Owner.Value
                if tostring(ownerValue) == playerName then
                    return farm
                end
            end
        end
    end
    Rayfield:Notify({
        Title = "Farm Not Found",
        Content = "Could not locate your farm",
        Duration = 3,
        Image = 4483346149,
    })
    return nil
end

local function createEggVisual(egg)
    local eggName = egg:GetAttribute("EggName") or "Unknown Egg"
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineTransparency = 0
    highlight.Parent = egg

    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 150, 0, 50)
    billboard.Adornee = egg
    billboard.AlwaysOnTop = true
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Parent = workspace

    local eggId = tostring(egg)
    local petName
    if SavedPredictions[eggId] then
        petName = SavedPredictions[eggId]
    else
        petName = getRandomPet(eggName)
        SavedPredictions[eggId] = petName
    end

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = petName
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 14
    textLabel.TextScaled = false
    textLabel.TextWrapped = true
    textLabel.Visible = false
    textLabel.Parent = billboard

    return {
        highlight = highlight,
        billboard = billboard,
        textLabel = textLabel,
        eggName = eggName,
        eggId = eggId
    }
end

local function updateEggVisuals()
    if not VisualsEnabled then return end
    local playerFarm = findPlayerFarm()
    if not playerFarm then
        Rayfield:Notify({
            Title = "Debug Error",
            Content = "No farm found, cannot create visuals",
            Duration = 5,
            Image = 4483346149,
        })
        return
    end
    local important = playerFarm:FindFirstChild("Important")
    if not important then
        Rayfield:Notify({
            Title = "Debug Error",
            Content = "Important folder not found in your farm",
            Duration = 5,
            Image = 4483346149,
        })
        return
    end
    local objectsPhysical = important:FindFirstChild("Objects_Physical")
    if not objectsPhysical then
        Rayfield:Notify({
            Title = "Debug Error",
            Content = "Objects_Physical not found in Important folder",
            Duration = 5,
            Image = 4483346149,
        })
        return
    end

    for _, visual in pairs(EggVisuals) do
        if visual.highlight then visual.highlight:Destroy() end
        if visual.billboard then visual.billboard:Destroy() end
    end
    EggVisuals = {}

    local totalEggs = 0
    local readyEggs = 0
    local playerEggs = 0
    local player = game.Players.LocalPlayer

    for _, obj in pairs(objectsPhysical:GetChildren()) do
        if obj.Name == "PetEgg" then
            totalEggs = totalEggs + 1
            local isReady = obj:GetAttribute("READY")
            if isReady then
                readyEggs = readyEggs + 1
            end
            local owner = obj:GetAttribute("OWNER")
            if owner == player.Name then
                playerEggs = playerEggs + 1
                EggVisuals[obj] = createEggVisual(obj)
            end
        end
    end

    Rayfield:Notify({
        Title = "Eggs Found",
        Content = "Total: " .. totalEggs .. " | Ready: " .. readyEggs .. " | Yours: " .. playerEggs,
        Duration = 4,
        Image = 4483346149,
    })

    Rayfield:Notify({
        Title = "Visuals Created",
        Content = "Created " .. playerEggs .. " egg visuals for your eggs",
        Duration = 3,
        Image = 4483346149,
    })

    wait(0.1)
    showAvailablePets()
end

local function rerollPredictions()
    for egg, visual in pairs(EggVisuals) do
        if not PausedEggs[egg] and visual.textLabel and visual.eggName and visual.eggId then
            local newPet = getRandomPet(visual.eggName)
            visual.textLabel.Text = newPet
            visual.textLabel.Visible = true
            SavedPredictions[visual.eggId] = newPet
            if SelectedPet ~= "" and newPet == SelectedPet then
                PausedEggs[egg] = true
                Rayfield:Notify({
                    Title = "Pet Found!",
                    Content = "Found " .. SelectedPet .. " on an egg!",
                    Duration = 3,
                    Image = 4483346149,
                })
            end
        end
    end
end

local function toggleVisuals(state)
    VisualsEnabled = state
    if state then
        updateEggVisuals()
    else
        for _, visual in pairs(EggVisuals) do
            if visual.highlight then visual.highlight:Destroy() end
            if visual.billboard then visual.billboard:Destroy() end
        end
        EggVisuals = {}
        PausedEggs = {}
    end
end

local function handleAutoReroll()
    if AutoRerollConnection then
        AutoRerollConnection:Disconnect()
    end
    if AutoRerollEnabled and VisualsEnabled then
        AutoRerollConnection = game:GetService("RunService").Heartbeat:Connect(function()
            wait(RerollSpeed)
            rerollPredictions()
        end)
    end
end

local function showAvailablePets()
    if not VisualsEnabled or not next(EggVisuals) then return end
    local eggGroups = {}
    for egg, visual in pairs(EggVisuals) do
        local eggName = visual.eggName
        if not eggGroups[eggName] then eggGroups[eggName] = {} end
        if PetData[eggName] then
            for petName, _ in pairs(PetData[eggName]) do
                eggGroups[eggName][petName] = true
            end
        end
    end
    for eggName, pets in pairs(eggGroups) do
        local petNames = {}
        for petName, _ in pairs(pets) do
            table.insert(petNames, petName)
        end
        table.sort(petNames)
        local petsList = table.concat(petNames, ", ")
        Rayfield:Notify({
            Title = eggName .. " (" .. #petNames .. " pets)",
            Content = petsList,
            Duration = 6,
            Image = 4483346149,
        })
        wait(0.2)
    end
end

local EggTab = Window:CreateTab("Pet Egg ESP", 4483346149)

local PetEggToggle = EggTab:CreateToggle({
   Name = "Pet Egg Visuals",
   CurrentValue = false,
   Flag = "PetEggVisualsToggle",
   Callback = function(Value)
       toggleVisuals(Value)
   end,
})

local RerollButton = EggTab:CreateButton({
   Name = "Reroll Predictions",
   Callback = function()
       if VisualsEnabled then
           PausedEggs = {}
           rerollPredictions()
           Rayfield:Notify({
               Title = "Rerolled",
               Content = "Pet predictions have been rerolled!",
               Duration = 2,
               Image = 4483346149,
           })
       else
           Rayfield:Notify({
               Title = "Enable Visuals First",
               Content = "Please enable Pet Egg Visuals first!",
               Duration = 3,
               Image = 4483346149,
           })
       end
   end,
})

local AutoRerollToggle = EggTab:CreateToggle({
   Name = "Auto Reroll",
   CurrentValue = false,
   Flag = "AutoRerollToggle",
   Callback = function(Value)
       AutoRerollEnabled = Value
       handleAutoReroll()
   end,
})

local RerollSpeedSlider = EggTab:CreateSlider({
   Name = "Auto Reroll Speed",
   Range = {0, 10},
   Increment = 1,
   Suffix = " (0.5s)",
   CurrentValue = 1,
   Flag = "RerollSpeedSlider",
   Callback = function(Value)
       RerollSpeed = Value * 0.5
       if Value == 0 then RerollSpeed = 0.25 end
       if AutoRerollEnabled then handleAutoReroll() end
   end,
})

local SelectedPetInput = EggTab:CreateInput({
   Name = "Selected Pet (Case Sensitive)",
   PlaceholderText = "Enter pet name here...",
   RemoveTextAfterFocusLost = false,
   Flag = "SelectedPetInput",
   Callback = function(Text)
       SelectedPet = Text
       PausedEggs = {}
   end,
})

local ShowPetsButton = EggTab:CreateButton({
   Name = "Show Available Pets",
   Callback = function()
       if VisualsEnabled and next(EggVisuals) then
           showAvailablePets()
       else
           Rayfield:Notify({
               Title = "Enable Visuals First",
               Content = "Please enable Pet Egg Visuals first!",
               Duration = 3,
               Image = 4483346149,
           })
       end
   end,
})

local InfoSection = EggTab:CreateSection("How to Use")

EggTab:CreateParagraph({
    Title = "Instructions",
    Content = "1. Enable Pet Egg Visuals to see red highlights on your eggs\n2. Use Reroll to change predictions\n3. Enter a pet name to auto-pause when found\n4. Auto Reroll will continuously change predictions\n5. Show Available Pets displays all possible pets from your eggs"
})

EggTab:CreateParagraph({
    Title = "Credits",
    Content = "Egg ESP by KenriScripts\nPet Egg Predictor Script for Grow A Garden"
})
