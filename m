Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6F774BCA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 09:15:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w489FK2e004916
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 8 May 2018 10:15:21 +0100
Message-ID: <1525770920.3857.109.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 08 May 2018 10:15:20 +0100
In-Reply-To: <CAJ86T=UJUqrzyutyKf01HR1MDTN1YbYz+ovXkUTj+DARu1XW3w@mail.gmail.com>
References: <1521600149-3894-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=VK+Um4wa6F2EVzQTNiwa8LC1nhTEQrLqH2GBuSzCkbWw@mail.gmail.com>
	<1525765207.3857.101.camel@linuxfoundation.org>
	<CAJ86T=UJUqrzyutyKf01HR1MDTN1YbYz+ovXkUTj+DARu1XW3w@mail.gmail.com>
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
X-List-Received-Date: Tue, 08 May 2018 09:15:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-05-08 at 02:06 -0700, Andre McCurdy wrote:
> On Tue, May 8, 2018 at 12:40 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > We've discussed "long term" branches for a while. I suggest that we
> > collect together people who are will to maintain such things and
> > let
> > them push to a namespace in poky-contrib initially, perhaps in
> > other
> > repos eventually where we collect these things together.
> > 
> > Perhaps poky-contrib extended-life/daisy?
> > 
> > If there is common agreement, a group of people could collaborate
> > on such a branch too...
>
> Although there are multiple groups still actively developing against
> OE 1.6 I fear I may be the only one who has any interest in doing so
> in public. Hoping for a "group of people" to show up and collaborate
> on a branch in poky-contrib may be asking for too much.

Maybe, maybe not. I'd happy enough for you to put these changes there,
if others want to join in, great, if not I'm not sure we're in any
worse position. I just wanted to highlight the possibility in the
future...

Cheers,

Richard



