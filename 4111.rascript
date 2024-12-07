// Monster Max
// #ID = 4111

// $C006 - Start Menu
function StartMenu() => word( 0xc006 )

// $C009 - Select Menu
function SelectMenu() => high4( 0xc009 )

// $CFBF - Current mission
function CurrentMission() => byte( 0xcfbf )

// $D00A: Mission Flags for marking completed missions
function MissionFlags() => dword( 0xd00a )

// $D120: Lucky Star Count
function LuckyStars() => byte( 0xd120 )

// $D122: Health
function Health() => byte( 0xd122 )

// $D123: Speed Boost
function SpeedBoost() => byte( 0xd123 )

// $D124: Power Ring
function PowerRing() => byte( 0xd124 )

// $D125: PowerSpring
function PowerSpring() => byte( 0xd125 )

// $D128: Lift Pass Level
function LiftPassLevel() => byte( 0xd128 )

// $D129: Number of credits earned
function Credits() => word( 0xd129 )

// $D12E: Idle Timer until Max begins playing guitar
function IdleTimer() => byte( 0xd12e )

// $D190: Start Menu Map Group 1
function StartMenuMapGroup1() => bitcount( 0xd190 )

// $D191: Start Menu Map Group 2
function StartMenuMapGroup2() => bitcount( 0xd191 )

// $D192: Start Menu Map Group 3
function StartMenuMapGroup3() => bitcount( 0xd192 )

// $D193: Start Menu Map Group 4
function StartMenuMapGroup4() => bitcount( 0xd193 )

// $D194: Start Menu Map Group 5
function StartMenuMapGroup5() => bitcount( 0xd194 )

// $D195: Start Menu Map Group 6
function StartMenuMapGroup6() => bitcount( 0xd195 )

// $D196: Start Menu Map Group 7
function StartMenuMapGroup7() => bitcount( 0xd196 )

// $D197: Mission Rooms Available Group 1
function MissionRoomsAvailableGroup1() => bitcount( 0xd197 )

// $D198: Mission Rooms Available Group 2
function MissionRoomsAvailableGroup2() => bitcount( 0xd198 )

// $D199: Mission Rooms Available Group 3
function MissionRoomsAvailableGroup3() => bitcount( 0xd199 )

// $D19A: Mission Rooms Available Group 4
function MissionRoomsAvailableGroup4() => bitcount( 0xd19a )

// $D19B: Mission Rooms Available Group 5
function MissionRoomsAvailableGroup5() => bitcount( 0xd19b )

// $D19C: Mission Rooms Available Group 6
function MissionRoomsAvailableGroup6() => bitcount( 0xd19c )

// $D19D: Mission Rooms Available Group 7
function MissionRoomsAvailableGroup7() => bitcount( 0xd19d )

// $D3F0 - Password first four chars
function PasswordCharGroup1() => dword( 0xd3f0 )

// $D3F4 - Password last four chars
function PasswordCharGroup2() => dword( 0xd3f4 )

// $D3E5 - Current Select Menu Option Selection
function SelectMenuOption() => byte( 0xd3e5 )

// $D402 - Mission Bonus
function Bonus() => word( 0xd402 )

// Doors
CLOSED = 0x00

// Life
DEAD = 0xFF

// Mission Masks
PLAYPENMASK         = 0x00000001
LEVEL1MISSION1MASK  = 0x00000002
LEVEL1MISSION2MASK  = 0x00000004
LEVEL1MISSION3MASK  = 0x00000008
LEVEL2MISSION1MASK  = 0x00000010
LEVEL2MISSION2MASK  = 0x00000020
LEVEL2MISSION3MASK  = 0x00000040
LEVEL3MISSION1MASK  = 0x00000080
LEVEL3MISSION2MASK  = 0x00000100
LEVEL3MISSION3MASK  = 0x00000200
LEVEL4MISSION1MASK  = 0x00000400
LEVEL4MISSION2MASK  = 0x00000800
LEVEL4MISSION3MASK  = 0x00001000
LEVEL5MISSION1MASK  = 0x00002000
LEVEL5MISSION2MASK  = 0x00004000
LEVEL5MISSION3MASK  = 0x00008000
LEVEL6MISSION1MASK  = 0x00010000
LEVEL6MISSION2MASK  = 0x00020000
LEVEL6MISSION3MASK  = 0x00040000
LEVEL7MISSION1MASK  = 0x00080000
LEVEL7MISSION2MASK  = 0x00100000
LEVEL7MISSION3MASK  = 0x00200000
LEVEL8MISSION1MASK  = 0x00400000
LEVEL8MISSION2MASK  = 0x00800000
LEVEL8MISSION3MASK  = 0x01000000
LEVEL9MISSION1MASK  = 0x02000000
LEVEL9MISSION2MASK  = 0x04000000
LEVEL9MISSION3MASK  = 0x08000000
LEVEL10MISSION1MASK = 0x10000000

