open Minigame_conversations

(* there is an overall location, which the player can navigate around. each
sublocation is a place the player can navigate to. Each sublocation contains
a number of items that the player can;teract with.
*)
type item = {name : string; mutable description : string;
mutable active_status : bool; holdable : bool;
hint : string}
type sub_location = item array
type overall_location = (string*sub_location) array

let print_location (location : overall_location) =
  print_string "[";
  Array.iter (fun x -> match x with (y,_) -> 
  ANSITerminal.print_string [ANSITerminal.on_cyan] (y^", ")) location;
  print_endline "]"

let print_items (sublocation : sub_location) =
  print_string "[";
  Array.iter (fun x -> match x with 
  {name = y;_}
  -> ANSITerminal.print_string [ANSITerminal.on_cyan] (y^", ")) sublocation;
  print_endline "]"

let print_item_name (item : item) =
  print_string "[";
  match item with {name=y;_} 
  -> ANSITerminal.print_string [ANSITerminal.on_cyan] y;
  print_endline "]"

let print_description (item : item) =
  print_string "[DESCRIPTION: ";
  match item with {description=y;_} 
  -> ANSITerminal.print_string [ANSITerminal.on_cyan] y;
  print_endline "]"

let print_hint (item : item) =
  print_string "[HINT: ";
  match item with {hint=y;_} 
  -> ANSITerminal.print_string [ANSITerminal.on_cyan] y;
  print_endline "]"

let introduce_location (location : overall_location) = 
  print_string "The strange cube consists of four walls: ";
  print_location location;
  print_endline "";
  ANSITerminal.print_string [ANSITerminal.on_magenta]
  "    ---------------------------------------------------------------
    | Use the WASD keys to command the FIGURE IN THE CUBE to face |
    | different walls to interact with objects near them.         |
    | W for front, A for left, D for right, and S for back.       |
    ---------------------------------------------------------------";
  print_endline "";
  press_enter_to_continue ()

let introduce_sublocation (sublocation : sub_location) =
  print_endline "Near the wall the FIGURE is currently facing are: ";
  print_items sublocation;
  ANSITerminal.print_string [ANSITerminal.on_magenta]
  "   -----------------------------------------------------
   | To CHOOSE an item, first, enter its numeric index.| 
   | E.g. the first item has the index 0, and so on.   |
   -----------------------------------------------------";
   print_endline "";
  press_enter_to_continue ();
  ANSITerminal.print_string [ANSITerminal.on_magenta] 
  "  -------------------------------------------------------------------
  | To INSPECT the item more closely, press i.                      |
  | To tell the FIGURE IN THE CUBE to PICK IT UP, press p.          |
  | The FIGURE can only hold one item at a time. If it picks up one |
  | item up it will drop the one it's currently holding.            |
  -------------------------------------------------------------------";
  print_endline "";
  press_enter_to_continue ();
  ANSITerminal.print_string [ANSITerminal.on_magenta]
  "   -------------------------------------------------------
   | To tell the FIGURE to USE the item it picked up,    |
   | with the item you are currently inspecting, press u.|
   | To see a HINT about the item, press h.              |
   -------------------------------------------------------";
  print_endline "";
  press_enter_to_continue ();
  ANSITerminal.print_string [ANSITerminal.on_magenta]
  "   ----------------------------------------------------------------
   | To GET AWAY from the item and do something else, press enter.|
   | To see a MAP of the CUBE, press m.                           |
   | Press literally anything else to see the instructions again. |
   | If you want to give up and pass the game, type solve.        |
   ----------------------------------------------------------------";
  press_enter_to_continue ();
  print_string "\027[48;5;18m";
  print_string 
  "   ----------------------------------------------------
   | To escape:                                       |
   |   Mend the broken bone,                          |
   |   Quench the thirst of the wilted flora,         |
   |   Read the text inscribed on the wall.           |
   |   ...                                            |
   |   Hah. Good luck.                                |
   ----------------------------------------------------";
  print_string "\027[0m";
  print_endline ""
    
