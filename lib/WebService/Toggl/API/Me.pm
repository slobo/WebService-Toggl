package WebService::Toggl::API::Me;

use Types::Standard qw(Bool Int Str);
use Sub::Quote qw(quote_sub);

use Moo;
with 'WebService::Toggl::API';
with 'WebService::Toggl::Role::Item';
with 'WebService::Toggl::Role::Clone';
use namespace::clean;

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


sub bools { [ qw(
    share_experiment send_timer_notifications show_offer
    timeline_enabled sidebar_piechart manual_mode
    used_next send_weekly_report timeline_experiment
    store_start_and_stop_time send_product_emails
    should_upgrade record_timeline openid_enabled
    render_timeline case_studies_experiment achievements_enabled
) ] }

sub strings { [ qw(
    openid_email jquery_timeofday_format fullname
    timeofday_format last_blog_entry timezone duration_format
    image_url created_at email api_token jquery_date_format
    language date_format at
) ] }

sub integers { [ qw(default_wid retention beginning_of_week id) ] }

has $_ => (is => 'ro', isa => Bool, lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@{ bools() });
has $_ => (is => 'ro', isa => Str,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@{ strings() });
has $_ => (is => 'ro', isa => Int,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@{ integers() });



1;
__END__



      "invitation" : {},


      "workspaces" : [
         {
            "admin" : false,
            "api_token" : "a7ca77c9e1b3ea3dc8123075cbb0fae9",
            "at" : "2014-05-22T13:38:33+00:00",
            "default_currency" : "USD",
            "ical_url" : "/ical/workspace_user/c7cbada99f8abf4b4d815912ab960519",
            "id" : 252748,
            "logo_url" : "https://assets.toggl.com/logos/252748/1130762d267c58b1d62b85c9ca641a4b.jpg",
            "name" : "HemoShear workspace",
            "only_admins_may_create_projects" : true,
            "only_admins_see_billable_rates" : true
            "only_admins_see_team_dashboard" : false,
            "premium" : true,
            "projects_billable_by_default" : true,
            "rounding" : 1,
            "rounding_minutes" : 1,
         }
      ],


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
