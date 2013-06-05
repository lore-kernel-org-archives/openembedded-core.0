Return-Path: <Bjoern.Stenberg@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6B8B460881
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 14:36:21 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Wed, 5 Jun 2013
	16:36:19 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id EEC73289B70;
	Wed,  5 Jun 2013 16:36:19 +0200 (CEST)
Date: Wed, 5 Jun 2013 16:36:19 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20130605143619.GE20636@sestofb10.enea.se>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: ptest recipes in progress
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
X-List-Received-Date: Wed, 05 Jun 2013 14:36:21 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all.

In the interest of avoiding duplication of work, here is a list of recipes =
for which we (Enea) have already enabled ptest but have not yet submitted p=
atches:

- bash*
- busybox
- bzip2
- dbus*
- dhcp
- dropbear
- ethtool
- gcc-runtime
- gdb
- gdbm
- gettext
- glib-2.0*
- kmod
- libxml2
- openssh
- openssl
- python
- sqlite
- strace
- udev
- zlib

We've been occupied with internal work lately, but patches for these will b=
e submitted as soon as we can.

* =3D These are already in oe-core, but we have bug fixes and/or updates fo=
r them.

--=20
Bj=F6rn

