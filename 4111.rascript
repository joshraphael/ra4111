// Monster Max
// #ID = 4111

// $CFBF - Current mission
function CurrentMission() => byte( 0xCFBF )

// $D00A: Mission Flags for marking completed missions
function MissionFlags() => dword( 0xD00A )

// $D120: Lucky Star Count
function LuckyStars() => byte( 0xD120 )

// $D122: Health
function Health() => byte( 0xD122 )

// $D128: Lift Pass Level
function LiftPassLevel() => byte( 0xD128 )

// $D129: Number of credits earned
function Credits() => word( 0xD129 )

// $D12E: Idle Timer until Max begins playing guitar
function IdleTimer() => byte( 0xD12E )

// $D3F0 - Password first char
function PasswordChar1() => byte( 0xD3F0 )

// $D3F1 - Password second char
function PasswordChar2() => byte( 0xD3F1 )

// $D3F2 - Password third char
function PasswordChar3() => byte( 0xD3F2 )

// $D3F3 - Password fourth char
function PasswordChar4() => byte( 0xD3F3 )

// $D3F4 - Password fifth char
function PasswordChar5() => byte( 0xD3F4 )

// $D3F5 - Password sixth char
function PasswordChar6() => byte( 0xD3F5 )

// $D3F6 - Password seventh char
function PasswordChar7() => byte( 0xD3F6 )

// $D3F7 - Password eigth char
function PasswordChar8() => byte( 0xD3F7 )

// Doors
CLOSED = 0x00

// Life
DEAD = 0xFF

// Room Level Group Masks
ROOM1MASK = 0x01
ROOM2MASK = 0x02
ROOM3MASK = 0x04
ROOM4MASK = 0x08
ROOM5MASK = 0x10
ROOM6MASK = 0x20
ROOM7MASK = 0x40
ROOM8MASK = 0x80

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
MAINROOMID       = 0x00
PLAYPENID        = 0x01
LEVEL1MISSION1ID = 0x02
LEVEL1MISSION2ID = 0x03
LEVEL1MISSION3ID = 0x04
LEVEL2MISSION1ID = 0x05
LEVEL2MISSION2ID = 0x06
LEVEL2MISSION3ID = 0x07
LEVEL3MISSION1ID = 0x08
LEVEL3MISSION2ID = 0x09
LEVEL3MISSION3ID = 0x0A
LEVEL4MISSION1ID = 0x0B
LEVEL4MISSION2ID = 0x0C
LEVEL4MISSION3ID = 0x0D
LEVEL5MISSION1ID = 0x0E
LEVEL5MISSION2ID = 0x0F
LEVEL5MISSION3ID = 0x10
LEVEL6MISSION1ID = 0x11
LEVEL6MISSION2ID = 0x12
LEVEL6MISSION3ID = 0x13
LEVEL7MISSION1ID = 0x14
LEVEL7MISSION2ID = 0x15
LEVEL7MISSION3ID = 0x16
LEVEL8MISSION1ID = 0x17
LEVEL8MISSION2ID = 0x18
LEVEL8MISSION3ID = 0x19
LEVEL9MISSION1ID = 0x1A
LEVEL9MISSION2ID = 0x1B
LEVEL9MISSION3ID = 0x1C
LEVEL10MISSON1ID = 0x1D
TITLESCREENID    = 0x1E
CONCERTSCREENID  = 0x1F

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

function playerHurt()
{
    // Player loses a star, or heart
    return (
        !inTitleScreen() && !inConcertScreen() && !inMainLobby() &&
        ( prev( LuckyStars() ) == ( LuckyStars() - 1 ) ) ||
        ( prev( Health() ) == ( Health() - 1 ) )
    )
}

