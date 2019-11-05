
=== Mikaela_knot_1 ===
    ~conversant_name = "Mikaela"
        Rosaaaaaa
        two things
        first, do you have dinner plans? I have space today between class and rehearsal and I want to see you
        you're always so busy!
        * depends. where do you want to go?
            -> Rosa_is_nervous_about_dinner
        * wish I could, but I have a problem set due at 9:00 tonight :/
            ->Rosa_doesnt_have_time
    = Rosa_is_nervous_about_dinner
        The Krak? I know you don't like the dining hall
        plus I could use a burger
        * yeah, the Krak works <>
        - okay, perfect! see you at 6
        -> Mikaela_second_question
    = Rosa_doesnt_have_time
        awww okay
        I understand though
        another time!
        -> Mikaela_second_question
    = Mikaela_second_question
        here's the second thing
        it's kind of a downer
        do you remember Olivia? she came to my birthday party last month?
        * (Rosa_remembers_Olivia) we didn't talk much, but yeah, I remember
            -> Mikaela_talked_with_Olivia
        * (Rosa_forgets_Olivia) hmm, no, I don't remember meeting an Olivia
            -> Mikaela_talked_with_Olivia
    = Mikaela_talked_with_Olivia
        {Rosa_remembers_Olivia: ah good! Olivia is great.}
        {Rosa_forgets_Olivia: I'm sure you all talked! but there were tons of people there that night}
        we met playing in the pit for Into the Woods. she was the first violinist and she killed it
        *this doesn't sound like a downer! <>
            -   I'm getting there
                Olivia and I were talking yesterday and
                she mentioned that she had a bad run-in with Duane
                she wasn't sure what to do, so I thought I could give her your number?
                then you guys can talk and figure it out?
            * * ...fuck
                -> Mikaela_begs_Rosa
    = Mikaela_begs_Rosa
        please, Rosa.
        whatever happened with Duane really messed with Olivia.
        she needs to talk to someone, and honestly...so do you. like, I've been thinking about why you don't go to the dining hall anymore. or to a lot of other places. is it because of him?
        * fine. give her my number.
        -   ok. I will. are you mad at me?
            * * sort of <>
            * * of course not <>
            * * I'm mad, but not at you <>
               -  -> Mikaela_is_sorry
        = Mikaela_is_sorry
            I'm sorry any of this ever happened. and I hate to see both of you going through this.
                * me, too.
                    -> dinner_or_not
    = dinner_or_not
        {Rosa_is_nervous_about_dinner: I'm buying you some Krak mac n cheese tonight. you need it}
        {Rosa_doesnt_have_time: I'll come by your dorm after rehearsal with some hot chocolate, k? you need it}
        * thanks <3
            -> DONE
