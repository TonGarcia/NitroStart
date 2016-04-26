# encoding: utf-8
@via = 'nitro_start'
@link='#TODO your link to be shared (dynamic)'
@title='#TODO your message title'
@message='#TODO your message on the share'
@hash_tags='#TODO your HashTags references'

JustShare.via=@via
JustShare.link=CGI::unescape(@link)
JustShare.title=@title
JustShare.message=@message
JustShare.hash_tags=@hash_tags