#include <stddef.h>
#include <stdlib.h>

#define RANGE_MAX 10000
#define USAGE_MESSAGE "Usage: %s <problem-size>\n"
#define MEMORY_MESSAGE "Not enough memory. Choose a smaller problem size!\n"

int **create_matrix(size_t M, size_t N){
  int *values = malloc(M * N * sizeof(int));
  int **rows = malloc(M * sizeof(int *));
  int i;
  for (i=0; i<M; ++i){
    rows[i] = values + i*N;
  }
  return rows;
}

void destroy_matrix(int **matrix){
  free(*matrix);
  free(matrix);
}
