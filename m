Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id BDA02731C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:53:03 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id i68so62342671uad.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 06:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KWuBA5Mg+ZgFESDzjy/rw6gFDhq+c3oqrUEI1GF2Qec=;
	b=TiaHJ/hMURNPrmbGqV3aPyFEATPQke7SggM0uIUk0Vs7HP8NH2j1QeTqTpK8wZaDAW
	Y5JEvXLEVnSoqWN58ss5tWuao/UlpEEoXhvL8rLuCc3+afxQKXQqi1BRJkWKNiNFt69c
	ZKbOyn5dwfylbQYCSh4Mxg7Q+AX9K8ImFr+yL2IjUKaiMWhyVjZ2pcHRNKwHvVOc1kLE
	yGO6f9GOKu+dhPu+sH3nCEeH0k++D3sb17/CSvcItQixXWzXbEEogwkoe++v9JFVQWW8
	g1KwgOktSrdQ6whjBn8ULQVyEUVXtPwQABrpNb1cfnHcbMaCh4zsRTYWmiI95axLG2v/
	JRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KWuBA5Mg+ZgFESDzjy/rw6gFDhq+c3oqrUEI1GF2Qec=;
	b=SAr6FU+WYVF2JwtuHwyOQ5UqwYPhWlT0uHRxJ1XVRYTCXeDP8IreLfRFJ5ALMvWF0D
	kJEcKIv7FDYDW4eBGV421a81SNrDp27NaZ10phhm1vA0GZDJ8khqD6lrxbgG1XtZSzNd
	pIPx52LlcBARibWTbhdYdF+2VLvCEQI6pLyPGvhem8wxyDEzY4u1nSfEPoVGZQN+RJ3C
	cfv1uN609BxaEjxXs0V07nO0mbTtlJGI7aCgwrJUaGcbkmgNji4/5ERkdkqijxJ4JjRm
	DPz9d4yYv92y00t+wLi4gkwupuPSE2P8PW0NXzoJ3HWb0w0D9qF7RC04fspbduuR6qRy
	6n/g==
X-Gm-Message-State: AIkVDXJM4/zA7kE7zQf89QyV8Y5CfTs21Tasn8A2LjcTunZxD54ivFLvTMxY1VLlNN6t/vwIZ6GZ9TbO32wSJQ==
X-Received: by 10.176.91.155 with SMTP id y27mr8333285uae.151.1484923984113;
	Fri, 20 Jan 2017 06:53:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.159.149 with HTTP; Fri, 20 Jan 2017 06:53:03 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1701200648260.13268@uk63952.mitel.com>
References: <alpine.LFD.2.20.1612201321490.5281@localhost.localdomain>
	<CAJTo0LbWx_xHVAL9O9xVRybW8tZY9a0uDVVArOMzfB1s5R0qwg@mail.gmail.com>
	<alpine.LFD.2.20.1701200648260.13268@uk63952.mitel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 20 Jan 2017 06:53:03 -0800
Message-ID: <CANx9H-CJSSWta6gZaeQ_6hHh3WP1VeDFN5hCzW8tPmk7GJbB1g@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: $50 bounty for an OE recipe for libfilesys-smbclient-perl. seriously.
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
X-List-Received-Date: Fri, 20 Jan 2017 14:53:05 -0000
Content-Type: multipart/alternative; boundary=f403045f8ec8977567054687cee3

--f403045f8ec8977567054687cee3
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 20, 2017 at 3:52 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   the earlier note from ross i had totally forgotten about ...
>
> On Tue, 20 Dec 2016, Burton, Ross wrote:
>
> > FWIW I had a quick look at this.  I'm certainly no perl guru and can
> > barely understand it, but it does *so much* wrong that if you really
> > need this then it would be easier to just rewrite the makefile.pl
> > from scratch.  Once you remove the hunting for the headers in the
> > wrong place, it then invokes an autoconf script...  which needs to
> > be passed the right options.
> >
> > Do you really need this module?  It's not been updated for many
> > years, so surely there's something better.
>
>   and that's the question ... is there something better? is there not
> a single person who needs this feature in their OE/YP build? perhaps
> not. maybe i really do need to hire a contractor to take care of this.
>
>
In my mind the question is deeper than that. The question is "is there not
a single person who needs this feature in perl?". The upstream is the
problem. It is just not ready to cross-compile.

--Tim

> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f8ec8977567054687cee3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jan 20, 2017 at 3:52 AM, Robert P. J. Day <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcou=
rse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 the earlier note from ross i had totally forgotten about ...<br>
<span class=3D""><br>
On Tue, 20 Dec 2016, Burton, Ross wrote:<br>
<br>
</span><span class=3D"">&gt; FWIW I had a quick look at this.=C2=A0 I&#39;m=
 certainly no perl guru and can<br>
&gt; barely understand it, but it does *so much* wrong that if you really<b=
r>
&gt; need this then it would be easier to just rewrite the <a href=3D"http:=
//makefile.pl" rel=3D"noreferrer" target=3D"_blank">makefile.pl</a><br>
&gt; from scratch.=C2=A0 Once you remove the hunting for the headers in the=
<br>
&gt; wrong place, it then invokes an autoconf script...=C2=A0 which needs t=
o<br>
&gt; be passed the right options.<br>
&gt;<br>
&gt; Do you really need this module?=C2=A0 It&#39;s not been updated for ma=
ny<br>
&gt; years, so surely there&#39;s something better.<br>
<br>
</span>=C2=A0 and that&#39;s the question ... is there something better? is=
 there not<br>
a single person who needs this feature in their OE/YP build? perhaps<br>
not. maybe i really do need to hire a contractor to take care of this.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>In my mind the question is deeper than that. The question is =
&quot;is there not</div><div>a single person who needs this feature in perl=
?&quot;. The upstream is the</div><div>problem. It is just not ready to cro=
ss-compile.</div><div><br></div><div>--Tim=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/<wbr>rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--f403045f8ec8977567054687cee3--
