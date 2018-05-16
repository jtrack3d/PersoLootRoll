local Addon = LibStub("AceAddon-3.0"):GetAddon(PLR_NAME)
local Self = {}

Self.US = {
    ["Aegwynn"] = "enUS",
    ["AeriePeak"] = "enUS",
    ["Agamaggan"] = "enUS",
    ["Aggramar"] = "enUS",
    ["Akama"] = "enUS",
    ["Alexstrasza"] = "enUS",
    ["Alleria"] = "enUS",
    ["AltarofStorms"] = "enUS",
    ["AlteracMountains"] = "enUS",
    ["Aman'Thul"] = "enAU",
    ["Andorhal"] = "enUS",
    ["Anetheron"] = "enUS",
    ["Antonidas"] = "enUS",
    ["Anub'arak"] = "enUS",
    ["Anvilmar"] = "enUS",
    ["Arathor"] = "enUS",
    ["Archimonde"] = "enUS",
    ["Area52"] = "enUS",
    ["ArgentDawn"] = "enUS",
    ["Arthas"] = "enUS",
    ["Arygos"] = "enUS",
    ["Auchindoun"] = "enUS",
    ["AzjolNerub"] = "enUS",
    ["Azralon"] = "ptBR",
    ["Azshara"] = "enUS",
    ["Azuremyst"] = "enUS",
    ["Balnazzar"] = "enUS",
    ["Barthilas"] = "enAU",
    ["BlackDragonflight"] = "enUS",
    ["Blackhand"] = "enUS",
    ["BlackwaterRaiders"] = "enUS",
    ["BlackwingLair"] = "enUS",
    ["Blackrock"] = "enUS",
    ["Blade'sEdge"] = "enUS",
    ["Bladefist"] = "enUS",
    ["BleedingHollow"] = "enUS",
    ["BloodFurnace"] = "enUS",
    ["Bloodhoof"] = "enUS",
    ["Bloodscalp"] = "enUS",
    ["Bonechewer"] = "enUS",
    ["Boulderfist"] = "enUS",
    ["Bronzebeard"] = "enUS",
    ["BurningBlade"] = "enUS",
    ["BurningLegion"] = "enUS",
    ["Caelestrasz"] = "enAU",
    ["Cairne"] = "enUS",
    ["CenarionCircle"] = "enUS",
    ["Cenarius"] = "enUS",
    ["Cho’gall"] = "enUS",
    ["Chromaggus"] = "enUS",
    ["Coilfang"] = "enUS",
    ["Crushridge"] = "enUS",
    ["Daggerspine"] = "enUS",
    ["Dalaran"] = "enUS",
    ["Dalvengyr"] = "enUS",
    ["DarkIron"] = "enUS",
    ["Darkspear"] = "enUS",
    ["Darrowmere"] = "enUS",
    ["Dath'Remar"] = "enAU",
    ["Deathwing"] = "enUS",
    ["DemonSoul"] = "enUS",
    ["Dentarg"] = "enUS",
    ["Destromath"] = "enUS",
    ["Dethecus"] = "enUS",
    ["Detheroc"] = "enUS",
    ["Doomhammer"] = "enUS",
    ["Draenor"] = "enUS",
    ["Dragonblight"] = "enUS",
    ["Dragonmaw"] = "enUS",
    ["Drak'Tharon"] = "enUS",
    ["Drak'thul"] = "enUS",
    ["Draka"] = "enUS",
    ["Drakkari"] = "enUS",
    ["Dreadmaul"] = "enAU",
    ["Durotan"] = "enUS",
    ["EarthenRing"] = "enUS",
    ["EchoIsles"] = "enUS",
    ["Eitrigg"] = "enUS",
    ["Eldre’Thalas"] = "enUS",
    ["Elune"] = "enUS",
    ["EmeraldDream"] = "enUS",
    ["Eonar"] = "enUS",
    ["Eredar"] = "enUS",
    ["Executus"] = "enUS",
    ["Exodar"] = "enUS",
    ["Farstriders"] = "enUS",
    ["Feathermoon"] = "enUS",
    ["Fenris"] = "enUS",
    ["Firetree"] = "enUS",
    ["Fizzcrank"] = "enUS",
    ["Frostmane"] = "enUS",
    ["Frostmourne"] = "enAU",
    ["Frostwolf"] = "enUS",
    ["Galakrond"] = "enUS",
    ["Gallywix"] = "ptBR",
    ["Garithos"] = "enUS",
    ["Garrosh"] = "enUS",
    ["Ghostlands"] = "enUS",
    ["Gilneas"] = "enUS",
    ["Gnomeregan"] = "enUS",
    ["Goldrinn"] = "ptBR",
    ["Gorefiend"] = "enUS",
    ["Gorgonnash"] = "enUS",
    ["Greymane"] = "enUS",
    ["GrizzlyHills"] = "enUS",
    ["Gul'dan"] = "enUS",
    ["Gundrak"] = "enAU",
    ["Gurubashi"] = "enUS",
    ["Hakkar"] = "enUS",
    ["Haomarush"] = "enUS",
    ["Hellscream"] = "enUS",
    ["Hydraxis"] = "enUS",
    ["Hyjal"] = "enUS",
    ["Illidan"] = "enUS",
    ["Jaedenar"] = "enUS",
    ["Jubei'Thos"] = "enAU",
    ["Kael’thas"] = "enUS",
    ["Kalecgos"] = "enUS",
    ["Kargath"] = "enUS",
    ["Kel'Thuzad"] = "enUS",
    ["Khadgar"] = "enUS",
    ["KhazModan"] = "enUS",
    ["Khaz'goroth"] = "enAU",
    ["Kil'jaeden"] = "enUS",
    ["Kilrogg"] = "enUS",
    ["KirinTor"] = "enUS",
    ["Korgath"] = "enUS",
    ["Korialstrasz"] = "enUS",
    ["KulTiras"] = "enUS",
    ["LaughingSkull"] = "enUS",
    ["Lethon"] = "enUS",
    ["Lightbringer"] = "enUS",
    ["Lightning'sBlade"] = "enUS",
    ["Lightninghoof"] = "enUS",
    ["Llane"] = "enUS",
    ["Lothar"] = "enUS",
    ["Madoran"] = "enUS",
    ["Magtheridon"] = "enUS",
    ["Maiev"] = "enUS",
    ["Mal'Ganis"] = "enUS",
    ["Malfurion"] = "enUS",
    ["Malorne"] = "enUS",
    ["Malygos"] = "enUS",
    ["Mannoroth"] = "enUS",
    ["Malygos"] = "enUS",
    ["Mannoroth"] = "enUS",
    ["Medivh"] = "enUS",
    ["Misha"] = "enUS",
    ["Mok'Nathal"] = "enUS",
    ["MoonGuard"] = "enUS",
    ["Moonrunner"] = "enUS",
    ["Mug'thol"] = "enUS",
    ["Muradin"] = "enUS",
    ["Nagrand"] = "enAU",
    ["Nathrezim"] = "enUS",
    ["Nazgrel"] = "enUS",
    ["Nazjatar"] = "enUS",
    ["Nemesis"] = "ptBR",
    ["Ner'zhul"] = "enUS",
    ["Nesingwary"] = "enUS",
    ["Nordrassil"] = "enUS",
    ["Norgannon"] = "enUS",
    ["Onyxia"] = "enUS",
    ["Perenolde"] = "enUS",
    ["Proudmoore"] = "enUS",
    ["Quel'Thalas"] = "ptBR",
    ["Ragnaros"] = "ptBR",
    ["Ravencrest"] = "enUS",
    ["Ravenholdt"] = "enUS",
    ["Rexxar"] = "enUS",
    ["Rivendare"] = "enUS",
    ["Runetotem"] = "enUS",
    ["Sargeras"] = "enUS",
    ["Saurfang"] = "enAU",
    ["ScarletCrusade"] = "enUS",
    ["Scilla"] = "enUS",
    ["Sen'jin"] = "enUS",
    ["Sentinels"] = "enUS",
    ["ShadowCouncil"] = "enUS",
    ["Shadowmoon"] = "enUS",
    ["Shadowsong"] = "enUS",
    ["Shandris"] = "enUS",
    ["ShatteredHalls"] = "enUS",
    ["ShatteredHand"] = "enUS",
    ["Shu'halo"] = "enUS",
    ["SilverHand"] = "enUS",
    ["Silvermoon"] = "enUS",
    ["SistersofElune"] = "enUS",
    ["Skullcrusher"] = "enUS",
    ["Skywall"] = "enUS",
    ["Smolderthorn"] = "enUS",
    ["Spinebreaker"] = "enUS",
    ["Spirestone"] = "enUS",
    ["Staghelm"] = "enUS",
    ["SteamwheedleCartel"] = "enUS",
    ["Stormrage"] = "enUS",
    ["Stormreaver"] = "enUS",
    ["Stormscale"] = "enUS",
    ["Suramar"] = "enUS",
    ["Tanaris"] = "enUS",
    ["Terenas"] = "enUS",
    ["Terokkar"] = "enUS",
    ["TarrenMill"] = "enUS",
    ["Teldrassil"] = "enUS",
    ["Templenoir"] = "enUS",
    ["Terenas"] = "enUS",
    ["Terokkar"] = "enUS",
    ["Thaurissan"] = "enAU",
    ["TheForgottenCoast"] = "enUS",
    ["TheScryers"] = "enUS",
    ["TheUnderbog"] = "enUS",
    ["TheVentureCo"] = "enUS",
    ["ThoriumBrotherhood"] = "enUS",
    ["Thrall"] = "enUS",
    ["Thunderhorn"] = "enUS",
    ["Thunderlord"] = "enUS",
    ["Tichondrius"] = "enUS",
    ["TolBarad"] = "ptBR",
    ["Tortheldrin"] = "enUS",
    ["Trollbane"] = "enUS",
    ["Turalyon"] = "enUS",
    ["TwistingNether"] = "enUS",
    ["Uldaman"] = "enUS",
    ["Uldum"] = "enUS",
    ["Undermine"] = "enUS",
    ["Ursin"] = "enUS",
    ["Uther"] = "enUS",
    ["Vashj"] = "enUS",
    ["Vek'nilash"] = "enUS",
    ["Velen"] = "enUS",
    ["Warsong"] = "enUS",
    ["Whisperwind"] = "enUS",
    ["Wildhammer"] = "enUS",
    ["Windrunner"] = "enUS",
    ["Winterhoof"] = "enUS",
    ["WyrmrestAccord"] = "enUS",
    ["Xavius"] = "enUS",
    ["Ysera"] = "enUS",
    ["Ysondre"] = "enUS",
    ["Zangarmarsh"] = "enUS",
    ["Zul'jin"] = "enUS",
    ["Zuluhed"] = "enUS",
}

