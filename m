Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZigH-000563-SZ
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 15:11:18 +0200
Received: by eaal1 with SMTP id l1so1736601eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=aIOKNXgk5/nOqjedyueRJ2XmQ5cpc43RUGn7KHveIRk=;
	b=bLxqos0R5SZZdceh0KC0GJ/YhoEjqWf9sOBme/F8HqcmeH/hppQHMZTIiweSQZadIu
	xgoZmDAO+qZ+03nwmHnO6FWi7HJ68ULpU2KcaH58kQCsnx6aeGRhNF7bkxUOMBt9U/I3
	wjgMg6zs4XoTI5KWeXQt5lstIh+xdIPhZDK77UFSN9FIDXj7CsmnlgTNZeLlcCH04jlD
	bWusiha79IGIU9qt0ze2uLpWTQDhKgtfUHOoY6xBUKD+T8bSafp57dL4G1PN8p2ylgLe
	zpLTMcFqiHbCFl5hIfdl+ekA4/zXqpC7zYltvBCJyrigUwpRKvCaYGWlMCJDKkBNXE8v
	4a/Q==
MIME-Version: 1.0
Received: by 10.14.39.70 with SMTP id c46mr6743819eeb.118.1338382858020; Wed,
	30 May 2012 06:00:58 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 06:00:57 -0700 (PDT)
In-Reply-To: <CAJTo0LYe1y0r-VhGqsZ1ejfhN39Awd61Zq6yGk0Bf=VN+zJrHA@mail.gmail.com>
References: <cover.1338323483.git.ross.burton@intel.com>
	<e50f2bf59b64accf580fc2df96e1fbc9eb6cfb98.1338323483.git.ross.burton@intel.com>
	<CAMKF1so_=OjU2OcoVYO=B5g2KzYAgtY4aA4gNr_cv09YFcxbeQ@mail.gmail.com>
	<CAJTo0LYe1y0r-VhGqsZ1ejfhN39Awd61Zq6yGk0Bf=VN+zJrHA@mail.gmail.com>
Date: Wed, 30 May 2012 06:00:57 -0700
Message-ID: <CAMKF1sp2kUL-w==UiXT4SmykAcoN5j93vFxSF2-EmBs9mjWcjA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] connman: just give xuser the extra rights it needs
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
X-List-Received-Date: Wed, 30 May 2012 13:11:18 -0000
Content-Type: multipart/alternative; boundary=bcaec52be8f3d3691404c1408a7f

--bcaec52be8f3d3691404c1408a7f
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 30, 2012, Burton, Ross wrote:

> On 30 May 2012 03:59, Khem Raj <raj.khem@gmail.com <javascript:;>> wrote:
> > On Tue, May 29, 2012 at 1:43 PM, Ross Burton <ross.burton@intel.com<javascript:;>>
> wrote:
> >>
> >>
> >> -Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com <javascript:;>>
> >> +Signed-off-by: Ross Burton <ross.burton@intel.com <javascript:;>>
> >
> > why remove the old sign-off ?
>
> The patches are semantically different - Dongxiao's solution was to
> copy the root rules, my solution is to copy the at_console rules.  He
> didn't sign off my solution, so I removed his sign-off.
>
> You could have created a new patch and deleted the old then for clarity


> Ross
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec52be8f3d3691404c1408a7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 30, 2012, Burton, Ross  wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On 30 May 2012 03:59, Khem Raj &lt;<a href=3D"javascript:;"=
 onclick=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.kh=
em@gmail.com</a>&gt; wrote:<br>

&gt; On Tue, May 29, 2012 at 1:43 PM, Ross Burton &lt;<a href=3D"javascript=
:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;ross.burton@intel.com&#39;)">=
ross.burton@intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -Signed-off-by: Dongxiao Xu &lt;<a href=3D"javascript:;" onclick=
=3D"_e(event, &#39;cvml&#39;, &#39;dongxiao.xu@intel.com&#39;)">dongxiao.xu=
@intel.com</a>&gt;<br>
&gt;&gt; +Signed-off-by: Ross Burton &lt;<a href=3D"javascript:;" onclick=
=3D"_e(event, &#39;cvml&#39;, &#39;ross.burton@intel.com&#39;)">ross.burton=
@intel.com</a>&gt;<br>
&gt;<br>
&gt; why remove the old sign-off ?<br>
<br>
The patches are semantically different - Dongxiao&#39;s solution was to<br>
copy the root rules, my solution is to copy the at_console rules. =C2=A0He<=
br>
didn&#39;t sign off my solution, so I removed his sign-off.<br>
<br></blockquote><div>You could have created a new patch and deleted the ol=
d then for clarity</div><div>=C2=A0<span></span></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

Ross<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote>

--bcaec52be8f3d3691404c1408a7f--
