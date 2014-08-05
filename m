Return-Path: <darren.hart@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A07560C19
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 22:27:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Aug 2014 15:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,807,1400050800"; d="scan'208";a="572210716"
Received: from fmsmsx105.amr.corp.intel.com ([10.19.9.36])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2014 15:27:40 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
	FMSMSX105.amr.corp.intel.com (10.19.9.36) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 5 Aug 2014 15:27:40 -0700
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.224]) by
	fmsmsx116.amr.corp.intel.com ([169.254.2.204]) with mapi id
	14.03.0123.003; Tue, 5 Aug 2014 15:27:39 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Wold, Saul" <saul.wold@intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/2] INITRD var: documentation changes
Thread-Index: AQHPsPU86AgcNFGEmU6d43rSR78NZZvClv6A
Date: Tue, 5 Aug 2014 22:27:39 +0000
Message-ID: <D006A858.9F87E%darren.hart@intel.com>
References: <cover.1407274547.git.nitin.a.kamble@intel.com>
	<56edbd5eccdf7ebf4255142b52bf88b5a30f5040.1407274547.git.nitin.a.kamble@intel.com>
In-Reply-To: <56edbd5eccdf7ebf4255142b52bf88b5a30f5040.1407274547.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.176.132]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] INITRD var: documentation changes
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
X-List-Received-Date: Tue, 05 Aug 2014 22:27:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D37B9DFCF9437E41B1EF05AFF4E9CFFD@intel.com>
Content-Transfer-Encoding: quoted-printable

On 8/5/14, 14:39, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:

>From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
>The use of the INITRD variable is changed in a recent commit. Instead of
>specifying a single filesystem image, it specifies a list of file system
>images. Reflecting this change in the documentation.
>
>Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

--=20
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation



