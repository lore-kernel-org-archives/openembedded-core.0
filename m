Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4552C75E2D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 19:50:52 +0000 (UTC)
Received: by qget71 with SMTP id t71so134100699qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 12:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fthoD3j1ELf3XkQAxsttJKSKymhLX1SmzlbMEgXLFEE=;
	b=a50i98blkPUZbH1QWiCPSwaZqFK/o/Wrq0XCYJEcQ28Fjc+8Ab8rpZF0yAoZHjhapI
	rD8EAyjr6qBWgNH+KOaOMVgJcdI4HLvNluGV1rishi0PPBwgyIka0/GUwhwHU7VcnJXN
	/1F7Rrmn6CjHWwa1lg45egeePQFUq1/sZAmOwduvNIc5/EvDGgRZygIJ7+u1H5WdHD2n
	b1c1te/Z6ASdK1R8c2CE5x5CCJNHnHgp0Heitr7hvTHIUXV7mw6nb3bux4z8k5PsRn1N
	ZA2fEgOoOhohsk/IdMOkWlkQ8wfdpa2YFpS9XWQWg41npaNepkVuQ4yq3qNJ1f/7e9W3
	m9wQ==
X-Gm-Message-State: ALoCoQnP8i/1Z4dMzToGmPKGTcEd2awKzuPNLE7bh9XarOe9/JpF6jW3Sq1H+eCM38aarmaZTKdZ
X-Received: by 10.140.88.5 with SMTP id s5mr35170917qgd.59.1436557852662; Fri,
	10 Jul 2015 12:50:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 12:50:33 -0700 (PDT)
In-Reply-To: <3EECF939-15F6-43A4-BE87-CC1D57121CD1@gmail.com>
References: <3EECF939-15F6-43A4-BE87-CC1D57121CD1@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 20:50:33 +0100
Message-ID: <CAJTo0LZkMtES=kPa17dV_Sb6P3RYhdGhTK=iuLfJymzykvTBzw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Update rrdtool from 1.4.8 to 1.5.3
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
X-List-Received-Date: Fri, 10 Jul 2015 19:50:53 -0000
Content-Type: multipart/alternative; boundary=001a11c1187481f7c0051a8ab08c

--001a11c1187481f7c0051a8ab08c
Content-Type: text/plain; charset=UTF-8

On 9 July 2015 at 17:38, Jens Rehsack <rehsack@gmail.com> wrote:

> here is an update patch for meta-oe/recipes-extended/rrdtool:
>
> https://github.com/rehsack/meta-openembedded/commit/6ed5b4489beb1233bd4b3c9f73064e973eeef2ad
>

Please send the actual patch instead of a link to the patch, and meta-oe
patches go to openembedded-devel@ not -core@.

Ross

--001a11c1187481f7c0051a8ab08c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 July 2015 at 17:38, Jens Rehsack <span dir=3D"ltr">&lt;<a href=3D"mail=
to:rehsack@gmail.com" target=3D"_blank">rehsack@gmail.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div id=3D":5ym" class=3D"a3s" style=
=3D"overflow:hidden">here is an update patch for meta-oe/recipes-extended/r=
rdtool:<br>
<a href=3D"https://github.com/rehsack/meta-openembedded/commit/6ed5b4489beb=
1233bd4b3c9f73064e973eeef2ad" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/rehsack/meta-openembedded/commit/6ed5b4489beb1233bd4b3c9f73064e9=
73eeef2ad</a></div></blockquote></div><br>Please send the actual patch inst=
ead of a link to the patch, and meta-oe patches go to openembedded-devel@ n=
ot -core@.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a11c1187481f7c0051a8ab08c--
