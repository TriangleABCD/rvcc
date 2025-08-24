CC := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -O2 -fno-common -g

NAME := rvcc

$(NAME): main.o
	$(CC) $(CXXFLAGS) -o $(NAME) main.o

test: $(NAME)
	./test.sh

clean:
	rm -f $(NAME) tmp* *.o *.out


.PHONY: clean test
