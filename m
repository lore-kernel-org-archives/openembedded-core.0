Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2LXP-0003mY-SC for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 14:20:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HC8S9L008503
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:08:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07451-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:08:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HC8K90008497
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 13:08:21 +0100
Message-ID: <1345205300.27428.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 13:08:20 +0100
In-Reply-To: <1345193717-23225-2-git-send-email-schnitzeltony@googlemail.com>
References: <1345193717-23225-1-git-send-email-schnitzeltony@googlemail.com>
	<1345193717-23225-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q7HC8S9L008503
Subject: Re: [PATCH 2/2] webkit-gtk: update to 1.8.2
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
X-List-Received-Date: Fri, 17 Aug 2012 12:20:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-17 at 10:55 +0200, Andreas M=C3=BCller wrote:
> run tested with midori 0.4.5:
> * google maps
> * google mail (https)
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../{webkit-gtk_1.8.1.bb =3D> webkit-gtk_1.8.2.bb}   |    8 ++------
>  1 files changed, 2 insertions(+), 6 deletions(-)
>  rename meta/recipes-sato/webkit/{webkit-gtk_1.8.1.bb =3D> webkit-gtk_1=
.8.2.bb} (96%)

Merged to master, thanks.

Richard



