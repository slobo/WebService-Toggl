package WebService::Toggl::API::TimeEntry;

use WebService::Toggl::Role::Item as => 'JsonItem';

use Moo;
with 'WebService::Toggl::API';
use namespace::clean;

with JsonItem(
    bools => [ qw(billable duronly) ],

    strings => [ qw(
        start stop description at created_with
    ) ],

    integers => [ qw(id wid pid tid duration) ],
);

# other: tags

sub api_path { 'time_entries' }
sub api_id   { shift->id }






1;
__END__
{
   "data" : {
      "id":436694100,
      "wid":777,
      "pid":193791,
      "tid":13350500,
      "billable":false,
      "start":"2013-02-27T01:24:00+00:00",
      "stop":"2013-02-27T07:24:00+00:00",
      "duration":21600,
      "description":"Some serious work",
      "tags":["billed"],
      "at":"2013-02-27T13:49:18+00:00"
   }
}
