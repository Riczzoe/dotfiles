# for reduce typing
les() {
    "$@" | less
}

# This is a function to calculate the total duration of all mp4 files in a 
# directory.
gettd() {
    _default_directory_="."
    _show_calculation_time_=false
    directory="$1"

    if [ -z "$directory" ]; then
        directory="$_default_directory_"
    fi

    if [ "$_show_calculation_time_" = true ]; then
        start_time=$(date +%s)
    fi

    # get total duration of all mp4 files in the directory by using ffprobe,
    # It is much slower than mediainfo.
    # duration=$(find "$directory" -name "*.mp4" -print0 | xargs -0 -P "$(nproc)" -I{} sh -c 'ffprobe -v error -select_streams v -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "$1" 2>/dev/null' -- {} | awk '{total += $1} END {print int(total)}')

    # get total duration of all mp4 files in the directory by using mediainfo.
    duration=$(find "$directory" -name "*.mp4" -print0 | xargs -0 -P "$(nproc)" -I{} sh -c 'mediainfo --Output="General;%Duration%" "$1"' -- {} | awk '{total += $1} END {print int(total/1000)}')
    
    hours=$((duration / 3600))
    minutes=$((duration % 3600 / 60))
    seconds=$((duration % 60))

    echo "Total duration in $directory: ${hours}h ${minutes}m ${seconds}s"

    if [ "$_show_calculation_time_" = true ]; then
        end_time=$(date +%s)
        execution_time=$((end_time - start_time))
        echo "Calculation time: ${execution_time}s"
    fi
}

listtd() {
    # 获取第一个参数作为目标文件夹路径，如果没有参数则使用当前文件夹
    target_folder="${1:-.}"
    
    find "$target_folder" -type f -iname "*.mp4" | sort -V | while read -r file; do
        # 使用 mediainfo 获取视频文件时长
        duration=$(mediainfo --Inform="Video;%Duration%" "$file")

        # 将毫秒数转换为 HH:MM:SS 格式
        duration_formatted=$(date -d "@$((duration/1000))" -u +'%H:%M:%S')
        filename=$(basename "$file")

        # 打印文件名和时长
        echo "$duration_formatted\t$filename"
    done
}

gltd() {
    target_folder="${1:-.}"
    gettd "$target_folder"
    # print a blank line
    echo

    # if gettd succeed, then listtd
    if [ $? -eq 0 ]; then
      listtd "$target_folder"
    fi
}
