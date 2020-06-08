VAR rosa_knew_duane = ""
VAR rosa_consented_to_kiss = ""
VAR rosa_alcohol_level = 0 //levels of drunkenness: 0 (sober), 1 (tipsy), 2 (drunk)
VAR rosa_resistance_level = 0 //levels of resistance: 0 (said no once), 1 (said no multiple times), 2 (pushed Duane away)


=== Olivia_knot_1 ===
~conversant_name = "Olivia"
~know_conversant = false
~is_rosa = false
    hi Rosa. this is Rosa, right?
    my name is Olivia Montgomery. I'm a junior in the engineering school
    ~know_conversant = true
    we met once at Mikaela's birthday party
    she gave me your number yesterday
    did she tell you I was going to text?
        * yeah, she mentioned it
        ~conversation_happening = true
         ~is_rosa = true
            ->Mikaela_said_Olivia_would_text
    
    = Mikaela_said_Olivia_would_text
        ~is_rosa = false
        okay good
        well
        I'm not sure how to start talking about this
        do you know Duane Hammond? he's a junior in the business school, I think?
        *...yes, I know Duane
        *Fuck Duane. we don't talk
        *Duane and I aren't friends anymore
        - -> something_happened_to_unknown
        
    = something_happened_to_unknown
    ~ is_rosa = false
        something happened. he did something to me.
        Mikaela said he did something to you too.
        * I don't like discussing it
            I get that, but...
            it was bad, Rosa.
            Mikaela told me only a little about what happened with you. but now I'm afraid that this is a pattern.
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
                
            * * nothing much. just the normal shitty stuff
                ~ anger_level = anger_level + 1
                I hear you
                but was that all? because for me, it was more than 'nothing much'
                * * * there was more.
                haha yeah. isn't there always?
                oh sorry that sounded bad
                not funny 'haha,' of course. more like exhausted 'haha'
            -   don't worry. it's fine.
                -> Rosa_explains_what_happened
    
    = Rosa_explains_what_happened
        ~ is_rosa = true
        I was at a theater kid Halloween party with Mikaela, and Duane was there too
        * I'd never met him before
            -> Rosa_Duane_strangers
        * he was in a class with me. we'd worked on a project together
            -> Rosa_Duane_acquaintances
        = Rosa_Duane_strangers
            ~ is_rosa = true
            ~ rosa_knew_duane = "false"
            he was dressed as Burt Macklin from Parks and Rec, and I hate to say this now, but he was killing it 
            looked a lot like Chris Pratt 
            so I told him I liked his costume
            -> Duane_kissed_Rosa
        
        = Rosa_Duane_acquaintances
            ~ is_rosa = true
            ~ rosa_knew_duane = "true"
            he pulled his weight in the group project. he said smart stuff in class. I didn't know him that well but he seemed nice enough
            -> Duane_kissed_Rosa
        
        = Duane_kissed_Rosa
            ~ is_rosa = true
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
            ~ is_rosa = true
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
                    I wish I'd done something else but idk what I was supposed to do
                    *  said what the fuck, I'm not joking
                    ~ rosa_resistance_level = 1
                        he said come on, we both know why we've been sitting out here waiting for everyone else to leave
                        and I was like ???
                        "we" don't know anything about that, my dude
                        didn't matter to him. he shoved me against the railing and unzipped my pants
                        I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                        and that did it. he stopped.
                    *  shoved him. not hard, but enough to make him notice
                    ~ rosa_resistance_level = 2
                        he got this weird look
                        he said "I didn't think you'd be into rape play" or something
                        he kept trying to kiss me while he held my hands down
                        I looked him in the eye and said "stop. now." like I would to a dog that wasn't behaving
                        and that did it. he stopped.
                        -   -> Duane_says_keep_secret
                    
                    = Duane_says_keep_secret
                        ~ is_rosa = true
                        before he went inside, he said let's make sure this stays between us.
                        and he smiled as if we'd had a good time
                        I didn't say anything because I was just trying not to lose it
                        and that's it
                        we didn't talk again, ever
                        -> Olivia_asks_about_drunkenness
                        
    = Olivia_asks_about_drunkenness
        ~ is_rosa = false
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
            ~is_rosa = true
            it's fine. I have a feeling we'll be talking to each other for a while, anyway
            we have time to get used to each other 
            talk to you later, Olivia.
            * (Rosa_says_thanks) and thanks for saying something to me
            * (Rosa_says_nothing) - say nothing -
            -   ~is_rosa = false
                {Rosa_says_thanks: I just felt like I had to.}
                {Rosa_says_nothing: until tomorrow}
                ~ conversation_happening = false
                -> Olivia_knot_2

