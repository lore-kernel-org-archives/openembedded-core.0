Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwgJH-00046H-1S for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 23:18:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q71L6mLX000509
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 22:06:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29046-09 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2012 22:06:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q71L6cH9000502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 22:06:39 +0100
Message-ID: <1343855199.9756.57.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 01 Aug 2012 22:06:39 +0100
In-Reply-To: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
References: <CALbNGRTYa-2M-pi0d+oBvT+z81kTi8j9VM4gK=iiUDfBSQ7N9A@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q71L6mLX000509
Subject: Re: number of tasks increased since last update
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
X-List-Received-Date: Wed, 01 Aug 2012 21:18:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-01 at 17:29 +0200, Andreas M=C3=BCller wrote:
> Hi,
>=20
> today I updated and found the the number of tasks has increased about
> 400. Another strange behaviour: in my build dir there are two new
> folders:
>=20
> x86_64-nativesdk-angstromsdk-linux
> x86_64-angstromsdk-linux
>=20
> but up to now I was not interested in sdk stuff. Is that another bug
> or a feature?

Bug in the dbus change I think...

Cheers,

Richard



