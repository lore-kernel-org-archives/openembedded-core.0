Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 037A26AC8B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 12:16:43 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s65CGbq4008490;
	Sat, 5 Jul 2014 14:16:42 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Sat, 5 Jul 2014 14:16:37 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Life Life <sadlife1990@gmail.com>
Thread-Topic: [OE-core] Could not inherit file
	classes/rootfs_${IMAGE_PKGTYPE}.bbclass
Thread-Index: AQHPmEHqFnCBZ/Q0cEK4+rOv5WLwipuRU4SS///pVQCAACH2bf//5AqAgAAh3ko=
Date: Sat, 5 Jul 2014 12:16:36 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B43AB70@post.tritech.se>
References: <CAAHuHfyssKi6tXjKFwBHXNPuCLPXwyx3CKR14=g=w5REakyjMA@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AAF6@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB08@post.tritech.se>
	<CAAHuHfwHQBgACwx1XUFzeAyjAp2PRZXz1X4RgAtFrGuh86TJGQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB23@post.tritech.se>
	<CAAHuHfzUxTVUVtNec_pSghazarNeiVRd-3dYWRGXJ8w1nQDTig@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB5B@post.tritech.se>,
	<CAAHuHfxRyjJZnncMbjcE6MdgfttW5aap8ESDFTg8NecAKy57ng@mail.gmail.com>
In-Reply-To: <CAAHuHfxRyjJZnncMbjcE6MdgfttW5aap8ESDFTg8NecAKy57ng@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [195.84.96.49]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass
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
X-List-Received-Date: Sat, 05 Jul 2014 12:16:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=0A=
On Saturday, July 05, 2014 2:12 PM, Life Life wrote:=0A=
> Thank you for quick reply, I'm using angstrom-v2013.12-yocto1.5 =0A=
> PACKAGE_CLASSES =3D "package_ipk"=0A=
=0A=
...and by using the -e option you have verified that this is really what is=
 used by your build, or?=0A=
=0A=
// Mats=0A=

