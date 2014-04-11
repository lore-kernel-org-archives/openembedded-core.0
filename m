Return-Path: <darren.hart@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14D8E65EF0
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 18:16:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Apr 2014 11:16:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,843,1389772800"; d="scan'208";a="519284711"
Received: from fmsmsx105.amr.corp.intel.com ([10.19.9.36])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2014 11:16:24 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.19.17.7) by
	FMSMSX105.amr.corp.intel.com (10.19.9.36) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 11 Apr 2014 11:16:23 -0700
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.9]) by
	FMSMSX153.amr.corp.intel.com ([169.254.9.28]) with mapi id
	14.03.0123.003; Fri, 11 Apr 2014 11:16:23 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, "Ashfield, Bruce (Wind River)"
	<bruce.ashfield@windriver.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [Patch v2 1/1] meta-skeleton: linux-yocto-custom.bb: use
	machine overrides
Thread-Index: AQHPVa8J0CT72A15cEO8OHKfWDYY/ZsMuZKA
Date: Fri, 11 Apr 2014 18:16:22 +0000
Message-ID: <CF6D8001.8317C%darren.hart@intel.com>
References: <cover.1397238371.git.nitin.a.kamble@intel.com>
	<12b191e0f58ed7954477dab64bb89d7e94b95039.1397238371.git.nitin.a.kamble@intel.com>
In-Reply-To: <12b191e0f58ed7954477dab64bb89d7e94b95039.1397238371.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.196.58]
MIME-Version: 1.0
Subject: Re: [Patch v2 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Fri, 11 Apr 2014 18:16:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D06ECC9A0926CD49BCD594E8D2909CF3@intel.com>
Content-Transfer-Encoding: quoted-printable

On 4/11/14, 10:59, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:

>From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
>Use machine overrides for variables for this skeleton kernel recipe
>so that people following skeleton do it right at the beginning.
>
>The machine overrides for the variables reduces  variable name-space
>pollution and avoids unintentional influences on other layers.
>
>Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

Acked-by: Darren Hart <dvhart@linux.intel.com>

Thanks Nitin,

--=20
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation



