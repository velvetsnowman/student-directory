@students = []

def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
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
    student_data = [x[:name], x[:cohort]]
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
    @name = STDIN.gets.chomp
    while !@name.empty? do
        add_to_array
        puts "Now we have #{@students.count} students"
        @name = STDIN.gets.chomp
    end
end

def add_to_array
  @students << {name: @name, cohort: :November}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, cohort = line.chomp.split(',')
    add_to_array
  end
  file.close
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------------------------"
end

def print_students_list
    @students.each do |x|
        puts "#{x[:name]} (#{x[:cohort]} cohort)"
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students."
end

try_load_students
interactive_menu
