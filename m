Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQeRR-0007xJ-La for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 15:22:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9ND9Ix0016824;
	Tue, 23 Oct 2012 14:09:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15752-07; Tue, 23 Oct 2012 14:09:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9ND9Bva016818
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 23 Oct 2012 14:09:12 +0100
Message-ID: <1350997751.22340.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 23 Oct 2012 14:09:11 +0100
In-Reply-To: <CALbNGRS20RGCEu=e9+TNbLxK2=+daj=ttvjhpni4YdjJDcBLcg@mail.gmail.com>
References: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
	<1350975871-26719-2-git-send-email-schnitzeltony@googlemail.com>
	<1350991343.22340.43.camel@ted>
	<CALbNGRS20RGCEu=e9+TNbLxK2=+daj=ttvjhpni4YdjJDcBLcg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q9ND9Ix0016824
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] gnome-icon-theme: fix icon mapping
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
X-List-Received-Date: Tue, 23 Oct 2012 13:22:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-23 at 14:38 +0200, Andreas M=C3=BCller wrote:
> On Tue, Oct 23, 2012 at 1:22 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Doesn't this need a DEPENDS +=3D "libxml-simple-perl-native" or whate=
ver
> > the correct name for the module is?
>=20
> Sounds reasonable. Subsequent patch or V3?

V3 please, might as well get this right and sorry I didn't realise this
before.

Cheers,

Richard



