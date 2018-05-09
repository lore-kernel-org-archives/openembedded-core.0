Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B2F1274AE6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 11:10:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w49B91YP014293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 9 May 2018 12:10:41 +0100
Message-ID: <1525864141.3857.121.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Michael Halstead
	<michael@yoctoproject.org>
Date: Wed, 09 May 2018 12:09:01 +0100
In-Reply-To: <CAJ86T=WkEuK_760z-Vw0i189j0OKCGY1b=B719UJoKNpmVZqkQ@mail.gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VK+Um4wa6F2EVzQTNiwa8LC1nhTEQrLqH2GBuSzCkbWw@mail.gmail.com>
	<1525765207.3857.101.camel@linuxfoundation.org>
	<CAJ86T=UJUqrzyutyKf01HR1MDTN1YbYz+ovXkUTj+DARu1XW3w@mail.gmail.com>
	<1525770920.3857.109.camel@linuxfoundation.org>
	<CAJ86T=WkEuK_760z-Vw0i189j0OKCGY1b=B719UJoKNpmVZqkQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 0/6] SRC_URI updates and minor build fixes
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
X-List-Received-Date: Wed, 09 May 2018 11:10:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-05-08 at 15:07 -0700, Andre McCurdy wrote:
> On Tue, May 8, 2018 at 2:15 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Tue, 2018-05-08 at 02:06 -0700, Andre McCurdy wrote:
> > > 
> > > On Tue, May 8, 2018 at 12:40 AM, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > 
> > > > We've discussed "long term" branches for a while. I suggest
> > > > that we
> > > > collect together people who are will to maintain such things
> > > > and
> > > > let
> > > > them push to a namespace in poky-contrib initially, perhaps in
> > > > other
> > > > repos eventually where we collect these things together.
> > > > 
> > > > Perhaps poky-contrib extended-life/daisy?
> > > > 
> > > > If there is common agreement, a group of people could
> > > > collaborate
> > > > on such a branch too...
> > > Although there are multiple groups still actively developing
> > > against
> > > OE 1.6 I fear I may be the only one who has any interest in doing
> > > so
> > > in public. Hoping for a "group of people" to show up and
> > > collaborate
> > > on a branch in poky-contrib may be asking for too much.
> > Maybe, maybe not. I'd happy enough for you to put these changes
> > there,
> > if others want to join in, great, if not I'm not sure we're in any
> > worse position. I just wanted to highlight the possibility in the
> > future...
> Changes pushed to:
> 
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=armcc/extended
> -life/daisy
> 
> What happens next?

Can you push to:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=extended-life/dais
y

? If not, we should give you access to do that (halstead can help),
then we publise this on the arch list and see who else, if anyone has
other extended-life branches they want to contribute to or work on
together with others.

Cheers,

Richard


