require 'date'

def wait_for_load
  beginTime = Time.now.to_i
  begin
    loop do
      sleep(2)
      isComplete = page.evaluate_script('document.readyState')
      break if Time.now.to_i - beginTime == 5
      break if isComplete == 'complete'
      puts 'completed'
    end
  rescue
  end
end

def check_images
  img = '.image-container img'

  if (page.find_all(img, visible: true))
    puts 'all images load'
  elsif (page.find_all(img, visible: false))
    puts 'all images not load'
  else
    puts 'all images not load'
  end

end



def random_id(length=6)
  chars = '0123456789'
  string = ''
  length.times { string << chars[rand(chars.size)] }
  return string
end
