#!/usr/bin/perl 



use strict;
use warnings;

my $tunnel_name="";
my $filename ="";
my $fh="";
my $row="";
my $fh1="";
my @tunnels_arr=();
my $temp="";



my $filename = 'tunnel-list.txt';
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
 
while (my $row = <$fh>) {
  chomp $row;
  $row=~ /^(.*)(\@)(.*)$/;

#  print "$1\n";
  push(@tunnels_arr, $1); 

}


foreach $temp (@tunnels_arr)
{print "$temp\n";}


foreach $temp (@tunnels_arr)
{

my $filename = 'template.txt';
open(my $fh1, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

while (my $row = <$fh1>) {
  chomp $row;
  
$row=~  s/<name>/$temp/g;

  print "$row\n";
}
}
[root@RJMCK01-ANA01 ~]# cat parse-shut.pl 
#!/usr/bin/perl 



use strict;
use warnings;

my $tunnel_name="";
my $filename ="";
my $fh="";
my $row="";
my $fh1="";
my @tunnels_arr=();
my $temp="";



my $filename = 'tunnel-list.txt';
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";
 
while (my $row = <$fh>) {
  chomp $row;
  $row=~ /^(.*)(\@)(.*)$/;

#  print "$1\n";
  push(@tunnels_arr, $1); 

}


foreach $temp (@tunnels_arr)
{print "$temp\n";}


foreach $temp (@tunnels_arr)
{

my $filename = 'template-shut.txt';
open(my $fh1, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

while (my $row = <$fh1>) {
  chomp $row;
  
$row=~  s/<name>/$temp/g;

  print "$row\n";
}
}
