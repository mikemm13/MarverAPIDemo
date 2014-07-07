//
//  SuperHeroViewController.m
//  MarvelAPIDemo
//
//  Created by Miguel Martin Nieto on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "SuperHeroViewController.h"
#import "SuperHero.h"
#import "SuperHeroParser.h"
#import "MarvelAPIHelper.h"
#import "ImageDownloader.h"


NSString *const publicKey = @"bb8de9899e25561096de861a230919bf";
NSString *const privateKey = @"80a1f8e47a66bbbd98b3b6f147e1f76d7daf5ded";

@interface SuperHeroViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *superHeroImage;
@property (weak, nonatomic) IBOutlet UITextField *superHeroName;
@property (weak, nonatomic) IBOutlet UITextView *superHeroDescription;

@end

@implementation SuperHeroViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapImage)];
    [self.superHeroImage addGestureRecognizer:tapGesture];
}

- (void) onTapImage {
    
    NSString *name = self.superHeroName.text;
    MarvelAPIHelper *marvelApiHelper = [[MarvelAPIHelper alloc] initWithPublicKey:publicKey andPrivateKey:privateKey];
    [marvelApiHelper dataForSuperHeroNamed:name completion:^(NSData *resultData) {
        SuperHero *superHero = [SuperHeroParser superHeroWithData:resultData];
        
        [ImageDownloader downloadImageUsingUrl:superHero.thumbnail completion:^(UIImage *image) {
            self.superHeroImage.image = image;
        }];
        [self showDescription:superHero.characterDescription];
        [self.superHeroName resignFirstResponder];
    }];
}

- (void) showDescription:(NSString *) description{
    [UIView animateWithDuration:2 animations:^{
        self.superHeroDescription.text = description;
        self.superHeroDescription.center = CGPointMake(self.view.center.x, self.view.center.y);
    } completion:nil];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