=== Olivia_knot_2 ===
    * @
        ->Olivia_knot_2_ridiculous_intro
    
    = Olivia_knot_2_ridiculous_intro
     ~conversant_name = "Olivia"
    I thought for a while about what I should text you 
    like should I say "hello" as if we were talking about something normal
    or be really gentle in case I freaked you out yesterday
    but I really didn't know
    so I figured I would tell you I'm confused
    that's your cue to say something
        * (Rosa_response_chill) ha. don't worry about being confused. there's no guide for talking about this stuff
                ~conversation_happening = true
            ->Olivia_greets_Rosa
        * (Rosa_response_freaked) you did freak me out, but I'm fine now
                ~conversation_happening = true
            ->Olivia_greets_Rosa
        * (Rosa_response_guarded) hello i guess?
                ~conversation_happening = true
            ->Olivia_greets_Rosa
            
    = Olivia_greets_Rosa
        {Rosa_response_chill: this would be easier if there were}
        {Rosa_response_freaked: sorry. I didn't mean to}
        {Rosa_response_guarded: hahaha hello and good day to you}
        it's good to talk to you again
            *you too.
                - ~is_rosa = true
                    you were going to tell me what happened with Duane?
                    ->Olivia_begins_story
        
        = Olivia_begins_story
        ~is_rosa = false
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
            ~is_rosa = false
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
                    ~anger_level = anger_level + 2
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
                -> Rosa_angry_every_day
            * I try not to think about it. if I do I'll go crazy
                ->Rosa_doesnt_consider_anger
            * (dont_know_how_to_feel) I don't know how to feel angry anymore
                ->Rosa_doesnt_know_how_to_feel
            
            = Rosa_angry_every_day
                yeah, you get it
                shit I have to go 
                I'm late to class 
                talk to you later?
                -> end_second_knot
                
            = Rosa_doesnt_consider_anger
                ~ anger_level = anger_level + 1
                well that's fucked
                ahhh no I have to go 
                I'm late to class 
                talk to you later?
                -> end_second_knot
                
            = Rosa_doesnt_know_how_to_feel
                ~anger_level = anger_level + 2
                there are a lot of girls who don't know how to get their anger back, aren't there?
                shit I have to go 
                I'm late to class 
                talk to you later?
                -> end_second_knot
        
        = end_second_knot
            ~ is_rosa = true
            * okay
            {Rosa_angry_every_day: today I will be angry for you, too}
            {Rosa_doesnt_consider_anger: I'll keep trying not to go crazy, same as always}
            {Rosa_doesnt_know_how_to_feel: I'll keep pushing all my emotions away, same as always. that's healthy, right?}
            {Rosa_doesnt_know_how_to_feel: that was a joke btw}
            {Rosa_doesnt_know_how_to_feel: awkward. ok. talk tomorrow.}
            ~ conversation_happening = false
            ->Olivia_knot_3
                    
                
=== Olivia_knot_3 ===
    ~conversant_name = "Olivia"
    ~is_rosa = false
     * @
        ->Olivia_knot_3_ridiculous_intro
        
    = Olivia_knot_3_ridiculous_intro    
    sorry it took me so long to text you again
    I had a paper due for my humanities class 
    I hate writing papers. I thought being in the E School meant I'd never have to write a paper again but here we are 
    do you have to write a lot for linguistics classes?
        * (Rosa_hates_papers) yeah and I hate it too
            ~conversation_happening = true
            -> Rosa_writes_papers
        * (Rosa_doesnt_mind_papers) yeah, but I don't mind it
            ~conversation_happening = true
            -> Rosa_writes_papers
        * (Rosa_enjoys_papers) I enjoy writing papers actually
            ~conversation_happening = true
            -> Rosa_writes_papers
            
    = Rosa_writes_papers
    ~ is_rosa = true
        linguistics is like a puzzle. you have to figure out how the parts go together. like, how two languages are connected
        {Rosa_hates_papers: THAT'S the fun part, not writing about it}
        {Rosa_doesnt_mind_papers: writing a paper is how you prove you know what you're talking about}
        {Rosa_enjoys_papers: then the paper is how you break it down and make people care}
        ~ is_rosa = false 
        {Rosa_hates_papers: oh good you get it}
        {Rosa_hates_papers: I knew I liked you :)}
        {Rosa_doesnt_mind_papers: whatever you say}
        {Rosa_enjoys_papers: NERD}
        * What you said yesterday...
            -> Olivia_explains_actions_1
            

    = Olivia_explains_actions_1
        ah yeah
        about Duane suffering
        I've made a list of things we can do to make that happen.
                    * * and what are they?
                    -> Olivia_explains_actions_2
                    * * (Rosa_is_recalcitrant) I don't want to hear them
                    -> Olivia_explains_actions_2
                    
        = Olivia_explains_actions_2
            {Rosa_is_recalcitrant: ok, you don't have to do anything, but at least listen to me}
            first, we can both make a report to the Title IX office
            second, we can report to the police
            third, we can write about what happened and try to get a website somewhere to publish it 
            there may be more options, but that's my shortlist
                -> Rosa_investigates_options
                
        = Rosa_investigates_options
            *tell me about reporting to Title IX
                -> Title_IX_explanation
            *tell me about reporting to the police
                -> police_explanation
            *tell me about publishing what happened online
                ->publishing_online_explanation
            * {Rosa_investigates_options > 3} let's make a Title IX report
                -> Rosa_wants_title_ix
            * {Rosa_investigates_options > 3} let's go to the police
                -> Rosa_wants_police_report
            * {Rosa_investigates_options > 3} let's talk to the media
                -> Rosa_wants_article
            * {Rosa_investigates_options > 3} I'm sorry, I can't risk any of this
                -> Rosa_wants_nothing
                
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
                we would both go to the police office and file a police report. then they'd decide whether to bring charges against Duane
                if they do, we get to argue that hes a fuckwad in court
                if they don't, we're back where we started
                    -> police_explanation_pros_cons
                    
                = police_explanation_pros_cons
                    * why should we do this?
                        -> why_police_report
                    * what are the drawbacks?
                        -> why_not_police_report
                    * hmm. let's talk about the other options
                        -> Rosa_investigates_options
                        
                    = why_police_report
                        this is the only chance we have of getting criminal charges to stick to Duane
                        unlikely, but if we're smart, it could happen 
                        and if he's convicted he could get jail time
                        -> police_explanation_pros_cons
                        
                    = why_not_police_report
                        the reason why people dont report to the police is that the cops suck at handling sexual assault cases 
                        it is so so hard to prove that anything happened
                        and if they DO bring charges, we'll have to face Duane in court
                        I think I can handle that, but it'll be hard
                
               ->Rosa_investigates_options
                c
                
            = publishing_online_explanation
                one way we can MAKE people pay attention is to talk to the media
                like, contact news sites and tell them what happened
                and get an article published
                    -> publishing_explanation_pros_cons
                    
                = publishing_explanation_pros_cons
                    * why should we do this?
                        -> why_publishing
                    * what are the drawbacks?
                        -> why_not_publishing
                    * hmm. let's talk about the other options
                        -> Rosa_investigates_options
                
                    = why_publishing
                        if enough people read a story and get angry, then Fortuna has to do something. they won't be able to ignore it.
                        and this kind of shit is in the news a lot more now than it used to be
                        there was Brock Turner, and the girl who carried that mattress at Columbia
                        -> publishing_explanation_pros_cons
                        
                    = why_not_publishing
                        if we don't write the story ourselves, we won't have control over how a random journalist handles it 
                        we could come off to the whole world like sluts 
                        entitled, crazy sluts 
                        plus maybe Duane could sue us? I honestly don't know
                        -> publishing_explanation_pros_cons
                    
               ->Rosa_investigates_options
        
        = Rosa_wants_title_ix
            that's what I was leaning towards, too.
            -> system_choice_2
            
        = Rosa_wants_police_report
             that's what I was leaning towards, too.
            -> system_choice_2
            
        = Rosa_wants_article
            that's what I was leaning towards, too.
            -> system_choice_2
            
        = system_choice_2
            wow, so 
            I guess we're really doing this?
            * I guess...
            * we're gonna try!
            * fuck yeah we're doing this
                -   I can't believe this is happening. like, I didn't even know if you'd answer my text. so thank you.
                    and now I need to take some time to cry it out before class 
                    let's talk later and we'll plan our attack
                    go eat some chocolate, okay?
                    or whatever kind of food you like 
                    something that comforts you
                        * hahahaha I will
                            -> Rosa_eats_comfort_food
                        * I can't eat anything right now. I'm too nervous
                            -> Rosa_too_nervous
                
                = Rosa_eats_comfort_food
                    atta girl <3
                    alright, later
                    ~ conversation_happening = false
                    -> Mikaela_knot_2
                    
                = Rosa_too_nervous
                    save the nerves for later. right now, just take care of yourself.
                    we have to be be gentle with ourselves, or we won't get through this 
                    alright, later
                    ~ conversation_happening = false
                    -> Mikaela_knot_2
            
        = Rosa_wants_nothing
            are you serious
            youre not going to do anything
            you realize how this affects me, right?
            it makes my story weaker
            aren't you angry? don't you want to do SOMETHING
            * look we should both get over what happened
                ->Rosa_says_get_over_it
            * yes, but I can't do this right now
                -> Rosa_says_hamstrung
            * actually, I change my mind 
                -> Rosa_investigates_options
            
            = Rosa_says_get_over_it
                ~ anger_level = (anger_level + 2)
                okay.
                we very clearly have different opinions on what people should be allowed to do with other people's bodies.
                jesus I can't believe you'd say this after everything
                *not everyone wants the same thing you want
                ->Will_Olivia_respect_Rosa

            = Rosa_says_hamstrung
                ~anger_level = (anger_level + 1)
                that's cowardly. you're a coward.
                * you're being unfair
                    -   I know and I don't care 
                        *not everyone wants the same thing you want
                        ->Will_Olivia_respect_Rosa

            = Will_Olivia_respect_Rosa
                *you have to respect my choice or we're done talking
                    ->yes_she_will
                
            = yes_she_will
                ...ok 
                I dont get it but ok 
                I'm still going to do something though 
                probably Ill go the title ix way 
                can we keep talking? once Ive made the report? you're the only one who will get it fully
                *as long as you don't pull me into making a report I don't want to make right now
                    ->Olivia_promises
            = Olivia_promises
                I won't. I promise.
                ~ conversation_happening = false

                -> Mikaela_knot_2
                        

  === Olivia_TitleIXpath_witnesses ===
        * @
        ->Olivia_TitleIXpath_1_ridiculous_intro
    
    = Olivia_TitleIXpath_1_ridiculous_intro
      ~conversant_name = "Olivia"
    all right I just got home from making my report to the Title IX rep 
    you did yours, right?
        * yeah, yesterday
                ~conversation_happening = true
            ->Rosa_responds
    
        = Rosa_responds
            was it that Irene lady? the one who laughs weird and wears the wrong shade of foundation?
            *(Rosa_chides) aww that's not nice 
                -> Olivia_answers
            *(Rosa_agrees) yes! the very one!!
                -> Olivia_answers
            
        = Olivia_answers
            {Rosa_chides: but it's true}
            {Rosa_agrees: haha I wonder if Irene is the only one who takes these statements}
            she pissed me off
            she kept saying "we will treat this with the utmost seriousness" over and over
            like...I get it, Irene
            *there's an investigation now, right?
                - yeah
                    - *how long is that supposed to take?
                        ->investigation_discussion
                        
        = investigation_discussion
          a month maybe? longer?
          they have to interview duane
          and anyone either of us gave as witnesses
          did you know that you can give the names of people who didn't actually see it happen?
          like, random people who saw you and duane together
          or friends you told about the assault the day after
          they're not technically witnesses, but they make your case stronger
          Irene didn't tell me any of that bc she sucks at her job apparently
          but I found a general title ix reporting guide online
          so...any witnesses for you?
            ->Rosa_lists_witnesses
            
        = Rosa_lists_witnesses
            * {not Mikaela_witness} Mikaela was there
                **she knows when we got there and when we left
                    -> Mikaela_witness
            * {not Rudy_witness} this guy, Rudy, hosted the party
                **he was outside for a while and saw Duane and me talking
                    -> Rudy_witness
            * {Mikaela_witness} {Rudy_witness} -> any_final_witnesses
            = Mikaela_witness
            {not Rudy_witness: ok good start}
            {not Rudy_witness: anyone else?}
            {Rudy_witness: also a good idea}
                ->Rosa_lists_witnesses
                
            = Rudy_witness
            {not Mikaela_witness: ok good start}
            {not Mikaela_witness: anyone else?}
            {Mikaela_witness: also a good idea}
                ->Rosa_lists_witnesses
        
        = any_final_witnesses
        anyone else?
        * not that I can think of
            -> move_to_Olivia
            
        = move_to_Olivia
        2 people, that's pretty good
        * what about you?
            ->Olivia_witnesses
            
        = Olivia_witnesses
        #pause:1
        first there's my roommate, Ally
        #pause:1.3
        they took me to the hospital the morning after
        #pause:2.2
        then there's one of my professors. I wasn't turning in work for about two weeks and she was the only one who asked if I was okay
        #pause:.5
        so I told her
        #pause:1.5
        she can confirm that I said the same shit to her as I did to Irene
        #pause:2
        and then there's Mikaela of course
        #pause:1.2
        so those are the 3
        *will Mikaela agree to be interviewed twice?
            ->conversation_end
            
        = conversation_end
        I dunno
        we can only hope I guess...
        ~conversation_happening = false

        ->Rudy_knot_1


=== Olivia_TitleIxpath_Investigation ===
    * @
        ->Olivia_investigation_ridiculous_intro
    
    = Olivia_investigation_ridiculous_intro
    #pause:0
    did you see the email??
    pause:2
    the Title IX people said there's enough credible material for the case to ACTUALLY HAPPEN 
    ->DONE
          
    