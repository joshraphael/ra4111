# Design Doc

## About the game

* [Wikipedia](https://en.wikipedia.org/wiki/Monster_Max)
* [RetroAcievements](https://retroachievements.org/game/4111)
* [Walkthrough](https://gamefaqs.gamespot.com/gameboy/585809-monster-max/faqs/36096)
* [YouTube Video Playthrough](https://www.youtube.com/watch?v=p4EVqKSPrcs)

## Learnings

### Save states

While playing through the game there is no save state for it, meaning if you play a few levels and want to quit and come back at a later time, the only way to "restore" your progress is by using the password system. The password system will place you at a specific point in the game, AND award max points to the palyer regardless of if they got those points previously or not. This is something to watch out for when designing the acheivements as we need to detect when a password is put in when considering awarding an acheivement. Passwords not only place you at a point in the game after each mission, but there are passwords for setting the state right after purchasing level passes as well.

Passwords:

* Initial Spawn (#0 credit): `XY#-38JV`
* After PlayPen: (#1 credit): `-?NRX*49`
* After Level 1 Mission 1 (#49 credits): `!*K269KM`
* After Level 1 Mission 2: (#94 credits): `BD4KPRZ1`
* After Level 1 Mission 3: (#145 credits): `9BZY*2W!`
* Before Level 2 Mission 1: (#75 credits): `9Y2HMVHR`
* After Level 2 Mission 1: (#134 credits): `M2LVZ!Z5`
* After Level 2 Mission 2: (#209 credits): `8XG379PZ`
* After Level 2 Mission 3: (#281 credits): `P4V#?8QZ`
* Before Level 3 Mission 1: (#151 credits): `?9W-35RZ`
* After Level 3 Mission 1: (#261 credits): `1B?15DLR`
* After Level 3 Mission 2: (#361 credits): `P#L9HP8-`
* After Level 3 Mission 3: (#511 credits): `6KLHMV4V`
* Before Level 4 Mission 1: (#311 credits): `VLH*26T-`

### Levels

There is 1 play pen, 9 levels with 3 missions each, and a final 10th level with one mission to complete the game. players cant move up to the next level unless the gather credits by completing missions on the floors they have access to. 