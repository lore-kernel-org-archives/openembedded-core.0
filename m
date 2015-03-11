Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6D42373A54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 12:55:32 +0000 (UTC)
Received: by qgfh3 with SMTP id h3so9567914qgf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 05:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=K2BizKvGCScuN6B9tM3dbtSt+RRj8/80JyFJjPKkhX0=;
	b=ILc6u63IRzpL7fIknCqr7bo9YJhBELdZQnouQDhHtQ0b+YN0rfZykv0q+M8aAxsZse
	xjejjz1cYdmRjRv+V2W5bSoydOn6r/D2xxErxwG8lysPJ1//C7RZMBc1X4irNAvqOc0p
	ikB8AHBBW2/QOFxH/jxTOTKsEEjqVXkOSg8AxASJXmeibZc5l/G1RX9YqymcnkbB+jeq
	QCVor42/0fH4jyAXDS7DeqDIUrrdvRTF8EJ3S+5alBbpahBSn0Xc4T3TOOF5Gkn95YK7
	vVVuScIwFyZyQYqi+ZNdAqU+YANuz6hjveAtmeIec0hWBVsN2ndrW4Hy7/dyc2SEwbft
	dMpA==
X-Gm-Message-State: ALoCoQkKBrYcCtzmoh2t1Xyc6HVrIDxsvddEejGM/fNDqu0tCbkAa7QKkw4fITIfi++Wxdt6n8Az
X-Received: by 10.55.15.30 with SMTP id z30mr19840873qkg.87.1426078533297;
	Wed, 11 Mar 2015 05:55:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 11 Mar 2015 05:55:12 -0700 (PDT)
In-Reply-To: <550036F5.8030004@gmail.com>
References: <1426057202-17789-1-git-send-email-net147@gmail.com>
	<CAJTo0LbQA+cRhkjR07cYLA22=tbqqsukfCFCKbOaA1Janpc+og@mail.gmail.com>
	<550036F5.8030004@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Mar 2015 12:55:12 +0000
Message-ID: <CAJTo0La4E4u_sG32qYY4gBQG5NvgEYOshKPKRquHeR+ZJfbZkw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split libsmartcols into separate sub-package
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
X-List-Received-Date: Wed, 11 Mar 2015 12:55:34 -0000
Content-Type: multipart/alternative; boundary=001a113ad648665b41051102c8e6

--001a113ad648665b41051102c8e6
Content-Type: text/plain; charset=UTF-8

On 11 March 2015 at 12:37, Jonathan Liu <net147@gmail.com> wrote:

> Perhaps. I don't have experience in that area.
>

Just done it, will send the patch once I've eaten lunch.

Ross

--001a113ad648665b41051102c8e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2015 at 12:37, Jonathan Liu <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div bgcolor=3D"#FFFFFF" text=3D"#00=
0000">Perhaps. I don&#39;t have experience in that area.<br></div></blockqu=
ote></div><br>Just done it, will send the patch once I&#39;ve eaten lunch.=
=C2=A0</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a113ad648665b41051102c8e6--
