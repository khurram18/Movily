//
//  MovieResponse.m
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "MovieResponse.h"

#import "Request.h"

@implementation MovieResponse

-(NSURL*)imageURL {
  if (!self.imagePath || [self.imagePath isEqual:NSNull.null]) {
    return nil;
  }
  return [Request imageURLWithPath:self.imagePath];
}

@end
