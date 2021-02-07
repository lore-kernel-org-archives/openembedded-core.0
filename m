Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.23943.1612722316502244167
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 10:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fZLRz4HD;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id l12so15629967edt.3
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 10:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qwer5mDJELLg7s1cRvFGbtD82GYx/kzcB7/oUWPOdfY=;
        b=fZLRz4HDDgYy9b9Z3ot6n+bvqaGF94qlbytOPTfLiaXij0ZvCQe1gjV818QUeo98nz
         MkLkIiUCQ2BDp177T9zaCvx1IV+CuhR9oW//wM/cE63pVMLPGGfFV4ps7Z0czeIMMN1B
         jxs9zerpOCwMu01vbP0W9mpSfjmagGeV67OqhOFgCsDCLtIoFEcOGFu1xkoWTlDb/IDZ
         5eNZvBuzHMDfE0II88ROor8icyGgNuRyOn5s70ajthotxRwaZXrdLe3LEKHgehoib6cU
         TJt18McYaZesKybPhuIZFzZM33Gq7+AdLQ8MRXHc2zNfnpuBFrUkZPoU+PziqKUIAT6J
         Ryiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=qwer5mDJELLg7s1cRvFGbtD82GYx/kzcB7/oUWPOdfY=;
        b=ueFk6NGqSpGq5OWWNFamkx2MbdNGCs8ON6VhWZVwYX88I7B6gMsC+Q+k+ggBaWk0fY
         QHPPX8QUcgRYIJbTwpqckMNSRaW0DtVni4HyK0uuFlRFeVo6LeqGeQPOZdD14rsilW3X
         8v+Tj09+OTS+DNy2/aXTsfz2rUWpzW6aCyh3a+XOa4E56vdwEOl55+9xJ7f4Ygs3xYMi
         zqTyELor8TaPn9kOfsa7SxRdaljIr4HexXA/uVSVAoOIOI/UkAkswIN/ydKZDGd9RpWT
         WIsVsdP6POA82n0dsbkVi81prEGJaP4fGg3uqKrOZDaYqUl9NU3v5G49QLPv+/INTXid
         NNTQ==
X-Gm-Message-State: AOAM5310DSJBTQtlGdllNk13BNF6KdWoPlt0v5aeq9Dyfd8WA/EINnQU
	mTGmdnCJtF11R8nGmqKn3WAb+H1MlPw0eceNws/FB5tH/Q9YPA==
X-Google-Smtp-Source: ABdhPJwmzFwKZAw9l6BDvzoIJR4kEKw4k5SyKhYV2D9hUC+cn1DL32Q+7Q9oTLQEyVVPM1n2FK+UZzeD6b4jVWKKTXM=
X-Received: by 2002:aa7:c685:: with SMTP id n5mr14169843edq.150.1612722314911;
 Sun, 07 Feb 2021 10:25:14 -0800 (PST)
MIME-Version: 1.0
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 7 Feb 2021 18:25:04 +0000
Message-ID: <CANPvuRnNWyXvUkwZwPNhGPPDwxUqOMH-f8bKAdC8p1MvHiP1iQ@mail.gmail.com>
Subject: OE-Core and bitbake patchwork apparently is dead
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b3a40a05bac32c8b"

--000000000000b3a40a05bac32c8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Patchwork Bitbake Task Executor: last update on 2020-10-28
https://patches.openembedded.org/project/bitbake/series/?ordering=3D-last_u=
pdated

Patchwork OpenEmbedded Core Layer: last update on 2020-12-18
https://patches.openembedded.org/project/oe-core/series/?ordering=3D-last_u=
pdated

Patchwork Meta OpenEmbedded Layers: last update on 2021-02-04
https://patches.openembedded.org/project/oe/series/?ordering=3D-last_update=
d

Patchwork Yocto Project Layers: last update on 2021-02-05
https://patches.openembedded.org/project/yocto/series/?ordering=3D-last_upd=
ated

Patchwork Yocto Documentation: last update on 2021-02-05
https://patches.openembedded.org/project/docs/series/?ordering=3D-last_upda=
ted

Something is wrong with OE-core and bitbake patchwork.

--=20
best regards,
Jos=C3=A9 Quaresma

--000000000000b3a40a05bac32c8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>Patchwork Bitbake Ta=
sk Executor: last update on 2020-10-28<br></div><div></div><div><a href=3D"=
https://patches.openembedded.org/project/bitbake/series/?ordering=3D-last_u=
pdated">https://patches.openembedded.org/project/bitbake/series/?ordering=
=3D-last_updated</a><br></div><div><br></div><div>Patchwork OpenEmbedded Co=
re Layer: last update on 2020-12-18</div><div><a href=3D"https://patches.op=
enembedded.org/project/oe-core/series/?ordering=3D-last_updated">https://pa=
tches.openembedded.org/project/oe-core/series/?ordering=3D-last_updated</a>=
<br></div><div><br></div><div><div>Patchwork Meta OpenEmbedded Layers: last=
 update on 2021-02-04<br></div><div><div></div></div><div></div><div><a hre=
f=3D"https://patches.openembedded.org/project/oe/series/?ordering=3D-last_u=
pdated">https://patches.openembedded.org/project/oe/series/?ordering=3D-las=
t_updated</a><br></div><div></div></div><div><div><br></div><div>Patchwork =
Yocto Project Layers:=C2=A0last update on 2021-02-05</div><div></div></div>=
<div><a href=3D"https://patches.openembedded.org/project/yocto/series/?orde=
ring=3D-last_updated">https://patches.openembedded.org/project/yocto/series=
/?ordering=3D-last_updated</a><br></div><div><br></div><div>Patchwork Yocto=
 Documentation: last update on 2021-02-05<br></div><div><a href=3D"https://=
patches.openembedded.org/project/docs/series/?ordering=3D-last_updated">htt=
ps://patches.openembedded.org/project/docs/series/?ordering=3D-last_updated=
</a><br></div><div><br></div><div>Something is wrong with OE-core and bitba=
ke patchwork.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">best regards,<=
br>Jos=C3=A9 Quaresma</div></div></div>

--000000000000b3a40a05bac32c8b--
