class User < ActiveRecord::Base
has_many :demons
has_many :weapons

def self.intro
    puts "In every generation there is a Chosen One."
    sleep(2)
    puts "She alone will stand against the Vampires, Demons, and the forces of Darkness."
    sleep(2)
    puts "She is..."
    sleep(2)
    puts "the Slayer."   
    sleep(1)
    puts "press -enter- to begin."
    gets.chomp
end

def self.username
    system("clear")
    sleep(2)
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
    puts "Anyway, you'll fit right in at that place! See you around!"
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
    puts "a week later..."
    #start at cemetery. expositional dialogue. use/ find items. fight vamp.
    #maybe clem easter egg - think you run into another demon after the fight..but it's just clem. 
    #clem gives you an item.(perhaps kitten or poker related.) it has positive effect on health or power. 
    #choices affect story and health. use holy water? not effective. 
    #interact with at least a few main characters. obviously Willow is one. 
    #stake vamp? do some battle calculations. to figure out if he dies instantly or not.
    #move to library or some other area. willow story with Malcolm. show some of their convos using pastel gem etc.
    # find out Malcolm is Moloch. fight moloch. 
    # end story. for now... 
gets.chomp
end

end