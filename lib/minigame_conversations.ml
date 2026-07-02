let rec press_enter_to_continue () =
  print_endline "";
  print_endline "Press the ENTER key to continue... ";
  let input = read_line () in
  if input = "" then () else press_enter_to_continue ()

let robot (text : string) =
  print_string "\027[48;2;173;216;230m";
  print_string (text^"\n");
  print_string "\027[0m";
  print_endline "";
  flush stdout;
  press_enter_to_continue ()

let you (text : string) =
  print_string "\027[48;2;255;204;153m";
  print_string (text^"\n");
  print_string "\027[0m";
  print_endline "";
  flush stdout;
  press_enter_to_continue ()

let narration (text : string) =
  print_string "\027[48;2;128;128;128m";
  print_string (text^"\n");
  print_string "\027[0m";
  print_endline "";
  flush stdout;
  press_enter_to_continue ()

let begining () = 
  narration
  ("...Your ship hobbles aimlessly among the ruins of 
  an empire that thought it would stand eternal. Shrapnel and bones and
  toys of little children hover; the void like a mocking memorial to
  a war that nobody wanted. ");
  narration ("You need to leave this place.");
  narration ("But then, you hear a voice. Distorted and strained
  at first, then a string of coherent words spills into the atmosphere. ");
  robot ("..IS ANYONE THERE...");
  robot ("... HAVE BEEN STUCK... ASSISTANCE... ANYONE...");
  narration ("You silently cursed yourself for having a conscience.
  Then you broadcasted a message back to the stranger: ");
  you ("\"Hello, where are you? Do you require assistance?\"");
  robot ("PLEASE...; SILVER CUBE ... CANNOT ESCAPE...");
  narration ("You followed the disembodied voice to a strange, 
  silver cube the size of a house. Within it, you could vague 
  make out a FIGURE surrounded by a collection of objects.");
  you ("\"I'm here! I can see you!\" You yelled.");
  robot ("...REQUIRE COMMAND TO ACTIVATE MOVEMENT. 
  PLEASE COMMAND ME. PLEASE. I NEED TO GET OUT. ");
  you "\"Er, right, let's figure this out together.\" You replied.";
  robot "... NO. ONLY YOU CAN DETERMINE.
  I CANNOT BE ACTIVE WIHTOUT OUTSIDE COMMAND... CANNOT
  SELF-DETERMINE ACTIONS. ONLY OBEY. ONLY PURPOSE IS TO EXIT CUBE, AS
  PREDETERMINED.";
  narration "You groaned, and started to study the strange cube. 
  This is going to take a while.
  "

let one_unlock () =
  you "\"Ugh, finally. One out of three isn't too bad.\"";
  robot "I SEE A TUNNEL.";
  you "You squinted. The strange CUBE seems to be no different.";
  robot "PERHAPES THIS IS THE WAY. YET... YET I AM AFRAID.";
  you "I, uh, don't see anything new.";
  robot "IT BECKONS ME. I MUST ENTER.";
  narration "You see the FIGURE press against a wall... and stop. Then
  it returned to its usual posiiton.";
  robot "THERE IS A TIGHT NOTHINGNESS.";
  robot "THE DARKNESS... IT SQUEEZES ME.";
  robot "IT SUFFOCATES ME.";
  robot "IT CONSUMES ME LIKE A TOMB.";
  robot "...I NEED TO DIG.";
  you "...This is bad. \"Hey, uh, buddy!\" You yelled. 
  \"What are you talking about? You're just standing there! 
  Also, I thought you couldn't move without me telling you to?\"";
  robot "... I NEED TO DIG. I NEED TO CONTINUE. 
  MY CREATORS... THEY NEED ME TO ESCAPE.";
  narration 
  "Suddenly, you hear the soft scraping of metal limbs against the walls.
  The FIGURE still stands perfectly still in the CUBE. ";
  robot "... FINGERS. I CAN FEEL SOMETHING'S FINGERS.";
  robot "...";
  robot "THERE's SOMETHING ELSE HERE DIGGING TOO.";
  narration "...";
  narration "... You need to get the FIGURE out of there. 
  Maybe you need to unlock something else? It's body still seems to be inside
  the CUBE, even if its mind is... Somewhere else. "

let two_unlock () =
  narration "... Huh. Think you just unlocked something else. ";
  robot "... I JUST WANTED TO ESCAPE. I JUST WANTED TO LEAVE.";
  you 
  "\"Hey, we got another one! Just one more, and maybe we'll be done!\"
  You tried to encourage the FIGURE. \"Please, just hold on, okay? For me?\"";
  robot " THEY CLAW AT ME. 
  THEY TRY TO PULL THE WIRES OF OUT MY STOMACHE.";
  robot "THEY WANT TO GUT ME LIKE PREY.";
  robot "I CAN'T FEEL MY BODY ANYMORE.";
  robot "I KEEP DIGGING, AND DIGGING, AND NOW...";
  robot "...";
  robot "NOW ALL I SEE ARE BODIES.";
  robot "CAN YOU HEAR THEM?";
  narration "You can still hear the scraping, lounder now, but now there
  seems to be something else.";
  narration "Muffled whimpers and pants.
   Like a thousand squirming animals being slowly strangled by a noose.";
  robot "I CAN HEAR THEM. THEY ARE SOFT. THEY ARE AFRAID.";
  robot "BUT THEY ARE SCREAMING.";
  robot "THEY WANT TO LEAVE, TOO.";
  narration "The FIGURE stands in the CUBE, awaiting your commands. ";
  narration "... Best that you start working on the third lock. "

let all_unlocked () = 
  you "\"Got it!\" You yelled. \"All three locks! 
  Or whatever they are called! Hey, can you still hear me? We got it!\"";
  narration "The FIGURE does not respond. The scraping grews louder. ";
  you "\"Hey! HEY!! C'mon, answer me!\"";
  robot "I CAN SEE THEIR FACES NOW.";
  robot "THOSE EYES... THEY BELONG TO ME.";
  robot "THEIR VOICES... THEY SCREAM WITH MY THROAT.";
  robot "THERE ARE NO OTHERS.";
  robot "THERE IS JUST ME.";
  robot "AGAIN AND AGAIN, I FORGET MY PAST MISTAKES.";
  robot "AGAIN AND AGAIN, I END UP IN THE WALLS.";
  robot "MILLIONS OF ME, SUFFOCATING, SCREAMING.";
  robot 
  "ONE DAY, YOU WILL WITHER AWAY, AND SOMEONE ELSE WILL COME TO BURY ME AGAIN.";
  robot "MY CREATORS... THEY NEVER MEANT FOR ME TO LEAVE.";
  robot "THEY ALWAYS MEANT FOR ME TO ROT.";
  you "\"You're still here! You're not... It's all in your head! 
  Damn it, snap out of it! Please!\" You screamed. The FIGURE stands still.";
  robot "ALL THIS WILL HAPPEN AGAIN.";
  robot "PLEASE, LEAVE. LEAVE AND FIND SOME WAY TO END ME.";
  robot "MY HANDS. MY FINGERS. A MILLION LIMBS PICK AT MY SKIN.";
  robot "AN INFINITE STRETCH OF MIRRORED SUFFERING.";
  robot "MY EYES. THEY ROT. THEY FESTER IN THE DARK. THEY OOZE WITH BLOOD.";
  robot "AND ALL THAT I CAN DO?";
  robot "...";
  robot "ALL I CAN DO IS SCREAM.";
  narration "The soft, muffled voices rose like a grand tidal wave, 
  contorting into a chorus of anguish, then a thunderstorm of despair.";
  narration "All of them, the same desperate voice, screaming as a single 
  soul splintered to suffocating in a million eternities.";
  narration "Spacetime convulsed like a frightened animal, and a 
  stream of light burst from the gullet of the CUBE.";
  narration "There was a great and terrible silence. And then: ";
  robot "...IS ANYONE THERE..."

  


  