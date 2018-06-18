name=$(echo $1 | cut -d "." -f1)
g++ -std=c++14 -c "$name"".cpp" 
g++ -std=c++14 "$name"".o" -o sfml-app -lsfml-graphics -lsfml-window -lsfml-system 2>>.errSfml

if [ "$(wc -l .errSfml)" = "0 .errSfml" ] ; then
	./sfml-app
	rm *.o
fi

rm .errSfml
