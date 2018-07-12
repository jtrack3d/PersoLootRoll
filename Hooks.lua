local Name, Addon = ...
local L = LibStub("AceLocale-3.0"):GetLocale(Name)
local Comm, GUI, Masterloot, Roll, Trade, Unit, Util = Addon.Comm, Addon.GUI, Addon.Masterloot, Addon.Roll, Addon.Trade, Addon.Unit, Addon.Util
local Self = Addon.Hooks

-------------------------------------------------------
--                   GroupLootRoll                   --
-------------------------------------------------------

function Self.EnableGroupLootRoll()
    -- GetLootRollTimeLeft
    if not Addon:IsHooked("GetLootRollTimeLeft") then
        Addon:RawHook("GetLootRollTimeLeft", function (id)
            if Roll.IsPlrId(id) then
                return Roll.Get(id):GetTimeLeft()
            else
                return Addon.hooks.GetLootRollTimeLeft(id)
            end
        end, true)
    end

    -- GetLootRollItemInfo
    if not Addon:IsHooked("GetLootRollItemInfo") then
        Addon:RawHook("GetLootRollItemInfo", function (id)
            if Roll.IsPlrId(id) then
                local roll = Roll.Get(id)
                local item = roll.item

                return item.texture, item.name, 1, item.quality, item.bindType == LE_ITEM_BIND_ON_ACQUIRE,
                    true, -- Can need
                    roll.ownerId or roll.itemOwnerId, -- Can greed
                    false, -- Can disenchant
                    5, -- Reason need
                    "PLR_NO_ADDON", -- Reason greed
                    "PLR_NO_DISENCHANT", -- Reason disenchant
                    nil -- Disenchant skill required
                    -- TODO
            else
                return Addon.hooks.GetLootRollItemInfo(id)
            end
        end, true)
    end

    -- GetLootRollItemLink
    if not Addon:IsHooked("GetLootRollItemLink") then
        Addon:RawHook("GetLootRollItemLink", function (id)
            if Roll.IsPlrId(id) then
                return Roll.Get(id).item.link
            else
                return Addon.hooks.GetLootRollItemLink(id)
            end
        end, true)
    end

    -- RollOnLoot
    if not Addon:IsHooked("RollOnLoot") then
        Addon:RawHook("RollOnLoot", function (id, bid)
            if Roll.IsPlrId(id) then
                local roll = Roll.Get(id)

                if roll.status == Roll.STATUS_RUNNING then
                    roll:Bid(bid == 0 and Roll.BID_PASS or bid)
                else
                    roll:HideRollFrame()
                end
            else
                return Addon.hooks.RollOnLoot(id, bid)
            end
        end, true)
    end

    -- GroupLootFrame
    local onShow = function (self)
        if Roll.IsPlrId(self.rollID) then
            local roll = Roll.Get(self.rollID)
            local owner = roll.item.owner
            local color = Unit.Color(owner)

            -- Player name
            self.Name:SetMaxLines(1)
            self.Name:SetHeight(15)

            if not self.Player then
                local f = self:CreateFontString(nil, "ARTWORK", "GameFontNormal")
                f:SetSize(125, 15)
                f:SetPoint("TOPLEFT", self.Name, "BOTTOMLEFT")
                f:SetJustifyH("LEFT")
                f:SetJustifyV("MIDDLE")
                f:SetMaxLines(1)
                self.Player = f
            end
            
            self.Player:SetText(owner)
            self.Player:SetTextColor(color.r, color.g, color.b)
            self.Player:Show()

            -- Highlight
            if not self.Highlight then
                local f = self:CreateTexture(nil, "BACKGROUND")
                f:SetTexture("Interface\\LootFrame\\LootToast")
                f:SetTexCoord(0, 0.2813, 0, 0.4375)
                f:SetPoint("TOPLEFT", -24, 23)
                f:SetPoint("BOTTOMRIGHT", 20, -23)
                f:SetBlendMode("ADD")
                f:SetAlpha(0.7)
                f:Hide()
                self.Highlight = f
            end
            if roll.item.isOwner then
                self.Highlight:Show()
            end
        end
    end

    local onHide = function (self)
        if Roll.IsPlrId(self.rollID) then
            self.Name:SetMaxLines(0)
            self.Name:SetHeight(30)
            self.Player:Hide()
            self.Highlight:Hide()
        end
    end

    local onButtonClick = function (self, button)
        if button == "RightButton" then
            local rollId, bid = self:GetParent().rollID, self:GetID()
            local roll = Roll.IsPlrId(rollId) and Roll.Get(rollId)
            if roll and roll.owner == Masterloot.GetMasterlooter() then
                local answers = Masterloot.session["answers" .. bid]
                if answers and #answers > 0 then
                    GUI.ToggleAnswersDropdown(roll, bid, answers, "TOPLEFT", self, "CENTER")
                end
            end
        else
            Addon.hooks[self].OnClick(self, button)
        end
    end

    for i=1, NUM_GROUP_LOOT_FRAMES do
        local frame = _G["GroupLootFrame" .. i]

        -- OnShow
        if not Addon:IsHooked(frame, "OnShow") then
            Addon:HookScript(frame, "OnShow", onShow)
        end

        -- OnHide
        if not Addon:IsHooked(frame, "OnHide") then
            Addon:HookScript(frame, "OnHide", onHide)
        end

        -- OnClick
        if not Addon:IsHooked(frame.NeedButton, "OnClick") then
            Addon:RawHookScript(frame.NeedButton, "OnClick", onButtonClick)
            frame.NeedButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
            Addon:RawHookScript(frame.GreedButton, "OnClick", onButtonClick)
            frame.GreedButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
        end
    end

    --GroupLootContainer:RemoveFrame
    if not Addon:IsHooked("GroupLootContainer_RemoveFrame") then
        Addon:SecureHook("GroupLootContainer_RemoveFrame", function (self, frame)
            -- Find a running roll that hasn't been shown yet
            local roll = Util.TblFirstWhere(Addon.rolls, "shown", false, "status", Roll.STATUS_RUNNING)
            if roll then
                roll:ShowRollFrame()
            end
        end)
    end

    -- GameTooltip:SetLootRollItem
    if not Addon:IsHooked(GameTooltip, "SetLootRollItem") then
        Addon:RawHook(GameTooltip, "SetLootRollItem", function (self, id)
            --Util.dump(id)
            if Roll.IsPlrId(id) then
                self:SetHyperlink(Roll.Get(id).item.link)
            else
                return Addon.hooks[self].SetLootRollItem(id)
            end
        end, true)
    end
