# replace word 'rabbit' with word 'wabbit' in all xml files

find . -name '*xml' -exec bash -c ' mv $0 ${0/\rabbit/wabbit}' {} \;

