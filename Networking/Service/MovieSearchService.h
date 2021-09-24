//
//  MovieSearchService.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#ifndef MovieSearchService_h
#define MovieSearchService_h

@import Foundation;

@protocol MovieSearchService <NSObject>

- (void)search:(NSString*)text;

@end

#endif /* MovieSearchService_h */