(*Set up a round of the game*)
  
let box = {
  name = "A first_aid box with a lock"; 
  description = "The box is locked.";
  active_status = false;
  holdable = true;
  hint = "PIkc up the key and use it with the box."}

let cyber_arm = {
  name = "A cybernetic arm lit on fire";
  description = "More specifically, it's fingertips are on fire.
  Etched across the surface is the phrase: 
  I CANNOT LEAVE. I BREAK AGAIN AND AGAIN. MY BODY IS ALREADY A CORPSE.";
  active_status = false;
  holdable = true;
  hint = "Pick this up and use it with the light."
}

let report = {
  name = "File |Project Update|";
  description = "Most of the writing is unreadable: 
  ...Continue simulation training until escape is possible...
  ... the war has gone on for too long, more than ninety nine cycles ... 
  ... memory erasure problems ...
  ... I could hear IT scream, sometimes, when IT remembers all the 
   times it had failed. ";
  active_status = false;
  holdable = false;
  hint = "There is nothing else to do."
}

let key = {
  name = "A key";
  description = "Hopefully, it still works.";
  active_status = false;
  holdable = true;
  hint = "Pick this up and use it with the box."
}

let cloth = {
  name = "A piece of washcloth";
  description = "It's dirty. It's been used to wipe things clean.";
  active_status = false;
  holdable = true;
  hint = "Pick this up and use it with the cup"
}

let light = {
  name = "A light";
  description = "It needs to be lit.";
  active_status = false;
  holdable = true;
  hint = "Pick up the arm on fire and use it with the light."
}

let wall = {
  name = "A silver wall";
  description = "Something is written on it. 
  But, its surroundings are too dark. You cannot read it yet.";
  active_status = false;
  holdable = false;
  hint = "Lit the light, then pick it up and use it with the wall."
}

let bone = {
  name = "A broken bone";
  description = "Upon closer inspection, it's made of metal.
  Maybe you need some bandages? ";
  active_status = false;
  holdable = false;
  hint = "Unlock the first-aid box, pick it up and use it with the bone."
}

let cup = {
  name = "A cup";
  description = "It's dirty. It needs to be wiped clean.";
  active_status = false;
  holdable = true;
  hint = "Pick up the cloth and use it with the cup."
}

let water = {
  name = "A puddle of water";
  description = "A puddle of water. 
  If only you have something to contain it with.";
  active_status = false;
  holdable = false;
  hint = "Clean the cup, pick it up and use it with the water."
}

let plant = {
  name = "A plant";
  description = "It's wilted. Maybe it needs... ";
  active_status = false;
  holdable = false;
  hint = 
  "Clean the cup, fill it with water, and pick it up to use it with the plant."
}

let (front_wall : sub_location) = [|bone;plant;cyber_arm|]

let (left_wall : sub_location) = [|wall;key;box|]

let (right_wall : sub_location) = [|water;cloth|]

let (back_wall : sub_location) = [|cup;light;report|]

let (overall : overall_location) = [|("Front Wall",front_wall);
("Left Wall",left_wall);("Right Wall",right_wall);("Back Wall",back_wall)|]

let robot_location = ref front_wall

let robot_holding = ref []

let num_unlocks = ref 0

let navigate_location (second_input : string) =
  match second_input with 
  | "W" | "w" -> 
    robot_location := front_wall;
    print_endline "The FIGURE moved to the front wall. ";
    print_string "Near the wall the FIGURE is currently facing are: ";
    print_items !robot_location
  | "A" | "a" -> 
    robot_location := left_wall;
    print_endline "The FIGURE moved to the left wall. ";
    print_string "Near the wall the FIGURE is currently facing are: ";
    print_items !robot_location
  | "S" | "s" -> 
    robot_location := back_wall;
    print_endline "The FIGURE moved to the back wall. ";
    print_string "Near the wall the FIGURE is currently facing are: ";
    print_items !robot_location
  | "D" | "d" -> 
    robot_location := right_wall;
    print_endline "The FIGURE moved to the right wall. ";
    print_string "Near the wall the FIGURE is currently facing are: ";
    print_items !robot_location
  | _ -> ()

