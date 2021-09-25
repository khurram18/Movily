//
//  Dependency.m
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "Dependency.h"

#import "TMDBImageService.h"
#import "TMDBMovieSearchService.h"

id<MovieSearchService>getMovieSearchService(void) {
  return [[TMDBMovieSearchService alloc] init];
}

id<ImageService>getImageService(void) {
  return [[TMDBImageService alloc] init];
}
