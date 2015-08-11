Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 37EEB76740
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:47:26 +0000 (UTC)
Received: by igui7 with SMTP id i7so43020067igu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QUHUMjNZ2D5HZSedJjnMokjVfDMQvSHi1hUGzXpX60M=;
	b=KbvYSzylP95fbTrwnamWijpm3OKUdSWZG01EgMArI5snuQtJVTUVCxsHrnbIbgVaf+
	6XL+Op+fcWX/w4aBnO7gFs0f9vp2lvzzHssvHUd4apHFWN6Zj/kOs7eCIn36Jyvbks78
	cpPTOiyV/32nN8dH4bCgZkshL7fxtJQBnprNp1LgTqBEN1vKX5lhakhwYUMDCLC/znLN
	MhxwpPnLQoW6KWf7FG8soLNKDNBrv1P5zpf2bdmWwb13Hlq7zMdE6SP0lnIxWH4ghqy0
	VPZCWkAdu4lXq9TE1CQUozNMAPYMiaM110eiSUhe2WJ1bzKHrSJSCEffCSYk6ynALhoY
	UWHw==
X-Received: by 10.50.30.105 with SMTP id r9mr19234129igh.11.1439308046167;
	Tue, 11 Aug 2015 08:47:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Tue, 11 Aug 2015 08:46:56 -0700 (PDT)
In-Reply-To: <55C9F7F2.2060502@linux.intel.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
	<55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Aug 2015 08:46:56 -0700
Message-ID: <CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Aug 2015 15:47:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 11, 2015 at 6:26 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 08/10/2015 10:15 PM, Philip Balister wrote:
>
>>> This is perfectly fine with me. However, the subject has been whether
>>> the scope of *oe-core/poky* can be expanded without compromising
>>
>>
>> What is Poky?
>
>
> Uhm... http://git.yoctoproject.org/cgit/cgit.cgi/poky/about/
>

can we freeze this thread please.

