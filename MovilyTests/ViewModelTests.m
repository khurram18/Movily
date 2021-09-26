//
//  ViewModelTests.m
//  MovilyTests
//
//  Created by Khurram Shehzad on 25/09/2021.
//

#import "TMDBMoviesViewModel.h"
#import "MoviesView.h"
#import "MockMovieSearchService.h"

#import <XCTest/XCTest.h>

@import Networking;

typedef enum : NSUInteger {
  MockViewExpectationFulfillTypeShowMovies,
  MockViewExpectationFulfillTypeLoading,
  MockViewExpectationFulfillTypeError,
} MockViewExpectationFulfillType;

@interface MockView : NSObject <MoviesView>
@property MockViewExpectationFulfillType expectationFulfillType;
@property XCTestExpectation* expectation;
@end

@interface ViewModelTests : XCTestCase

@property MockMovieSearchService* movieSearchService;
@property MockView* view;
@property TMDBMoviesViewModel* viewModel;

@end

@implementation ViewModelTests

- (void)setUp {
  self.view = [[MockView alloc] init];
  self.movieSearchService = [[MockMovieSearchService alloc] init];
  self.viewModel = [[TMDBMoviesViewModel alloc] initWithService:self.movieSearchService];
  self.viewModel.view = self.view;
}

- (void)testSuccess {
  self.movieSearchService.responseType = MockMovieSearchServiceResponseTypeSuccess;
  self.view.expectationFulfillType = MockViewExpectationFulfillTypeShowMovies;
  XCTestExpectation* expectation = [self expectationWithDescription:@"testSuccess"];
  self.view.expectation = expectation;
  [self.viewModel search:@"abc"];
  [self waitForExpectations:@[expectation] timeout:2];
}

- (void)testFailure {
  self.movieSearchService.responseType = MockMovieSearchServiceResponseTypeFailiure;
  self.view.expectationFulfillType = MockViewExpectationFulfillTypeError;
  XCTestExpectation* expectation = [self expectationWithDescription:@"testFailure"];
  self.view.expectation = expectation;
  [self.viewModel search:@"abc"];
  [self waitForExpectations:@[expectation] timeout:2];
}

- (void)testLoading {
  self.movieSearchService.responseType = MockMovieSearchServiceResponseTypeSuccess;
  self.view.expectationFulfillType = MockViewExpectationFulfillTypeLoading;
  XCTestExpectation* expectation = [self expectationWithDescription:@"testLoading"];
  expectation.expectedFulfillmentCount = 2;
  self.view.expectation = expectation;
  [self.viewModel search:@"abc"];
  [self waitForExpectations:@[expectation] timeout:2];
}
@end

@implementation MockView

- (void)showMovies:(NSArray<MovieResponse*>* _Nonnull)movies {
  if (self.expectationFulfillType == MockViewExpectationFulfillTypeShowMovies) {
    [self.expectation fulfill];
  }
}

- (void)showLoading:(BOOL)loading {
  if (self.expectationFulfillType == MockViewExpectationFulfillTypeLoading) {
    [self.expectation fulfill];
  }
}

- (void)showError:(NSString* _Nonnull)title message:(NSString* _Nonnull)message {
  if (self.expectationFulfillType == MockViewExpectationFulfillTypeError) {
    [self.expectation fulfill];
  }
}

@end
