//
//  SceneDelegate.m
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import "SceneDelegate.h"

#import "TMDBMoviesViewModel.h"
#import "ViewController.h"

@import Networking;

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
  UIWindowScene* windowScene = (UIWindowScene*)scene;
  self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
  
  ViewController* viewController = [[ViewController alloc] init];
  TMDBMoviesViewModel* viewModel = [[TMDBMoviesViewModel alloc] initWithService:getMovieSearchService()];
  
  viewController.viewModel = viewModel;
  viewModel.view = viewController;
  
  UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
  self.window.rootViewController = navigationController;
  [self.window makeKeyAndVisible];
}

@end
