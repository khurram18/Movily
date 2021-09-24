//
//  TMDBMoviesViewModel.h
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "MoviesViewModel.h"

#import <Foundation/Foundation.h>

@protocol MovieSearchService;
@protocol MoviesView;

NS_ASSUME_NONNULL_BEGIN

@interface TMDBMoviesViewModel : NSObject

-(instancetype)initWithService:(id<MovieSearchService>)movieSearchService;
@property (nonatomic, weak) id<MoviesView> view;

@end

@interface TMDBMoviesViewModel (MoviesViewModel)<MoviesViewModel>

@end

NS_ASSUME_NONNULL_END
