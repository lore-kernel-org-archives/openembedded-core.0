Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1754B60746
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 18:34:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 04 Feb 2016 10:34:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,396,1449561600"; d="scan'208";a="908656658"
Received: from rravin1x-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.111])
	by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2016 10:34:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 05 Feb 2016 07:34:03 +1300
Message-ID: <14845289.oU9JeMapWM@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <5b9cb42547a87a4a79a147207b7e5d03f841b88a.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<5b9cb42547a87a4a79a147207b7e5d03f841b88a.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 28/28] classes/test{image, sdk}: Update Copyrights to match the true dates.
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
X-List-Received-Date: Thu, 04 Feb 2016 18:34:11 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 18:30:40 An=EDbal Lim=F3n wrote:
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/classes/testimage.bbclass | 2 +-
>  meta/classes/testsdk.bbclass   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.=
bbclass
> index 7fff29f..6992a18 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -1,4 +1,4 @@
> -# Copyright (C) 2013 Intel Corporation
> +# Copyright (C) 2013 - 2016 Intel Corporation
>  #
>  # Released under the MIT license (see COPYING.MIT)
>=20
> diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbcl=
ass
> index edc29ca..487f40c 100644
> --- a/meta/classes/testsdk.bbclass
> +++ b/meta/classes/testsdk.bbclass
> @@ -1,4 +1,4 @@
> -# Copyright (C) 2016 Intel Corporation
> +# Copyright (C) 2013 - 2016 Intel Corporation
>  #
>  # Released under the MIT license (see COPYING.MIT)

Can you squash this into the commit where you create testsdk.bbclass?

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

