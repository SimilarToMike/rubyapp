require "tty-prompt"
require "artii"
require "colorize"



class Question
     attr_accessor :question, :choices, :answer
     def initialize(question, choices, answer)
          @question = question
          @choices = choices
          @answer = answer
     end
end



q1 = "Has Mr. Burns age ever been given as older than 100?".yellow.on_blue.bold
c1 = %w(True False)
q2 = "How old is Bart?".blue.on_yellow.bold
c2 = %w(9 10 11 32)
q3 = "Is Lisa 8 years old?".yellow.on_blue.bold
c3 = %w(True False)
q4 = "In the Episode 'Das Bus' who does it say rescued the children?".blue.on_yellow.bold
c4 = %w(Otto Moe Homer Carl)
q5 = "Does Bart have a secret twin sister?".yellow.on_blue.bold 
c5 = %w(True False)
q6 = "Where did Homer put his gun after Marge caught him with it?".blue.on_yellow.bold 
c6 = %w(Toilet Moe's Treehouse Fridge)
q7 = "Has Bart ever had a tattoo?".yellow.on_blue.bold
c7 = %w(True False)
q8 = "Has Maggie ever talked?".blue.on_yellow.bold 
c8 = %w(True False)
q9 = "What is Ned Flanders business called?".yellow.on_blue.bold
c9 = %w(Flanderino's Diddletorium Leftorium Nedsware)
q10 = "What is the name of Bart's secret twin?".blue.on_yellow.bold.
c10 = %w(Lenny Cartman Finn Hugo)

questions = [
     Question.new(q1, c1, "True"),
     Question.new(q2, c2, "10"),
     Question.new(q3, c3, "True"),
     Question.new(q4, c4, "Moe"),
     Question.new(q5, c5, "False"),
     Question.new(q6, c6, "Fridge"),
     Question.new(q7, c7, "True"),
     Question.new(q8, c8, "True"),
     Question.new(q9, c9, "Leftorium"),
     Question.new(q10, c10, "Hugo")
]


def run_quiz(questions)
     prompt = TTY::Prompt.new
     a = Artii::Base.new :font => 'slant'
     puts a.asciify('The Simpsons Trivia Game!')
     puts "Welcome to The Simpson's Trivia Quiz, please enter your name to begin!".yellow.on_blue.bold
     name = gets.chomp
     puts "Welcome " + name + ", all you gotta do is choose one of the multiple choice options that appear!
     Think you can handle that " + name + "?... Great, time for the first question!"
     answer = ""
     score = 0
     for question in questions
          answer = prompt.select(question.question,question.choices)
          if answer == question.answer
               score += 1
          end
     end
     puts "You got #{score} out of #{questions.length()} questions correct!".yellow.on_blue.bold

     puts a.asciify('Thanks for playing!')
end

run_quiz(questions)