let pick_drop_item (chosen_item : item) =
  print_string "The FIGURE took ";
  print_item_name chosen_item;
  match !robot_holding with
  |[] -> robot_holding := [chosen_item];
  |[x] -> robot_holding := [chosen_item];
  print_string "The FIGURE put back ";
  print_item_name x
  |_->()

let print_holding () =
  match !robot_holding with
  |[] -> ANSITerminal.print_string [ANSITerminal.on_cyan] "Nothing"
  |[x] -> (print_string "[";
  match x with {name=y;_} 
  -> ANSITerminal.print_string [ANSITerminal.on_cyan] y;
  print_string "]")
  |_->()

let story_progress () =
  if !num_unlocks = 1 then one_unlock () else if !num_unlocks = 2 
    then two_unlock () else ()

let print_map () = 
  print_string "The FIGURE is facing ";
  print_items !robot_location;
  print_string "The FIGURE is holding ";
  print_holding ();
  print_endline "";
  ANSITerminal.print_string [ANSITerminal.on_cyan] "
  Here's a MAP of the CUBE: 
  ------------------------------------------------------------------------------
  |FRONT WALL (Enter w): [A broken bone, A plant, A cybernetic arm lit on fire]|
  |LEFT WALL (Enter a): [A silver wall, A key, A first_aid box with a lock]    |
  |RIGHT WALL (Enter d): [A puddle of water, A piece of washcloth]             |
  |BACK WALL (Enter s): [A cup, A light, File |Project Update|]                |
  ------------------------------------------------------------------------------
  ";
  print_endline ""

let apply_item (current_item : item) =
  match !robot_holding with
  |[] -> print_endline "Not holding anything right now."
  |[x] ->
      if x = cyber_arm && current_item = light then (
        light.active_status <- true;
        light.description <- "The light is lit.";
        print_endline "The FIGURE lit the light."
      )
      else if x = key && current_item = box then (
        box.active_status <- true;
        box.description <- "Inside, a bundle of bandages.";
        print_endline 
        "The FIGURE unlocked the box. Inside, a bundle of bandages."
      )
      else if x = box && current_item = bone then (
        if box.active_status = true && bone.active_status = false then (
          bone.active_status <- true;
          bone.description <- 
          "Written on the bone and bandages is the message: UNLOCKED.";
          print_endline 
          "The figure bandaged the bone. Written on the
          bone and bandages is the message: UNLOCKED.
          ";
          print_endline 
          "...This is a metal bone, why does it need bandages? You thought.";
          num_unlocks := !num_unlocks + 1;
          press_enter_to_continue ();
          story_progress ()
        ) else if bone.active_status = true && box.active_status = true then (
          print_endline "Already UNLOCKED."
        )
        else print_endline "Might need to unlock the box first... Use the key."
      )
      else if x = cloth && current_item = cup then (
        cup.active_status <- true;
        cup.description <- "This cup can probably contain something.";
        print_endline "The FIGURE cleaned the cup. It can probably 
        contain something... "
      )
      else if x = cup && current_item = water then (
        if cup.active_status = true then (
          water.active_status <- true;
          cup.description <- "The cup is filled with water";
          print_endline "The FIGURE scooped up some water with the cup."

        ) else print_endline "Have to clean the cup first... Use the cloth."
      )
      else if x = cup && current_item = plant then (
        if cup.active_status = true && water.active_status = true 
          && plant.active_status = false then (
          plant.active_status <- true;
          plant.description <- "Alive, at last. As the flower bloomed,
          written across its petals is the message: UNLOCKED.";
          print_endline 
          "
          The FIGURE watered the plant. As the flower bloomed,
          written across its petals is the message: UNLOCKED.
          ";
          num_unlocks := !num_unlocks + 1;
          press_enter_to_continue ();
          story_progress ()
        ) else if cup.active_status = true && water.active_status = false then (
          print_endline "Might want to get some water first with that cup..."
        ) else if cup.active_status = true && water.active_status = true 
          && plant.active_status = true then (
          print_endline "Already UNLOCKED."
        ) 
      else (
          print_endline "Have to clean the cup first... Use the cloth."
        )
      )
      else if x = light && current_item = wall then (
        if light.active_status = true && wall.active_status = false then (
          wall.active_status <- true;
          wall.description <- "Written on it is the message: UNLOCKED.";
          print_endline 
          "
          Finally, the word on the wall is shown. 
          It simply states: UNLOCKED.
          ";
          num_unlocks := !num_unlocks + 1;
          press_enter_to_continue ();
          story_progress ()
        ) else if light.active_status = true && wall.active_status = true then (
          print_endline "Already UNLOCKED."
        )
      else 
          print_endline "Might want to lit the light first. That cybernetic 
          arm might come in handy..."
      )
      else (
        print_endline "Didn't work. Nothing happened... ";
      )
  |_ -> print_endline "Nothing happened..."


