Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1907072C1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:21:53 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id q108so15965257qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 03:21:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Nn//AdMc6E3tx91hdVZWDtglVYVLe3o5IDHk7nX5rKA=;
	b=XSuK1lqxWsiKuTpBeWhTGIWFt3nfYYYLgdr9+KO6dqLkNgWJ0AoUsU5ia8mTNf9DtH
	mEXNGzEig0KH+7YpZVg0M3eclViunPnjrkRQJ6uFK9Um+dPcUszVYeukt2bn7hLj2o7w
	//L9O1kEAJcT7uJeQWHWJB1yPXnx2cqYHVsvu97cpuGELghpU6eZrsQYPF5LU3cji+xe
	z+ruzIQEKj5bBGVy5wAfUI9XvxNpA7iHHm3v1SwcJmRPpxwwZyYS3ShdOSKQMeLlbk4/
	atmCWoEpZ9PsOxfcSENvCcj8BHbO6SsSL1fl4Q9UbheLEUInZpbThLObfxsin1sW+ouk
	yOwA==
X-Gm-Message-State: ALoCoQk2XKJYdsD5ypRfnq6BAH+U+71SQJ/g+Sk8F7/SO66HExS9V8bJb0ooxj3ooSsyuwhXjyHn
X-Received: by 10.140.94.195 with SMTP id g61mr46008124qge.80.1421839314568;
	Wed, 21 Jan 2015 03:21:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 21 Jan 2015 03:21:34 -0800 (PST)
In-Reply-To: <CACS+7ZTyJyWJZeuNuWzSvTX=EeffZMMZ4krZ=nF2fVLDPbKVyw@mail.gmail.com>
References: <CACS+7ZTyJyWJZeuNuWzSvTX=EeffZMMZ4krZ=nF2fVLDPbKVyw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Jan 2015 11:21:34 +0000
Message-ID: <CAJTo0LZh=THzGds8cL+-m=cNL35wPBtSXH0v+FCiuXkYaTHu=g@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] packagegroup-core-sdk: add gcc-sanitizers to core SDK
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
X-List-Received-Date: Wed, 21 Jan 2015 11:22:02 -0000
Content-Type: multipart/alternative; boundary=001a113a59ee45ddd3050d27c36f

--001a113a59ee45ddd3050d27c36f
Content-Type: text/plain; charset=UTF-8

On 15 January 2015 at 03:51, Dan McGregor <danismostlikely@gmail.com> wrote:

> -PR = "r9"
> +PR = "r10"
>

Note that there's no need to bump PR anymore.  I've fixed this locally so
don't bother sending an update right now.

Ross

--001a113a59ee45ddd3050d27c36f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 January 2015 at 03:51, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"=
mailto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3h8"=
 class=3D"a3s" style=3D"overflow:hidden">-PR =3D &quot;r9&quot;<br>
+PR =3D &quot;r10&quot;</div></blockquote></div><br>Note that there&#39;s n=
o need to bump PR anymore.=C2=A0 I&#39;ve fixed this locally so don&#39;t b=
other sending an update right now.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113a59ee45ddd3050d27c36f--
