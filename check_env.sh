if [ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ]; then
   export hostip=$(cat /etc/resolv.conf |grep -oP '(?<=nameserver\ ).*')
   export http_proxy="socks5://${hostip}:7890"
   export https_proxy="socks5://${hostip}:7890"
   echo "hello"
fi