// Mission IDs
MAINROOMID        = 0x00
PLAYPENID         = 0x01
LEVEL1MISSION1ID  = 0x02
LEVEL1MISSION2ID  = 0x03
LEVEL1MISSION3ID  = 0x04
LEVEL2MISSION1ID  = 0x05
LEVEL2MISSION2ID  = 0x06
LEVEL2MISSION3ID  = 0x07
LEVEL3MISSION1ID  = 0x08
LEVEL3MISSION2ID  = 0x09
LEVEL3MISSION3ID  = 0x0A
LEVEL4MISSION1ID  = 0x0B
LEVEL4MISSION2ID  = 0x0C
LEVEL4MISSION3ID  = 0x0D
LEVEL5MISSION1ID  = 0x0E
LEVEL5MISSION2ID  = 0x0F
LEVEL5MISSION3ID  = 0x10
LEVEL6MISSION1ID  = 0x11
LEVEL6MISSION2ID  = 0x12
LEVEL6MISSION3ID  = 0x13
LEVEL7MISSION1ID  = 0x14
LEVEL7MISSION2ID  = 0x15
LEVEL7MISSION3ID  = 0x16
LEVEL8MISSION1ID  = 0x17
LEVEL8MISSION2ID  = 0x18
LEVEL8MISSION3ID  = 0x19
LEVEL9MISSION1ID  = 0x1A
LEVEL9MISSION2ID  = 0x1B
LEVEL9MISSION3ID  = 0x1C
LEVEL10MISSION1ID = 0x1D
TITLESCREENID     = 0x1E
CONCERTSCREENID   = 0x1F

LEVEL1  = 0x00
LEVEL2  = 0x01
LEVEL3  = 0x02
LEVEL4  = 0x03
LEVEL5  = 0x04
LEVEL6  = 0x05
LEVEL7  = 0x06
LEVEL8  = 0x07
LEVEL9  = 0x08
LEVEL10 = 0x09

levelLookup = {
    1: {
        "id":            LEVEL1,
        "titleOverride": "The Journey Begins",
        "cost":          0
    },
    2: {
        "id":            LEVEL2,
        "titleOverride": "Double The Trouble",
        "cost":          70,
        "raID":          459891,
        "raBadge":       "549135"
    },
    3: {
        "id":      LEVEL3,
        "cost":    130,
        "raID":    459898,
        "raBadge": "520623"
    },
    4: {
        "id":      LEVEL4,
        "cost":    200,
        "raID":    459905,
        "raBadge": "520630"
    },
    5: {
        "id":      LEVEL5,
        "cost":    300,
        "raID":    459912,
        "raBadge": "520637"
    },
    6: {
        "id":      LEVEL6,
        "cost":    450,
        "raID":    459919,
        "raBadge": "520644"
    },
    7: {
        "id":      LEVEL7,
        "cost":    650,
        "raID":    459926,
        "raBadge": "520651"
    },
    8: {
        "id":      LEVEL8,
        "cost":    1000,
        "raID":    459933,
        "raBadge": "520658"
    },
    9: {
        "id":      LEVEL9,
        "cost":    1500,
        "raID":    459940,
        "raBadge": "520665"
    },
    10: {
        "id":      LEVEL10,
        "cost":    2500,
        "raID":    459947,
        "raBadge": "520672"
    },
}

achievements = {}

// private functions

function missionMarkedComplete( config )
{
    // Mission is marked complete and it was previously closed
    return (
        ( ( MissionFlags() & config["missionMask"] ) == config["missionMask"] ) &&
        ( ( prev( MissionFlags() ) & config["missionMask"] ) == CLOSED )
    )
}

function onlyMissionUnlocked( config )
{
    return (
        MissionFlags() == ( prev( MissionFlags() ) + config["missionMask"] ) &&
        prior( bit( config["itemBit"], config["itemAddr"] ) ) == 0 &&
        bit( config["itemBit"], config["itemAddr"] ) == 1
    )
}

function PlayerHurt()
{
    // Player loses a star, or heart
    return (
        !inTitleScreen() && !inConcertScreen() && !inMainLobby() && // check that they are in a mission
        ( LuckyStars() == ( prev( LuckyStars() ) - 1 ) ) ||
        ( Health() == ( prev( Health() ) - 1 ) )
    )
}

function inMainLobby()
{
    return (
        CurrentMission() == MAINROOMID
    )
}

function inSelectMenu()
{
    return (
        SelectMenu() == 0
    )
}

function inStartMenu()
{
    return (
        StartMenu() == 0x3836
    )
}

function inTitleScreen()
{
    return (
        CurrentMission() == TITLESCREENID
    )
}

function inConcertScreen()
{
    return (
        CurrentMission() == CONCERTSCREENID
    )
}

function upgradeLiftPassLevel( prevLevel, newLevel, cost )
{
    return (
        prev( LiftPassLevel() ) == prevLevel &&
        LiftPassLevel() == newLevel &&
        prev( Credits() ) == ( Credits() + cost )
    )
}

function countRoomsSeen()
{
    return (
        StartMenuMapGroup1() +
        StartMenuMapGroup2() +
        StartMenuMapGroup3() +
        StartMenuMapGroup4() +
        StartMenuMapGroup5() +
        StartMenuMapGroup6() +
        StartMenuMapGroup7()
    )
}

// public functions

function OpenPasswordMenu()
{
    return (
        inSelectMenu() &&
        SelectMenuOption() == 0x01 && // enter password menu
        prev( PasswordCharGroup1() ) != 0xFFFFFFFF && PasswordCharGroup1() == 0xFFFFFFFF &&
        prev( PasswordCharGroup2() ) != 0xFFFFFFFF && PasswordCharGroup2() == 0xFFFFFFFF
    )
}

function PlayerDies( missionIds )
{
    conditions = (
        prev( Health() ) != DEAD &&
        Health() == DEAD
    )
    if length( missionIds ) > 0 {
        return any_of(
            missionIds,
            mid => CurrentMission() == mid && conditions
        )
    }
    return conditions
}

