Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 7B19B60809
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 13:24:28 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s65DOMxT008600;
	Sat, 5 Jul 2014 15:24:27 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Sat, 5 Jul 2014 15:24:22 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Life Life <sadlife1990@gmail.com>
Thread-Topic: [OE-core] Could not inherit file
	classes/rootfs_${IMAGE_PKGTYPE}.bbclass
Thread-Index: AQHPmEHqFnCBZ/Q0cEK4+rOv5WLwipuRU4SS///pVQCAACH2bf//5AqAgAAh3kr//+VVgAAEfj8p///glACAAAC0gIAAJPlM
Date: Sat, 5 Jul 2014 13:24:20 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B43ABF6@post.tritech.se>
References: <CAAHuHfyssKi6tXjKFwBHXNPuCLPXwyx3CKR14=g=w5REakyjMA@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AAF6@post.tritech.se>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB08@post.tritech.se>
	<CAAHuHfwHQBgACwx1XUFzeAyjAp2PRZXz1X4RgAtFrGuh86TJGQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB23@post.tritech.se>
	<CAAHuHfzUxTVUVtNec_pSghazarNeiVRd-3dYWRGXJ8w1nQDTig@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB5B@post.tritech.se>
	<CAAHuHfxRyjJZnncMbjcE6MdgfttW5aap8ESDFTg8NecAKy57ng@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AB70@post.tritech.se>
	<CAAHuHfyRhyZnf6qBHqgLSLsmzRYLTZqHPPfxfui8CFc4qZAUbQ@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B43ABCB@post.tritech.se>
	<CAAHuHfzWrvjyok1xa+=mg0ws357VE_YC-fm42GaoZL6Nh3Q15Q@mail.gmail.com>,
	<CAAHuHfyy2+djAVki5qLf=+u-VzP9ZctiDyOn8oA_7yy_mf-V+A@mail.gmail.com>
In-Reply-To: <CAAHuHfyy2+djAVki5qLf=+u-VzP9ZctiDyOn8oA_7yy_mf-V+A@mail.gmail.com>
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
X-List-Received-Date: Sat, 05 Jul 2014 13:24:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday, July 05, 2014 2:57 PM, Life Life wrote:=0A=
> screenshot.png=0A=
=0A=
Well, the error message suggests that at the time image.bbclass is trying=
=0A=
to inherit the rootfs class, IMAGE_PKGTYPE is not defined.=0A=
=0A=
Something is wrong with your setup. I'm not using Angstrom myself  so I sug=
gest you=0A=
try going through the setup instructions and FAQ at http://wp.angstrom-dist=
ribution.org/=0A=
again and see if you missed something.=0A=
=0A=
Good Luck!=0A=
// Mats=0A=

