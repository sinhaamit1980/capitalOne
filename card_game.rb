
class CardGame

  def read_file_and_validate_winner(test_file)

    text = File.open(test_file).read

    text.each_line do|line|
      validate_the_winner(line.gsub("\n", ""))
    end

  end

  def validate_the_winner(line)
    trump_card = line.split('|')[1].strip

    card_1 = line.split('|')[0].split(' ')[0]
    card_2 = line.split('|')[0].split(' ')[1]

    if card_1.split('').length > 2
      card_1_value = "#{card_1.split('')[0]}#{card_1.split('')[1]}"
      card_1_suite = card_1.split('')[2]
    else
      card_1_value = card_1.split('')[0]
      card_1_suite = card_1.split('')[1]
    end

    if card_2.split('').length > 2
      card_2_value = "#{card_2.split('')[0]}#{card_2.split('')[1]}"
      card_2_suite = card_2.split('')[2]
    else
      card_2_value = card_2.split('')[0]
      card_2_suite = card_2.split('')[1]
    end

    #
    # card_2_value = card_2.split('')[0]
    # card_2_suite = card_2.split('')[1]

    if (card_1_suite.eql?(trump_card)) && !(card_2_suite.eql?(trump_card))
      puts "Winner card is : #{card_1}"
    end

    if !(card_1_suite.eql?(trump_card)) && (card_2_suite.eql?(trump_card))
      puts "Winner card is : #{card_2}"
    end

    if (card_1_suite.eql?(trump_card)) && (card_2_suite.eql?(trump_card))
      compare_card_value(card_1_value, card_2_value, card_1, card_2)
    end

    if (!card_1_suite.eql?(trump_card)) && !(card_2_suite.eql?(trump_card))
      compare_card_value(card_1_value, card_2_value, card_1, card_2)
    end

  end

  def compare_card_value(card_1_value, card_2_value, card_1, card_2)
    if card_1_value.eql?(card_2_value)
      puts "winner cards are : #{card_1} #{card_2}"
    elsif !(card_1_value.eql?('A')) && !(card_1_value.eql?('K')) && !(card_1_value.eql?('Q')) && !(card_1_value.eql?('J')) && !(card_2_value.eql?('A')) && !(card_2_value.eql?('K')) && !(card_2_value.eql?('Q')) && !(card_2_value.eql?('J'))
      if card_1_value.to_i > card_2_value.to_i
        puts "Winner card is : #{card_1}"
      else
        puts "Winner card is : #{card_2}"
      end
    else
      compare_card_when_its_AKQJ(card_1_value, card_2_value, card_1, card_2)
    end

  end

  def compare_card_when_its_AKQJ(card_1_value, card_2_value, card_1, card_2)
    if card_1_value.eql?('A')
      puts "Winner card is : #{card_1}"
    end

    if card_1_value.eql?('K') && !(card_2_value.eql?('A'))
      puts "Winner card is : #{card_1}"
    elsif(card_2_value.eql?('A'))
      puts "Winner card is : #{card_2}"
    end

    if card_1_value.eql?('Q') && !(card_2_value.eql?('A')) && !(card_2_value.eql?('K'))
      puts "Winner card is : #{card_1}"
    elsif(card_2_value.eql?('A')) || (card_2_value.eql?('K'))
      puts "Winner card is : #{card_2}"
    end

    if card_1_value.eql?('J') && !(card_2_value.eql?('A')) && !(card_2_value.eql?('K')) && !(card_2_value.eql?('Q'))
      puts "Winner card is : #{card_1}"
    elsif (card_2_value.eql?('A')) || (card_2_value.eql?('K')) || (card_2_value.eql?('Q'))
      puts "Winner card is : #{card_2}"
    end
  end

end

