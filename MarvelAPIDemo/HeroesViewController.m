//
//  HeroesViewController.m
//  MarvelAPIDemo
//
//  Created by Miguel Martin Nieto on 07/07/14.
//  Copyright (c) 2014 Diego Freniche Brito. All rights reserved.
//

#import "HeroesViewController.h"
#import "SuperHeroParser.h"
#import "MarvelAPIHelper.h"
#import "ImageDownloader.h"


NSString *const publicKeyColl = @"bb8de9899e25561096de861a230919bf";
NSString *const privateKeyColl = @"80a1f8e47a66bbbd98b3b6f147e1f76d7daf5ded";

@interface HeroesViewController ()

@property (strong, nonatomic) NSArray *superHeroes;

@end

@implementation HeroesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MarvelAPIHelper *marvelApiHelper = [[MarvelAPIHelper alloc] initWithPublicKey:publicKeyColl andPrivateKey:privateKeyColl];
    [marvelApiHelper dataForSuperHeroesWithCompletion:^(NSData *resultData) {
        self.superHeroes = [SuperHeroParser superHeroesWithData:resultData];
        [self.collectionView reloadData];
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.superHeroes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"heroesCell" forIndexPath:indexPath];
    SuperHero *superHero = self.superHeroes[indexPath.row];
    [ImageDownloader downloadImageUsingUrl:superHero.thumbnail completion:^(UIImage *image) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
        [cell addSubview: imageView];
        imageView.image = image;
    }];

    return cell;
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
