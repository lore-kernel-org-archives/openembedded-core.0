Return-Path: <joshc@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 789E873243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 14:23:55 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8MENtcJ031567; Tue, 22 Sep 2015 09:23:55 -0500
Received: from jcartwri.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092209235498-158012 ;
	Tue, 22 Sep 2015 09:23:54 -0500 
Received: by jcartwri.amer.corp.natinst.com (Postfix, from userid 1000)
	id 1A7DF300914; Tue, 22 Sep 2015 09:23:55 -0500 (CDT)
Date: Tue, 22 Sep 2015 09:23:55 -0500
From: Josh Cartwright <joshc@ni.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150922142355.GJ31303@jcartwri.amer.corp.natinst.com>
References: <1442924678-17427-1-git-send-email-joshc@ni.com>
	<CAJTo0LYWQ+9jL_ZDQ1UTrQu=OaO=iaO5_XnBmAei3va6Es0nug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYWQ+9jL_ZDQ1UTrQu=OaO=iaO5_XnBmAei3va6Es0nug@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/22/2015 09:23:54 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/22/2015 09:23:55 AM,
	Serialize complete at 09/22/2015 09:23:55 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-09-22_04:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rt-tests: bump to v0.94
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
X-List-Received-Date: Tue, 22 Sep 2015 14:23:58 -0000
X-Groupsio-MsgNum: 71428
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cgrdyab2wu3Akvjd"
Content-Disposition: inline

--Cgrdyab2wu3Akvjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 03:08:54PM +0100, Burton, Ross wrote:
> On 22 September 2015 at 13:24, Josh Cartwright <joshc@ni.com> wrote:
> > All of the rt-tests patches that OE has been carrying have been
> > upstreamed or superceded by changes in the v0.94 release.
> >
>=20
> Sorry but you just missed the M3 deadline so this will have to wait until
> 2.0 is released and master re-opens, unless you have an urgent need for
> this to be merged in 2.0.

Thanks for dropping a note.  There is no urgent reason for this to be
pulled in.

I'll wait for a 2.0 release and resend.

Thanks,
  Josh

--Cgrdyab2wu3Akvjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAABCAAGBQJWAWR3AAoJEKp7ZBKwQFArk/QIAJ4ZWWe6sh+MDrRDziyQjpXv
2r5NNavL377xxzRVkO7wvkQQZccvnr0hFP4kEK9YnXEOUxmvqTYcpBdI709zQf7m
UcaL6MDGUHjumdsTISv7+V2xLRLq3+cNNJKFUYwsJxAhofflRGFMeCigwQi9Usvx
I+VjMkmsVWf1QWVBwDJoSKYhgKZ7ePGxTreVrZrKQTYL5j93Te6miNuluvc4I7xb
q1UJHyP4zmqwD8/nWKC0MKJJeIEw8imLfE9v6MqjQtapgw75fHv5WQynLuUcK8SC
+AUfwhYZeunvWfKDDpowj+j/Ewk4IyBoRrNXHzWuUbEDlakbgWS2yJ1VlAHKyeI=
=FkNj
-----END PGP SIGNATURE-----

--Cgrdyab2wu3Akvjd--
