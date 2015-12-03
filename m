Return-Path: <belen.barros.pena@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D1BE560721;
	Thu,  3 Dec 2015 14:43:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 03 Dec 2015 06:43:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,378,1444719600"; d="scan'208";a="853152835"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
	by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2015 06:43:24 -0800
Received: from irsmsx110.ger.corp.intel.com ([169.254.15.163]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.23]) with mapi id
	14.03.0248.002; Thu, 3 Dec 2015 14:43:20 +0000
From: "Barros Pena, Belen" <belen.barros.pena@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [Openembedded-architecture] [OE-core] Patchwork & patch
	handling improvements
Thread-Index: AQHRLdjzXYEWhqyQCkq5puZwS8NXSA==
Date: Thu, 3 Dec 2015 14:43:19 +0000
Message-ID: <D2860501.6C1B5%belen.barros.pena@intel.com>
References: <1633798.xAxFJSpIzb@peggleto-mobl.ger.corp.intel.com>
	<41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
	<D2847D54.6BF8A%belen.barros.pena@intel.com>
	<D2847EE2.6BF9C%belen.barros.pena@intel.com>
	<20151202180440.GC2248@jama>
	<CAJTo0LZpgv3KuJXAO6Pa9o_PrRb=aMT3d8Pe6qD2-yvsspEsTw@mail.gmail.com>
	<D285DA30.6C15E%belen.barros.pena@intel.com>
	<CAJTo0LYGSR=TZeH--jFsc+DnE09K0zF4Xw2KhRfA_aazaDV0Dw@mail.gmail.com>
In-Reply-To: <CAJTo0LYGSR=TZeH--jFsc+DnE09K0zF4Xw2KhRfA_aazaDV0Dw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.5.8.151023
x-originating-ip: [10.237.224.81]
MIME-Version: 1.0
Cc: "openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Patchwork & patch handling improvements
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
X-List-Received-Date: Thu, 03 Dec 2015 14:43:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1F36768D3A79F84DBB08334637CE2D94@intel.com>
Content-Transfer-Encoding: quoted-printable



On 03/12/2015 12:51, "Burton, Ross" <ross.burton@intel.com> wrote:

>On 3 December 2015 at 11:43, Barros Pena, Belen
><belen.barros.pena@intel.com> wrote:
>
>>and more status values.
>
>You can add status values (to the db directly or via the Django admin
>interface), but they will apply to all projects in the Patchwork instance.
>Ideally you should be able to set a list of status values per project I
>guess.
>
>
>
>
>Well it depends on what the extra values are.

Heh, I meant that's how Patchwork works at the moment, independently of
what we do for OE


> Martin, what values do you use?  A "merged in staging" value would be
>useful for everyone.
>
>
>Ross
>


