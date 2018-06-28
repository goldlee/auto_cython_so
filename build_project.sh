PYX_SUFFIX="pyx"
HAS_PYX=false
SO_SUFFIX="so"
HAS_SO=false
SETUP="setup.py"
DPATH=`pwd`
FILESET=`ls $DPATH`
COMPILE_WAY="build"

if [ -f $SETUP ];then
    echo "Has setup"
else
    echo "No setup file, exit!"
    exit 0
fi

for file in $FILESET:
do
    if [ ${file##*.} = $PYX_SUFFIX ]
    then
        HAS_PYX=true
        break
    fi
done

if [ $HAS_PYX = false ]
then
    echo 'No pyx file, exit!'
    exit 0
fi

Python3 setup.py $COMPILE_WAY

for file in $FILESET:
do
    if [ ${file##*.} = $SO_SUFFIX ]
    then
        echo 'has so'
        HAS_SO=true
    fi
done

if [ $HAS_SO=false ]
then
    for file in `ls build | grep lib`:
    do
        echo ${file%*:}
        for ff in `ls build/${file%*:}`:
        do
            echo "build/"${file%*:}"/"${ff%*:}
            mv "build/"${file%*:}"/"${ff%*:} .
        done
    done
fi


for file in $FILESET:
do
    file=${file%*:}
    if [ ${file##*.} = $SO_SUFFIX ]
    then
        continue
    else
        rm -rf $file
    fi
done