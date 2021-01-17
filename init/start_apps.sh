# todo: install then open
START_APPS=(
    '1password',
    'bartender',
    'docker',
    'istat-menus',
    'pastebot',
    'spotify',
)
echo $START_APPS | xargs -l bash -c 'open -a :$1' | xargs