Return-Path: <scott.m.rifenbark@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8B26F6F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 19:40:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Mar 2014 12:40:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,722,1389772800"; d="scan'208";a="479050215"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2014 12:40:10 -0700
Received: from orsmsx160.amr.corp.intel.com (10.22.226.43) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 24 Mar 2014 12:40:09 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.45]) by
	ORSMSX160.amr.corp.intel.com ([169.254.13.164]) with mapi id
	14.03.0123.003; Mon, 24 Mar 2014 12:40:09 -0700
From: "Rifenbark, Scott M" <scott.m.rifenbark@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, yocto <yocto@yoctoproject.org>
Thread-Topic: [yocto] Features in Yocto Project 1.7
Thread-Index: AQHPR3qptUmm4/pCLE6Vsn5TF7tV5prwonzA
Date: Mon, 24 Mar 2014 19:40:09 +0000
Message-ID: <41DEA4B02DBDEF40A0F3B6D0DDB1237983F859B5@ORSMSX101.amr.corp.intel.com>
References: <1395676843.24890.7.camel@ted>
In-Reply-To: <1395676843.24890.7.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [yocto] Features in Yocto Project 1.7
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
X-List-Received-Date: Mon, 24 Mar 2014 19:40:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I can see this effort as a  basis for re-writing the "Models" chapter of th=
e development manual.

Scott

>-----Original Message-----
>From: yocto-bounces@yoctoproject.org [mailto:yocto-
>bounces@yoctoproject.org] On Behalf Of Richard Purdie
>Sent: Monday, March 24, 2014 9:01 AM
>To: openembedded-core; yocto
>Subject: [yocto] Features in Yocto Project 1.7
>
>As development on 1.6 finishes up, its time to think about what we should =
be
>doing in the 1.7 cycle.
>
>I think from my perspective, in 1.7 I'd like to see us looking at "Develop=
er
>Workflow". Its a generic topic which I think covered multiple areas (in no
>particular order):
>
>* the ADT/SDK and how it intergrates into the rest of the system
>* toaster
>* python devshell
>* exteralsrc.bbclass
>* memory resident bitbake
>* how a standalone app developer might build an image
>* locked sstate
>
>and probably more I'm forgetting.
>
>If anyone does have things they plan to work on, or ideas for things that
>should be worked on, please do file enhancement requests in the
>bugzilla:
>
>https://bugzilla.yoctoproject.org/
>
>Cheers,
>
>Richard
>
>
>
>--
>_______________________________________________
>yocto mailing list
>yocto@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/yocto

