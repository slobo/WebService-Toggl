package WebService::Toggl::Report::Summary;

use Moo;
with 'WebService::Toggl::Role::Entity';
use namespace::clean;

sub api_path { 'summary' }


1;
__END__
