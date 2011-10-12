Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>)
	id 1RE0tf-0004ap-0T; Wed, 12 Oct 2011 17:39:07 +0200
Received: by wwf27 with SMTP id 27so184388wwf.24
	for <multiple recipients>; Wed, 12 Oct 2011 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=AfE8I/OcJzUpv7mXelpfy2O4sVEuewdab2REYgmgscI=;
	b=E2syyjexIYrfoJS9yw0OMXR4hbOzY4rHMHwn49R13OLQQSxej3zRaLunLSa7arZNQB
	e+ScpAS5VOMZEFDeG4vNWzi3/kr5ONxKby9ltRG+yBiB6heufjGYiFTk2qtj/5kMS0XE
	f7SwF9C9H/rqj/Y8/LFzIZwpKZktVfX9i6sNo=
Received: by 10.216.159.4 with SMTP id r4mr2689550wek.9.1318433401221; Wed, 12
	Oct 2011 08:30:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Wed, 12 Oct 2011 08:25:46 -0700 (PDT)
In-Reply-To: <CAMKF1srW_j_H1EKJvs9LMOcFeXauLbK5_9W7jcr2RjTtN5OeQQ@mail.gmail.com>
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>
	<j73ifb$3kl$1@dough.gmane.org>
	<CAMKF1srHT5uh5a=z=mt0kOpF2YO9YyKkEdkRK9ZT8=LaGY6JSA@mail.gmail.com>
	<6C40DE44-FE7C-4C0A-AB7F-1B78CE95216F@dominion.thruhere.net>
	<CAMKF1srW_j_H1EKJvs9LMOcFeXauLbK5_9W7jcr2RjTtN5OeQQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 12 Oct 2011 08:25:46 -0700
X-Google-Sender-Auth: rKDf-c3QI5FOPqs9KN-8UKmDmaY
Message-ID: <CABcZANnaPSrgGSsKuXW6jEXZ98+-kQohRd4r4uSq+spWfSNTOg@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2011 15:39:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2011 at 8:22 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Oct 12, 2011 at 8:18 AM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>>
>> Op 12 okt. 2011, om 17:16 heeft Khem Raj het volgende geschreven:
>>
>>> On Wed, Oct 12, 2011 at 1:17 AM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>> Hash: SHA1
>>>>
>>>> Op 11-10-11 21:11, Cliff Brake schreef:
>>>>> Hi, we are moving git.openembedded.org to a new server.
>>>>>
>>>>> SSH access on the old server has been disabled. =C2=A0git:// still wo=
rks
>>>>> there.
>>>>>
>>>>> As soon as DNS propagates, SSH access will work with the new server.
>>>>>
>>>>> Let me know if you see any problems.
>>>>
>>>> When will cgit be back up?
>>>
>>> It should be up already. Do Ctrl+f5 in your browser on git.openembedded=
.org
>>
>> Let me rephrase: when will it be working again? I still get "No reposito=
ries found" when clicking on a repo.
>
> Weird I see all the repos fine.

Works here too.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