function PlayerQuitsMission( config )
{
    return (
        prev( CurrentMission() ) == config["missionId"] &&
        CurrentMission() != config["missionId"] &&
        !missionMarkedComplete( config )
    )
}

function PlayerEntersMission( config )
{
    return (
        prev( CurrentMission() ) == MAINROOMID &&
        CurrentMission() == config["missionId"]
    )
}

function MissionCompleteCondition( config ) 
{
    return tally( 2,
        once( PlayerEntersMission( config ) ),
        once( onlyMissionUnlocked( config ) )
    )
}

function MissionCompletePerfectCondition( config ) 
{
    conditions = [
        once( PlayerEntersMission( config ) ),
        once( onlyMissionUnlocked( config ) )
    ]
    if config["inGameHearts"] > 0 {
        array_push( conditions, repeated( config["inGameHearts"], CurrentMission() == config["missionId"] && Health() == prev( Health() ) + 1 ))
    }
    if config["stars"] > 0 {
        array_push( conditions, repeated( config["stars"], CurrentMission() == config["missionId"] && LuckyStars() == prev( LuckyStars() ) + 1 ) )
    }
    if config["gold"] > 0 {
        array_push( conditions, repeated( config["gold"], CurrentMission() == config["missionId"] && Bonus() == prev( Bonus() ) + config["bonus"] ) )
    }
    return tally(
        2 + config["inGameHearts"] + config["stars"] + config["gold"],
        conditions
    )
}

function GameStarts()
{
    return (
        LiftPassLevel() == 0x00 &&
        Credits() == 0x00 &&
        MissionFlags() == 0x00000000 &&
        (
            prev( CurrentMission() ) == TITLESCREENID ||
            prev( CurrentMission() ) == CONCERTSCREENID
        ) &&
        CurrentMission() == MAINROOMID
    )
}

function GameEnds()
{
    return (
        LiftPassLevel() == 0x09 &&
        prev( CurrentMission() ) == LEVEL10MISSION1ID &&
        CurrentMission() == CONCERTSCREENID
    )
}

// Achievement Configs

