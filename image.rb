class Image
  # require 'pry'
  attr_accessor :image

  def initialize(image_array)
    @image = Array.new(image_array)
  end

  def output_image
    @image.each do |f|
      f.each do |n|
        print n
      end
      puts
    end

    #Other possible method using join method?
    #image.each { |x| puts x.join }
  end

  def image_blur(n)
    n.times do
      if @temp_image == nil 
        temp_image = Array.new(@image.length) {Array.new(@image[0].length, 0)}
      end
      @image.each_with_index do  |row, i|
        row.each_with_index do |x, row_i|
          if x == 1
            #Left
            temp_image[i][row_i - 1] = 1 unless row_i == 0
            #Right
            temp_image[i][row_i + 1] = 1 unless row_i == row.length - 1
            #Down
            temp_image[i + 1][row_i] = 1 unless i == @image.length - 1
            #Up
            temp_image[i - 1][row_i] = 1 unless i == 0
            temp_image[i][row_i] = 1
          end
        end
      end
      @image = temp_image
    end
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
])
puts "How many pixels would you like to blur?"
image.image_blur(gets.to_i)
image.output_image
