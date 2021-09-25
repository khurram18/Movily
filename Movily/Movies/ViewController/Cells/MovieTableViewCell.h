//
//  MovieTableViewCell.h
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import <UIKit/UIKit.h>

@class MovieResponse;

NS_ASSUME_NONNULL_BEGIN

@interface MovieTableViewCell : UITableViewCell

@property (class, readonly) NSString* identifier;

- (void)configure:(MovieResponse*)movie;

@end

NS_ASSUME_NONNULL_END
