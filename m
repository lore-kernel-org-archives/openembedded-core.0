Return-Path: <paul@paulbarker.me.uk>
X-Greylist: delayed 1384 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jan 2017 08:09:40 UTC
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id DF52971A92;
	Fri, 27 Jan 2017 08:09:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id 20B0D535E09;
	Fri, 27 Jan 2017 08:45:03 +0100 (CET)
Received: from mfilter2-d.gandi.net (mfilter2-d.gandi.net [217.70.178.140])
	by relay5-d.mail.gandi.net (Postfix) with ESMTP id 9832541C09F;
	Fri, 27 Jan 2017 08:45:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter2-d.gandi.net
Received: from relay5-d.mail.gandi.net ([IPv6:::ffff:217.70.183.197])
	by mfilter2-d.gandi.net (mfilter2-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id syel-XyGicKM; Fri, 27 Jan 2017 08:44:59 +0100 (CET)
X-Originating-IP: 86.24.150.36
Received: from host0.betafive.co.uk
	(cpc15-shep11-2-0-cust35.8-3.cable.virginm.net [86.24.150.36])
	(Authenticated sender: paul@paulbarker.me.uk)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2E39841C07E;
	Fri, 27 Jan 2017 08:44:58 +0100 (CET)
Date: Fri, 27 Jan 2017 07:44:56 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Andreas =?UTF-8?B?TcO8bGxlcg==?= <schnitzeltony@googlemail.com>
Message-ID: <20170127074456.04009ae6@host0.betafive.co.uk>
In-Reply-To: <CALbNGRT_H_Vz8b6vcfgJGWYEyVw6og4+zKmLjLZ6P+2O0oY6eA@mail.gmail.com>
References: <65082de4-2ba6-3b18-1845-00b2d637404e@balister.org>
	<CALbNGRSrXLdfUK3U2bXr20P+fFm4ROArGPRi9Ag=AhXbGjUv+g@mail.gmail.com>
	<bbd8fb9d-8215-c73f-f4aa-b20523291ec0@balister.org>
	<CALbNGRT_H_Vz8b6vcfgJGWYEyVw6og4+zKmLjLZ6P+2O0oY6eA@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OpenEmbedded Stand at FOSDEM
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
X-List-Received-Date: Fri, 27 Jan 2017 08:09:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Jan 2017 22:39:17 +0100
Andreas M=C3=BCller <schnitzeltony@googlemail.com> wrote:

> On Thu, Jan 5, 2017 at 4:30 PM, Philip Balister <philip@balister.org>
> wrote:
> > On 01/03/2017 08:13 PM, Andreas M=C3=BCller wrote: =20
> >> On Tue, Jan 3, 2017 at 4:32 PM, Philip Balister
> >> <philip@balister.org> wrote: =20
> >>> Every year since 2007, OpenEmbedded has a stand at FOSDEM
> >>> (http://www.fosdem.org)
> >>>
> >>> From the first year:
> >>>
> >>> https://www.flickr.com/photos/32615155@N00/405229708/in/album-7215759=
4561002629/
> >>>
> >>> Belen and I are sort of organizing this, but both of us are also
> >>> involved in devrooms, so we will need a lot of help manning the
> >>> stand and getting some demos together.
> >>>
> >>> Demos should try and show how the project makes embedded work
> >>> easier, by showing tools and/or cool examples of devices using
> >>> Linux built with OpenEmbedded. In previous years, we've shown
> >>> toaster with data collected from demos on the table. Collections
> >>> of devices running images built from the same recipe and
> >>> interesting products using Linux by OpenEmbedded.
> >>>
> >>> I'm happy to try and organize demos and staffing, but I could
> >>> really use some help this year, so if you are in a position to
> >>> tak ethe lead on operating the stand, that would be a huge help
> >>> to me and the rest of the project.
> >>>
> >>> Thanks,
> >>>
> >>> Philip =20
> Nobody?
>=20
> Andreas

There's 3 of us from Tog=C3=A1n Labs who'll be able to help out manning the
stand. I know I can do all day Saturday and up to about 4pm on Sunday
and I'm happy to be at the stand all day (with the obvious caffeine
breaks!). Let me know if you need help setting things up and what time
you need people to turn up on Saturday morning.

If you need anything printing then send it to me.

I can bring 2x 4-way UK power strips plus 2x EU->UK power adaptors for
our gear. I've got 2 laptops plus a few embedded devices. I don't have
any EU power strips though.

I've updated the wiki page.

Thanks,
Paul

