//
//  Request.m
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "Request.h"

static NSString* kBaseURLString = @"https://api.themoviedb.org/3/";
static NSString* kSearchPath = @"search/movie";
static NSString* kApiKeyQueryName = @"api_key";
static NSString* kApiKey = @"c7965534db621cfb79fcc14cde27bdfd";
static NSString* kSearchQueryName = @"query";


@interface Request ()

@property (class, nonnull, readonly) Request* instance;
@property (readonly, nonnull) NSURL* baseURL;
- (NSURLRequest*)searchRequestFrom:(NSString*)text;

@end

@implementation Request

+ (Request*)instance {
  static Request* sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[Request alloc] init];
  });
  return sharedInstance;
}
+ (NSURLRequest*)searchRequestFrom:(NSString*)text {
  return [[Request instance] searchRequestFrom:text];
}
- (NSURL*)baseURL {
  return [[NSURL alloc] initWithString:kBaseURLString];
}
- (NSURLRequest*)searchRequestFrom:(NSString*)text {
  NSURL* url = [self.baseURL URLByAppendingPathComponent:kSearchPath];
  NSURLComponents* components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
  components.queryItems = @[
    [[NSURLQueryItem alloc] initWithName:kApiKeyQueryName value:kApiKey],
    [[NSURLQueryItem alloc] initWithName:kSearchQueryName value:text]
  ];
  return [[NSURLRequest alloc] initWithURL:components.URL];
}
@end
