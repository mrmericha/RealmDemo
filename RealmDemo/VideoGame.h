//
//  VideoGame.h
//  RealmDemo
//
//  Created by Patrick Adams on 11/18/14.
//  Copyright (c) 2014 Patrick Adams. All rights reserved.
//

#import <Realm/Realm.h>

@interface VideoGame : RLMObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, strong) NSString *genre;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<VideoGame>
RLM_ARRAY_TYPE(VideoGame)
