//
//  MockMovieSearchService.m
//  MovilyTests
//
//  Created by Khurram Shehzad on 25/09/2021.
//

#import "MockMovieSearchService.h"

@implementation MockMovieSearchService

- (void)search:(NSString* _Nonnull)text completion:(nonnull MoviesSearchCompletion)completion {
  __block NSArray* movies = nil;
  __block NSError* error = nil;
  switch (self.responseType) {
    case MockMovieSearchServiceResponseTypeSuccess:
      movies = @[[[MovieResponse alloc] init]];
      break;
    case MockMovieSearchServiceResponseTypeFailiure:
      error = [[NSError alloc] init];
      break;
  }
  dispatch_async(dispatch_get_main_queue(), ^{
    completion(movies, error);
  });
}

@end
