The email told you to look for a woman wearing a hijab and pink lipstick.
*[You survey the campus coffee shop.]
    -> intro_knot_1

=== intro_knot_1 ===
There, in the corner. She got here before you.
*[Approach her]
    ->player_goes_forth   
*[Wait for her to notice you]
    -> player_hangs_back
=== player_goes_forth ===
You walk towards her. She's sipping from a steaming cup. She doesn't see you.
*["You must be Khadijah."]
    -> recognize_Khadijah
*["I'm...are you...?"]
    -> unsure_mumbling
=== player_hangs_back ===
You hesitate in the doorway. What are you supposed to say?
Maybe you shouldn't have come.
"Excuse me." A man brushes past and gets in line for coffee.
*[You hear a voice say, "Hey. Hey! Over here."]
    -> player_hangs_back_2
=== player_hangs_back_2
It's Khadijah. She's waving you over to her table.
* [Freeze up.]
    -> freeze_up
* [Walk over to her table.]
    ->walk_to_table
=== unsure_mumbling ===
"Oh! Hi. It's...you, right?" Khadijah says.
"I guess it is," you say. A nervous laugh slips out of you.
*[She laughs too, a thin, raspy sound.]
      -> go_get_drink
=== recognize_Khadijah ===
"That's me," Khadijah says.
She smiles, but the smile doesn't reach her eyes.
*[You smile back, awkwardly.]
      -> go_get_drink
=== freeze_up ===
You turn towards the window. Panic bubbles at the back of your throat.
A hand settles on your shoulder, and you jump.
"Are you okay?" says a voice. You turn. It's Khadijah. It must be.
"I'm sorry," you say. "I don't know what came over me. I just-"
"It's fine. It's probably a lot, meeting me," she says.
*[You nod.]
      -> go_get_drink
=== walk_to_table ===
"Hi," you say. "I - ah, hi."
"I was afraid it wasn't actually you," Khadijah says. She laughs, but it sounds forced.
*["I was afraid of the same thing," you tell her.]
      -> go_get_drink
=== go_get_drink ===
"I already got something to drink," Khadijah says. "Want to go get something? I'll wait here and make sure no one takes the table."
*["Sure. I'll be right back."]
    ->player_orders_something
*["I'm fine, thanks. I don't think I could manage to eat anything right now."]
    -> player_orders_nothing
=== player_orders_nothing ===
"That's fair," Khadijah says.
*[You shrug.]

=== player_orders_something ===
You pick your nails while waiting in line. Everyone else is acting so normally. But then, how could they know why you're here?

When it's your turn, you order...
*[...a cappuccino.]
    -> order_cappuccino
*[...green tea.]
    ->order_peppermint_tea
*[...a cookie.]
    -> order_cookie
=== order_cappuccino ===
The barista hands you a cup. It's so hot you nearly yelp, but when you sip, the bitter taste of the coffee braces you.
*[You make your way back to the table.]
-> intro_describe_assault
=== order_peppermint_tea ===
The barista hands you a cup. It's so hot you nearly yelp, but when you sip, the herbal taste of the tea centers you.
*[You make your way back to the table.]
    -> intro_describe_assault
=== order_cookie ===
The woman at the counter hands you a chocolate-chip cookie. You take a small bite and focus on the sweetness to calm your nerves.
*[You make your way back to the table.]
    -> intro_describe_assault
=== intro_describe_assault ===
"I guess this is the part where we talk about what happened to us," says Khadijah. "Right?"