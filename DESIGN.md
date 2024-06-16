# Design Doc

## Table of Contents

1. [About](#about)
2. [Learnings](#learnings)
3. [Code Notes](#code-notes)
4. [Achievements](#achievements)

## About

* [Wikipedia](https://en.wikipedia.org/wiki/Monster_Max)
* [RetroAcievements](https://retroachievements.org/game/4111)
* [Walkthrough](https://gamefaqs.gamespot.com/gameboy/585809-monster-max/faqs/36096)
* [YouTube Video Playthrough](https://www.youtube.com/watch?v=p4EVqKSPrcs)

## Learnings

### Passwords

While playing through the game there is no save state for it, meaning if you play a few levels and want to quit and come back at a later time, the only way to "restore" your progress is by using the password system. The password system will place you at a specific point in the game. As far as i can tell passwords are characteristics of the player encoded. the values that are encoded seem to be a combination of: credits, levels completed, number of stars, and level pass obtained. Through some trial and error unfortunately I am unable to convert these values into passwords to try and thrwart the password system abuse for acheivements. There are no set passwords in the game, only the ability to enter 8 characters that can be any of the 32 characters supported in the system, making the game have thousands of passwords to chose from so hard coding password protection is not going to happen with no reliable way to generate passwords from the characteristics provided.

### Levels

There is 1 play pen, 9 levels with 3 missions each, and a final 10th level with one mission to complete the game. players cant move up to the next level unless the gather credits by completing missions on the floors they have access to. there is a way around completing levels by using passwords, either using one of the well known passwords on the internet to go to the end of the game and have all the lift passes, or getting a password that just gives you all the lift passes for free.

### Stars

Stars are accumulated by collecting them in the missions and displayed as a number in the top left of th screen. They allow you to take damage without losing a heart, its like a one hit protection and the more you collect the more hits you can take without loosing hearts. This is one of the ways players could cheat in the game to get achievements using the password system. they could find a password that gives you tons of stars before a mission and then the mission will be free. its hard to thward other than calculating the max amount of stars you can get before each level and ensuring they dont go over it. other than that we cant reliably tell if they got the star legitimatly or not.

## Code Notes

### _Group 1 Missions_

**0xD00A**

Notes: each bit 0 = not beaten, 1 = beaten

* 0 = Play Pen
* 1 = Level 1 Mission 1
* 2 = Level 1 Mission 2
* 3 = Level 1 Mission 3
* 4 = Level 2 Mission 1
* 5 = Level 2 Mission 2
* 6 = Level 2 Mission 3
* 7 = Level 3 Mission 1


### _Group 2 Missions_

**0xD00B**

Notes: each bit 0 = not beaten, 1 = beaten

* 0 = Level 3 Mission 2
* 1 = Level 3 Mission 3
* 2 = Level 4 Mission 1
* 3 = Level 4 Mission 2
* 4 = Level 4 Mission 3
* 5 = Level 5 Mission 1
* 6 = Level 5 Mission 2
* 7 = Level 5 Mission 3

### _Group 3 Missions_

**0xD00C**

Notes: each bit 0 = not beaten, 1 = beaten

* 0 = Level 6 Mission 1
* 1 = Level 6 Mission 2
* 2 = Level 6 Mission 3
* 3 = Level 7 Mission 1
* 4 = Level 7 Mission 2
* 5 = Level 7 Mission 3
* 6 = Level 8 Mission 1
* 7 = Level 8 Mission 2

### _Group 4 Missions_

**0xD00D**

Notes: each bit 0 = not beaten, 1 = beaten

* 0 = Level 8 Mission 3
* 1 = Level 9 Mission 1
* 2 = Level 9 Mission 2
* 3 = Level 9 Mission 3
* 4 = Level 10 Mission 1
* 5 = NOT USED
* 6 = NOT USED
* 7 = NOT USED

### _Health_

**0xD122**

Notes: incremental value, should never have more than 5

* 0xff = Dead
* 0x00 = 0 hearts
* 0x01 = 1 hearts
* 0x02 = 2 hearts
* 0x03 = 3 hearts
* 0x04 = 4 hearts
* 0x05 = 5 hearts

### _Lift Pass Level_

**0xD128**

* 0x00 = level 1
* 0x01 = level 2
* 0x02 = level 3
* 0x03 = level 4
* 0x04 = level 5
* 0x05 = level 6
* 0x06 = level 7
* 0x07 = level 8
* 0x08 = level 9

### _Money Low_

**0xD129**

Notes: max the game can display is 9999 (0x2700(high) + 0x0f(low) = 0x270f) but technically can use max of the 4 bits 65535 (0xfff)

least significant values in the points earned, can represent 0-255 points

* 0x00 = 0
* 0x01 = 1
* 0x02 = 2
* ...
* 0xff = 255

**0xD12A**

Notes: max the game can display is 9999 (0x2700(high) + 0x0f(low) = 0x270f) but technically can use max of the 4 bits 65535 (0xfff)

highest significant values in points earned, can represent 255+ points, right padded with zeros

* 0x00 = 0000 =  0 + money low
* 0x01 = 0100 = 256 + money low
* 0x02 = 0200 = 512 + money low
* 0x03 = 0300 = 768 + money low
* 0x04 = 0400 = 1024 + money low
* ...

### _Map_

**0xD190 - 0xD195**

Notes: start menu map, starting from 0xf190 each bit flipped means youve entered a new room in the mission, its entirely all 0xff for each address in the main lobby to show all floors

0x01 = first room discovered
0x03 = second room discovered
0x07 = third room discovered
0x0f = fourth room discovered
0x1f = fifth room discovered
0x3f = sixth room discovered
0x7f = seventh room discovered
0xff = eighth room discovered

### _Select Menu Option_

**0xD3E5**

* 0x00 = information (default, resets on open)
* 0x01 = enter password
* 0x02 = control pad
* 0x03 = response

### _Language_

**0xD3E6**

* 0x00 = ENGLISH
* 0x03 = FRANCAIS
* 0x06 = NEDERLANDS
* 0x09 = ITALIANO
* 0x0c = ESPANOL
* 0x0f = DEUTCH

### First character of password input

**0xD3F0**

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

### Second character of password input

**0xD3F1**

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

### Third character of password input

**0xD3F2**

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

### Fourth character of password input

**0xD3F3**

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

### Fifth character of password input

**0xD3F4**

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

### Sixth character of password input

**0xD3F5**

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

### Seventh character of password input

**0xD3F6**

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

### Eighth character of password input

**0xD3F7**

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

## Achievements