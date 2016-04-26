module ShareHelper
  def social_buttons
    # Config Just Share
    JustShare.title = @active_idea.tag_line_pitch
    JustShare.message = @active_idea.tag_line_pitch
    JustShare.hash_tags = @active_idea.tag_line_pitch.split
    JustShare.link=CGI::unescape(request.url)


    # Return hash
    [
        {icon: 'fa fa-facebook-square blue-text text-darken-1', link: JustShare.on(social: :facebook)},
        {icon: 'fa fa-twitter-square light-blue-text text-lighten-2', link: JustShare.on(social: :twitter)},
        {icon: 'fa fa-google-plus-square red-text', link: JustShare.on(social: :'google-plus')},
        {icon: 'fa fa-linkedin-square blue-text  text-darken-2', link: JustShare.on(social: :linkedin)},
        {icon: 'fa fa-pinterest-square red-text', link: JustShare.on(social: :pinterest)},
        {icon: 'fa fa-reddit-square red-text', link: JustShare.on(social: :reddit)},
        {icon: 'fa fa-tumblr-square blue-grey-text', link:JustShare.on(social: :tumblr)},
        {icon: 'fa fa-xing-square teal-text text-darken-1', link: JustShare.on(social: :xing)},
        {icon: 'fa fa-vk blue-text text-darken-3', link: JustShare.on(social: :vk)},
        {icon: 'fa fa-delicious blue-text', link: JustShare.on(social: :delicious)},
    ]
  end
end