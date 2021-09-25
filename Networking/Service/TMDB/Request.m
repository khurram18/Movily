//
//  Request.m
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "Request.h"

static NSString* kBaseURLString = @"https://api.themoviedb.org/3/";
static NSString* kImageBaseURLString = @"https://image.tmdb.org/t/p/w500/";
static NSString* kSearchPath = @"search/movie";
static NSString* kApiKeyQueryName = @"api_key";
static NSString* kApiKey = @"c7965534db621cfb79fcc14cde27bdfd";
static NSString* kSearchQueryName = @"query";


@interface Request ()

@property (class, nonnull, readonly) Request* instance;
@property (nonnull) NSURL* baseURL;
@property (nonnull) NSURL* baseImageURL;
- (NSURLRequest*)searchRequestFrom:(NSString*)text;
- (NSURL*)imageURLWithPath:(NSString*)path;
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
+ (NSURL*)imageURLWithPath:(NSString*)path {
  return [[Request instance] imageURLWithPath:path];
}
+ (NSURLRequest*)searchRequestFrom:(NSString*)text {
  return [[Request instance] searchRequestFrom:text];
}
- (instancetype)init {
  if (self = [super init]) {
    self.baseURL = [[NSURL alloc] initWithString:kBaseURLString];
    self.baseImageURL = [[NSURL alloc] initWithString:kImageBaseURLString];
  }
  return self;
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
- (NSURL*)imageURLWithPath:(NSString*)path {
  return [self.baseImageURL URLByAppendingPathComponent:path];
}
@end
