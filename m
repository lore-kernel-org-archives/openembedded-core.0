Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SILKn-0007kH-Uf
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:49:18 +0200
Received: by wera1 with SMTP id a1so1316329wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 07:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=pQd6Kz29zVsBY97yGrZDyZg5HEGEg9otOJqE5h3mHjk=;
	b=o0IeFzj3pKZG0v3gpJZT9lv3tkj14LsJoQApOPQskE8v/gu0fou9dEYXUgfufT+Ptl
	75ZCU74isAMFaN3KjfwgDLG2W3haAIkO15u/qmYuUL3HEu/0UF0Hd1czpU7v2NOdv0rP
	/UsXMUSjx4di8GNepbzESA6OajOlXeznGKcdd6CJx5IoAbroxGWJJGuxtJwOQRBg8xhA
	5L5bxzfmfcQjKTB+KvshUahCdg9fO6zI6kB5JnMgtOdIU5/17W9NiMDgehw/Czl8csvs
	efZczM7W5exL5l3i4I0ZoENGtuEe6PrWwhpsCcqSrc+QGzY8Q51khF2E9TER7oIdkElF
	d8fQ==
Received: by 10.216.132.40 with SMTP id n40mr1654571wei.68.1334241596657;
	Thu, 12 Apr 2012 07:39:56 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n8sm22212993wix.10.2012.04.12.07.39.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 07:39:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKp2s_PY9RPgkfC6O597v-05ha-+bbbZFFApwrRTa5zNGg@mail.gmail.com>
Date: Thu, 12 Apr 2012 16:39:52 +0200
Message-Id: <AF3E65EA-522E-49C3-BFA0-9EA50C39721C@dominion.thruhere.net>
References: <7E680CB2A76BB8438D08CF13C09FC53A46B06325@FMSMSX151.amr.corp.intel.com>
	<4F84D58F.8020608@gmail.com> <1334221321.31685.24.camel@ted>
	<4543FDF1-0512-4B36-ABB3-DBB957B86E88@dominion.thruhere.net>
	<CAP9ODKp2s_PY9RPgkfC6O597v-05ha-+bbbZFFApwrRTa5zNGg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmAQh+4AZNGdRkQn7zF+3j6Cvaz8YULLcsIAD9SzCEHN6nTtEIf/HE4C+YHpOacEk7H1JRY
Subject: Re: Yocto Project 1.2 M4 schedule
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
X-List-Received-Date: Thu, 12 Apr 2012 14:49:18 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 12 apr. 2012, om 16:24 heeft Otavio Salvador het volgende geschreven:

> On Thu, Apr 12, 2012 at 06:29, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> I'm still a big fan of using 'yoctoproject-1.2' as substring for tags =
and branches. The objections I heard to that didn't make sense to me, =
but I see this as a purely technical matter where others see it as =
something different :)
>=20
> OE-Core branch could be 2012-1.

Yes, but experience has shown that PHBs and new yocto users want to see =
'yocto' in the name and go apeshit when it's missing. OTOH people will =
hate whatever gets chosen, so let's get this over with and pick a name =
and strongly recommend other layers to adopt it as well.=20

We can't do worse than fedora: =
http://lists.fedoraproject.org/pipermail/announce/2012-February/003044.htm=
l=


