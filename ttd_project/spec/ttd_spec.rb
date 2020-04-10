require 'rspec'
require 'ttd.rb'



describe "TTD:" do
    describe "uniq" do
        it "should accept an array" do
            expect { uniq([11, 11, 5, 5, 3, 2]) }.to_not raise_error
        end

        it "should return an array of only unique elements" do
            expect(uniq([11, 11, 5, 5, 3, 2])).to eq([11,5,3,2])
        end
    end

    describe "two_sum" do
        it "should accept an array" do
            expect { two_sum([-1, 0, 2, -2, 1]) }.to_not raise_error
        end

        it "returns positions of pairs of numbers that add to zero" do
            expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
        end
    end

    describe "my_tranpose" do
        it "should accept an 2D array" do
            expect { my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]]) }.to_not raise_error
        end

        it "it should return the array tranposed" do
            expect(my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])).to eq([[0,3,6],[1,4,7],[2,5,8]])
        end
    end

    describe "stock_picker" do
        it "should accept an array" do
            expect {stock_picker([20, 50, 40, 60, 80, 50, 100, 20, 25])}.to_not raise_error
        end

        it "should return indices for the most profitable pairs" do
         expect(stock_picker([20, 50, 40, 60, 80, 50, 100, 20, 25])).to eq([0,6])
        end
    end
end

describe Tower do
    subject(:tower) {Tower.new}

    describe "#initialize" do
        it "set a board" do
            expect(tower.board).to eq([[4,3,2,1],[],[]])
        end

        it "set game_over to false " do
            expect(tower.game_over).to eq(false)
        end
    end
    
    describe "#play" do
        it "should print the board" do
            expect(tower).to receive(:print_board) { }
            expect(tower).to receive(:print_board) { tower.game_over = true }
            tower.play
        end

        it "calls #move until the game is over" do
            expect(tower).to receive(:move) { tower.game_over = true }
            tower.play
        end
    end

    describe "#move" do
        it "moves the disk at the end of the turn" do
            tower.move(0,2)
            expect(tower.board).to eq([[4,3,2],[],[1]])
        end
    end

    describe "#won?" do
        context "tower one or two not full" do
            it "returns false" do
                tower.board = [[4,3],[],[2,1]]
                expect(tower.won?).to be false
            end
        end

        context "tower one or two is full" do
            it "returns true" do 
                tower.board = [[],[],[4,3,2,1]]
                expect(tower.won?).to be true
                tower.board = [[],[4,3,2,1],[]]
                expect(tower.won?).to be true
            end
        end
    end
end