Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sqljx-0002UC-CV
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 15:53:33 +0200
Received: by wgbdr1 with SMTP id dr1so1619192wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 06:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=an+3b3WPxfjeICkSSF+r2guhFJZecc/OzMayYu9sZQs=;
	b=VFXhfZr87UKJwnYhsPLvygD1l8xIH5ssfS6WzwktUgT8l00SPdf921TJ1qvNDQyj8h
	1+7DkAw98qWJLiy1pXb5MvENCpzskggu/P7f4mlL3KsvdfJeNKFH0Q0XKfSwBfOrYX2Z
	HXMISFCZmAqbwtuGhM+oqudAmBSq0OlUVhSCt5lDd0dwjsoaofWPEcpoMlO32dt/T6VY
	Ce4nwd4xVFRp5TlVzSyOsik9wVqj7S4DNuxgS5yFJrFWXkNPbgBVs9Hcs25FzwSxKOAk
	wMxHgDrRYDyOm+0CFfQwc9e0FNbssboaEoYlaq5h62Le+X5VL3Ny5n9bbE7lBcUDsMVG
	FwIA==
Received: by 10.180.83.105 with SMTP id p9mr18321704wiy.12.1342446132975;
	Mon, 16 Jul 2012 06:42:12 -0700 (PDT)
Received: from [10.47.217.41] ([188.207.89.201])
	by mx.google.com with ESMTPS id df4sm21604529wib.4.2012.07.16.06.42.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 06:42:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKo3gqTjcYwnZuNJ9yq6G_CYh54A8JtngBA78hyREURTqw@mail.gmail.com>
Date: Mon, 16 Jul 2012 15:40:24 +0200
Message-Id: <83093679-57B8-4B40-9AEE-DDF98E73B087@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
	<CAP9ODKrBnzOM7rfhRr5KC-L_EjuwZ73NkpHcyg1hiOxKXD+6Rg@mail.gmail.com>
	<E5F016E0-45BD-4F23-8B53-01E45EB25AFB@dominion.thruhere.net>
	<CAP9ODKo3gqTjcYwnZuNJ9yq6G_CYh54A8JtngBA78hyREURTqw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlQ7J0CX0RVGtXwsKQkcUN3s0MeebZGrXF0hzWslG2LEJG+MAH19bdEducrpOi0rjsjdVty
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 13:53:33 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 jul. 2012, om 15:34 heeft Otavio Salvador het volgende geschreven:

> On Mon, Jul 16, 2012 at 10:22 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>> =46rom what I read, those are backports; so you can use Backport
>>> [applied in version X.Y]
>>=20
>> No, they were pulled of the powertop mailinglist and git-am'ed :)
>=20
> So it is pending.

If a response from the maintainer saying "rejected" means "pending", =
then yes.=


