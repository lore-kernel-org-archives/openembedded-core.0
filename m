Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id AB0207169F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 17:31:53 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id z11so4086379lbi.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 09:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Z/XVceau8xQh2qHgR3zqC7RI21IPb4sD/q5/sWXdhnE=;
	b=f13yL7PKDDPB2+VzAA8Soz0pJLG7nQXJ9f167qok1y9xTvqbvLl8NEEtLFkvoDX6iL
	rSMBssAm+thTywqAiKM9Du267jeAS+m93joN+wBBaQnQ2Gy4UZxgylLX0o451oj/aUxY
	P2weOLOZjQimQXplMSxVssPEiKIpCG/mk8yvA5/525PsE0WfHwfDIWub+XL8nXf1Ter7
	cOv/jbqczdCSsupw4aWqVx9ql43UIvBmBO8ILwuMho7l3i90SgQJt4bdUkH7tIBSqzvS
	9SbMBlPrNVoZl9KThzTwia5PlVtH6YM9n4tudqyaXdacSrLuW4QssOj40EG1fg3F90+7
	GucA==
MIME-Version: 1.0
X-Received: by 10.152.6.132 with SMTP id b4mr15988727laa.59.1420738313681;
	Thu, 08 Jan 2015 09:31:53 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 8 Jan 2015 09:31:53 -0800 (PST)
In-Reply-To: <DBD151E6-CA6E-4561-B77C-14911D9DE15F@gmail.com>
References: <1420622709.25779.60.camel@linuxfoundation.org>
	<1D92EEB7-710A-4923-9AB0-FEC6A3D884FB@gmail.com>
	<56832778.XUIYBB79do@peggleto-mobl5.ger.corp.intel.com>
	<A4B52F1A-F782-4EE0-B4E3-8E007AC38BCE@gmail.com>
	<CADkTA4MVZir6UMdfAoABSh5TgmiMLa3sQMKE3YRiWefQuQh7UA@mail.gmail.com>
	<DBD151E6-CA6E-4561-B77C-14911D9DE15F@gmail.com>
Date: Thu, 8 Jan 2015 12:31:53 -0500
Message-ID: <CADkTA4McMo2+zsbuKMnQgK+R2yVGB=unutK-Hq_XHsdiGYF6_w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, yocto <yocto@yoctoproject.org>
Subject: Re: Bug reporting and good bug reports
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
X-List-Received-Date: Thu, 08 Jan 2015 17:31:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 8, 2015 at 12:29 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jan 8, 2015, at 8:59 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> Assigning and scoping the actual work doesn't scale based on email threads
>> (as someone who has been thrashing to keep information straight, and reproduce
>> issues .. I feel this pain greatly).
>
> if you are a talking about corp development yes I agree for open source projects
> thats the nature of the beast.

I work with plenty of open source projects in my own time .. and if I
have an issue,
I open a bug if it requires a fix.

Probably a point of view thing.

We aren't saying that this is mandated .. just that anyone who can't be bothered
to log a bug (and steps to reproduce it) .. should set their
expectations for someone
to fix it accordingly :)

Bruce



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

