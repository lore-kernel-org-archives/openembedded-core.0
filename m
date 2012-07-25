Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StvGw-00029n-KE
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 08:40:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 24 Jul 2012 23:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171088988"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2012 23:29:07 -0700
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Wed, 25 Jul 2012 07:29:06 +0100
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.176]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.108]) with mapi id
	14.01.0355.002; Wed, 25 Jul 2012 07:29:06 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Connectivity and multimedia manual packages
Thread-Index: AQHNabWzG77PhY/NX0SZ7sroQFa+hZc5ifYQ
Date: Wed, 25 Jul 2012 06:29:06 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16174C60@IRSMSX102.ger.corp.intel.com>
References: <1343137420-30809-1-git-send-email-cristian.iorga@intel.com>
	<500EC705.6010003@linux.intel.com>
In-Reply-To: <500EC705.6010003@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] Connectivity and multimedia manual packages
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
X-List-Received-Date: Wed, 25 Jul 2012 06:40:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, it was a mistake.
I send previously updates to poky.

Thanks,
Cristian

-----Original Message-----
From: Saul Wold [mailto:sgw@linux.intel.com]=20
Sent: Tuesday, July 24, 2012 7:02 PM
To: Patches and discussions about the oe-core layer
Cc: Iorga, Cristian
Subject: Re: [OE-core] [PATCH] Connectivity and multimedia manual packages

On 07/24/2012 06:43 AM, Cristian Iorga wrote:
> Upstream updates checked.
>
This should really go to poky@yoctoproject.org for your future reference.

