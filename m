Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQzeu-0004Pv-GJ for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 14:02:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OBmaj6002415;
	Wed, 24 Oct 2012 12:48:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02323-01; Wed, 24 Oct 2012 12:48:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9OBmTms002409
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 24 Oct 2012 12:48:29 +0100
Message-ID: <1351079308.22340.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 24 Oct 2012 12:48:28 +0100
In-Reply-To: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
References: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q9OBmaj6002415
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V3 0/4] icon-themes fixes
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
X-List-Received-Date: Wed, 24 Oct 2012 12:02:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-24 at 10:05 +0200, Andreas M=C3=BCller wrote:
> v1->v2:
>   * fix sato-icon-theme
> v2->v3:
>   * add libxml-simple-perl-native to DEPENDS
>   * merge sato-icon-theme.inc into recipe
>=20
> The following changes since commit 06d27cf0fbcc4004e6f456880eca49893c92=
90bf:
>=20
>   xorg: remove XF86 BigFont extension (2012-10-22 14:57:26 +0100)
>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/oe-core.git icon-themes
>=20
> Andreas M=C3=BCller (4):
>       gnome-icon-theme: fix icon mapping
>       gnome-icon-theme: remove unused configure variable
>       sato-icon-theme: fix build
>       sato-icon-theme: merge sato-icon-theme.inc into recipe

Merged to master, thanks.

Richard



