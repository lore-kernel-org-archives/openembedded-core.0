Return-Path: <sadlife1990@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id DB9BD71A2D;
	Tue, 18 Apr 2017 12:24:37 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id q26so90017225uaa.0;
	Tue, 18 Apr 2017 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=dRmtJePxXylpqb1hYYkkCqCHUjEGt31Yh+sqe+rklVY=;
	b=qs1h2XY9vrifZouijpqkXWyyrf4lt1WV+UC7uDv48HDZBda/iD+JQIseMGgA/wt+EJ
	IVLmorpY2cABIDMy178H0xRItOuVegSzyvmdRZ+7bPlx2pkNXHFvbC/R0pcQkxepHQbS
	1qhx4YKtl1c1eIFTgA6YUVcmF45HLiQ93QRNqhxcERD2or6AocPjZUWomQc5BaYg931a
	swsTG+6yScxq+6gBkod9S/q2qsLzt6ibH0XW6gsePGBjIflNH6HOjJSShc8Bt/QzDoFX
	9qujtHXRW5xEpLuxZKIdS/NnoBi0uBqhDTkXycKCSaDcZqmD2lhAihLjAARpSWmYkmSQ
	E2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=dRmtJePxXylpqb1hYYkkCqCHUjEGt31Yh+sqe+rklVY=;
	b=TZXPe0Dd3GGIV0ic9e7OkVC6q/X6VwuV1BLy8Wj01tqpLBLEH9QkqPMXxpBCK8giXC
	axQeODcZoaooT/mgnNTejAKV7F9udQr8aAsd0uTv9ZVaBZDfQdC87d+ZdcWzRmq/e4In
	Ry5EIf8AjFeSUQboQz26w91I4mRHNUKUCa+ljf7QbFqhPT10zIr93wSt1FDh2uAxFjjL
	1WA8VWhki/PVVwPrCi9b2O4yQSXM4jmlvxjcD1tDj2OgLz+iBwk8bh7cl0GyF2co/T9G
	+gHZhx+FqlQIUTe5WzDT6XaLR1rskCl0yx6yAiViT7nJxhkO+qV21R+pwNV5AoG9NRoD
	qK3A==
X-Gm-Message-State: AN3rC/7FIdNcp2qhBMw06kaznhwf+tuir0zzM49lVgwbrzWrtdd//e4r
	/oCGWtaQo+meGW3gNmXnBT2UsH9X6Ld1
X-Received: by 10.176.78.29 with SMTP id g29mr6613089uah.55.1492518278820;
	Tue, 18 Apr 2017 05:24:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.32.105 with HTTP; Tue, 18 Apr 2017 05:24:38 -0700 (PDT)
From: Weng Josn <sadlife1990@gmail.com>
Date: Tue, 18 Apr 2017 15:24:38 +0300
Message-ID: <CAAHuHfyWegZ3OYy97i_+r1DXQ0v_YsozhV7VLeqwepiUWnZ1kg@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Yocto cups serial port support
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
X-List-Received-Date: Tue, 18 Apr 2017 12:24:38 -0000
Content-Type: multipart/alternative; boundary=f40304378a6cd47a55054d6ffdbd

--f40304378a6cd47a55054d6ffdbd
Content-Type: text/plain; charset=UTF-8

Hello,


I checked /usr/lib/cups/backend not inclued "serial" backend.
How can enable cups serial port ?



Thanks.

--f40304378a6cd47a55054d6ffdbd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div><br></div><div>I checked=C2=A0/u=
sr/lib/cups/backend not inclued &quot;serial&quot; backend.<br></div><div>H=
ow can enable cups serial port ?</div><div><br></div><div><br></div><div><b=
r></div><div>Thanks.</div></div>

--f40304378a6cd47a55054d6ffdbd--
