//
//  ImageService.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ImageLoadCompletion)(NSData* _Nullable data, NSError* _Nullable error);

@protocol ImageService <NSObject>
- (void)loadImageFrom:(NSURL*)url completion:(ImageLoadCompletion)completion;
@end

NS_ASSUME_NONNULL_END
