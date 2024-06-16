// Monster Max
// #ID = 4111

// $D122: Health
function Health() => byte( 0xD122 )

// $D00A: Level Group 1
function LevelGroup1() => byte( 0xD00A )

// $D00B: Level Group 2
function LevelGroup2() => byte( 0xD00B )

// $D00C: Level Group 3
function LevelGroup3() => byte( 0xD00C )

// $D00D: Level Group 4
function LevelGroup4() => byte( 0xD00D )

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

// $CFBF - Current mission
function CurrentMission() => byte( 0xCFBF )

// $D128: Lift Pass Level
function LiftPassLevel() => byte( 0xD128 )

// $D12A: Money high value
function MoneyHigh() => byte( 0xD12A )

// $D129: Money low value
function MoneyLow() => byte( 0xD129 )

CLOSED = 0x00
DEAD = 0xFF

ROOM1MASK = 0x01
ROOM2MASK = 0x02
ROOM3MASK = 0x04
ROOM4MASK = 0x08
ROOM5MASK = 0x10
ROOM6MASK = 0x20
ROOM7MASK = 0x40
ROOM8MASK = 0x80

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
LEVEL3MISSION3ID = 0x0a
LEVEL4MISSION1ID = 0x0b
LEVEL4MISSION2ID = 0x0c
LEVEL4MISSION3ID = 0x0d
LEVEL5MISSION1ID = 0x0e
LEVEL5MISSION2ID = 0x0f
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
LEVEL9MISSION1ID = 0x1a
LEVEL9MISSION2ID = 0x1b
LEVEL9MISSION3ID = 0x1c
LEVEL10MISSONID  = 0x1d

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

// public functions

function OpenPasswordMenu()
{
    return (
        prev( PasswordChar1() ) != 0xff && PasswordChar1() == 0xff &&
        prev( PasswordChar2() ) != 0xff && PasswordChar2() == 0xff &&
        prev( PasswordChar3() ) != 0xff && PasswordChar3() == 0xff &&
        prev( PasswordChar4() ) != 0xff && PasswordChar4() == 0xff &&
        prev( PasswordChar5() ) != 0xff && PasswordChar5() == 0xff &&
        prev( PasswordChar6() ) != 0xff && PasswordChar6() == 0xff &&
        prev( PasswordChar7() ) != 0xff && PasswordChar7() == 0xff &&
        prev( PasswordChar8() ) != 0xff && PasswordChar8() == 0xff
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
        )
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
