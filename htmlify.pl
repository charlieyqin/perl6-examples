use v6;

use lib 'lib';
use Pod::Htmlify;
use Perl6::Examples;

my %base-categories-table =
    "best-of-rosettacode" => "Best of Rosettacode",
    "99-problems"         => "99 problems",
    "cookbook"            => "Cookbook examples",
    "euler"               => "Answers for Project Euler",
    "games"               => "Games written in Perl 6",
    "interpreters"        => "Language or DSL interpreters",
    "module-management"   => "Module management",
    "parsers"             => "Example grammars",
    "perlmonks"           => "Answers to perlmonks.org questions",
    "rosalind"            => "Bioinformatics programming problems",
    "shootout"            => "The Computer Language Benchmark Game",
    "tutorial"            => "Tutorial examples",
    "wsg"                 => "The Winter Scripting Games",
    "other"               => "Uncategorized examples",
;

my %menu-tabs =
    "/categories/best-of-rosettacode.html" => "Rosettacode",
    "/categories/99-problems.html"         => "99 Problems",
    "/categories/cookbook.html"            => "Cookbook",
    "/categories/euler.html"               => "Euler",
    "/categories/games.html"               => "Games",
    "/categories/interpreters.html"        => "Interpreters",
    "/categories/module-management.html"   => "Modules",
    "/categories/parsers.html"             => "Grammars",
    "/categories/perlmonks.html"           => "Perlmonks",
    "/categories/rosalind.html"            => "Rosalind",
    "/categories/shootout.html"            => "Shootout",
    "/categories/tutorial.html"            => "Tutorial",
    "/categories/wsg.html"                 => "WSG",
    "/categories/other.html"               => "Other",
;

my $all-categories = Categories.new(categories-table => %base-categories-table);

my %cookbook-categories-table =
    "01strings"                  => "Strings",
    "02numbers"                  => "Numbers",
    "03dates-and-times"          => "Dates and Times",
    "04arrays"                   => "Arrays",
    "05hashes"                   => "Hashes",
    "07file-access"              => "File access",
    "09directories"              => "Directories",
    "10subroutines"              => "Subroutines",
    "13classes-objects-and-ties" => "Classes, Objects and Ties",
;

my $cookbook-categories = Categories.new(categories-table => %cookbook-categories-table);
$all-categories.append-subcategories(to-category => "cookbook", subcategories => $cookbook-categories);

my %wsg-categories-table =
    "beginner-2007" => "Beginner-level problems 2007",
    "beginner-2008" => "Beginner-level problems 2008",
    "advanced-2008" => "Advanced-level problems 2008",
;

my $wsg-categories = Categories.new(categories-table => %wsg-categories-table);
$all-categories.append-subcategories(to-category => "wsg", subcategories => $wsg-categories);

my $website = Website.new(categories => $all-categories);
$website.menu-tabs = %menu-tabs;
$website.build;

# vim: expandtab shiftwidth=4 ft=perl6