function inMainLobby()
{
    return (
        CurrentMission() == MAINROOMID
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

function upgradeLiftPassLevel( prevLevel, newLevel )
{
    return (
        prev( LiftPassLevel() ) == prevLevel &&
        LiftPassLevel() == newLevel
    )
}

function checkMaxStats( stars, credits )
{
    return (
        LuckyStars() <= stars &&
        Credits() <= credits
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

function MissionCompletePerfectCondition( missionId, missionMask, hearts, stars ) 
{
    return tally( 3, [
            once( PlayerEntersMission( missionId ) ),
            once(
                missionMarkedComplete( missionMask ) &&
                onlyMissionUnlocked( missionMask ) &&
                Health() == hearts
            ),
            repeated(stars, LuckyStars() == prev( LuckyStars() ) + 1 )
        ])
}

function GameStarts()
{
    return (
        LiftPassLevel() == 0x00 &&
        Credits() == 0x00 &&
        MissionFlags() == 0x00000000
    )
}

function GameEnds()
{
    return (
        LiftPassLevel() == 0x09 &&
        inConcertScreen()
    )
}

// Normal Mission Achievements

NormalMissionAchievementConfigs = [
    {
        "title":        "Play Pen",
        "description":  "Beat the Play Pen tutorial mission",
        "points":       1,
        "missionId":    PLAYPENID,
        "missionMask":  PLAYPENMASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":                "Big Brain",
        "description":          "Destroy the mind and complete level 1 mission 1",
        "points":               3,
        "missionId":            LEVEL1MISSION1ID,
        "missionMask":          LEVEL1MISSION1MASK,
        "type":                 "",
        "hasChallenge":         true,
        "missionHearts":        5,
        "missionBonus":         3,
        "missionStars":         1,
        "missionGold":          1,
        "challengeTitle":       "Perfect Level 1 Mission 1",
        "challengeDescription": "Take no damage, and collect all stars and hearts in level 1 mission 1",
        "challengePoints":      5,
        "challengeType":        "missable"
    },
    {
        "title":        "Ice Queen",
        "description":  "Collect the ice crown and complete level 1 mission 2",
        "points":       3,
        "missionId":    LEVEL1MISSION2ID,
        "missionMask":  LEVEL1MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Erase The Alchemist",
        "description":  "Destroy the alchemist and complete level 1 mission 3",
        "points":       3,
        "missionId":    LEVEL1MISSION3ID,
        "missionMask":  LEVEL1MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Blind The Enemy",
        "description":  "Destroy the all seeing eye and complete level 2 mission 1",
        "points":       3,
        "missionId":    LEVEL2MISSION1ID,
        "missionMask":  LEVEL2MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Secret Codex",
        "description":  "Read the secret codex and complete level 2 mission 2",
        "points":       3,
        "missionId":    LEVEL2MISSION2ID,
        "missionMask":  LEVEL2MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Liftoff",
        "description":  "Launch the self destructing rocket and complete level 2 mission 3",
        "points":       3,
        "missionId":    LEVEL2MISSION3ID,
        "missionMask":  LEVEL2MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Illuminate The Way",
        "description":  "Find the flashlight and complete level 3 mission 1",
        "points":       3,
        "missionId":    LEVEL3MISSION1ID,
        "missionMask":  LEVEL3MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Circuit Breaker",
        "description":  "Find the electrical control box and complete level 3 mission 2",
        "points":       3,
        "missionId":    LEVEL3MISSION2ID,
        "missionMask":  LEVEL3MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Startup Funds",
        "description":  "Search for the piggy bank and complete level 3 mission 3",
        "points":       3,
        "missionId":    LEVEL3MISSION3ID,
        "missionMask":  LEVEL3MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Time Keeper",
        "description":  "Collect the pocketwatch adn complete level 4 mission 1",
        "points":       3,
        "missionId":    LEVEL4MISSION1ID,
        "missionMask":  LEVEL4MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Food Poisoning",
        "description":  "Get rid of the poisoned food and complete level 4 mission 2",
        "points":       3,
        "missionId":    LEVEL4MISSION2ID,
        "missionMask":  LEVEL4MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Command An Army",
        "description":  "Earn the crown of attack and complete level 4 mission 3",
        "points":       3,
        "missionId":    LEVEL4MISSION3ID,
        "missionMask":  LEVEL4MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Ghost Ship",
        "description":  "Take the ghost ship log and complete level 5 mission 1",
        "points":       3,
        "missionId":    LEVEL5MISSION1ID,
        "missionMask":  LEVEL5MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Talk To The Dead",
        "description":  "Collect the crystal ball and complete level 5 mission 2",
        "points":       3,
        "missionId":    LEVEL5MISSION2ID,
        "missionMask":  LEVEL5MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Keeping Warm",
        "description":  "Use the wood stove and complete level 5 mission 3",
        "points":       3,
        "missionId":    LEVEL5MISSION3ID,
        "missionMask":  LEVEL5MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "In Safe Hands",
        "description":  "Return the safe and complete level 6 mission 1",
        "points":       3,
        "missionId":    LEVEL6MISSION1ID,
        "missionMask":  LEVEL6MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Enchantment",
        "description":  "Smash the potion vial and complete level 6 mission 2",
        "points":       3,
        "missionId":    LEVEL6MISSION2ID,
        "missionMask":  LEVEL6MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Cursed Gem",
        "description":  "Destroy the dark jewel and complete level 6 mission 3",
        "points":       3,
        "missionId":    LEVEL6MISSION3ID,
        "missionMask":  LEVEL6MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "POP!",
        "description":  "Earn the fizzy soda prize and complete level 7 mission 1",
        "points":       3,
        "missionId":    LEVEL7MISSION1ID,
        "missionMask":  LEVEL7MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Waiting For A Call",
        "description":  "Collect the phone and complete level 7 Mission 2",
        "points":       3,
        "missionId":    LEVEL7MISSION2ID,
        "missionMask":  LEVEL7MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "S.O.S",
        "description":  "Release the captive voyager and complete level 7 mission 3",
        "points":       3,
        "missionId":    LEVEL7MISSION3ID,
        "missionMask":  LEVEL7MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "K9 Companion",
        "description":  "Rescue the dog and complete level 8 mission 1",
        "points":       3,
        "missionId":    LEVEL8MISSION1ID,
        "missionMask":  LEVEL8MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Fast Getaway",
        "description":  "Find and flee with the amphora jar when completing level 8 mission 2",
        "points":       3,
        "missionId":    LEVEL8MISSION2ID,
        "missionMask":  LEVEL8MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Piece Of Cake",
        "description":  "Eat the triple decker cake and complete level 8 Mission 3",
        "points":       3,
        "missionId":    LEVEL8MISSION3ID,
        "missionMask":  LEVEL8MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Hacking The Mainframe",
        "description":  "Destroy the computer system and complete level 9 mission 1",
        "points":       3,
        "missionId":    LEVEL9MISSION1ID,
        "missionMask":  LEVEL9MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Infestation",
        "description":  "Smash open the jar of insects and complete level 9 mission 2",
        "points":       3,
        "missionId":    LEVEL9MISSION2ID,
        "missionMask":  LEVEL9MISSION2MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "Home Sweet Home",
        "description":  "Find a new home and complete level 9 mission 3",
        "points":       3,
        "missionId":    LEVEL9MISSION3ID,
        "missionMask":  LEVEL9MISSION3MASK,
        "type":         "",
        "hasChallenge": false,
    },
    {
        "title":        "King Krond",
        "description":  "Defeat Krond and save the Mega Hero Academy in level 10",
        "points":       10,
        "missionId":    LEVEL10MISSON1ID,
        "missionMask":  LEVEL10MISSION1MASK,
        "type":         "",
        "hasChallenge": false,
    }
]

for config in NormalMissionAchievementConfigs
{
    achievement(
        title = config["title"],
        description = config["description"],
        points = config["points"],
        trigger = measured(
            MissionCompleteCondition(
                config["missionId"],
                config["missionMask"]
            )
        ) &&
        never( OpenPasswordMenu() ) &&
        never( PlayerQuitsMission( config["missionId"] ) ) &&
        never( PlayerDies() ),
        type = config["type"]
    )
    if ( config["hasChallenge"] ) {
        achievement(
            title = config["challengeTitle"],
            description = config["challengeDescription"],
            points = config["challengePoints"],
            trigger = measured(
                MissionCompletePerfectCondition(
                    config["missionId"],
                    config["missionMask"],
                    config["missionHearts"],
                    config["missionStars"]
                )
            ) &&
            never( playerHurt() ) &&
            never( OpenPasswordMenu() ) &&
            never( PlayerDies() ) &&
            never( PlayerQuitsMission( config["missionId"] ) ),
            type = config["challengeType"]
        )
    }
}

// Progression Level Achievements

achievement(
    title = "Complete Level 1",
    description = "Complete level 1 and buy the lift pass for level 2",
    points = 10,
    trigger = measured(
        tally(2,
            once( GameStarts() ),
            once( upgradeLiftPassLevel( LEVEL1, LEVEL2 ) )
        )
    ) &&
    never( OpenPasswordMenu() )
)

LevelProgressionAchievementConfigs = [
    {
        "title":       "Complete Level 2",
        "description": "Complete level 2 and buy the lift pass for level 3",
        "prevLevel":   LEVEL1,
        "currLevel":   LEVEL2,
        "nextLevel":   LEVEL3,
        "type":        "progression",
    },
    {
        "title":       "Complete Level 3",
        "description": "Complete level 3 and buy the lift pass for level 4",
        "prevLevel":   LEVEL2,
        "currLevel":   LEVEL3,
        "nextLevel":   LEVEL4,
        "type":        "progression",
    },
    {
        "title":       "Complete Level 4",
        "description": "Complete level 4 and buy the lift pass for level 5",
        "prevLevel":   LEVEL3,
        "currLevel":   LEVEL4,
        "nextLevel":   LEVEL5,
        "type":        "progression",
    },
    {
        "title":       "Complete Level 5",
        "description": "Complete level 5 and buy the lift pass for level 6",
        "prevLevel":   LEVEL4,
        "currLevel":   LEVEL5,
        "nextLevel":   LEVEL6,
        "type":        "progression",
    },
    {
        "title":       "Complete Level 6",
        "description": "Complete level 6 and buy the lift pass for level 7",
        "prevLevel":   LEVEL5,
        "currLevel":   LEVEL6,
        "nextLevel":   LEVEL7,
        "type":        "progression",
    },
    {
        "title":       "Complete Level 7",
        "description": "Complete level 7 and buy the lift pass for level 8",
        "prevLevel":   LEVEL6,
        "currLevel":   LEVEL7,
        "nextLevel":   LEVEL8,
        "type":        "progression",
    },
    {
        "title":       "Complete Level 8",
        "description": "Complete level 8 and buy the lift pass for level 9",
        "prevLevel":   LEVEL7,
        "currLevel":   LEVEL8,
        "nextLevel":   LEVEL9,
        "type":        "progression",
    },
    {
        "title":       "Complete Level 9",
        "description": "Complete level 9 and buy the lift pass for level 10",
        "prevLevel":   LEVEL8,
        "currLevel":   LEVEL9,
        "nextLevel":   LEVEL10,
        "type":        "progression",
    }
]

for config in LevelProgressionAchievementConfigs
{
    achievement(
        title = config["title"],
        description = config["description"],
        points = 10,
        trigger = measured(
            tally(2,
                once( upgradeLiftPassLevel( config["prevLevel"], config["currLevel"] ) ),
                once( upgradeLiftPassLevel( config["currLevel"], config["nextLevel"] ) )
            )
        ) &&
        never( OpenPasswordMenu() ),
        type = config["type"]
    )
}

achievement(
    title = "Beat the Game",
    description = "Beat every level of the game without passwords in one session",
    points = 50,
    trigger = measured(
        tally(2,
            once( GameStarts() ),
            once( GameEnds() )
        )
    ) &&
    never( OpenPasswordMenu() ),
    type = "win_condition"
)

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
    "Main Lobby | ⭐ {0} | 🎟 {1} | 💰 #{2}",
    rich_presence_value( "Lucky Stars", LuckyStars() ),
    rich_presence_lookup( "Lift Pass Level", LiftPassLevel(), levelPass ),
    rich_presence_value( "Credits", Credits() )
)
rich_presence_display("🎮 {0} | ❤️ {1} | ⭐ {2}",
    rich_presence_lookup( "Mission", CurrentMission(), currentMission ),
    rich_presence_value( "Health", Health() ),
    rich_presence_value( "Lucky Stars", LuckyStars() )
)

// Leaderboards

leaderboard(
    title = "Speedrun",
    description = "Complete the game from start to finish as fast as possible without using passwords",
    start = (
        prev( CurrentMission() ) == TITLESCREENID
    ) && (
        CurrentMission() == MAINROOMID
    ) &&
    GameStarts(),
    cancel = OpenPasswordMenu(),
    submit = prev( CurrentMission() ) == LEVEL10MISSON1ID && CurrentMission() == CONCERTSCREENID,
    value = measured( always_true() ) && unless( inTitleScreen() || inConcertScreen() ),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = "High Score",
    description = "Complete the game from start to finish with the most credits and stars without using passwords",
    start = (
        prev( CurrentMission() ) == TITLESCREENID
    ) && (
        CurrentMission() == MAINROOMID
    ) &&
    GameStarts(),
    cancel = OpenPasswordMenu(),
    submit = GameEnds(),
    value = Credits() + LuckyStars(),
    format = "VALUE",
    lower_is_better = false
)