Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RE0jZ-0004Dc-JO; Wed, 12 Oct 2011 17:28:41 +0200
Received: by qyk4 with SMTP id 4so175671qyk.6
	for <multiple recipients>; Wed, 12 Oct 2011 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=6ZWEd2Fxbdt1nqQrp5yPhoAWQWfoJ5uESB55ZaJOLLk=;
	b=mm7P80SonnAQJejfheONy4EpSEMj1XrQUOmLgeFWmOMOQd6gOtXrlxDtJAcQU8c+cz
	BRY/sLc1SERVnhuFmeqcZaW0WWRsZRWJ7Agb7eQfS1P9mrA0L/Tzx7t6edhBGNEdEWyz
	ZvG5bcQ3J2aU7fBRHryRU3OZxYDxHDYrzikzA=
Received: by 10.68.8.195 with SMTP id t3mr1807836pba.107.1318432978116; Wed,
	12 Oct 2011 08:22:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.58.168 with HTTP; Wed, 12 Oct 2011 08:22:28 -0700 (PDT)
In-Reply-To: <6C40DE44-FE7C-4C0A-AB7F-1B78CE95216F@dominion.thruhere.net>
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
	<j73ifb$3kl$1@dough.gmane.org>
	<CAMKF1srHT5uh5a=z=mt0kOpF2YO9YyKkEdkRK9ZT8=LaGY6JSA@mail.gmail.com>
	<6C40DE44-FE7C-4C0A-AB7F-1B78CE95216F@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2011 08:22:28 -0700
Message-ID: <CAMKF1srW_j_H1EKJvs9LMOcFeXauLbK5_9W7jcr2RjTtN5OeQQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] git server move
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
X-List-Received-Date: Wed, 12 Oct 2011 15:28:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2011 at 8:18 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 12 okt. 2011, om 17:16 heeft Khem Raj het volgende geschreven:
>
>> On Wed, Oct 12, 2011 at 1:17 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> Op 11-10-11 21:11, Cliff Brake schreef:
>>>> Hi, we are moving git.openembedded.org to a new server.
>>>>
>>>> SSH access on the old server has been disabled. =C2=A0git:// still wor=
ks
>>>> there.
>>>>
>>>> As soon as DNS propagates, SSH access will work with the new server.
>>>>
>>>> Let me know if you see any problems.
>>>
>>> When will cgit be back up?
>>
>> It should be up already. Do Ctrl+f5 in your browser on git.openembedded.=
org
>
> Let me rephrase: when will it be working again? I still get "No repositor=
ies found" when clicking on a repo.

Weird I see all the repos fine.
>
>>
>>> -----BEGIN PGP SIGNATURE-----
>>> Version: GnuPG v1.4.5 (Darwin)
>>> Comment: GPGTools - http://gpgtools.org
>>>
>>> iD8DBQFOlU0rMkyGM64RGpERArroAJ9EuHaOEcv64o9q9kJLZk50/OLoSQCgmKjd
>>> Yxh2H5CGKREmOq32gr36aes=3D
>>> =3DXubc
>>> -----END PGP SIGNATURE-----
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