MissionConfigs = [
    {
        "index":           1,
        "level":           1,
        "mission":         0,
        "title":           "Play Pen",
        "description":     "Beat the play pen tutorial",
        "itemBit":         7,
        "itemAddr":        0xd002,
        "reward":          1,
        "startingHearts":  0,
        "bonus":           0,
        "inGameHearts":    0,
        "gold":            0,
        "stars":           0,
        "lightning":       0,
        "powerSpring":     1,
        "powerRing":       0,
        "map":             0,
        "points":          2,
        "type":            "",
        "missionId":       PLAYPENID,
        "missionMask":     PLAYPENMASK,
        "hasChallenge":    false,
        "raID":            459884,
        "raBadge":         "520616",
        "leaderboardID":   114800
    },
    {
        "index":            2,
        "level":            1,
        "mission":          1,
        "title":            "Big Brain",
        "description":      "Destroy the mind",
        "itemBit":          1,
        "itemAddr":         0xd004,
        "reward":           30,
        "startingHearts":   4,
        "bonus":            3,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            1,
        "lightning":        1,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL1MISSION1ID,
        "missionMask":      LEVEL1MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459885,
        "raBadge":          "520617",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459886,
        "challengeRABadge": "520618",
        "leaderboardID":    114801
    },
    {
        "index":            4,
        "level":            1,
        "mission":          2,
        "title":            "Ice Queen",
        "description":      "Steal the Ice Queen's crown",
        "itemBit":          1,
        "itemAddr":         0xd004,
        "reward":           30,
        "startingHearts":   4,
        "bonus":            3,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            1,
        "lightning":        0,
        "powerSpring":      1,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL1MISSION2ID,
        "missionMask":      LEVEL1MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459887,
        "raBadge":          "520619",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459888,
        "challengeRABadge": "520620",
        "leaderboardID":    114802
    },
    {
        "index":            6,
        "level":            1,
        "mission":          3,
        "title":            "Erase the Alchemist",
        "description":      "Destroy the alchemist",
        "itemBit":          2,
        "itemAddr":         0xd004,
        "reward":           45,
        "startingHearts":   4,
        "bonus":            3,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            2,
        "lightning":        2,
        "powerSpring":      0,
        "powerRing":        1,
        "map":              1,
        "missionId":        LEVEL1MISSION3ID,
        "missionMask":      LEVEL1MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459889,
        "raBadge":          "520621",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459890,
        "challengeRABadge": "520622",
        "leaderboardID":    114803
    },
    {
        "index":            9,
        "level":            2,
        "mission":          1,
        "title":            "Blind the Enemy",
        "description":      "Destroy the all seeing eye",
        "itemBit":          4,
        "itemAddr":         0xd004,
        "reward":           45,
        "startingHearts":   4,
        "bonus":            7,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            2,
        "lightning":        1,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              1,
        "missionId":        LEVEL2MISSION1ID,
        "missionMask":      LEVEL2MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459892,
        "raBadge":          "520624",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459893,
        "challengeRABadge": "520625",
        "leaderboardID":    114804
    },
    {
        "index":            11,
        "level":            2,
        "mission":          2,
        "title":            "Secret Codex",
        "description":      "Read the secret code",
        "itemBit":          0,
        "itemAddr":         0xd004,
        "reward":           40,
        "startingHearts":   4,
        "bonus":            7,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            3,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL2MISSION2ID,
        "missionMask":      LEVEL2MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459894,
        "raBadge":          "520626",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459895,
        "challengeRABadge": "520627",
        "leaderboardID":    114805
    },
    {
        "index":            13,
        "level":            2,
        "mission":          3,
        "title":            "Liftoff",
        "description":      "Launch the self destructing rocket",
        "itemBit":          2,
        "itemAddr":         0xd004,
        "reward":           65,
        "startingHearts":   4,
        "bonus":            7,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            0,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL2MISSION3ID,
        "missionMask":      LEVEL2MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459896,
        "raBadge":          "520628",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459897,
        "challengeRABadge": "520629",
        "leaderboardID":    114806
    },
    {
        "index":            16,
        "level":            3,
        "mission":          1,
        "title":            "Illuminate the Way",
        "description":      "Find the flashlight",
        "itemBit":          2,
        "itemAddr":         0xd004,
        "reward":           70,
        "startingHearts":   4,
        "bonus":            10,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            2,
        "lightning":        1,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              1,
        "missionId":        LEVEL3MISSION1ID,
        "missionMask":      LEVEL3MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459899,
        "raBadge":          "520631",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459900,
        "challengeRABadge": "520632",
        "leaderboardID":    114807
    },
    {
        "index":            18,
        "level":            3,
        "mission":          2,
        "title":            "Circuit Breaker",
        "description":      "Find the electrical control box",
        "itemBit":          7,
        "itemAddr":         0xd003,
        "reward":           60,
        "startingHearts":   4,
        "bonus":            10,
        "inGameHearts":     1,
        "gold":             2,
        "stars":            3,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL3MISSION2ID,
        "missionMask":      LEVEL3MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459901,
        "raBadge":          "520633",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459902,
        "challengeRABadge": "520634",
        "leaderboardID":    114808
    },
    {
        "index":            20,
        "level":            3,
        "mission":          3,
        "title":            "Startup Funds",
        "description":      "Search for the piggy bank",
        "itemBit":          1,
        "itemAddr":         0xd004,
        "reward":           100,
        "startingHearts":   4,
        "bonus":            10,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            2,
        "lightning":        1,
        "powerSpring":      1,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL3MISSION3ID,
        "missionMask":      LEVEL3MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459903,
        "raBadge":          "520635",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459904,
        "challengeRABadge": "520636",
        "leaderboardID":    114809
    },
    {
        "index":            23,
        "level":            4,
        "mission":          1,
        "title":            "Time Keeper",
        "description":      "Collect the pocketwatch",
        "itemBit":          1,
        "itemAddr":         0xd004,
        "reward":           100,
        "startingHearts":   4,
        "bonus":            15,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            0,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL4MISSION1ID,
        "missionMask":      LEVEL4MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459906,
        "raBadge":          "520638",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459907,
        "challengeRABadge": "520639",
        "leaderboardID":    114810
    },
    {
        "index":            25,
        "level":            4,
        "mission":          2,
        "title":            "Food Poisoning",
        "description":      "Get rid of the poisoned food",
        "itemBit":          0,
        "itemAddr":         0xd004,
        "reward":           100,
        "startingHearts":   4,
        "bonus":            15,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            1,
        "lightning":        1,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL4MISSION2ID,
        "missionMask":      LEVEL4MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459908,
        "raBadge":          "520640",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459909,
        "challengeRABadge": "520641",
        "leaderboardID":    114811
    },
    {
        "index":            27,
        "level":            4,
        "mission":          3,
        "title":            "Command an Army",
        "description":      "Earn the crown of attack",
        "itemBit":          5,
        "itemAddr":         0xd002,
        "reward":           150,
        "startingHearts":   3,
        "bonus":            15,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            1,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              1,
        "missionId":        LEVEL4MISSION3ID,
        "missionMask":      LEVEL4MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459910,
        "raBadge":          "520642",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459911,
        "challengeRABadge": "520643",
        "leaderboardID":    114812
    },
    {
        "index":            30,
        "level":            5,
        "mission":          1,
        "title":            "Ghost Ship",
        "description":      "Take the ghost ship wood log",
        "itemBit":          1,
        "itemAddr":         0xd003,
        "reward":           150,
        "startingHearts":   4,
        "bonus":            20,
        "inGameHearts":     1,
        "gold":             2,
        "stars":            1,
        "lightning":        1,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL5MISSION1ID,
        "missionMask":      LEVEL5MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459913,
        "raBadge":          "520645",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459914,
        "challengeRABadge": "520646",
        "leaderboardID":    114813
    },
    {
        "index":            32,
        "level":            5,
        "mission":          2,
        "title":            "Talk to the Dead",
        "description":      "Collect the crystal ball",
        "itemBit":          0,
        "itemAddr":         0xd004,
        "reward":           200,
        "startingHearts":   3,
        "bonus":            20,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            1,
        "lightning":        0,
        "powerSpring":      1,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL5MISSION2ID,
        "missionMask":      LEVEL5MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459915,
        "raBadge":          "520647",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459916,
        "challengeRABadge": "520648",
        "leaderboardID":    114814
    },
    {
        "index":            34,
        "level":            5,
        "mission":          3,
        "title":            "Keeping Warm",
        "description":      "Use the wood stove",
        "itemBit":          1,
        "itemAddr":         0xd004,
        "reward":           300,
        "startingHearts":   3,
        "bonus":            20,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            1,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL5MISSION3ID,
        "missionMask":      LEVEL5MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459917,
        "raBadge":          "520649",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459918,
        "challengeRABadge": "520650",
        "leaderboardID":    114815
    },
    {
        "index":            37,
        "level":            6,
        "mission":          1,
        "title":            "In Safe Hands",
        "description":      "Return the safe",
        "itemBit":          4,
        "itemAddr":         0xd005,
        "reward":           275,
        "startingHearts":   3,
        "bonus":            30,
        "inGameHearts":     0,
        "gold":             1,
        "stars":            0,
        "lightning":        5,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL6MISSION1ID,
        "missionMask":      LEVEL6MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459920,
        "raBadge":          "520652",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459921,
        "challengeRABadge": "520653",
        "leaderboardID":    114816
    },
    {
        "index":            39,
        "level":            6,
        "mission":          2,
        "title":            "Enchantment",
        "description":      "Smash the potion vial",
        "itemBit":          5,
        "itemAddr":         0xd005,
        "reward":           300,
        "startingHearts":   3,
        "bonus":            30,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            0,
        "lightning":        3,
        "powerSpring":      0,
        "powerRing":        1,
        "map":              1,
        "missionId":        LEVEL6MISSION2ID,
        "missionMask":      LEVEL6MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459922,
        "raBadge":          "520654",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459923,
        "challengeRABadge": "520655",
        "leaderboardID":    114817
    },
    {
        "index":            41,
        "level":            6,
        "mission":          3,
        "title":            "Cursed Gem",
        "description":      "Destroy the dark jewel",
        "itemBit":          0,
        "itemAddr":         0xd004,
        "reward":           450,
        "startingHearts":   3,
        "bonus":            30,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            1,
        "lightning":        0,
        "powerSpring":      1,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL6MISSION3ID,
        "missionMask":      LEVEL6MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459924,
        "raBadge":          "520656",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459925,
        "challengeRABadge": "520657",
        "leaderboardID":    114818
    },
    {
        "index":            44,
        "level":            7,
        "mission":          1,
        "title":            "POP!",
        "description":      "Earn the fizzy soda prize",
        "itemBit":          1,
        "itemAddr":         0xd004,
        "reward":           450,
        "startingHearts":   3,
        "bonus":            42,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            4,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL7MISSION1ID,
        "missionMask":      LEVEL7MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459927,
        "raBadge":          "520659",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459928,
        "challengeRABadge": "520660",
        "leaderboardID":    114819
    },
    {
        "index":            46,
        "level":            7,
        "mission":          2,
        "title":            "Waiting for a Call",
        "description":      "Collect the phone",
        "itemBit":          2,
        "itemAddr":         0xd004,
        "reward":           450,
        "startingHearts":   3,
        "bonus":            42,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            3,
        "lightning":        1,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL7MISSION2ID,
        "missionMask":      LEVEL7MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459929,
        "raBadge":          "520661",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459930,
        "challengeRABadge": "520662",
        "leaderboardID":    114820
    },
    {
        "index":            48,
        "level":            7,
        "mission":          3,
        "title":            "S.O.S",
        "description":      "Release the captive voyager",
        "itemBit":          3,
        "itemAddr":         0xd003,
        "reward":           600,
        "startingHearts":   2,
        "bonus":            42,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            3,
        "lightning":        0,
        "powerSpring":      1,
        "powerRing":        1,
        "map":              0,
        "missionId":        LEVEL7MISSION3ID,
        "missionMask":      LEVEL7MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459931,
        "raBadge":          "520663",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459932,
        "challengeRABadge": "520664",
        "leaderboardID":    114821
    },
    {
        "index":            51,
        "level":            8,
        "mission":          1,
        "title":            "K9 Companion",
        "description":      "Rescue the dog",
        "itemBit":          1,
        "itemAddr":         0xd004,
        "reward":           650,
        "startingHearts":   3,
        "bonus":            60,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            1,
        "lightning":        16,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL8MISSION1ID,
        "missionMask":      LEVEL8MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459934,
        "raBadge":          "520666",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459935,
        "challengeRABadge": "520667",
        "leaderboardID":    114822
    },
    {
        "index":            53,
        "level":            8,
        "mission":          2,
        "title":            "Fast Getaway",
        "description":      "Find and flee with the amphora jar",
        "itemBit":          0,
        "itemAddr":         0xd004,
        "reward":           650,
        "startingHearts":   2,
        "bonus":            60,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            3,
        "lightning":        1,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL8MISSION2ID,
        "missionMask":      LEVEL8MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459936,
        "raBadge":          "520668",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459937,
        "challengeRABadge": "520669",
        "leaderboardID":    114823
    },
    {
        "index":            55,
        "level":            8,
        "mission":          3,
        "title":            "Piece of Cake",
        "description":      "Eat the triple decker cake",
        "itemBit":          1,
        "itemAddr":         0xd004,
        "reward":           850,
        "startingHearts":   2,
        "bonus":            60,
        "inGameHearts":     1,
        "gold":             1,
        "stars":            5,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL8MISSION3ID,
        "missionMask":      LEVEL8MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459938,
        "raBadge":          "520670",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459939,
        "challengeRABadge": "520671",
        "leaderboardID":    114824
    },
    {
        "index":            58,
        "level":            9,
        "mission":          1,
        "title":            "Hacking the Mainframe",
        "description":      "Destroy the computer system",
        "itemBit":          0,
        "itemAddr":         0xd004,
        "reward":           900,
        "startingHearts":   2,
        "bonus":            90,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            5,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              0,
        "missionId":        LEVEL9MISSION1ID,
        "missionMask":      LEVEL9MISSION1MASK,
        "points":           5,
        "type":             "",
        "raID":             459941,
        "raBadge":          "520673",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459942,
        "challengeRABadge": "520674",
        "leaderboardID":    114825
    },
    {
        "index":            60,
        "level":            9,
        "mission":          2,
        "title":            "Infestation",
        "description":      "Smash open the jar of insects",
        "itemBit":          0,
        "itemAddr":         0xd004,
        "reward":           800,
        "startingHearts":   2,
        "bonus":            90,
        "inGameHearts":     1,
        "gold":             2,
        "stars":            3,
        "lightning":        1,
        "powerSpring":      0,
        "powerRing":        1,
        "map":              0,
        "missionId":        LEVEL9MISSION2ID,
        "missionMask":      LEVEL9MISSION2MASK,
        "points":           5,
        "type":             "",
        "raID":             459943,
        "raBadge":          "520675",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459944,
        "challengeRABadge": "520676",
        "leaderboardID":    114826
    },
    {
        "index":            62,
        "level":            9,
        "mission":          3,
        "title":            "Home Sweet Home",
        "description":      "Find a new home",
        "itemBit":          7,
        "itemAddr":         0xd003,
        "reward":           1100,
        "startingHearts":   2,
        "bonus":            90,
        "inGameHearts":     1,
        "gold":             0,
        "stars":            1,
        "lightning":        0,
        "powerSpring":      0,
        "powerRing":        0,
        "map":              1,
        "missionId":        LEVEL9MISSION3ID,
        "missionMask":      LEVEL9MISSION3MASK,
        "points":           5,
        "type":             "",
        "raID":             459945,
        "raBadge":          "520677",
        "hasChallenge":     true,
        "challengePoints":  10,
        "challengeRAID":    459946,
        "challengeRABadge": "520678",
        "leaderboardID":    114827
    },
    {
        "index":            65,
        "level":            10,
        "mission":          1,
        "title":            "King Krond",
        "description":      "Defeat Krond and save the Mega Hero Academy!",
        "itemBit":          5,
        "itemAddr":         0xd008,
        "reward":           3500,
        "startingHearts":   3,
        "bonus":            120,
        "inGameHearts":     4,
        "gold":             0,
        "stars":            1,
        "lightning":        2,
        "powerSpring":      1,
        "powerRing":        1,
        "map":              0,
        "missionId":        LEVEL10MISSION1ID,
        "missionMask":      LEVEL10MISSION1MASK,
        "points":           25,
        "type":             "win_condition",
        "raID":             459948,
        "raBadge":          "520680",
        "hasChallenge":     false,
        "leaderboardID":    114828
    }
]

