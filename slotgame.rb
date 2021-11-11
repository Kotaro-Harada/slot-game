puts "-----------"
puts "残りコイン数200"
puts "ポイント0"
puts "何コイン入れますか？"
puts "1(10コイン)　2(30コイン) 3(50コイン) 4(やめとく)"
puts "-----------"
@point = 0
@coin = 200
def slot
  loop do
    if @coin == 0
      break
    end
    coin_bet = { 1 => 10, 2 => 30, 3 => 50 }
    @bet = gets.to_i
    if @bet == 4
      puts "コイン数#{@coin}"
      puts "ポイント#{@point}"
      break
    end
    if @coin < coin_bet[@bet]
      puts "コインが足りません"
      puts "何コイン入れますか？"
      redo
    end
    @coin -= coin_bet[@bet]
    puts "エンターを３回押しましょう！"
    @stop_slot = gets.to_s
    if @stop_slot != nil
      @number1 = rand(0..9)
      @number2 = (@number1 + 1) % 10
      @number3 = (@number1 + 2) % 10
      @number4 = rand(0..9)
      @number5 = (@number4 + 1) % 10
      @number6 = (@number4 + 2) % 10
      @number7 = rand(0..9)
      @number8 = (@number7 + 1) % 10
      @number9 = (@number7 + 2) % 10
      puts "------------"
      puts "|#{@number1}|||"
      puts "|#{@number2}|||"
      puts "|#{@number3}|||"
      puts "------------"
      @stop_slot = gets.to_s
      if @stop_slot != nil
        puts "------------"
        puts "|#{@number1}|#{@number4}||"
        puts "|#{@number2}|#{@number5}||"
        puts "|#{@number3}|#{@number6}||"
        puts "------------"
        @stop_slot = gets.to_s
        if @stop_slot != nil
          puts "------------"
          puts "|#{@number1}|#{@number4}|#{@number7}|"
          puts "|#{@number2}|#{@number5}|#{@number8}|"
          puts "|#{@number3}|#{@number6}|#{@number9}|"
          puts "------------"
        end
      end
    end
    def center_row
      @number2 == @number5 && @number5 == @number8
    end
    def top_row
      @number1 == @number4 && @number4 == @number7
    end
    def lower_row
      @number3 == @number6 && @number6 == @number9
    end
    def diagonal_row1
      @number1 == @number5 && @number5 == @number9
    end
    def diagonal_row2
      @number3 == @number5 && @number5 == @number7
    end
    unless center_row || top_row || lower_row ||diagonal_row1 || diagonal_row2
      puts "残りコイン数#{@coin}"
      puts "ポイント#{@point}"
      puts "何コイン入れますか？"
      puts "1(10コイン)　2(30コイン) 3(50コイン) 4(やめとく)"
      puts "-----------"
    end
    case @bet
    when 1
      if center_row
        @point += 100
        @coin += 30
        puts "真ん中に#{@number2}が揃いました！"
        puts "100ポイント獲得！"
        puts "30コイン獲得！"
        puts "残りコイン数#{@coin}"
        puts "ポイント#{@point}"
        puts "何コイン入れますか？"
        puts "1(10コイン)　2(30コイン) 3(50コイン) 4(やめとく)"
        puts "-----------"
      end
    when 2
      if center_row || top_row || lower_row
        @point += 300
        @coin += 90
        puts "上に#{@number1}が揃いました！" if top_row
        puts "真ん中に#{@number2}が揃いました！" if center_row
        puts "下に#{@number3}が揃いました！" if lower_row
        puts "300ポイント獲得！"
        puts "90コイン獲得！"
        puts "残りコイン数#{@coin}"
        puts "ポイント#{@point}"
        puts "何コイン入れますか？"
        puts "1(10コイン)　2(30コイン) 3(50コイン) 4(やめとく)"
        puts "-----------"
      end
    when 3
      if center_row || top_row || lower_row || diagonal_row1 || diagonal_row2
        @point += 500
        @coin += 150
        puts "上に#{@number1}が揃いました！" if top_row
        puts "真ん中に#{@number2}が揃いました！" if center_row
        puts "下に#{@number3}が揃いました！" if lower_row
        puts "斜めに#{@number5}が揃いました！" if diagonal_row1 || diagonal_row2
        puts "500ポイント獲得！"
        puts "150コイン獲得！"
        puts "残りコイン数#{@coin}"
        puts "ポイント#{@point}"
        puts "何コイン入れますか？"
        puts "1(10コイン)　2(30コイン) 3(50コイン) 4(やめとく)"
        puts "-----------"
      end
    end
  end
end
slot
