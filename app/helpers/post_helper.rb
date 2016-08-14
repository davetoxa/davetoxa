module PostHelper
  def emojify(content)
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if Emoji.find_by_alias($1)
        image_tag emoji_path($1), alt: $1, class: 'emoji'
      else
        match
      end
    end.html_safe if content.present?
  end

  def emoji_path(img)
    "http://www.emoji-cheat-sheet.com/graphics/emojis/#{img}.png"
  end
end
