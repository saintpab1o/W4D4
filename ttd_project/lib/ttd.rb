require "byebug"

def uniq(array)
    return array.uniq

end

def two_sum(array)
    new_array = []
    array.each_with_index do |ele_1, idx_1|
        array.each_with_index do |ele_2, idx_2|
            if idx_1 < idx_2 && ele_1 + ele_2 == 0
                new_array << [idx_1, idx_2]
            end
        end
    end
    new_array
end


def my_transpose(array)
    array.transpose
end

def stock_picker(array) 
    pair = []

    greatest_diffrence = 0
    array.each_with_index do |ele_1 , idx_1|
        array.each_with_index do |ele_2, idx_2|
            if idx_2 > idx_1 && ((ele_2 - ele_1) > greatest_diffrence)
                greatest_diffrence = ele_2 - ele_1
                pair << [idx_1, idx_2]
            end
        end
    end
    return pair[-1]
end

class Tower
    attr_reader :board, :game_over
    attr_writer :board, :game_over
    
    def initialize
        @board = [[4,3,2,1],[],[]]
        @game_over = false
    end

    def print_board
        p @board
    end

    def play
       
        print_board
        until game_over == true
            puts "Please enter a tower position to move from in the format of '0 2'"
            starting_tower = gets.chomp.to_i 
            next_tower = gets.chomp.to_i 
            move(starting_tower, next_tower)
            print_board
            self.game_over = won?
            
        end
        
        puts "Congrat you won"
    end

    def move(start_tower, end_tower)
        disk_move = board[start_tower].pop
        board[end_tower] << disk_move
    end

    def valid_moves(starting_tower, next_tower)
        [starting_tower, next_tower].all? {|i| i.between?(0,2) }
    end

    def won?
        @board[0].empty? && @board[1..2].any?(&:empty?)
    end
end

a = Tower.new
a.play


#You can move to empty "towers" (subarrarys) or towers that have a larger disk (number) as the last element
#You win when either towers that is not your starting tower (subarray at index 0) is stacked with all the disk
#We should check in moves whether a move is valid or not, so win just purely checks if a tower is full or not