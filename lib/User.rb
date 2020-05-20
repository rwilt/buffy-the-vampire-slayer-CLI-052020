class User < ActiveRecord::Base
has_many :demons
has_many :weapons
##########
  #start at cemetery. expositional dialogue. use/ find items. fight vamp. clem moment.
      #maybe clem easter egg - think you run into another demon after the fight..but it's just clem. 
    #clem gives you an item.(perhaps kitten or poker related.) it has positive effect on health or power. 
    #choices affect story and health. use holy water? not effective. 
    #interact with at least a few main characters. obviously Willow is one. 
    #stake vamp? do some battle calculations. to figure out if he dies instantly or not.
    #move to library or some other area. willow story with Malcolm. show some of their convos using pastel gem etc.
    # find out Malcolm is Moloch. fight moloch. 
    # end story. for now...
##########
def self.audio
    options = {
        :channels => [0,1],
        :latency => 1,
        :output_device => @output
      }
      
      @playback = AudioPlayback.play("./lib/images/BVSTHEME.wav", options)
      
    #   # Play in the foreground
    #   @playback.block
      
end
def self.intro
    self.audio
    puts "          #{self.print_pic('./lib/images/buffystart.png')}"
    puts ""
    puts "                  In every generation there is a Chosen One."
    gets.chomp
    puts "                  She alone will stand against the Vampires, Demons, and the forces of Darkness."
    gets.chomp
    puts "                  She is..."
    gets.chomp
    puts "                  the Slayer."   
    gets.chomp
    puts "                  press -enter- to begin."
    gets.chomp
end

def self.moloch_story
    system("clear")
    puts "          #{self.print_pic('./lib/images/churchintro.png')}"
    puts ""

    sleep(1.5)
    puts "14th Century, Italy."
    sleep(2)
    puts "*Two monks sit by a fire. One looks triumphant*"
    sleep(2)
    puts "What is it,sir? Why have you called me here?"
    sleep (2.5)
    puts ""
    sleep(2)
    puts "We've done it!! We have finally destroyed Moloch the Corruptor!"
    sleep(2.5)
    puts "Entirely, sir?"
    sleep(2.5)
    puts "No. We had to harness our most ancient powers...to trap his soul."
    sleep(2.5)
    puts "Where is it trapped?"
    sleep(2)
    puts "In here."
    sleep(2.5)
    puts "*The monk holds up a tattered book of mysterious symbols*"
    sleep(2)
    puts "'This language is known only to our clan. When we perish from the Earth, the information will be lost forever.....'"
    sleep(3)
    puts "press enter to continue."
    gets.chomp
    self.username
end

def self.username
    system("clear")
    puts "          #{print_pic('./lib/images/sunnydalestart.jpeg')}"
    puts ""
    puts ""
    sleep(2)
    puts "Summer, 1997"
    sleep(2)
    puts ""
    sleep(1)
    pop = 38500
    puts "Welcome to Sunnydale, CA."
    sleep(2)
    puts "Population #{pop}..."
    sleep(1)
    pop_reduce(pop)
    puts "..."
    sleep(1)
    puts "Yeah..."
    sleep(1)
    puts "Anyway - you're gonna save a lot on rent."
    sleep(1)
    puts "What's your name?"
    #player chooses buffy summers or some random person. 
    #if buffy...
    gets.chomp
    slayer = User.create(name: "Buffy Summers", description: "The Slayer. One girl in all the world chosen to fight the forces of evil. Loves cheese and figure skating. Hates John Tesh.")
    puts "Buffy..."
    sleep(1)
    puts "Yes! Sunnydale High School, right?"
    sleep(1) 
    puts "press enter."
    gets.chomp
    puts "No offense, but there's something strange about you..."
    sleep(1)
    puts "You'll fit right in at that place! See you around!"
    sleep(1.5)
    puts "press -enter- to continue."
    gets.chomp
    slayer.start_story
    
end




def self.pop_reduce(num)
5.times do
   puts num -= 1000
   sleep(1)
end
end



def start_story
    system("clear")
    sleep(1)
    puts "five months later..." #ascii
    sleep(2)
    system("clear")
    cemetery_story
 
gets.chomp
end

def cemetery_story
       
  
    system("clear")
    sleep(2)
    #CEMTETERY IMAGE
  
    puts "          #{User.print_pic('./lib/images/buffycem.png')}"
puts "Jeez, slow night for vamps huh?...no one wants a bit of slayage?"
sleep(1.5)
puts "Xander: you know Buff, maybe it's a -good- thing that it's a quiet night..."
sleep(2)
puts "Not in my line of work. Anyway, you're right. The less vamps we meet, the more homework we can do!"
sleep(2)
puts "See? Fun never stops!"
sleep(2)
puts "Lucky me! hey, whats this?"
sleep(2)
@cross = Weapon.create(name:"Cross", power:2, description:"A small wooden cross. Will ward off vamps, but not kill them.", user_id: 1)
puts "You have received -cross-. View items? (Y/N)"
ans = gets.chomp
if ans == "Y"
    all_items
else 
    puts "You've stored #{@cross.name} for later."
end 
#TYY MENU YES OR NO
# if YES
#    all_items
# else
#     print "You've stored @cross.name for later."
# end 
sleep(2)
puts "Hey, what's up with Willow by the way? She's usually super up for some Scooby action."
sleep(2)
puts "Xander: she's been doing the whole surfing the web deal lately. Feel like she's becoming a bit addicted."
sleep(3)
puts "oh yeah, she's bee-HEY! LOOK OUT!"
sleep(2)
vamp_fight
#remove this later
sleep(2)
puts "Thanks for the help Xan, the vampire was really spooked by the whole 'scream like a girl' move."
sleep(2)
puts "I laugh in the face of danger. Then I hide until it goes away."
sleep(2)
puts "I'll say. Let's get out of here!"
willow_story
# puts "wait...I hear something..do you hear that?"
# clem_story
end 

