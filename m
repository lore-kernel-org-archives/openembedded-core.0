Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id E83886E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 02:11:12 +0000 (UTC)
Received: by ykoo205 with SMTP id o205so51551747yko.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 19:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GyiTrMfRsncIfvFnd8gMV8vnyZYMDwB+yTyiSL2uCsQ=;
	b=Ik+xyiaMajyqF6ovyuiqEgencMl5qkvBe/M84CvQ2DLBe9S9V++6d3j+tphd5uy6CL
	KVD0a/JY3pOr44B/gBsRCSsO2PTyu9HX5jhEL63L1OvlDUCgPlNXhMyOpyI4T4D1Outf
	mE04X2okHShLtnqPJInQEHafvl8DmSrUEouczipgR9tYbT0Iuh9cgoJV1kne+SDVfyvI
	ZijoqYD6r0V9+2fg6pf33cNmcdd+1UC4ICvvRSDZ6L/SaONJguATG3eNb/Xy10myaesX
	KPKkUQIZ3n8ssRhbQkbIHPeh3ysEDkvwPy6G+3Wy0P6LZy6MVeGTYKh2t/FwTpTT3AhL
	Jv9w==
MIME-Version: 1.0
X-Received: by 10.13.198.2 with SMTP id i2mr12877800ywd.123.1438827072484;
	Wed, 05 Aug 2015 19:11:12 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Wed, 5 Aug 2015 19:11:12 -0700 (PDT)
In-Reply-To: <1438799594.9838.18.camel@linuxfoundation.org>
References: <cover.1438679154.git.zhe.he@windriver.com>
	<55C1D2CF.4010308@windriver.com>
	<1438799594.9838.18.camel@linuxfoundation.org>
Date: Wed, 5 Aug 2015 22:11:12 -0400
Message-ID: <CADkTA4Opm_=3U26C+0v0=crMcdioN4xkDhYLfg91KKzocwRtQQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/1] Yocto Bug #6945
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
X-List-Received-Date: Thu, 06 Aug 2015 02:11:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 2:33 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2015-08-05 at 17:09 +0800, He Zhe wrote:
>> Ping.
>
> Sending these out daily is going to annoy me, please stop doing that.
>
> As mentioned in other emails, I'm travelling at the moment, other people
> are on vacation (including Bruce) and we're struggling in the patch
> review and merging, not least due to the other autobuilder failures.
> This patch is changing a lot of important code and if we screw this up,
> will annoy a lot of people. It therefore needs careful review which we
> will get to as soon as we can.

I was going to say something similar.

I'm moving on having a look at this as well, but I'm technically on
vacation, so I
end up only with time for a few pressing issues.  I have tagged this, and will
look once I'm back to my normal setup (and not a small screened travel
laptop!).

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

