//
//  MovieSearchService.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#ifndef MovieSearchService_h
#define MovieSearchService_h

@import Foundation;
@class MovieResponse;

typedef void(^MoviesSearchCompletion)(NSArray<MovieResponse*>* _Nullable movies, NSError* _Nullable error);

@import Foundation;

@protocol MovieSearchService <NSObject>

- (void)search:(NSString* _Nonnull)text completion:(nonnull MoviesSearchCompletion)completion;

@end

#endif /* MovieSearchService_h */
