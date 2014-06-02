// PHYConstantsAndMacros.h
//
// Copyright (c) 2014 Phyre Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>



#pragma mark - Compiler Attributes

#define PHY_UNAVAILABLE(_msg_) __attribute__((unavailable(_msg_)))



#pragma mark - Hashing

#define NSUINT_BIT (CHAR_BIT * sizeof(NSUInteger))
#define NSUINTROTATE(val, howmuch) ((((NSUInteger)val) << howmuch) | (((NSUInteger)val) >> (NSUINT_BIT - howmuch)))



#pragma mark - Blocks

#define PHYBlockCall(_block_, ...) \
	do { \
		if (_block_) { \
			_block_(__VA_ARGS__); \
		} \
	} while(0)

#define PHYWeakRef(_type_, _weak_ref_)		__weak typeof(_type_) _weak_ref_ = _type_
#define PHYStrongRef(_type_, _strong_ref_)	__strong typeof(_type_) _strong_ref_ = _type_

#define PHYWeakSelf(_weak_self_)			PHYWeakRef(self, _weak_self_)
#define PHYStrongSelf(_strong_self_)		PHYStrongRef(self, _strong_self_)

void phy_dispatch_sync_on_main_queue(void (^block)(void));



#pragma mark - Colors

#define UIColorFromRGB(_rgbValue_) [UIColor \
	colorWithRed:((float)(((_rgbValue_) & 0xFF0000) >> 16))/255.0 \
	green:((float)(((_rgbValue_) & 0xFF00) >> 8))/255.0 \
	blue:((float)((_rgbValue_) & 0xFF))/255.0 alpha:1.0]

#define UIColorFromRGBA(_rgbValue_, _alpha_) [UIColor \
	colorWithRed:((float)(((_rgbValue_) & 0xFF0000) >> 16))/255.0 \
	green:((float)(((_rgbValue_) & 0xFF00) >> 8))/255.0 \
	blue:((float)((_rgbValue_) & 0xFF))/255.0 alpha:(_alpha_)]



#pragma mark - Animation

#define UIVIEW_ANIMATION_DURATION(_animated_, _duration_) ((_animated_) ? (_duration_) : 0.0f)



#pragma mark - KVO

/**
 Credit: kyleve on Github (https://gist.github.com/kyleve/8213806)
 */
#define PHYKeyPath(object, keyPath)				({ if (NO) { (void)((object).keyPath); } @#keyPath; })
#define PHYSelfKeyPath(keyPath)					PHYKeyPath(self, keyPath)
#define PHYTypedKeyPath(ObjectClass, keyPath)	PHYKeyPath(((ObjectClass *)nil), keyPath)
#define PHYProtocolKeyPath(Protocol, keyPath)	PHYKeyPath(((id <Protocol>)nil), keyPath)



#pragma mark - Misc

#define DELTA_UPDATE(_receiver_, _val_)							(((_receiver_) != (_val_)) ? ((_receiver_ = (_val_)), YES) : NO)
#define TRACKED_DELTA_UPDATE(_receiver_, _val_, _flag_)			(_flag_ = (DELTA_UPDATE((_receiver_), (_val_)) ? YES : (_flag_)))

#define DELTA_OBJ_UPDATE(_receiver_, _val_)						((((_receiver_) || (_val_)) && (![(_receiver_) isEqual:(_val_)])) ? ((_receiver_ = (_val_)), YES) : NO)
#define TRACKED_DELTA_OBJ_UPDATE(_receiver_, _val_, _flag_)		(_flag_ = (DELTA_OBJ_UPDATE((_receiver_), (_val_)) ? YES : (_flag_)))

#define DELTA_KEYPATH_UPDATE(_receiver_, _source_, _keyPath_) \
	do { \
		NSString *_str_keyPath_ = (@"" #_keyPath_); \
		id _val_ = [_source_ valueForKeyPath:(_str_keyPath_)]; \
		if (!_val_) \
			\
		else if (![[_receiver_ valueForKeyPath:(_str_keyPath_)] isEqual:(_val_)]) \
			[_receiver_ setValue:(_val_) forKeyPath:(_str_keyPath_)]; \
	} while (NO);
