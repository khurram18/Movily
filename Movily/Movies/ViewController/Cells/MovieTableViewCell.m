//
//  MovieTableViewCell.m
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "MovieTableViewCell.h"

@import Networking;

@interface MovieTableViewCell () {
  UIImageView* movieImageView;
}

@end

@interface MovieTableViewCell (Private)
- (void)setupViews;
@end

@implementation MovieTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    [self setupViews];
  }
  return self;
}

+(NSString*)identifier {
  return @"MovieTableViewCell";
}

- (void)configure:(MovieResponse*)movie {
  self.textLabel.text = movie.title;
  [movieImageView loadImageFrom:movie.imageURL];
}

@end

@implementation MovieTableViewCell (Private)

- (void)setupViews {
  movieImageView = [[UIImageView alloc] init];
  movieImageView.translatesAutoresizingMaskIntoConstraints = NO;
  [self.contentView addSubview:movieImageView];
  
  [NSLayoutConstraint activateConstraints:@[
    [movieImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor]
  ]];
}

@end
