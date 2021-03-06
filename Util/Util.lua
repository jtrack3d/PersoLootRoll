---@type Addon
local Addon = select(2, ...)
local Unit = Addon.Unit
---@class Util
local Self = Addon.Util
setmetatable(Self, LibStub:GetLibrary("LibUtil"))

---@type Counter
Self.Counter = {}
---@type Registrar
Self.Registrar = {}

-------------------------------------------------------
--                        WoW                        --
-------------------------------------------------------

-- More than this much percent of players in the group must be from
-- one guild/community for it to be considered a guild/community group
Self.GROUP_THRESHOLD = 0.50

-- Interaction distances
Self.INTERACT_INSPECT = 1 -- 28 yards
Self.INTERACT_TRADE = 2   -- 11.11 yards
Self.INTERACT_DUEL = 3    -- 9.9 yards
Self.INTERACT_FOLLOW = 4  -- 28 yards

-- Expansions
Self.EXP_CLASSIC = 1
Self.EXP_BC = 2
Self.EXP_WOTLK = 3
Self.EXP_CATA = 4
Self.EXP_MOP = 5
Self.EXP_WOD = 6
Self.EXP_LEGION = 7
Self.EXP_BFA = 8
Self.EXP_SL = 9

-- Check if the current group is a guild group
---@return string|boolean
function Self.IsGuildGroup(guild)
    if not IsInGroup() or guild == "" then
        return false
    end

    local n, guilds = GetNumGroupMembers(), Self.Tbl()

    for i=1,n do
        local g = Unit.GuildName(GetRaidRosterInfo(i))
        if g then
            guilds[g] = (guilds[g] or 0) + 1
            if (not guild or g == guild) and guilds[g] / n > Self.GROUP_THRESHOLD then
                Self.Tbl.Release(guilds)
                return g
            end
        end
    end
    Self.Tbl.Release(guilds)
end

-- Check if the current group is a community group
---@param commId integer
---@return integer|boolean
function Self.IsCommunityGroup(commId)
    if not IsInGroup() or not Self.Tbl.FirstWhere(C_Club.GetSubscribedClubs(), "clubType", Enum.ClubType.Character, "clubId", commId) then
        return false
    end

    local n, comms = GetNumGroupMembers(), Self.Tbl()
    for i=1,n do
        local c = Unit.CommonClubs(GetRaidRosterInfo(i))
        if c then
            for _,clubId in pairs(c) do
                comms[clubId] = (comms[clubId] or 0) + 1
                if (not commId or commId == clubId) and comms[clubId] / n >= Self.GROUP_THRESHOLD then
                    Self.Tbl.Release(comms, c)
                    return clubId
                end
            end
            Self.Tbl.Release(c)
        end
    end
    Self.Tbl.Release(comms)
end

-- Get a list of guild ranks
---@return table<integer,string>
function Self.GetGuildRanks()
    local t, i, name = Self.Tbl(), 1, GuildControlGetRankName(1)
    while not Self.Str.IsEmpty(name) do
        t[i] = name
        i, name = i + 1, GuildControlGetRankName(i + 1)
    end
    return t
end

-- Get a list of club ranks
---@return table<integer,string>
function Self.GetClubRanks(clubId)
    if not clubId then return end

    local info = C_Club.GetClubInfo(clubId)
    if not info then
        return
    elseif info.clubType == Enum.ClubType.Guild then
        return Self.GetGuildRanks()
    else
        return Self.Tbl.Flip(Enum.ClubRoleIdentifier)
    end
end

-- Get the expansion for the current instance
function Self.GetInstanceExp()
    if IsInInstance() then
        local mapID = C_Map.GetBestMapForUnit("player")
        return mapID and Self.INSTANCES[EJ_GetInstanceForMap(mapID)] or nil
    end
end

-- Check if the legacy loot mode is active
function Self.IsLegacyLoot()
    local iExp = Self.GetInstanceExp()
    return GetLootMethod() == "personalloot"
        and iExp and iExp < Unit.Expansion("player") - (iExp == Self.EXP_LEGION and 0 or 1)
end

-- Check if the current session is a transmog run
function Self.IsTransmogRun()
    local iExp = Self.GetInstanceExp()
    return iExp and GetLootMethod() == "personalloot" and iExp < Unit.Expansion("player")
end

-- Check if currently in a timewalking dungeon
function Self.IsTimewalking()
    return Self.In(select(3, GetInstanceInfo()), 24, 33)
end

-- Get the usual # of dropped items in the current instance and group setting
function Self.GetNumDroppedItems()
    local difficulty, _, maxPlayers = select(3, GetInstanceInfo())

    if difficulty == DIFFICULTY_DUNGEON_CHALLENGE then
        -- In M+ we get 2 items at the end of the dungeon, +1 if in time, +0.4 per keystone level above 15
        local _, level, _, onTime = C_ChallengeMode.GetCompletionInfo();
        return 2 + (onTime and 1 or 0) + (level > 15 and math.ceil(0.4 * (level - 15)) or 0)
    else
        -- Normally we get about 1 item per 5 players in the group
        local players = GetNumGroupMembers()
        if difficulty == DIFFICULTY_PRIMARYRAID_MYTHIC then
            players = 20
        elseif Self.IsLegacyLoot() then
            players = Self.In(difficulty, DIFFICULTY_RAID_LFR, DIFFICULTY_PRIMARYRAID_LFR, DIFFICULTY_PRIMARYRAID_NORMAL, DIFFICULTY_PRIMARYRAID_HEROIC) and max(players, 20) or maxPlayers
        end
        return math.ceil(players / 5)
    end
end

-- Get hidden tooltip for scanning
function Self.GetHiddenTooltip()
    if not Self.hiddenTooltip then
        Self.hiddenTooltip = CreateFrame("GameTooltip", Addon.ABBR .. "_HiddenTooltip", nil, "GameTooltipTemplate")
        Self.hiddenTooltip:SetOwner(UIParent, "ANCHOR_NONE")
    end

    return Self.hiddenTooltip
end

-- Fill a tooltip and scan it line by line
---@param linkOrBag string | integer
function Self.ScanTooltip(fn, linkOrBag, slot, ...)
    local tooltip = Self.GetHiddenTooltip()
    tooltip:ClearLines()

    if not slot then
        tooltip:SetHyperlink(linkOrBag)
    else
        tooltip:SetBagItem(linkOrBag, slot)
    end

    local lines = tooltip:NumLines()
    for i=2, lines do
        local line = _G[Addon.ABBR .."_HiddenTooltipTextLeft" .. i]:GetText()
        if line then
            local a, b, c = fn(i, line, lines, ...)
            if a ~= nil then
                return a, b, c
            end
        end
    end
end

-- Get the correct bag position, if it exists (e.g. 1, 31 -> 2, 1)
---@return integer
---@return integer
function Self.GetBagPosition(bag, slot)
    local numSlots = GetContainerNumSlots(bag)
    if bag < 0 or bag > NUM_BAG_SLOTS or not numSlots or numSlots == 0 then
        return nil, nil
    elseif slot > numSlots then
        return Self.GetBagPosition(bag + 1, slot - numSlots)
    else
        return bag, slot
    end
end
