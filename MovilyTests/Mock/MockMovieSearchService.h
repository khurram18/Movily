//
//  MockMovieSearchService.h
//  MovilyTests
//
//  Created by Khurram Shehzad on 25/09/2021.
//

#import <Foundation/Foundation.h>

@import Networking;

typedef enum : NSUInteger {
  MockMovieSearchServiceResponseTypeSuccess,
  MockMovieSearchServiceResponseTypeFailiure
} MockMovieSearchServiceResponseType;

NS_ASSUME_NONNULL_BEGIN

@interface MockMovieSearchService : NSObject <MovieSearchService>

@property MockMovieSearchServiceResponseType responseType;

@end

NS_ASSUME_NONNULL_END
