//
//  ViewController.h
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "MoviesView.h"

#import <UIKit/UIKit.h>

@protocol MoviesViewModel;

@interface ViewController : UIViewController

@property (nonatomic) id<MoviesViewModel> viewModel;

@end

@interface ViewController (MoviesView) <MoviesView>

@end
