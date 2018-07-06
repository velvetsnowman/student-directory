@students = []

def interactive_menu
    loop do
      print_menu
      process(gets.chomp)
    end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save students to students.csv"
  puts "4. Load students from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |x|
    student_data = [x[:name], x[:cohort], x[:age], x[:height], x[:colour]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def input_students
    puts "Please enter the names of the students you want to add: "
    puts "(To finish, just hit return twice)"
    @name = gets.chomp
    while !@name.empty? do
        puts "What cohort are they in?"
        @cohort = gets.chomp.capitalize
        if @cohort == "January" || @cohort == "February" || @cohort == "March" || @cohort == "April" || @cohort == "May" || @cohort == "June" || @cohort == "July" || @cohort == "August" || @cohort == "September" || @cohort == "October" || @cohort == "November" || @cohort == "December"
          puts "And his or her age?"
          @age = gets.chomp
          puts "And their height?"
          @height = gets.chomp.to_s
          puts "And their favourite colour?"
          @colour = gets.chomp
          add_to_array
          if @students.count == 1
            puts "Now we have #{@students.count} student"
            puts "Next student:"
          else
            puts "Now we have #{@students.count} students"
            puts "Next student:"
          end
          @name = gets.chomp
        else
          puts "That month doesn't exist, check your spelling!"
        end
    end
end

def add_to_array
  @students << {name: @name, cohort: @cohort.to_sym, age: @age, height: @height, colour: @colour}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort, @age, @height, @colour = line.chomp.split(',')
    add_to_array
  end
  file.close
end

def show_students
  if @students.count > 0
    print_header
    print_students_list
    print_footer
  else
    puts "There are no students to print :("
  end
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end

def print_students_list
    acc = 1
    @students.each do |x|
        puts "#{acc}. #{x[:name]} (#{x[:cohort]} cohort) - Age: #{x[:age]} | Height: #{x[:height]} | Favourite Colour: #{x[:colour]}"
        acc += 1
    end
end

def print_footer
    if @students.count == 1
      puts "Overall, we have #{@students.count} great student."
    else
      puts "Overall, we have #{@students.count} great students."
    end
end

try_load_students
interactive_menu
