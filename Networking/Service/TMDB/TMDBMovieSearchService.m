//
//  TMDBMovieSearchService.m
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "TMDBMovieSearchService.h"

#import "Request.h"
#import "ResponseParser.h"

@interface TMDBMovieSearchService ()

@end

@implementation TMDBMovieSearchService

@end

@implementation TMDBMovieSearchService (MovieSearchService)

- (void)search:(NSString*)text completion:(MoviesSearchCompletion)completion {
  NSURLRequest* request = [Request searchRequestFrom:text];
  [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
    __block NSArray* moviesResponse = nil;
    __block NSError* errorResponse = nil;
    if (error != nil) {
      errorResponse = error;
    }
    else if (data == nil) {
      errorResponse = [[NSError alloc] initWithDomain:@"NetworkingErrorDomain" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Empty response from API"}];
    } else {
      moviesResponse = [ResponseParser parseSearchResponse:data];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
      completion(moviesResponse, errorResponse);
    });
  }] resume];
}

@end
