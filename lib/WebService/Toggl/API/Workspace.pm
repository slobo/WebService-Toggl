package WebService::Toggl::API::Workspace;

use Moo;
with 'WebService::Toggl::Role::Entity';
use namespace::clean;

sub api_path { 'workspaces' }


1;
__END__