currentLevel        = 1
count               = 0
lightningMissions   = []
powerSpringMissions = []
powerRingMissions   = []
mapMissions         = []
leaderboards        = []

for config in MissionConfigs
{
    // Progression level achievements
    if currentLevel + 1 == config["level"] {
        levelIndex = config["index"] - 1
        levelMissionConfigs = []
        levelMissionIds = []
        for missionConfig in MissionConfigs {
            if missionConfig["level"] == currentLevel && missionConfig["mission"] != 0 {
                array_push( levelMissionConfigs, missionConfig )
                array_push( levelMissionIds, missionConfig["missionId"] )
            }
        }
        conditions = [
            once( GameStarts() ),
            once( GameStarts() ),
            once( GameStarts() ),
            once( GameStarts() ),
            deduct( once( PlayerDies( levelMissionIds ) ) )
        ]
        for levelMissionConfig in levelMissionConfigs {
            array_push( conditions, once(
                PlayerEntersMission( levelMissionConfig )
            ) )
            array_push( conditions, once(
                onlyMissionUnlocked( levelMissionConfig )
            ) )
        }
        title = format("Complete Level {0}", currentLevel)
        if dictionary_contains_key( levelLookup[currentLevel], "titleOverride" ) {
            title = levelLookup[currentLevel]["titleOverride"]
        }
        levelAchievement = {
            "title":       title,
            "description": format("Complete level {0} and buy the lift pass for level {1} without using passwords", currentLevel, config["level"]),
            "points":      10,
            "trigger":     tally(
                4,
                conditions
            ) &&
            trigger_when( upgradeLiftPassLevel( levelLookup[currentLevel]["id"], levelLookup[config["level"]]["id"], levelLookup[config["level"]]["cost"] ) ) &&
            never( OpenPasswordMenu() ),
            "type":        "progression",
            "id":          levelLookup[config["level"]]["raID"],
            "badge":       levelLookup[config["level"]]["raBadge"],
        }
        count = count + 1
        achievements[levelIndex] = levelAchievement
        currentLevel = config["level"]
    }
    
    // Standard mission completion achievements
    currIndex = config["index"]
    desc = format( "{0} and complete Level {1} Mission {2}", config["description"], config["level"], config["mission"])
    leaderboardTitle = format( "Speedrun Level {0} Mission {1}", config["level"], config["mission"] )
    leaderboardDescription = format( "Complete Level {0} Mission {1} from start to finish as fast as possible without using passwords", config["level"], config["mission"] )
    if ( ( config["level"] == 1 && config["mission"] == 0 ) || ( config["level"] == 10 && config["mission"] == 1 ) ) { // Play pen & king krond
        desc = config["description"]
        if ( config["level"] == 1 && config["mission"] == 0 ) {
            leaderboardTitle = format("Speedrun {0}", config["title"])
            leaderboardDescription = format("Complete {0} from start to finish as fast as possible without using passwords", config["title"] )
        }
    }
    a = {
        "title":       config["title"],
        "description": desc,
        "points":      config["points"],
        "trigger":     MissionCompleteCondition( config ) &&
        never( OpenPasswordMenu() ) &&
        never( PlayerQuitsMission( config ) ) &&
        never( PlayerDies( [] ) ),
        "type":        config["type"],
        "id":          config["raID"],
        "badge":       config["raBadge"],
    }
    achievements[currIndex] = a
    count = count + 1
    
    // Missable challenge mission achievements
    if config["hasChallenge"] {
        currIndex = currIndex + 1
        items = ""
        if config["inGameHearts"] > 0 || config["gold"] > 0 || config["stars"] > 0 {
            items = ", collect "
            heartLabel = "heart"
            if config["inGameHearts"] > 1 {
                heartLabel = "hearts"
            }
            goldLabel = "gold bullion"
            if config["gold"] > 1 {
                goldLabel = "gold bullions"
            }
            starLabel = "star"
            if config["stars"] > 1 {
                starLabel = "stars"
            }
            args = []
            if config["inGameHearts"] > 0 {
                array_push( args, config["inGameHearts"] )
                array_push( args, heartLabel )
            }
            if config["gold"] > 0 {
                array_push( args, config["gold"] )
                array_push( args, goldLabel )
            }
            if config["stars"] > 0 {
                array_push( args, config["stars"] )
                array_push( args, starLabel )
            }
            for index in range( 0, length( args ) - 1, 2) {
                atEnd = true
                if length( args ) > 2 {
                    if index == length( args ) - 2 {
                        items = items + " and "
                    } else {
                        if index != 0 {
                            items = items + ", "
                        }
                    }
                }
                items = items + args[index] + " " + args[index + 1]
            }
        }
        a1 = {
            "title":       format("Perfect {0}", config["title"]),
            "description": format("Without taking damage{0} and complete Level {1} Mission {2}", items, config["level"], config["mission"]),
            "points":      config["challengePoints"],
            "trigger":     measured(
                MissionCompletePerfectCondition( config )
            ) &&
            never( OpenPasswordMenu() ) &&
            never( PlayerDies( [] ) ) &&
            never( PlayerQuitsMission( config ) ) &&
            never( PlayerHurt() ),
            "type":        "missable",
            "id":          config["challengeRAID"],
            "badge":       config["challengeRABadge"]
        }
        count = count + 1
        achievements[currIndex] = a1
    }
    
    // Build lists for "fun" achievements
    
    // lightnings
    if config["lightning"] > 0 {
        array_push( lightningMissions, config["missionId"] )
    }
    
    // power springs
    if config["powerSpring"] > 0 && config["missionId"] != PLAYPENID { // gather all power spring missions that are not the playpen
        array_push( powerSpringMissions, config["missionId"] )
    }
    
    // power rings
    if config["powerRing"] > 0 {
        array_push( powerRingMissions, config["missionId"] )
    }
    
    // maps
    if config["map"] > 0 {
        array_push( mapMissions, config["missionId"] )
    }
    
    // Create leaderboard structures
    l = {
        "title":           leaderboardTitle,
        "description":     leaderboardDescription,
        "start":           PlayerEntersMission( config ),
        "cancel":          (
            OpenPasswordMenu() ||
            PlayerDies( [] ) ||
            PlayerQuitsMission( config )
        ),
        "submit":          onlyMissionUnlocked( config ),
        "value":           measured( always_true() ) &&
                           unless( inSelectMenu() ) &&
                           unless( inStartMenu() ),
        "format":          "FRAMES",
        "lower_is_better": true,
        "id":              config["leaderboardID"]
    }
    array_push( leaderboards, l )
}

