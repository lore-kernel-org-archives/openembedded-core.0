Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A7147719A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 03:15:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 20:15:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,369,1503385200"; d="scan'208";a="322729484"
Received: from opatki-mobl.amr.corp.intel.com ([10.254.56.3])
	by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2017 20:15:46 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <CAMKF1sp2ezog=9DQV4zm=-sa5b7j4n1=ueGm_qJM8+LYsT82sA@mail.gmail.com>
Date: Thu, 12 Oct 2017 20:15:48 -0700
Message-Id: <B3D4FF69-495F-4E02-9121-70F4ECDCE920@linux.intel.com>
References: <20171013004147.28663-1-timothy.t.orling@linux.intel.com>
	<CAMKF1sp2ezog=9DQV4zm=-sa5b7j4n1=ueGm_qJM8+LYsT82sA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3273)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] powertop: update to v2.9
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
X-List-Received-Date: Fri, 13 Oct 2017 03:15:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Also tested on qemuarm core-image-full-cmdline with TCLIBC =3D =
=E2=80=9Cmusl=E2=80=9D :)

Thank you for the additional check.

> On Oct 12, 2017, at 7:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> TCLIBC =3D "musl"


