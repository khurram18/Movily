//
//  MovieTableViewCell.m
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "MovieTableViewCell.h"

@import Networking;

@interface MovieTableViewCell () {
  UIView* containerView;
  UIImageView* movieImageView;
  UILabel* titleLabel;
  UILabel* detailsLabel;
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
  [movieImageView loadImageFrom:movie.imageURL];
  titleLabel.text = movie.title;
  detailsLabel.text = movie.overview;
}

@end

@implementation MovieTableViewCell (Private)

- (void)setupViews {
  
  containerView = [[UIView alloc] init];
  movieImageView = [[UIImageView alloc] init];
  titleLabel = [[UILabel alloc] init];
  detailsLabel = [[UILabel alloc] init];
  
  UIStackView* labelsContainerView = [[UIStackView alloc] init];
  labelsContainerView.axis = UILayoutConstraintAxisVertical;
  
  for (UIView* view in @[containerView, movieImageView, labelsContainerView, titleLabel, detailsLabel]) {
    view.translatesAutoresizingMaskIntoConstraints = NO;
  }
  
  movieImageView.clipsToBounds = YES;
  movieImageView.layer.cornerRadius = 20;
  
  titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline compatibleWithTraitCollection:nil];
  titleLabel.textColor = [UIColor blackColor];
  titleLabel.textAlignment = NSTextAlignmentCenter;
  
  detailsLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline compatibleWithTraitCollection:nil];
  detailsLabel.textColor = [UIColor blackColor];
  detailsLabel.textAlignment = NSTextAlignmentJustified;
  detailsLabel.numberOfLines = 0;
  
  [self.contentView addSubview:containerView];
  [containerView addSubview:movieImageView];
  [containerView addSubview:labelsContainerView];
  [labelsContainerView addArrangedSubview:titleLabel];
  [labelsContainerView addArrangedSubview:detailsLabel];
  
  [NSLayoutConstraint activateConstraints:@[
    [movieImageView.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor],
    [movieImageView.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor],
    [movieImageView.topAnchor constraintEqualToAnchor:containerView.topAnchor],
    [movieImageView.heightAnchor constraintEqualToConstant:500],
    [labelsContainerView.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor],
    [labelsContainerView.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor],
    [labelsContainerView.topAnchor constraintEqualToAnchor:movieImageView.bottomAnchor constant:8],
    [labelsContainerView.bottomAnchor constraintEqualToAnchor:containerView.bottomAnchor],
    [containerView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
    [containerView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
    [containerView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8],
    [containerView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8]
  ]];
}

@end
