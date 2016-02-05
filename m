Return-Path: <belen.barros.pena@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1894F771B2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 10:01:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 05 Feb 2016 02:01:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,399,1449561600"; d="scan'208";a="741030844"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
	by orsmga003.jf.intel.com with ESMTP; 05 Feb 2016 02:01:18 -0800
Received: from irsmsx155.ger.corp.intel.com (163.33.192.3) by
	IRSMSX106.ger.corp.intel.com (163.33.3.31) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 5 Feb 2016 10:01:13 +0000
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.31]) by
	irsmsx155.ger.corp.intel.com ([169.254.14.217]) with mapi id
	14.03.0248.002; Fri, 5 Feb 2016 10:01:12 +0000
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Smith, Elliot"
	<elliot.smith@intel.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] toaster: update the openembedded-core
	toaster configuration file
Thread-Index: AQHRX/wlBMKpUu5NVUutX93xYfU+vA==
Date: Fri, 5 Feb 2016 10:01:12 +0000
Message-ID: <D2DA3132.72B62%belen.barros.pena@intel.com>
References: <1454582844-11208-1-git-send-email-elliot.smith@intel.com>
	<1454584892.27087.236.camel@linuxfoundation.org>
In-Reply-To: <1454584892.27087.236.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.6.0.151221
x-originating-ip: [10.252.27.119]
MIME-Version: 1.0
Subject: Re: [PATCH] toaster: update the openembedded-core toaster configuration file
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
X-List-Received-Date: Fri, 05 Feb 2016 10:01:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2743E7C2251BF744A869836513DC2D88@intel.com>
Content-Transfer-Encoding: quoted-printable



On 04/02/2016 12:21, "openembedded-core-bounces@lists.openembedded.org on
behalf of Richard Purdie"
<openembedded-core-bounces@lists.openembedded.org on behalf of
richard.purdie@linuxfoundation.org> wrote:

>On Thu, 2016-02-04 at 10:47 +0000, Elliot Smith wrote:
>> From: Belen Barros Pena <belen.barros.pena@intel.com>
>>=20
>> It looks like the master branch will no longer build with the Fido
>> release, so remove all references to fido and make sure that the file
>> sets up local, master and jethro releases.
>
>Did you mean to remove dizzy too? I suspect the answer is yes but the
>commit message doesn't mention that.

I meant to remove Dizzy. I should have been more explicit. Apologies.

Bel=E9n

>
>Cheers,
>
>Richard
>
>--=20
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-core


