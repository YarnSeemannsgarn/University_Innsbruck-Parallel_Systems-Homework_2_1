#include <stddef.h>
#include <stdio.h>
#include <time.h>

#include "common.h"

int main(int argc, char *argv[]){
  // Handle parameter
  if(argc != 2){
    fprintf(stderr, USAGE_MESSAGE, argv[0]);
    return EXIT_FAILURE;
  }
  size_t N = atoi(argv[1]);

  // Create matrix
  int **matrix = create_matrix(N, N);
  if(*matrix == NULL){
    fprintf(stderr, MEMORY_MESSAGE);
    return EXIT_FAILURE;
  }

  // Traverse matrix row wise
  int i, j;
  srand48(time(NULL));
  printf("Starting to traverse %zux%zu matrix row-wise\n", N, N);
  for(i=0; i<N; ++i){
    for(j=0; j<N; ++j){
      matrix[i][j] = lrand48() % RANGE_MAX;
    }
  }
  printf("Done\n");

  return EXIT_SUCCESS;
}
