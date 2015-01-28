Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5D55172608
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 13:09:07 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id j7so16049928qaq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 05:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ExDPEN8OUZg9GUaT/ChvywXWZ3tTiTgrF78J6bED//M=;
	b=BpI1qys1jpTmuzQuOd92bEZ6OgON4ZKDbzMYKoHhxrQE4fVBiaMDYN75bkFoCalR8i
	cVdvzXCUY8NZAjT6GLt/XXF/NT80+0RmA6YU6BzaqNd/h+iIBJXh7Q0Tpj+rZ3bpO+jY
	hIfFDHaK4YT4mreaO04t3qSs7fiJp9Drlew+mfokPv9KubBU9GW1HC06q5e3ujIXHMJt
	8ZTZaf575yRKc/T3dUV0ONhg3x+gHM9efH7ejHk8ukoMXCctpEfSGZJQ5qy4/s9tWCSb
	Z2JnaUmCMy42AVfmwxjgLMON5mbXerUk1nHEwtu7WE9X7AI1ngcrCrz8lgl7oYtYhvFn
	Z9tg==
X-Gm-Message-State: ALoCoQlelSlBdOe5j0LupA2MU50+KKNSn0i+ljqaijhJfZfWBEM5HO7cscyrUK5Ppy9warpXI/+L
X-Received: by 10.224.24.132 with SMTP id v4mr12968645qab.17.1422450547782;
	Wed, 28 Jan 2015 05:09:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Wed, 28 Jan 2015 05:08:47 -0800 (PST)
In-Reply-To: <20150128124700.GH2477@jama>
References: <1422448867-9744-1-git-send-email-ross.burton@intel.com>
	<20150128124700.GH2477@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Jan 2015 13:08:47 +0000
Message-ID: <CAJTo0LZ4juxHbqBcSAjiPcm2htxXi=iLwWKuEOwJxk-gQbW75A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security_flags: disable PIE on expect
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
X-List-Received-Date: Wed, 28 Jan 2015 13:09:16 -0000
Content-Type: multipart/alternative; boundary=001a11c2b49e9cb64d050db6139e

--001a11c2b49e9cb64d050db6139e
Content-Type: text/plain; charset=UTF-8

On 28 January 2015 at 12:47, Martin Jansa <martin.jansa@gmail.com> wrote:

> And flac doesn't need it anymore?
>

Whoops, thanks!

Ross

--001a11c2b49e9cb64d050db6139e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 January 2015 at 12:47, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ye" class=
=3D"a3s" style=3D"overflow:hidden">And flac doesn&#39;t need it anymore?</d=
iv></blockquote><div><br></div><div>Whoops, thanks!</div><div><br></div><di=
v>Ross=C2=A0</div></div></div></div>

--001a11c2b49e9cb64d050db6139e--
