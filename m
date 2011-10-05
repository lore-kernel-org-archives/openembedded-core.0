Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBOlG-0001z5-Mp for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 12:31:39 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95AWXPr014101 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 11:32:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NseWvLHk1neP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 11:32:33 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p95AWVPn014095
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 11:32:32 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 05 Oct 2011 11:26:00 +0100
In-Reply-To: <201110050819.46880.schnitzeltony@gmx.de>
References: <201110050819.46880.schnitzeltony@gmx.de>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317810368.14671.129.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p95AWXPr014101
Subject: Re: conman-gnome sources missing
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
X-List-Received-Date: Wed, 05 Oct 2011 10:31:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-10-05 at 08:19 +0200, Andreas M=C3=BCller wrote:
> Although kernel.org seems up again I cannot download sources for conman=
-gnome
>=20
> | ERROR: Function 'Fetcher failure for URL: 'git://git.kernel.org/pub/s=
cm/network/connman/connman-gnome.git;protocol=3Dgit'. Unable to fetch URL=
 git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=3D=
git from any source.' failed
> |=20
> NOTE: package connman-gnome-0.5-r7: task do_fetch: Failed
>=20
> Where can I get the sources?

There is a copy on the Yocto sources mirror:

http://autobuilder.yoctoproject.org/pub/sources/git2_git.kernel.org.pub.s=
cm.network.connman.connman-gnome.git.tar.gz

Cheers,

Richard



