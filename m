Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QrP0B-00068T-Fv
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 08:44:23 +0200
Received: by wwe32 with SMTP id 32so1522995wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 23:39:52 -0700 (PDT)
Received: by 10.227.173.70 with SMTP id o6mr7823373wbz.38.1313044792134;
	Wed, 10 Aug 2011 23:39:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id em16sm1302007wbb.33.2011.08.10.23.39.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Aug 2011 23:39:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpYknoYpBDO2ZAmnCnGwiMaEeHVGLSAiHA9Bx0YZGFbKvw@mail.gmail.com>
Date: Thu, 11 Aug 2011 08:39:49 +0200
Message-Id: <1C656D42-CAB0-49B5-8560-062953852EAE@dominion.thruhere.net>
References: <1312659111-22327-1-git-send-email-agnel.joel@gmail.com>
	<CAD=GYpZGj1DriKV7hO--fb15_5+yrPts-2dx1LtpHG6FE8NpuQ@mail.gmail.com>
	<0E977A74-2104-48C7-BE76-E8D5101A794F@dominion.thruhere.net>
	<CAD=GYpYknoYpBDO2ZAmnCnGwiMaEeHVGLSAiHA9Bx0YZGFbKvw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Jason Kridner <jdk@ti.com>
Subject: Re: [PATCH] ti-codec-engine: Use latest CE and update all dependencies
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
X-List-Received-Date: Thu, 11 Aug 2011 06:44:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 aug. 2011, om 01:30 heeft Joel A Fernandes het volgende =
geschreven:

> On Wed, Aug 10, 2011 at 12:29 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>>=20
>> Op 10 aug. 2011 om 17:54 heeft Joel A Fernandes =
<agnel.joel@gmail.com> het volgende geschreven:
>>=20
>>> On Sat, Aug 6, 2011 at 2:31 PM, Joel A Fernandes =
<agnel.joel@gmail.com> wrote:
>>>> Switch to the latest CE 2.26.02.11 [1] and update all dependencies =
according to the
>>>> release notes [2]. This makes ti-codec-engine to build without any =
compilation errors
>>>>=20
>>>=20
>>> Can this patch be merged in? It is in sync with the ongoing effort =
of
>>> the gstreamer-ti import
>>=20
>> but not with master
>=20
> Hi Koen, the patch applies fine to master. Anything else you're =
referring to?

Yes, the master branch of meta-ti. The patch matches a non-master =
branch, so applying it would make the layers go out of sync=


