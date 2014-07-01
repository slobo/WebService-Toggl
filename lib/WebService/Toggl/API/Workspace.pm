package WebService::Toggl::API::Workspace;

use WebService::Toggl::Role::Item as => 'JsonItem';

use Moo;
with 'WebService::Toggl::API';
use namespace::clean;

with JsonItem(
    bools => [ qw(
        admin only_admins_may_create_projects
        only_admins_see_billable_rates
        only_admins_see_team_dashboard
        premium projects_billable_by_default
    ) ],

    strings => [ qw(
        api_token at default_currency ical_url logo_url name
    ) ],

    integers => [ qw(id rounding rounding_minutes) ],
);

sub api_path { 'workspaces' }
sub api_id   { shift->id }

sub summary_report {
    my $self = shift;
    require WebService::Toggl::Report::Summary;
    WebService::Toggl::Report::Summary->new({
        api_key => $self->api_key, workspace_id => $self->id, %{ $_[0] },
    });
}

sub workspace_users {
    my ($self) = @_;
    require 'WebService::Toggl::API::WorkspaceUsers';
    return WebService::Toggl::API::WorkspaceUsers->new({
        api_key => $self->api_key, workspace_id => $self->id,
    });
}


sub invite {
    my ($self, $emails) = @_;
    my $resp = $self->api_post($self->my_url . '/invite', $emails);
    my $notifications = $resp->notifications;
    return WebService::Toggle::API::WorkspaceUsers->new({
        api_key => $self->api_key, raw => $resp->{data}
    });
}



1;
__END__
{
   "data" : {
      "admin" : false,
      "api_token" : "a7ca77c9e1b3ea3dc8123075cbb0fae9",
      "at" : "2014-05-22T13:38:33+00:00",
      "default_currency" : "USD",
      "ical_url" : "/ical/workspace_user/c7cbada99f8abf4b4d815912ab960519",
      "id" : 252748,
      "logo_url" : "https://assets.toggl.com/logos/252748/1130762d267c58b1d62b85c9ca641a4b.jpg",
      "name" : "HemoShear workspace",
      "only_admins_may_create_projects" : true,
      "only_admins_see_billable_rates" : true,
      "only_admins_see_team_dashboard" : false,
      "premium" : true,
      "projects_billable_by_default" : true,
      "rounding" : 1
      "rounding_minutes" : 1,
   }
}
