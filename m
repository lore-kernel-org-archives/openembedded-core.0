Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2CE6C0C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 21:46:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2018 13:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,241,1539673200"; d="scan'208";a="100930874"
Received: from ttorling-mac01.jf.intel.com ([10.24.11.24])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2018 13:46:51 -0800
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <46DEAC02-3743-4A88-A5EA-52C671A19E1A@linux.intel.com>
Date: Fri, 16 Nov 2018 13:46:51 -0800
Message-Id: <1DF14342-12DD-4002-A96C-642B5C6E42BD@linux.intel.com>
References: <46DEAC02-3743-4A88-A5EA-52C671A19E1A@linux.intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Mailer: Apple Mail (2.3445.101.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [sumo] cherry-pick request to fix bison on glibc 2.28
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
X-List-Received-Date: Fri, 16 Nov 2018 21:46:51 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I should note the reason is breakage on Fedora-29 host.

> On Nov 16, 2018, at 1:45 PM, Tim Orling =
<timothy.t.orling@linux.intel.com> wrote:
>=20
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D5e441f3f8aa896=
e264f44ba8b699e5841cceade4
>=20
> or
>=20
> =
http://git.openembedded.org/openembedded-core/commit/?id=3D741415c58b35657=
64000028c26efd081212eb989
>=20
> Regards,
>=20
> =E2=80=94Tim
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


