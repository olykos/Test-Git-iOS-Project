//
//  Factory.h
//  Pirates
//
//  Created by Orestis Lykouropoulos on 12/2/14.
//
//

#import <Foundation/Foundation.h>
#import "Character.h"
#import "Boss.h"

@interface Factory : NSObject

-(NSArray *)tiles;

-(Character *)character;

-(Boss *) boss;

@end
