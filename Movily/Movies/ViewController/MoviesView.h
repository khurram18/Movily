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
- (void)showLoading:(BOOL)loading;
- (void)showError:(NSString* _Nonnull)title message:(NSString* _Nonnull)message;

@end

#endif /* MoviesView_h */
