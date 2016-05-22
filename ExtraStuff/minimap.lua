----------------
-- INIT VARS
----------------

    -- Addon namespace
    local name, ns = ...

    -- Hide a bunch of unneeded things.
    MinimapBorder:Hide()
    MinimapBorderTop:Hide()
    MiniMapWorldMapButton:Hide()
    MiniMapVoiceChatFrame:Hide()
    MinimapZoomIn:Hide()
    MinimapZoomOut:Hide()
    MiniMapTracking:Hide()

    -- Get rid of the frame behind the clock and keep only the time.
    -- Does handling the clock have to be this complicated?
    if not IsAddOnLoaded("Blizzard_TimeManager") then
        LoadAddOn("Blizzard_TimeManager")
    end

    local ClockFrame, ClockTime = TimeManagerClockButton:GetRegions()
    ClockFrame:Hide()
    ClockTime:Show()

    -- Give local shorthand names to different buttons
    local Calendar = GameTimeFrame
    local GarrisonButton = GarrisonLandingPageMinimapButton
    local Mail = MiniMapMailFrame
    local LFG = QueueStatusMinimapButton
    local InstanceDifficulty = MiniMapInstanceDifficulty

    -- Calculate minimap button positions
    local function MinimapRadius(degree,offset)
        local radius = (Minimap:GetWidth()/2)+offset
        local radian = math.rad(degree)
        local posX = radius * math.sin(radian)
        local posY = radius * math.cos(radian)

        return posX, posY
    end

----------------
-- MAIN FRAME POSITIONING
----------------

    ns.MinimapFrame = CreateFrame("Frame",name.."MinimapFrame",UIParent)
    ns.MinimapFrame:SetPoint("TOPRIGHT",UIParent,"TOPRIGHT")
    ns.MinimapFrame:SetSize(240,240)
    ns.MinimapFrame:SetFrameStrata("LOW")
    ns.MinimapFrame:SetFrameLevel(3)

    -- Resize the cluster anchor. Seems all the things that appear below
    -- the minimap anchor right to the bottom of this thing.
    MinimapCluster:SetSize(250,280)
    MinimapCluster:SetFrameLevel(1)

    -- Move and restyle the minimap itself
    -- The art frame is actually a child of the MinimapFrame, but it's anchored to the minimap
    Minimap:ClearAllPoints()
    Minimap:SetPoint("TOPRIGHT", ns.MinimapFrame, "TOPRIGHT", -15, -32)
    Minimap:SetParent(ns.MinimapFrame)
    Minimap:SetFrameLevel(2)
    Minimap:SetMaskTexture('Textures\\MinimapMask')
    Minimap:SetSize(202,202)
        local MinimapArt = ns.MinimapFrame:CreateTexture(nil,"ARTWORK")
        MinimapArt:SetPoint("CENTER",Minimap,"CENTER",0,15)
        MinimapArt:SetSize(255,255)
        MinimapArt:SetTexture("Interface\\AddOns\\Stuff\\Textures\\Minimap\\minimap")
        --MinimapArt:SetAlpha(0.6)


----------------
-- MINIMAP WIDGETS
----------------

    -- Holder variables for button positions
    local posX, posY

    -- Zone text at the top of the minimap
    MinimapZoneText:SetParent(ns.MinimapFrame)
    MinimapZoneText:SetSize(155,11)
    MinimapZoneText:SetPoint("CENTER", Minimap, "TOP", 0, 5)
    MinimapZoneText:SetDrawLayer("OVERLAY")
    MinimapZoneText:SetFont("Fonts\\FRIZQT__.ttf", 11, "THINOUTLINE")

    -- Clock at the bottom inside of the minimap
	ClockTime:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, 10)
	ClockTime:SetFont("Fonts\\FRIZQT__.ttf", 12, "THINOUTLINE")

    -- Calendar button
    Calendar:ClearAllPoints()
    posX, posY = MinimapRadius(45,7)
    Calendar:SetPoint("CENTER",Minimap,"CENTER", posX, posY)

    -- Instance Difficulty flag
    InstanceDifficulty:ClearAllPoints()
    posX,posY = MinimapRadius(90,-5)
    InstanceDifficulty:SetPoint("CENTER",Minimap,"CENTER", posX, posY)

    -- Mail button
    Mail:ClearAllPoints()
    posX, posY = MinimapRadius(118,7)
    Mail:SetPoint("CENTER",Minimap,"CENTER", posX, posY)

    -- LFG button
    LFG:ClearAllPoints()
    posX, posY = MinimapRadius(220,6)
    LFG:SetPoint("CENTER",Minimap,"CENTER", posX, posY)

    -- Garrison button
    GarrisonButton:ClearAllPoints()
    posX, posY = MinimapRadius(140,8)
    GarrisonButton:SetPoint("CENTER",Minimap,"CENTER",posX,posY)
    GarrisonButton:SetSize(50,50)


----------------
-- UTILITY FUNCTIONS
----------------

    -- Mousewheel Scrolling.
    Minimap:EnableMouseWheel(true)
    Minimap:SetScript("OnMouseWheel", function(self, direction)
        if direction > 0 then
            _G.MinimapZoomIn:Click()
        elseif direction < 0 then
            _G.MinimapZoomOut:Click()
        end
    end)

    -- Click-handling for tracking dropdown
    Minimap:SetScript("OnMouseUp", function(self, button)
        if (button == "RightButton") then
            ToggleDropDownMenu(1,nil,MiniMapTrackingDropDown,"cursor")
        elseif (button == "LeftButton") then
            Minimap_OnClick(self)
        end
    end)

    -- The cluster has a bad way of incrementally rising to really high frame levels
    -- Kind of a dirty reset for it every time it is moused.
    MinimapCluster:SetScript("OnEnter", function(self)
        self:SetFrameLevel(1)
    end)