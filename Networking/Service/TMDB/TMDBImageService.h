//
//  TMDBImageService.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import <Networking/ImageService.h>

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TMDBImageService : NSObject

@end

@interface TMDBImageService (ImageService)<ImageService>

@end

NS_ASSUME_NONNULL_END
