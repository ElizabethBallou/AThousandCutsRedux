VAR conversant_name = "Mikaela"
VAR current_name = ""


-> Mikaela_knot_1
=== Mikaela_knot_1 ===
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
        ->END

