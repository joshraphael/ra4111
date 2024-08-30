// Monster Max
// #ID = 4111

// $C006 - Start Menu
function StartMenu() => word(0xc006)

// $C009 - Select Menu
function SelectMenu() => high4(0xc009)

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

// $D3F0 - Password first char
function PasswordChar1() => byte( 0xd3f0 )

// $D3F1 - Password second char
function PasswordChar2() => byte( 0xd3f1 )

// $D3F2 - Password third char
function PasswordChar3() => byte( 0xd3f2 )

// $D3F3 - Password fourth char
function PasswordChar4() => byte( 0xd3f3 )

// $D3F4 - Password fifth char
function PasswordChar5() => byte( 0xd3f4 )

// $D3F5 - Password sixth char
function PasswordChar6() => byte( 0xd3f5 )

// $D3F6 - Password seventh char
function PasswordChar7() => byte( 0xd3f6 )

// $D3F7 - Password eigth char
function PasswordChar8() => byte( 0xd3f7 )

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
        "id":   LEVEL1,
        "cost": 0
    },
    2: {
        "id":   LEVEL2,
        "cost": 70
    },
    3: {
        "id":   LEVEL3,
        "cost": 130
    },
    4: {
        "id":   LEVEL4,
        "cost": 200
    },
    5: {
        "id":   LEVEL5,
        "cost": 300
    },
    6: {
        "id":   LEVEL6,
        "cost": 450
    },
    7: {
        "id":   LEVEL7,
        "cost": 650
    },
    8: {
        "id":   LEVEL8,
        "cost": 1000
    },
    9: {
        "id":   LEVEL9,
        "cost": 1500
    },
    10: {
        "id":   LEVEL10,
        "cost": 2500
    },
}

achievements = {}

// private functions

function missionMarkedComplete( missionMask )
{
    // Mission is marked complete and it was previously closed
    return (
        ( ( MissionFlags() & missionMask ) == missionMask ) &&
        ( ( prev( MissionFlags() ) & missionMask ) == CLOSED )
    )
}

