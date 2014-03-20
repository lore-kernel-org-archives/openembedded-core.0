Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id DA0646B5B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:23:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2KCNkJs012884;
	Thu, 20 Mar 2014 07:23:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2KCNkCv026573;
	Thu, 20 Mar 2014 07:23:46 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 20 Mar 2014 07:23:46 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Khem Raj <raj.khem@gmail.com>, Gary Thomas <gary@mlbassoc.com>
Thread-Topic: [OE-core] [PATCH 1/2] linaro-pm-qa-utils: Add power management
	test utils
Thread-Index: AQHPQ9WxYj1gx/Tt70SiikaU8EtTG5rp5Pjg
Date: Thu, 20 Mar 2014 12:23:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CF4380F@DLEE11.ent.ti.com>
References: <1395143773-26375-1-git-send-email-Chase.Maupin@ti.com>
	<23BFBADE-120F-4DBC-AABF-A9F802B8222C@dominion.thruhere.net>
	<1395147366.3808.70.camel@ted>
	<CAP9ODKqhnScZ+__098Q7OS53WrkkASfrfSxdkGt3OeozZ=2yJA@mail.gmail.com>
	<532A36F3.2090800@mlbassoc.com>
	<CAMKF1spcWtVah6-F6AQaSs72Cmyrke-5+JrdmR5s7AA6QCuDJA@mail.gmail.com>
In-Reply-To: <CAMKF1spcWtVah6-F6AQaSs72Cmyrke-5+JrdmR5s7AA6QCuDJA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linaro-pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Thu, 20 Mar 2014 12:23:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: openembedded-core-bounces@lists.openembedded.org
>[mailto:openembedded-core-bounces@lists.openembedded.org] On
>Behalf Of Khem Raj
>Sent: Wednesday, March 19, 2014 7:46 PM
>To: Gary Thomas
>Cc: Patches and discussions about the oe-core layer
>Subject: Re: [OE-core] [PATCH 1/2] linaro-pm-qa-utils: Add power
>management test utils
>
>On Wed, Mar 19, 2014 at 5:31 PM, Gary Thomas <gary@mlbassoc.com>
>wrote:
>>
>> What are you afraid of?  Putting this in OE-core _may_ make
>sense
>> if it serves a larger community, but having it there will not be
>> destabilizing, so why not?
>
>We should always strive towards making OE-Core leaner, therefore
>we
>should evaluate the real common usecase. which means there must be
>a
>good justification to add it there

So are there other people that have an interest in these utilities for test=
ing power management features of the kernel?  It sounds like that is the qu=
estion you have in order to help decide whether this is a common use case o=
r not.

Koen,=20

Do you know, or perhaps the Linaro QA team would know, how many people are =
using these utilities?

>--
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-core

