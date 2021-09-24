//
//  MovieResponse.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieResponse : NSObject

@property (nonatomic, nullable) NSString* title;
@property (nonatomic, nullable) NSString* overview;
@property (nonatomic, nullable) NSString* imagePath;

@end

NS_ASSUME_NONNULL_END
