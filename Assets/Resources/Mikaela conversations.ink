
=== Mikaela_knot_1 ===
    ~conversation_happening = true
    ~conversant_name = "Mikaela"
        #pause:1
        Rosaaaaaa
        #pause:3
        two things
        #pause:1.5
        first, do you have dinner plans? I have space today between class and rehearsal and I want to see you
        #pause:0
        you're always so busy!
        * depends. where do you want to go?
            -> Rosa_is_nervous_about_dinner
        * wish I could, but I have a problem set due at 9:00 tonight :/
            ->Rosa_doesnt_have_time
            
    = Rosa_is_nervous_about_dinner
        #pause:1
        The Krak? I know you don't like the dining hall
        #pause:.25
        plus I could use a burger
        * yeah, the Krak works
        - okay, perfect! see you at 6
        -> Mikaela_second_question
        
    = Rosa_doesnt_have_time
        #pause:.25 
        awww okay
        #pause:.5
        I understand though
        #pause:.25
        another time!
        -> Mikaela_second_question
        
    = Mikaela_second_question
        #pause:.25
        here's the second thing
        #pause:.5
        it's kind of a downer
        #3
        do you remember Olivia? she came to my birthday party last month?
        * (Rosa_remembers_Olivia) we didn't talk much, but yeah, I remember
            -> Mikaela_talked_with_Olivia
        * (Rosa_forgets_Olivia) hmm, no, I don't remember meeting an Olivia
            -> Mikaela_talked_with_Olivia
            
    = Mikaela_talked_with_Olivia
        {Rosa_remembers_Olivia: ah good! Olivia is great.}
        {Rosa_forgets_Olivia: I'm sure you all talked! but there were tons of people there that night}
        we met playing in the pit for Into the Woods. she was the first violinist and she killed it
        *this doesn't sound like a downer!
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
            * * sort of
                ->Mikaela_is_sorry
            * * of course not
                ->Mikaela_is_sorry
            * * I'm mad, but not at you
                ->Mikaela_is_sorry
               
        = Mikaela_is_sorry
            I'm sorry any of this ever happened. and I hate to see both of you going through this.
                * me, too.
                    -> dinner_or_not
                    
    = dinner_or_not
        {Rosa_is_nervous_about_dinner: I'm buying you some Krak mac n cheese tonight. you need it}
        {Rosa_doesnt_have_time: I'll come by your dorm after rehearsal with some hot chocolate, k? you need it}
        * thanks <3
            ~conversation_happening = false
            -> Olivia_knot_1
            
=== Mikaela_knot_2 ===
    ~conversant_name = "Mikaela"
    hey. Olivia told me you all talked
    thank you for answering her <3 
    how do you feel now?
    * (knot_2_angry) angry at Duane all over again
    ~conversation_happening = true
    * (knot_2_guilty) guilty that I didn't say anything when it happened
    ~conversation_happening = true
    * (knot_2_glad) just glad to have Olivia
    ~conversation_happening = true
        -   {knot_2_angry: and who could blame you}
            {knot_2_guilty: you can't think like that. you're not responsible for what Duane does}
            {knot_2_guilty: only he is}
            {knot_2_glad: yeah Olivia does not stand down when she sees something she doesn't think is right}
            {
                - Olivia_knot_3.Rosa_wants_title_ix:
                    -> Rosa_Olivia_take_action
                - Olivia_knot_3.Rosa_wants_police_report:
                    -> Rosa_Olivia_take_action
                - Olivia_knot_3.Rosa_wants_article:
                    -> Rosa_Olivia_take_action
                - else:
                    ->Rosa_does_nothing
            }
            
    = Rosa_Olivia_take_action
        hey so I said this to Olivia and I just want to tell you too
        {Olivia_knot_3.Rosa_wants_title_ix:I don't think going to the Title IX people is a good idea}
        {Olivia_knot_3.Rosa_wants_police_report: I don't think talking to the police is a good idea}
        {Olivia_knot_3.Rosa_wants_article: I don't think trying to get an article written is a good idea}
        *wait, what?
            ->Mikaela_doesnt_support_action
            
        = Mikaela_doesnt_support_action
            {Olivia_knot_3.Rosa_wants_title_ix:I've known some people who reported to the Title IX council and it never works out the way it should}
            {Olivia_knot_3.Rosa_wants_title_ix: I just don't want to see you all dragged through the mud}
            {Olivia_knot_3.Rosa_wants_police_report: this sucks to say, but do you know how few people actually get convicted of sexual assault?}
            {Olivia_knot_3.Rosa_wants_police_report: I just don't want to see you all dragged through the mud}
            {Olivia_knot_3.Rosa_wants_article: if you attack Duane that publicly, he might get dangerous}
            * (stop_freaking_me_out)stop freaking me out
                ->Rosa_does_something
            * (cant_believe_saying)I can't believe you're saying this
                ->Rosa_does_something
                
    = Rosa_does_something
        {stop_freaking_me_out: I'm not trying to freak you out! Just being honest}
        {cant_believe_saying: I'm sorry, it sounds like I don't support you}
        {cant_believe_saying: I do, promise}
        {cant_believe_saying: I'm just being honest}
        *we've made up our minds, okay
            ->Mikaela_rattles_Rosa
            
        = Mikaela_rattles_Rosa
            *you're the one who gave Olivia my number in the first place
            -> option1_goodbye
            
    = Rosa_does_nothing
        Olivia seemed upset that you didn't want to do anything but I think you made the right call
        I've known some people who reported to the Title IX council and it never works out the way it should
        *(knot_2_agree)I agree
            ->Mikaela_doesnt_trust_systems
        *(knot_2_surprised)I'm surprised you'd say that, since you brought Olivia and me together in the first place
            ->Mikaela_doesnt_trust_systems
        
        = Mikaela_doesnt_trust_systems
        {knot_2_surprised: yeah, because now you two can talk to each other and get closure that way}
        going to the police or Title IX would do you more harm than good
        * I hope Olivia doesn't hate me
            -> option2_goodbye
        
    = option1_goodbye
        I thought you all would just talk
        not put yourselves out there like this
        you know what, you're right, it isn't my place
        still, I have a bad feeling about this
        are you there?
        Rosa?
        ~conversation_happening = false
            -> Mikaela_knot_3
        
    = option2_goodbye
        she doesn't, I promise
        she'll come around soon
        in the meantime...things are going to get hard for her.
         ~conversation_happening = false
        {Olivia_knot_3.Rosa_wants_title_ix: -> Olivia_TitleIXpath_witnesses}
            ->Mikaela_knot_3

= Mikaela_knot_3
honestly it doesn't matter what goes here 
    *wow really?
    ~conversation_happening = true
        -> thatsright
    
    = thatsright
        oh absolutely
        ->DONE
        
