//
//  UIImageView+URL.m
//  Networking
//
//  Created by Khurram Shehzad on 25/09/2021.
//

#import "UIImageView+URL.h"

#import "TMDBImageService.h"

#import <Networking/Dependency.h>

@interface UIImageView (Private)

@property (class, readonly) id<ImageService> imageService;

@end

@implementation UIImageView (URL)

- (void)loadImageFrom:(NSURL*)url {
  __block __weak typeof(self) weakSelf = self;
  [UIImageView.imageService loadImageFrom:url completion:^(NSData* data, NSError* error __unused){
    if (data == nil) {
      return;
    }
    weakSelf.image = [[UIImage alloc] initWithData:data];
  }];
}

@end

@implementation UIImageView (Private)

+ (id<ImageService>)imageService {
  static id<ImageService> service = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    service = getImageService();
  });
  return service;
}

@end
