package WebService::Toggl::API::WorkspaceUsers;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { 'WebService::Toggl::API::WorkspaceUser' }

sub my_url { '/workspaces/' . shift->workspace_id . '/users' }


1;
__END__
