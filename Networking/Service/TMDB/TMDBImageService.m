//
//  TMDBImageService.m
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "TMDBImageService.h"

@implementation TMDBImageService

@end

@implementation TMDBImageService (ImageService)

- (void)loadImageFrom:(nonnull NSURL *)url completion:(nonnull ImageLoadCompletion)completion {
  [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData* data, NSURLResponse* response __unused, NSError* error){
    __block NSData* responseData = data;
    __block NSError* responseError = error;
    dispatch_async(dispatch_get_main_queue(), ^{
      completion(responseData, responseError);
    });
  }] resume];
}

@end
