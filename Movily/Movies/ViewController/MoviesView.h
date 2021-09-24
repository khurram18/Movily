//
//  MoviesView.h
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#ifndef MoviesView_h
#define MoviesView_h

@import Foundation;

@class MovieResponse;

@protocol MoviesView <NSObject>

- (void)showMovies:(NSArray<MovieResponse*>* _Nonnull)movies;

@end

#endif /* MoviesView_h */