function onlyMissionUnlocked( missionMask )
{
    return (
        MissionFlags() == ( prev( MissionFlags() ) + missionMask )
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

function countMissionRoomsAvailable()
{
    return (
        MissionRoomsAvailableGroup1() +
        MissionRoomsAvailableGroup2() +
        MissionRoomsAvailableGroup3() +
        MissionRoomsAvailableGroup4() +
        MissionRoomsAvailableGroup5() +
        MissionRoomsAvailableGroup6() +
        MissionRoomsAvailableGroup7()
    )
}

// public functions

function OpenPasswordMenu()
{
    return (
        prev( PasswordChar1() ) != 0xFF && PasswordChar1() == 0xFF &&
        prev( PasswordChar2() ) != 0xFF && PasswordChar2() == 0xFF &&
        prev( PasswordChar3() ) != 0xFF && PasswordChar3() == 0xFF &&
        prev( PasswordChar4() ) != 0xFF && PasswordChar4() == 0xFF &&
        prev( PasswordChar5() ) != 0xFF && PasswordChar5() == 0xFF &&
        prev( PasswordChar6() ) != 0xFF && PasswordChar6() == 0xFF &&
        prev( PasswordChar7() ) != 0xFF && PasswordChar7() == 0xFF &&
        prev( PasswordChar8() ) != 0xFF && PasswordChar8() == 0xFF
    )
}

function PlayerDies()
{
    return (
        prev( Health() ) != DEAD &&
        Health() == DEAD
    )
}

function PlayerQuitsMission( missionId )
{
    return (
        prev( CurrentMission() ) == missionId &&
        CurrentMission() != missionId
    )
}

function PlayerEntersMission( missionId )
{
    return (
        prev( CurrentMission() ) == MAINROOMID &&
        CurrentMission() == missionId
    )
}

function MissionCompleteCondition( missionId, missionMask ) 
{
    return tally( 2,
        once( PlayerEntersMission( missionId ) ),
        once(
            missionMarkedComplete( missionMask ) &&
            onlyMissionUnlocked( missionMask )
        )
    )
}

function MissionCompletePerfectCondition( missionId, missionMask, hearts, stars, bonus, gold ) 
{
    conditions = [
        once( PlayerEntersMission( missionId ) ),
        once(
            missionMarkedComplete( missionMask ) &&
            onlyMissionUnlocked( missionMask ) &&
            Health() == hearts &&
            Bonus() == ( gold * bonus )
        )
    ]
    if stars > 0 {
        array_push( conditions, repeated( stars, LuckyStars() == prev( LuckyStars() ) + 1 ) )
    }
    return tally(
        2 + stars,
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
        "points":          1,
        "missionId":       PLAYPENID,
        "missionMask":     PLAYPENMASK,
        "hasChallenge":    false,
        "raID":            459884,
        "raBadge":         520616
    },
    {
        "index":            2,
        "level":            1,
        "mission":          1,
        "title":            "Big Brain",
        "description":      "Destroy the mind",
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
        "points":           3,
        "raID":             459885,
        "raBadge":          520617,
        "hasChallenge":     true,
        "challengePoints":  5,
        "challengeRAID":    459886,
        "challengeRABadge": 520618
    },
    {
        "index":           4,
        "level":           1,
        "mission":         2,
        "title":           "Ice Queen",
        "description":     "Steal the Ice Queen's crown",
        "reward":          30,
        "startingHearts":  4,
        "bonus":           3,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           1,
        "lightning":       0,
        "powerSpring":     1,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL1MISSION2ID,
        "missionMask":     LEVEL1MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           6,
        "level":           1,
        "mission":         3,
        "title":           "Erase the Alchemist",
        "description":     "Destroy the alchemist",
        "reward":          45,
        "startingHearts":  4,
        "bonus":           3,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           2,
        "lightning":       2,
        "powerSpring":     0,
        "powerRing":       1,
        "map":             1,
        "missionId":       LEVEL1MISSION3ID,
        "missionMask":     LEVEL1MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           9,
        "level":           2,
        "mission":         1,
        "title":           "Blind the Enemy",
        "description":     "Destroy the all seeing eye",
        "reward":          45,
        "startingHearts":  4,
        "bonus":           7,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           2,
        "lightning":       1,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             1,
        "missionId":       LEVEL2MISSION1ID,
        "missionMask":     LEVEL2MISSION1MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           11,
        "level":           2,
        "mission":         2,
        "title":           "Secret Codex",
        "description":     "Read the secret code",
        "reward":          40,
        "startingHearts":  4,
        "bonus":           7,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           3,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL2MISSION2ID,
        "missionMask":     LEVEL2MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           13,
        "level":           2,
        "mission":         3,
        "title":           "Liftoff",
        "description":     "Launch the self destructing rocket",
        "reward":          65,
        "startingHearts":  4,
        "bonus":           7,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           0,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL2MISSION3ID,
        "missionMask":     LEVEL2MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           16,
        "level":           3,
        "mission":         1,
        "title":           "Illuminate The Way",
        "description":     "Find the flashlight",
        "reward":          70,
        "startingHearts":  4,
        "bonus":           10,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           2,
        "lightning":       1,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             1,
        "missionId":       LEVEL3MISSION1ID,
        "missionMask":     LEVEL3MISSION1MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           18,
        "level":           3,
        "mission":         2,
        "title":           "Circuit Breaker",
        "description":     "Find the electrical control box",
        "reward":          60,
        "startingHearts":  4,
        "bonus":           10,
        "inGameHearts":    1,
        "gold":            2,
        "stars":           3,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL3MISSION2ID,
        "missionMask":     LEVEL3MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           20,
        "level":           3,
        "mission":         3,
        "title":           "Startup Funds",
        "description":     "Search for the piggy bank",
        "reward":          100,
        "startingHearts":  4,
        "bonus":           10,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           2,
        "lightning":       1,
        "powerSpring":     1,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL3MISSION3ID,
        "missionMask":     LEVEL3MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           23,
        "level":           4,
        "mission":         1,
        "title":           "Time Keeper",
        "description":     "Collect the pocketwatch",
        "reward":          100,
        "startingHearts":  4,
        "bonus":           15,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           0,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL4MISSION1ID,
        "missionMask":     LEVEL4MISSION1MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           25,
        "level":           4,
        "mission":         2,
        "title":           "Food Poisoning",
        "description":     "Get rid of the poisoned food",
        "reward":          100,
        "startingHearts":  4,
        "bonus":           15,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           1,
        "lightning":       1,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL4MISSION2ID,
        "missionMask":     LEVEL4MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           27,
        "level":           4,
        "mission":         3,
        "title":           "Command an Army",
        "description":     "Earn the crown of attack",
        "reward":          150,
        "startingHearts":  3,
        "bonus":           15,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           1,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             1,
        "missionId":       LEVEL4MISSION3ID,
        "missionMask":     LEVEL4MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           30,
        "level":           5,
        "mission":         1,
        "title":           "Ghost Ship",
        "description":     "Take the ghost ship wood log",
        "reward":          150,
        "startingHearts":  4,
        "bonus":           20,
        "inGameHearts":    1,
        "gold":            2,
        "stars":           1,
        "lightning":       1,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL5MISSION1ID,
        "missionMask":     LEVEL5MISSION1MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           32,
        "level":           5,
        "mission":         2,
        "title":           "Talk to the Dead",
        "description":     "Collect the crystal ball",
        "reward":          200,
        "startingHearts":  3,
        "bonus":           20,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           1,
        "lightning":       0,
        "powerSpring":     1,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL5MISSION2ID,
        "missionMask":     LEVEL5MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           34,
        "level":           5,
        "mission":         3,
        "title":           "Keeping Warm",
        "description":     "Use the wood stove",
        "reward":          300,
        "startingHearts":  3,
        "bonus":           20,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           1,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL5MISSION3ID,
        "missionMask":     LEVEL5MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           37,
        "level":           6,
        "mission":         1,
        "title":           "In Safe Hands",
        "description":     "Return the safe",
        "reward":          275,
        "startingHearts":  3,
        "bonus":           30,
        "inGameHearts":    0,
        "gold":            1,
        "stars":           0,
        "lightning":       5,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL6MISSION1ID,
        "missionMask":     LEVEL6MISSION1MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           39,
        "level":           6,
        "mission":         2,
        "title":           "Enchantment",
        "description":     "Smash the potion vial",
        "reward":          300,
        "startingHearts":  3,
        "bonus":           30,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           0,
        "lightning":       3,
        "powerSpring":     0,
        "powerRing":       1,
        "map":             1,
        "missionId":       LEVEL6MISSION2ID,
        "missionMask":     LEVEL6MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           41,
        "level":           6,
        "mission":         3,
        "title":           "Cursed Gem",
        "description":     "Destroy the dark jewel",
        "reward":          450,
        "startingHearts":  3,
        "bonus":           30,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           1,
        "lightning":       0,
        "powerSpring":     1,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL6MISSION3ID,
        "missionMask":     LEVEL6MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           44,
        "level":           7,
        "mission":         1,
        "title":           "POP!",
        "description":     "Earn the fizzy soda prize",
        "reward":          450,
        "startingHearts":  3,
        "bonus":           42,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           4,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL7MISSION1ID,
        "missionMask":     LEVEL7MISSION1MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           46,
        "level":           7,
        "mission":         2,
        "title":           "Waiting for a Call",
        "description":     "Collect the phone",
        "reward":          450,
        "startingHearts":  3,
        "bonus":           42,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           3,
        "lightning":       1,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL7MISSION2ID,
        "missionMask":     LEVEL7MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           48,
        "level":           7,
        "mission":         3,
        "title":           "S.O.S",
        "description":     "Release the captive voyager",
        "reward":          600,
        "startingHearts":  2,
        "bonus":           42,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           3,
        "lightning":       0,
        "powerSpring":     1,
        "powerRing":       1,
        "map":             0,
        "missionId":       LEVEL7MISSION3ID,
        "missionMask":     LEVEL7MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           51,
        "level":           8,
        "mission":         1,
        "title":           "K9 Companion",
        "description":     "Rescue the dog",
        "reward":          650,
        "startingHearts":  3,
        "bonus":           60,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           1,
        "lightning":       16,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL8MISSION1ID,
        "missionMask":     LEVEL8MISSION1MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           53,
        "level":           8,
        "mission":         2,
        "title":           "Fast Getaway",
        "description":     "Find and flee with the amphora jar",
        "reward":          650,
        "startingHearts":  2,
        "bonus":           60,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           3,
        "lightning":       1,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL8MISSION2ID,
        "missionMask":     LEVEL8MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           55,
        "level":           8,
        "mission":         3,
        "title":           "Piece of Cake",
        "description":     "Eat the triple decker cake",
        "reward":          850,
        "startingHearts":  2,
        "bonus":           60,
        "inGameHearts":    1,
        "gold":            1,
        "stars":           5,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL8MISSION3ID,
        "missionMask":     LEVEL8MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           58,
        "level":           9,
        "mission":         1,
        "title":           "Hacking the Mainframe",
        "description":     "Destroy the computer system",
        "reward":          900,
        "startingHearts":  2,
        "bonus":           90,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           5,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             0,
        "missionId":       LEVEL9MISSION1ID,
        "missionMask":     LEVEL9MISSION1MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           60,
        "level":           9,
        "mission":         2,
        "title":           "Infestation",
        "description":     "Smash open the jar of insects",
        "reward":          800,
        "startingHearts":  2,
        "bonus":           90,
        "inGameHearts":    1,
        "gold":            2,
        "stars":           3,
        "lightning":       1,
        "powerSpring":     0,
        "powerRing":       1,
        "map":             0,
        "missionId":       LEVEL9MISSION2ID,
        "missionMask":     LEVEL9MISSION2MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           62,
        "level":           9,
        "mission":         3,
        "title":           "Home Sweet Home",
        "description":     "Find a new home",
        "reward":          1100,
        "startingHearts":  2,
        "bonus":           90,
        "inGameHearts":    1,
        "gold":            0,
        "stars":           1,
        "lightning":       0,
        "powerSpring":     0,
        "powerRing":       0,
        "map":             1,
        "missionId":       LEVEL9MISSION3ID,
        "missionMask":     LEVEL9MISSION3MASK,
        "points":          3,
        "hasChallenge":    true,
        "challengePoints": 5,
    },
    {
        "index":           65,
        "level":           10,
        "mission":         1,
        "title":           "King Krond",
        "description":     "Defeat Krond and save the Mega Hero Academy!",
        "reward":          3500,
        "startingHearts":  3,
        "bonus":           120,
        "inGameHearts":    4,
        "gold":            0,
        "stars":           1,
        "lightning":       2,
        "powerSpring":     1,
        "powerRing":       1,
        "map":             0,
        "missionId":       LEVEL10MISSION1ID,
        "missionMask":     LEVEL10MISSION1MASK,
        "points":          10,
        "hasChallenge":    false
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
        levelAchievement = {
            "title":       format("Complete Level {0}", currentLevel),
            "description": format("Complete level {0} and buy the lift pass for level {1} in one session", currentLevel, config["level"]),
            "points":      10,
            "trigger":     measured(
                tally(2,
                    once( GameStarts() ),
                    once( upgradeLiftPassLevel( levelLookup[currentLevel]["id"], levelLookup[config["level"]]["id"], levelLookup[config["level"]]["cost"] ) )
                )
            ) &&
            never( OpenPasswordMenu() ),
            "type":        "progression"
        }
        count = count + 1
        achievements[levelIndex] = levelAchievement
        currentLevel = config["level"]
    }
    
    // Standard mission completion achievements
    currIndex = config["index"]  
    desc = format( "{0} and complete level {1} mission {2}", config["description"], config["level"], config["mission"])
    leaderboardTitle = format( "Speedrun Level {0} Mission {1}", config["level"], config["mission"] )
    leaderboardDescription = format( "Complete level {0} mission {1} from start to finish as fast as possible without using passwords", config["level"], config["mission"] )
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
        "trigger":     measured(
            MissionCompleteCondition(
                config["missionId"],
                config["missionMask"]
            )
        ) &&
        never( OpenPasswordMenu() ) &&
        never( PlayerQuitsMission( config["missionId"] ) ) &&
        never( PlayerDies() ),
        "type":        ""
    }
    achievements[currIndex] = a
    count = count + 1
    
    // Missable challenge mission achievements
    if config["hasChallenge"] {
        currIndex = currIndex + 1
        items = ""
        if config["inGameHearts"] > 0 || config["gold"] > 0 || config["stars"] > 0 {
            items = " and collect "
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
            "title":       format("Perfect Level {0} Mission {1}", config["level"], config["mission"]),
            "description": format("Take no damage{0} all while completing level {1} mission {2}", items, config["level"], config["mission"]),
            "points":      config["challengePoints"],
            "trigger":     measured(
                MissionCompletePerfectCondition(
                    config["missionId"],
                    config["missionMask"],
                    config["startingHearts"] + config["inGameHearts"],
                    config["stars"],
                    config["bonus"],
                    config["gold"]
                )
            ) &&
            never( OpenPasswordMenu() ) &&
            never( PlayerDies() ) &&
            never( PlayerQuitsMission( config["missionId"] ) ) &&
            never( PlayerHurt() ),
            "type":        "missable"
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
        "start":           PlayerEntersMission( config["missionId"] ),
        "cancel":          ( OpenPasswordMenu() || PlayerDies() ) ,
        "submit":          missionMarkedComplete( config["missionMask"] ) && onlyMissionUnlocked( config["missionMask"] ),
        "value":           measured( always_true() ) &&
                           unless( inSelectMenu() ) &&
                           unless( inStartMenu() ),
        "format":          "FRAMES",
        "lower_is_better": true
    }
    array_push( leaderboards, l )
}

// Win condition achievement
currIndex = count + 1
a = {
    "title":       "Beat the Game",
    "description": "Beat every level of the game without passwords in one session",
    "points":      50,
    "trigger":     measured(
        tally(2,
            once( GameStarts() ),
            once( GameEnds() )
        )
    ) &&
    never( OpenPasswordMenu() ),
    "type":        "win_condition"
}
count = count + 1
achievements[currIndex] = a

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
        prev( SpeedBoost() ) + 0x20 == SpeedBoost()
    ),
    "type":        ""
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
    "type":        ""
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
        prev( PowerRing() ) + 0x20 == PowerRing()
    ),
    "type":        ""
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
        prev( countRoomsSeen() ) <= countMissionRoomsAvailable() &&
        countRoomsSeen() == 56 // 8 bits * 7 groups = 56 rooms max to play with
    ),
    "type":        ""
}
count = count + 1
achievements[currIndex] = a

