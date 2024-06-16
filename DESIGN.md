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

### _Missions Complete_

**0xD00A - 0xD00D**

Notes: each bit 0 = not beaten, 1 = beaten

* 0 = room 1
* 1 = room 2
* 2 = room 3
* 3 = room 4
* 4 = room 5
* 5 = room 6
* 6 = room 7
* 7 = room 8

### _Language_

**0xD3E6**

* 0x00 = ENGLISH
* 0x03 = FRANCAIS
* 0x06 = NEDERLANDS
* 0x09 = ITALIANO
* 0x0c = ESPANOL
* 0x0f = DEUTCH

### _Health_

**0xF122**

Notes: incremental value, should never have more than 5

* 0xff = Dead
* 0x00 = 0 hearts
* 0x01 = 1 hearts
* 0x02 = 2 hearts
* 0x03 = 3 hearts
* 0x04 = 4 hearts
* 0x05 = 5 hearts

### _Map_

**0xF190 - 0xF195**

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

**0xF3E5**

* 0x00 = information (default, resets on open)
* 0x01 = enter password
* 0x02 = control pad
* 0x03 = response

## Achievements