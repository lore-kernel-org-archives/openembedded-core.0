Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rt3Vx-0005a4-U1
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 21:44:18 +0100
Received: by lahc1 with SMTP id c1so1495281lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 12:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KsmFuoZkBLMZWWftxhTHzF8aY6X469Wyx/QWwFgXJak=;
	b=RVrQpCQWtJcaTDYVzXHZVp0CuokpKvhdYHWIIVuHlxVUtxke3EFv5iLVH3K7LPJrpI
	yFLGbGlOQ7/4qruvS2J6MRcWI5d47opkxE2O4BHBWIJxGlEBSBPhd4G19QPv2+H374z8
	BeIFaFqfLim4jHqxLVuH0f12UEOEXu4rqLCKY=
Received: by 10.152.122.38 with SMTP id lp6mr2303593lab.13.1328214981337; Thu,
	02 Feb 2012 12:36:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 2 Feb 2012 12:35:50 -0800 (PST)
In-Reply-To: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Feb 2012 12:35:50 -0800
Message-ID: <CAMKF1spxuy4sxgxk4OYLLh1DHpL_vXRohG7rgM6mHN85mdC9DA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 02 Feb 2012 20:44:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 2, 2012 at 3:50 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> for some time now I've been working on a port of Plasma Active, the
> next generation touch user interface from KDE.
> If you never heard about Plasma Active see [1].
> For touch devices it is much more satisfying to use a GUI that is
> designed for this input method, so I started porting it.
> Someone already built Plasma Active for the Pandaboard [2] but it was
> compiled native on the device, but somehow this inspired me to start
> this project.

kudos Samuel. I always have been intending to have something
like that. I would be happy to help you out if you need any
help just ask.


