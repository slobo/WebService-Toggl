package WebService::Toggl::API;

use Moo::Role;

has base_url => (is => 'ro', default => '/api/v8');

1;
__END__
