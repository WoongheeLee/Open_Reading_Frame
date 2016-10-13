#!/usr/bin/perl

$fileName = "AE008917.fna";
open(fileHandle,$fileName);
chomp(@allLines = <fileHandle>);

$sequence = join " ", @allLines;
@arr = split / /, $sequence;
$sequence = join "", @arr;

$dem = "ATG";
$a = "TAA";
$b = "TAG";
$c = "TGA";
@arr = split /$dem/, $sequence;

open FH, ">", "problem3.txt" or die "$!\n";

%hash;
$count = 1;
for($i = 0; $i <= $#arr; $i++) {
	if($arr[$i] =~ /$a/) {
		@temp = split /$a/, $arr[$i];
		if (length($temp[0])>=3 && length($temp[0])%3 == 0) {
			$hash{"$dem$temp[0]$a"}=1;	
			
		}
	}
	if($arr[$i] =~ /$b/) {
		@temp = split /$b/, $arr[$i];
		if (length($temp[0])>=3 && length($temp[0])%3 == 0) {
			$hash{"$dem$temp[0]$b"}=1;	
		}
	}
	if($arr[$i] =~ /$c/) {
		@temp = split /$c/, $arr[$i];
		if(length($temp[0])>=3 && length($temp[0])%3 ==0) {
			$hash{"$dem$temp[0]$c"}=1;	
		}
	}
}

@arr = keys %hash;

for($i = 0; $i <= $#arr; $i++) {
	print FH $i,":\t",$arr[$i],"\n";
}

close FH;