def all_items
puts "Here are your current weapons:"
Weapon.all.each do |i|
    puts i.name + " - " + i.description
end.uniq
puts " "
puts "What do you want to do?"
#weapon_choices
end

def vamp_fight
system("clear")
puts "          #{User.print_pic('./lib/images/vampirefight2.png')}"
# @vamp = Demon.find_by(name:"Vampire")
# health =  @vamp.health
vamp_phrases = ["Why'd you ever come here, Slayer? Things were great before you came!", "You aren't going to make it out of this alive.", "It's time we vampires took back this town."]
buffy_phrases = ["I'm the thing monsters have nightmares about.", "Please - you're dust", "You really dont't know what a Slayer is."]

sleep(1)
puts vamp_phrases.sample
sleep(2)
puts buffy_phrases.sample
sleep(2)
# buffy_phrases.sample should be a method
puts "What weapon do you want to use?"
ans = gets.chomp
case ans
when "Cross"
cross_fight
when "Stake"
stake_fight
when "Axe"
   axe_fight
end 
sleep(1)
#weapon menu option
#response conditional
#conditional
#health check to see if won
#if won? - mark vamp as slayed,
end 

def win_fight
    @vamp = Demon.find_by(name:"Vampire")
    puts "The vamp disappears in a cloud of dust."
    @vamp.update(slayed?: true)
end 

def willow_story
system("clear")
puts "          #{User.print_pic('./lib/images/bf19.png')}"
puts ""
sleep(1)
puts "sorry, I know I've been invisible girl...thankfully not literally. Ive been working on digitizing this incredible book i found in the library. its written in these mystical runes ive never seen before!"
sleep(2)
puts "i've been scanning them so  Ms. Calendar can help me translate them with some fancy computer app she's got."
sleep(2)
puts "quite the hobby you've got there wil."
sleep(2)
puts "well, also...I met a boy!"
puts "I knew it! You are a thing of evil for not telling me this right away!"
    #Well, I wasn't sure there was anything to tell. But last night,   oh! We talked all night, it was amazing. He's so smart, Buffy, and, and 
    #he's romantic, and we agree about everything!
    #his name is Malcolm Black...I think i'm in love!
    #Malcolm...we have a malcolm at this school? 
    #actually...we met online.
    #...
    #...
    #...
    #hey! meeting people on the net is the new thing! i was scanning this book last night and he messaged me. 
    #
    
    
 
  
end

# def clem_story
#     puts "jeez Buffy, you asked for vamps and now we'll neve get out of here!"
#     sleep(2)
#     puts "sorry...but where is he?"
#     puts "*the leaves rustle. something is definitely there..."
#     sleep(2)
#     puts "..."
#     sleep(2)
#     puts "..."
#     puts "AHHH!! Oh jeez, it's Clem."
# end

def axe_fight
    @vamp = Demon.find_by(name:"Vampire")
    health =  @vamp.health
    axe = Weapon.find_by(name:"Axe")
    puts "You axed the vamp."
    health -= axe.power
    if health > 0
        puts "The vamp is still alive! Use axe again? (Y/N)"
        yn = gets.chomp
        if yn == "Y"
            health -= axe.power
        else
            puts "ok. what weapon do you want to use?"
            choice = gets.chomp
            weap = Weapon.find_by(name:choice)
            puts "You selected #{weap.name}."
            health -= weap.power
        end
        if health == 0 
            win_fight
        end
    end
end

def stake_fight
    @vamp = Demon.find_by(name:"Vampire")
    health =  @vamp.health
    stake = Weapon.find_by(name:"Stake")
    puts "You stake the vamp."
    health -= stake.power
    if health > 0
        puts "The vamp is still alive! Use stake again? (Y/N)"
        yn = gets.chomp
        if yn == "Y"
            health -= stake.power
        else
            puts "ok. what weapon do you want to use?"
            choice = gets.chomp
            weap = Weapon.find_by(name:choice)
            puts "You selected #{weap.name}."
            health -= weap.power
        end
        if health == 0 
            win_fight
        end
    end
end

def cross_fight
    buffy_health = self.health
    @vamp = Demon.find_by(name:"Vampire")
    health =  @vamp.health
    cross = Weapon.find_by(name:"Cross")
puts "You showed your cross to the vamp."
health -= cross.power
if health > 0
    puts "You've been hit!"
    buffy_health -= 3
    puts "Your health is now #{buffy_health}."
    sleep(1)
    puts "The vamp is still alive! Use cross again? (Y/N)"
    yn = gets.chomp
    if yn == "Y"
        health -= cross.power
     cross_fight
    else
        puts "ok. what weapon do you want to use?"
        choice = gets.chomp
        weap = Weapon.find_by(name:choice)
        puts "You selected #{weap.name}."
        health -= weap.power
    end
    if health == 0 
        win_fight
    end
    if buffy_health == 0
        lost_fight
    end
end
end

def lost_fight
system("clear")
puts "You have died. Replay? (Y/N)"
ans = gets.chomp
if ans == "Y"
    start_story
else 
    puts "ok! see you next time."
exit 
end 
end

def win_game
    puts "          #{User.print_pic('./lib/images/buffywinner.png')}"
end


def self.print_pic(path)
    options = {      
        :limit_x => 1.0,
        :limit_y => 1.0,
        :center_x => true,
        :center_y => true,
        :bg => "white",
        :bg_fill => false,
        :resolution => "high"
    }
    img = Catpix.print_image(path,options)
    # final_img = Magick::Image::read(img)
    # final_img.resize_to_fit(10,2)
end

end