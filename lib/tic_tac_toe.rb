class TicTacToe
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    def initialize
        @board = Array.new(9,' ')
    end
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(input)
        input.to_i - 1
    end
    def move(index,player)
        @board[index] = player
    end
    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O" ? true : false
    end
    def valid_move?(index)
        !position_taken?(index) && index.between?(0,9) ? true : false
    end
    def turn_count
        count = 9
        @board.each {|space| count -= 1 if space == ' '}
        count
    end
    def current_player
        turn_count.even? ? "X" : "O"
    end
    def won?
        WIN_COMBINATIONS.find do |win_combo|
            win_combo.all? {|index| @board[index] == "X"} || win_combo.all? {|index| @board[index] == "O"}
        end
    end
    def full?
        turn_count == 9 ? true : false
    end
    def draw?
        full? && !won? ? true : false
    end
    def over?
        draw? || won? ? true : false
    end
    def winner
        won? ? @board[won?[0]] : nil
    end
    def turn
        num = gets.strip
        index = input_to_index(num)
        while !valid_move?(index)
            puts "invalid"
            num = gets.strip
            index = input_to_index(num)
        end
        move(index,current_player)
        display_board
    end
    def play
        while !over?
            puts "Please enter a number 1-9: "
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end
