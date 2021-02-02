## INFO

# user is already defined
host="$(hostname)"
os="$(cat /etc/redhat-release)"
kernel="$(uname -sr)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(sudo dnf list installed | sed '1d' | wc -l)"
shell="$(basename "${SHELL}")"

## DEFINE COLORS

# probably don't change these
if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

# you can change these
lc="${reset}${bold}${blue}"         # labels
nc="${reset}${bold}${blue}"         # user and hostname
ic="${reset}"                       # info
c0="${reset}${white}"               # first color
c1="${reset}${blue}"                # second color

## OUTPUT

cat <<EOF

${c1}               _ _           _     ${nc}${USER}${ic}@${nc}${host}${reset}
${c1}              | | |         | |    ${lc}OS:        ${ic}${os}${reset}
${c1}  _ __ ___  __| | |__   __ _| |_   ${lc}KERNEL:    ${ic}${kernel}${reset}
${c1} |  __/ _ \/ _  |  _ \ / _  | __|  ${lc}UPTIME:    ${ic}${uptime}${reset}
${c1} | | |  __/ (_| | | | | (_| | |_   ${lc}PACKAGES:  ${ic}${packages}${reset}
${c1} |_|  \___|\__,_|_| |_|\__,_|\__|  ${lc}SHELL:     ${ic}${shell}${reset}

EOF

