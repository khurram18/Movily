//
//  TMDBMoviesViewModel.m
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "TMDBMoviesViewModel.h"

#import "MoviesView.h"

@import Networking;

@interface TMDBMoviesViewModel ()

@property (nonatomic) id<MovieSearchService> movieSearchService;

@end

@implementation TMDBMoviesViewModel

-(instancetype)initWithService:(id<MovieSearchService>)searchService {
  if (self = [super init]) {
    self.movieSearchService = searchService;
  }
  return self;
}

@end

@implementation TMDBMoviesViewModel (MoviesViewModel)

- (void)search:(NSString*)text {
  __block __weak typeof(self) weakSelf = self;
  [self.view showLoading:YES];
  [self.movieSearchService search:text completion:^(NSArray<MovieResponse*>* movies, NSError* error){
    [weakSelf.view showLoading:NO];
    if (error == nil) {
      [weakSelf.view showMovies:movies];
    } else {
      [weakSelf.view showError:@"An error occurred" message:@"Please try again"];
    }
  }];
}

@end
