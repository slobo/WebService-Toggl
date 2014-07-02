package WebService::Toggl::API::Tasks;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::Task' }

sub my_url { '/tasks' }

sub update_multiple {
    my ($self, $data, @ids) = @_;
    my $ids = join ',', @ids;
    $self->api_put($self->my_url . "/$ids", $data);
}

sub delete_multiple {
    my ($self, @ids) = @_;
    my $ids = join ',', @ids;
    $self->api_delete($self->my_url . "/$ids");
}

1;
__END__
