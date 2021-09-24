//
//  TMDBMovieSearchService.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "MovieSearchService.h"

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface TMDBMovieSearchService : NSObject

@end

@interface TMDBMovieSearchService (MovieSearchService)<MovieSearchService>

@end

NS_ASSUME_NONNULL_END
