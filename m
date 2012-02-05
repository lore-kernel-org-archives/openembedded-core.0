Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RuBZZ-00044Y-Jl; Mon, 06 Feb 2012 00:32:41 +0100
Received: by lahc1 with SMTP id c1so2631779lah.6
	for <multiple recipients>; Sun, 05 Feb 2012 15:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=MT2y9g/VLOaFkyna9+GT1cKb624/YSbnWuk3uIYPq9o=;
	b=Eb7+6KcBAuql3JUeGKwSmxuc9rCMVkgiXeT8SLx4uuvwVoCpeI3FGfhhqjgWn+IkCw
	PAPmuNsqHBTU3FGOaChyyTACW6bAI0denWVnVCPH8t9zfLKFFkRPGfDM6RyngH42i0l3
	wHmhuN39oeHxD4VoloJ6n+SFX83+gVDKNHU0k=
Received: by 10.152.123.68 with SMTP id ly4mr2802643lab.13.1328484280254; Sun,
	05 Feb 2012 15:24:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sun, 5 Feb 2012 15:24:10 -0800 (PST)
In-Reply-To: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
References: <CALbNGRSc52k3sqGsh+T93ex2X2+62DCoVq8RB4dk-Ooy-j3qRg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Feb 2012 15:24:10 -0800
Message-ID: <CAMKF1spvxgnEb39qe1scw2k7Vqk--oSdVO18wcK3RFc5kqTqag@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: do rootfs does not create log files
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
X-List-Received-Date: Sun, 05 Feb 2012 23:32:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 5, 2012 at 2:16 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Hi,
>
> is it a bug or a feature that do_rootfs does not create the package
> information (packed_files / packages ..) in a deploy sub-folder did I
> miss a switch for this?
>

which files to be sure ?

> Thanks in advance
>
> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


