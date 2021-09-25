//
//  UIImageView+URL.h
//  Networking
//
//  Created by Khurram Shehzad on 25/09/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (URL)
- (void)loadImageFrom:(NSURL*)url;
@end

NS_ASSUME_NONNULL_END
