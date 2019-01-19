module Enhancer
  def split_into_sub_images(img)
    img_width = img.first.length
    step = img_width % 3 == 0 ? 3 : 2
    (0..img_width-1).step(step).inject([]) do |out, col|
      (0..img_width-1).step(step).each do |row|
        out << (col..col+step-1).map do |pixel|
          #binding.pry
          img[pixel].slice(row, step)
        end
      end
      out
    end
  end

  def a_to_finger_print(a)
    a.map{|row| row.join }.join("/")
  end

  def flip(img)
    img.map{|line| line.reverse }
  end

  def rotate(img)
    new_img = []
    #puts [img, new_img].inspect
    width = img.length
    (0..width-1).each do |col|
      (0..width-1).each do |row|
        new_img[col] ||= []
        #puts [col, row, img[row][col]].inspect
        new_img[col][width-1 - row] = img[row][col]
        #puts new_img.inspect
      end
    end
    #puts [img, new_img].inspect
    new_img
  end

  def finger_prints(orig_img)
    (0..3).map do |rotations|
      img = orig_img.clone
      rotations.times { img = rotate(img) }
      [
        a_to_finger_print(img),
        a_to_finger_print(flip(img)),
      ]
    end.flatten
  end

  def combine_sub_images(sub_imgs)
    #puts sub_imgs.inspect
    #puts "images are #{sub_imgs.count}"
    #puts sub_imgs.inspect
    sub_imgs.each_with_index.inject([]) do |new_img, (sub_img, index)|
      col, row = index.divmod(Math.sqrt(sub_imgs.count))
      #puts "the vars"
      puts [sub_imgs, new_img, sub_img, index].inspect
      (0..sub_img.count-1).each do |sub_row|
        #binding.pry
        new_img[col + sub_row] ||= []
        puts [col, sub_row, row, new_img].inspect
        puts "adding #{sub_img[sub_row]}"
        new_img[col + sub_row].concat(sub_img[sub_row])
      end
      new_img
    end
  end
end
