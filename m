Received: from pbcl.net (pbcl.net [159.69.221.92])
 by mx.groups.io with SMTP id smtpd.web08.16050.1624907457749964303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 12:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pbcl.net, ip: 159.69.221.92, mailfrom: pb@pbcl.net)
Received: from pb by pbcl.net with local (Exim 4.92)
	(envelope-from <pb@pbcl.net>)
	id 1lxwel-0007de-Mp; Mon, 28 Jun 2021 21:10:55 +0200
Date: Mon, 28 Jun 2021 21:10:55 +0200
From: "Phil Blundell" <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
Message-ID: <20210628191055.GF5525@pbcl.net>
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <c11c5d80-1913-00eb-343d-a8b344352298@gmail.com>
 <CAAQYJAsGX9ExxsmoGUY8wO_Bp_JscSoRJ-pBiNJ4oBf5eBf5CQ@mail.gmail.com>
 <6e2bcb94-8b02-50c1-bf5b-8fc3ce464d91@gmail.com>
MIME-Version: 1.0
In-Reply-To: <6e2bcb94-8b02-50c1-bf5b-8fc3ce464d91@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 28, 2021 at 11:46:08AM -0700, Khem Raj wrote:
> I still hope that if we can add a proper neon detection patch to meson
> they would be ok to accept it.

Why doesn't the runtime detection work in the way that upstream clearly
think it ought to?

p.

