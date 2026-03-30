--[[
    Orion UI Library
    Elementos: TextLabel, TextButton, Toggle, Slider, KeyBind, TextBox, Dropdown,
               Checkbox, NumericInput, ColorPicker, Notify
]]

local Orion = {}

function Orion:CreateOrion(orionName)
    orionName = orionName or "Orion"
    local isClosed = false

    local ScreenGui        = Instance.new("ScreenGui")
    local MainWhiteFrame   = Instance.new("Frame")
    local mainCorner       = Instance.new("UICorner")
    local MainWhiteFrame_2 = Instance.new("Frame")
    local mainCorner_2     = Instance.new("UICorner")
    local tabFrame         = Instance.new("Frame")
    local tabList          = Instance.new("UIListLayout")
    local tabPadd          = Instance.new("UIPadding")
    local header           = Instance.new("Frame")
    local mainCorner_4     = Instance.new("UICorner")
    local libTitle         = Instance.new("TextLabel")
    local closeLib         = Instance.new("ImageButton")
    local elementContainer = Instance.new("Frame")
    local mainCorner_5     = Instance.new("UICorner")
    local mainList         = Instance.new("UIListLayout")
    local pagesFolder      = Instance.new("Folder")

    local UserInputService = game:GetService("UserInputService")
    local TweenService     = game:GetService("TweenService")
    local TopBar           = header
    local Camera           = workspace:WaitForChild("Camera")

    -- Dragging
    local DragMousePosition, FramePosition
    local Draggable = false
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            Draggable = true
            DragMousePosition = Vector2.new(input.Position.X, input.Position.Y)
            FramePosition = Vector2.new(
                MainWhiteFrame.Position.X.Scale,
                MainWhiteFrame.Position.Y.Scale
            )
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if Draggable then
            local NewPosition = FramePosition
                + ((Vector2.new(input.Position.X, input.Position.Y) - DragMousePosition)
                / Camera.ViewportSize)
            MainWhiteFrame.Position = UDim2.new(NewPosition.X, 0, NewPosition.Y, 0)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            Draggable = false
        end
    end)

    -- ScreenGui
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- MainWhiteFrame (acento vermelho)
    MainWhiteFrame.Name = "MainWhiteFrame"
    MainWhiteFrame.Parent = ScreenGui
    MainWhiteFrame.BackgroundColor3 = Color3.fromRGB(139, 0, 23)
    MainWhiteFrame.BorderSizePixel = 0
    MainWhiteFrame.ClipsDescendants = true
    MainWhiteFrame.Position = UDim2.new(0.236969739, 0, 0.360436916, 0)
    MainWhiteFrame.Size = UDim2.new(0, 528, 0, 310)
    mainCorner.CornerRadius = UDim.new(0, 3)
    mainCorner.Name = "mainCorner"
    mainCorner.Parent = MainWhiteFrame

    -- MainWhiteFrame_2 (corpo principal)
    MainWhiteFrame_2.Name = "MainWhiteFrame"
    MainWhiteFrame_2.Parent = MainWhiteFrame
    MainWhiteFrame_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainWhiteFrame_2.BorderSizePixel = 0
    MainWhiteFrame_2.ClipsDescendants = true
    MainWhiteFrame_2.Position = UDim2.new(0.0113636367, 0, 0, 0)
    MainWhiteFrame_2.Size = UDim2.new(0, 525, 0, 310)
    mainCorner_2.CornerRadius = UDim.new(0, 3)
    mainCorner_2.Name = "mainCorner"
    mainCorner_2.Parent = MainWhiteFrame_2

    -- Tab sidebar
    tabFrame.Name = "tabFrame"
    tabFrame.Parent = MainWhiteFrame_2
    tabFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    tabFrame.BorderColor3 = Color3.fromRGB(53, 53, 53)
    tabFrame.ClipsDescendants = true
    tabFrame.Size = UDim2.new(0, 100, 0, 309)
    tabList.Name = "tabList"
    tabList.Parent = tabFrame
    tabList.HorizontalAlignment = Enum.HorizontalAlignment.Right
    tabList.SortOrder = Enum.SortOrder.LayoutOrder
    tabList.Padding = UDim.new(0, 2)
    tabPadd.Name = "tabPadd"
    tabPadd.Parent = tabFrame
    tabPadd.PaddingRight = UDim.new(0, 2)
    tabPadd.PaddingTop = UDim.new(0, 5)

    -- Header
    header.Name = "header"
    header.Parent = MainWhiteFrame_2
    header.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
    header.Position = UDim2.new(0.207619041, 0, 0.0258064512, 0)
    header.Size = UDim2.new(0, 408, 0, 43)
    mainCorner_4.CornerRadius = UDim.new(0, 3)
    mainCorner_4.Name = "mainCorner"
    mainCorner_4.Parent = header

    libTitle.Name = "libTitle"
    libTitle.Parent = header
    libTitle.BackgroundTransparency = 1
    libTitle.Position = UDim2.new(0.0294117648, 0, 0, 0)
    libTitle.Size = UDim2.new(0, 343, 0, 43)
    libTitle.Font = Enum.Font.GothamSemibold
    libTitle.Text = orionName
    libTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    libTitle.TextSize = 18
    libTitle.TextXAlignment = Enum.TextXAlignment.Left

    closeLib.Name = "closeLib"
    closeLib.Parent = header
    closeLib.BackgroundTransparency = 1
    closeLib.Position = UDim2.new(0.91911763, 0, 0.209302321, 0)
    closeLib.Size = UDim2.new(0, 25, 0, 25)
    closeLib.Image = "rbxassetid://4988112250"
    closeLib.MouseButton1Click:Connect(function()
        isClosed = not isClosed
        if isClosed then
            closeLib.Image = "rbxassetid://5165666242"
            TweenService:Create(closeLib, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Rotation = 360 }):Play()
            MainWhiteFrame:TweenSize(UDim2.new(0, 424, 0, 58), "In", "Linear", 0.12)
            TweenService:Create(MainWhiteFrame_2, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
            TweenService:Create(MainWhiteFrame,   TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
        else
            closeLib.Image = "rbxassetid://4988112250"
            TweenService:Create(closeLib, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Rotation = 0 }):Play()
            MainWhiteFrame:TweenSize(UDim2.new(0, 528, 0, 310), "In", "Linear", 0.12)
            TweenService:Create(MainWhiteFrame_2, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 0 }):Play()
            TweenService:Create(MainWhiteFrame,   TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 0 }):Play()
        end
    end)

    -- Element container
    elementContainer.Name = "elementContainer"
    elementContainer.Parent = MainWhiteFrame_2
    elementContainer.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    elementContainer.Position = UDim2.new(0.207619041, 0, 0.187096775, 0)
    elementContainer.Size = UDim2.new(0, 408, 0, 243)
    mainCorner_5.CornerRadius = UDim.new(0, 3)
    mainCorner_5.Name = "mainCorner"
    mainCorner_5.Parent = elementContainer

    mainList.Name = "mainList"
    mainList.Parent = MainWhiteFrame
    mainList.HorizontalAlignment = Enum.HorizontalAlignment.Right
    mainList.SortOrder = Enum.SortOrder.LayoutOrder

    pagesFolder.Parent = elementContainer

    -- ===========================
    --  Notification system
    -- ===========================
    local notifCount = 0

    local SectionHandler = {}

    --[[
        SectionHandler:Notify(title, message, duration)
        Exibe um toast no canto superior direito da tela.
        duration: segundos (padrão 3)
    ]]
    function SectionHandler:Notify(nTitle, nMsg, nDuration)
        nTitle    = nTitle    or "Notification"
        nMsg      = nMsg      or ""
        nDuration = nDuration or 3
        notifCount += 1
        local slot = notifCount

        local notifFrame  = Instance.new("Frame")
        local notifCorner = Instance.new("UICorner")
        local accent      = Instance.new("Frame")
        local accentCorner= Instance.new("UICorner")
        local titleLbl    = Instance.new("TextLabel")
        local msgLbl      = Instance.new("TextLabel")
        local timerBar    = Instance.new("Frame")
        local timerCorner = Instance.new("UICorner")

        notifFrame.Name = "OrionNotif_"..slot
        notifFrame.Parent = ScreenGui
        notifFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        notifFrame.BorderSizePixel = 0
        notifFrame.AnchorPoint = Vector2.new(1, 0)
        notifFrame.Position = UDim2.new(1, 270, 0, 10 + (slot - 1) * 80)
        notifFrame.Size = UDim2.new(0, 260, 0, 70)
        notifCorner.CornerRadius = UDim.new(0, 4)
        notifCorner.Parent = notifFrame

        accent.Parent = notifFrame
        accent.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
        accent.BorderSizePixel = 0
        accent.Size = UDim2.new(0, 4, 1, 0)
        accentCorner.CornerRadius = UDim.new(0, 4)
        accentCorner.Parent = accent

        titleLbl.Parent = notifFrame
        titleLbl.BackgroundTransparency = 1
        titleLbl.Position = UDim2.new(0, 12, 0, 8)
        titleLbl.Size = UDim2.new(1, -16, 0, 22)
        titleLbl.Font = Enum.Font.GothamBold
        titleLbl.Text = nTitle
        titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLbl.TextSize = 14
        titleLbl.TextXAlignment = Enum.TextXAlignment.Left

        msgLbl.Parent = notifFrame
        msgLbl.BackgroundTransparency = 1
        msgLbl.Position = UDim2.new(0, 12, 0, 32)
        msgLbl.Size = UDim2.new(1, -16, 0, 26)
        msgLbl.Font = Enum.Font.Gotham
        msgLbl.Text = nMsg
        msgLbl.TextColor3 = Color3.fromRGB(180, 180, 180)
        msgLbl.TextSize = 12
        msgLbl.TextXAlignment = Enum.TextXAlignment.Left
        msgLbl.TextWrapped = true

        timerBar.Parent = notifFrame
        timerBar.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
        timerBar.BorderSizePixel = 0
        timerBar.AnchorPoint = Vector2.new(0, 1)
        timerBar.Position = UDim2.new(0, 0, 1, 0)
        timerBar.Size = UDim2.new(1, 0, 0, 3)
        timerCorner.CornerRadius = UDim.new(0, 4)
        timerCorner.Parent = timerBar

        -- Slide in
        TweenService:Create(notifFrame,
            TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            { Position = UDim2.new(1, -10, 0, 10 + (slot - 1) * 80) }
        ):Play()

        -- Progress bar
        TweenService:Create(timerBar,
            TweenInfo.new(nDuration, Enum.EasingStyle.Linear),
            { Size = UDim2.new(0, 0, 0, 3) }
        ):Play()

        -- Slide out & destroy
        task.delay(nDuration, function()
            TweenService:Create(notifFrame,
                TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                { Position = UDim2.new(1, 270, 0, 10 + (slot - 1) * 80) }
            ):Play()
            task.wait(0.31)
            notifCount -= 1
            notifFrame:Destroy()
        end)
    end

    -- ===========================
    --  CreateSection
    -- ===========================
    function SectionHandler:CreateSection(secName)
        secName = secName or "Tab"

        local tabBtn      = Instance.new("TextButton")
        local mainCorner_3 = Instance.new("UICorner")

        tabBtn.Name = "tabBtn"..secName
        tabBtn.Parent = tabFrame
        tabBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        tabBtn.BorderColor3 = Color3.fromRGB(53, 53, 53)
        tabBtn.Position = UDim2.new(0.0599999987, 0, 0.0323624611, 0)
        tabBtn.Size = UDim2.new(0, 95, 0, 32)
        tabBtn.Font = Enum.Font.GothamSemibold
        tabBtn.Text = secName
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabBtn.TextSize = 14
        tabBtn.AutoButtonColor = false
        mainCorner_3.CornerRadius = UDim.new(0, 3)
        mainCorner_3.Name = "mainCorner"
        mainCorner_3.Parent = tabBtn

        local newPage      = Instance.new("ScrollingFrame")
        local pageItemList = Instance.new("UIListLayout")
        local UIPadding    = Instance.new("UIPadding")

        newPage.Name = "newPage"..secName
        newPage.Parent = pagesFolder
        newPage.Active = true
        newPage.BackgroundTransparency = 1
        newPage.BorderSizePixel = 0
        newPage.Size = UDim2.new(1, 0, 1, 0)
        newPage.ScrollBarThickness = 5
        newPage.ScrollBarImageColor3 = Color3.fromRGB(255, 2, 40)
        newPage.Visible = false

        pageItemList.Name = "pageItemList"
        pageItemList.Parent = newPage
        pageItemList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        pageItemList.SortOrder = Enum.SortOrder.LayoutOrder
        pageItemList.Padding = UDim.new(0, 3)

        UIPadding.Parent = newPage
        UIPadding.PaddingRight = UDim.new(0, 5)
        UIPadding.PaddingTop = UDim.new(0, 5)

        local function UpdateSize()
            local cS = pageItemList.AbsoluteContentSize
            TweenService:Create(newPage,
                TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
                { CanvasSize = UDim2.new(0, cS.X, 0, cS.Y + 10) }
            ):Play()
        end

        newPage.ChildAdded:Connect(UpdateSize)
        newPage.ChildRemoved:Connect(UpdateSize)
        UpdateSize()

        tabBtn.MouseButton1Click:Connect(function()
            UpdateSize()
            for _, v in next, pagesFolder:GetChildren() do
                v.Visible = false
            end
            newPage.Visible = true
            for _, v in next, tabFrame:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(v,
                        TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(25, 25, 25) }
                    ):Play()
                end
            end
            TweenService:Create(tabBtn,
                TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                { BackgroundColor3 = Color3.fromRGB(139, 0, 23) }
            ):Play()
        end)

        local ElementHandler = {}

        -- ───────────────────────────────────────────────────
        --  TextLabel
        -- ───────────────────────────────────────────────────
        function ElementHandler:TextLabel(labelText)
            labelText = labelText or ""
            local labelFrame = Instance.new("Frame")
            local lCorner    = Instance.new("UICorner")
            local txtLabel   = Instance.new("TextLabel")

            labelFrame.Name = "labelFrame"
            labelFrame.Parent = newPage
            labelFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            labelFrame.Position = UDim2.new(0.0367647074, 0, 0.0185185187, 0)
            labelFrame.Size = UDim2.new(0, 394, 0, 42)
            lCorner.CornerRadius = UDim.new(0, 3)
            lCorner.Parent = labelFrame

            txtLabel.Name = "txtLabel"
            txtLabel.Parent = labelFrame
            txtLabel.BackgroundTransparency = 1
            txtLabel.Position = UDim2.new(0, 0, 0.0238095243, 0)
            txtLabel.Size = UDim2.new(0, 395, 0, 41)
            txtLabel.Font = Enum.Font.GothamSemibold
            txtLabel.Text = labelText
            txtLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            txtLabel.TextSize = 14
        end

        -- ───────────────────────────────────────────────────
        --  TextButton
        -- ───────────────────────────────────────────────────
        function ElementHandler:TextButton(buttonText, buttonInfo, callback)
            buttonText = buttonText or ""
            buttonInfo = buttonInfo or ""
            callback   = callback   or function() end

            local textButtonFrame = Instance.new("Frame")
            local tbCorner        = Instance.new("UICorner")
            local TextButton      = Instance.new("TextButton")
            local btnCorner       = Instance.new("UICorner")
            local textButtonInfo  = Instance.new("TextLabel")

            textButtonFrame.Name = "textButtonFrame"
            textButtonFrame.Parent = newPage
            textButtonFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            textButtonFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
            textButtonFrame.Size = UDim2.new(0, 394, 0, 42)
            tbCorner.CornerRadius = UDim.new(0, 3)
            tbCorner.Parent = textButtonFrame

            TextButton.Parent = textButtonFrame
            TextButton.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            TextButton.Position = UDim2.new(0.017766498, 0, 0.166666672, 0)
            TextButton.Size = UDim2.new(0, 141, 0, 27)
            TextButton.Font = Enum.Font.GothamSemibold
            TextButton.Text = buttonText
            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.TextSize = 14
            btnCorner.CornerRadius = UDim.new(0, 3)
            btnCorner.Parent = TextButton

            textButtonInfo.Name = "textButtonInfo"
            textButtonInfo.Parent = textButtonFrame
            textButtonInfo.BackgroundTransparency = 1
            textButtonInfo.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
            textButtonInfo.Size = UDim2.new(0, 226, 0, 41)
            textButtonInfo.Font = Enum.Font.GothamSemibold
            textButtonInfo.Text = buttonInfo
            textButtonInfo.TextColor3 = Color3.fromRGB(198, 198, 198)
            textButtonInfo.TextSize = 14
            textButtonInfo.TextXAlignment = Enum.TextXAlignment.Right

            TextButton.MouseButton1Click:Connect(callback)
        end

        -- ───────────────────────────────────────────────────
        --  Toggle
        -- ───────────────────────────────────────────────────
        function ElementHandler:Toggle(togInfo, callback)
            togInfo  = togInfo  or ""
            callback = callback or function() end

            local toggleFrame       = Instance.new("Frame")
            local togCorner         = Instance.new("UICorner")
            local toggleInfo        = Instance.new("TextLabel")
            local toggleInerFrame   = Instance.new("Frame")
            local tifCorner         = Instance.new("UICorner")
            local toggleInnerFrame1 = Instance.new("Frame")
            local tif1Corner        = Instance.new("UICorner")
            local toggleBtn         = Instance.new("TextButton")
            local tbCorner          = Instance.new("UICorner")
            local UIListLayout      = Instance.new("UIListLayout")
            local UIListLayout_2    = Instance.new("UIListLayout")

            toggleFrame.Name = "toggleFrame"
            toggleFrame.Parent = newPage
            toggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            toggleFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
            toggleFrame.Size = UDim2.new(0, 394, 0, 42)
            togCorner.CornerRadius = UDim.new(0, 3)
            togCorner.Parent = toggleFrame

            toggleInfo.Name = "toggleInfo"
            toggleInfo.Parent = toggleFrame
            toggleInfo.BackgroundTransparency = 1
            toggleInfo.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
            toggleInfo.Size = UDim2.new(0, 226, 0, 41)
            toggleInfo.Font = Enum.Font.GothamSemibold
            toggleInfo.Text = togInfo
            toggleInfo.TextColor3 = Color3.fromRGB(198, 198, 198)
            toggleInfo.TextSize = 14
            toggleInfo.TextXAlignment = Enum.TextXAlignment.Right

            toggleInerFrame.Name = "toggleInerFrame"
            toggleInerFrame.Parent = toggleFrame
            toggleInerFrame.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            toggleInerFrame.Position = UDim2.new(0.0177664906, 0, 0.166666672, 0)
            toggleInerFrame.Size = UDim2.new(0, 27, 0, 27)
            tifCorner.CornerRadius = UDim.new(0, 3)
            tifCorner.Parent = toggleInerFrame

            toggleInnerFrame1.Name = "toggleInnerFrame1"
            toggleInnerFrame1.Parent = toggleInerFrame
            toggleInnerFrame1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            toggleInnerFrame1.Position = UDim2.new(0.0177664906, 0, -0.0185185075, 0)
            toggleInnerFrame1.Size = UDim2.new(0, 25, 0, 25)
            tif1Corner.CornerRadius = UDim.new(0, 3)
            tif1Corner.Parent = toggleInnerFrame1

            toggleBtn.Name = "toggleBtn"
            toggleBtn.Parent = toggleInnerFrame1
            toggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            toggleBtn.Position = UDim2.new(2.2399888, 0, -0.0185185149, 0)
            toggleBtn.Size = UDim2.new(0, 23, 0, 23)
            toggleBtn.Font = Enum.Font.GothamSemibold
            toggleBtn.Text = ""
            toggleBtn.AutoButtonColor = false
            tbCorner.CornerRadius = UDim.new(0, 3)
            tbCorner.Parent = toggleBtn

            UIListLayout.Parent = toggleInnerFrame1
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

            UIListLayout_2.Parent = toggleInerFrame
            UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

            local toggled = false
            toggleBtn.MouseButton1Click:Connect(function()
                toggled = not toggled
                callback(toggled)
                TweenService:Create(toggleBtn,
                    TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    { BackgroundColor3 = toggled
                        and Color3.fromRGB(181, 1, 31)
                        or  Color3.fromRGB(25, 25, 25) }
                ):Play()
            end)
        end

        -- ───────────────────────────────────────────────────
        --  Slider
        -- ───────────────────────────────────────────────────
        function ElementHandler:Slider(sliderin, minvalue, maxvalue, callback)
            minvalue = minvalue or 0
            maxvalue = maxvalue or 500
            callback = callback or function() end
            sliderin = sliderin or "info ok"

            local sliderFrame   = Instance.new("Frame")
            local slCorner      = Instance.new("UICorner")
            local sliderInfo    = Instance.new("TextLabel")
            local sliderValue   = Instance.new("TextLabel")
            local sliderBtn     = Instance.new("TextButton")
            local sliderdragfrm = Instance.new("UIListLayout")
            local sliderMainFrm = Instance.new("Frame")
            local sliderlist    = Instance.new("UIListLayout")
            local smfCorner     = Instance.new("UICorner")
            local sbCorner      = Instance.new("UICorner")

            sliderFrame.Name = "sliderFrame"
            sliderFrame.Parent = newPage
            sliderFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            sliderFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
            sliderFrame.Size = UDim2.new(0, 394, 0, 42)
            slCorner.CornerRadius = UDim.new(0, 3)
            slCorner.Parent = sliderFrame

            sliderInfo.Name = "sliderInfo"
            sliderInfo.Parent = sliderFrame
            sliderInfo.BackgroundTransparency = 1
            sliderInfo.Position = UDim2.new(0.570575714, 0, 0.0238095243, 0)
            sliderInfo.Size = UDim2.new(0, 157, 0, 41)
            sliderInfo.Font = Enum.Font.GothamSemibold
            sliderInfo.Text = sliderin
            sliderInfo.TextColor3 = Color3.fromRGB(198, 198, 198)
            sliderInfo.TextSize = 14
            sliderInfo.TextXAlignment = Enum.TextXAlignment.Right

            sliderValue.Name = "sliderValue"
            sliderValue.Parent = sliderFrame
            sliderValue.BackgroundTransparency = 1
            sliderValue.Position = UDim2.new(0.395939082, 0, 0.285714298, 0)
            sliderValue.Size = UDim2.new(0, 68, 0, 17)
            sliderValue.Font = Enum.Font.GothamSemibold
            sliderValue.Text = minvalue.."/"..maxvalue
            sliderValue.TextColor3 = Color3.fromRGB(199, 0, 33)
            sliderValue.TextSize = 14
            sliderValue.TextXAlignment = Enum.TextXAlignment.Left

            sliderBtn.Name = "sliderBtn"
            sliderBtn.Parent = sliderFrame
            sliderBtn.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            sliderBtn.BorderSizePixel = 0
            sliderBtn.Position = UDim2.new(0.0179999992, 0, 0.381000012, 0)
            sliderBtn.Size = UDim2.new(0, 141, 0, 10)
            sliderBtn.AutoButtonColor = false
            sliderBtn.Font = Enum.Font.SourceSans
            sliderBtn.Text = ""
            sbCorner.CornerRadius = UDim.new(0, 3)
            sbCorner.Parent = sliderBtn

            sliderdragfrm.Name = "sliderdragfrm"
            sliderdragfrm.Parent = sliderBtn
            sliderdragfrm.SortOrder = Enum.SortOrder.LayoutOrder
            sliderdragfrm.VerticalAlignment = Enum.VerticalAlignment.Center

            sliderMainFrm.Name = "sliderMainFrm"
            sliderMainFrm.Parent = sliderBtn
            sliderMainFrm.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            sliderMainFrm.BorderSizePixel = 0
            sliderMainFrm.Size = UDim2.new(0, 0, 0, 10)
            smfCorner.CornerRadius = UDim.new(0, 5)
            smfCorner.Parent = sliderMainFrm

            sliderlist.Name = "sliderlist"
            sliderlist.Parent = sliderMainFrm
            sliderlist.HorizontalAlignment = Enum.HorizontalAlignment.Right
            sliderlist.SortOrder = Enum.SortOrder.LayoutOrder
            sliderlist.VerticalAlignment = Enum.VerticalAlignment.Center

            local mouse = game.Players.LocalPlayer:GetMouse()
            local Value

            sliderBtn.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 141) * sliderMainFrm.AbsoluteSize.X) + tonumber(minvalue)) or 0
                pcall(callback, Value)
                sliderMainFrm.Size = UDim2.new(0, math.clamp(mouse.X - sliderMainFrm.AbsolutePosition.X, 0, 141), 0, 10)
                local moveconnection = mouse.Move:Connect(function()
                    sliderValue.Text = Value.."/"..maxvalue
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 141) * sliderMainFrm.AbsoluteSize.X) + tonumber(minvalue))
                    pcall(callback, Value)
                    sliderMainFrm.Size = UDim2.new(0, math.clamp(mouse.X - sliderMainFrm.AbsolutePosition.X, 0, 141), 0, 10)
                end)
                local releaseconnection
                releaseconnection = UserInputService.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 141) * sliderMainFrm.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(callback, Value)
                        sliderValue.Text = Value.."/"..maxvalue
                        sliderMainFrm.Size = UDim2.new(0, math.clamp(mouse.X - sliderMainFrm.AbsolutePosition.X, 0, 141), 0, 10)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
        end

        -- ───────────────────────────────────────────────────
        --  KeyBind
        -- ───────────────────────────────────────────────────
        function ElementHandler:KeyBind(keInfo, firstt, callback)
            local oldKey = firstt.Name
            keInfo   = keInfo   or ""
            callback = callback or function() end

            local keybindFrame = Instance.new("Frame")
            local kbCorner     = Instance.new("UICorner")
            local TextButton   = Instance.new("TextButton")
            local tbCorner     = Instance.new("UICorner")
            local keybindinfo  = Instance.new("TextLabel")

            keybindFrame.Name = "keybindFrame"
            keybindFrame.Parent = newPage
            keybindFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            keybindFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
            keybindFrame.Size = UDim2.new(0, 394, 0, 42)
            kbCorner.CornerRadius = UDim.new(0, 3)
            kbCorner.Parent = keybindFrame

            TextButton.Parent = keybindFrame
            TextButton.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            TextButton.Position = UDim2.new(0.017766498, 0, 0.166666672, 0)
            TextButton.Size = UDim2.new(0, 76, 0, 27)
            TextButton.Font = Enum.Font.GothamSemibold
            TextButton.Text = oldKey
            TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextButton.TextSize = 14
            tbCorner.CornerRadius = UDim.new(0, 3)
            tbCorner.Parent = TextButton

            keybindinfo.Name = "keybindinfo"
            keybindinfo.Parent = keybindFrame
            keybindinfo.BackgroundTransparency = 1
            keybindinfo.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
            keybindinfo.Size = UDim2.new(0, 226, 0, 41)
            keybindinfo.Font = Enum.Font.GothamSemibold
            keybindinfo.Text = keInfo
            keybindinfo.TextColor3 = Color3.fromRGB(198, 198, 198)
            keybindinfo.TextSize = 14
            keybindinfo.TextXAlignment = Enum.TextXAlignment.Right

            TextButton.MouseButton1Click:connect(function()
                TextButton.Text = ". . ."
                local a, _ = game:GetService("UserInputService").InputBegan:wait()
                if a.KeyCode.Name ~= "Unknown" then
                    TextButton.Text = a.KeyCode.Name
                    oldKey = a.KeyCode.Name
                end
            end)

            game:GetService("UserInputService").InputBegan:connect(function(current, ok)
                if not ok then
                    if current.KeyCode.Name == oldKey then
                        callback()
                    end
                end
            end)
        end

        -- ───────────────────────────────────────────────────
        --  TextBox
        -- ───────────────────────────────────────────────────
        function ElementHandler:TextBox(textInfo, placeHolderText1, callback)
            textInfo          = textInfo          or ""
            placeHolderText1  = placeHolderText1  or ""
            callback          = callback          or function() end

            local textBoxFrame  = Instance.new("Frame")
            local txbCorner     = Instance.new("UICorner")
            local textboxInfo   = Instance.new("TextLabel")
            local texboxInner   = Instance.new("Frame")
            local tiCorner      = Instance.new("UICorner")
            local textboxinneer = Instance.new("Frame")
            local tinCorner     = Instance.new("UICorner")
            local UIListLayout  = Instance.new("UIListLayout")
            local TextBox       = Instance.new("TextBox")
            local UIListLayout_2 = Instance.new("UIListLayout")

            textBoxFrame.Name = "textBoxFrame"
            textBoxFrame.Parent = newPage
            textBoxFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            textBoxFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
            textBoxFrame.Size = UDim2.new(0, 394, 0, 42)
            txbCorner.CornerRadius = UDim.new(0, 3)
            txbCorner.Parent = textBoxFrame

            textboxInfo.Name = "textboxInfo"
            textboxInfo.Parent = textBoxFrame
            textboxInfo.BackgroundTransparency = 1
            textboxInfo.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
            textboxInfo.Size = UDim2.new(0, 226, 0, 41)
            textboxInfo.Font = Enum.Font.GothamSemibold
            textboxInfo.Text = textInfo
            textboxInfo.TextColor3 = Color3.fromRGB(198, 198, 198)
            textboxInfo.TextSize = 14
            textboxInfo.TextXAlignment = Enum.TextXAlignment.Right

            texboxInner.Name = "texboxInner"
            texboxInner.Parent = textBoxFrame
            texboxInner.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            texboxInner.Position = UDim2.new(0.017766498, 0, 0.166666672, 0)
            texboxInner.Size = UDim2.new(0, 141, 0, 27)
            tiCorner.CornerRadius = UDim.new(0, 3)
            tiCorner.Parent = texboxInner

            textboxinneer.Name = "textboxinneer"
            textboxinneer.Parent = texboxInner
            textboxinneer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            textboxinneer.ClipsDescendants = true
            textboxinneer.Position = UDim2.new(0.411347508, 0, 0.0370370373, 0)
            textboxinneer.Size = UDim2.new(0, 139, 0, 25)
            tinCorner.CornerRadius = UDim.new(0, 3)
            tinCorner.Parent = textboxinneer

            UIListLayout.Parent = textboxinneer
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

            TextBox.Parent = textboxinneer
            TextBox.BackgroundTransparency = 1
            TextBox.Size = UDim2.new(1, 0, 1, 0)
            TextBox.Font = Enum.Font.GothamSemibold
            TextBox.PlaceholderColor3 = Color3.fromRGB(115, 115, 115)
            TextBox.PlaceholderText = placeHolderText1
            TextBox.Text = ""
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 13
            TextBox.TextWrapped = true

            UIListLayout_2.Parent = texboxInner
            UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

            TextBox.FocusLost:Connect(function(EnterPressed)
                if not EnterPressed then return end
                callback(TextBox.Text)
                TextBox.Text = ""
            end)
        end

        -- ───────────────────────────────────────────────────
        --  Dropdown
        -- ───────────────────────────────────────────────────
        function ElementHandler:Dropdown(dInfo, list, callback)
            dInfo    = dInfo    or ""
            list     = list     or {}
            callback = callback or function() end

            local isDropped  = false
            local DropYSize  = 42

            local dropDownFrame = Instance.new("Frame")
            local ddCorner      = Instance.new("UICorner")
            local dropdownmain  = Instance.new("Frame")
            local dmCorner      = Instance.new("UICorner")
            local dropdownItem  = Instance.new("TextLabel")
            local ImageButton   = Instance.new("ImageButton")
            local UIListLayout  = Instance.new("UIListLayout")

            dropDownFrame.Name = "dropDownFrame"
            dropDownFrame.Parent = newPage
            dropDownFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            dropDownFrame.ClipsDescendants = true
            dropDownFrame.Position = UDim2.new(0.011029412, 0, 0.0205760058, 0)
            dropDownFrame.Size = UDim2.new(0, 394, 0, 42)
            ddCorner.CornerRadius = UDim.new(0, 3)
            ddCorner.Parent = dropDownFrame

            dropdownmain.Name = "dropdownmain"
            dropdownmain.Parent = dropDownFrame
            dropdownmain.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            dropdownmain.Size = UDim2.new(0, 394, 0, 42)
            dmCorner.CornerRadius = UDim.new(0, 3)
            dmCorner.Parent = dropdownmain

            dropdownItem.Name = "dropdownItem"
            dropdownItem.Parent = dropdownmain
            dropdownItem.BackgroundTransparency = 1
            dropdownItem.Position = UDim2.new(0.0223523453, 0, 0, 0)
            dropdownItem.Size = UDim2.new(0, 291, 0, 41)
            dropdownItem.Font = Enum.Font.GothamSemibold
            dropdownItem.Text = dInfo
            dropdownItem.TextColor3 = Color3.fromRGB(255, 1, 43)
            dropdownItem.TextSize = 14
            dropdownItem.TextXAlignment = Enum.TextXAlignment.Left

            ImageButton.Parent = dropdownmain
            ImageButton.BackgroundTransparency = 1
            ImageButton.Position = UDim2.new(0.89974618, 0, 0.238095239, 0)
            ImageButton.Size = UDim2.new(0, 27, 0, 21)
            ImageButton.Image = "rbxassetid://5165666242"
            ImageButton.ImageColor3 = Color3.fromRGB(181, 1, 31)

            UIListLayout.Parent = dropDownFrame
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0, 5)

            ImageButton.MouseButton1Click:Connect(function()
                if isDropped then
                    isDropped = false
                    dropDownFrame:TweenSize(UDim2.new(0, 394, 0, 42), "In", "Quint", 0.10)
                    TweenService:Create(ImageButton, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Rotation = 0 }):Play()
                    task.wait(0.10)
                    UpdateSize()
                else
                    isDropped = true
                    dropDownFrame:TweenSize(UDim2.new(0, 394, 0, DropYSize), "In", "Quint", 0.10)
                    TweenService:Create(ImageButton, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Rotation = 180 }):Play()
                    task.wait(0.10)
                    UpdateSize()
                end
            end)

            for _, v in next, list do
                local optionBtn    = Instance.new("TextButton")
                local optionCorner = Instance.new("UICorner")

                optionBtn.Name = "optionBtn"
                optionBtn.Parent = dropDownFrame
                optionBtn.BackgroundColor3 = Color3.fromRGB(118, 0, 20)
                optionBtn.Position = UDim2.new(0.0253807101, 0, 0.311258286, 0)
                optionBtn.Size = UDim2.new(0, 377, 0, 39)
                optionBtn.Font = Enum.Font.GothamSemibold
                optionBtn.Text = "   "..v
                optionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                optionBtn.TextSize = 14
                optionBtn.TextXAlignment = Enum.TextXAlignment.Left
                DropYSize = DropYSize + 48
                optionCorner.CornerRadius = UDim.new(0, 3)
                optionCorner.Parent = optionBtn

                optionBtn.MouseButton1Click:Connect(function()
                    callback(v)
                    dropdownItem.Text = dInfo..": "..v
                    dropDownFrame:TweenSize(UDim2.new(0, 394, 0, 42), "In", "Quint", 0.10)
                    task.wait(0.10)
                    UpdateSize()
                    TweenService:Create(ImageButton, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Rotation = 0 }):Play()
                    isDropped = false
                end)
            end
        end

        -- ───────────────────────────────────────────────────
        --  [NOVO] Checkbox
        -- ───────────────────────────────────────────────────
        --[[
            ElementHandler:Checkbox(cbInfo, defaultState, callback)
            cbInfo:       string  – texto descritivo (direita)
            defaultState: bool   – estado inicial (padrão false)
            callback:     fn(bool)
        ]]
        function ElementHandler:Checkbox(cbInfo, defaultState, callback)
            cbInfo       = cbInfo       or ""
            defaultState = defaultState or false
            callback     = callback     or function() end
            local checked = defaultState

            local checkFrame  = Instance.new("Frame")
            local cfCorner    = Instance.new("UICorner")
            local infoLbl     = Instance.new("TextLabel")
            local checkOuter  = Instance.new("Frame")
            local coCorner    = Instance.new("UICorner")
            local checkInner  = Instance.new("Frame")
            local ciCorner    = Instance.new("UICorner")
            local checkMark   = Instance.new("TextLabel")
            local checkBtn    = Instance.new("TextButton")
            local cbCorner    = Instance.new("UICorner")

            checkFrame.Name = "checkFrame"
            checkFrame.Parent = newPage
            checkFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            checkFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
            checkFrame.Size = UDim2.new(0, 394, 0, 42)
            cfCorner.CornerRadius = UDim.new(0, 3)
            cfCorner.Parent = checkFrame

            infoLbl.Parent = checkFrame
            infoLbl.BackgroundTransparency = 1
            infoLbl.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
            infoLbl.Size = UDim2.new(0, 226, 0, 41)
            infoLbl.Font = Enum.Font.GothamSemibold
            infoLbl.Text = cbInfo
            infoLbl.TextColor3 = Color3.fromRGB(198, 198, 198)
            infoLbl.TextSize = 14
            infoLbl.TextXAlignment = Enum.TextXAlignment.Right

            -- Borda vermelha
            checkOuter.Name = "checkOuter"
            checkOuter.Parent = checkFrame
            checkOuter.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            checkOuter.Position = UDim2.new(0.0177664906, 0, 0.166666672, 0)
            checkOuter.Size = UDim2.new(0, 27, 0, 27)
            coCorner.CornerRadius = UDim.new(0, 3)
            coCorner.Parent = checkOuter

            -- Interior escuro
            checkInner.Name = "checkInner"
            checkInner.Parent = checkOuter
            checkInner.AnchorPoint = Vector2.new(0.5, 0.5)
            checkInner.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            checkInner.BorderSizePixel = 0
            checkInner.Position = UDim2.new(0.5, 0, 0.5, 0)
            checkInner.Size = UDim2.new(0, 23, 0, 23)
            ciCorner.CornerRadius = UDim.new(0, 2)
            ciCorner.Parent = checkInner

            -- Checkmark (✓)
            checkMark.Name = "checkMark"
            checkMark.Parent = checkInner
            checkMark.BackgroundTransparency = 1
            checkMark.Size = UDim2.new(1, 0, 1, 0)
            checkMark.Font = Enum.Font.GothamBold
            checkMark.Text = "✓"
            checkMark.TextColor3 = Color3.fromRGB(255, 255, 255)
            checkMark.TextSize = 16
            checkMark.Visible = checked

            -- Botão transparente sobre o inner
            checkBtn.Name = "checkBtn"
            checkBtn.Parent = checkInner
            checkBtn.BackgroundTransparency = 1
            checkBtn.Size = UDim2.new(1, 0, 1, 0)
            checkBtn.Text = ""
            checkBtn.AutoButtonColor = false
            cbCorner.CornerRadius = UDim.new(0, 2)
            cbCorner.Parent = checkBtn

            local function applyVisual()
                if checked then
                    TweenService:Create(checkInner,
                        TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(181, 1, 31) }
                    ):Play()
                    checkMark.Visible = true
                else
                    TweenService:Create(checkInner,
                        TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                        { BackgroundColor3 = Color3.fromRGB(25, 25, 25) }
                    ):Play()
                    checkMark.Visible = false
                end
            end

            applyVisual()

            checkBtn.MouseButton1Click:Connect(function()
                checked = not checked
                callback(checked)
                applyVisual()
            end)
        end

        -- ───────────────────────────────────────────────────
        --  [NOVO] NumericInput
        -- ───────────────────────────────────────────────────
        --[[
            ElementHandler:NumericInput(numInfo, default, minVal, maxVal, step, callback)
            numInfo:  string  – descrição (direita)
            default:  number  – valor inicial
            minVal:   number  – mínimo
            maxVal:   number  – máximo
            step:     number  – incremento dos botões +/-
            callback: fn(number)
        ]]
        function ElementHandler:NumericInput(numInfo, default, minVal, maxVal, step, callback)
            numInfo  = numInfo  or ""
            default  = default  or 0
            minVal   = minVal   or 0
            maxVal   = maxVal   or 100
            step     = step     or 1
            callback = callback or function() end
            local value = math.clamp(default, minVal, maxVal)

            local numFrame    = Instance.new("Frame")
            local nfCorner    = Instance.new("UICorner")
            local infoLbl     = Instance.new("TextLabel")
            local minusBtn    = Instance.new("TextButton")
            local mbCorner    = Instance.new("UICorner")
            local valueDisplay = Instance.new("TextBox")
            local vdCorner    = Instance.new("UICorner")
            local plusBtn     = Instance.new("TextButton")
            local pbCorner    = Instance.new("UICorner")

            numFrame.Name = "numFrame"
            numFrame.Parent = newPage
            numFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            numFrame.Position = UDim2.new(0.0147058824, 0, 0.0246913582, 0)
            numFrame.Size = UDim2.new(0, 394, 0, 42)
            nfCorner.CornerRadius = UDim.new(0, 3)
            nfCorner.Parent = numFrame

            infoLbl.Parent = numFrame
            infoLbl.BackgroundTransparency = 1
            infoLbl.Position = UDim2.new(0.395939082, 0, 0.0238095243, 0)
            infoLbl.Size = UDim2.new(0, 226, 0, 41)
            infoLbl.Font = Enum.Font.GothamSemibold
            infoLbl.Text = numInfo
            infoLbl.TextColor3 = Color3.fromRGB(198, 198, 198)
            infoLbl.TextSize = 14
            infoLbl.TextXAlignment = Enum.TextXAlignment.Right

            -- Botão [-]
            minusBtn.Parent = numFrame
            minusBtn.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            minusBtn.BorderSizePixel = 0
            minusBtn.Position = UDim2.new(0, 7, 0, 8)
            minusBtn.Size = UDim2.new(0, 27, 0, 27)
            minusBtn.Font = Enum.Font.GothamBold
            minusBtn.Text = "−"
            minusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            minusBtn.TextSize = 18
            minusBtn.AutoButtonColor = false
            mbCorner.CornerRadius = UDim.new(0, 3)
            mbCorner.Parent = minusBtn

            -- Display / TextBox editável
            valueDisplay.Parent = numFrame
            valueDisplay.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
            valueDisplay.BorderSizePixel = 0
            valueDisplay.Position = UDim2.new(0, 38, 0, 8)
            valueDisplay.Size = UDim2.new(0, 65, 0, 27)
            valueDisplay.Font = Enum.Font.GothamSemibold
            valueDisplay.Text = tostring(value)
            valueDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
            valueDisplay.TextSize = 14
            valueDisplay.TextEditable = true
            valueDisplay.ClearTextOnFocus = false
            vdCorner.CornerRadius = UDim.new(0, 3)
            vdCorner.Parent = valueDisplay

            -- Botão [+]
            plusBtn.Parent = numFrame
            plusBtn.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
            plusBtn.BorderSizePixel = 0
            plusBtn.Position = UDim2.new(0, 107, 0, 8)
            plusBtn.Size = UDim2.new(0, 27, 0, 27)
            plusBtn.Font = Enum.Font.GothamBold
            plusBtn.Text = "+"
            plusBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            plusBtn.TextSize = 18
            plusBtn.AutoButtonColor = false
            pbCorner.CornerRadius = UDim.new(0, 3)
            pbCorner.Parent = plusBtn

            local function updateValue(v)
                value = math.clamp(v, minVal, maxVal)
                valueDisplay.Text = tostring(value)
                pcall(callback, value)
            end

            minusBtn.MouseButton1Click:Connect(function() updateValue(value - step) end)
            plusBtn.MouseButton1Click:Connect(function()  updateValue(value + step) end)

            valueDisplay.FocusLost:Connect(function()
                local n = tonumber(valueDisplay.Text)
                if n then updateValue(n)
                else valueDisplay.Text = tostring(value) end
            end)
        end

        -- ───────────────────────────────────────────────────
        --  [NOVO] ColorPicker
        -- ───────────────────────────────────────────────────
        --[[
            ElementHandler:ColorPicker(cpInfo, defaultColor, callback)
            cpInfo:       string  – label exibido
            defaultColor: Color3 – cor inicial (padrão branco)
            callback:     fn(Color3)
        ]]
        function ElementHandler:ColorPicker(cpInfo, defaultColor, callback)
            cpInfo       = cpInfo       or "Color"
            defaultColor = defaultColor or Color3.fromRGB(255, 255, 255)
            callback     = callback     or function() end

            local r = math.floor(defaultColor.R * 255)
            local g = math.floor(defaultColor.G * 255)
            local b = math.floor(defaultColor.B * 255)
            local isOpen = false
            local COLLAPSED_H = 42
            local EXPANDED_H  = 175   -- 42 header + 133 body (strip + 3 sliders + padding)
            local TRACK_W     = 300
            local mouse = game.Players.LocalPlayer:GetMouse()

            local cpFrame    = Instance.new("Frame")
            local cpCorner   = Instance.new("UICorner")
            local cpHeader   = Instance.new("Frame")
            local hdCorner   = Instance.new("UICorner")
            local cpPreview  = Instance.new("Frame")
            local pvCorner   = Instance.new("UICorner")
            local cpTitle    = Instance.new("TextLabel")
            local cpArrow    = Instance.new("ImageButton")
            local cpBody     = Instance.new("Frame")
            local colorStrip = Instance.new("Frame")
            local csCorner   = Instance.new("UICorner")

            cpFrame.Name = "cpFrame"
            cpFrame.Parent = newPage
            cpFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            cpFrame.ClipsDescendants = true
            cpFrame.Position = UDim2.new(0.011029412, 0, 0.0205760058, 0)
            cpFrame.Size = UDim2.new(0, 394, 0, COLLAPSED_H)
            cpCorner.CornerRadius = UDim.new(0, 3)
            cpCorner.Parent = cpFrame

            cpHeader.Parent = cpFrame
            cpHeader.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            cpHeader.Size = UDim2.new(1, 0, 0, 42)
            hdCorner.CornerRadius = UDim.new(0, 3)
            hdCorner.Parent = cpHeader

            -- Mini preview da cor atual
            cpPreview.Parent = cpHeader
            cpPreview.BackgroundColor3 = defaultColor
            cpPreview.Position = UDim2.new(0, 7, 0, 8)
            cpPreview.Size = UDim2.new(0, 27, 0, 27)
            pvCorner.CornerRadius = UDim.new(0, 3)
            pvCorner.Parent = cpPreview

            cpTitle.Parent = cpHeader
            cpTitle.BackgroundTransparency = 1
            cpTitle.Position = UDim2.new(0, 40, 0, 0)
            cpTitle.Size = UDim2.new(0, 260, 0, 42)
            cpTitle.Font = Enum.Font.GothamSemibold
            cpTitle.Text = cpInfo
            cpTitle.TextColor3 = Color3.fromRGB(255, 1, 43)
            cpTitle.TextSize = 14
            cpTitle.TextXAlignment = Enum.TextXAlignment.Left

            cpArrow.Parent = cpHeader
            cpArrow.BackgroundTransparency = 1
            cpArrow.Position = UDim2.new(0.89974618, 0, 0.238095239, 0)
            cpArrow.Size = UDim2.new(0, 27, 0, 21)
            cpArrow.Image = "rbxassetid://5165666242"
            cpArrow.ImageColor3 = Color3.fromRGB(181, 1, 31)

            -- Corpo expandido
            cpBody.Parent = cpFrame
            cpBody.BackgroundTransparency = 1
            cpBody.Position = UDim2.new(0, 0, 0, 42)
            cpBody.Size = UDim2.new(1, 0, 1, -42)

            -- Faixa de preview da cor atual
            colorStrip.Parent = cpBody
            colorStrip.BackgroundColor3 = defaultColor
            colorStrip.Position = UDim2.new(0.018, 0, 0, 5)
            colorStrip.Size = UDim2.new(0.964, 0, 0, 15)
            csCorner.CornerRadius = UDim.new(0, 3)
            csCorner.Parent = colorStrip

            local function applyColor()
                local c = Color3.fromRGB(r, g, b)
                cpPreview.BackgroundColor3 = c
                colorStrip.BackgroundColor3 = c
                pcall(callback, c)
            end

            -- Cria um slider de canal (R / G / B)
            local function makeChannel(label, channelIdx, yOffset, initVal)
                local rowFrame    = Instance.new("Frame")
                local labelLbl    = Instance.new("TextLabel")
                local trackBtn    = Instance.new("TextButton")
                local trCorner    = Instance.new("UICorner")
                local fillFrm     = Instance.new("Frame")
                local fillCorner  = Instance.new("UICorner")
                local valLbl      = Instance.new("TextLabel")

                rowFrame.Parent = cpBody
                rowFrame.BackgroundTransparency = 1
                rowFrame.Position = UDim2.new(0, 0, 0, yOffset)
                rowFrame.Size = UDim2.new(1, 0, 0, 30)

                labelLbl.Parent = rowFrame
                labelLbl.BackgroundTransparency = 1
                labelLbl.Position = UDim2.new(0, 7, 0, 0)
                labelLbl.Size = UDim2.new(0, 20, 1, 0)
                labelLbl.Font = Enum.Font.GothamBold
                labelLbl.Text = label
                labelLbl.TextColor3 = Color3.fromRGB(181, 1, 31)
                labelLbl.TextSize = 12

                trackBtn.Parent = rowFrame
                trackBtn.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
                trackBtn.BorderSizePixel = 0
                trackBtn.Position = UDim2.new(0, 30, 0.5, -4)
                trackBtn.Size = UDim2.new(0, TRACK_W, 0, 8)
                trackBtn.Text = ""
                trackBtn.AutoButtonColor = false
                trCorner.CornerRadius = UDim.new(0, 4)
                trCorner.Parent = trackBtn

                fillFrm.Parent = trackBtn
                fillFrm.BackgroundColor3 = Color3.fromRGB(181, 1, 31)
                fillFrm.BorderSizePixel = 0
                fillFrm.Size = UDim2.new(0, math.floor((initVal / 255) * TRACK_W), 0, 8)
                fillCorner.CornerRadius = UDim.new(0, 4)
                fillCorner.Parent = fillFrm

                valLbl.Parent = rowFrame
                valLbl.BackgroundTransparency = 1
                valLbl.Position = UDim2.new(0, 334, 0, 0)
                valLbl.Size = UDim2.new(0, 40, 1, 0)
                valLbl.Font = Enum.Font.GothamSemibold
                valLbl.Text = tostring(initVal)
                valLbl.TextColor3 = Color3.fromRGB(199, 0, 33)
                valLbl.TextSize = 12

                trackBtn.MouseButton1Down:Connect(function()
                    local function apply()
                        local relX = math.clamp(mouse.X - trackBtn.AbsolutePosition.X, 0, TRACK_W)
                        fillFrm.Size = UDim2.new(0, relX, 0, 8)
                        local val = math.floor((relX / TRACK_W) * 255)
                        valLbl.Text = tostring(val)
                        if channelIdx == 1 then r = val
                        elseif channelIdx == 2 then g = val
                        else b = val end
                        applyColor()
                    end
                    apply()
                    local moveConn, upConn
                    moveConn = mouse.Move:Connect(apply)
                    upConn = UserInputService.InputEnded:Connect(function(inp)
                        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
                            moveConn:Disconnect()
                            upConn:Disconnect()
                        end
                    end)
                end)
            end

            makeChannel("R", 1, 25, r)
            makeChannel("G", 2, 59, g)
            makeChannel("B", 3, 93, b)

            cpArrow.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    cpFrame:TweenSize(UDim2.new(0, 394, 0, EXPANDED_H), "In", "Quint", 0.10)
                    TweenService:Create(cpArrow, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Rotation = 180 }):Play()
                else
                    cpFrame:TweenSize(UDim2.new(0, 394, 0, COLLAPSED_H), "In", "Quint", 0.10)
                    TweenService:Create(cpArrow, TweenInfo.new(0.10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Rotation = 0 }):Play()
                end
                task.wait(0.10)
                UpdateSize()
            end)
        end

        return ElementHandler
    end

    return SectionHandler
end

return Orion
