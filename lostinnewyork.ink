// Lost in New York - Interactive Story
// Trying to find your friends somewhere in downtown Manhattan

VAR phone_battery = 12
VAR checked_texts = false
VAR asked_stranger = false

-> downtown

=== downtown ===
You're standing on the corner of Broadway and Canal, drowning in a river of people who all seem to know exactly where they're going. You do not.

Your phone buzzes — 12% battery. The group chat has been firing off messages all afternoon, but the last useful ones were:

    "meet us at the place near the thing"
    "you know, by the subway? the good one"
    "just ask for Danny"

That was forty minutes ago. Since then: silence.

The March wind cuts between the buildings and straight through your jacket. Somewhere in this city, your friends are having a great time without you.

+ [Scroll back through the group chat] -> check_texts
+ [Look around for landmarks] -> look_around
+ [Ask a stranger for help] -> ask_stranger
+ [Just pick a direction and walk] -> pick_direction

=== check_texts ===
~ checked_texts = true
~ phone_battery = phone_battery - 3
You shield the screen from the glare and scroll up through the chat. Battery drops to {phone_battery}%.

Between a string of memes and someone's hot take about pizza, you find a few more clues:

    "the place with the red awning"
    "no wait it's more like maroon"
    "it's on a street that starts with M maybe?? or W"
    "lol Danny says hi"

Who is Danny? You've never heard of a Danny in your life.

Still — red (or maroon) awning. Street starting with M or W. That's... something.

+ [Look around for a red awning] -> look_around
+ [Search the map app before your phone dies] -> search_map
+ [Call someone in the group] -> call_friend

=== look_around ===
You scan the streetscape. In every direction: awnings. Green ones, blue ones, black ones. A faded orange one that might have been red in 2003.

{checked_texts:
    Wait — there. Half a block down, on what a street sign confirms is Mulberry Street: a deep maroon awning over a narrow doorway. No sign, no name. Just a maroon awning and a faint thump of bass from inside.
    + [Head for the maroon awning] -> maroon_awning
    + [That's too sketchy — search the map instead] -> search_map
- else:
    None of them mean anything to you. This is Manhattan — every block has forty awnings and none of them are labeled "your friends are in here."

    A taxi honks. A man carrying an improbable number of shopping bags clips your shoulder without slowing down.

    + [Check the group chat for more clues] -> check_texts
    + [Just pick a direction and walk] -> pick_direction
    + [Ask a stranger for help] -> ask_stranger
}

=== ask_stranger ===
~ asked_stranger = true
You stop a woman in a long coat who looks like she might be a local.

"Excuse me, do you know a place around here with a red awning? Someone named Danny?"

She barely breaks stride. "Danny? Danny's? Yeah — Mulberry, half a block south. The maroon door." She's already gone.

{phone_battery > 5:
    + [Head to Mulberry Street] -> maroon_awning
    + [Text the group that you're coming] -> text_group
- else:
    Your phone is basically dead. No time to text. Just go.
    + [Head to Mulberry Street] -> maroon_awning
}

=== search_map ===
~ phone_battery = phone_battery - 4
You open Maps. The little blue dot spins, trying to find you among the canyon of buildings. Battery: {phone_battery}%.

{phone_battery > 0:
    The GPS locks in just long enough to show Mulberry Street one block east. There's a cluster of restaurants and bars, but nothing called "Danny's" or "The Place Near The Thing."

    Your screen dims — low power mode kicks in.

    + [Head toward Mulberry Street] -> maroon_awning
    + [Call someone before your phone dies] -> call_friend
- else:
    The screen flickers and goes black. Your phone is dead.

    You're alone in downtown Manhattan with no map, no contacts, and a vague memory of the word "Mulberry."

    + [Head east and hope for the best] -> maroon_awning
    + [Give up and find food on your own] -> give_up
}

=== call_friend ===
~ phone_battery = phone_battery - 5
{phone_battery > 0:
    You call Jess. It rings four times, then she picks up — you can hear laughter and music behind her.

    "WHERE ARE YOU? We're at Danny's!"
    "I don't know what Danny's is!"
    "It's on Mulberry! The maroon — wait, are you on Canal? Just walk south on Mulberry, you'll see it. Hurry up, Marcos is doing karaoke."

    She hangs up. Battery: {phone_battery}%. At least now you know.

    + [Head to Mulberry Street] -> maroon_awning
- else:
    You hear half a ring, then silence. The screen goes black. Dead.

    But you caught Jess's voice for half a second — and behind it, the unmistakable sound of very bad karaoke. Mulberry Street. Has to be.

    + [Head east toward the sound of terrible singing] -> maroon_awning
}

=== text_group ===
~ phone_battery = phone_battery - 2
You fire off a text: "omw - mulberry right?"

Three dots appear. Then: "YES HURRY danny says he's saving you a seat"

Who IS Danny??

Battery: {phone_battery}%.

+ [Head to Mulberry Street] -> maroon_awning

=== pick_direction ===
You pick east, because east feels right. Or maybe because the wind is coming from the west and you're freezing.

Two blocks later, you're on a quieter street. The chaos of Canal fades behind you. Here the buildings are shorter, the storefronts smaller. Old Italian bakeries next to new bubble tea shops.

A hand-painted sign in a window reads: "Danny's — No Sign Needed." Below it, a maroon awning.

You stop. This can't be that easy. Can it?

+ [Go inside] -> maroon_awning

=== maroon_awning ===
You push through the heavy wooden door under the maroon awning.

Inside: warm light, exposed brick, a long bar, and a sound system playing something between jazz and hip-hop. The place is packed but not suffocating. It smells like garlic and old wood.

And there — in the back corner, crammed around a table that's too small for them — are your friends. Jess waves frantically. Marcos is holding a karaoke mic like a weapon. Someone you don't recognize is pouring drinks.

"FINALLY!" Jess shouts over the music.

{asked_stranger: "A woman on the street told me about this place," you say. "How does everyone know Danny's except me?"}
{checked_texts: "Your directions were terrible," you say, dropping into the empty chair. "A street that starts with M or W?"}
{not checked_texts && not asked_stranger: "I literally just walked in a random direction and ended up here," you say.}

The stranger pouring drinks leans over and extends a hand. "I'm Danny. Welcome. First drink's on me — you look like you've earned it."

So that's Danny.

+ [Sit down and order something warm] -> the_end
+ ["How does everyone know you except me?"] -> ask_danny

=== ask_danny ===
Danny grins. "I know everyone. I'm the bartender. And the owner. And the guy who fixes the radiator. You're the last of the group — Jess wouldn't shut up about you."

"She said you'd get lost."

"She was right."

Danny slides a drink across the table. Something amber and warm. "On the house. Anyone who can find this place without a sign deserves a free one."

+ [Take the drink and settle in] -> the_end

=== give_up ===
You find a small dumpling shop on the corner and slide into a window seat alone. The dumplings are perfect — crispy on the bottom, soup inside.

Your phone is dead. Your friends are somewhere. But honestly? This is fine. The city hums around you, warm broth steams up the window, and for the first time all night, you stop rushing.

Maybe they'll find you instead.

-> END

=== the_end ===
The evening unfolds the way good evenings do — slowly and then all at once. Marcos butchers three songs. Jess tells the story of how you once got lost in a mall parking lot for forty-five minutes. Danny keeps the drinks coming and laughs at everything.

Outside, the city roars on without you. But in here, under the maroon awning on Mulberry Street, you've finally arrived.

-> END
