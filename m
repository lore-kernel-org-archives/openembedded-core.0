Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <97b16a070ca838dfe87ae579edf36c0e01d01175.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.13.rc1)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Dec 2021 14:19:03 +0000
In-Reply-To: <CANPvuRkqyngQAqhqfou9ka7J3oufuSCubf9J7cgZ-ZU9KLTJjg@mail.gmail.com>
References: 
	<99e75b930d85e240c51074406b0cd896c93257cb.camel@linuxfoundation.org>
	 <DM5PR1101MB23482FA91A07CA4057E768D9BB7C9@DM5PR1101MB2348.namprd11.prod.outlook.com>
	 <CANPvuRkqyngQAqhqfou9ka7J3oufuSCubf9J7cgZ-ZU9KLTJjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, "Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Cc: "qa-build-notification@lists.yoctoproject.org" <qa-build-notification@lists.yoctoproject.org>, "<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core <openembedded-core@lists.openembedded.org>

On Tue, 2021-12-21 at 11:15 +0000, Jose Quaresma wrote:
> 
> 
> Teoh, Jay Shen <jay.shen.teoh@intel.com> escreveu no dia terça, 21/12/2021
> à(s) 07:46:
> > Hi all,
> > 
> > This is the full report for yocto-3.1.13.rc1:  
> > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> > 
> > ======= Summary ========
> > No high milestone defects. 
> > 
> > new issue found 
> > 
> > Bug 14669 - [QA 3.1.13 RC1] failure in ptest :gstreamer1.0.gstreamer-
> > 1.0/pipelines_seek.test
> > 
> > 
> > ======= Bugs ========
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14669
> > 
> 
> 
> This patch is a bug fix 14669
> https://lists.openembedded.org/g/openembedded-core/message/159911
>  

Great, thanks!

I assume we don't need that in the version on master as it is already present?

Cheers,

Richard

