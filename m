Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.30274.1590410205370039241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 05:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lN8sb+22;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: rama.kesi@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id r2so8150372ioo.4
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/gzDR6/ufzOeKVgn4lKVR7+4M0/Qd5ztPjVU7GO1ILU=;
        b=lN8sb+22z0xKy6xvMP3o36J9XimuLGlU5AwvCAH/M9T0Cn5ucn//JWXl7x12ks8rMC
         MdU9nXIez9YgibZrBSNpYIIuXbEm6DZ1fMDdHD/XE+xkoLbDJQ0wbYNO3/aNauOupMSQ
         ob/OkuSStuAve82fiNjVc8G5izUf0JdxhrHpPRvTJWl0nac4QZrVcPRzH2wmcCb7yWxU
         59AE7CKN6LHp0wve/3wUT3QVEICkjcLYKKDSb2IrSzmEqxTi00DrKqb2/yE3tywBvtKo
         xDd/84NPA0sLMJmoPjzwLf4JageoXcE5gaJepwXj/6FgmY3QRBJCYn4VkQvZI25mRyRX
         SU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/gzDR6/ufzOeKVgn4lKVR7+4M0/Qd5ztPjVU7GO1ILU=;
        b=EcNAf+umwqu9U3mlC+eIf3aYw1FdTnuF3Jg8cQxAwn4/MjQ26yWuhj+XkTC5kU6CIp
         YSXp2hUL7zloVovS2tWH0PWwNfyxPQ1kcvlsMY6vkj0KUEQ/umpiRfEOwVm2dbEQgQOm
         NgsBeSx0PeqjKCfPJd52Ap4lKDtZ02rQM3GqXs6ltIQ6fto1MUhq9/24fafVRC94kgvi
         xCam8dWDDVAVvDOaUFGK3jU89cnBofbeF8BnzB31jkCDRuBBWUyU3ab61ufEWcseaO05
         si90sTLxOiFFnBDzFierF2Dv4X+FVzVj/8xpbLLmiWXpFz4hE8fmkhLfTcxPIlg7Kjbr
         cvIA==
X-Gm-Message-State: AOAM533jHKUpJNJBDM/DNJH/89N6FVKuI5qPmGcbr9cwgcFH7uRmqEzs
	G55rDmzX4m9jUrqNS/bgdFt4Tzpuqqt8lEfLHCpHrIgr6U0=
X-Google-Smtp-Source: ABdhPJxD/ky009RFsbZ0yPQ2qqGFrN9YM2Hu6DpVhutJRUTx3Mo4g6mxGWqb8VDevBio91tM6JzcJ6C7WW6mi2LztF0=
X-Received: by 2002:a05:6638:224d:: with SMTP id m13mr19368397jas.100.1590410204684;
 Mon, 25 May 2020 05:36:44 -0700 (PDT)
MIME-Version: 1.0
From: rama.kesi@gmail.com
Date: Mon, 25 May 2020 18:06:34 +0530
Message-ID: <CAFi1RNj7=wqUK1ebdfKSpUs8uQkXe_=wDvPJDqPHOHBn7xr5mQ@mail.gmail.com>
Subject: Meta Qt5 Qt 5.6.3 compatibility with Yocto 2.4(poky)
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004c241e05a6783b56"

--0000000000004c241e05a6783b56
Content-Type: text/plain; charset="UTF-8"

Hi All,

Can anyone please  let me know if Qt 5.6.3 LTS is compatible with Yocto
project version 2.4 ( poky ) or not to build meta-qt5 recipes of Qt 5.6.3
LTS?

If so, where to pick up the meta-15 recipes for Qt 5.6.3 LTS open source?

Best Regards,
Ramakanth

--0000000000004c241e05a6783b56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br></div><div dir=3D"ltr">Can anyo=
ne please =C2=A0let me know if Qt 5.6.3 LTS is compatible with Yocto projec=
t version 2.4 ( poky ) or not to build meta-qt5 recipes of Qt 5.6.3 LTS?</d=
iv><div dir=3D"ltr"><br></div><div>If so, where to pick up the meta-15 reci=
pes for Qt 5.6.3 LTS open source?</div><div><br></div><div>Best Regards,</d=
iv><div>Ramakanth<span><span><br></span></span></div></div>

--0000000000004c241e05a6783b56--
