//
//  EMMDownLoadButton.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/13.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMDownLoadButton.h"
#import "PKDownloadButton.h"
#import "PKDownloaderSimulator.h"

@interface EMMDownLoadButton()<PKDownloadButtonDelegate, PKDownloaderSimulatorDelegate>
@property (weak, nonatomic) IBOutlet PKDownloadButton *downloadButton;
@property (nonatomic, strong) PKDownloaderSimulator *downloaderSimulator;
@property (nonatomic, strong) PKDownloaderSimulator *pendingSimulator;
@end

@implementation EMMDownLoadButton

+ (instancetype)show{
    return [[[NSBundle mainBundle] loadNibNamed:@"EMMDownLoadButton" owner:nil options:nil] lastObject];
}

- (void)layoutSubviews{
    self.downloaderSimulator = [[PKDownloaderSimulator alloc] initWithProgressInterval:0.1];
    self.downloaderSimulator.delegate = self;
    self.pendingSimulator = [[PKDownloaderSimulator alloc] initWithProgressInterval:0.05];
    self.pendingSimulator.delegate = self;
}

#pragma mark - PKDownloadButtonDelegate

- (void)downloadButtonTapped:(PKDownloadButton *)downloadButton
                currentState:(PKDownloadButtonState)state {
    switch (state) {
        case kPKDownloadButtonState_StartDownload:
            self.downloadButton.state = kPKDownloadButtonState_Pending;
            [self.pendingSimulator startDownload];
            break;
        case kPKDownloadButtonState_Pending:
            [self.pendingSimulator cancelDownload];
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            break;
        case kPKDownloadButtonState_Downloading:
            [self.downloaderSimulator cancelDownload];
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            break;
        case kPKDownloadButtonState_Downloaded:
            self.downloadButton.state = kPKDownloadButtonState_StartDownload;
            break;
        default:
            NSAssert(NO, @"unsupported state");
            break;
    }
}

#pragma mark - DownloaderSimulatorDelegate

- (void)simulator:(PKDownloaderSimulator *)simulator didUpdateProgress:(double)progress {
    if (simulator == self.pendingSimulator) {
        if (progress == 1.) {
            // 开始下载
            self.downloadButton.state = kPKDownloadButtonState_Downloading;
            [self.downloaderSimulator startDownload];
        }
    }
    else if (simulator == self.downloaderSimulator) {
        self.downloadButton.stopDownloadButton.progress = progress;
        if (progress == 1) {
            self.downloadButton.state = kPKDownloadButtonState_Downloaded;
        }
    }
}

@end
