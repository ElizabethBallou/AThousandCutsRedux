VAR rosa_knew_duane = ""
VAR rosa_consented_to_kiss = ""
VAR rosa_alcohol_level = 0 //levels of drunkenness: 0 (sober), 1 (tipsy), 2 (drunk)
VAR rosa_resistance_level = 0 //levels of resistance: 0 (said no once), 1 (said no multiple times), 2 (pushed Duane away)

=== Olivia_knot_1 ===
~conversant_name = "unknown"
~current_speaker = "conversant"
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

        *...yes, I know Duane
        *Fuck Duane. we don't talk
        *Duane and I aren't friends anymore
        - -> something_happened_to_unknown
        
    = something_happened_to_unknown
    ~ current_speaker = "conversant"
        something happened. he did something to me.
        Mikaela said he did something to you too.
        * I don't like discussing it
            I get that, but...
            it was bad, Rosa.
            Mikaela told me only a little about what happened with you. she said it would help to know he'd done something to someone else. that it was a pattern.
            so what would you call the thing with Duane?
            * * a bad night
                a bad night, huh?
               what made your night bad?
                -> Rosa_explains_what_happened
                
            * * a sexual assault
                I'm so sorry that happened to you.
                but I texted you because it happened to me too.
                and now I don't know what to do
                I don't want to make you relive something so awful, but
                what exactly did he do to you
                -> Rosa_explains_what_happened
                
            * * just an asshole exhibiting typical asshole behavior
                he's an asswipe, that can't be denied
                but was that all? because for me, it was more
                * * * there was more.
                haha yeah. isn't there always?
                oh sorry that sounded bad
                not funny 'haha,' of course. more like exhausted 'haha'
            -   don't worry. it's fine.
                -> Rosa_explains_what_happened
    
    = Rosa_explains_what_happened
        ~ current_speaker = "Rosa"
        I was at a theater kid Halloween party, and Duane was there too
        * I'd never met him before
            -> Rosa_Duane_strangers
        * he was in a class with me. we'd worked on a project together
            -> Rosa_Duane_acquaintances
        = Rosa_Duane_strangers
            ~ current_speaker = "Rosa"
            ~ rosa_knew_duane = "false"
            he was dressed as Burt Macklin from Parks and Rec, and I hate to say this now, but he was killing it 
            looked a lot like Chris Pratt 
            so I told him I liked his costume
            -> Duane_kissed_Rosa
        
        = Rosa_Duane_acquaintances
            ~ current_speaker = "Rosa"
            ~ rosa_knew_duane = "true"
            he pulled his weight in the group project. he said smart stuff in class. I didn't know him that well but he seemed nice enough
            -> Duane_kissed_Rosa
        
        = Duane_kissed_Rosa
            ~ current_speaker = "Rosa"
            we went out to the back porch where a few other people were
            we were all talking
            then after a while it was just Duane and me. everyone else had wandered off
            he started kissing me and
            * I didn't mind that
                ~ rosa_consented_to_kiss = "true"
                but then he started doing other things
                touching me over my clothes, and then underneath them
                that was too much, so
            * I pulled back
                ~ rosa_consented_to_kiss = "false"
                I wasn't giving him any signals that I wanted him to kiss me anyway. I really thought we were just talking
                but he kept putting his hands on me 
            -    -> why_Rosa_didnt_want_sex
        
        = why_Rosa_didnt_want_sex
            ~ current_speaker = "Rosa"
            I asked him to stop
            * I wasn't into him
            * I just wanted to get back to the party
            * I'm not that interested in guys, anyway
            -  but he didn't stop. it was like he didn't hear me at all.
                -> Rosa_reaction
                
                = Rosa_reaction
                    so then I
                    *  shut my eyes and stopped moving and waited it out
                    ~ rosa_resistance_level = 0
                    he got bored after a few minutes. no fun to grope someone who's playing dead, I guess
                    I wish I'd done something else but idk what I was supposed to do<>
                    *  said what the fuck, I'm not joking
                    ~ rosa_resistance_level = 1
                    he said come on, we both know why we've been sitting out here waiting for everyone else to leave
                    and I was like ???
                    "we" don't know anything about that, my dude
                    didn't matter to him. he shoved me against the railing and unzipped my pants
                    I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                    and that did it. he stopped.<>
                    *  shoved him. not hard, but enough to make him notice
                    ~ rosa_resistance_level = 2
                    he got this weird look
                    he said "I didn't think you'd be into rape play" or something
                    he kept trying to kiss me while he held my hands down
                    I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                    and that did it. he stopped.<>
                    -   -> Duane_says_keep_secret
                    
                    = Duane_says_keep_secret
                        ~ current_speaker = "Rosa"
                        before he went inside, he said let's make sure this stays between us.
                        and he smiled as if we'd had a good time
                        I didn't say anything because I was just trying not to lose it
                        and that's it
                        we didn't talk again, ever
                        -> Olivia_asks_about_drunkenness
                        
    = Olivia_asks_about_drunkenness
        ~ current_speaker = "conversant"
        god. when Mikaela said something had happened, I didn't think it would be that
        I feel sick
        * sorry. I didn't mean to make you feel bad
        * you asked to hear it
        -   it's fine. I'm the one who texted you, anyway
        can I ask you something?
        were you drinking at that party?
            * * no. I don't drink
                ~rosa_alcohol_level = 0
            * *yeah, but I wasn't drinking so much that I was out of it 
                ~rosa_alcohol_level = 1
            * *it was Halloween haha. I was pretty drunk
                ~rosa_alcohol_level = 2
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
            it's where people go to tell the deans if they've been whatevered. harassed, assaulted
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
        * can you text me tomorrow about this? you gave me so much to think about
        -   sure. sorry. I shouldve checked earlier
            -> Rosa_says_goodbye
        = Rosa_says_goodbye
            ~current_speaker = "conversant"
            it's fine. I have a feeling we'll be talking to each other for a while, anyway
            we have time to get used to each other 
            talk to you later, Olivia.
            * (Rosa_says_thanks) and thanks for saying something to me
            * (Rosa_says_nothing) - say nothing -
            -   {Rosa_says_thanks: I just felt like I had to.}
                {Rosa_says_nothing: until tomorrow}
                    -> Olivia_knot_2

