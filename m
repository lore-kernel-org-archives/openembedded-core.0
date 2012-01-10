Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rkhnw-0001Hb-Kn
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:56:22 +0100
Received: by lami14 with SMTP id i14so2106143lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 11:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=89o9Pn3YI1RvEpvLBvLF6Mkqz1HqOdNUG+pJTu2yUdM=;
	b=S9AeumdQO1cXVv5SdGQOoTqX6v+yUseye7xYhJCkQLTeMlA5xDjIK5ZZ983MrEdZMc
	N1uwKMj1PvBazYjdl8t1svA/GLxd92ifdFLY7oUsSDbmbSedmlbtYZ07JDpaar6GnvYU
	ifobNvF8VARk9egUcUxuO0acQDJs6uRlnEWoQ=
MIME-Version: 1.0
Received: by 10.152.148.227 with SMTP id tv3mr9366890lab.15.1326224931557;
	Tue, 10 Jan 2012 11:48:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.54.104 with HTTP; Tue, 10 Jan 2012 11:48:51 -0800 (PST)
In-Reply-To: <4F0C9558.9060804@linux.intel.com>
References: <cover.1326216024.git.josh@linux.intel.com>
	<CAP9ODKp+uLq9w3vJcp0Bdk8UiNh0A_cjNAkuCGZyVFWxV+YLcQ@mail.gmail.com>
	<4F0C9558.9060804@linux.intel.com>
Date: Tue, 10 Jan 2012 17:48:51 -0200
X-Google-Sender-Auth: ZPJOQDgHHQNCc-hy_mhjHGpLAdw
Message-ID: <CAP9ODKrSKJvkisnR=ZY+dXhQ5VTPeC8Njp-Ac=t3510NqryB=w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Add alsa-state from OE Classic v2
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
X-List-Received-Date: Tue, 10 Jan 2012 19:56:22 -0000
Content-Type: multipart/alternative; boundary=e89a8f22c691f0104e04b631cd21

--e89a8f22c691f0104e04b631cd21
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 10, 2012 at 17:45, Joshua Lock <josh@linux.intel.com> wrote:

> On 10/01/12 11:34, Otavio Salvador wrote:
>
>> If you're on the mood please also prepare a patch for meta-oe to add
>> support to systemd. It ought to be quite trivial to add and allow for
>> easy use for people using systemd based images.
>>
>
> I haven't done *anything* with systemd yet but I'd like to check it out so
> I'll add this to my list.
>
> Expect it to take a few days.


If you need some help, ping me.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8f22c691f0104e04b631cd21
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 10, 2012 at 17:45, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 10/01/12 11:34, Otavio Salvador wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">If you&#39;re on the=
 mood please also prepare a patch for meta-oe to add</div><div class=3D"im"=
>
support to systemd. It ought to be quite trivial to add and allow for<br>
easy use for people using systemd based images.<br>
</div></blockquote>
<br>
I haven&#39;t done *anything* with systemd yet but I&#39;d like to check it=
 out so I&#39;ll add this to my list.<br>
<br>
Expect it to take a few days.</blockquote><div><br></div><div>If you need s=
ome help, ping me.=A0</div></div><div><br></div>-- <br>Otavio Salvador=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-ma=
il: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@oss=
ystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_bla=
nk">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8f22c691f0104e04b631cd21--
