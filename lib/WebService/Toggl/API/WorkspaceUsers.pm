package WebService::Toggl::API::WorkspaceUsers;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { 'WebService::Toggl::API::WorkspaceUser' }


1;
__END__
