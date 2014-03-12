Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 70D0B6F7AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 15:07:18 +0000 (UTC)
Received: by mail-yk0-f171.google.com with SMTP id q9so27393807ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=sjz7RS3nM+BlD8ZpwPtJ3lf2NP7bVEhyHTgjg3tbilM=;
	b=KLR9PekMoYDlWhD3bF8cYR/YgSrgOHhj7v8zm0Bb9VCM+mh17JC9pCI2paisMa+cet
	WSjflruGscBlGmAK9TkN/7UJsuHwtcOpP4iII/wqf0wHpaomaarKdGNHsAWFURUBg+qv
	9gQwwP8uXo3xxcMq3t1C9gzdIfPDoEBiXblbDOdKLPA/dAakwLLz0eg0l6vG7IvYVLzn
	dv81pUDP3SX2hvoKAa9PqeRngCyz5SgJwWdmZQA2j3BdAIuTCjB/W8iSyBrgN6DaGqqO
	rJROSBm3UzsqYQM8NRgLpNbMC2yVcvv0OZZ2byL4T4H8kTruB4eQWl1QR2xJf/Trv0th
	gjKg==
MIME-Version: 1.0
X-Received: by 10.236.40.12 with SMTP id e12mr1657843yhb.155.1394636839740;
	Wed, 12 Mar 2014 08:07:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Wed, 12 Mar 2014 08:07:19 -0700 (PDT)
In-Reply-To: <1394617444-15843-1-git-send-email-s.mennetrier@innotis.org>
References: <1394617444-15843-1-git-send-email-s.mennetrier@innotis.org>
Date: Wed, 12 Mar 2014 12:07:19 -0300
X-Google-Sender-Auth: 3DfEp7Hh_Xo7LpbqC7dHOeOvi2g
Message-ID: <CAP9ODKoB4nmMhpbveVhDavAVQRDdhJ1buYMBn_TYC==4gU-77w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?ISO-8859-1?Q?S=E9bastien_Mennetrier?= <s.mennetrier@innotis.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Create gstreamer-1.0 package groups
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
X-List-Received-Date: Wed, 12 Mar 2014 15:07:22 -0000
Content-Type: multipart/alternative; boundary=001a113676346c805204f46a3168

--001a113676346c805204f46a3168
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 12, 2014 at 6:44 AM, S=E9bastien Mennetrier <
s.mennetrier@innotis.org> wrote:

> This recipe is based on gst-meta-base
>
> Signed-off-by: S=E9bastien Mennetrier <s.mennetrier@innotis.org>
>


I think you ought to use a better commit log (as this is not a packagegroup
at all) or change it to be a package group. Either way works for me :)

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a113676346c805204f46a3168
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Mar 12, 2014 at 6:44 AM, S=E9bastien Mennetrier <span dir=
=3D"ltr">&lt;<a href=3D"mailto:s.mennetrier@innotis.org" target=3D"_blank">=
s.mennetrier@innotis.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This recipe is based on gst-meta-base<br>
<br>
Signed-off-by: S=E9bastien Mennetrier &lt;<a href=3D"mailto:s.mennetrier@in=
notis.org">s.mennetrier@innotis.org</a>&gt;<br></blockquote><div><br></div>=
<div><br></div><div>I think you ought to use a better commit log (as this i=
s not a packagegroup at all) or change it to be a package group. Either way=
 works for me :)</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
<span>Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D=
"gc-number-5" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 (347=
) 903-9750</span></span><br>
</div></div>

--001a113676346c805204f46a3168--
