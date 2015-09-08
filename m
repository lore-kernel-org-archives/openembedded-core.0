Return-Path: <mike.looijmans@topicproducts.com>
Received: from mx12-05.smtp.antispamcloud.com (mx12-05.smtp.antispamcloud.com
	[46.165.232.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE2D65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:20:02 +0000 (UTC)
Received: from 100-208.ftth.onsbrabantnet.nl ([88.159.208.100]
	helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:AES128-SHA:128)
	(Exim 4.85) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1ZZG0H-0008Qg-FG; Tue, 08 Sep 2015 12:20:00 +0200
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 8 Sep 2015 12:19:19 +0200
Message-ID: <55EEB647.7000101@topic.nl>
Date: Tue, 8 Sep 2015 12:19:51 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <55963864.2030604@topic.nl> <55ED6393.6050906@topic.nl>
	<CAHiDW_GfhUoDMBtwbj2G8RbRnA7OWR_3b_M_tDc-hEz8g4NqYw@mail.gmail.com>
	<55EDBD6F.7090900@topic.nl>
	<CAHiDW_GPgMLsLbASU4qHCHY65E9OWK3G3BgTpq=vAd8tsPDNbg@mail.gmail.com>
In-Reply-To: <CAHiDW_GPgMLsLbASU4qHCHY65E9OWK3G3BgTpq=vAd8tsPDNbg@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw51tZiJxcjns2SY3j4UJRi6sxOp0+M2PQ1/4TNBB5Ij0w0IL8f1eek8oyUUuBOOAQa8g
	ejvs5mxBUzg3jVOf3vvmP3xMDswqyQ6mQ6XwvGLsuJVCkJk9TlVS86xgAgZafbHqj5fcgWKFi0cp
	Vjs6qIsVBRxTXZY5rRjwUCWOgblDtJR2W3sp9iQnl8NFIeJNHiG7X+t1TW39Ja77LGPpOwDOjyd3
	oGE1tEOqXHYvZIk4yBUEDKaxNZhQ5w2b7VrnnPRMPeCzA4fvS0eXZ3J8iZshEWyJzIkwSFAW0Pw8
	uiKeJ9eX2UhoCOjofuIFDReRUAFSU+YtS5ujHPpGDgHLmNg7cwe96RgJ9LTG/qMdWsI692PNDpgL
	sd6Ddd/s7VM53o6ccHCldH+5aCvCLfmaIvz3uFL8N7VKh/CG+lj0Rj1mjuG3OyA90NHVTFoNkTji
	gYIHzgrL8il3sV0dVRVXzjqRVYKU9W9tbmVXJBqdHHDmlFyaiSgCQQ1OadeU0o3KJDNLKZUH8kQv
	CzH7IKj6sa+/C1cmIkpmMu2y/KVVPaNVuERI/lUckE9oPyvcIhwEMmltkIEyb31pMCMMB0fkaiUf
	hLP+ssd9qBrF2bUx9HvvbufhCZ7MOWUWpNco+KOrHhgD/FVEY7v4laIdTJ8d+KC4ixWSYWIo3iDq
	xvNn8MbZG8FV/fQARVcG5/WF9EqvuQ==
X-Report-Abuse-To: spam@mx99.antispamcloud.com
X-Filter-Fingerprint: IFrWXGses7OKB5S5G8/dJUb3OPwsHaH0Fvg5oXltHd/JUWjZ8+qhjyB23tbDuyLOYL8Ff78gYsez
	4Rl08xudmXi4esCQ0R1MchVjt7wblGlvhFgW0MjUMRkF5sMCDfftTXNFDzN17hnrWeZYOJvLq0Ic
	WjZ+XcEjj/7Pkld0zkmvziDInX9WdMov2kn2yXjdwv61T+KDYyYtREgszdyFwv8IxCB3p/oCKvxr
	eyISh3JGb7OS5oVgiO+kDxZrVPLz3MmEGC2PrUKqLq5WmHK+Nw==
X-Originating-IP: 88.159.208.100
X-Spampanel-Domain: topic.nl
X-Spampanel-Username: 88.159.208.100
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=88.159.208.100@topic.nl
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.00)
X-Recommended-Action: accept
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Getting rid of "The license listed internal was not in the licenses collected" warnings?
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
X-List-Received-Date: Tue, 08 Sep 2015 10:20:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 08-09-15 10:44, Jussi Kukkonen wrote:
> On 7 September 2015 at 19:38, Mike Looijmans <mike.looijmans@topic.nl
> <mailto:mike.looijmans@topic.nl>> wrote:
>
>     On 07-09-15 13:56, Jussi Kukkonen wrote:
>
>         On 7 September 2015 at 13:14, Mike Looijmans <mike.looijmans@topi=
c.nl
>         <mailto:mike.looijmans@topic.nl>
>         <mailto:mike.looijmans@topic.nl <mailto:mike.looijmans@topic.nl>>=
> wrote:
>
>              Just sped another hour or so trying to pinpoint this, but I =
cannot
>              wrap my head around it. What do I have to do to add a licens=
e to a
>              layer without these annoying warnings?
>
>
>         I just tried this (with master branch) and it seems to work fine
>         here...  Are you using master or something older?
>
>
>     Did you try that in a separate, empty layer? I suspect I'm missing a
>     variable or directive of some kind which cause it to miss the license=
 file.
>
>
> I have layer with literally only:
> * conf/layer.conf file with just LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> * licenses/internal file
> This layer is added to BBLAYERS. After this a recipe from another layer s=
eems
> to be able to use the "internal" license...

The warning doesn't appear until you actually build a rootfs with that pack=
age=20
in it.

>
>         Do you not get a "${DEPLOY_DIR}/licenses/${BPN}/generic_internal"=
 file
>         when you build the recipe for BPN?
>
>
>     Nope.

Ah, wait, on closer inspection it actually exists, but it's a symlink to so=
me=20
none-existing location. Apparently, to save some diskspace and reduce=20
maintenance on text files I linked a few files together. Somehow, the link =
got=20
copied instead of the file contents.

I un-symlinked the "internal" file, and (together with some forced rebuilds=
)=20
that finally made the warning go away.

Thanks!


Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






