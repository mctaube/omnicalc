class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    text_split_into_array = @text.downcase.split

    @word_count = text_split_into_array.length

    @character_count_with_spaces = @text.length

    @character_count_without_spaces = text_split_into_array.join.length

    takeout_special_characters = @text.downcase.gsub(/[^a-z ]/, "")
    array_without_special_char = takeout_special_characters.split
    @occurrences = array_without_special_char.count(@special_word)

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    # Convert annual rate to monthly and make it decimal.
    monthly_rate = @apr/1200

    # Numerator
    numerator = monthly_rate*@principal

    number_of_months = @years*12

    # Denominator
    denominator = 1 - ((1 + monthly_rate)**(-number_of_months))

    # Calc the monthly payment.
    #  pmt = n / d

    @monthly_payment = numerator/denominator.to_f

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = @seconds/60.to_f
    @hours = @minutes/60.to_f
    @days = @hours/24.to_f
    @weeks = @days/7.to_f
    @years = @days/365.to_f

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end


    def descriptive_statistics
      @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

      # ================================================================================
      # Your code goes below.
      # The numbers the user input are in the array @numbers.
      # ================================================================================

      @sorted_numbers = @numbers.sort

      @count = @numbers.count

      @minimum = @numbers.sort.first

      @maximum = @numbers.sort.last

      sorted_array=@numbers.sort
      @range = sorted_array.last-sorted_array.first

      countofarray= @numbers.count

      # def median
      #   if countofarray.odd?
      #     sorted_array.at((countofarray-1)/2)
      #   else
      #     (sorted_array.at((countofarray)/2)
      #     # (sorted_array.at((countofarray)/2)-sorted_array.at((countofarray/2)-1))/2
      #   end
      # end

      @median =

      @sum = @numbers.sum

      @mean = @sum/@numbers.count

      @variance = "Replace this string with your answer."

      @standard_deviation = "Replace this string with your answer."

      @mode = "Replace this string with your answer."

      # ================================================================================
      # Your code goes above.
      # ================================================================================

      render("descriptive_statistics.html.erb")
    end
  end
