Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 06A13605BD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 12:55:31 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id pn19so19481497lab.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0k1N5CLg+rcTiCInC1Vt8kk3jamUCGV+AgW+Y6j9xD0=;
	b=iofLW5ZFZjSrIyWhfdj9v92++qEO7Ul3RKTuFAd64km7N9E0TwfyerJ+puwf9qLj5z
	qArez6QjB+0zxE225VAjh67Ejacajlv3qgU3uTKS3p+OCIk9fwsQ+coUdjMPORHeCbqJ
	pJI852ASk9GYiBd5yK59wafPCOACzrk6ri5YP5xV9o8WgNPgc9tIvYipVGg/Hcdrjtei
	t4uSjJ0+EE2AgxqqFNcNgK5M+ypIiponCu2QSkGym9R+AEy25m1RrzxTm98QsYmXuG7f
	eA6FBFPfZwEiKcp8ySP8hFTq3eWRrisRw/1+xwcU9L8RnciDbEjw/H2pcbkzTTGuXPqZ
	1n8g==
MIME-Version: 1.0
X-Received: by 10.152.87.193 with SMTP id ba1mr3493336lab.83.1410267332621;
	Tue, 09 Sep 2014 05:55:32 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Tue, 9 Sep 2014 05:55:32 -0700 (PDT)
In-Reply-To: <CAJTo0LaiFxLSrXDkRFKu=hLF0RE6BsOuzpEVQcdturucN=-s7A@mail.gmail.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
	<CAJTo0LaiFxLSrXDkRFKu=hLF0RE6BsOuzpEVQcdturucN=-s7A@mail.gmail.com>
Date: Tue, 9 Sep 2014 08:55:32 -0400
Message-ID: <CADkTA4N5=aG82URwNWBq78gC8XD_Hy81mvvvGEiQFPuPWNKPBA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto*: consolidated pull request
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
X-List-Received-Date: Tue, 09 Sep 2014 12:55:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 9, 2014 at 7:42 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 8 September 2014 20:55, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
>> I'm on the road for the next three days, but wanted to get this out for
>> a preview before being a bit unresponsive, and to let others apply and build
>> these if they want.
>
> Just noticed this.  I'll pull these into my mut and see what the
> autobuilder makes of them.  If they pass testing and you're away I'll
> fix up the patches myself.

Thanks!

Bruce

>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

