Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYeZh-0007cs-UR for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:08:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEEsOpa020761;
	Wed, 14 Nov 2012 14:54:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19887-06; Wed, 14 Nov 2012 14:54:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAEEsGmC020754
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 14 Nov 2012 14:54:17 GMT
Message-ID: <1352904857.15477.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 14 Nov 2012 14:54:17 +0000
In-Reply-To: <CAP9ODKo=i=tKcKSTucvZHBShtfbvEp-F4TbE93+Vrs_wxasXgQ@mail.gmail.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
	<0c604e38ddcd6597371775a9c51625bf71c9f359.1352871028.git.sgw@linux.intel.com>
	<CAP9ODKpOi5tf6Tgdwv7sm=YeXL21Q9i=7ATiDLjVtvvZ-UddVw@mail.gmail.com>
	<3022446.WMq39sgvYG@helios>
	<CAP9ODKo=i=tKcKSTucvZHBShtfbvEp-F4TbE93+Vrs_wxasXgQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] less: Update to 451
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2012 15:08:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-14 at 09:36 -0200, Otavio Salvador wrote:
> On Wed, Nov 14, 2012 at 9:33 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>         On Wednesday 14 November 2012 09:26:53 Otavio Salvador wrote:
>         > > -PR = "r3"
>         > > +PR = "r0"
>         >
>         > Please drop PR as r0 is the default.
>
>         We don't do that in OE-Core.
>
> Well, as far as I remember I always drop the PR when it is going to be
> r0.
>
> But OK.

We've taken patches doing either, I find it hard to get worked up about
this either way.

I am totally fed up with the PR nonsense in general though and want the
PR service sorted out ASAP.

Cheers,

Richard