Self.EU = {
    ["Aegwynn"] = "deDE",
    ["AeriePeak"] = "enGB",
    ["Agamaggan"] = "enGB",
    ["Aggra(Português)"] = "ptPT",
    ["Aggramar"] = "enGB",
    ["Ahn'Qiraj"] = "enGB",
    ["Al'Akir"] = "enGB",
    ["Alexstrasza"] = "deDE",
    ["Alleria"] = "deDE",
    ["Alonsus"] = "enGB",
    ["Aman'Thul"] = "deDE",
    ["Ambossar"] = "deDE",
    ["Anachronos"] = "enGB",
    ["Anetheron"] = "deDE",
    ["Antonidas"] = "deDE",
    ["Anub'arak"] = "deDE",
    ["Arakarahm"] = "frFR",
    ["Arathi"] = "frFR",
    ["Arathor"] = "enGB",
    ["Archimonde"] = "frFR",
    ["Area52"] = "deDE",
    ["ArenaPass"] = "enGB",
    ["ArenaPass1"] = "enGB",
    ["ArgentDawn"] = "enGB",
    ["Arthas"] = "deDE",
    ["Arygos"] = "deDE",
    ["Aszune"] = "enGB",
    ["Auchindoun"] = "enGB",
    ["AzjolNerub"] = "enGB",
    ["Azshara"] = "deDE",
    ["Azuremyst"] = "enGB",
    ["Baelgun"] = "deDE",
    ["Balnazzar"] = "enGB",
    ["Blackhand"] = "deDE",
    ["Blackmoore"] = "deDE",
    ["Blackrock"] = "deDE",
    ["Blade'sEdge"] = "enGB",
    ["Bladefist"] = "enGB",
    ["Bloodfeather"] = "enGB",
    ["Bloodhoof"] = "enGB",
    ["Bloodscalp"] = "enGB",
    ["Blutkessel"] = "deDE",
    ["Boulderfist"] = "enGB",
    ["BronzeDragonflight"] = "enGB",
    ["Bronzebeard"] = "enGB",
    ["BurningBlade"] = "enGB",
    ["BurningLegion"] = "enGB",
    ["BurningSteppes"] = "enGB",
    ["C'Thun"] = "esES",
    ["ChamberofAspects"] = "enGB",
    ["Chantséternels"] = "frFR",
    ["Cho’gall"] = "frFR",
    ["Chromaggus"] = "enGB",
    ["ColinasPardas"] = "esES",
    ["ConfrérieduThorium"] = "frFR",
    ["ConseildesOmbres"] = "frFR",
    ["Crushridge"] = "enGB",
    ["CultedelaRivenoire"] = "frFR",
    ["Daggerspine"] = "enGB",
    ["Dalaran"] = "frFR",
    ["Dalvengyr"] = "deDE",
    ["DarkmoonFaire"] = "enGB",
    ["Darksorrow"] = "enGB",
    ["Darkspear"] = "enGB",
    ["DasKonsortium"] = "deDE",
    ["DasSyndikat"] = "deDE",
    ["Deathwing"] = "enGB",
    ["DefiasBrotherhood"] = "enGB",
    ["Dentarg"] = "enGB",
    ["DerMithrilorden"] = "deDE",
    ["DerRatvonDalaran"] = "deDE",
    ["DerAbyssischeRat"] = "deDE",
    ["Destromath"] = "deDE",
    ["Dethecus"] = "deDE",
    ["DieAldor"] = "deDE",
    ["DieArguswacht"] = "deDE",
    ["DieNachtwache"] = "deDE",
    ["DieSilberneHand"] = "deDE",
    ["DieTodeskrallen"] = "deDE",
    ["DieewigeWacht"] = "deDE",
    ["Doomhammer"] = "enGB",
    ["Draenor"] = "enGB",
    ["Dragonblight"] = "enGB",
    ["Dragonmaw"] = "enGB",
    ["Drak'thul"] = "enGB",
    ["Drek’Thar"] = "frFR",
    ["DunModr"] = "esES",
    ["DunMorogh"] = "deDE",
    ["Dunemaul"] = "enGB",
    ["Durotan"] = "deDE",
    ["EarthenRing"] = "enGB",
    ["Echsenkessel"] = "deDE",
    ["Eitrigg"] = "frFR",
    ["Eldre’Thalas"] = "frFR",
    ["Elune"] = "frFR",
    ["EmeraldDream"] = "enGB",
    ["Emeriss"] = "enGB",
    ["Eonar"] = "enGB",
    ["Eredar"] = "deDE",
    ["EuskalEncounter"] = "esES",
    ["Executus"] = "enGB",
    ["Exodar"] = "esES",
    ["FestungderStürme"] = "deDE",
    ["Forscherliga"] = "deDE",
    ["Frostmane"] = "enGB",
    ["Frostmourne"] = "deDE",
    ["Frostwhisper"] = "enGB",
    ["Frostwolf"] = "deDE",
    ["Garona"] = "frFR",
    ["Garrosh"] = "deDE",
    ["Genjuros"] = "enGB",
    ["Ghostlands"] = "enGB",
    ["Gilneas"] = "deDE",
    ["Gorgonnash"] = "deDE",
    ["GrimBatol"] = "enGB",
    ["Gul'dan"] = "deDE",
    ["Hakkar"] = "enGB",
    ["Haomarush"] = "enGB",
    ["Hellfire"] = "enGB",
    ["Hellscream"] = "enGB",
    ["Hyjal"] = "frFR",
    ["Illidan"] = "frFR",
    ["Jaedenar"] = "enGB",
    ["Kael’thas"] = "frFR",
    ["Karazhan"] = "enGB",
    ["Kargath"] = "deDE",
    ["Kazzak"] = "enGB",
    ["Kel'Thuzad"] = "deDE",
    ["Khadgar"] = "enGB",
    ["Khaz'goroth"] = "deDE",
    ["KhazModan"] = "frFR",
    ["Kil'jaeden"] = "deDE",
    ["Kilrogg"] = "enGB",
    ["KirinTor"] = "frFR",
    ["Kor'gall"] = "enGB",
    ["Krag'jin"] = "deDE",
    ["Krasus"] = "frFR",
    ["KulTiras"] = "enGB",
    ["KultderVerdammten"] = "deDE",
    ["LaCroisadeécarlate"] = "frFR",
    ["LaughingSkull"] = "enGB",
    ["LesClairvoyants"] = "frFR",
    ["LesSentinelles"] = "frFR",
    ["Lightbringer"] = "enGB",
    ["Lightning'sBlade"] = "enGB",
    ["Lordaeron"] = "deDE",
    ["LosErrantes"] = "esES",
    ["Lothar"] = "deDE",
    ["Madmortem"] = "deDE",
    ["Magtheridon"] = "enGB",
    ["Mal'Ganis"] = "deDE",
    ["Malfurion"] = "deDE",
    ["Malorne"] = "deDE",
    ["Malygos"] = "deDE",
    ["Mannoroth"] = "deDE",
    ["MarécagedeZangar"] = "frFR",
    ["Mazrigos"] = "enGB",
    ["Medivh"] = "frFR",
    ["Minahonda"] = "esES",
    ["Moonglade"] = "enGB",
    ["Mug'thol"] = "deDE",
    ["Nagrand"] = "enGB",
    ["Nathrezim"] = "deDE",
    ["Naxxramas"] = "frFR",
    ["Nazjatar"] = "deDE",
    ["Nefarian"] = "deDE",
    ["Nemesis"] = "itIT",
    ["Neptulon"] = "enGB",
    ["Ner’zhul"] = "frFR",
    ["Nera'thor"] = "deDE",
    ["Nethersturm"] = "deDE",
    ["Nordrassil"] = "enGB",
    ["Norgannon"] = "deDE",
    ["Nozdormu"] = "deDE",
    ["Onyxia"] = "deDE",
    ["Outland"] = "enGB",
    ["Perenolde"] = "deDE",
    ["Pozzodell'Eternità"] = "itIT",
    ["Proudmoore"] = "deDE",
    ["Quel'Thalas"] = "enGB",
    ["Ragnaros"] = "enGB",
    ["Rajaxx"] = "deDE",
    ["Rashgarroth"] = "frFR",
    ["Ravencrest"] = "enGB",
    ["Ravenholdt"] = "enGB",
    ["Rexxar"] = "deDE",
    ["Runetotem"] = "enGB",
    ["Sanguino"] = "esES",
    ["Sargeras"] = "frFR",
    ["Saurfang"] = "enGB",
    ["ScarshieldLegion"] = "enGB",
    ["Sen'jin"] = "deDE",
    ["Shadowsong"] = "enGB",
    ["ShatteredHalls"] = "enGB",
    ["ShatteredHand"] = "enGB",
    ["Shattrath"] = "deDE",
    ["Shen'dralar"] = "esES",
    ["Silvermoon"] = "enGB",
    ["Sinstralis"] = "frFR",
    ["Skullcrusher"] = "enGB",
    ["Spinebreaker"] = "enGB",
    ["Sporeggar"] = "enGB",
    ["SteamwheedleCartel"] = "enGB",
    ["Stormrage"] = "enGB",
    ["Stormreaver"] = "enGB",
    ["Stormscale"] = "enGB",
    ["Sunstrider"] = "enGB",
    ["Suramar"] = "frFR",
    ["Sylvanas"] = "enGB",
    ["Taerar"] = "deDE",
    ["Talnivarr"] = "enGB",
    ["TarrenMill"] = "enGB",
    ["Teldrassil"] = "deDE",
    ["Templenoir"] = "frFR",
    ["Terenas"] = "enGB",
    ["Terokkar"] = "enGB",
    ["Terrordar"] = "deDE",
    ["TheMaelstrom"] = "enGB",
    ["TheSha'tar"] = "enGB",
    ["TheVentureCo"] = "enGB",
    ["Theradras"] = "deDE",
    ["Thrall"] = "deDE",
    ["Throk’Feroth"] = "frFR",
    ["Thunderhorn"] = "enGB",
    ["Tichondrius"] = "deDE",
    ["Tirion"] = "deDE",
    ["Todeswache"] = "deDE",
    ["Trollbane"] = "enGB",
    ["Turalyon"] = "enGB",
    ["Twilight'sHammer"] = "enGB",
    ["TwistingNether"] = "enGB",
    ["Tyrande"] = "esES",
    ["Uldaman"] = "frFR",
    ["Ulduar"] = "deDE",
    ["Uldum"] = "esES",
    ["Un'Goro"] = "deDE",
    ["Varimathras"] = "frFR",
    ["Vashj"] = "enGB",
    ["Vek'lor"] = "deDE",
    ["Vek'nilash"] = "enGB",
    ["Vol’jin"] = "frFR",
    ["Wildhammer"] = "enGB",
    ["Wrathbringer"] = "deDE",
    ["Xavius"] = "enGB",
    ["Ysera"] = "deDE",
    ["Ysondre"] = "frFR",
    ["Zenedar"] = "enGB",
    ["ZirkeldesCenarius"] = "deDE",
    ["Zul'jin"] = "esES",
    ["Zuluhed"] = "deDE",
    ["Азурегос"] = "ruRU",
    ["Борейскаятундра"] = "ruRU",
    ["ВечнаяПесня"] = "ruRU",
    ["Галакронд"] = "ruRU",
    ["Голдринн"] = "ruRU",
    ["Гордунни"] = "ruRU",
    ["Гром"] = "ruRU",
    ["Дракономор"] = "ruRU",
    ["Корольлич"] = "ruRU",
    ["Пиратскаябухта"] = "ruRU",
    ["Подземье"] = "ruRU",
    ["ПропускнаАрену1"] = "ruRU",
    ["Разувий"] = "ruRU",
    ["Ревущийфьорд"] = "ruRU",
    ["СвежевательДуш"] = "ruRU",
    ["Седогрив"] = "ruRU",
    ["СтражСмерти"] = "ruRU",
    ["Термоштепсель"] = "ruRU",
    ["ТкачСмерти"] = "ruRU",
    ["ЧерныйШрам"] = "ruRU",
    ["Ясеневыйлес"] = "ruRU",
}

Addon.Locale.Realms = Self