=== Olivia_knot_2 ===
    ~current_speaker = "conversant"
    I thought for a while about what I should text you 
    like should I say "hello" as if we were talking about something normal
    or be really gentle in case I freaked you out yesterday
    but I really didn't know
    so I figured I would tell you I'm confused
    that's your cue to say something
        * (Rosa_response_chill) ha. don't worry about being confused. there's no guide for talking about this stuff 
            ->Olivia_greets_Rosa
        * (Rosa_response_freaked) you did freak me out, but I'm fine now
            ->Olivia_greets_Rosa
        * (Rosa_response_guarded) hello i guess?
            ->Olivia_greets_Rosa
            
    = Olivia_greets_Rosa
        {Rosa_response_chill: this would be easier if there were}
        {Rosa_response_freaked: sorry. I didn't mean to}
        {Rosa_response_guarded: hahaha hello and good day to you}
        it's good to talk to you again
            *you too.
                - ~conversant_name = "Rosa"
                    you were going to tell me what happened with Duane?
                    ->Olivia_begins_story
        
        = Olivia_begins_story
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
            *   -> Olivia_is_angry
            
            = Olivia_says_when_rape_happened
                it was at the end of last semester. Duane and I are both in the engineering school, and some people were celebrating the end of exams by going to Jolly Molly's. you know it?
                    * (Rosa_knows_JM) I've had way too many vodka lemonades from JM's, haha
                        ->Olivia_replies_to_JM_knowledge
                    * (Rosa_doesnt_know_JM) yeah but it's not the kind of place I go
                        ->Olivia_replies_to_JM_knowledge
    
                    = Olivia_replies_to_JM_knowledge
                    {Rosa_knows_JM: ah ha. that means you must have a fake ID too. so you won't judge me too much, which I was afraid of}
                    {Rosa_doesnt_know_JM: oh no judgment there. its a real shithole. but the bouncer never looks too hard at my ID, so I don't have to worry about using a fake}
                        anyway I'd studied really hard, so I was happy to just hang out and drink. I wasn't on my guard
                        that was a mistake
                            -> Rosa_asks_Olivia_questions
                        
            = Olivia_says_she_knew_Duane
                mhmm I knew him. since last year, when he transferred here. there aren't that many engineers so he was in a lot of my classes
                specifically there aren't a lot of women engineers. I'm used to getting hit on at this point, and Duane did that sometimes
                but I just brushed him off
                so many asshats treat anyone in the e school who's not a straight white dude like they're rare pokemon cards
                Duane was just one of many
                    -> Rosa_asks_Olivia_questions
            
            = Olivia_says_what_Duane_did
                I had two beers. that was it. just two. I can handle two beers
                except that night I couldn't
                I started fading. I remember my thoughts sort of drifting away, and I tried to catch them and pull them back towards me, but that didn't work
                the rest of the night is just flashes
                when I woke up, like really woke up, I was in my bed and Duane was there too. and I was horrified because I knew right away what had happened
                maybe this is tmi, but I could feel it. I was in pain. it was a deep ache, like period cramps, but I wasn't on my period
                I woke him up and said he had to go right away. he wouldn't stop grinning. he was so pleased with himself.
                I wanted to take a shower but I knew I wasn't supposed to. so I told my roommate, Ally. Ally said we needed to go to the hospital and get a rape kit done. and we did.
                the nurse was so fucking businesslike. she kept telling me to relax because if I did it would be over faster.
                now I'm crying. something to do with talking about all these little details
                give me a second
                * (Rosa_is_empathetic) I am so so sorry, Olivia
                * (Rosa_says_no_crying) don't give him the pleasure of tears
                * (Rosa_says_stop_talking) please don't tell me any more. I can't handle this
                -    -> Olivia_says_what_Duane_did_2
                    
                    = Olivia_says_what_Duane_did_2
                        {Rosa_is_empathetic: Im sorry too. I didn't realize how bad it would be to get a rape kit. no one should have to go through that.}
                        {Rosa_says_no_crying: what does it matter? he doesn't know I'm crying. he doesn't give a shit about me, or you}
                        {Rosa_says_stop_talking: then just don't read it. delete the texts or whatever. but I have to say all this or I will scream}
                        anyway. I messaged Duane and asked him to explain what had happened. he asked if I had a good time and I said "no one has a good time when they're raped"
                        it took a while for him to respond but he finally said that I was crazy. and that if I called it rape again, I'd be sorry
                        and that's the last time we ever spoke
                        ->Rosa_asks_Olivia_questions
                        
        = Olivia_is_angry
            so that's the story.
            I spent all of winter break depressed. but then I got angry.
            I am so, so angry, Rosa
            aren't you angry?
            * every day
            * I try not to think about it. if I do I'll go crazy
            * I don't know how to feel angry anymore
            -   ~current_speaker = "conversant"
                well
                I want Duane to suffer SOMETHING. so I've made a list of things we can do to make that happen.
                    * * and what are they?
                    -> Olivia_explains_actions
                    * * (Rosa_is_recalcitrant) I don't want to hear them
                    -> Olivia_explains_actions
                    
        = Olivia_explains_actions
            {Rosa_is_recalcitrant: ok, you don't have to do anything, but at least listen to me}
            first, we can both make a report to the Title IX office
            second, we can report to the police
            third, we can submit a case to the office of civil rights
            and finally, we can write about what happened and try to get a website somewhere to publish it 
            there may be more options, but that's my shortlist
                -> Rosa_investigates_options
                
        = Rosa_investigates_options
            *tell me about reporting to Title IX
                -> Title_IX_explanation
            *tell me about reporting to the police
                -> police_explanation
            *tell me about the Office of Civil Rights
                ->office_of_civil_rights_explanation
            *tell me about publishing what happened online
                ->publishing_online_explanation
            * ->Rosa_makes_decision
            
            = Title_IX_explanation
                we would both go to the Title IX office and explain what happened to whoever works there. then they'd decide if it's serious enough to bring a case against Duane
                and it has to be, right?
                after that, I don't know what happens. it's hard to find much info
                but if we win, Duane gets suspended, or maybe even expelled. and he gets a mark on his record that he got disciplined for 'sexual misconduct'
                which is a bullshit, toned-down way of saying that he committed sexual assault
                    -> Title_IX_explanation_pros_cons
                    
                = Title_IX_explanation_pros_cons
                    * why should we do this?
                        -> why_title_ix_report
                    * what are the drawbacks?
                        -> why_not_title_ix_report
                    * hmm. let's talk about the other options
                        -> Rosa_investigates_options
                    
                    = why_title_ix_report
                        we wouldn't have to be public about reporting Duane. no one would have to know.
                        also, our chances of getting some kind of punishment for Duane are higher than if we go to the police.
                        -> Title_IX_explanation_pros_cons
                    
                    = why_not_title_ix_report
                        it's all really secretive. finding any info at all on the way the Title IX office works was so hard 
                        it seems like Title IX works differently at every university...
                        -> Title_IX_explanation_pros_cons


            = police_explanation
            
               ->Rosa_investigates_options
                
            = office_of_civil_rights_explanation
            
               ->Rosa_investigates_options
                
            = publishing_online_explanation
            
               ->Rosa_investigates_options
        
        = Rosa_makes_decision
            ->END
   
        
        
    