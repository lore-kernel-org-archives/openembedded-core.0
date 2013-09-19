Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 276D56C8D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 18:06:19 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1VMicL-0001FF-PN from Noor_Ahsan@mentor.com ;
	Thu, 19 Sep 2013 11:06:17 -0700
Received: from SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 19 Sep 2013 11:06:17 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.178]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.02.0247.003; Thu, 19 Sep 2013 19:06:16 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: Otavio Salvador <otavio@ossystems.com.br>, Ewan LE BIDEAU-CANEVET
	<Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Thread-Topic: [OE-core] Building a Poky distribution based on Wayland/Weston
	1.2
Thread-Index: AQHOtV3jwVRKmYs7tEWMxM0KbX2GRJnNWu6Q
Date: Thu, 19 Sep 2013 18:06:15 +0000
Message-ID: <365E1805BC95084CBE82381A0B869994DE50C7CF@EU-MBX-01.mgc.mentorg.com>
References: <552A140193B5B04F9B5027CA06300D85C47CD6@44c-mariner.eurogiciel.fr>
	<CAP9ODKr8LsbuFvfWcCJonpHvMa82EWH95mtLjW5x75-R2B2BCw@mail.gmail.com>
In-Reply-To: <CAP9ODKr8LsbuFvfWcCJonpHvMa82EWH95mtLjW5x75-R2B2BCw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Sep 2013 18:06:17.0875 (UTC)
	FILETIME=[F0073630:01CEB562]
Cc: yocto <yocto@yoctoproject.org>,
	"poky@yoctoproject.org" <poky@yoctoproject.org>, "Potnis,
	Abhijit" <Abhijit_Potnis@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Building a Poky distribution based on Wayland/Weston	1.2
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
X-List-Received-Date: Thu, 19 Sep 2013 18:06:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

We will also be interested in this. Mentor Graphics is also working on this=
.

Noor

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: Thursday, September 19, 2013 10:30 PM
To: Ewan LE BIDEAU-CANEVET
Cc: yocto; poky@yoctoproject.org; Patches and discussions about the oe-core=
 layer
Subject: Re: [OE-core] Building a Poky distribution based on Wayland/Weston=
 1.2

On Thu, Sep 19, 2013 at 11:48 AM, Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CAN=
EVET@eurogiciel.fr> wrote:
> Hello,
>
>
> I'm currently trying to have a poky distribution with Wayland/Weston=20
> 1.2 and no X server at all. I think I have successfully ported=20
> Wayland/Weston to 1.2 version and disabled the X server, so here is my qu=
estions :
>
>
> 1) Does this project interest you ?

I am interested on this.

> 2) How can I test if Wayland  has been correctly built ?
>
> Currently, the Weston shell is up and running.

\m/

> 3) Knowing I started my project from Poky and Open-Embedded=20
> repositories, on which upstream repository can I deliver my work ?

I'd start a layer in github to host this work until 1.6 is open for this.

> I added a poky distro configuration that seems to be delivered into=20
> Yocto git , is it correct?

Works fine I think.

> About the changes around Weston & Wayland, the new bb files should be=20
> delivered in YOCTO or OpenEmbedded project?

A layer for interim work.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

