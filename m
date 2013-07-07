Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 893376AB93
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jul 2013 10:29:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2013 03:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1013,1363158000"; d="scan'208";a="361542575"
Received: from unknown (HELO helios.localnet) ([10.252.121.239])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2013 03:30:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?V=EDctor?= MV <v.mayoralv@gmail.com>
Date: Sun, 07 Jul 2013 11:29:57 +0100
Message-ID: <7940116.m2IfuHY9uI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAKpQ202PRTQm4TwzVt_rOPmOo30FfG_tSe9sw4QUQ-cLz-UhHg@mail.gmail.com>
References: <1373027799-3470-1-git-send-email-v.mayoralv@gmail.com>
	<CAKpQ202PRTQm4TwzVt_rOPmOo30FfG_tSe9sw4QUQ-cLz-UhHg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apr: add apr_cv_mutex_recursive=yes to support meta-ros
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
X-List-Received-Date: Sun, 07 Jul 2013 10:29:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Victor,

On Sunday 07 July 2013 12:09:34 V=EDctor MV wrote:
> I sent this patch to the list a couple of days ago following the
> instructions given previously. What's the state of the patch?
> There were some discussions regarding wether it should be separated i=
n two
> commits or not.
>=20
> Could anybody inform me if the patch has been accepted?

It has been merged to master, yes:

http://cgit.openembedded.org/openembedded-core/commit/?id=3D20b9151f877=
978c086dcc8cbae7e0d9c9e89a45d

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

