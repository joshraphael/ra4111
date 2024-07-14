// Monster Max
// #ID = 4111

// $CFBF - Current mission
function CurrentMission() => byte( 0xCFBF )

// $D00A: Level Group 1
function LevelGroup1() => byte( 0xD00A )

// $D00B: Level Group 2
function LevelGroup2() => byte( 0xD00B )

// $D00C: Level Group 3
function LevelGroup3() => byte( 0xD00C )

// $D00D: Level Group 4
function LevelGroup4() => byte( 0xD00D )

// $D120: Lucky Star Count
function LuckyStars() => byte( 0xD120 )

// $D122: Health
function Health() => byte( 0xD122 )

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

// $D128: Lift Pass Level
function LiftPassLevel() => byte( 0xD128 )

// $D12A: Money high value
function MoneyHigh() => byte( 0xD12A )

// $D129: Money low value
function MoneyLow() => byte( 0xD129 )

// Doors
CLOSED = 0x00
DEAD   = 0xFF

// Room Level Group Masks
ROOM1MASK = 0x01
ROOM2MASK = 0x02
ROOM3MASK = 0x04
ROOM4MASK = 0x08
ROOM5MASK = 0x10
ROOM6MASK = 0x20
ROOM7MASK = 0x40
ROOM8MASK = 0x80

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

// private functions

function missionMarkedComplete( group, missionMask )
{
    // Mission is marked complete and it was previously closed
    return (
        ( ( group & missionMask ) == missionMask ) &&
        ( ( prev( group ) & missionMask ) == CLOSED )
    )
}

function onlyMissionUnlocked( group, missionMask, unchangedGroup1, unchangedGroup2, unchangedGroup3 )
{
    return (
        group == ( prev( group ) + missionMask ) &&
        unchangedGroup1 == prev( unchangedGroup1 ) &&
        unchangedGroup2 == prev( unchangedGroup2 ) &&
        unchangedGroup3 == prev( unchangedGroup3 )
    )
}

