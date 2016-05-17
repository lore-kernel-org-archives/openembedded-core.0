Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0276FEF6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 03:31:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 16 May 2016 20:31:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,323,1459839600"; d="scan'208";a="955997768"
Received: from ardiaz-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.156])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2016 20:31:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Tue, 17 May 2016 15:31:37 +1200
Message-ID: <2643823.U54b95pSib@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <1463168968-29526-3-git-send-email-anibal.limon@linux.intel.com>
References: <1463168968-29526-1-git-send-email-anibal.limon@linux.intel.com>
	<1463168968-29526-3-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] libuser: Fix security string formatting issues.
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
X-List-Received-Date: Tue, 17 May 2016 03:31:41 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi An=EDbal,

On Fri, 13 May 2016 14:49:26 An=EDbal Lim=F3n wrote:
> [YOCTO #9547]
>=20
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>

This isn't sufficient as a commit message. Every commit requires a prop=
er=20
message explaining what and why as per [1], even if it's covered by the=
=20
bugzilla entry.

Thanks,
Paul

[1] http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

--=20

Paul Eggleton
Intel Open Source Technology Centre

