// Monster Max
// #ID = 4111

// $F122: Health
function Health() => byte( 0xF122 )

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

CLOSED = 0x00

ROOM1MASK = 0x01
ROOM2MASK = 0x02
ROOM3MASK = 0x04
ROOM4MASK = 0x08
ROOM5MASK = 0x10
ROOM6MASK = 0x20
ROOM7MASK = 0x40
ROOM8MASK = 0x80

alphabet = {
    "1": 0x00,
    "2": 0x01,
    "3": 0x02,
    "4": 0x03,
    "5": 0x04,
    "6": 0x05,
    "7": 0x06,
    "8": 0x07,
    "9": 0x08,
    "B": 0x09,
    "D": 0x0a,
    "G": 0x0b,
    "H": 0x0c,
    "J": 0x0d,
    "K": 0x0e,
    "L": 0x0f,
    "M": 0x10,
    "N": 0x11,
    "P": 0x12,
    "Q": 0x13,
    "R": 0x14,
    "T": 0x15,
    "V": 0x16,
    "W": 0x17,
    "X": 0x18,
    "Y": 0x19,
    "Z": 0x1a,
    "#": 0x1b,
    "!": 0x1c,
    "*": 0x1d,
    "-": 0x1e,
    "?": 0x1f,
}


// anti cheat
// if level unlocked changes and password == that levels password then they cheated
// if more than one level opened during a trigger than they cheated
// if theyre not facing the correct direction when finishing the game then they cheated (might be invalid if they all end in the same direction but it might not hurt to check)
// if they are in the main menu (map is all FFFF for 32 bits) then they cheated
// if they have not seen the final room of the mission, they cheated
// if they have seen more rooms than the mission allos then they cheated

function missionMarkedComplete( group, missionMask )
{
    // Mission is marked complete and it was previously closed
    return ( group & missionMask ) == missionMask && ( prev( group ) & missionMask == CLOSED )
}

function onlyMissionUnlocked( group, missionMask, unchangedGroup1, unchangedGroup2, unchangedGroup3 )
{
    // Mission is the only level that was marked complete (anti-cheat)
    return LevelGroup1() == ( prev( LevelGroup1() ) + missionMask )
}

function CheckLevelPassword( char1, char2, char3, char4, char5, char6, char7, char8 )
{
    return (
        alphabet[char1] != PasswordChar1() ||
        alphabet[char2] != PasswordChar2() ||
        alphabet[char3] != PasswordChar3() ||
        alphabet[char4] != PasswordChar4() ||
        alphabet[char5] != PasswordChar5() ||
        alphabet[char6] != PasswordChar6() ||
        alphabet[char7] != PasswordChar7() ||
        alphabet[char8] != PasswordChar8()
    )
}

function PlayPenConditions() 
{
    return (
        missionMarkedComplete( LevelGroup1(), ROOM1MASK ) &&
        onlyMissionUnlocked( LevelGroup1(), ROOM1MASK, LevelGroup2(), LevelGroup3(), LevelGroup4() )
    )
}

function Level1Mission1Conditions()
{
    return (
        missionMarkedComplete( LevelGroup1(), ROOM2MASK ) &&
        onlyMissionUnlocked( LevelGroup1(), ROOM2MASK, LevelGroup2(), LevelGroup3(), LevelGroup4() ) &&
        CheckLevelPassword( "!", "*", "K", "2", "6", "9", "K", "M" )
    )
}


achievement(
    title = "PlayPen",
    description = "Beat the PlayPen level",
    points = 1,
    trigger = trigger_when( PlayPenConditions() )
)

achievement(
    title = "Level 1 Mission 1",
    description = "Beat Level 1 Mission 1",
    points = 2,
    trigger = trigger_when( Level1Mission1Conditions() )
)

achievement(
    title = "Beat the Game",
    description = "Beat every level of the game",
    points = 50,
    trigger = trigger_when(
        measured(
            tally(2,
                once(PlayPenConditions()),
                once(Level1Mission1Conditions())
            )
        )
    ),
    type = "win_condition"
)