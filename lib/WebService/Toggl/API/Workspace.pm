package WebService::Toggl::API::Workspace;

use Types::Standard qw(Bool Int Str);
use Sub::Quote qw(quote_sub);

use Moo;
with 'WebService::Toggl::API';
with 'WebService::Toggl::Role::Item';
use namespace::clean;

sub api_path { 'workspaces' }
sub api_id   { shift->id }


sub bools { [ qw(
    admin only_admins_may_create_projects
    only_admins_see_billable_rates
    only_admins_see_team_dashboard
    premium projects_billable_by_default
) ] }

sub strings { [ qw(
    api_token at default_currency ical_url logo_url name
) ] }

sub integers { [ qw(
    id rounding rounding_minutes
) ] }

has $_ => (is => 'ro', isa => Bool, lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@{ bools() });
has $_ => (is => 'ro', isa => Str,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@{ strings() });
has $_ => (is => 'ro', isa => Int,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (@{ integers() });


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