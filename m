Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SNo7l-0003GO-2s
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 18:34:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2012 09:24:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="159103008"
Received: from orsmsx605.amr.corp.intel.com ([10.22.226.10])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2012 09:24:45 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	orsmsx605.amr.corp.intel.com (10.22.226.10) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 27 Apr 2012 09:24:40 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.108]) by
	ORSMSX152.amr.corp.intel.com ([169.254.8.220]) with mapi id
	14.01.0355.002; Fri, 27 Apr 2012 09:24:41 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] eglibc: package mtrace separately
Thread-Index: AQHNI/99P/rGA9O4aECmGavcKib22JavREwA//+X6pA=
Date: Fri, 27 Apr 2012 16:24:40 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C03093A5A@ORSMSX106.amr.corp.intel.com>
References: <cover.1335480719.git.nitin.a.kamble@intel.com>
	<385b9b6d43ea3d98d355edc50989d2e0ab488cd7.1335480719.git.nitin.a.kamble@intel.com>
	<4F9ABCEC.60403@linux.intel.com>
In-Reply-To: <4F9ABCEC.60403@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] eglibc: package mtrace separately
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
X-List-Received-Date: Fri, 27 Apr 2012 16:34:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, April 27, 2012 8:36 AM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH 1/2] eglibc: package mtrace separately
>=20
> On 04/26/2012 03:53 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > And install it only for nativesdk images
> >
> I think this needs to be in the -sdk images also, not just nativesdk.
>=20

Saul,
 mtrace is getting installed on the sdk images also.

Nitin


