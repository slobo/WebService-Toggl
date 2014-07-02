package WebService::Toggl::API::ProjectUsers;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::ProjectUser' }

sub my_url { '/project_users' }

# todo: this probably doesn't belong here
sub create_multiple {
    my ($self, $data) = @_;
    my $response = $self->api_post($self->my_url, $data);
    return [
        map { $self->new_item_from_raw('::ProjectUser', $_) }
            @{ $response->data->{data} }
    ];
}

# todo: pretty sure this is borked
sub update_multiple {
    my ($self, $data, @ids) = @_;
    my $ids = join ',', @ids;
    my $response = $self->api_put($self->my_url . "/$ids", $data);
    return [
        map { $self->new_item_from_raw('::ProjectUser', $_) }
            @{ $response->data->{data} }
    ];
}

sub delete_multiple {
    my ($self, @ids) = @_;
    my $ids = join ',', @ids;
    $self->api_delete($self->my_url . "/$ids");
}

1;
__END__
