//
//  Dependency.m
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "Dependency.h"

#import "TMDBMovieSearchService.h"

id<MovieSearchService>getMovieSearchService(void) {
  return [[TMDBMovieSearchService alloc] init];
}
