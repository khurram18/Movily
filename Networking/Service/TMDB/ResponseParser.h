//
//  ResponseParser.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import <Foundation/Foundation.h>

@class MovieResponse;

@interface ResponseParser : NSObject

+ (NSArray<MovieResponse*>* _Nullable )parseSearchResponse:(NSData* _Nonnull )data;

@end
