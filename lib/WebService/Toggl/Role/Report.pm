package WebService::Toggl::Role::Report;

use Moo::Role;

has base_url => (is => 'ro', default => 'https://www.toggl.com/reports/api/v2');


1;
__END__
