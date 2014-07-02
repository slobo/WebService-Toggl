package WebService::Toggl::API::TimeEntries;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::TimeEntry' }

sub my_url { '/time_entries' }


sub start {
    my ($self, $data) = @_;
    my $response = $self->api_post($self->my_url . "/start", $data);
    return $self->new_item_from_raw( $self->list_of, $respose->data->{data} );
}


sub current {
    my ($self) = @_;
    my $response = $self->api_get($self->my_url . "/current");
    return $self->new_item_from_raw( $self->list_of, $respose->data->{data} );
}

1;
__END__
