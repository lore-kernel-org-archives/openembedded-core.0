Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9C442757EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 15:21:23 +0000 (UTC)
Received: by qkx62 with SMTP id 62so7162781qkx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jun 2015 08:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bI5DHPDxKwIjuSpHFdhlEZkvjirHU9t3cXbJvBmEseQ=;
	b=g708a2V9sWYNR0xWt24Pc9VeMQm+Qmp4pSwt4BkRWkuS3hMjYy/ca0Sx2yFf521/Nx
	8pHv9qmab2CcENM+dGoNk5yC59gXAyVEVB78QOeWAgcQhRQeHGrIZ1k7YNMayJ5s40+v
	ijFhUMhlLY4QrHHoTM5A4Jq7KSXBYLbqxgtyHiXaKw+eY78YZYZbrHcxG/EZBH2c7Koj
	N8lsvoxe29wmC5iOMC3Jg1Q2yX52CoKbVEor3S0C4xFYLdAp/5o+pQIH7XUIAR0YRHdp
	zCDKKpag7eA/cQ9VA3W0yOPoYnGV6OdCuT8WihLKH5c1goIn3Z++DwRzmdPG7BVh4Hm5
	UyZA==
X-Gm-Message-State: ALoCoQkcFc7xOTxZXQsw4YbIlq0Ojuysuf53KUMR0WO/qSCOEl3Z2ftf+7S2CJAItctiqetL7vV7
X-Received: by 10.140.235.195 with SMTP id g186mr1563039qhc.64.1433344884380; 
	Wed, 03 Jun 2015 08:21:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 3 Jun 2015 08:21:03 -0700 (PDT)
In-Reply-To: <1433342867-4644-2-git-send-email-gary@mlbassoc.com>
References: <1433342867-4644-1-git-send-email-gary@mlbassoc.com>
	<1433342867-4644-2-git-send-email-gary@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Jun 2015 16:21:03 +0100
Message-ID: <CAJTo0LaMZ+pzawi3-UGF+dELq=qDdX2nufMy=8LFUNrs4+opaA@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gst-player: Update to latest GIT
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
X-List-Received-Date: Wed, 03 Jun 2015 15:21:23 -0000
Content-Type: multipart/alternative; boundary=001a11354c8aaca13805179e9c68

--001a11354c8aaca13805179e9c68
Content-Type: text/plain; charset=UTF-8

On 3 June 2015 at 15:47, Gary Thomas <gary@mlbassoc.com> wrote:

> -LIC_FILES_CHKSUM =
> "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=03aeca9d8295f811817909075a15ff65"
> +LIC_FILES_CHKSUM =
> "file://lib/gst/player/gstplayer.c;beginline=1;endline=19;md5=e17548b76f29cc2fe3de3b61f9ff02d6"
>

Please explain why this was changed in the commit log.

Ross

--001a11354c8aaca13805179e9c68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2015 at 15:47, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":84" class=3D"a3s" style=
=3D"overflow:hidden">-LIC_FILES_CHKSUM =3D &quot;file://lib/gst/player/gstp=
layer.c;beginline=3D1;endline=3D19;md5=3D03aeca9d8295f811817909075a15ff65&q=
uot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://lib/gst/player/gstplayer.c;beginline=3D1=
;endline=3D19;md5=3De17548b76f29cc2fe3de3b61f9ff02d6&quot;</div></blockquot=
e></div><br>Please explain why this was changed in the commit log.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></di=
v>

--001a11354c8aaca13805179e9c68--
