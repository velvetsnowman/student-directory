def print_header
    puts "The students of Villains Academy"
    puts "------------------------------------"
end

def print(arguement)
    arguement.each do |x|
        puts "#{x[:name]} (#{x[:cohort]} cohort)"
    end
end

def print_footer(arguement)
    puts "Overall, we have #{arguement.count} great students."
end

def input_students
    puts "Please enter the names of the students you want to add: "
    puts "(To finish, just hit return twice)"
    @students = []
    name = gets.chomp.capitalize
    while !name.empty? do
        puts "What cohort are they in?"
        cohort = gets.chomp.capitalize
        if cohort == "January" || cohort == "February" || cohort == "March" || cohort == "April" || cohort == "May" || cohort == "June" || cohort == "July" || cohort == "August" || cohort == "September" || cohort == "October" || cohort == "November" || cohort == "December"
          @students << {name: name, cohort: cohort.to_sym}
          puts "Now we have #{@students.count} students"
          puts "Next student:"
          name = gets.chomp.capitalize
        else
          puts "That month doesn't exist, check your spelling!"
        end
    end
    @students
end

@students = input_students
print_header
print(@students)
print_footer(@students)