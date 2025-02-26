TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = AppleReload

ARCHS = armv7

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = AppleReload

AppleReload_FILES = main.m XXAppDelegate.m XXRootViewController.m
AppleReload_FRAMEWORKS = UIKit CoreGraphics
AppleReload_CFLAGS = -fobjc-arc



include $(THEOS)/makefiles/application.mk
