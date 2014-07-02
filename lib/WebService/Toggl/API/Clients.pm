package WebService::Toggl::API::Clients;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { 'WebService::Toggl::API::Client' }

sub my_url { '/clients' }


1;
__END__
