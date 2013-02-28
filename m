Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBDNJ-0003Ag-Qc
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 00:59:04 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so1351294pbc.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 15:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7tyJVIeue2z2zcuUjG/UsxMR1el7UG3MnDwbJybjTL0=;
	b=tBY1gTaIFe07s+ppMjW4tuhagq19Som3cw8ksj6UFH8/NoPiZIts3Gazyd9e4PIWNU
	oNmMhlf9YssbKESmmMPS5aVNRNnysd3VhQvgzF1V8hhMyzHIC0glU2UjZu7cDBvgabls
	yQH4dBqBUamMCPEwM4BlMj9b5YIKx5nve8RHjsK4MzHCYNl9iTaZWw7NTLuUqT6u2A8H
	J/dFUT/Emm1RZMpl6Rvjwp5gWIVuV09rD46/ALyesCWU4Tq3pewkS/beF2T+awBZysgB
	Ud6f8letprHDDMkUmffXTVVzGxHhFbUEQVjV/+Q0iDPo7DSQEeNkEWaathCzAkJGjHmW
	u+nw==
X-Received: by 10.66.163.195 with SMTP id yk3mr15834918pab.141.1362094954574; 
	Thu, 28 Feb 2013 15:42:34 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 1sm9818133pbg.18.2013.02.28.15.42.31
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 15:42:33 -0800 (PST)
Date: Fri, 1 Mar 2013 00:42:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130228234226.GC3279@jama>
References: <cover.1362003285.git.sgw@linux.intel.com>
	<1362093308.1055.4.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1362093308.1055.4.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/40] Post-ELC Patches and Updates
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
X-List-Received-Date: Thu, 28 Feb 2013 23:59:05 -0000
X-Groupsio-MsgNum: 36055
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Content-Disposition: inline

--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2013 at 11:15:08PM +0000, Richard Purdie wrote:
> > Martin Jansa (1):
> >   sanity: use lsb distro_identifier
>=20
> Where are the updates this would need associated with it?

It was only RFC and only Otavio said he likes it IIRC

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEv62IACgkQN1Ujt2V2gBznSgCeMq9Hk7BJ0V+xOFJVyK/IEYMF
fBsAoIG0Tr8AYEe6MgXohk7ORDXYJaz9
=qkbc
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
