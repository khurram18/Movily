//
//  Dependency.h
//  Networking
//
//  Created by Khurram Shehzad on 24/09/2021.
//

#import <Networking/MovieSearchService.h>
#import <Networking/ImageService.h>

#import <Foundation/Foundation.h>

id<MovieSearchService>getMovieSearchService(void);
id<ImageService>getImageService(void);