// Lightning achievement
currIndex = count + 1
a = {
    "index":       66,
    "title":       "Speedy",
    "description": "Pick up a lightning in any mission",
    "points":      2,
    "trigger":     any_of(
        lightningMissions,
        mid => CurrentMission() == mid &&
        prev( SpeedBoost() ) == 0 &&
        SpeedBoost() > 0
    ),
    "type":        "",
    "id":          459950,
    "badge":       "520682",
}
count = count + 1
achievements[currIndex] = a

// Power Spring achievement
currIndex = count + 1
a = {
    "title":       "Jump to the Rescue",
    "description": "Pick up a power spring in any mission except the Play Pen",
    "points":      2,
    "trigger":     any_of(
        powerSpringMissions,
        mid => CurrentMission() == mid &&
        prev( PowerSpring() ) + 0x0a == PowerSpring()
    ),
    "type":        "",
    "id":          459951,
    "badge":       "520683",
}
count = count + 1
achievements[currIndex] = a

// Power Ring achievement
currIndex = count + 1
a = {
    "title":       "Invincible",
    "description": "Pick up a power ring in any mission",
    "points":      2,
    "trigger":     any_of(
        powerRingMissions,
        mid => CurrentMission() == mid &&
        prev( PowerRing() ) == 0 &&
        PowerRing() > 0
    ),
    "type":        "",
    "id":          459952,
    "badge":       "520684",
}
count = count + 1
achievements[currIndex] = a

