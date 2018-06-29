def print_header
    puts "The students of Villains Academy"
    puts "----------------------------"
end

def print(arguement)
    arguement.each do |x|
        puts "#{x[:name]} (#{x[:cohort]} cohort) is #{x[:age]} years old, measures #{x[:height]} meters high and loves #{x[:favourite]}!"
    end
end

def print_footer(arguement)
    puts "Overall, we have #{arguement.count} great students."
end

def input_students
    puts "Please enter the names of the students you want to add: "
    puts "(To finish, just hit return twice)"
    @students = []
    name = gets.chomp
    while !name.empty? do
        puts "And his or her age?"
        age = gets.chomp
        puts "And their height?"
        height = gets.chomp.to_s
        puts "And their favourite non-fictional character?"
        favourite = gets.chomp
        @students << {name: name, cohort: :November, age: age, height: height, favourite: favourite}
        puts "Now we have #{@students.count} students"
        puts "Next student:"
        name = gets.chomp
    end
    @students
end    

@students = input_students
print_header
print(@students)
print_footer(@students)