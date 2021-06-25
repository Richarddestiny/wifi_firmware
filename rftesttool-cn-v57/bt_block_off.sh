#!/system/bin/sh
for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
do
    path_type="/sys/class/rfkill/rfkill$i/type"
    path_state="/sys/class/rfkill/rfkill$i/state"
    type="$(cat $path_type)"
    state="$(cat $path_state)"
    if [ "$type" = "bluetooth" -a "$state" = "0" ]; then
        echo "Enable other bluetooth type rfkkill..."
        echo 1 > $path_state
    fi
done
