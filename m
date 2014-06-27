Return-Path: <Mats.Karrman@tritech.se>
X-Greylist: delayed 498 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Jun 2014 12:28:32 UTC
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 07DFC60889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jun 2014 12:28:32 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s5RCK7Yh019193;
	Fri, 27 Jun 2014 14:20:12 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Fri, 27 Jun 2014 14:20:07 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Hi
Thread-Index: AQHPkfkKdWc4fZgivkqMoE03tquhBpuE3zDZ
Date: Fri, 27 Jun 2014 12:20:05 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B4381D2@post.tritech.se>
References: <1403857546.S.8016.autosave.drafts.old.1403867659.11257@webmail.rediffmail.com>
In-Reply-To: <1403857546.S.8016.autosave.drafts.old.1403867659.11257@webmail.rediffmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.75.63.254]
MIME-Version: 1.0
Subject: Re: Hi
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
X-List-Received-Date: Fri, 27 Jun 2014 12:28:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Himanshu,=0A=
=0A=
On Friday, June 27, 2014 1:14 PM, Himanshu Pandey wrote:=0A=
> Can some one help me to write a receipe with all these requirements?=0A=
=0A=
How about starting out with meta-networking/recipes-protocols/pptp-linux/pp=
tp-linux_1.7.2.bb and add your own .bbappend to tweak the things you must?=
=0A=
=0A=
BR // Mats=0A=

