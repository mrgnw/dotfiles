# todo: install then open
START_APPS=(
	'1password',
	'bartender',
	'docker',
	'istat-menus',
	'pastebot',
	'spotify',
)
open_casks() {
	sudo find /usr/local/Caskroom -iname *.app | awk -F'/' '{print $5, $7}' |
		args -l bash -c 'open -a :$1' | xargs
}
echo $START_APPS | xargs -l bash -c 'open -a :$1' | xargs
