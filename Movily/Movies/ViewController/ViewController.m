//
//  ViewController.m
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "ViewController.h"

#import "MoviesViewModel.h"

@interface ViewController () {
  
}

@end

@implementation ViewController

- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewDidLoad {
  [super viewDidLoad];
  [self.viewModel search:@"machine"];
}

@end

@implementation ViewController (MoviesView)

- (void)showMovies:(NSArray<MovieResponse*>* _Nonnull)movies {
  
}

@end
