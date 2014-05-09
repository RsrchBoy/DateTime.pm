package DateTime::Types;

# ABSTRACT: Some simple types for DateTime objects

use strict;
use warnings FATAL => 'all';

use MooX::Types::MooseLike qw(exception_message);
use MooX::Types::MooseLike::Base;
use Exporter 5.57 'import';

our @EXPORT_OK = ();

our $VERSION = '1.02';

my $_t = sub { my ($x, $y) = @_; sub { local $_ = shift; defined && $_ >= $x && $_ <= $y } };

my $type_definitions = [
  {
    name       => 'Month',
    subtype_of => 'Int',
    from       => 'MooX::Types::MooseLike::Base',
    #test       => sub { local $_ = shift; defined && $_ > 0 && $_ < 13 },
    test       => $_t->(1, 12),
    message    => sub { return exception_message($_[0], 'an integer between 1 and 12, inclusive') },
  },
  {
    name       => 'Day',
    subtype_of => 'Int',
    from       => 'MooX::Types::MooseLike::Base',
    #test       => sub { local $_ = shift; defined && $_ >= 1 && $_ <= 31 },
    test       => $_t->(1, 31),
    message    => sub { return exception_message($_[0], 'in integer between 1 and 31, inclusive') },
  },
  {
    name       => 'Hour',
    subtype_of => 'Int',
    from       => 'MooX::Types::MooseLike::Base',
    test       => $_t->(0, 23),
    message    => sub { return exception_message($_[0], 'in integer between 0 and 23, inclusive') },
  },
  {
    name       => 'Minute',
    subtype_of => 'Int',
    from       => 'MooX::Types::MooseLike::Base',
    test       => $_t->(0, 59),
    message    => sub { return exception_message($_[0], 'in integer between 0 and 23, inclusive') },
  },
  {
    name       => 'Second',
    subtype_of => 'Int',
    from       => 'MooX::Types::MooseLike::Base',
    test       => $_t->(0, 61),
    message    => sub { return exception_message($_[0], 'in integer between 0 and 23, inclusive') },
  },
  #{
    #name       => 'PositiveInt',
    #subtype_of => 'Int',
    #from       => 'MooX::Types::MooseLike::Base',
    #test       => sub { defined $_[0] and $_[0] > 0 },
    #message    => sub { return exception_message($_[0], 'a positive integer') },
  #},
  #{
    #name       => 'PositiveOrZeroInt',
    #subtype_of => 'Int',
    #from       => 'MooX::Types::MooseLike::Base',
    #test       => sub { defined $_[0] and $_[0] >= 0 },
    #message    => sub { return exception_message($_[0], 'a positive integer or zero') },
  #},
  #{
    #name       => 'NegativeNum',
    #subtype_of => 'Num',
    #from       => 'MooX::Types::MooseLike::Base',
    #test       => sub { defined $_[0] and $_[0] < 0 },
    #message    => sub { return exception_message($_[0], 'a negative number') },
  #},
  #{
    #name       => 'NegativeOrZeroNum',
    #subtype_of => 'Num',
    #from       => 'MooX::Types::MooseLike::Base',
    #test       => sub { defined $_[0] and $_[0] <= 0 },
    #message    => sub { return exception_message($_[0], 'a negative number or zero') },
  #},
  #{
    #name       => 'NegativeInt',
    #subtype_of => 'Int',
    #from       => 'MooX::Types::MooseLike::Base',
    #test       => sub { defined $_[0] and $_[0] < 0 },
    #message    => sub { return exception_message($_[0], 'a negative integer') },
  #},
  #{
    #name       => 'NegativeOrZeroInt',
    #subtype_of => 'Int',
    #from       => 'MooX::Types::MooseLike::Base',
    #test       => sub { defined $_[0] and $_[0] <= 0 },
    #message    => sub { return exception_message($_[0], 'a negative integer or zero') },
  #},
  #{
    #name       => 'SingleDigit',
    #subtype_of => 'PositiveOrZeroInt',
    #from       => 'MooX::Types::MooseLike::Numeric',
    #test       => sub { defined $_[0] and $_[0] < 10 },
    #message    => sub { return exception_message($_[0], 'a single digit') },
  #},
  ];

MooX::Types::MooseLike::register_types($type_definitions, __PACKAGE__,
  'DateTime::Types');

our %EXPORT_TAGS = ('all' => \@EXPORT_OK);

1;
