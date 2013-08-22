Return-Path: <eric@eukrea.com>
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by mail.openembedded.org (Postfix) with ESMTP id 069F16B5CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 17:49:12 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6A64C8231C;
	Thu, 22 Aug 2013 19:49:06 +0200 (CEST)
Date: Thu, 22 Aug 2013 19:49:05 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130822194905.5687000e@e6520eb>
In-Reply-To: <CAJTo0La3zAhojZD6sSW=GXRuU+s4KCQQQjBYHTsT3=kFebPPYw@mail.gmail.com>
References: <1373354955-16500-1-git-send-email-eric@eukrea.com>
	<1373354955-16500-3-git-send-email-eric@eukrea.com>
	<CAJTo0La3zAhojZD6sSW=GXRuU+s4KCQQQjBYHTsT3=kFebPPYw@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [danny][PATCH 3/3] binutils: fix build with recent texinfo (5.1)
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
X-List-Received-Date: Thu, 22 Aug 2013 17:49:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Le Tue, 23 Jul 2013 14:37:05 +0100,
"Burton, Ross" <ross.burton@intel.com> a =E9crit :

> On 9 July 2013 08:29, Eric B=E9nard <eric@eukrea.com> wrote:
> > Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils-2.22.inc   |    1 +
> >  .../binutils/binutils/texinfo.patch                |  294 ++++++++++++=
++++++++
> >  2 files changed, 295 insertions(+)
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/texinfo.pat=
ch
>=20
> Sorry for the delay, this series is now in ross/danny-next.
>=20
when do you think these patches could reach oe-core's danny branch ?

Thanks,
Eric

