package WebService::Toggl::API::Me;

use Moo;
with 'WebService::Toggl::Role::Entity';
use namespace::clean;

sub api_path { 'me' }

sub workspaces {
    my ($self) = @_;
    return map {WebService::Toggl::API::Workspace->new({
        api_key => $self->api_key,
        id      => $_,
    })} $self->raw->{workspace_ids};
}


my @bools = qw(
    share_experiment send_timer_notifications show_offer
    timeline_enabled sidebar_piechart manual_mode
    used_next send_weekly_report timeline_experiment
    store_start_and_stop_time send_product_emails
    should_upgrade record_timeline openid_enabled
    render_timeline case_studies_experiment achievements_enabled
);
my @strings = qw(
    openid_email jquery_timeofday_format fullname
    timeofday_format last_blog_entry timezone duration_format
    image_url created_at email api_token jquery_date_format
    language date_format at
);
my @integers = qw(default_wid retention beginning_of_week id);

# maybe a use for Quote::Sub?
has $_ => (is => 'ro', isa => Bool, lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@bools);
has $_ => (is => 'ro', isa => Str,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@strings);
has $_ => (is => 'ro', isa => Int,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@integers);




1;
__END__



      "invitation" : {},


      "workspaces" : [
         {
            "rounding" : 1,
            "rounding_minutes" : 1,
            "at" : "2014-05-22T13:38:33+00:00",
            "only_admins_may_create_projects" : true,
            "logo_url" : "https://assets.toggl.com/logos/252748/1130762d267c58b1d62b85c9ca641a4b.jpg",
            "name" : "HemoShear workspace",
            "projects_billable_by_default" : true,
            "ical_url" : "/ical/workspace_user/c7cbada99f8abf4b4d815912ab960519",
            "admin" : false,
            "only_admins_see_team_dashboard" : false,
            "id" : 252748,
            "default_currency" : "USD",
            "api_token" : "a7ca77c9e1b3ea3dc8123075cbb0fae9",
            "premium" : true,
            "only_admins_see_billable_rates" : true
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
