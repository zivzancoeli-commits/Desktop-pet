Eli's dog - hand-authored pixel-art animation set (dog_hd) - v7
===============================================================

Every sheet is a single row of 64x64 frames (sheet height 64 px, width = 64 x frames).
Transparent background with hard alpha (0 or 255 only). 1 px dark warm-brown outline (#3b241a).
The dog faces RIGHT in every frame. The lowest paw/body pixel is on row 60, the outline is on row 61,
and rows 62-63 are empty, so all animations share the same baseline. The dog is the same scale in every sheet.
All sheets share one 16-color palette.

Animation      Frames  Godot FPS  Loop   Notes
-------------  ------  ---------  -----  ---------------------------------------------
Walk_Right       8        10      yes    4-beat lateral walk, body bob, raised tail sway
Idle             6         6      yes    standing, breathing, raised tail wag, one blink
Sit              5         8      NO     stand -> sit (play once, then switch to Sit_Idle)
Sit_Idle         4         4      yes    sitting, breathing, blink
Lie_Down         5         8      NO     stand -> lying on belly (play once, then Sleep)
Sleep            4         2      yes    lying with eyes closed, slow breathing, little "z"
Roll             6         6      yes    flop onto the back, belly-up wiggle, flop back
Play_Bow         4         6      yes    front down, rear up, tail wagging
Bark             4         6      yes    one "woof": closed, open, open, closed (tail up)

Files: Walk_Right_sheet.png, Idle_sheet.png, Sit_sheet.png, Sit_Idle_sheet.png, Lie_Down_sheet.png,
       Sleep_sheet.png, Roll_sheet.png, Play_Bow_sheet.png, Bark_sheet.png

Godot 4 setup
-------------
1. Select each PNG in the FileSystem dock. In the Import tab, set Filter = Nearest (or set
   Project Settings > Rendering > Textures > Default Texture Filter = Nearest), then click Reimport.
2. Add an AnimatedSprite2D. In SpriteFrames, add one animation per sheet and use
   "Add frames from sprite sheet": Horizontal = frame count, Vertical = 1. Select all frames.
3. Set each animation's FPS and Loop as in the table. Sit and Lie_Down have Loop off.
4. To walk left, use flip_h = true with Walk_Right.
5. For a 200x200 window, scale the sprite 3x (192 px).

v2 changes (Oct 1 2026)
-----------------------
- Head redrawn by hand from Eli's new right-facing head photos: bigger, blockier head with a short,
  deep, blunt muzzle, a clear stop and a big black nose; pink-rimmed dark-brown eye; dark lip line;
  semi-erect ears whose tips fold forward, with tan freckles and a tan patch at the ear base.
  Sprites: normal, blink, bark (open mouth), sleep (eyes shut) and an upside-down variant for Roll.
- Neck is short and thick in every pose; the head sits close to the shoulders, carried level with or
  a little above the back. The dark collar sits right behind the skull, the hot-pink collar (with
  buckle) just behind it.
- Tail is carried raised (white tip) in Walk_Right, Idle and Bark.
- Frame counts, FPS, sheet sizes, baseline and palette are unchanged, so the Godot setup is the same.

v3 changes (Oct 1 2026)
-----------------------
- New head picked by Eli ("C4"): small rose ear folded back with the pink inside showing (no tall ear),
  head carried level / slightly nose-down, mouth line right at the bottom of the head, pink-rimmed eye,
  big black nose. Full set redrawn by hand to match: normal, blink, bark (mouth opens at the bottom,
  pink tongue), sleep (eyes shut) and an upside-down version re-shaded for Roll.
- Neck stays short and thick with the collars right behind the head, as in v2.
- Frame counts, FPS, sheet sizes, baseline and palette are unchanged, so the Godot setup is the same.
- Bark: the inside of the open mouth is now near-black (nose colour) with a clearly visible pink tongue
  lying on the lower jaw (tip peeking past the front), and the front of the bottom lip is pink.

v6 changes (Oct 1 2026)
-----------------------
- Smaller head: "S1.5", 13x12 px (was 16x15), about 81% of the v5 head. Hand-redrawn in every
  variant: normal, blink, sleep, bark (13x14, near-black mouth, pink tongue and pink lip kept) and the
  upside-down Roll head. Rose ear, pink-rimmed eye, black nose and the mouth at the bottom are kept.
- The head sits on the same short thick neck with the collars right behind it; only head pixels changed.
- Frame counts, FPS, sheet sizes, baseline and palette are unchanged, so the Godot setup is the same.

v7 changes (Oct 2 2026)
-----------------------
- Slim, tapered neck ("N1") to suit the smaller S1.5 head: the throat now runs in one straight line from
  just behind the back of the jaw into the front of the chest/foreleg (no puff under the jaw), and the top
  of the neck meets the back of the skull 2 px lower, then runs straight down to the shoulders.
- The dark collar still sits right behind the skull with the pink collar behind it, cut to the new neck width.
- Head (S1.5, 13x12), frame counts, FPS, sheet sizes, baseline and palette are unchanged, so the Godot
  setup is the same. Necks resting on the floor (late Lie_Down, Sleep, Roll) are unchanged.
- Fix (Oct 2 2026): an over-eager clean-up step had removed small separate or 1-px details; they are back
  exactly as in v6: the floating sleep "z" in Sleep frames 2-4, paw-toe pixels, and tail / ear tips.
  Only the neck area differs from v6.
