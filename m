Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SSC7X-00025j-7N
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 21:00:19 +0200
Received: by eaal1 with SMTP id l1so229070eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=IlNlrlmUxXFI12B2xzkEQo8G7xD16OYwegg9zBE6zQY=;
	b=TLCqBtuSpHxsEBkoV5N+P+IZmAdaOT5eOpdICm3nMGDUGshQv7FOmxUglFoTSLVUrY
	U3hu6F8xg0LsdyAGyy1/dHxVZGyVHvjl32hw94nCmLicchTeOOz6XSFj6DiYu6m/fc3V
	GDk4mHyKC16UkcEKtS+yT4rfVRPVB9Gnuu6cBs/Hj6ygvoXcbEV+r1Lhm5bbPhWlrVUO
	Td18SwDeTyt7A27HYkj1PPZZ0hBveLxIZV3pXJlSfYG0uEeB06Fmj4ChJcSQ14hwOFgU
	KJ+XqUk1Q49sBPxf5BjfihuBkGL0m7iXTpe/pRuRDVNCogmlqYaWaK0z4pI/tAYo6pv/
	fcaQ==
Received: by 10.213.105.78 with SMTP id s14mr837043ebo.84.1336589426167; Wed,
	09 May 2012 11:50:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Wed, 9 May 2012 11:49:55 -0700 (PDT)
In-Reply-To: <B090A023-EA9E-4750-BB53-D9AC631E3277@dominion.thruhere.net>
References: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
	<339076a9cf1ef906416bd850e5825c3bb8521983.1336517492.git.raj.khem@gmail.com>
	<73C72AB1-C5B4-40D1-BAA3-C349F4957C42@dominion.thruhere.net>
	<20120509094220.GA12898@jama.jama.net>
	<CAMKF1sqUUaG3ka7XKNAgFduBNTv2JtAa5imFSVpawJbdVPqAog@mail.gmail.com>
	<B090A023-EA9E-4750-BB53-D9AC631E3277@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 May 2012 11:49:55 -0700
Message-ID: <CAMKF1spCQ9qQ_uJPdQQ0c45Scgb55i+Cr5CTQjpJbdtnw6fKGg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] kmod: Update to .8 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 19:00:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 9, 2012 at 9:28 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Please drop the SRCPV, it's version '8', not 8+giter8735827548237582758293

Alright. Done.


