
=== Rudy_knot_1 ===
* @
        ->ridiculous_intro
    
    = ridiculous_intro
    #triggerdate
 ~conversant_name = "Rudy"
 Hi Rosa. This is Rudy. Long time no talk! I hope you're doing well.#pause:4
 I got an email from a Title IX investigation committee - they want to interview me. I hope this is appropriate to ask, but I was wondering if you could tell me more? I'm happy to talk to them, I just don't know what this is about. #pause:2
 All the email said was that something happened during my Halloween party, and it was related to you?
 
 *Hi Rudy. I'm fine I guess. #pause:3.5
  ~conversation_happening = true
    ->Rosa_polite
 *damn that's all the email said? #pause:2.5
  ~conversation_happening = true
    ->Rosa_disbelieving
 *oh god here we go again #pause:3.5
  ~conversation_happening = true
    ->Rosa_overwhelmed
 
    = Rosa_polite
        Hey, no need to be polite. If you're in the middle of a Title IX thing, life is uhhhh probably hard
        *it's...been better haha #pause:2.7
            ->Rudy_sorry
        
    = Rosa_disbelieving
        Yeah, that was all. It was pretty confusing.
        *I assumed they'd tell you more #pause:2.7
            ->Rudy_sorry
    
    = Rosa_overwhelmed
        Oh gosh, I'm sorry, you probably have to keep repeating your story over and over. I shouldn't have asked.
        *dude no it's okay #pause:2.7
            ->Rudy_sorry
        
    = Rudy_sorry
    I didn't know anything happened my party. If I did, I would've said something to you way sooner.
        *(Rosa_chill) chill Rudy it's not your fault #pause:1.4
            ->Rudy_explains_himself
        *(Rosa_appreciate) I really appreciate that #pause:1.4
            ->Rudy_explains_himself
        
    = Rudy_explains_himself
    {Rosa_chill:
        I still feel like it is. #pause:3.4
        }
    {Rosa_appreciate:
        Of course. #pause:3.4
        }
    I thought Duane was creepy since we were both in the fall musical last year. But I still invited him to parties because it's weird not to invite everyone in the cast. #pause:2.3
    It happened when we were on the porch, right? It's weird, but I remember it well because I'd never really talked to you before. #pause:1.5
    When I went inside and you were alone with him, I thought "I hope Rosa is okay" #pause:1
    I should have stayed
        *(Rosa_angry)I wish you had #pause:2
            ->Rudy_interview
        *(Rosa_understanding)you didn't know what he'd do #pause:2
            -> Rudy_interview
    
    = Rudy_interview
        {Rosa_angry:
            I'm so sorry. I really, really am. #pause:3.3
            }
        {Rosa_understanding:
            No, but I suspected. #pause:3.3
            }
        I didn't see anything actually happen, though. I don't want to disappoint you.
            *that's ok. it's helpful just to have someone say I was on the porch talking to Duane #pause:1.9
                ->Rudy_helpful
            
    = Rudy_helpful
    I can definitely do that.
        *(Rosa_thankful) thank you #pause:1.2
            -> Rudy_goodbye
        *(Rosa_questioning) why are you being so nice? #pause:1.2
            -> Rudy_goodbye
        
    = Rudy_goodbye
    {Rosa_thankful:
        You're very welcome. #pause:3.4
        Actually I think there's someone else you should talk to.
        ->Rudy_mentions_Jia
        }
    {Rosa_questioning:
        Because I hate the idea of you being assaulted. #pause:2.2
        Of anyone being assaulted actually. #pause: 4.2
        I'm part of the LGBTQIA+ Alliance and we talk a lot about campus sexual assault. I don't know how to stop it, but I'd be a hypocrite if I didn't support you now. #pause:1.1
        Actually #pause:3.4
        There's one other thing I can maybe do. Another person you should talk to. #pause:3
            ->Rudy_mentions_Jia
        }
    = Rudy_mentions_Jia
        She had something similar happen with Duane. Let me text her and see if she wants to have that conversation...
            *he got to another person. god. #pause:2.4
                -> Jia_talk
            *of COURSE there's someone else #pause:2.4
                ->Jia_talk
    = Jia_talk
        I can't guarantee she'll want to get involved, but I'll work on her. #pause:2
        Be well, Rosa.
        ~conversation_happening = false
            -> Olivia_mom_storylet