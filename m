Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QstCQ-0000gr-10
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 11:11:10 +0200
Received: by qwh5 with SMTP id 5so2532400qwh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zSaNa4tUfG5gpUkzK0vBdSHz6geUsaRSCaygL/Iga1s=;
	b=Ur54AJrmytnjWWKTkuNbTHCxWNrHFmcUexq02UpXabqKgyolXaaa4TBClhrkaK0us+
	zCGeLEnUkaUV3kIa3KNmm+EyaAI2Fdaz24UAZO6/B5PnPvxt309QQ3z5OrA/DhivWOfP
	06RALmoFMhTwfQHftOuVT5DpFFY+UqWcUzE94=
MIME-Version: 1.0
Received: by 10.229.7.141 with SMTP id d13mr2409722qcd.21.1313399193720; Mon,
	15 Aug 2011 02:06:33 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Mon, 15 Aug 2011 02:06:33 -0700 (PDT)
In-Reply-To: <9A00A881-7C5C-4053-BEDF-DE26572945C6@dominion.thruhere.net>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<201108121008.03554.paul.eggleton@linux.intel.com>
	<CAGiJk9dGQ5N0xd+L81Bit-jp4YDYPwSBjNvn5_io38vyH2nREg@mail.gmail.com>
	<201108121147.58438.paul.eggleton@linux.intel.com>
	<9A00A881-7C5C-4053-BEDF-DE26572945C6@dominion.thruhere.net>
Date: Mon, 15 Aug 2011 11:06:33 +0200
Message-ID: <CAGiJk9dDp_CwiS2GL5+Cy6HNgjRZMmJqt+KGBWiwYTbYCSxY3w@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Mon, 15 Aug 2011 09:11:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/12 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 12 aug. 2011, om 12:47 heeft Paul Eggleton het volgende geschreven:
>
> There's also:
>
> https://github.com/ebutera/meta-igep
> http://gitorious.org/schnitzeltony-oe-meta/meta-freescale
> http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix
> https://github.com/koenkooi/meta-ettus
>
> and likely much more

I'd guess there is no list for third party components/repositories, or
am I wrong?



Regards
Samuel


