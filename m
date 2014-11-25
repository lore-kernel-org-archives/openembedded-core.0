Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 75FF47215B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 03:10:27 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id rd3so10829879pab.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 19:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rkuwbLdyuA0lQouPB9+tHsnmbjdNWsdmp3XC9xrarQA=;
	b=mlf5WZbHP4+vtXeOhxDQ+VKbHRQGMNbubCLpx5bw2mVw05CmMdeCfwqHtNl6+9rp01
	oy5lqY3bi+dYznm16dpSKlOn/mTLA2xwwVR9suOWZFHJpiSb+SKp1YLkejfEQPImOswh
	A60OXKgj+CKm4LnQjzIGDJYEHLZqWxyEgXIFtKr3r4n5OYM2OZisIezZsBd8Kp45a65s
	hykkiLg1+XQ5/ZCYgtisAzpOFt1ZWY6Eucp1PZ78pDIYTFPB3BtjdxNSBKT1tN9Ukdjw
	vrjbqRModFew2srvwxZlciqwADfSx5xiknQS6TiarS2FsXxzM0NzWSYHU0cje45dwDU+
	tcJA==
X-Received: by 10.66.252.193 with SMTP id zu1mr38812155pac.153.1416885027631; 
	Mon, 24 Nov 2014 19:10:27 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:e95a:607d:d083:a0f9?
	([2601:c:9380:601:e95a:607d:d083:a0f9])
	by mx.google.com with ESMTPSA id
	fm9sm11791241pab.40.2014.11.24.19.10.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Nov 2014 19:10:26 -0800 (PST)
Message-ID: <5473F320.6060400@gmail.com>
Date: Mon, 24 Nov 2014 19:10:24 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>, 
 Ross Burton <ross.burton@intel.com>
References: <1415377424-2639-1-git-send-email-andrei.gherzan@windriver.com>	<CAK18fxE0CzhZjcNM7Jf=yEZW6a9YE5J=4H-rJBV7-RACyJjokA@mail.gmail.com>	<CAJTo0LZpqUUOG6vum-t6nWbkte_WqNDBj+vi7kyXeNVZbX4FXQ@mail.gmail.com>	<54638918.2040500@gmail.com>	<CAJTo0LZb4fRLx1O2Cc+-9CpP2A03fiBWZX4oY6ryLH9rLfQF6A@mail.gmail.com>
	<CAK18fxFo3MUVqh4bEUObuoEtSjm7Db6kHptg3DJpY1-j=4m2Xw@mail.gmail.com>
In-Reply-To: <CAK18fxFo3MUVqh4bEUObuoEtSjm7Db6kHptg3DJpY1-j=4m2Xw@mail.gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [master][dizzy][PATCH] xkeyboard-config: Inherit gettext
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
X-List-Received-Date: Tue, 25 Nov 2014 03:10:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


thanks,

staging for dizzy merge.

- armin
On 11/12/2014 04:18 PM, Andrei Gherzan wrote:
> On Nov 12, 2014 5:40 PM, "Burton, Ross" <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>  >
>  >
>  > On 12 November 2014 16:21, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>  >>>
>  >>> Thanks for the ping, merged to mut.
>  >>
>
> No problem. Hope to have it soon in dizzy
>
>  >>
>  >> What part did you take care of? Master or Dizzy?
>  >
>  >
>  > MUT feeds into master when Richard merges it.  You can backport from
> master when it's there.
>  >
>  > Ross
>

