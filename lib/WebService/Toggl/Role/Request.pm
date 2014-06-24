package WebService::Toggl::Role::Request;

use Moo::Role;

sub _request {
    my ($self, $op, $date) = @_;

    my $url = $self->_build_url($op) or die;
    my $result = $self->ua->request('POST', $url, {content =>$data});
    if ($results->{success}) {
        return $result;
    }
    else {
        die 'Shit.';
    }

}

1;
__END__
