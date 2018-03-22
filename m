Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 58670788EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 06:26:51 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id w3so4887765uae.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 23:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=WgG7Qjgo4oFVnldKUJx5tvmsLZ1gVp/EKou5SORJ4Pk=;
	b=EV8GBB6iKnaO+t/nkrY3y/2sC0G6V8UA8Bd+R35jHpRmA2C6haFD7m6wcWEsXLPU/h
	IoAVee6lwEagDIdc64pGfC360uu2XK1wCMKTCoDmyGkPYACApkBHwA98Fu255rAXa2dq
	yP6qjnD/WuOAiCgf4/k+VyROklqdjerNsBOnhaKNIih2AFFjFMY1k/0JyV35Z9OFG8o0
	LsDtUy7x0TnavaHNOOuFDSLAoUNTxJZEykWrac9ckIICNwJ58t8h6Ph4U4TvB4z27ZGR
	lgRraesq5pNMMvbzYU1auBuBlSYAZpVJtoQ8799SoQ3VbHj3u9jIlWYn428R9Ux0iPN2
	gkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=WgG7Qjgo4oFVnldKUJx5tvmsLZ1gVp/EKou5SORJ4Pk=;
	b=INz62/T+AFw8to+P8JnzD2KBWH6pxv2f824cbjON4rBexOFcldSmk/hv7RhThFTI+g
	nQBXWD6aUQyPgfngr7UHt7RASDv4g14GvWr2P8xwtAB93AQGnlrMd6D4/FTnuYapPALB
	sc9XsI3R9pPtLRns59owgfrkIX4VP451NZ/QQMEDgEgnjajQ7jP9gPiVYRDb9lMwWhsR
	A9/PA51HsyxNCHh0bCjYbsqfe+jYNrIn7fX9HDHpE+2P6/T1UTUSTSyHlGZuGurEkWVy
	rD4mPtXSQoDpEUozPhG7c5gAXRBQZualkxEl6akmwGx4KLxhASZKWZFZ4yKm7Ed9a5dO
	IvLQ==
X-Gm-Message-State: AElRT7ETtePXLUDcqHaVKqn5sB8ECdRS1CfGQl2BW8atWD908ndQkIE0
	tcFXUQLYn8/gELVbvQDZ4VZMz3KX400p0a+egqtUBQ==
X-Google-Smtp-Source: AG47ELunIw3QGXZpFQCwTHh2KbKJLSOzmGsUlh8CUW3pzC6a0pD8CO9qJaDnkZwkjcS6R/8xrgQIa9YQ9NZJk2w3rvo=
X-Received: by 10.159.53.105 with SMTP id o96mr16798939uao.33.1521700012866;
	Wed, 21 Mar 2018 23:26:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Wed, 21 Mar 2018 23:26:52 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 22 Mar 2018 11:56:52 +0530
Message-ID: <CAPGMVzE+s2x_3LE1q+j+ovb4JoBrX4TCLjwf4cyyLyUxAXgSMg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: devtool add query
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
X-List-Received-Date: Thu, 22 Mar 2018 06:26:52 -0000
Content-Type: multipart/alternative; boundary="94eb2c04c644b8c1800567fa6414"

--94eb2c04c644b8c1800567fa6414
Content-Type: text/plain; charset="UTF-8"

hello all,

i am working on devtool and when i use 'devtool add' followed by the url,
can  this URL be a github repo because from the video source i was learning
dev tools the person teaching had added a tar.gz URL only; i wanted to know
if this URL can be a github repo too..??
Thanks

--94eb2c04c644b8c1800567fa6414
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>hello all,<br><br></div>i am working on devtool =
and when i use &#39;devtool add&#39; followed by the url, can=C2=A0 this UR=
L be a github repo because from the video source i was learning dev tools t=
he person teaching had added a tar.gz URL only; i wanted to know if this UR=
L can be a github repo too..??<br></div>Thanks<br></div>

--94eb2c04c644b8c1800567fa6414--
