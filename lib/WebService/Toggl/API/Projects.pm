package WebService::Toggl::API::Projects;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::Project' }

sub my_url { '/projects' }

sub delete_multiple {
    my ($self, @ids) = @_;
    my $ids = join ',', @ids;
    $self->api_delete($self->my_url . "/$ids");
}

1;
__END__
