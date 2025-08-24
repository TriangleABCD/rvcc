#include <cstdio>
#include <cstdlib>

int main(int argc, char ** argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <number>\n", argv[0]);
    return 1;
  }

  char * P = argv[1];

  printf("  .globl main\n");
  printf("main:\n");

  printf("  li a0, %ld\n", strtol(P, &P, 10));

  while (*P) {
    if (*P == '+') {
      ++P;
      printf("  addi a0, a0, %ld\n", strtol(P, &P, 10));
      continue;
    }

    if (*P == '-') {
      ++P;
      printf("  addi a0, a0, -%ld\n", strtol(P, &P, 10));
      continue;
    }
    
    fprintf(stderr, "Invalid character : %c\n", *P);
    return 1;
  }

  printf("  ret\n");

  return 0;
}
