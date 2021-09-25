//
//  ResponseParser.m
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "ResponseParser.h"

#import "MovieResponse.h"

@implementation ResponseParser

+ (NSArray<MovieResponse*>*)parseSearchResponse:(NSData*)data {
  NSError* error;
  id dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
  NSArray* array = dictionary[@"results"];
  NSMutableArray* moviesArray = [[NSMutableArray alloc] initWithCapacity:array.count];
  for (NSDictionary* obj in array) {
    MovieResponse* movie = [[MovieResponse alloc] init];
    movie.imagePath = obj[@"poster_path"];
    movie.overview = obj[@"overview"];
    movie.title = obj[@"title"];
    [moviesArray addObject:movie];
  }
  return moviesArray;
}

@end
