package WebService::Toggl::Report;

use Data::Printer;
use DateTime;
use Sub::Quote qw(quote_sub);

use Moo::Role;
with 'WebService::Toggl::Role::Base', 'WebApp::Helpers::JsonEncoder';

sub base_url { '/reports/api/v2' }

sub my_url { $_[0]->base_url . '/' . $_[0]->api_path }

requires 'api_path';

has raw => (is => 'ro', lazy => 1, builder => 1);
sub _build_raw {
    my ($self) = @_;
    my $response = $self->api_get($self->my_url, $self->req_params);
    return $response->data;
}

sub _req_params { [qw(workspace_id since until)] }
sub req_params {
    my ($self) = @_;
    return {
        (map {$_ => $_[0]->$_()} @{ $_[0]->_req_params() }),
        since => $self->since->ymd(), until => $self->until->ymd,
        user_agent => $self->_request->user_agent_id,
    };
}

# request params
has workspace_id => (is => 'ro', required => 1,);
has since        => (is => 'ro', lazy => 1, builder => 1,);
has until        => (is => 'ro', lazy => 1, builder => 1,);
sub _build_since { shift->until->clone->subtract(days => 6) }
sub _build_until { DateTime->now }


# response params
has $_ => (is => 'ro', lazy => 1, builder => quote_sub(q| $_[0]->raw->{$_} |))
    for (qw(total_grand total_billable total_currencies data));



1;
__END__

my @integers = qw(total_grand total_billable);
my @complex  = qw(total_currencies);

billable: possible values: yes/no/both, default both
client_ids: client ids separated by a comma, 0 if you want to filter out time entries without a client
project_ids: project ids separated by a comma, 0 if you want to filter out time entries without a project
user_ids: user ids separated by a comma
tag_ids: tag ids separated by a comma, 0 if you want to filter out time entries without a tag
task_ids: task ids separated by a comma, 0 if you want to filter out time entries without a task
time_entry_ids: time entry ids separated by a comma
description: string, time entry description
without_description: true/false, filters out the time entries which do not have a description ('(no description)')
order_field:

    date/description/duration/user in detailed reports
    title/duration/amount in summary reports
    title/day1/day2/day3/day4/day5/day6/day7/week_total in weekly report

order_desc: on/off, on for descending and off for ascending order
distinct_rates: on/off, default off
rounding: on/off, default off, rounds time according to workspace settings
display_hours: decimal/minutes, display hours with minutes or as a decimal number, default minutes
