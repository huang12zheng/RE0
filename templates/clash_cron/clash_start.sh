set +e
isRun=`ps aux | grep clash | grep '\-d'|grep -v grep|grep -v ansible|grep -v start`
set -e
echo "$isRun"
# [ -n "$isRun" ] && export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
if [ -z "$isRun" ]; then
    unset https_proxy http_proxy all_proxy 
    unset HTTP_PROXY HTTPS_PROXY
    /home/ubuntu/clash/clash -d /home/ubuntu/clash/
fi
# [ -n "$isRun" ] && export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
[ -n "$isRun" ] && export HTTP_PROXY=http://127.0.0.1:7890 HTTPS_PROXY=http://127.0.0.1:7890