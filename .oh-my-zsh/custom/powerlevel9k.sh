# powerlevel9k tonylambiris powerlevel9k themes

powerlevel9k_random_color(){
	local code
	#for code ({000..255}) echo -n "$%F{$code}"
	#code=$[${RANDOM}%11+10]    # random between 10-20
	code=$[${RANDOM}%211+20]    # random between 20-230
	printf "%03d" $code
}

zsh_wifi_signal(){
    local signal=$(nmcli -t device wifi | grep '^*' | awk -F':' '{print $6}')
    local color="yellow"
    [[ $signal -gt 75 ]] && color="green"
    [[ $signal -lt 50 ]] && color="red"
    echo -n "%F{$color}$signal \uf1eb" # \uf1eb is 
}

if [ "$ZSH_THEME" = "powerlevel9k/powerlevel9k" ]; then
	# General config
	POWERLEVEL9K_MODE='nerdfont-complete'
	POWERLEVEL9K_INSTALLATION_PATH=$ZSH/custom/themes/powerlevel9k
	POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"

	# Prompts
	# system: background_jobs battery context date dir dir_writable disk_usage history host ip vpn_ip public_ip load os_icon ram root_indicator status swap time user vi_mode ssh 
	# extesino: vcs aws kubecontext custom_command command_execution_time detect_virt newline
	# for demo:
	# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user host dir_writable dir virtualenv vcs)
	# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time history root_indicator ip custom_wifi_signal battery disk_usage ram swap load background_jobs time)

	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
	  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ssh context dir virtualenv vcs)
	else
	  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir_writable dir virtualenv vcs)
	fi
	POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time root_indicator ip background_jobs time)
	POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
	POWERLEVEL9K_SHORTEN_DELIMITER=..
	POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B4'
	POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B6'
	POWERLEVEL9K_PROMPT_ON_NEWLINE=true
	POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
	# POWERLEVEL9K_DISABLE_RPROMPT=true
	POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
	POWERLEVEL9K_PROMPT_ADD_NEWLINE_COUNT=1
	POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
	POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰\uF460\uF460\uF460 "

	# Colors
	POWERLEVEL9K_VIRTUALENV_BACKGROUND=107
	POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
	POWERLEVEL9K_OS_ICON_BACKGROUND='white'
	POWERLEVEL9K_OS_ICON_FOREGROUND='black'
	POWERLEVEL9K_TIME_BACKGROUND='white'
	POWERLEVEL9K_TIME_FOREGROUND='black'
	# POWERLEVEL9K_COLOR_SCHEME='light'

	# Battery colors
	POWERLEVEL9K_BATTERY_CHARGING='107'
	POWERLEVEL9K_BATTERY_CHARGED='blue'
	POWERLEVEL9K_BATTERY_LOW_THRESHOLD='50'
	POWERLEVEL9K_BATTERY_LOW_COLOR='red'
	POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND='blue'
	POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='white'
	POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND='107'
	POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='white'
	POWERLEVEL9K_BATTERY_LOW_BACKGROUND='red'
	POWERLEVEL9K_BATTERY_LOW_FOREGROUND='white'
	POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='white'
	POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND='214'

	# VCS colors
	POWERLEVEL9K_VCS_CLEAN_FOREGROUND='cyan'
	POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
	POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='white'
	POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'
	POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
	POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'

fi


