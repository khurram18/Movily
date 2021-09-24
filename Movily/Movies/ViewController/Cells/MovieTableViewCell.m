//
//  MovieTableViewCell.m
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

+(NSString*)identifier {
  return @"MovieTableViewCell";
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
