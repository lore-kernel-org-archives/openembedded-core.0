Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S5DVm-0006BC-5m for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 10:50:22 +0100
Received: from g225081112.adsl.alicedsl.de ([92.225.81.112]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S5DNY-0004RN-GB for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 09:41:52 +0000
Message-ID: <1331113294.3539.5.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 07 Mar 2012 10:41:34 +0100
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF338079F4@MBX20.4emm.local>
References: <1331000623-10956-1-git-send-email-james@digitalmatter.com.au>
	<1331027106.6166.7.camel@mattotaupa>
	<840A81C1B782724A8EB52725BD519EFF338079F4@MBX20.4emm.local>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] gdk-pixbuf: Pick up ${NM} from the environment.
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
X-List-Received-Date: Wed, 07 Mar 2012 09:50:22 -0000
X-Groupsio-MsgNum: 18497
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-svdTLRoUbmeeksOZ+0Ri"

--=-svdTLRoUbmeeksOZ+0Ri
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear James,


Am Mittwoch, den 07.03.2012, 01:49 +0000 schrieb James Limbouris:

> > thank you for sending an improved version of the patch.
> >=20
> ...
> >=20
> > as Khem and you discussed, it should be useful for upstream [1]. Maybe
> > you can add more context [2][3], so upstream can better judge if they
> > want it.
> >=20
> ...

> > [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/0=
18554.html
> > [2] http://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node=
/Generic-Programs.html
> > [3] http://lists.gnu.org/archive/html/bug-ncurses/2011-11/msg00011.html

> This issue has already been patched for gtk+, and is marked Upstream: ina=
ppropriate there.
> However, I couldn't find any mention of AC_CHECK_TOOLS in the Gnome bugzi=
lla, so I have submitted bug reports for both gdk-pixbuf and gtk+.
>=20
> https://bugzilla.gnome.org/show_bug.cgi?id=3D671515
> https://bugzilla.gnome.org/show_bug.cgi?id=3D671516

awesome! Thanks a lot!

Could you add these links to the patch and resend. I guess it will go in
then.


Thanks,

Paul

--=-svdTLRoUbmeeksOZ+0Ri
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9XLU4ACgkQPX1aK2wOHVgm7gCfT73Y389bFmgrBuKVSes69py8
iXYAn3YkYCcEKVBCl7OAG0uJdM4OrP5/
=P37V
-----END PGP SIGNATURE-----

--=-svdTLRoUbmeeksOZ+0Ri--