if length( achievements ) == count { // This check is to ensure the amount of achievements I expect when building the order of them
    for index in range( 1, count ) {
        a = achievements[index]
        achievement(
            title = a["title"],
            description = a["description"],
            points = a["points"],
            trigger = a["trigger"],
            type = a["type"]
        )
    }
}

// Rich Presence

levelPass = {
    0: "Lvl 1",
    1: "Lvl 2",
    2: "Lvl 3",
    3: "Lvl 4",
    4: "Lvl 5",
    5: "Lvl 6",
    6: "Lvl 7",
    7: "Lvl 8",
    8: "Lvl 9",
    9: "Lvl 10"
}

currentMission = {
    1:  "Play Pen",
    2:  "Lvl 1 Mission 1",
    3:  "Lvl 1 Mission 2",
    4:  "Lvl 1 Mission 3",
    5:  "Lvl 2 Mission 1",
    6:  "Lvl 2 Mission 2",
    7:  "Lvl 2 Mission 3",
    8:  "Lvl 3 Mission 1",
    9:  "Lvl 3 Mission 2",
    10: "Lvl 3 Mission 3",
    11: "Lvl 4 Mission 1",
    12: "Lvl 4 Mission 2",
    13: "Lvl 4 Mission 3",
    14: "Lvl 5 Mission 1",
    15: "Lvl 5 Mission 2",
    16: "Lvl 5 Mission 3",
    17: "Lvl 6 Mission 1",
    18: "Lvl 6 Mission 2",
    19: "Lvl 6 Mission 3",
    20: "Lvl 7 Mission 1",
    21: "Lvl 7 Mission 2",
    22: "Lvl 7 Mission 3",
    23: "Lvl 8 Mission 1",
    24: "Lvl 8 Mission 2",
    25: "Lvl 8 Mission 3",
    26: "Lvl 9 Mission 1",
    27: "Lvl 9 Mission 2",
    28: "Lvl 9 Mission 3",
    29: "Lvl 10 Mission 1"
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
    "Main Lobby • ⭐ {0} • 🎫 {1} • 💰 #{2}",
    rich_presence_value( "Lucky Stars", LuckyStars() ),
    rich_presence_lookup( "Lift Pass Level", LiftPassLevel(), levelPass ),
    rich_presence_value( "Credits", Credits() )
)
rich_presence_display(
    "🎮 {0} • ❤️ {1} • ⭐ {2}",
    rich_presence_lookup( "Mission", CurrentMission(), currentMission ),
    rich_presence_value( "Health", Health() ),
    rich_presence_value( "Lucky Stars", LuckyStars() )
)

// Leaderboards

speedrun = {
    "title":           "Speedrun Monster Max",
    "description":     "Complete the game from start to finish as fast as possible without using passwords",
    "start":           GameStarts(),
    "cancel":          OpenPasswordMenu(),
    "submit":          GameEnds(),
    "value":           measured( always_true() ) &&
                       unless( inTitleScreen() ) &&
                       unless( inSelectMenu() ) &&
                       unless( inStartMenu() ),
    "format":          "FRAMES",
    "lower_is_better": true
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
    "lower_is_better": false
}
array_push( leaderboards, highScore )

for l in leaderboards
{
    leaderboard(
        title       = l["title"],
        description = l["description"],
        start = l["start"],
        cancel = l["cancel"],
        submit = l["submit"],
        value = l["value"],
        format = l["format"],
        lower_is_better = l["lower_is_better"]
    )
}