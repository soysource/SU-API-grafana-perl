package SU::API::Grafana;

use strict;
use warnings;

use Data::Dumper;

use LWP::UserAgent;
use HTTP::Request;
use JSON;
use URI::Escape;


sub new {
    my($class, $args) = @_;
    my $auth = "Bearer " . $args->{api_key};
    my $self = {
        hostname => $args->{hostname},
        auth     => $auth,
    };
    $self->{url} = "https://$self->{hostname}";
    $self->{ua} = LWP::UserAgent->new;

    bless $self, $class;
    return $self;
}

sub do_request {
    my ($self,$dashboard) = @_;

    my $content_type = "application/json";
    my $uri = URI->new("$self->{url}/api/dashboards/db/$dashboard");
    my $req = HTTP::Request->new('GET' => "$uri");
    $req->content_type($content_type);
    $req->header( Authorization => $self->{auth} );
    $req->header( Accept => $content_type );

    my $ua = LWP::UserAgent->new;
    my $response = $ua->request($req);
}

1;
