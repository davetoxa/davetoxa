module PostHelper
  def emojify(content)
    h(content).to_str.gsub(/:([a-z0-9\+\-_]+):/) do |match|
      if Emoji.names.include?($1)
        image_tag emoji_path($1), alt: $1, class: 'emoji'
      else
        match
      end
    end.html_safe if content.present?
  end

  def emoji_path img
    "http://www.emoji-cheat-sheet.com/graphics/emojis/#{img}.png"
  end
end
