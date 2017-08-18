#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

use LWP::UserAgent;
use HTTP::Request;
use JSON;
use URI::Escape;

my $api_key = "api_key";

sub new {
#    my($args) = @_;
    my $auth = "Authorization: Bearer " . $api_key;
    my $self = {
        #hostname => $args->{hostname},
        hostname => 'grafana-test.it.su.se',
        auth     => $auth,
    };
    $self->{url} = "https://$self->{hostname}";
    $self->{ua} = LWP::UserAgent->new;

    #bless $self;
    return $self;
}

my $info = new();
print Dumper $info if $ENV{debug};

my $content_type = "application/json";
my $dashboard ="switch";
my $uri = URI->new("$info->{url}/dashboards/$dashboard");

my $req = HTTP::Request->new('GET' => "$uri");
$req->content_type($content_type);
$req->header( Authorization => $info->{auth} );
$req->header( Accept => $content_type );

print Dumper $req;

my $ua = LWP::UserAgent->new;
my $response = $ua->request($req);

print Dumper $response;
