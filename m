Return-Path: <sadlife1990@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 516D3738ED
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2015 10:04:33 +0000 (UTC)
Received: by wesw62 with SMTP id w62so1084351wes.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2015 02:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=L/b07jGCQiYaV6QaVusoN9Wc8p9DMF0FcKAxo5npWds=;
	b=d7uAmb3FAG9LWqmofMcyYi2E1S4MhQV+GPy2WilTjax3jUK4sY5fPcNjx1+u1EMdSG
	Jkfqoxdey7XLyZGUXAsFNTZu4oqAkiFCGQ+LLE195UJ0u+zBNFCNPDth6ow/rl0HuYpM
	9akMDtryHYGpQt8clHD4v8bsUxUxoyTuaLQ5lJt7Ly5DKxo6OXmowkhAFLrGInx7bRpL
	r0XXm0Ze9MbgvPKefmDXZ+xOtkH+OPH16ybrljLIKQcG8CgSbrbHdJZMcTYN9gXmPxQ3
	6CTndPFcTIbvJrUUurPS7HLXcjN6ajIfmt3DBXFvjb1EnD3wado8ZFaOO0ThIiUbIOER
	RGug==
MIME-Version: 1.0
X-Received: by 10.180.75.132 with SMTP id c4mr40194036wiw.78.1425722674865;
	Sat, 07 Mar 2015 02:04:34 -0800 (PST)
Received: by 10.194.36.196 with HTTP; Sat, 7 Mar 2015 02:04:34 -0800 (PST)
Date: Sat, 7 Mar 2015 12:04:34 +0200
Message-ID: <CAAHuHfyHaY1fyqeV5K2TCwt3MJ7bjSD-JTs32HZmWruTn3TyTA@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: ghostscript: build cups filters
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
X-List-Received-Date: Sat, 07 Mar 2015 10:04:35 -0000
Content-Type: multipart/alternative; boundary=f46d04389525956a0a0510afedcc

--f46d04389525956a0a0510afedcc
Content-Type: text/plain; charset=UTF-8

Hello,

I found this link, to build ghostscript cups filter but it's failed. Do you
have any idea ? I see error on this line
+RDEPENDS_${PN}-cups = ${PN}

https://git.congatec.com/yocto/poky/commit/b5ad3773afa99580f11292bcc730d355cae2e39a

--f46d04389525956a0a0510afedcc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br><br></div>I found this link, to build ghost=
script cups filter but it&#39;s failed. Do you have any idea ? I see error =
on this line <br>+RDEPENDS_${PN}-cups =3D ${PN}<br><br><a href=3D"https://g=
it.congatec.com/yocto/poky/commit/b5ad3773afa99580f11292bcc730d355cae2e39a"=
 target=3D"_blank">https://git.congatec.com/yocto/poky/commit/b5ad3773afa99=
580f11292bcc730d355cae2e39a</a></div>

--f46d04389525956a0a0510afedcc--
