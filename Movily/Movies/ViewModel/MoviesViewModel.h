//
//  MoviesViewModel.h
//  Movily
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#ifndef MoviesViewModel_h
#define MoviesViewModel_h

@import Foundation;

@protocol MoviesViewModel <NSObject>

- (void)search:(NSString* _Nonnull)text;

@end

#endif /* MoviesViewModel_h */
