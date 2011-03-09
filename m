Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PxEAR-00048B-7W
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Mar 2011 08:50:47 +0100
Received: by wyb40 with SMTP id 40so200260wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2011 23:49:12 -0800 (PST)
Received: by 10.216.63.132 with SMTP id a4mr4175374wed.78.1299656892369;
	Tue, 08 Mar 2011 23:48:12 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n4sm742139wee.28.2011.03.08.23.48.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Mar 2011 23:48:11 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201103090129.37429.paul.eggleton@linux.intel.com>
Date: Wed, 9 Mar 2011 08:48:10 +0100
Message-Id: <09DD7BA4-C30B-40FC-B8C7-B5F2CF74A09B@dominion.thruhere.net>
References: <cover.1299544029.git.sgw@linux.intel.com>
	<1299610544.602.109.camel@rex>
	<201103090129.37429.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1082)
Cc: poky@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/8] Numerous bug fixes
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
X-List-Received-Date: Wed, 09 Mar 2011 07:50:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mrt 2011, om 02:29 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 08 March 2011 18:55:44 Richard Purdie wrote:
>>> Saul Wold (3):
>>>  gst-plugins: Added hal to DEPENDS
>>>  attr: Added ncurses to depends
>>>  lsb-live image: add lsb-live and lsb-sdk-live image types
>>=20
>> Merged. I'd like to drop the hal dependency if someone can send me a
>> patch which disables it and everything works.
>=20
> Patch attached to do this (against oe-core) .


Looks good to me:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

>=20
> Cheers,
> Paul
> =
<0001-gst-plugins-good-remove-dependency-on-hal.patch>____________________=
___________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



