# set -x
cd `dirname $0`
ls *.txt|sed '/^$/d'>src
ls *.log|awk -F '.log' '{print $1}'|awk -F 'ans-' '{print $2}'|sed '/^$/d'>output
srcs=`grep -vFf output src`
if [ -z "`cat output|sed '/^$/d'`" ]; then
    echo "except"
    srcs=`cat src`
fi
date>>runInfo
echo $srcs>>runInfo
# dests=`ls *.log`

for file in $srcs
do
echo $file
filename=`echo $file|awk -F '.' '{print $1}'`
IFS=$'\n'
    answerFlag=""
    startFlag=""
    questionflag=""
    answerFlag=""
    rm ans-$filename.log
    filename="ans-$filename"
    for item in `cat $file`
    do
        # echo $item
        startContent=`echo $item|grep '选择题'`
        if [ -n "$startContent" ]; then
            # echo $item
            startFlag=True
        fi

        if [ -n "$startFlag" ]; then
            questionContent=`echo $item|grep -E '^[0-9]+．'|awk -F '．' '{print $1}'`
            if [ -n "$questionContent" ]; then
                # echo $item
                questionflag=True
                echo  $questionContent>>$filename.log
                answerFlag=""
                # insert to file
            fi
            if [ -n "$questionflag" ]; then
                answerContent=`echo $item|grep -E '【答案】'`
                if [ -n "$answerContent" ]; then
                    # echo $item
                    answerFlag=True
                fi
            fi
            if [ -n "$answerFlag" ]; then
                # echo $item
                echo  $item>>$filename.log
            fi
        fi
        
    done
# filename=`echo $file|awk -F '.' '{print $1}'`
# part1line=`awk '/非选择题/ {print FNR}' $file|head -1`
# totalline=`cat $file|wc -l`
# part2line=$(($totalline-$part1line))
# head -n $part1line $file|grep -E '^【答案】|^【解析】'>$filename.log
# tail -n $part2line $file|grep -E '^【答案】|^【解析】|^（|^②|^③'>>$filename.log
# cat $file|awk -F '非选择题' '{print $2}'|grep -E '^【答案】|^【解析】|^（|^②|^③'>$filename.log
done