end

function Self.DisableGroupLootRoll()
    Addon:Unhook("GetLootRollTimeLeft")
    Addon:Unhook("GetLootRollItemInfo")
    Addon:Unhook("GetLootRollItemLink")
    Addon:Unhook("RollOnLoot")
    for i=1, NUM_GROUP_LOOT_FRAMES do
        Addon:Unhook(_G["GroupLootFrame" .. i], "OnShow")
        Addon:Unhook(_G["GroupLootFrame" .. i], "OnHide")
        Addon:Unhook(_G["GroupLootFrame" .. i], "OnClick")
    end
    Addon:Unhook("GroupLootContainer_RemoveFrame")
    Addon:Unhook(GameTooltip, "SetLootRollItem")
end

-------------------------------------------------------
--                    Chat links                     --
-------------------------------------------------------

function Self.EnableChatLinks()

    -- CLICK

    if not Addon:IsHooked("SetItemRef") then
        Addon:RawHook("SetItemRef", function (link, text, button, frame)
            local linkType, args = link:match("^([^:]+):(.*)$")

            if linkType == "plrtrade" then
                Trade.Initiate(args)
            elseif linkType == "plrbid" then
                local id, unit, bid = args:match("(%d+):([^:]+):(%d)")
                local roll = id and Roll.Get(tonumber(id))
                if roll and unit and bid and roll:CanBeAwardedTo(unit) then
                    roll:Bid(tonumber(bid), unit)
                end
            else
                return Addon.hooks.SetItemRef(link, text, button, frame)
            end
        end, true)
    end

    -- HOVER

    local onHyperlinkEnter = function (self, link)
        local linkType, args = link:match("^([^:]+):(.*)$")
        if linkType == "plrtooltip" then
            local title, text = string.split(":", args)
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
            GameTooltip:ClearLines()
            if not Util.StrIsEmpty(title) then
                GameTooltip:AddLine(title:gsub("@colon@", ":"), 1, .82, 0)
            end
            GameTooltip:AddLine(text:gsub("@colon@", ":"), 1, 1, 1, true)
            GameTooltip:Show()
        end
    end
    local onHyperlinkLeave = function () GameTooltip:Hide() end

    for i=1,NUM_CHAT_WINDOWS do
        local frame = _G["ChatFrame" .. i]
        if frame and not Addon:IsHooked(frame, "OnHyperlinkEnter") then
            Addon:SecureHookScript(frame, "OnHyperlinkEnter", onHyperlinkEnter)
            Addon:SecureHookScript(frame, "OnHyperlinkLeave", onHyperlinkLeave)
        end
    end
