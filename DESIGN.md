# Design Doc

## Table of Contents

1. [About](#about)
2. [Learnings](#learnings)
3. [Code Notes](#code-notes)
4. [Achievements](#achievements)
5. [Rich Presence](#rich-presence)
6. [Leaderboards](#leaderboards)

## About

<sub>[Back to Table of Contents](#table-of-contents)</sub>

* [Wikipedia](https://en.wikipedia.org/wiki/Monster_Max)
* [RetroAchievements](https://retroachievements.org/game/4111)
* [Walkthrough](https://gamefaqs.gamespot.com/gameboy/585809-monster-max/faqs/36096)
* [YouTube Video Playthrough](https://www.youtube.com/watch?v=p4EVqKSPrcs)

## Learnings

<sub>[Back to Table of Contents](#table-of-contents)</sub>

### Passwords

While playing through the game there is no save state for it, meaning if you play a few levels and want to quit and come back at a later time, the only way to "restore" your progress is by using the password system. The password system will place you at a specific point in the game. As far as i can tell passwords are characteristics of the player encoded. the values that are encoded seem to be a combination of: credits, levels completed, number of stars, and level pass obtained. Through some trial and error unfortunately I am unable to convert these values into passwords to try and thwart the password system abuse for achievements. There are no set passwords in the game, only the ability to enter 8 characters that can be any of the 32 characters supported in the system, making the game have thousands of passwords to chose from so hard coding password protection is not going to happen with no reliable way to generate passwords from the characteristics provided.

Playing with passwords seems to create a new password hash any time one of those characteristics changes, but when loading the game state in the game, it removes all lucky stars. You can never enter a password and get stars or specific items in your slots. the only thing that matters is lift pass level, missions completed flags, and credits. Also while playing with the password system it appears that there is some level of anti-cheat in the game. meaning you can't start the game with 9999 credits, you will need to enter a password hash that makes a valid game state. I do notice that some of the credits I manually calculate for what you can have at that point in the game differ from what passwords allow. This may be a buffer by the developers for some reason as I see no way to earn these extra points in the game. I will note what each levels max points can be with passwords in the Level details section below.

### Levels

There is 1 play pen, 9 levels with 3 missions each, and a final 10th level with one mission to complete the game. players can't move up to the next level unless the gather credits by completing missions on the floors they have access to. there is a way around completing levels by using passwords, either using one of the well known passwords on the internet to go to the end of the game and have all the lift passes, or getting a password that just gives you all the lift passes for free. Therefore level progression achievements need session and password protection to avoid players just going to the level prior with the max credits, and buying the next pass without playing the game since thats a valid state to get "free" points.

### Stars

Stars are accumulated by collecting them in the missions and displayed as a number in the top left of the screen. They allow you to take damage without losing a heart, its like a one hit protection and the more you collect the more hits you can take without losing hearts. Stars can only be obtained from missions, and are not given back if using a password to restore a game state.

### Detailed Mission Parameters

Totals calculation formula: `Reward + ((Given Hearts + In-Game Hearts + Gold Bullions) * Bonus Multiplier)`

Play Pen:
* Reward: 1 credit
* Given Hearts: 0
* Bonus Multiplier: 0 credits
* In-Game Hearts: 0
* Gold Bullions: 0
* Stars: 0
* Lightning: 0
* Power Spring: 1
* Power Ring: 0
* Map: 0
* Total: 1 + ((0 + 0 + 0) * 0) = 1 credits max

Level 1 Mission 1:
* Reward: 30 credits
* Given Hearts: 4
* Bonus Multiplier: 3 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 1
* Lightning: 1
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 30 + ((4 + 1 + 1) * 3) = 48 credits max

Level 1 Mission 2:
* Reward: 30 credits
* Given Hearts: 4
* Bonus Multiplier: 3 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 1
* Lightning: 0
* Power Spring: 1
* Power Ring: 0
* Map: 0
* Total: 30 + ((4 + 1 + 0) * 3) = 45 credits max

Level 1 Mission 3:
* Reward: 45 credits
* Given Hearts: 4
* Bonus Multiplier: 3 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 2
* Lightning: 2
* Power Spring: 0
* Power Ring: 1
* Map: 1
* Total: 45 + ((4 + 1 + 1) * 3) = 63 credits max

Level 1 Summary:
* Games Internal Max Credits With Passwords: 159
* Max credits: 1 + 48 + 45 + 63 = 157 credits
* Max stars: 4
* Lift Pass Cost: 70 credits
* Max credits after buying lift pass: 157 - 70 = 87 credits

Level 2 Mission 1:
* Reward: 45 credits
* Given Hearts: 4
* Bonus Multiplier: 7 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 2
* Lightning: 1
* Power Spring: 0
* Power Ring: 0
* Map: 1
* Total: 45 + ((4 + 1 + 0) * 7) = 80 credits max

Level 2 Mission 2:
* Reward: 40 credits
* Given Hearts: 4
* Bonus Multiplier: 7 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 3
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 40 + ((4 + 1 + 1) * 7) = 82 credits max

Level 2 Mission 3:
* Reward: 65 credits
* Given Hearts: 4
* Bonus Multiplier: 7 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 0
* Lightning: 0
* Power Spring: 1
* Power Ring: 0
* Map: 0
* Total: 65 + ((4 + 1 + 0) * 7) = 100 credits max

Level 2 Summary:
* Games Internal Max Credits With Passwords: 354
* Max credits: 87 + 80 + 82 + 100 = 349 credits
* Max stars: 4 + 2 + 3 + 0 = 9
* Lift Pass Cost: 130 credits
* Max credits after buying lift pass: 349 - 130 = 219 credits

Level 3 Mission 1:
* Reward: 70 credits
* Given Hearts: 4
* Bonus Multiplier: 10 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 2
* Lightning: 1
* Power Spring: 0
* Power Ring: 0
* Map: 1
* Total: 70 + ((4 + 1 + 0) * 10) = 120 credits max

Level 3 Mission 2:
* Reward: 60 credits
* Given Hearts: 4
* Bonus Multiplier: 10 credits
* In-Game Hearts: 1
* Gold Bullions: 2
* Stars: 3
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 60 + ((4 + 1 + 2) * 10) = 130 credits max

Level 3 Mission 3:
* Reward: 100 credits
* Given Hearts: 4
* Bonus Multiplier: 10 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 2
* Lightning: 1
* Power Spring: 1
* Power Ring: 0
* Map: 0
* Total: 100 + ((4 + 1 + 1) * 10) = 160 credits max

Level 3 Summary:
* Games Internal Max Credits With Passwords: 634
* Max credits: 219 + 120 + 130 + 160 = 629 credits
* Max stars: 9 + 2 + 3 + 2 = 16
* Lift Pass Cost: 200 credits
* Max credits after buying lift pass: 629 - 200 = 429 credits

Level 4 Mission 1:
* Reward: 100 credits
* Given Hearts: 4
* Bonus Multiplier: 15 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 0
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 100 + ((4 + 1 + 1) * 15) = 190 credits max

Level 4 Mission 2:
* Reward: 100 credits
* Given Hearts: 4
* Bonus Multiplier: 15 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 1
* Lightning: 1
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 100 + ((4 + 1 + 1) * 15) = 190 credits max

Level 4 Mission 3:
* Reward: 150 credits
* Given Hearts: 3
* Bonus Multiplier: 15 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 1
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 1
* Total: 150 + ((3 + 1 + 1) * 15) = 225 credits max

Level 4 Summary:
* Games Internal Max Credits With Passwords: 1039
* Max credits: 429 + 190 + 190 + 225 = 1034 credits
* Max stars: 16 + 0 + 1 + 1 = 18
* Lift Pass Cost: 300 credits
* Max credits after buying lift pass: 1034 - 300 = 734 credits

Level 5 Mission 1:
* Reward: 150 credits
* Given Hearts: 4
* Bonus Multiplier: 20 credits
* In-Game Hearts: 1
* Gold Bullions: 2
* Stars: 1
* Lightning: 1
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 150 + ((4 + 1 + 2) * 20) = 290 credits max

Level 5 Mission 2:
* Reward: 200 credits
* Given Hearts: 3
* Bonus Multiplier: 20 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 1
* Lightning: 0
* Power Spring: 1
* Power Ring: 0
* Map: 0
* Total: 200 + ((3 + 1 + 0) * 20) = 280 credits max

Level 5 Mission 3:
* Reward: 300 credits
* Given Hearts: 3
* Bonus Multiplier: 20 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 1
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 300 + ((3 + 1 + 0) * 20) = 380 credits max

Level 5 Summary:
* Games Internal Max Credits With Passwords: 1689
* Max credits: 734 + 290 + 280 + 380 = 1684 credits
* Max stars: 18 + 1 + 1 + 1 = 21
* Lift Pass Cost: 450 credits
* Max credits after buying lift pass: 1684 - 450 = 1234 credits

Level 6 Mission 1:
* Reward: 275 credits
* Given Hearts: 3
* Bonus Multiplier: 30 credits
* In-Game Hearts: 0
* Gold Bullions: 1
* Stars: 0
* Lightning: 5
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 275 + ((3 + 0 + 1) * 30) = 395 credits max

Level 6 Mission 2:
* Reward: 300 credits
* Given Hearts: 3
* Bonus Multiplier: 30 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 0
* Lightning: 3
* Power Spring: 0
* Power Ring: 1
* Map: 1
* Total: 300 + ((3 + 1 + 0) * 30) = 420 credits max

Level 6 Mission 3:
* Reward: 450 credits
* Given Hearts: 3
* Bonus Multiplier: 30 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 1
* Lightning: 0
* Power Spring: 1
* Power Ring: 0
* Map: 0
* Total: 450 + ((3 + 1 + 0) * 30) = 570 credits max

Level 6 Summary:
* Games Internal Max Credits With Passwords: 2654
* Max credits: 1234 + 395 + 420 + 570 = 2619 credits
* Max stars: 21 + 0 + 0 + 1 = 22
* Lift Pass Cost: 650 credits
* Max credits after buying lift pass: 2619 - 650 = 1969 credits

Level 7 Mission 1:
* Reward: 450 credits
* Given Hearts: 3
* Bonus Multiplier: 42 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 4
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 450 + ((3 + 1 + 1) * 42) = 660 credits max

Level 7 Mission 2:
* Reward: 450 credits
* Given Hearts: 3
* Bonus Multiplier: 42 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 3
* Lightning: 1
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 450 + ((3 + 1 + 1) * 42) = 660 credits max

Level 7 Mission 3:
* Reward: 600 credits
* Given Hearts: 2
* Bonus Multiplier: 42 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 3
* Lightning: 0
* Power Spring: 1
* Power Ring: 1
* Map: 0
* Total: 600 + ((2 + 1 + 0) * 42) = 726 credits max

Level 7 Summary:
* Games Internal Max Credits With Passwords: 4049
* Max credits: 1969 + 660 + 660 + 726 = 4015
* Max stars: 22 + 4 + 3 + 3 = 32
* Lift Pass Cost: 1000 credits
* Max credits after buying lift pass: 4015 - 1000 = 3015 credits

Level 8 Mission 1:
* Reward: 650 credits
* Given Hearts: 3
* Bonus Multiplier: 60 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 1
* Lightning: 16
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 650 + ((3 + 1 + 0) * 60) = 890 credits max

Level 8 Mission 2:
* Reward: 650 credits
* Given Hearts: 2
* Bonus Multiplier: 60 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 3
* Lightning: 1
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 650 + ((2 + 1 + 0) * 60) = 830 credits max

Level 8 Mission 3:
* Reward: 850 credits
* Given Hearts: 2
* Bonus Multiplier: 60 credits
* In-Game Hearts: 1
* Gold Bullions: 1
* Stars: 5
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 850 + ((2 + 1 + 1) * 60) = 1090 credits max

Level 8 Summary:
* Games Internal Max Credits With Passwords: 5859
* Max credits: 3015 + 890 + 830 + 1090 = 5825
* Max stars: 32 + 1 + 3 + 5 = 41
* Lift Pass Cost: 1500 credits
* Max credits after buying lift pass: 5825 - 1500 = 4325 credits

Level 9 Mission 1:
* Reward: 900 credits
* Given Hearts: 2
* Bonus Multiplier: 90 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 5
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 0
* Total: 900 + ((2 + 1 + 0) * 90) = 1170 credits max

Level 9 Mission 2:
* Reward: 800 credits
* Given Hearts: 2
* Bonus Multiplier: 90 credits
* In-Game Hearts: 1
* Gold Bullions: 2
* Stars: 3
* Lightning: 1
* Power Spring: 0
* Power Ring: 1
* Map: 0
* Total: 800 + ((2 + 1 + 2) * 90) = 1250 credits max

Level 9 Mission 3:
* Reward: 1100 credits
* Given Hearts: 2
* Bonus Multiplier: 90 credits
* In-Game Hearts: 1
* Gold Bullions: 0
* Stars: 1
* Lightning: 0
* Power Spring: 0
* Power Ring: 0
* Map: 1
* Total: 1100 + ((2 + 1 + 0) * 90) = 1370 credits max

Level 9 Summary:
* Games Internal Max Credits With Passwords: 8149
* Max credits: 4325 + 1170 + 1250 + 1370 = 8115
* Max stars: 41 + 5 + 3 + 1 = 50
* Lift Pass Cost: 2500 credits
* Max credits after buying lift pass: 8115 - 2500 = 5615 credits

Level 10 Mission 1:
* Reward: 3500 credits
* Given Hearts: 3
* Bonus Multiplier: 120 credits
* In-Game Hearts: 4
* Gold Bullions: 0
* Stars: 1
* Lightning: 2
* Power Spring: 1
* Power Ring: 1
* Map: 0
* Total: 3500 + ((3 + 4 + 0) * 120) = 4340 credits max

Level 10 Summary:
* Games Internal Max Credits With Passwords: 9998
* Max credits: 5615 + 4340 = 9955
* Max stars: 50 + 4 = 54

## Code Notes

<sub>[Back to Table of Contents](#table-of-contents)</sub>

### Code Notes Navigation

1. [Start Menu](#start-menu)
2. [Select Menu](#select-menu)
3. [Current Mission](#current-mission)
4. [Mission Final Item Flags Group 1](#mission-final-item-flags-group-1)
5. [Mission Final Item Flags Group 2](#mission-final-item-flags-group-2)
6. [Mission Final Item Flags Group 3](#mission-final-item-flags-group-3)
7. [Mission Final Item Flags Group 4](#mission-final-item-flags-group-4)
8. [Mission Final Item Flags Group 5](#mission-final-item-flags-group-5)
9. [Missions Unlocked Flags](#missions-unlocked-flags)
10. [Mission Key Item Flags](#mission-key-item-flags)
11. [A Button Item](#a-button-item)
12. [B Button Item](#b-button-item)
13. [Bag Contents](#bag-contents)
14. [Lucky Stars](#lucky-stars)
15. [Health](#health)
16. [Speed Boost](#speed-boost)
17. [Power Ring Time](#power-ring-time)
18. [Power Spring Jumps](#power-spring-jumps)
19. [Player Direction Facing](#player-direction-facing)
20. [Player Direction Button Being Pressed](#player-direction-button-being-pressed)
21. [Lift Pass Level](#lift-pass-level)
22. [Credits](#credits)
23. [Response Setting](#response-setting)
24. [Idle Animation Timer](#idle-animation-timer)
25. [Start Menu Map Group 1 Flags](#start-menu-map-group-1-flags)
26. [Start Menu Map Group 2 Flags](#start-menu-map-group-2-flags)
27. [Start Menu Map Group 3 Flags](#start-menu-map-group-3-flags)
28. [Start Menu Map Group 4 Flags](#start-menu-map-group-4-flags)
29. [Start Menu Map Group 5 Flags](#start-menu-map-group-5-flags)
30. [Start Menu Map Group 6 Flags](#start-menu-map-group-6-flags)
31. [Start Menu Map Group 7 Flags](#start-menu-map-group-7-flags)
32. [Rooms Available In Mission Group 1](#rooms-available-in-mission-group-1)
33. [Rooms Available In Mission Group 2](#rooms-available-in-mission-group-2)
34. [Rooms Available In Mission Group 3](#rooms-available-in-mission-group-3)
35. [Rooms Available In Mission Group 4](#rooms-available-in-mission-group-4)
36. [Rooms Available In Mission Group 5](#rooms-available-in-mission-group-5)
37. [Rooms Available In Mission Group 6](#rooms-available-in-mission-group-6)
38. [Rooms Available In Mission Group 7](#rooms-available-in-mission-group-7)
39. [Password Menu Letter Selector X](#password-menu-letter-selector-x)
40. [Password Menu Letter Selector y](#password-menu-letter-selector-y)
41. [Select Menu Option](#select-menu-option)
42. [Language](#language)
43. [Control Pad Setting](#control-pad-setting)
44. [Information Menu Selector X](#information-menu-selector-x)
45. [Information Menu Selector Y](#information-menu-selector-y)
46. [Password Length](#password-length)
47. [Password Character 1](#password-character-1)
48. [Password Character 2](#password-character-2)
49. [Password Character 3](#password-character-3)
50. [Password Character 4](#password-character-4)
51. [Password Character 5](#password-character-5)
52. [Password Character 6](#password-character-6)
53. [Password Character 7](#password-character-7)
54. [Password Character 8](#password-character-8)
55. [Mission Bonus Credits](#mission-bonus-credits)

### _Start Menu_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xc006** (16-bit)

Notes: the 0x3836 value is a special value swapped in for showing the start menu map

[16-bit] Start Menu

0x3836 = Open

### _Select Menu_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xc009** (8-bit)

Notes: boolean specifying if menu is open or not

Upper4
* 0x0 = Open
* 0x1 = Closed

Lower4
* N/A

### _Current Mission_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xcfbf** (8-bit)

Notes: integer specifying what current mission the player is in

* 0x00 = Main Lobby
* 0x01 = Play Pen
* 0x02 = Level 1 Mission 1
* 0x03 = Level 1 Mission 2
* 0x04 = Level 1 Mission 3
* 0x05 = Level 2 Mission 1
* 0x06 = Level 2 Mission 2
* 0x07 = Level 2 Mission 3
* 0x08 = Level 3 Mission 1
* 0x09 = Level 3 Mission 2
* 0x0a = Level 3 Mission 3
* 0x0b = Level 4 Mission 1
* 0x0c = Level 4 Mission 2
* 0x0d = Level 4 Mission 3
* 0x0e = Level 5 Mission 1
* 0x0f = Level 5 Mission 2
* 0x10 = Level 5 Mission 3
* 0x11 = Level 6 Mission 1
* 0x12 = Level 6 Mission 2
* 0x13 = Level 6 Mission 3
* 0x14 = Level 7 Mission 1
* 0x15 = Level 7 Mission 2
* 0x16 = Level 7 Mission 3
* 0x17 = Level 8 Mission 1
* 0x18 = Level 8 Mission 2
* 0x19 = Level 8 Mission 3
* 0x1a = Level 9 Mission 1
* 0x1b = Level 9 Mission 2
* 0x1c = Level 9 Mission 3
* 0x1d = Final Mission
* 0x1e = Title Screen
* 0x1f = Final Concert Scene

### _Mission Final Item Flags Group 1_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd002** (8-bit)

Notes: Does not appear to be an order of item type. These mark the final item collected or destroyed that open the door to the end of the mission.

0 = not obtained<br>
1 = obtained

* Bit0 = N/A
* Bit1 = N/A
* Bit2 = N/A
* Bit3 = N/A
* Bit4 = N/A
* Bit5 = N/A
* Bit6 = N/A
* Bit7 = Play Pen, 4-3

### _Mission Final Item Flags Group 2_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd003** (8-bit)

Notes: Does not appear to be an order of item type. These mark the final item collected or destroyed that open the door to the end of the mission.

0 = not obtained<br>
1 = obtained

* Bit0 = N/A
* Bit1 = 5-1
* Bit2 = N/A
* Bit3 = 7-3
* Bit4 = N/A
* Bit5 = N/A
* Bit6 = N/A
* Bit7 = 3-2, 9-3

### _Mission Final Item Flags Group 3_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd004** (8-bit)

Notes: Does not appear to be an order of item type. These mark the final item collected or destroyed that open the door to the end of the mission.

0 = not obtained<br>
1 = obtained

* Bit0 = 2-2, 4-2, 5-2, 6-3, 8-2, 9-1, 9-2
* Bit1 = 1-1, 1-2, 3-3, 4-1, 5-3, 7-1, 8-1, 8-3
* Bit2 = 1-3, 2-3, 3-1, 7-2
* Bit3 = N/A
* Bit4 = 2-1
* Bit5 = N/A
* Bit6 = N/A
* Bit7 = N/A

### _Mission Final Item Flags Group 4_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd005** (8-bit)

Notes: Does not appear to be an order of item type. These mark the final item collected or destroyed that open the door to the end of the mission.

0 = not obtained<br>
1 = obtained

* Bit0 = N/A
* Bit1 = N/A
* Bit2 = N/A
* Bit3 = N/A
* Bit4 = 6-1
* Bit5 = 6-2
* Bit6 = N/A
* Bit7 = N/A

### _Mission Final Item Flags Group 5_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd008** (8-bit)

Notes: Does not appear to be an order of item type. These mark the final item collected or destroyed that open the door to the end of the mission.

0 = not obtained<br>
1 = obtained

* Bit0 = N/A
* Bit1 = N/A
* Bit2 = N/A
* Bit3 = N/A
* Bit4 = N/A
* Bit5 = 10-1
* Bit6 = N/A
* Bit7 = N/A

### _Missions Unlocked Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd00a** (32-bit)

Notes: bit flags for missions completed

0 = not completed<br>
1 = completed

* Bit0 = Play Pen
* Bit1 = Level 1 Mission 1
* Bit2 = Level 1 Mission 2
* Bit3 = Level 1 Mission 3
* Bit4 = Level 2 Mission 1
* Bit5 = Level 2 Mission 2
* Bit6 = Level 2 Mission 3
* Bit7 = Level 3 Mission 1
* Bit8 = Level 3 Mission 2
* Bit9 = Level 3 Mission 3
* Bit10 = Level 4 Mission 1
* Bit11 = Level 4 Mission 2
* Bit12 = Level 4 Mission 3
* Bit13 = Level 5 Mission 1
* Bit14 = Level 5 Mission 2
* Bit15 = Level 5 Mission 3
* Bit16 = Level 6 Mission 1
* Bit17 = Level 6 Mission 2
* Bit18 = Level 6 Mission 3
* Bit19 = Level 7 Mission 1
* Bit20 = Level 7 Mission 2
* Bit21 = Level 7 Mission 3
* Bit22 = Level 8 Mission 1
* Bit23 = Level 8 Mission 2
* Bit24 = Level 8 Mission 3
* Bit25 = Level 9 Mission 1
* Bit26 = Level 9 Mission 2
* Bit27 = Level 9 Mission 3
* Bit28 = Level 10 Mission
* Bit29 = Unused
* Bit30 = Unused
* Bit31 = Unused

### _Mission Key Item Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd08a** (8-bit)

Notes: Only used for the final mission where you collect four key items that are not power ups in order for the final room to allow you to cross the bridge and defeat King Krond.

0 = not obtained<br>
1 = obtained

* Bit0 = item 1
* Bit1 = item 2
* Bit2 = item 3
* Bit3 = item 4
* Bit4 = N/A
* Bit5 = N/A
* Bit6 = N/A
* Bit7 = N/A

### _A Button Item_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd0fd** (8-bit)

Notes: integer specifying item currently in the A button slot

* 0x00 = boots
* 0x01 = bag
* 0x02 = bag (occupied)
* 0x03 = sword
* 0x04 = gun level 2
* 0x05 = gun level 1
* 0x06 = duck
* 0x07 = force field
* 0x08 = bomb

### _B Button Item_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd0fe** (8-bit)

Notes: integer specifying item currently in the B button slot

* 0x00 = boots
* 0x01 = bag
* 0x02 = bag (occupied)
* 0x03 = sword
* 0x04 = gun level 2
* 0x05 = gun level 1
* 0x06 = duck
* 0x07 = force field
* 0x08 = bomb

### _Bag Contents_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd10b** (8-bit)

Notes: integer specifying the contents of the bag

* 0x74 = empty
* 0xb8 = box

### _Lucky Stars_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd120** (8-bit)

Notes: number count, can hold 255 but can only display 9

* 0x00 = 0
* 0x01 = 1
* 0x02 = 2
* 0x03 = 3
* ...
* 0xff = 255

### _Health_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd122** (8-bit)

Notes: number count, can hold 254 but can only display 5

* 0x00 = 0
* 0x01 = 1
* 0x02 = 2
* 0x03 = 3
* ...
* 0xfe = 254
* 0xff = Dead

### _Speed Boost_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd123** (8-bit)

Notes: can hold 255, each lightning adds 32 (0x20) speed tile steps

* 0x00 = 0 tiles
* 0x01 = 1 tiles
* 0x02 = 2 tiles
* ...
* 0x20 = 32 tiles
* ...
* 0xff = 255 tiles

### _Power Ring Time_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd124** (8-bit)

Notes: can hold 255, each power ring adds 32 (0x20) seconds

* 0x00 = 0 seconds
* 0x01 = 1 seconds
* 0x02 = 2 seconds
* 0x03 = 3 seconds
* 0x04 = 4 seconds
* 0x05 = 5 seconds
* 0x06 = 6 seconds
* 0x07 = 7 seconds
* 0x08 = 8 seconds
* 0x09 = 9 seconds
* 0x0a = 10 seconds
* 0x0b = 11 seconds
* 0x0c = 12 seconds
* 0x0d = 13 seconds
* 0x0e = 14 seconds
* 0x0f = 15 seconds
* 0x10 = 16 seconds
* 0x11 = 17 seconds
* 0x12 = 18 seconds
* 0x13 = 19 seconds
* 0x14 = 20 seconds
* 0x15 = 21 seconds
* 0x16 = 22 seconds
* 0x17 = 23 seconds
* 0x18 = 24 seconds
* 0x19 = 25 seconds
* 0x1a = 26 seconds
* 0x1b = 27 seconds
* 0x1c = 28 seconds
* 0x1f = 29 seconds
* 0x1e = 30 seconds
* 0x1f = 31 seconds
* 0x20 = 32 seconds
* ...
* 0xff = 255 seconds

### _Power Spring Jumps_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd125** (8-bit)

Notes: can hold 255, each power spring adds 10 (0x0a) jumps

* 0x00 = 0 jumps
* 0x01 = 1 jumps
* 0x02 = 2 jumps
* 0x03 = 3 jumps
* 0x04 = 4 jumps
* 0x05 = 5 jumps
* 0x06 = 6 jumps
* 0x07 = 7 jumps
* 0x08 = 8 jumps
* 0x09 = 9 jumps
* 0x0a = 10 jumps
* ...
* 0xff = 255 jumps

### _Player Direction Facing_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd126** (8-bit)

* 0x01 = NE
* 0x02 = SW
* 0x04 = NW
* 0x08 = SE

### _Player Direction Button Being Pressed_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd127** (8-bit)

* 0x00 = None
* 0x01 = NE
* 0x02 = SW
* 0x04 = NW
* 0x08 = SE

### _Lift Pass Level_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd128** (8-bit)

* 0x00 = level 1
* 0x01 = level 2
* 0x02 = level 3
* 0x03 = level 4
* 0x04 = level 5
* 0x05 = level 6
* 0x06 = level 7
* 0x07 = level 8
* 0x08 = level 9
* 0x09 = level 10

### _Credits_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd129** (16-bit)

* 0x0000 = 0
* 0x0001 = 1
* 0x0002 = 2
* ...
* 0xffff = 65535

### _Response Setting_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd12d** (8-bit)

* 0x00 = High
* 0x01 = Low

### _Idle Animation Timer_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd12e** (8-bit)

Notes: Only works if player is facing southwest or southeast

* 0x00 = not idle
* 0x01 = not idle
* 0x02 = not idle
* ...
* 0xfd = not idle
* 0xfe = not idle
* 0xff = idle

### _Start Menu Map Group 1 Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd190** (8-bit)

Notes:<br>
0 = room not visited<br>
1 = room visited

* Bit0 = room 1
* Bit1 = room 2
* Bit2 = room 3
* Bit3 = room 4
* Bit4 = room 5
* Bit5 = room 6
* Bit6 = room 7
* Bit7 = room 8

### _Start Menu Map Group 2 Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd191** (8-bit)

Notes:<br>
0 = room not visited<br>
1 = room visited

* Bit0 = room 9
* Bit1 = room 10
* Bit2 = room 11
* Bit3 = room 12
* Bit4 = room 13
* Bit5 = room 14
* Bit6 = room 15
* Bit7 = room 16

### _Start Menu Map Group 3 Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd192** (8-bit)

Notes:<br>
0 = room not visited<br>
1 = room visited

* Bit0 = room 17
* Bit1 = room 18
* Bit2 = room 19
* Bit3 = room 20
* Bit4 = room 21
* Bit5 = room 22
* Bit6 = room 23
* Bit7 = room 24

### _Start Menu Map Group 4 Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd193** (8-bit)

Notes:<br>
0 = room not visited<br>
1 = room visited

* Bit0 = room 25
* Bit1 = room 26
* Bit2 = room 27
* Bit3 = room 28
* Bit4 = room 29
* Bit5 = room 30
* Bit6 = room 31
* Bit7 = room 32

### _Start Menu Map Group 5 Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd194** (8-bit)

Notes:<br>
0 = room not visited<br>
1 = room visited

* Bit0 = room 33
* Bit1 = room 34
* Bit2 = room 35
* Bit3 = room 36
* Bit4 = room 37
* Bit5 = room 38
* Bit6 = room 39
* Bit7 = room 40

### _Start Menu Map Group 6 Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd195** (8-bit)

Notes:<br>
0 = room not visited<br>
1 = room visited

* Bit0 = room 41
* Bit1 = room 42
* Bit2 = room 43
* Bit3 = room 44
* Bit4 = room 45
* Bit5 = room 46
* Bit6 = room 47
* Bit7 = room 48

### _Start Menu Map Group 7 Flags_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd196** (8-bit)

Notes:<br>
0 = room not visited<br>
1 = room visited

* Bit0 = room 49
* Bit1 = room 50
* Bit2 = room 51
* Bit3 = room 52
* Bit4 = room 53
* Bit5 = room 54
* Bit6 = room 55
* Bit7 = room 56

### _Rooms Available In Mission Group 1_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd197** (8-bit)

Notes: These act as a count of rooms in the mission, the start menu map group flag address's (0xd190 - 0xd196) should build up to the shape of available rooms in the mission (0xd197 - 0xd19d)

0 = room not visited<br>
1 = room visited

* Bit0 = room 1
* Bit1 = room 2
* Bit2 = room 3
* Bit3 = room 4
* Bit4 = room 5
* Bit5 = room 6
* Bit6 = room 7
* Bit7 = room 8

### _Rooms Available In Mission Group 2_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd198** (8-bit)

Notes: These act as a count of rooms in the mission, the start menu map group flag address's (0xd190 - 0xd196) should build up to the shape of available rooms in the mission (0xd197 - 0xd19d)

0 = room not visited<br>
1 = room visited

* Bit0 = room 9
* Bit1 = room 10
* Bit2 = room 11
* Bit3 = room 12
* Bit4 = room 13
* Bit5 = room 14
* Bit6 = room 15
* Bit7 = room 16

### _Rooms Available In Mission Group 3_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd199** (8-bit)

Notes: These act as a count of rooms in the mission, the start menu map group flag address's (0xd190 - 0xd196) should build up to the shape of available rooms in the mission (0xd197 - 0xd19d)

0 = room not visited<br>
1 = room visited

* Bit0 = room 17
* Bit1 = room 18
* Bit2 = room 19
* Bit3 = room 20
* Bit4 = room 21
* Bit5 = room 22
* Bit6 = room 23
* Bit7 = room 24

### _Rooms Available In Mission Group 4_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd19a** (8-bit)

Notes: These act as a count of rooms in the mission, the start menu map group flag address's (0xd190 - 0xd196) should build up to the shape of available rooms in the mission (0xd197 - 0xd19d)

0 = room not visited<br>
1 = room visited

* Bit0 = room 25
* Bit1 = room 26
* Bit2 = room 27
* Bit3 = room 28
* Bit4 = room 29
* Bit5 = room 30
* Bit6 = room 31
* Bit7 = room 32

### _Rooms Available In Mission Group 5_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd19b** (8-bit)

Notes: These act as a count of rooms in the mission, the start menu map group flag address's (0xd190 - 0xd196) should build up to the shape of available rooms in the mission (0xd197 - 0xd19d)

0 = room not visited<br>
1 = room visited

* Bit0 = room 33
* Bit1 = room 34
* Bit2 = room 35
* Bit3 = room 36
* Bit4 = room 37
* Bit5 = room 38
* Bit6 = room 39
* Bit7 = room 40

### _Rooms Available In Mission Group 6_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd19c** (8-bit)

Notes: These act as a count of rooms in the mission, the start menu map group flag address's (0xd190 - 0xd196) should build up to the shape of available rooms in the mission (0xd197 - 0xd19d)

0 = room not visited<br>
1 = room visited

* Bit0 = room 41
* Bit1 = room 42
* Bit2 = room 43
* Bit3 = room 44
* Bit4 = room 45
* Bit5 = room 46
* Bit6 = room 47
* Bit7 = room 48

### _Rooms Available In Mission Group 7_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd19d** (8-bit)

Notes: These act as a count of rooms in the mission, the start menu map group flag address's (0xd190 - 0xd196) should build up to the shape of available rooms in the mission (0xd197 - 0xd19d)

0 = room not visited<br>
1 = room visited

* Bit0 = room 49
* Bit1 = room 50
* Bit2 = room 51
* Bit3 = room 52
* Bit4 = room 53
* Bit5 = room 54
* Bit6 = room 55
* Bit7 = room 56

### _Password Menu Letter Selector X_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3e2** (8-bit)

Notes: X coordinate of cursor in password letter selection menu

* 0x00 = 0
* 0x01 = 1
* 0x02 = 2
* 0x03 = 3
* 0x04 = 4
* 0x05 = 5
* 0x06 = 6
* 0x07 = 7

### _Password Menu Letter Selector Y_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3e3** (8-bit)

Notes: Y coordinate of cursor in password letter selection menu

* 0x00 = 0
* 0x01 = 1
* 0x02 = 2
* 0x03 = 3

### _Select Menu Option_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3e5** (8-bit)

* 0x00 = information (default, resets on open)
* 0x01 = enter password
* 0x02 = control pad
* 0x03 = response

### _Language_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3e6** (8-bit)

* 0x00 = ENGLISH
* 0x03 = FRANCAIS
* 0x06 = NEDERLANDS
* 0x09 = ITALIANO
* 0x0c = ESPANOL
* 0x0f = DEUTCH

### _Control Pad Setting_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3e7** (8-bit)

* 0x10 = A
* 0x00 = B

### _Information Menu Selector X_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3e9** (8-bit)

Notes: X coordinate of cursor in the information selection menu

* 0x00 = 0
* 0x03 = 2
* 0x06 = 3
* 0x09 = 4
* 0x0c = 5
* 0x0f = 6
* 0x12 = 7

### _Information Menu Selector Y_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3ea** (8-bit)

Notes: Y coordinate of cursor in the information selection menu

* 0x04 = 1
* 0x08 = 2

### _Password Length_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3ef** (8-bit)

* 0x00 = 0
* 0x01 = 1
* 0x02 = 2
* 0x03 = 3
* 0x04 = 4
* 0x05 = 5
* 0x06 = 6
* 0x07 = 7
* 0x08 = 8

### _Password Character 1_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3f0** (8-bit)

* 0x00 = 1
* 0x01 = 2
* 0x02 = 3
* 0x03 = 4
* 0x04 = 5
* 0x05 = 6
* 0x06 = 7
* 0x07 = 8
* 0x08 = 9
* 0x09 = B
* 0x0a = D
* 0x0b = G
* 0x0c = H
* 0x0d = J
* 0x0e = K
* 0x0f = L
* 0x10 = M
* 0x11 = N
* 0x12 = P
* 0x13 = Q
* 0x14 = R
* 0x15 = T
* 0x16 = V
* 0x17 = W
* 0x18 = X
* 0x19 = Y
* 0x1a = Z
* 0x1b = #
* 0x1c = !
* 0x1d = *
* 0x1e = -
* 0x1f = ?
* 0xff = \<blank\>

### _Password Character 2_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3f1** (8-bit)

* 0x00 = 1
* 0x01 = 2
* 0x02 = 3
* 0x03 = 4
* 0x04 = 5
* 0x05 = 6
* 0x06 = 7
* 0x07 = 8
* 0x08 = 9
* 0x09 = B
* 0x0a = D
* 0x0b = G
* 0x0c = H
* 0x0d = J
* 0x0e = K
* 0x0f = L
* 0x10 = M
* 0x11 = N
* 0x12 = P
* 0x13 = Q
* 0x14 = R
* 0x15 = T
* 0x16 = V
* 0x17 = W
* 0x18 = X
* 0x19 = Y
* 0x1a = Z
* 0x1b = #
* 0x1c = !
* 0x1d = *
* 0x1e = -
* 0x1f = ?
* 0xff = \<blank\>

### _Password Character 3_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3f2** (8-bit)

* 0x00 = 1
* 0x01 = 2
* 0x02 = 3
* 0x03 = 4
* 0x04 = 5
* 0x05 = 6
* 0x06 = 7
* 0x07 = 8
* 0x08 = 9
* 0x09 = B
* 0x0a = D
* 0x0b = G
* 0x0c = H
* 0x0d = J
* 0x0e = K
* 0x0f = L
* 0x10 = M
* 0x11 = N
* 0x12 = P
* 0x13 = Q
* 0x14 = R
* 0x15 = T
* 0x16 = V
* 0x17 = W
* 0x18 = X
* 0x19 = Y
* 0x1a = Z
* 0x1b = #
* 0x1c = !
* 0x1d = *
* 0x1e = -
* 0x1f = ?
* 0xff = \<blank\>

### _Password Character 4_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3f3** (8-bit)

* 0x00 = 1
* 0x01 = 2
* 0x02 = 3
* 0x03 = 4
* 0x04 = 5
* 0x05 = 6
* 0x06 = 7
* 0x07 = 8
* 0x08 = 9
* 0x09 = B
* 0x0a = D
* 0x0b = G
* 0x0c = H
* 0x0d = J
* 0x0e = K
* 0x0f = L
* 0x10 = M
* 0x11 = N
* 0x12 = P
* 0x13 = Q
* 0x14 = R
* 0x15 = T
* 0x16 = V
* 0x17 = W
* 0x18 = X
* 0x19 = Y
* 0x1a = Z
* 0x1b = #
* 0x1c = !
* 0x1d = *
* 0x1e = -
* 0x1f = ?
* 0xff = \<blank\>

### _Password Character 5_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3f4** (8-bit)

* 0x00 = 1
* 0x01 = 2
* 0x02 = 3
* 0x03 = 4
* 0x04 = 5
* 0x05 = 6
* 0x06 = 7
* 0x07 = 8
* 0x08 = 9
* 0x09 = B
* 0x0a = D
* 0x0b = G
* 0x0c = H
* 0x0d = J
* 0x0e = K
* 0x0f = L
* 0x10 = M
* 0x11 = N
* 0x12 = P
* 0x13 = Q
* 0x14 = R
* 0x15 = T
* 0x16 = V
* 0x17 = W
* 0x18 = X
* 0x19 = Y
* 0x1a = Z
* 0x1b = #
* 0x1c = !
* 0x1d = *
* 0x1e = -
* 0x1f = ?
* 0xff = \<blank\>

### _Password Character 6_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3f5** (8-bit)

* 0x00 = 1
* 0x01 = 2
* 0x02 = 3
* 0x03 = 4
* 0x04 = 5
* 0x05 = 6
* 0x06 = 7
* 0x07 = 8
* 0x08 = 9
* 0x09 = B
* 0x0a = D
* 0x0b = G
* 0x0c = H
* 0x0d = J
* 0x0e = K
* 0x0f = L
* 0x10 = M
* 0x11 = N
* 0x12 = P
* 0x13 = Q
* 0x14 = R
* 0x15 = T
* 0x16 = V
* 0x17 = W
* 0x18 = X
* 0x19 = Y
* 0x1a = Z
* 0x1b = #
* 0x1c = !
* 0x1d = *
* 0x1e = -
* 0x1f = ?
* 0xff = \<blank\>

### _Password Character 7_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3f6** (8-bit)

* 0x00 = 1
* 0x01 = 2
* 0x02 = 3
* 0x03 = 4
* 0x04 = 5
* 0x05 = 6
* 0x06 = 7
* 0x07 = 8
* 0x08 = 9
* 0x09 = B
* 0x0a = D
* 0x0b = G
* 0x0c = H
* 0x0d = J
* 0x0e = K
* 0x0f = L
* 0x10 = M
* 0x11 = N
* 0x12 = P
* 0x13 = Q
* 0x14 = R
* 0x15 = T
* 0x16 = V
* 0x17 = W
* 0x18 = X
* 0x19 = Y
* 0x1a = Z
* 0x1b = #
* 0x1c = !
* 0x1d = *
* 0x1e = -
* 0x1f = ?
* 0xff = \<blank\>

### _Password Character 8_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd3f7** (8-bit)

* 0x00 = 1
* 0x01 = 2
* 0x02 = 3
* 0x03 = 4
* 0x04 = 5
* 0x05 = 6
* 0x06 = 7
* 0x07 = 8
* 0x08 = 9
* 0x09 = B
* 0x0a = D
* 0x0b = G
* 0x0c = H
* 0x0d = J
* 0x0e = K
* 0x0f = L
* 0x10 = M
* 0x11 = N
* 0x12 = P
* 0x13 = Q
* 0x14 = R
* 0x15 = T
* 0x16 = V
* 0x17 = W
* 0x18 = X
* 0x19 = Y
* 0x1a = Z
* 0x1b = #
* 0x1c = !
* 0x1d = *
* 0x1e = -
* 0x1f = ?
* 0xff = \<blank\>

### _Mission Bonus Credits_

<sub>[Back to navigation](#code-notes-navigation)</sub>

**0xd402** (16-bit)

* 0x0000 = 0
* 0x0001 = 1
* 0x0002 = 2
* ...
* 0xffff = 65535

## Achievements

<sub>[Back to Table of Contents](#table-of-contents)</sub>

### Achievements navigation

1. [Play Pen](#play-pen)
2. [Big Brain](#big-brain)
3. [Street Smarts](#street-smarts)
4. [Ice Queen](#ice-queen)
5. [Cold as Ice](#cold-as-ice)
6. [Erase the Alchemist](#erase-the-alchemist)
7. [The Scientist](#the-scientist)
8. [The Journey Begins](#the-journey-begins)
9. [Blind the Enemy](#blind-the-enemy)
10. [Eye of the Tiger](#eye-of-the-tiger)
11. [Secret Codex](#secret-codex)
12. [Lyrical Analysis](#lyrical-analysis)
13. [Liftoff](#liftoff)
14. [Soar to the Top of the Charts](#soar-to-the-top-of-the-charts)
15. [Double the Trouble](#double-the-trouble)
16. [Illuminate the Way](#illuminate-the-way)
17. [Kick Out the Stage Lights](#kick-out-the-stage-lights)
18. [Circuit Breaker](#circuit-breaker)
19. [Overdrive](#overdrive)
20. [Startup Funds](#startup-funds)
21. [Sold Out Concert](#sold-out-concert)
22. [It's a Long Way to the Top](#its-a-long-way-to-the-top)
23. [Time Keeper](#time-keeper)
24. [It's Show Time!](#its-show-time)
25. [Food Poisoning](#food-poisoning)
26. [Rock and McRoll](#rock-and-mcroll)
27. [Command an Army](#command-an-army)
28. [The King of Rock](#the-king-of-rock)
29. [Don't Stop Believin'](#dont-stop-believin)
30. [Ghost Ship](#ghost-ship)
31. [Rock the Boat](#rock-the-boat)
32. [Talk to the Dead](#talk-to-the-dead)
33. [Fortune Teller](#fortune-teller)
34. [Keeping Warm](#keeping-warm)
35. [Through the Fire and Flames](#through-the-fire-and-flames)
36. [Just Move On Up](#just-move-on-up)
37. [In Safe Hands](#in-safe-hands)
38. [The Unreleased Album](#the-unreleased-album)
39. [Enchantment](#enchantment)
40. [THE CONCOCTION](#the-concoction)
41. [Cursed Gem](#cursed-gem)
42. [Bejeweled](#bejeweled)
43. [Takin' Care of Business](#takin-care-of-business)
44. [POP!](#pop)
45. [Have a Drink on Me](#have-a-drink-on-me)
46. [Waiting for a Call](#waiting-for-a-call)
47. [Off the Hook](#off-the-hook)
48. [S.O.S](#sos)
49. [Message in a Bottle](#message-in-a-bottle)
50. [Stairway to Heaven](#stairway-to-heaven)
51. [K9 Companion](#k9-companion)
52. [Who Let the Dogs Out?](#who-let-the-dogs-out)
53. [Fast Getaway](#fast-getaway)
54. [Rock You like a Hurricane](#rock-you-like-a-hurricane)
55. [Piece of Cake](#piece-of-cake)
56. [Fight for Your Right to Party](#fight-for-your-right-to-party)
57. [A Rising Star](#a-rising-star)
58. [Hacking the Mainframe](#hacking-the-mainframe)
59. [Technologic](#technologic)
60. [Infestation](#infestation)
61. [Squash Those Beetles](#squash-those-beetles)
62. [Home Sweet Home](#home-sweet-home)
63. [Mansion Tour](#mansion-tour)
64. [School's Out!](#schools-out)
65. [King Krond](#king-krond)
66. [Speedy](#speedy)
67. [Jump to the Rescue](#jump-to-the-rescue)
68. [Invincible](#invincible)
69. [I'm the Map](#im-the-map)

### [Play Pen](https://retroachievements.org/achievement/459884)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **2**

![play pen](badges/PlayPen.png "Play Pen")

Beat the play pen tutorial

Conditions:
1. Play pen mission marked complete, and no other mission status' changed

### [Big Brain](https://retroachievements.org/achievement/459885)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level1mission1](badges/Level1Mission1.png "Level 1 Mission 1")

Destroy the mind and complete Level 1 Mission 1

Conditions:
1. Level 1 Mission 1 marked complete, and no other mission status' changed

### [Street Smarts](https://retroachievements.org/achievement/459886)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level1mission1challenge](badges/Level1Mission1Challenge.png "Level 1 Mission 1 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 1 star and complete Level 1 Mission 1

Conditions:
1. Go from the lobby to Level 1 Mission 1
2. Level 1 Mission 1 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Ice Queen](https://retroachievements.org/achievement/459887)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level1mission2](badges/Level1Mission2.png "Level 1 Mission 2")

Steal the Ice Queen's crown and complete Level 1 Mission 2

Conditions:
1. Level 1 Mission 2 marked complete, and no other mission status' changed

### [Cold as Ice](https://retroachievements.org/achievement/459888)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level1mission2challenge](badges/Level1Mission2Challenge.png "Level 1 Mission 2 Challenge")

Without taking damage, collect 1 heart and 1 star and complete Level 1 Mission 2

Conditions:
1. Go from the lobby to Level 1 Mission 2
2. Level 1 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)


### [Erase the Alchemist](https://retroachievements.org/achievement/459889)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level1mission3](badges/Level1Mission3.png "Level 1 Mission 3")

Destroy the alchemist and complete Level 1 Mission 3

Conditions:
1. Level 1 Mission 3 marked complete, and no other mission status' changed

### [The Scientist](https://retroachievements.org/achievement/459890)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level1mission3challenge](badges/Level1Mission3Challenge.png "Level 1 Mission 3 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 2 stars and complete Level 1 Mission 3

Conditions:
1. Go from the lobby to Level 1 Mission 3
2. Level 1 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [The Journey Begins](https://retroachievements.org/achievement/459891)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel1](badges/Level1.png "Complete Level 1")

Buy the lift pass for level 2 without using passwords, or if using passwords complete any two missions on level 1 before buying the lift pass for level 2

Conditions:
1. Start game with no levels completed
2. Buy level 1->2 pass

Reset When:
1. Password menu opened

### [Blind the Enemy](https://retroachievements.org/achievement/459892)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level2mission1](badges/Level2Mission1.png "Level 2 Mission 1")

Destroy the all seeing eye and complete Level 2 Mission 1

Conditions:
1. Level 2 Mission 1 marked complete, and no other mission status' changed

### [Eye of the Tiger](https://retroachievements.org/achievement/459893)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level2mission1challenge](badges/Level2Mission1Challenge.png "Level 2 Mission 1 Challenge")

Without taking damage, collect 1 heart and 2 stars and complete Level 2 Mission 1

Conditions:
1. Go from the lobby to Level 2 Mission 1
2. Level 2 Mission 1 marked complete, and no other mission status' changed AND player collected 1 heart and 2 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Secret Codex](https://retroachievements.org/achievement/459894)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level2mission2](badges/Level2Mission2.png "Level 2 Mission 2")

Read the secret code and complete Level 2 Mission 2

Conditions:
1. Level 2 Mission 2 marked complete, and no other mission status' changed

### [Lyrical Analysis](https://retroachievements.org/achievement/459895)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level2mission2challenge](badges/Level2Mission2Challenge.png "Level 2 Mission 2 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 3 stars and complete Level 2 Mission 2

Conditions:
1. Go from the lobby to Level 2 Mission 2
2. Level 2 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion and 3 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Liftoff](https://retroachievements.org/achievement/459896)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level2mission3](badges/Level2Mission3.png "Level 2 Mission 3")

Launch the self destructing rocket and complete Level 2 Mission 3

Conditions:
1. Level 2 Mission 3 marked complete, and no other mission status' changed

### [Soar to the Top of the Charts](https://retroachievements.org/achievement/459897)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level2mission3challenge](badges/Level2Mission3Challenge.png "Level 2 Mission 3 Challenge")

Without taking damage, collect 1 heart and complete Level 2 Mission 3

Conditions:
1. Go from the lobby to Level 2 Mission 3
2. Level 2 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Double the Trouble](https://retroachievements.org/achievement/459898)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel2](badges/Level2.png "Complete Level 2")

Buy the lift pass for level 3 without using passwords, or if using passwords complete any two missions on level 2 before buying the lift pass for level 3

Conditions:
1. Start game with no levels completed
2. Buy level 2->3 pass

Reset When:
1. Password menu opened

### [Illuminate the Way](https://retroachievements.org/achievement/459899)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level3mission1](badges/Level3Mission1.png "Level 3 Mission 1")

Find the flashlight and complete Level 3 Mission 1

Conditions:
1. Level 3 Mission 1 marked complete, and no other mission status' changed

### [Kick Out the Stage Lights](https://retroachievements.org/achievement/459900)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level3mission1challenge](badges/Level3Mission1Challenge.png "Level 3 Mission 1 Challenge")

Without taking damage, collect 1 heart and 2 stars and complete Level 3 Mission 1

Conditions:
1. Go from the lobby to Level 3 Mission 1
2. Level 3 Mission 1 marked complete, and no other mission status' changed AND player collected 1 heart and 2 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Circuit Breaker](https://retroachievements.org/achievement/459901)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level3mission2](badges/Level3Mission2.png "Level 3 Mission 2")

Find the electrical control box and complete Level 3 Mission 2

Conditions:
1. Level 3 Mission 2 marked complete, and no other mission status' changed

### [Overdrive](https://retroachievements.org/achievement/459902)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level3mission2challenge](badges/Level3Mission2Challenge.png "Level 3 Mission 2 Challenge")

Without taking damage, collect 1 heart, 2 gold bullions and 3 stars and complete Level 3 Mission 2

Conditions:
1. Go from the lobby to Level 3 Mission 2
2. Level 3 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart, 2 gold bullions and 3 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Startup Funds](https://retroachievements.org/achievement/459903)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level3mission3](badges/Level3Mission3.png "Level 3 Mission 3")

Search for the piggy bank and complete Level 3 Mission 3

Conditions:
1. Level 3 Mission 3 marked complete, and no other mission status' changed

### [Sold Out Concert](https://retroachievements.org/achievement/459904)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level3mission3challenge](badges/Level3Mission3Challenge.png "Level 3 Mission 3 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 2 stars and complete Level 3 Mission 3

Conditions:
1. Go from the lobby to Level 3 Mission 3
2. Level 3 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion and 2 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [It's a Long Way to the Top](https://retroachievements.org/achievement/459905)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel3](badges/Level3.png "Complete Level 3")

Buy the lift pass for level 4 without using passwords, or if using passwords complete any two missions on level 3 before buying the lift pass for level 4

Conditions:
1. Start game with no levels completed
2. Buy level 3->4 pass

Reset When:
1. Password menu opened

### [Time Keeper](https://retroachievements.org/achievement/459906)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level4mission1](badges/Level4Mission1.png "Level 4 Mission 1")

Collect the pocketwatch and complete Level 4 Mission 1

Conditions:
1. Level 4 Mission 1 marked complete, and no other mission status' changed

### [It's Show Time!](https://retroachievements.org/achievement/459907)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level4mission1challenge](badges/Level4Mission1Challenge.png "Level 4 Mission 1 Challenge")

Without taking damage, collect 1 heart and 1 gold bullion and complete Level 4 Mission 1

Conditions:
1. Go from the lobby to Level 4 Mission 1
2. Level 4 Mission 1 marked complete, and no other mission status' changed AND player collected 1 heart and 1 gold bullion in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Food Poisoning](https://retroachievements.org/achievement/459908)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level4mission2](badges/Level4Mission2.png "Level 4 Mission 2")

Get rid of the poisoned food and complete Level 4 Mission 2

Conditions:
1. Level 4 Mission 2 marked complete, and no other mission status' changed

### [Rock and McRoll](https://retroachievements.org/achievement/459909)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level4mission2challenge](badges/Level4Mission2Challenge.png "Level 4 Mission 2 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 1 star and complete Level 4 Mission 2

Conditions:
1. Go from the lobby to Level 4 Mission 2
2. Level 4 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion, and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Command an Army](https://retroachievements.org/achievement/459910)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level4mission3](badges/Level4Mission3.png "Level 4 Mission 3")

Earn the crown of attack and complete Level 4 Mission 3

Conditions:
1. Level 4 Mission 3 marked complete, and no other mission status' changed

### [The King of Rock](https://retroachievements.org/achievement/459911)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level4mission3challenge](badges/Level4Mission3Challenge.png "Level 4 Mission 3 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 1 star and complete Level 4 Mission 3

Conditions:
1. Go from the lobby to Level 4 Mission 3
2. Level 4 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion, and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Don't Stop Believin'](https://retroachievements.org/achievement/459912)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel4](badges/Level4.png "Complete Level 4")

Buy the lift pass for level 5 without using passwords, or if using passwords complete any two missions on level 4 before buying the lift pass for level 5

Conditions:
1. Start game with no levels completed
2. Buy level 4->5 pass

Reset When:
1. Password menu opened

### [Ghost Ship](https://retroachievements.org/achievement/459913)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level5mission1](badges/Level5Mission1.png "Level 5 Mission 1")

Take the ghost ship wood log and complete Level 5 Mission 1

Conditions:
1. Level 5 Mission 1 marked complete, and no other mission status' changed

### [Rock the Boat](https://retroachievements.org/achievement/459914)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level5mission1challenge](badges/Level5Mission1Challenge.png "Level 5 Mission 1 Challenge")

Without taking damage, collect 1 heart, 2 gold bullions and 1 star and complete Level 5 Mission 1

Conditions:
1. Go from the lobby to Level 5 Mission 1
2. Level 5 Mission 1 marked complete, and no other mission status' changed AND player collected 1 heart, 2 gold bullions, and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Talk to the Dead](https://retroachievements.org/achievement/459915)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level5mission2](badges/Level5Mission2.png "Level 5 Mission 2")

Collect the crystal ball and complete Level 5 Mission 2

Conditions:
1. Level 5 Mission 2 marked complete, and no other mission status' changed

### [Fortune Teller](https://retroachievements.org/achievement/459916)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level5mission2challenge](badges/Level5Mission2Challenge.png "Level 5 Mission 2 Challenge")

Without taking damage, collect 1 heart and 1 star and complete Level 5 Mission 2

Conditions:
1. Go from the lobby to Level 5 Mission 2
2. Level 5 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Keeping Warm](https://retroachievements.org/achievement/459917)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level5mission3](badges/Level5Mission3.png "Level 5 Mission 3")

Use the wood stove and complete Level 5 Mission 3

Conditions:
1. Level 5 Mission 3 marked complete, and no other mission status' changed

### [Through the Fire and Flames](https://retroachievements.org/achievement/459918)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level5mission3challenge](badges/Level5Mission3Challenge.png "Level 5 Mission 3 Challenge")

Without taking damage, collect 1 heart and 1 star and complete Level 5 Mission 3

Conditions:
1. Go from the lobby to Level 5 Mission 3
2. Level 5 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Just Move On Up](https://retroachievements.org/achievement/459919)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel5](badges/Level5.png "Complete Level 5")

Buy the lift pass for level 6 without using passwords, or if using passwords complete any two missions on level 5 before buying the lift pass for level 6

Conditions:
1. Start game with no levels completed
2. Buy level 5->6 pass

Reset When:
1. Password menu opened

### [In Safe Hands](https://retroachievements.org/achievement/459920)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level6mission1](badges/Level6Mission1.png "Level 6 Mission 1")

Return the safe and complete Level 6 Mission 1

Conditions:
1. Level 6 Mission 1 marked complete, and no other mission status' changed

### [The Unreleased Album](https://retroachievements.org/achievement/459921)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level6mission1challenge](badges/Level6Mission1Challenge.png "Level 6 Mission 1 Challenge")

Without taking damage, collect 1 gold bullion and complete Level 6 Mission 1

Conditions:
1. Go from the lobby to Level 6 Mission 1
2. Level 6 Mission 1 marked complete, and no other mission status' changed AND player collected 1 gold bullion in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Enchantment](https://retroachievements.org/achievement/459922)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level6mission2](badges/Level6Mission2.png "Level 6 Mission 2")

Smash the potion vial and complete Level 6 Mission 2

Conditions:
1. Level 6 Mission 2 marked complete, and no other mission status' changed

### [THE CONCOCTION](https://retroachievements.org/achievement/459923)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level6mission2challenge](badges/Level6Mission2Challenge.png "Level 6 Mission 2 Challenge")

Without taking damage, collect 1 heart and complete Level 6 Mission 2

Conditions:
1. Go from the lobby to Level 6 Mission 2
2. Level 6 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Cursed Gem](https://retroachievements.org/achievement/459924)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level6mission3](badges/Level6Mission3.png "Level 6 Mission 3")

Destroy the dark jewel and complete Level 6 Mission 3

Conditions:
1. Level 6 Mission 3 marked complete, and no other mission status' changed

### [Bejeweled](https://retroachievements.org/achievement/459925)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level6mission3challenge](badges/Level6Mission3Challenge.png "Level 6 Mission 3 Challenge")

Without taking damage, collect 1 heart and 1 star and complete Level 6 Mission 3

Conditions:
1. Go from the lobby to Level 6 Mission 3
2. Level 6 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Takin' Care of Business](https://retroachievements.org/achievement/459926)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel6](badges/Level6.png "Complete Level 6")

Buy the lift pass for level 7 without using passwords, or if using passwords complete any two missions on level 6 before buying the lift pass for level 7

Conditions:
1. Start game with no levels completed
2. Buy level 6->7 pass

Reset When:
1. Password menu opened

### [POP!](https://retroachievements.org/achievement/459927)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level7mission1](badges/Level7Mission1.png "Level 7 Mission 1")

Earn the fizzy soda prize and complete Level 7 Mission 1

Conditions:
1. Level 7 Mission 1 marked complete, and no other mission status' changed

### [Have a Drink on Me](https://retroachievements.org/achievement/459928)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level7mission1challenge](badges/Level7Mission1Challenge.png "Level 7 Mission 1 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 4 stars and complete Level 7 Mission 1

Conditions:
1. Go from the lobby to Level 7 Mission 1
2. Level 7 Mission 1 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion and 4 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Waiting for a Call](https://retroachievements.org/achievement/459929)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level7mission2](badges/Level7Mission2.png "Level 7 Mission 2")

Collect the phone and complete Level 7 Mission 2

Conditions:
1. Level 7 Mission 2 marked complete, and no other mission status' changed

### [Off the Hook](https://retroachievements.org/achievement/459930)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level7mission2challenge](badges/Level7Mission2Challenge.png "Level 7 Mission 2 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 3 stars and complete Level 7 Mission 2

Conditions:
1. Go from the lobby to Level 7 Mission 2
2. Level 7 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion and 3 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [S.O.S](https://retroachievements.org/achievement/459931)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level7mission3](badges/Level7Mission3.png "Level 7 Mission 3")

Release the captive voyager and complete Level 7 Mission 3

Conditions:
1. Level 7 Mission 3 marked complete, and no other mission status' changed

### [Message in a Bottle](https://retroachievements.org/achievement/459932)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level7mission3challenge](badges/Level7Mission3Challenge.png "Level 7 Mission 3 Challenge")

Without taking damage, collect 1 heart and 3 stars and complete Level 7 Mission 3

Conditions:
1. Go from the lobby to Level 7 Mission 3
2. Level 7 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart and 3 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Stairway to Heaven](https://retroachievements.org/achievement/459933)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel7](badges/Level7.png "Complete Level 7")

Buy the lift pass for level 8 without using passwords, or if using passwords complete any two missions on level 7 before buying the lift pass for level 8

Conditions:
1. Start game with no levels completed
2. Buy level 7->8 pass

Reset When:
1. Password menu opened

### [K9 Companion](https://retroachievements.org/achievement/459934)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level8mission1](badges/Level8Mission1.png "Level 8 Mission 1")

Rescue the dog and complete Level 8 Mission 1

Conditions:
1. Level 8 Mission 1 marked complete, and no other mission status' changed

### [Who Let the Dogs Out?](https://retroachievements.org/achievement/459935)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level8mission1challenge](badges/Level8Mission1Challenge.png "Level 8 Mission 1 Challenge")

Without taking damage, collect 1 heart and 1 star and complete Level 8 Mission 1

Conditions:
1. Go from the lobby to Level 8 Mission 1
2. Level 8 Mission 1 marked complete, and no other mission status' changed AND player collected 1 heart and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Fast Getaway](https://retroachievements.org/achievement/459936)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level8mission2](badges/Level8Mission2.png "Level 8 Mission 2")

Find and flee with the amphora jar and complete Level 8 Mission 2

Conditions:
1. Level 8 Mission 2 marked complete, and no other mission status' changed

### [Rock You like a Hurricane](https://retroachievements.org/achievement/459937)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level8mission2challenge](badges/Level8Mission2Challenge.png "Level 8 Mission 2 Challenge")

Without taking damage, collect 1 heart and 3 stars and complete Level 8 Mission 2

Conditions:
1. Go from the lobby to Level 8 Mission 2
2. Level 8 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart and 3 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Piece of Cake](https://retroachievements.org/achievement/459938)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level8mission3](badges/Level8Mission3.png "Level 8 Mission 3")

Eat the triple decker cake and complete Level 8 Mission 3

Conditions:
1. Level 8 Mission 3 marked complete, and no other mission status' changed

### [Fight for Your Right to Party](https://retroachievements.org/achievement/459939)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level8mission3challenge](badges/Level8Mission3Challenge.png "Level 8 Mission 3 Challenge")

Without taking damage, collect 1 heart, 1 gold bullion and 5 stars and complete Level 8 Mission 3

Conditions:
1. Go from the lobby to Level 8 Mission 3
2. Level 8 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart, 1 gold bullion and 5 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [A Rising Star](https://retroachievements.org/achievement/459940)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel8](badges/Level8.png "Complete Level 8")

Buy the lift pass for level 9 without using passwords, or if using passwords complete any two missions on level 8 before buying the lift pass for level 9

Conditions:
1. Start game with no levels completed
2. Buy level 8->9 pass

Reset When:
1. Password menu opened

### [Hacking the Mainframe](https://retroachievements.org/achievement/459941)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level9mission1](badges/Level9Mission1.png "Level 9 Mission 1")

Destroy the computer system and complete Level 9 Mission 1

Conditions:
1. Level 9 Mission 1 marked complete, and no other mission status' changed

### [Technologic](https://retroachievements.org/achievement/459942)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level9mission1challenge](badges/Level9Mission1Challenge.png "Level 9 Mission 1 Challenge")

Without taking damage, collect 1 heart and 5 stars and complete Level 9 Mission 1

Conditions:
1. Go from the lobby to Level 9 Mission 1
2. Level 9 Mission 1 marked complete, and no other mission status' changed AND player collected 1 heart and 5 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Infestation](https://retroachievements.org/achievement/459943)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level9mission2](badges/Level9Mission2.png "Level 9 Mission 2")

Smash open the jar of insects and complete Level 9 Mission 2

Conditions:
1. Level 9 Mission 2 marked complete, and no other mission status' changed

### [Squash Those Beetles](https://retroachievements.org/achievement/459944)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level9mission2challenge](badges/Level9Mission2Challenge.png "Level 9 Mission 2 Challenge")

Without taking damage, collect 1 heart, 2 gold bullions and 3 stars and complete Level 9 Mission 2

Conditions:
1. Go from the lobby to Level 9 Mission 2
2. Level 9 Mission 2 marked complete, and no other mission status' changed AND player collected 1 heart, 2 gold bullions and 3 stars in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [Home Sweet Home](https://retroachievements.org/achievement/459945)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **5**

![level9mission3](badges/Level9Mission3.png "Level 9 Mission 3")

Find a new home and complete Level 9 Mission 3

Conditions:
1. Level 9 Mission 3 marked complete, and no other mission status' changed

### [Mansion Tour](https://retroachievements.org/achievement/459946)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Missable**_
<br>
Points: **10**

![level9mission3challenge](badges/Level9Mission3Challenge.png "Level 9 Mission 3 Challenge")

Without taking damage, collect 1 heart and 1 star and complete Level 9 Mission 3

Conditions:
1. Go from the lobby to Level 9 Mission 3
2. Level 9 Mission 3 marked complete, and no other mission status' changed AND player collected 1 heart and 1 star in the mission

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)
4. Player gets hurt (loses heart or star)

### [School's Out!](https://retroachievements.org/achievement/459947)

<sub>[Back to navigation](#achievements-navigation)</sub>

Type: _**Progression**_
<br>
Points: **10**

![completelevel9](badges/Level9.png "Complete Level 9")

Complete level 9 and buy the lift pass for level 10 without using passwords

Conditions:
1. Start game with no levels completed
2. Buy level 9->10 pass

Reset When:
1. Password menu opened

### [King Krond](https://retroachievements.org/achievement/459948)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **25**

![level10mission1](badges/Level10Mission1.png "Level 10 Mission 1")

Defeat Krond and save the Mega Hero Academy!

Conditions:
1. Go from the lobby to Level 10 Mission 1
2. Level 10 Mission 1 marked complete, and no other mission status' changed

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)

### [Speedy](https://retroachievements.org/achievement/459950)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **2**

![lightning](badges/Lightning.png "Lightning")

Pick up a lightning in any mission

Conditions:
1. Start in valid mission that has lighting powerup
2. Gain 32 steps of speed

### [Jump to the Rescue](https://retroachievements.org/achievement/459951)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **2**

![powerspring](badges/PowerSpring.png "Power Spring")

Pick up a power spring in any mission except the Play Pen

Conditions:
1. Start in valid mission that has power spring powerup
2. Gain 10 power jumps

### [Invincible](https://retroachievements.org/achievement/459952)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **2**

![powerring](badges/PowerRing.png "Power Ring")

Pick up a power ring in any mission

Conditions:
1. Start in valid mission that has power ring powerup
2. Gain 32 seconds of invincibility

### [I'm the Map](https://retroachievements.org/achievement/459953)

<sub>[Back to navigation](#achievements-navigation)</sub>

Points: **2**

![map](badges/Map.png "Map")

If there's a place you got to get, a map can get you there, I bet. Find a map to reveal the mission layout

Conditions:
1. Start in valid mission that has a map
2. previously, the amount of rooms seen is no more than the max rooms available
3. the amount of rooms seen is now 56 (max)

## Rich Presence

<sub>[Back to Table of Contents](#table-of-contents)</sub>

Rich presence is available and will change depending on where you are in the game

1. if you're in the main menu it will display
    * "Title Screen"
2. if you're in the end game concert it will display
    * "Playing in the Hero Academy Concert"
3. if you're in the main lobby it will display
    * "Main Lobby"
    * Number of stars
    * level pass obtained
    * credits earned
4. if you're in a mission it will display
    * "Level X Mission Y"
    * current hearts
    * current stars

## Leaderboards

<sub>[Back to Table of Contents](#table-of-contents)</sub>

### 1. Speedrun Monster Max

The Speedrun Monster Max leaderboard is measuring the time it takes a player to complete the game from start to finish. You do not need to do every level, but you do need to earn enough points to go through each level all the way to the end in one session.

Conditions:
1. Start game with no levels completed
2. Finish Game

Reset When:
1. Password menu opened

Pause When:
* In title screen
* In start menu
* In select menu

### 2. High Score

The High Score leaderboard is a calculations of the players credits, plus stars at the end of the game. points are subtracted when you buy a lift pass. Based on _my_ calculations a player can get a max high score of 10,009.

Conditions:
1. Start game with no levels completed
2. Finish Game

Reset When:
1. Password menu opened

### 3-31. Speedrun Missions

Leaderboards 3 thru 31 are individual speedrun timers for each of the 29 missions. The logic for them is the same and will generalize in the conditions below

Conditions:
1. Player enters mission
2. Mission marked complete

Reset When:
1. Password menu opened
2. Player quits mission
3. Player dies (spawn back in lobby)

Pause When:
* In start menu
* In select menu