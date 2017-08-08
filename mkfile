SUM_TARGETS=`{ ./bin/targets }

sum_targets:V:	$SUM_TARGETS

results/sum/%.counts:D:	data/%.paired.sorted.counts data/%.single.sorted.counts
	mkdir -p `dirname $target`
	awk 'FNR==NR { _a[FNR]=$2;} NR!=FNR { $2 += _a[FNR]; print;  }' $prereq \
	> $target'.build' \
	&& mv $target'.build' $target