let correct_passcode () =
  ANSITerminal.print_string [ANSITerminal.on_cyan] "Giving up so easily?";
  ANSITerminal.print_string [ANSITerminal.on_cyan] "...";
  ANSITerminal.print_string [ANSITerminal.on_cyan] "Dissapointing.\n";
  press_enter_to_continue ();
  wall.active_status <- true;
  plant.active_status <- true;
  bone.active_status <- true;
  if !num_unlocks = 1 then (print_endline "You solved the lock.";
   two_unlock(); print_endline "You solved the lock.";) 
  else if !num_unlocks = 2 then (print_endline "You solved the lock.") 
  else
      (print_endline "You solved a lock.\n"; one_unlock (); 
      print_endline "You solved another lock.\n"; two_unlock (); 
      print_endline "You solved another lock.\n";)

let rec interact_item () =
  if wall.active_status = true && plant.active_status = true && 
    bone.active_status = true then all_unlocked ()
  else
  (print_string 
  "You can choose item(0,1,2...), move to(wasd), solve(solve), or get map(m): ";
  let input = read_line () in
  (try 
  match input with 
  |"W"|"w"|"A"|"a"|"S"|"s"|"D"|"d" -> navigate_location input;
  |"M"|"m" -> print_map ();
  |"solve"|"Solve"|"SOLVE" -> correct_passcode ()
  |_-> ();
  let index = int_of_string input in
  let chosen_item = (Array.get !robot_location index) in
  print_string "You chose item ";
  print_item_name chosen_item;
  print_endline "You decided to inspect(i), pick up(p), use with(u), 
  move to(wasd), get hint(h), solve(solve), or get map(m):";
  let second_input = read_line () in
    match second_input with
    |"I"|"i" -> print_string "You choose "; print_description chosen_item
    |"P"|"p" -> if chosen_item.holdable=true then pick_drop_item chosen_item 
    else print_endline "Can't pick this one up."
    |"U"|"u" ->  print_string "The FIGURE used the item it's holding, ";
    print_holding (); print_string " with "; 
    print_item_name chosen_item; apply_item chosen_item
    |"W"|"w"|"A"|"a"|"S"|"s"|"D"|"d" -> navigate_location second_input
    |"H"|"h" -> print_hint chosen_item
    |"M"|"m" -> print_map ()
    |"solve"|"Solve"|"SOLVE" -> correct_passcode ()
    |"" -> interact_item ()
    |_ -> introduce_sublocation (!robot_location); print_map ()
  with
  | _ -> ());
interact_item ()) 

let interactions () =
begining ();
introduce_location overall;
introduce_sublocation !robot_location;
print_map ();
print_endline "Just press m to see the map again!";
interact_item ()

let () = interactions ()
