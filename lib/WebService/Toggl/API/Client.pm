package WebService::Toggl::API::Client;

use WebService::Toggl::Role::Item as => 'JsonItem';

use Moo;
with 'WebService::Toggl::API';
use namespace::clean;

with JsonItem(
    bools => [ qw() ],
    strings => [ qw(name notes at) ],
    integers => [ qw(id wid) ]
);


sub api_path { 'clients' }
sub api_id   { shift->id }


sub projects {
    my ($self) = @_;
    my $response = $self->api_get($self->my_url . '/projects');
    return map { $self->new_item_from_raw('::Project', $_) }
        @{ $response->data };
}


1;
__END__

{
   "id":1239455,
   "wid":777,
   "name":"Very Big Company",
   "notes":"something about the client",
   "at":"2013-02-26T08:55:28+00:00"
}
