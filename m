Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5BA6E8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 10:29:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Mar 2014 02:29:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,583,1389772800"; d="scan'208";a="466253846"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.51])
	by orsmga001.jf.intel.com with ESMTP; 04 Mar 2014 02:29:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Date: Tue, 04 Mar 2014 10:29:47 +0000
Message-ID: <1742132.ri7Qh8tc7U@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.5-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <53159295.9060600@enea.com>
References: <1393532438-6852-1-git-send-email-david.c.nystrom@gmail.com>
	<CALmOhgm_ScJQNZecKUQS-ki4+YkX_nYuZUDpYZcsLqjYSsECZg@mail.gmail.com>
	<53159295.9060600@enea.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] do_rootfs: Added PACKAGE_FEED_URIS functionality
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
X-List-Received-Date: Tue, 04 Mar 2014 10:29:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tuesday 04 March 2014 09:45:09 David Nystr=F6m wrote:
> On 2014-03-03 21:41, Trevor Woerner wrote:
> > Does this resolve issue 5407?
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5407
>=20
> This patch satisfies a small part of 5407, when this patch has been
> reworked into a recipe and merged

I'm still confused as to why reworking this into a recipe is beneficial=
... ?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