end

function Self.DisableChatLinks()
    Addon:Unhook("SetItemRef")
end

-------------------------------------------------------
--                    Unit menus                     --
-------------------------------------------------------

function Self.EnableUnitMenus()
    local menus = {"SELF", "PLAYER", "FRIEND", "PARTY", "RAID_PLAYER", "RAID"}

    local button = GUI(CreateFrame("Button", "PLR_AwardLootButton", UIParent, "UIDropDownMenuButtonTemplate"))
        .SetText(L["AWARD_LOOT"])
        .SetScript("OnClick", function (self)
            local s, x, y = UIParent:GetEffectiveScale(), GetCursorPosition()
            GUI.ToggleAwardUnitDropdown(self.unit, "TOPLEFT", UIParent, "BOTTOMLEFT", x / s, y / s)
        end)
        .Hide()()
    
    PLR_AwardLootButtonNormalText:SetPoint("LEFT")

    if not Addon:IsHooked("UnitPopup_ShowMenu") then
        Addon:SecureHook("UnitPopup_ShowMenu", function (dropdown, menu, unit)
            unit = unit or dropdown.unit or dropdown.chatTarget

            if UIDROPDOWNMENU_MENU_LEVEL == 1 then
                button:Hide()

                if Util.In(menu, menus) and Util.TblFirst(Addon.rolls, "CanBeAwardedTo", true, false, unit, true) then
                    local parent = _G["DropDownList1"]
                    local placed = false
                    
                    for i=1,UIDROPDOWNMENU_MAXBUTTONS do
                        local f = _G["DropDownList1Button" .. i]

                        if placed then
                            local x, y = select(4, f:GetPoint(1))
                            f:SetPoint("TOPLEFT", x, y - UIDROPDOWNMENU_BUTTON_HEIGHT)
                        elseif Util.In(f.value, "LOOT_SUBSECTION_TITLE", "INTERACT_SUBSECTION_TITLE") then
                            local x, y = select(4, f:GetPoint(1))
                            GUI(button).SetParent(parent).ClearAllPoints()
                                .SetPoint("TOPLEFT", x, y - UIDROPDOWNMENU_BUTTON_HEIGHT)
                                .SetWidth(parent.maxWidth)
                                .Show()
                            button.unit = unit
                            placed = true
                        end
                    end

                    parent:SetHeight(parent:GetHeight() + UIDROPDOWNMENU_BUTTON_HEIGHT)
                end
            end
        end)
    end
end

function Self.DisableUnitMenus()
    Addon:Unhook("UnitPopup_ShowMenu")
end