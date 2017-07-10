#!/usr/bin/zsh

# check if already exist one
if [ -e Makefile ] ; then
	echo 'Do you want to replace current Makefile?'
	select yn in "Yes" "No"; do
		case $yn in
			Yes ) break;;
			No ) exit;;
		esac
	done
fi

echo 'CXX = g++' > Makefile
echo 'CXXFLAGS = -std=c++14 -Wall -g -MMD' >> Makefile
echo 'EXEC = myprogram' >> Makefile
echo -n 'OBJECTS = ' >> Makefile

# if main.cc used in program
if [ ${#} -eq 0 -o "${1}" != "-m" ] ; then
	echo -n 'main.o' >> Makefile
else
	shift
fi
# convert arguments to object file
for i ; do
	echo -n " $i.o" >> Makefile
done

echo '' >> Makefile
echo 'DEPENDS = ${OBJECTS:.o=.d}' >> Makefile
echo '' >> Makefile
echo '${EXEC}: ${OBJECTS}' >> Makefile
echo '\t${CXX} ${CXXFLAGS} ${OBJECTS} -o ${EXEC}' >> Makefile
echo '' >> Makefile
echo '-include ${DEPENDS}' >> Makefile
echo '' >> Makefile
echo '.PHONY: clean' >> Makefile
echo '' >> Makefile
echo 'clean:' >> Makefile
echo '\trm ${OBJECTS} ${EXEC} ${DEPENDS}' >> Makefile
