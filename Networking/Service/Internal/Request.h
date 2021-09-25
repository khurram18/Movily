//
//  Request.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Request : NSObject

+ (NSURLRequest*)searchRequestFrom:(NSString*)text;
+ (NSURL*)imageURLWithPath:(NSString*)path;
@end

NS_ASSUME_NONNULL_END
