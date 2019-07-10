//
//  ExampleTableViewCell.m
//  Masonry
//
//  Created by Анастасия Шахлан on 01/06/2019.
//  Copyright © 2019 ASh. All rights reserved.
//

#import "ExampleTableViewCell.h"
#import "Masonry.h"

@interface ExampleTableViewCell()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;

@end

@implementation ExampleTableViewCell

-(instancetype)initWithStyle: (UITableViewCellStyle) style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = UIColor.redColor;
        [self.contentView addSubview:_titleLabel];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        _subTitleLabel = [UILabel new];
        _subTitleLabel.backgroundColor = UIColor.blueColor;
        [self.contentView addSubview:_subTitleLabel];
        _subTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self setupConstraints];
        
    }
    return self;
}

-(void)setupConstraints
{
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_top).with.offset(10);
                make.left.equalTo(self.mas_left).with.offset(50);
                make.right.equalTo(self.mas_right).with.offset(-50);
                make.height.equalTo(@(40));
    }];
    
    [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self -> _titleLabel.mas_bottom).with.offset(10);
        make.left.equalTo(self.mas_left).with.offset(40);
        make.bottom.equalTo(self.mas_bottom).with.offset(-10);
        make.right.equalTo(self.mas_right).with.offset(-40);
    }];
}

@end
