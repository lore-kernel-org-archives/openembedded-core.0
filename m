Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id EB2A97E730
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 07:38:05 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id p26so20147643edr.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 00:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=A0MJUn6pYzzrfE0PBx1XVOO0ckmJr7Wj7G/y2TeoBk8=;
	b=CB74qxVRM9zl/lLFjob/qqQuGNpu/twPbSMN/ZPNN+WIjFl1LotGyoataQmuPJrwoo
	+uKTCBdN6ofBadz5/qxrjtnS0+eLopDKuxfZkB868mRTGElap9oVRNZYjItKgKEWJv6s
	It/rUdqGijSmchAktLsRQvF00AqGyLbBALrAZBEXbKuP2gY97e2ET8HMhDASGr2IDuEY
	z4taPseEcrvvW5DUr1ub6KdilqHRqXJ0pcz/+gP0ldmokHrj7fxML8UCYcTxvVN9xix9
	g8QDZXhOFEAFOA6xnzUGIApqNl/k86BrgTEFIoZatdfVYnAhFLN5TM6Mw7Q5rer5zJhY
	hh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=A0MJUn6pYzzrfE0PBx1XVOO0ckmJr7Wj7G/y2TeoBk8=;
	b=VR1qzVFjGVjozLWaDPvhMY5cyY/GfFqKh383aCwX1gJySJZCzosO/Roj+BalbJSKNW
	3EAkuwSbCZnNBVUBuQGfdRbTnTVspvnV3BmRv9RteFJpVhmkdZvnB3ckOlWLhUnbz0Hm
	MqG/tDNcD8b7z31c9Bjthjefkv4WDNVeZzf3qeeBcK3SmNhb0hNqvGhJbROPYygdGa/J
	3fo0LlGCC8Mif7igWy3odVSI76VOHo1imvTBd4fNxAMPbamUmbrJsb6yCKJT5CvwS2dP
	HrabixE5FXZiENlaiEKerX5H2QsOCDbR1rYSQbres3+QrEYAGd/Ld3laAS5GI0xDnRT3
	OnKw==
X-Gm-Message-State: APjAAAXyqOqtd1j5c6juWZod3CLLt/TTVCSUk6URdc6SJOWqWhK00Me4
	K/flwmHe/qR3wulp8VkP4O6toJ+baFf/eu8ST4U=
X-Google-Smtp-Source: APXvYqwLVey99SD6GIkdYby7lLHV6OhwbgM0vwkXu4//uH/yIbLfT7V672lC2VlOYYSwPSvs5eZ0WbgU7y7eOgQrJI0=
X-Received: by 2002:a17:906:a59:: with SMTP id
	x25mr25587537ejf.293.1560325086579; 
	Wed, 12 Jun 2019 00:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190611200158.GA1858@jama>
	<779149c6-f205-2730-7af6-be69819b478f@windriver.com>
In-Reply-To: <779149c6-f205-2730-7af6-be69819b478f@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Jun 2019 09:37:57 +0200
Message-ID: <CA+chaQc1s5jq7uBwZ0Px=wyr2wnHMBBEEi3D00BOLed7v-vZrw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-openembedded git repo in some of the openembedded-core-contrib branches
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
X-List-Received-Date: Wed, 12 Jun 2019 07:38:06 -0000
Content-Type: multipart/alternative; boundary="00000000000085132e058b1b7e12"

--00000000000085132e058b1b7e12
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Wed, Jun 12, 2019 at 3:35 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:

> On 6/12/19 4:01 AM, Martin Jansa wrote:
> > Hi,
> >
> > when accidentally checking for some old meta-oe commit in oe-core
> > repository I was surprised that it was found in some of the contrib
> > branches:
>
> Sorry for the mistake
>
> > ~/openembedded-core $ git branch -a --contains 30bbde3d09e
> >    remotes/contrib/hongxu/add-recipes-20190215
> >    remotes/contrib/hongxu/dbg-split
> >    remotes/contrib/hongxu/misc-fixes
> >
> > These branches are actually from meta-oe repo, not oe-core.
> >
> > Please remove old irrelevant branches from -contrib repositories:
> > https://git.openembedded.org/openembedded-core-contrib/
> > https://git.openembedded.org/meta-openembedded-contrib/
> >
> > and make sure you're pushing to the right remote :), it unnecessary
> > almost doubles the repo size.
>
> I 've already cleaned them up on openembedded-core
>
> //Hongxu
>
> > Cheers,
>
>
>

--00000000000085132e058b1b7e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks!=C2=A0<br></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 12, 2019 at 3:35 AM Hongxu Ji=
a &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n 6/12/19 4:01 AM, Martin Jansa wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; when accidentally checking for some old meta-oe commit in oe-core<br>
&gt; repository I was surprised that it was found in some of the contrib<br=
>
&gt; branches:<br>
<br>
Sorry for the mistake<br>
<br>
&gt; ~/openembedded-core $ git branch -a --contains 30bbde3d09e<br>
&gt;=C2=A0 =C2=A0 remotes/contrib/hongxu/add-recipes-20190215<br>
&gt;=C2=A0 =C2=A0 remotes/contrib/hongxu/dbg-split<br>
&gt;=C2=A0 =C2=A0 remotes/contrib/hongxu/misc-fixes<br>
&gt;<br>
&gt; These branches are actually from meta-oe repo, not oe-core.<br>
&gt;<br>
&gt; Please remove old irrelevant branches from -contrib repositories:<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core-contrib/" re=
l=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedde=
d-core-contrib/</a><br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/" re=
l=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openem=
bedded-contrib/</a><br>
&gt;<br>
&gt; and make sure you&#39;re pushing to the right remote :), it unnecessar=
y<br>
&gt; almost doubles the repo size.<br>
<br>
I &#39;ve already cleaned them up on openembedded-core<br>
<br>
//Hongxu<br>
<br>
&gt; Cheers,<br>
<br>
<br>
</blockquote></div>

--00000000000085132e058b1b7e12--
