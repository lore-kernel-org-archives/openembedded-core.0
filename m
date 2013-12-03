Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8B0776CB61
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2013 17:39:35 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id jt11so21208678pbb.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2013 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C8bTsZKriO+a1BjwnbyqVBvObu9t/YbZUplPXorgoBg=;
	b=GFbMQWe9yUazrnK8WbmPS04ydNVpxdXxUtYedHEMlh665WImEfyhd6ZUCsurRu/28F
	bDS/7bRsPTY3NvUlUCxdFU/2yKs2O0MI+GaWH+7VT0Wqn1bldwMvOjkPdLEmVOtSze2F
	jp3RWcEfIkaIb78gp092LkqKXGYRB8r82GEpon3/8Rbf6yPUEfmryb4HE/qb5y5xPSF8
	feBLQTNbeDK7ACq4ziGkBskBKv/CtBaZgBzUAbJPPYgEg3ZMj0VQKfF35lo9xwwuGoXE
	i/BJ8CnYMSDXpFdoFDZBkwYLFqJ+k2kBwH/qVWLmFElZRgXiRWr2YgvWHeMwBxQy9evS
	HUFg==
MIME-Version: 1.0
X-Received: by 10.66.188.172 with SMTP id gb12mr12454627pac.143.1386092374826; 
	Tue, 03 Dec 2013 09:39:34 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Tue, 3 Dec 2013 09:39:34 -0800 (PST)
In-Reply-To: <20131203173732.GD11291@mail.zedat.fu-berlin.de>
References: <20131203160858.GB11291@mail.zedat.fu-berlin.de>
	<529E0A3D.50809@balister.org>
	<20131203165509.GC11291@mail.zedat.fu-berlin.de>
	<CADkTA4MGqDjpeAHE4gVWVgSv51uauteHtUbcsErLCMOj3eBz2Q@mail.gmail.com>
	<20131203173732.GD11291@mail.zedat.fu-berlin.de>
Date: Tue, 3 Dec 2013 12:39:34 -0500
Message-ID: <CADkTA4OaADmnG-3A6pvQhBWOLh2sj3wTo0i6RUsPS+TgLrF4zg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Henning Heinold <heinold@inf.fu-berlin.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Status for "Sponsored by" git tags
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
X-List-Received-Date: Tue, 03 Dec 2013 17:39:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 3, 2013 at 12:37 PM, Henning Heinold
<heinold@inf.fu-berlin.de> wrote:
> On Tue, Dec 03, 2013 at 12:21:10PM -0500, Bruce Ashfield wrote:
>> On Tue, Dec 3, 2013 at 11:55 AM, Henning Heinold
>> Urk. Of the top of my head .. that just looks nasty. Signed-off-by:
>> already indicates
>> a company name, so going further than that is overkill IMHO.
>>
>> Bruce
>
> But what if it is contractor work, where the commiter has no company email.

Honestly, that's between the company and the contractor. But I'm only offering
one opinion. I'm not a fan of new tags, whether or not they are about credit.
Better commit messages, not tags, are what is typically required (i.e.
read about
the short lived "Impact:" tag in kernel commits).

Bruce

>
> Bye Henning
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

