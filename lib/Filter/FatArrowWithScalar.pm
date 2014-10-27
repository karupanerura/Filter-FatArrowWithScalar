package Filter::FatArrowWithScalar;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.01";

use Filter::Util::Call;

sub import {
    my $class = shift;
    filter_add sub {
        my $status;
        if ($status = filter_read()) {
            die "filter abort. status: $status. " if $status < 0;
            s/=> ?/=> scalar /g;
        }
        return $status;
    };
}


1;
__END__

=encoding utf-8

=head1 NAME

Filter::FatArrowWithScalar - Just an idea.

=head1 SYNOPSIS

    use Filter::FatArrowWithScalar;

    $db->insert(foo => {
        bar => $req->param('bar'),
    });

=head1 DESCRIPTION

Filter::FatArrowWithScalar is ...

=head1 LICENSE

Copyright (C) karupanerura.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

karupanerura E<lt>karupa@cpan.orgE<gt>

=cut

