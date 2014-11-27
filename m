Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id D10D8723A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 18:05:08 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id hy4so2354639vcb.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 10:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4lsEtC1NrQTmc8kjjDMUxUZKFngfgoelzL0CM2jOMuw=;
	b=MqGRTnrSXF07mIwY/QItuLD+VMrJYZH78Yu4N1Tqw594G/cadOCTMJ95ufaEVJ2SgJ
	FQKArH4r+o/d2110RWzZWPZe2S19ytfDk6588caXWJRtTwaB5p9ixkQ5EoMqvqJYH8le
	w9KEqiIIg0qmFdGlMPl9ErNRXTS+hOQFhDrH/sAlJA9sdIvMv1yWbgsoWg/uvv8+o8MR
	GDudcNq5X02R1JGX1HG2Rtel22oZaBLImFFa1TkBrTh39tb3VmETsjULQKtaQbpAekHZ
	x59ZudzUFpc4pIDXyokiyrDUGpoMx7KRyZ6rzecX8Y75BTxrbHrK2C9FEyJr01+Dfptq
	AjiA==
X-Gm-Message-State: ALoCoQlc2tsdUgbiUo62FsHPfSTNFkpUxJ7Y0ea4IYPJ8A5yxU4SQUtcdmrU2BbX0lLpELdVSRmP
MIME-Version: 1.0
X-Received: by 10.52.243.41 with SMTP id wv9mr17746428vdc.20.1417111508807;
	Thu, 27 Nov 2014 10:05:08 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Thu, 27 Nov 2014 10:05:08 -0800 (PST)
In-Reply-To: <CAJTo0LYBYim=5XjssHcN7MZRbNUMoMUA5R8-hz__szPWV0pJcQ@mail.gmail.com>
References: <1408716303-32264-1-git-send-email-root@pol-lx-007.polatis.com>
	<33115ABC4887814E8A92A08FBC93416B23C470D7@IRSMSX103.ger.corp.intel.com>
	<CAOMwXhNCtMkkpSvCtd4c7r26FVEtxsr4-605acjRMgicTm-rAA@mail.gmail.com>
	<CAOMwXhMvUBY-SWX=2DdhEbkUJ9V=BEgYPf0TmX06b+F-odOVQQ@mail.gmail.com>
	<CAJTo0LYBYim=5XjssHcN7MZRbNUMoMUA5R8-hz__szPWV0pJcQ@mail.gmail.com>
Date: Thu, 27 Nov 2014 18:05:08 +0000
X-Google-Sender-Auth: dCR0wcehgknEgzHMdF7A7ZAIavI
Message-ID: <CAOMwXhO122osQmjsPk5z92pD0psSzvs8rSz68EnMOu2ZTqpH-Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest-runner: return 1 instead of zero if any test fails
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
X-List-Received-Date: Thu, 27 Nov 2014 18:05:09 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 27, 2014 at 6:02 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 27 November 2014 at 17:53, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> Ping. I have not received a reply for about three months now? What is
>> the problem?
>
>
> http://git.openembedded.org/openembedded-core/commit/?id=d6b1c9e7e29aaa8d71ccb485b7a88863a117a8b1

Thanks.

> Ross