// Map achievement
currIndex = count + 1
a = {
    "title":       "I'm the Map",
    "description": "If there's a place you got to get, a map can get you there, I bet. Find a map to reveal the mission layout",
    "points":      2,
    "trigger":     any_of(
        mapMissions,
        mid => CurrentMission() == mid &&
        prev( countRoomsSeen() ) <= countRoomsSeen() &&
        countRoomsSeen() == 56 // 8 bits * 7 groups = 56 rooms max to play with
    ),
    "type":        "",
    "id":          459953,
    "badge":       "520685",
}
count = count + 1
achievements[currIndex] = a

// VOIDED Win condition achievement
currIndex = count + 1
a = {
    "title":       "[VOID] Beat the Game",
    "description": "Beat every level of the game without using passwords",
    "points":      0,
    "trigger":     always_false(),
    "type":        "",
    "id":          459949,
    "badge":       "520681",
}
count = count + 1
achievements[currIndex] = a

if length( achievements ) == count { // This check is to ensure the amount of achievements I expect when building the order of them
    for index in range( 1, count ) {
        a = achievements[index]
        achievement(
            title       = a["title"],
            description = a["description"],
            points      = a["points"],
            trigger     = a["trigger"],
            type        = a["type"],
            id          = a["id"],
            badge       = a["badge"]
        )
    }
}