function inMainLobby()
{
    return (
        CurrentMission() == MAINROOMID
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

function PlayerEntersMission( missionId )
{
    return (
        prev( CurrentMission() ) == MAINROOMID &&
        CurrentMission() == missionId
    )
}

function MissionCompleteCondition( missionId, roomMask, mainGroup, secondaryGroup1, secondaryGroup2, secondaryGroup3 ) 
{
    return tally( 2,
            once( PlayerEntersMission( missionId ) ),
            once(
                missionMarkedComplete( mainGroup, roomMask ) &&
                onlyMissionUnlocked( mainGroup, roomMask, secondaryGroup1, secondaryGroup2, secondaryGroup3 )
            )
        )
}

function GameStarts()
{
    return (
        LiftPassLevel() == 0x00 &&
        MoneyHigh() == 0x00 &&
        MoneyLow() == 0x00 &&
        LevelGroup1() == 0x00 &&
        LevelGroup2() == 0x00 &&
        LevelGroup3() == 0x00 &&
        LevelGroup4() == 0x00
    )
}

function GameEnds()
{
    return (
        LiftPassLevel() == 0x09 &&
        LevelGroup1() == 0xFF &&
        LevelGroup2() == 0xFF &&
        LevelGroup3() == 0xFF &&
        LevelGroup4() == 0x1F
    )
}

// Achievements

Configs = [
    {
        "title":           "PlayPen",
        "description":     "Beat the PlayPen mission",
        "points":          1,
        "missionId":       PLAYPENID,
        "mainGroup":       LevelGroup1(),
        "mainGroupMask":   ROOM1MASK,
        "secondaryGroup1": LevelGroup2(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 1 Mission 1",
        "description":     "Beat Level 1 Mission 1",
        "points":          2,
        "missionId":       LEVEL1MISSION1ID,
        "mainGroup":       LevelGroup1(),
        "mainGroupMask":   ROOM2MASK,
        "secondaryGroup1": LevelGroup2(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 1 Mission 2",
        "description":     "Beat Level 1 Mission 2",
        "points":          2,
        "missionId":       LEVEL1MISSION2ID,
        "mainGroup":       LevelGroup1(),
        "mainGroupMask":   ROOM3MASK,
        "secondaryGroup1": LevelGroup2(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 1 Mission 3",
        "description":     "Beat Level 1 Mission 3",
        "points":          2,
        "missionId":       LEVEL1MISSION3ID,
        "mainGroup":       LevelGroup1(),
        "mainGroupMask":   ROOM4MASK,
        "secondaryGroup1": LevelGroup2(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 2 Mission 1",
        "description":     "Beat Level 2 Mission 1",
        "points":          2,
        "missionId":       LEVEL2MISSION1ID,
        "mainGroup":       LevelGroup1(),
        "mainGroupMask":   ROOM5MASK,
        "secondaryGroup1": LevelGroup2(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 2 Mission 2",
        "description":     "Beat Level 2 Mission 2",
        "points":          2,
        "missionId":       LEVEL2MISSION2ID,
        "mainGroup":       LevelGroup1(),
        "mainGroupMask":   ROOM6MASK,
        "secondaryGroup1": LevelGroup2(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 2 Mission 3",
        "description":     "Beat Level 2 Mission 3",
        "points":          2,
        "missionId":       LEVEL2MISSION3ID,
        "mainGroup":       LevelGroup1(),
        "mainGroupMask":   ROOM7MASK,
        "secondaryGroup1": LevelGroup2(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 3 Mission 1",
        "description":     "Beat Level 3 Mission 1",
        "points":          2,
        "missionId":       LEVEL3MISSION1ID,
        "mainGroup":       LevelGroup1(),
        "mainGroupMask":   ROOM8MASK,
        "secondaryGroup1": LevelGroup2(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 3 Mission 2",
        "description":     "Beat Level 3 Mission 2",
        "points":          2,
        "missionId":       LEVEL3MISSION2ID,
        "mainGroup":       LevelGroup2(),
        "mainGroupMask":   ROOM1MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 3 Mission 3",
        "description":     "Beat Level 3 Mission 3",
        "points":          2,
        "missionId":       LEVEL3MISSION3ID,
        "mainGroup":       LevelGroup2(),
        "mainGroupMask":   ROOM2MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 4 Mission 1",
        "description":     "Beat Level 4 Mission 1",
        "points":          2,
        "missionId":       LEVEL4MISSION1ID,
        "mainGroup":       LevelGroup2(),
        "mainGroupMask":   ROOM3MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 4 Mission 2",
        "description":     "Beat Level 4 Mission 2",
        "points":          2,
        "missionId":       LEVEL4MISSION2ID,
        "mainGroup":       LevelGroup2(),
        "mainGroupMask":   ROOM4MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 4 Mission 3",
        "description":     "Beat Level 4 Mission 3",
        "points":          2,
        "missionId":       LEVEL4MISSION3ID,
        "mainGroup":       LevelGroup2(),
        "mainGroupMask":   ROOM5MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 5 Mission 1",
        "description":     "Beat Level 5 Mission 1",
        "points":          2,
        "missionId":       LEVEL5MISSION1ID,
        "mainGroup":       LevelGroup2(),
        "mainGroupMask":   ROOM6MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 5 Mission 2",
        "description":     "Beat Level 5 Mission 2",
        "points":          2,
        "missionId":       LEVEL5MISSION2ID,
        "mainGroup":       LevelGroup2(),
        "mainGroupMask":   ROOM7MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 5 Mission 3",
        "description":     "Beat Level 5 Mission 3",
        "points":          2,
        "missionId":       LEVEL5MISSION3ID,
        "mainGroup":       LevelGroup2(),
        "mainGroupMask":   ROOM8MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup3(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 6 Mission 1",
        "description":     "Beat Level 6 Mission 1",
        "points":          2,
        "missionId":       LEVEL6MISSION1ID,
        "mainGroup":       LevelGroup3(),
        "mainGroupMask":   ROOM1MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 6 Mission 2",
        "description":     "Beat Level 6 Mission 2",
        "points":          2,
        "missionId":       LEVEL6MISSION2ID,
        "mainGroup":       LevelGroup3(),
        "mainGroupMask":   ROOM2MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 6 Mission 3",
        "description":     "Beat Level 6 Mission 3",
        "points":          2,
        "missionId":       LEVEL6MISSION3ID,
        "mainGroup":       LevelGroup3(),
        "mainGroupMask":   ROOM3MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 7 Mission 1",
        "description":     "Beat Level 7 Mission 1",
        "points":          2,
        "missionId":       LEVEL7MISSION1ID,
        "mainGroup":       LevelGroup3(),
        "mainGroupMask":   ROOM4MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 7 Mission 2",
        "description":     "Beat Level 7 Mission 2",
        "points":          2,
        "missionId":       LEVEL7MISSION2ID,
        "mainGroup":       LevelGroup3(),
        "mainGroupMask":   ROOM5MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 7 Mission 3",
        "description":     "Beat Level 7 Mission 3",
        "points":          2,
        "missionId":       LEVEL7MISSION3ID,
        "mainGroup":       LevelGroup3(),
        "mainGroupMask":   ROOM6MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 8 Mission 1",
        "description":     "Beat Level 8 Mission 1",
        "points":          2,
        "missionId":       LEVEL8MISSION1ID,
        "mainGroup":       LevelGroup3(),
        "mainGroupMask":   ROOM7MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 8 Mission 2",
        "description":     "Beat Level 8 Mission 2",
        "points":          2,
        "missionId":       LEVEL8MISSION2ID,
        "mainGroup":       LevelGroup3(),
        "mainGroupMask":   ROOM8MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup4(),
        "type":            "",
    },
    {
        "title":           "Level 8 Mission 3",
        "description":     "Beat Level 8 Mission 3",
        "points":          2,
        "missionId":       LEVEL8MISSION3ID,
        "mainGroup":       LevelGroup4(),
        "mainGroupMask":   ROOM1MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup3(),
        "type":            "",
    },
    {
        "title":           "Level 9 Mission 1",
        "description":     "Beat Level 9 Mission 1",
        "points":          2,
        "missionId":       LEVEL9MISSION1ID,
        "mainGroup":       LevelGroup4(),
        "mainGroupMask":   ROOM2MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup3(),
        "type":            "",
    },
    {
        "title":           "Level 9 Mission 2",
        "description":     "Beat Level 9 Mission 2",
        "points":          2,
        "missionId":       LEVEL9MISSION2ID,
        "mainGroup":       LevelGroup4(),
        "mainGroupMask":   ROOM3MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup3(),
        "type":            "",
    },
    {
        "title":           "Level 9 Mission 3",
        "description":     "Beat Level 9 Mission 3",
        "points":          2,
        "missionId":       LEVEL9MISSION3ID,
        "mainGroup":       LevelGroup4(),
        "mainGroupMask":   ROOM4MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup3(),
        "type":            "",
    },
    {
        "title":           "Defeat Krond",
        "description":     "Beat Krond in level 10",
        "points":          2,
        "missionId":       LEVEL10MISSON1ID,
        "mainGroup":       LevelGroup4(),
        "mainGroupMask":   ROOM5MASK,
        "secondaryGroup1": LevelGroup1(),
        "secondaryGroup2": LevelGroup2(),
        "secondaryGroup3": LevelGroup3(),
        "type":            "",
    }
]

for config in Configs
{
    achievement(
        title = config["title"],
        description = config["description"],
        points = config["points"],
        trigger = trigger_when(
            measured(
                MissionCompleteCondition(
                    config["missionId"],
                    config["mainGroupMask"],
                    config["mainGroup"],
                    config["secondaryGroup1"],
                    config["secondaryGroup2"],
                    config["secondaryGroup3"]
                )
            ) &&
            never( OpenPasswordMenu() ) &&
            never( PlayerDies() )
        ),
        type = config["type"]
    )
}

achievement(
    title = "Beat the Game",
    description = "Beat every level of the game without passwords in one session",
    points = 50,
    trigger = trigger_when(
        measured(
            tally(2,
                once( GameStarts() ),
                once( GameEnds() )
            )
        ) &&
        never( OpenPasswordMenu() )
    ),
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
    9: "Lvl 10",
}

rich_presence_conditional_display(
    inMainLobby(),
    "Main Lobby | ⭐ {1} | 🎫 {2}",
    rich_presence_value("Lucky Stars", LuckyStars()),
    rich_presence_lookup("Lift Pass Level", LiftPassLevel(), levelPass)
)
rich_presence_display("🎮 Lvl X Mission Y" | ❤️ {0} | ⭐ {1}",
    rich_presence_value("Health", Health()),
    rich_presence_value("Lucky Stars", LuckyStars())
)