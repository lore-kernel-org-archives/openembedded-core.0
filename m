Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id E546D6E362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 11:51:15 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id g12so1060447oah.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 03:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=L1qJaiLtXG3JfYy9fa0zIOmiDu+WdeXQIjbOm/9aS4k=;
	b=tT9WSe6Zx9i3b/XSmLNXUZQn5ZdoJgO+GHMFo14iXrW7e8YZ5v3tZtjkRWE+xX/ZKx
	RTyxFt5Or1LIY2PMD0OgowVDRwqtWuL31YbIMbA7q1V8JO+XAasqZQqk5KE2UHaaOlnX
	EnHlNRaVmZKF8NdkxiM54wSaNo1w+BQPxsJhKNgRC1Iqm5Yy2yg2MMMHGUKYl1sGy1kG
	vVwOqad1Kfeh2EfC6yXv6cyRElrSNN3wcnXCFcZWc2rL0Tq5yPYqwRW4PyuTw5NdLmDI
	RsnStcfksv0tTGGvfkEdl9XlNfW71OVlB+Yie3Nv6kRAGpXR5RMbgUe25m/ApfZmNl/j
	YEzQ==
MIME-Version: 1.0
X-Received: by 10.182.241.8 with SMTP id we8mr1129034obc.62.1389786676860;
	Wed, 15 Jan 2014 03:51:16 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 15 Jan 2014 03:51:16 -0800 (PST)
In-Reply-To: <CAP9ODKoL7vgZAk_k20AdHZyeohdDjqjGm4gYJqGepXMONkJUCQ@mail.gmail.com>
References: <cover.1389769773.git.Qi.Chen@windriver.com>
	<4975a4727b07aa321bb8d19429efc0796a115ecc.1389769773.git.Qi.Chen@windriver.com>
	<CAP9ODKoL7vgZAk_k20AdHZyeohdDjqjGm4gYJqGepXMONkJUCQ@mail.gmail.com>
Date: Wed, 15 Jan 2014 09:51:16 -0200
X-Google-Sender-Auth: HXnNyINeIARS5c0SCEBXvtsq0GU
Message-ID: <CAP9ODKrpaUoUP9obJ9vYXoyHboTManEMEw1zRtxL+5TD=_Wjwg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] shutdown-desktop: use poweroff for the Exec field in the shutdown.desktop
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
X-List-Received-Date: Wed, 15 Jan 2014 11:51:16 -0000
Content-Type: multipart/alternative; boundary=001a11c322c0301ce004f000ed27

--001a11c322c0301ce004f000ed27
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 15, 2014 at 9:38 AM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> RB_HATL_SYSTEM


typo in the commit log :) (Spot by Mario)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c322c0301ce004f000ed27
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 15, 2014 at 9:38 AM, Otavio Salvador <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.c=
om.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">RB_HATL_SYSTEM</blockquote></div><br>typo in=
 the commit log :) (Spot by Mario)<br><br clear=3D"all"><div><br></div>-- <=
br>
Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S=
. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http=
://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://code.ossystems=
.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--001a11c322c0301ce004f000ed27--