Sau!

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   .../conf/distro/include/upstream_tracking.inc      |   28 ++++++++++---=
-------
>   1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/meta-yocto/conf/distro/include/upstream_tracking.inc b/meta-=
yocto/conf/distro/include/upstream_tracking.inc
> index 98e7d16..ba52d02 100644
> --- a/meta-yocto/conf/distro/include/upstream_tracking.inc
> +++ b/meta-yocto/conf/distro/include/upstream_tracking.inc
> @@ -187,7 +187,7 @@ RECIPE_UPSTREAM_VERSION_pn-eds-tools =3D "git"
>   RECIPE_UPSTREAM_VERSION_pn-eee-acpi-scripts =3D "1.1.12+9d4cdedca25b396=
405f8587f9c4fbf8229e041c2"
>   RECIPE_UPSTREAM_VERSION_pn-eggdbus =3D "0.6"
>   RECIPE_UPSTREAM_DATE_pn-eggdbus =3D "Nov 01, 2009"
> -CHECK_DATE_pn-eggdbus =3D "Jul 06, 2012"
> +CHECK_DATE_pn-eggdbus =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-eglibc =3D "git:16540"
>   CHECK_DATE_pn-eglibc =3D "Jan 01, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-elfutils=3D"0.148"
> @@ -217,7 +217,7 @@ RECIPE_UPSTREAM_VERSION_pn-fixesproto =3D "5.0"
>   RECIPE_UPSTREAM_DATE_pn-fixesproto =3D "Mar 8, 2011"
>   RECIPE_UPSTREAM_VERSION_pn-flac=3D"1.2.1"
>   RECIPE_UPSTREAM_DATE_pn-flac=3D "Sep 8, 2007"
> -CHECK_DATE_pn-flac =3D "Jul 06, 2012"
> +CHECK_DATE_pn-flac =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_DATE_pn-flac=3D"Sep 16, 2007"
>   RECIPE_UPSTREAM_VERSION_pn-flex =3D "2.5.35"
>   RECIPE_UPSTREAM_DATE_pn-flex =3D "Feb 02, 2008"
> @@ -345,7 +345,7 @@ RECIPE_UPSTREAM_DATE_pn-iptables =3D "Apr 28, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-iputils=3D"s20100418"
>   RECIPE_UPSTREAM_VERSION_pn-irda-utils =3D "0.9.18"
>   RECIPE_UPSTREAM_DATE_pn-irda-utils=3D"Jul 10, 2006"
> -CHECK_DATE_pn-irda-utils =3D "Jul 06, 2012"
> +CHECK_DATE_pn-irda-utils =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-iso-codes =3D "3.16"
>   RECIPE_UPSTREAM_VERSION_pn-jpeg =3D "8c"
>   CHECK_DATE_pn-jpeg =3D "Dec 24, 2011"
> @@ -448,7 +448,7 @@ CHECK_DATE_pn-libgsmd =3D "Jul 06, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-libgtkstylus =3D "0.5"
>   RECIPE_UPSTREAM_VERSION_pn-libical =3D "0.48"
>   RECIPE_UPSTREAM_DATE_pn-libical =3D"Dec 13, 2011"
> -CHECK_DATE_pn-libical =3D "Jul 06, 2012"
> +CHECK_DATE_pn-libical =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_DATE_pn-libical =3D "Dec 13, 2011"
>   RECIPE_UPSTREAM_VERSION_pn-libice =3D "1.0.6"
>   RECIPE_UPSTREAM_DATE_pn-libice =3D "Aug 01, 2009"
> @@ -486,7 +486,7 @@ RECIPE_UPSTREAM_VERSION_pn-liboil =3D "0.3.17"
>   RECIPE_UPSTREAM_DATE_pn-liboil =3D "Feb 01, 2010"
>   RECIPE_UPSTREAM_VERSION_pn-libomxil =3D "0.9.3"
>   RECIPE_UPSTREAM_DATE_pn-libomxil =3D "May 20, 2011"
> -CHECK_DATE_pn-libomxil =3D "Jul 06, 2012"
> +CHECK_DATE_pn-libomxil =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-libopensync-plugin-evolution2 =3D "0.39"
>   RECIPE_UPSTREAM_VERSION_pn-libopensync =3D "0.39"
>   RECIPE_UPSTREAM_DATE_pn-libowl-av =3D "Dec 01, 2008"
> @@ -499,9 +499,9 @@ RECIPE_UPSTREAM_VERSION_pn-libpcap=3D"1.2.0"
>   RECIPE_UPSTREAM_DATE_pn-libpcap=3D"Jul 24, 2011"
>   RECIPE_UPSTREAM_VERSION_pn-libpciaccess =3D "0.13.1"
>   RECIPE_UPSTREAM_DATE_pn-libpciaccess =3D "Apr 09, 2012"
> -RECIPE_UPSTREAM_VERSION_pn-libpcre =3D "8.30"
> -RECIPE_UPSTREAM_DATE_pn-libpcre =3D "Mar 01, 2012"
> -CHECK_DATE_pn-libpcre =3D "Jul 06, 2012"
> +RECIPE_UPSTREAM_VERSION_pn-libpcre =3D "8.31"
> +RECIPE_UPSTREAM_DATE_pn-libpcre =3D "Jul 23, 2012"
> +CHECK_DATE_pn-libpcre =3D "Jul 24, 2012"
>   RECIPE_NO_UPDATE_REASON_pn-libpng =3D "1.4.3 and later changes the API =
and breaks libmatchbox. Sticking with the 1.2.x series instead"
>   RECIPE_UPSTREAM_VERSION_pn-libpng =3D "1.5.11"
>   RECIPE_UPSTREAM_DATE_pn-libpng =3D "Jun 14, 2012"
> @@ -514,7 +514,7 @@ RECIPE_UPSTREAM_VERSION_pn-librsvg =3D "2.32.1"
>   RECIPE_UPSTREAM_DATE_pn-librsvg =3D "Nov 13, 2010"
>   RECIPE_UPSTREAM_VERSION_pn-libsamplerate0 =3D "0.1.8"
>   RECIPE_UPSTREAM_DATE_pn-libsamplerate0 =3D "Aug 15, 2011"
> -CHECK_DATE_pn-libsamplerate0 =3D "Jul 06, 2012"
> +CHECK_DATE_pn-libsamplerate0 =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-libsdl =3D "1.2.15"
>   CHECK_DATE_pn-libsdl =3D "Mar 14, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-libsm =3D "1.1.1"
> @@ -531,7 +531,7 @@ RECIPE_UPSTREAM_VERSION_pn-libtheora =3D "1.2.0"
>   RECIPE_UPSTREAM_VERSION_pn-libtimedate-perl =3D "1.20"
>   RECIPE_UPSTREAM_VERSION_pn-libtirpc =3D "0.2.2"
>   RECIPE_UPSTREAM_DATE_pn-libtirpc =3D "May 02, 2011"
> -CHECK_DATE_pn-libtirpc =3D "Jul 06, 2012"
> +CHECK_DATE_pn-libtirpc =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-libtool=3D"2.4.2"
>   CHECK_DATE_pn-libtool =3D "Nov 28, 2011"
>   RECIPE_UPSTREAM_VERSION_pn-libunique =3D "2.91.4"
> @@ -671,7 +671,7 @@ RECIPE_UPSTREAM_VERSION_pn-mdadm =3D "3.2.5"
>   RECIPE_UPSTREAM_DATE_pn-mdadm =3D "May 18, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-menu-cache =3D "0.3.3"
>   RECIPE_UPSTREAM_DATE_pn-menu-cache =3D "May 20, 2012"
> -CHECK_DATE_pn-minicom =3D "Jul 06, 2012"
> +CHECK_DATE_pn-minicom =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_DATE_pn-mesa-dri=3D"Jun 17, 2010"
>   RECIPE_UPSTREAM_VERSION_pn-meta-ide-support =3D "check"
>   RECIPE_UPSTREAM_VERSION_pn-metacity =3D "2.30.3"
> @@ -826,7 +826,7 @@ RECIPE_UPSTREAM_DATE_pn-quicky =3D "Jun 18, 2008"
>   RECIPE_UPSTREAM_VERSION_pn-quilt=3D"0.60"
>   RECIPE_UPSTREAM_VERSION_pn-quota =3D "4.00"
>   RECIPE_UPSTREAM_DATE_pn-quota =3D "Aug 17, 2011"
> -CHECK_DATE_pn-quota =3D "Jul 06, 2012"
> +CHECK_DATE_pn-quota =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_VERSION_pn-randrproto =3D "1.3.2"
>   RECIPE_UPSTREAM_DATE_pn-randrproto =3D "Oct 29, 2010"
>   RECIPE_UPSTREAM_VERSION_pn-readline =3D "6.2"
> @@ -841,7 +841,7 @@ RECIPE_UPSTREAM_VERSION_pn-resourceproto =3D "1.2.0"
>   RECIPE_UPSTREAM_DATE_pn-resourceproto =3D "May 27, 2011"
>   RECIPE_UPSTREAM_VERSION_pn-rpcbind =3D "0.2.0"
>   RECIPE_UPSTREAM_DATE_pn-rpcbind =3D "May 29, 2009"
> -CHECK_DATE_pn-rpcbind =3D "Jul 06, 2012"
> +CHECK_DATE_pn-rpcbind =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_DATE_pn-rpcbind =3D "May 01, 2009"
>   RECIPE_UPSTREAM_VERSION_pn-rpm =3D "5.1.10"
>   RECIPE_UPSTREAM_DATE_pn-rpm =3D "Jan 01, 2010"
> @@ -996,7 +996,7 @@ RECIPE_UPSTREAM_DATE_pn-which =3D "Aug 01, 2008"
>   CHECK_DATE_pn-which =3D "Nov 22, 2011"
>   RECIPE_UPSTREAM_VERSION_pn-wireless-tools =3D "29"
>   RECIPE_UPSTREAM_DATE_pn-wireless-tools=3D"Sep 18, 2007"
> -CHECK_DATE_pn-wireless-tools =3D "Jul 06, 2012"
> +CHECK_DATE_pn-wireless-tools =3D "Jul 24, 2012"
>   RECIPE_UPSTREAM_DATE_pn-wpa-supplicant=3D"Sep 07, 2010"
>   RECIPE_UPSTREAM_VERSION_pn-wv =3D "1.2.1"
>   RECIPE_UPSTREAM_DATE_pn-x11-common=3D"Sep 22, 2008"
>



