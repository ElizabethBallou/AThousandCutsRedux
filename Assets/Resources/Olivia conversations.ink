VAR rosa_knew_duane = ""
VAR rosa_consented_to_kiss = ""
VAR rosa_alcohol_level = 0 //levels of drunkenness: 0 (sober), 1 (tipsy), 2 (drunk)
VAR rosa_resistance_level = 0 //levels of resistance: 0 (said no once), 1 (said no multiple times), 2 (pushed Duane away)

->Olivia_knot_1
=== Rosa_knot_1 ===
~conversant_name = "Rosa"
    hi Rosa. this is Rosa, right?
    my name is Olivia Montgomery. I'm a junior in the engineering school
    we met once at Mikaela's birthday party
    she gave me your number yesterday
    did she tell you I was going to text?
        * yeah, she mentioned it
            ->Mikaela_said_Olivia_would_text
    
    = Mikaela_said_Olivia_would_text
        okay good
        well
        I'm not sure how to start talking about this
        do you know Duane Hammond? he's a junior in the business school, I think?

        *...yes, I know Duane <>
        *Fuck Duane. we don't talk <>
        *Duane and I aren't friends anymore<>
        - -> something_happened_to_unknown
        
    = something_happened_to_unknown
    ~ current_name = "conversant"
        something happened. he did something to me.
        Mikaela said he did something to you too.
        did he?
        * I don't like discussing it
            I get that, but...
            it was bad, Rosa.
            Mikaela told me only a little bit about what happened to you. she said it would help me to know he'd done what he did to me to...someone else
            what would you call it? what happened with him?
            * * a bad night
                a bad night, huh?
                I had one of those too.
                a horrible night. the worst of my life.
                but before I get into that...what made your night bad?
                
                -> Rosa_explains_what_happened
            * * a sexual assault
                yeah. that's what Mikaela made it sound like.
                I'm so sorry that happened to you.
                but I texted you because it happened to me too.
                and now I don't know what to do
                I don't want to make you relive something so awful, but
                what exactly did he do to you
                -> Rosa_explains_what_happened
            * * just an asshole exhibiting typical asshole behavior
                yeah he's an asswipe, that can't be denied
                but was that all? because for me, it was more than just him acting like a jerk
                * * * there was more.
                haha yeah. isn't there always?
                oh sorry that sounded bad
                not funny 'haha,' of course. more like exhausted, can't control myself 'haha'
            -   don't worry. it's fine.
                -> Rosa_explains_what_happened
    
    = Rosa_explains_what_happened
        ~ current_name = "Rosa"
        I was at a Halloween party that some theater kids threw, and Duane was there too
        * I'd never met him before
            -> Rosa_Duane_strangers
        * he was in a class with me. we'd worked on a project before
            -> Rosa_Duane_acquaintances
        = Rosa_Duane_strangers
            ~ current_name = "Rosa"
            ~ rosa_knew_duane = "false"
            he was dressed as Burt Macklin from Parks and Rec, and I hate to say this now, but he was killing it 
            looked a lot like Chris Pratt 
            so I told him I liked his costume
            -> Duane_kissed_Rosa
        
        = Rosa_Duane_acquaintances
            ~ current_name = "Rosa"
            ~ rosa_knew_duane = "true"
            he pulled his weight in the group project. he said smart stuff in class. I didn't know him THAT well but he seemed like a nice guy, so I was happy to see him randomly at the party
            -> Duane_kissed_Rosa
        
        = Duane_kissed_Rosa
            ~ current_name = "Rosa"
            we went out to the back porch where a few other people were
            we were all talking
            then after a while it was just Duane and me. everyone else had wandered off
            he started kissing me and
            * I didn't mind that
                ~ rosa_consented_to_kiss = "true"
                but then he started doing other things
                touching me over my clothes, and then underneath them
                that was too much, so <>
            * I pulled back
                ~ rosa_consented_to_kiss = "false"
                I wasn't giving him any signals that I wanted him to kiss me anyway. I really thought we were just talking
                but he kept putting his hands on me <>
            -    -> why_Rosa_didnt_want_sex
        
        = why_Rosa_didnt_want_sex
            ~ current_name = "Rosa"
            I asked him to stop
            * I wasn't into him <>
            * I just wanted to get back to the party <>
            * I'm not that interested in guys, anyway <>
            -  but he didn't stop. it was like he didn't hear me at all.
                -> Rosa_reaction
                
                = Rosa_reaction
                    so then I
                    *  shut my eyes and stopped moving and waited it out
                    ~ rosa_resistance_level = 0
                    he got bored after a few minutes. it's no fun to grope someone who's acting like a dead body, I guess
                    I wish I'd done something else but idk what I was supposed to do<>
                    *  said what the fuck, I'm not joking
                    ~ rosa_resistance_level = 1
                    he said come on, we both know why we've been sitting out here waiting for everyone else to leave
                    and I was like ???
                    "we" don't know anything about that, my dude
                    didn't matter to him. he pressed me up against the railing and went for the zipper on my pants
                    I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                    and that did it. he stopped.<>
                    *  shoved him. not hard, but enough to make him notice
                    ~ rosa_resistance_level = 2
                    he got this weird look in his eye that I'll never forget
                    he said "I didn't think you'd be into rape play" and then he grabbed my wrists
                    he kept trying to kiss me while he held my hands down
                    I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                    and that did it. he stopped.<>
                    -   -> Duane_says_keep_secret
                    
                    = Duane_says_keep_secret
                        ~ current_name = "Rosa"
                        before he went inside, he said let's make sure this stays between us.
                        and he smiled as if we'd had a good time
                        I didn't say anything because I was just trying not to lose it
                        and...that's it
                        we didn't talk again, ever
                        -> Olivia_asks_about_drunkenness
                        
    = Olivia_asks_about_drunkenness
        ~ current_name = "conversant"
        wow. okay. when Mikaela said something had happened, I didn't think it would be
        well
        that
        that's horrifying
        I feel sick
        * sorry. I didn't mean to make you feel bad <>
        * you asked to hear it, didn't you? <>
        -   it's fine. I'm the one who texted you, anyway
        can I ask you something?
        were you drinking at that party?
            * * no. I don't drink
                ~rosa_alcohol_level = 0
                <>
            * *yeah, but I wasn't drinking so much that I was out of it 
                ~rosa_alcohol_level = 1
                <>
            * *it was Halloween haha. I was pretty drunk
                ~rosa_alcohol_level = 2
                <>
        - -   -> Olivia_remarks_on_drunkenness_level

    = Olivia_remarks_on_drunkenness_level
      {rosa_alcohol_level == 0: good. it'll be easier to report this if you weren't drinking}
      {rosa_alcohol_level == 1: hmm could be worse. it would be easier to report this if you were sober, but who's sober on Halloween?}
      {rosa_alcohol_level == 2: damn. that'll make this harder to report}
      * report to who?
        ->report_to_who
      
    = report_to_who
        the title IX office
        they're always so quick to throw out reports if someone's had literally anything to drink 
        it becomes a bad hookup, blah blah blah
            -> Rosa_reacts_to_title_ix_mention
        = Rosa_reacts_to_title_ix_mention
            * the what office?
                -> title_ix_office_explainer
            * (Rosa_trepidatious) who said anything about going to the title IX office???
                -> Olivia_explains_ideal_outcome
            * (Rosa_negative) I am never fucking talking to the title IX office about this
                -> Olivia_explains_ideal_outcome
                
        = title_ix_office_explainer
            it's where people go to tell the deans if they've been...whatevered. harassed, assaulted, etc etc etc 
            there's a literal office on the 3rd floor of the dean's hall 
            and the people who work there are supposed to make sure that whoever pulls this shit gets punished
            I've been doing some research and it's part of federal law for every college to have title ix staff.
            -> Rosa_reacts_to_title_ix_mention
            
        = Olivia_explains_ideal_outcome
        {Rosa_trepidatious: sorry, I thought it was obvious that that's where I was going with this}
        {Rosa_negative: wait, really?}
            Duane assaulted both of us 
            he's obviously a danger
            shouldn't we both report him?
            * but I don't even know what happened to you 
                -> Rosa_cuts_off_Olivia
                
    = Rosa_cuts_off_Olivia
        oh yeah
        I guess I haven't said
        you were really open with me, so I'll tell you whatever you want to know
        * can you text me tomorrow about this? it's all so much for me to think about today<>
        -   sure. sorry. I shouldve checked earlier
            -> Rosa_says_goodbye
        = Rosa_says_goodbye
            ~conversant_name = "Rosa"
            it's fine. I have a feeling we'll be talking to each other for a while, anyway
            we have time to get used to each other 
            talk to you later, Olivia.
            * (Rosa_says_thanks) and thanks for saying something to me <>
            * (Rosa_says_nothing) - say nothing - <>
            -   {Rosa_says_thanks: I just felt like I had to.}
                {Rosa_says_nothing: until tomorrow}
                    -> DONE

=== Olivia_knot_2 ===
    I thought for a while about what I should text you 
    like if I should just say "hello" as if we were talking about something normal
    or be really gentle with you in case I freaked you out yesterday
    so in the end I just figured I would tell you I'm confused
    that's your cue to say something
        * (Rosa_response_chill) ha. don't worry about being confused. it's not like there's a guide for talking about assault 
            ->Olivia_greets_Rosa
        * (Rosa_response_freaked) you did freak me out, but I'm fine now
            ->Olivia_greets_Rosa
        * (Rosa_response_guarded) ...hello
            ->Olivia_greets_Rosa
    = Olivia_greets_Rosa
        {Rosa_response_chill: this would be easier if there were}
        {Rosa_response_freaked: sorry. I didn't mean to}
        {Rosa_response_guarded: hahaha I guess that's something}
        anyway, thanks for replying. it's good to talk to you again.
            *you too.<>
                - ~conversant_name = "Rosa"
                    you were going to tell me what happened with you and Duane?
                    ->Olivia_begins_story
        
        =Olivia_begins_story
            yes.
            ...
            can you ask me some questions to get me started? it's hard for me to know where to begin
                * okay
                    -> Rosa_asks_Olivia_questions
                    
        = Rosa_asks_Olivia_questions
            * when did it happen?
                -> Olivia_says_when_rape_happened
            * did you know Duane before?
                -> Olivia_says_she_knew_Duane
            * what did he do?
                -> Olivia_says_what_Duane_did
                
        = Olivia_says_when_rape_happened
            it was at the end of last semester. Duane and I are both in the engineering school, and some people were celebrating the end of exams by going to Jolly Molly's. you know it?
                * (Rosa_knows_JM) I've had way too many vodka lemonades from JM's, haha
                    ->Olivia_replies_to_JM_knowledge
                * (Rosa_doesnt_know_JM) yeah but it's not the kind of place I go
                    ->Olivia_replies_to_JM_knowledge

                = Olivia_replies_to_JM_knowledge
                {Rosa_knows_JM: ah ha. that means you must have a fake ID too. so you won't judge me too much, which I was afraid of}
                {Rosa_doesnt_know_JM: yeah it's a shithole. but the bouncer never looks too hard at my ID, so I don't have to worry about using a fake}
                
        = Olivia_says_she_knew_Duane
        ->DONE
        
        = Olivia_says_what_Duane_did
        ->DONE
    
   
        
        
    