// Rich Presence

levelPass = {
    0: "Level 1",
    1: "Level 2",
    2: "Level 3",
    3: "Level 4",
    4: "Level 5",
    5: "Level 6",
    6: "Level 7",
    7: "Level 8",
    8: "Level 9",
    9: "Level 10"
}

currentMission = {
    1:  "Play Pen",
    2:  "Level 1 Mission 1",
    3:  "Level 1 Mission 2",
    4:  "Level 1 Mission 3",
    5:  "Level 2 Mission 1",
    6:  "Level 2 Mission 2",
    7:  "Level 2 Mission 3",
    8:  "Level 3 Mission 1",
    9:  "Level 3 Mission 2",
    10: "Level 3 Mission 3",
    11: "Level 4 Mission 1",
    12: "Level 4 Mission 2",
    13: "Level 4 Mission 3",
    14: "Level 5 Mission 1",
    15: "Level 5 Mission 2",
    16: "Level 5 Mission 3",
    17: "Level 6 Mission 1",
    18: "Level 6 Mission 2",
    19: "Level 6 Mission 3",
    20: "Level 7 Mission 1",
    21: "Level 7 Mission 2",
    22: "Level 7 Mission 3",
    23: "Level 8 Mission 1",
    24: "Level 8 Mission 2",
    25: "Level 8 Mission 3",
    26: "Level 9 Mission 1",
    27: "Level 9 Mission 2",
    28: "Level 9 Mission 3",
    29: "Level 10 Mission 1"
}

singular_lookup = {
    1: ""
}

rich_presence_conditional_display(
    inTitleScreen(),
    "Title Screen"
)

rich_presence_conditional_display(
    inConcertScreen(),
    "Playing in the Hero Academy Concert"
)

rich_presence_conditional_display(
    inMainLobby(),
    "Main Lobby • {0} Star{1} • {2} Lift Pass • #{3} Credit{4}",
    rich_presence_value( "valueFormat", LuckyStars(), "VALUE" ),
    rich_presence_lookup( "singularLookup", LuckyStars(), singular_lookup, "s" ),
    rich_presence_lookup( "liftPassLevel", LiftPassLevel(), levelPass ),
    rich_presence_value( "credits", Credits(), "POINTS" ),
    rich_presence_lookup( "singularLookup", Credits(), singular_lookup, "s" )
)

rich_presence_display(
    "{0} • {1} Heart{2} • {3} Star{4}",
    rich_presence_lookup( "mission", CurrentMission(), currentMission ),
    rich_presence_value( "valueFormat", Health(), "VALUE" ),
    rich_presence_lookup( "singularLookup", Health(), singular_lookup, "s" ),
    rich_presence_value( "valueFormat", LuckyStars(), "VALUE" ),
    rich_presence_lookup( "singularLookup", LuckyStars(), singular_lookup, "s" )
)

// Leaderboards

speedrun = {
    "title":           "Speedrun Monster Max",
    "description":     "Complete the game from start to finish as fast as possible without using passwords",
    "start":           GameStarts(),
    "cancel":          OpenPasswordMenu(),
    "submit":          GameEnds(),
    "value":           tally( 37, deduct( always_true() ) ) && // 60 * 0.61 = ~36.6 frames unavoidable in the start, remove them to start at 0 seconds
                       measured( always_true() ) &&
                       unless( inTitleScreen() ) &&
                       unless( inSelectMenu() ) &&
                       unless( inStartMenu() ),
    "format":          "FRAMES",
    "lower_is_better": true,
    "id":              114798
}
array_push( leaderboards, speedrun )

highScore = {
    "title":           "High Score",
    "description":     "Complete the game from start to finish with the most credits and stars without using passwords",
    "start":           GameStarts(),
    "cancel":          OpenPasswordMenu(),
    "submit":          GameEnds(),
    "value":           Credits() + LuckyStars(),
    "format":          "VALUE",
    "lower_is_better": false,
    "id":              114799
}
array_push( leaderboards, highScore )

for l in leaderboards
{
    leaderboard(
        title           = l["title"],
        description     = l["description"],
        start           = l["start"],
        cancel          = l["cancel"],
        submit          = l["submit"],
        value           = l["value"],
        format          = l["format"],
        lower_is_better = l["lower_is_better"],
        id              = l["id"]
    )
}