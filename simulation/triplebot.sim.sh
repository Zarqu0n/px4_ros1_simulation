source /home/zarquon/Project/HP2-Falcon/devel/setup.bash;
server="bash start_server.sh"
source="source /home/zarquon/miniconda3/etc/profile.d/conda.sh;conda activate Noetic"
bot_y="rosrun telemetryapi bot_send.py";
bot_c="rosrun control bot.control.py";

bot_yc="gnome-terminal  --tab --title='BotTelem' -- bash -c '$source;$bot_y;exec bash'"
bot_cc="gnome-terminal  --tab --title='BotControl' -- bash -c '$source;$bot_c;exec bash'"
gnome-terminal  --tab --title="Server" sh -e "$server" --tab --title="BotTelem" -- bash -c "$source;$bot_cc;$bot_y;exec bash"