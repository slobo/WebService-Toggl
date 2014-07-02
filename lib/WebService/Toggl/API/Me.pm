package WebService::Toggl::API::Me;

use Moo;
extends 'WebService::Toggl::API::User';
use namespace::clean;

sub api_path { 'me' }
sub api_id   { '' }

# should this be here?
sub reset_token { $_[0]->api_post($_[0]->base_url . '/reset_token', {})->data }

1;
__END__

"invitation" : {},

"achievements" : [
   2,
   10,
   11,
   12
],

"new_blog_post" : {
   "pub_date" : "2014-06-17T10:07:45Z",
   "url" : "http://blog.toggl.com/2014/06/top-3-time-management-mistakes-identified-togglers/?utm_source=rss&utm_medium=rss&utm_campaign=top-3-time-management-mistakes-identified-togglers",
   "title" : "Top 3 Time Management Mistakes Identified By Togglers",
   "category" : "Uncategorized"
},
