def select_elements_starting_with_a(array)
	array.select{|w| w.chars.first == "a" } 
end

def select_elements_starting_with_vowel(array)
	array.select{|w| %w(a e i o u).include?(w.chars.first)} 
end

def remove_nils_from_array(array)
	array.reject{|el| el.nil? }
end

def remove_nils_and_false_from_array(array)
	array.select{|el| el }
end

def reverse_every_element_in_array(array)
	array.map{|el| el.reverse}
end

def every_possible_pairing_of_students(array)
	array.combination(2).to_a
end

def all_elements_except_first_3(array)
	array[3..-1]
end

def add_element_to_beginning_of_array(array, el)
	array.unshift(el)
end

def array_sort_by_last_letter_of_word(array)
	array.sort_by{|word| word.chars.last}
end

def get_first_half_of_string(string)
	string[0..(string.length/2.0).ceil-1]
end

def make_numbers_negative(number)
	number < 0 ? number : -1*number
end

def separate_array_into_even_and_odd_numbers(array)
	[array.select{|i| i.even?}, array.select{|i| i.odd?}]
end

def number_of_elements_that_are_palindromes(array)
	array.select{|word| word.reverse == word}.size
end

def shortest_word_in_array(array)
	array.sort_by{|word| word.length}.first
end


def longest_word_in_array(array)
	array.sort_by{|word| word.length}.last
end

def total_of_array(array)
	array.inject(:+)
end

def double_array(array)
	array*2
end

def turn_symbol_into_string(symbol)
	symbol.to_s
end

def average_of_array(array)
	(array.inject(:+).to_f/array.size).round
end

def get_elements_until_greater_than_five(array)
	array[0..(array.find_index{|number| number > 5 })-1]
end

def convert_array_to_a_hash(array)
	Hash[*array]
end

def get_all_letters_in_array_of_words(array)
	array.inject(:+).chars.uniq.sort
end

def swap_keys_and_values_in_a_hash(hash)
	hash.invert
end

def add_together_keys_and_values(hash)
	(hash.keys+hash.values).inject(:+)
end

def remove_capital_letters_from_string(string)
	string.chars.reject{|char| ("A".."Z").include?(char)}.join
end

def round_up_number(number)
	number.ceil
end

def round_down_number(number)
	number.floor
end

def format_date_nicely(time)
	time.strftime("%d/%m/%Y")
end

def get_domain_name_from_email_address(string)
	string.split("@").last.split(".")[0..-2].join(".")
end

def titleize_a_string(string)
	([string.split(/\W+/).first.capitalize] + string.split(/\W+/)[1..-1].map{|word| %w(a and the).include?(word) ? word : word.capitalize }).join(" ")
end	

def check_a_string_for_special_characters(string)
  non_special_chars = ('A'..'Z').to_a+('a'..'z').to_a+('0'..'9').to_a
	!string.chars.all?{|char| non_special_chars.include?(char)}
end

def get_upper_limit_of(range)
	range.end
end

def is_a_3_dot_range?(range)
	range.exclude_end?
end


def square_root_of(number)
	number**(0.5)
end

def word_count_a_file(path)
	%x(wc -w #{path}).to_i
end

def call_method_from_string(string)
	send(string)
end

def is_a_2014_bank_holiday?(time)
	require 'json'
	hols = JSON.parse( IO.read('bank-holidays.json'))["england-and-wales"]["events"].map{|hol| Time.parse hol["date"]}
	hols.include?(time)
end

def your_birthday_is_on_a_friday_in_the_year(date)
	require 'date'
	date = date.to_date
	while !date.friday? do 
		date = date.next_year
	end
	date.strftime('%Y').to_i
end

def count_words_of_each_length_in_a_file(path)
	i = Hash.new(0)
	IO.read('lorem.txt').split(/\W+/).group_by{|word| word.length}.each{|k, v| i[k]= v.length}
	i
end

def fizzbuzz(number)
	return 'FizzBuzz' if divisible_by_three(number) && divisible_by_five(number)
	return 'Fizz' if divisible_by_three(number)
	return 'Buzz' if divisible_by_five(number)
	number
end

def divisible_by_three(number)
	modulo(number, 3) == 0 
end

def divisible_by_five(number)
	modulo(number, 5) == 0
end

def modulo(divisor, divider)
	divisor - divisor/divider*divider
end

def print_lyrics(n)
	string = ""
	n.downto(0){|number| string << "#{ number == 0 ? 'No more b' : "#{number} b"}ottle#{'s' if number !=1 } of beer on the wall, #{ number == 0 ? 'no more' : number} bottle#{ 's' if number != 1 } of beer.#{ number == 0 ? ".. Go to the store and buy some more...\n#{n} bottle#{'s' if n !=1 } of beer." : "\nTake one down and pass it around, #{number == 1 ? 'no more' : number-1} bottle#{'s' if number != 2} of beer on the wall.\n\n"}"}
	string
end
