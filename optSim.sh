#!/bin/bash

echo "Enter configs: "
read configs
configs="\n$configs"

STAMP=$(date +"%Y%m%d%H%M%S")

cd ~
#simplescalar base directory
cd ./simplescalar/ss-benchmark

#bzip2 directory
cd ./bzip2
#timestamps any sim1.out files with the current date
if [ -e sim1.out ] 
then
	mv ./sim1.out ./sim1$STAMP.out 
fi
#makes a copy of tmp.cfg with you configs added at the end
##########################################################
#YOU MUST ADD \n for new lines when using more than 1 arg#
##########################################################
if [ -e conf.cfg ]
then
	rm conf.cfg
fi
cp tmp.cfg conf.cfg
echo -e "$configs" >> conf.cfg
$SIMPLESIM/simplesim-3.0/sim-outorder -config conf.cfg bzip2_base.i386-m32-gcc42-nn dryer.jpg

#mcf directory
cd ~/simplescalar/ss-benchmark
cd ./mcf
if [ -e sim1.out ] 
then
        mv ./sim1.out ./sim1$STAMP.out
fi
if [ -e conf.cfg ]
then
        rm conf.cfg
fi
cp tmp.cfg conf.cfg
echo -e "$configs" >> conf.cfg
$SIMPLESIM/simplesim-3.0/sim-outorder -config conf.cfg mcf_base.i386-m32-gcc42-nn inp.in

#hmmer directory
cd ~/simplescalar/ss-benchmark
cd ./hmmer
if [ -e sim1.out ] 
then
        mv ./sim1.out ./sim1$STAMP.out
fi
if [ -e conf.cfg ]
then
        rm conf.cfg
fi
cp tmp.cfg conf.cfg
echo -e "$configs" >> conf.cfg
$SIMPLESIM/simplesim-3.0/sim-outorder -config conf.cfg hmmer_base.i386-m32-gcc42-nn bombesin.hmm

#sjeng directory
cd ~/simplescalar/ss-benchmark
cd ./sjeng
if [ -e sim1.out ] 
then
        mv ./sim1.out ./sim1$STAMP.out
fi
if [ -e conf.cfg ]
then
        rm conf.cfg
fi
cp tmp.cfg conf.cfg
echo -e "$configs" >> conf.cfg
$SIMPLESIM/simplesim-3.0/sim-outorder -config conf.cfg sjeng_base.i386-m32-gcc42-nn test.txt

#milc directory
cd ~/simplescalar/ss-benchmark
cd ./milc
if [ -e sim1.out ] 
then
        mv ./sim1.out ./sim1$STAMP.out
fi
if [ -e conf.cfg ]
then
        rm conf.cfg
fi
cp tmp.cfg conf.cfg
echo -e "$configs" >> conf.cfg
$SIMPLESIM/simplesim-3.0/sim-outorder -config conf.cfg milc_base.i386-m32-gcc42-nn < su3imp.in

#equake directory
cd ~/simplescalar/ss-benchmark
cd ./equake
if [ -e sim1.out ] 
then
        mv ./sim1.out ./sim1$STAMP.out
fi
if [ -e conf.cfg ]
then
        rm conf.cfg
fi
cp tmp.cfg conf.cfg
echo -e "$configs" >> conf.cfg
$SIMPLESIM/simplesim-3.0/sim-outorder -config conf.cfg  equake_base.pisa_little < inp.in > inp.out

exit 0
