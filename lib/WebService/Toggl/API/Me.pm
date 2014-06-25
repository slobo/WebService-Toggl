package WebService::Toggl::API::Me;

use WebService::Toggl::Role::Item as => 'JsonItem';

use Moo;
with 'WebService::Toggl::API';
with 'WebService::Toggl::Role::Clone';
use namespace::clean;

with JsonItem(
    bools => [ qw(
        share_experiment send_timer_notifications show_offer
        timeline_enabled sidebar_piechart manual_mode
        used_next send_weekly_report timeline_experiment
        store_start_and_stop_time send_product_emails
        should_upgrade record_timeline openid_enabled
        render_timeline case_studies_experiment achievements_enabled
    ) ],

    strings => [ qw(
        openid_email jquery_timeofday_format fullname
        timeofday_format last_blog_entry timezone duration_format
        image_url created_at email api_token jquery_date_format
        language date_format at
    ) ],

    integers => [ qw(default_wid retention beginning_of_week id) ]
);


sub api_path { 'me' }
sub api_id   { '' }


sub workspaces {
    my ($self) = @_;
    require WebService::Toggl::API::Workspace;
    return map {WebService::Toggl::API::Workspace->new({
        api_key => $self->api_key,
        raw     => $self->clone($_),
    })} @{ $self->raw->{workspaces} };
}




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
