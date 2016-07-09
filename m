Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id A35D4601B8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jul 2016 09:28:23 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id u201so89639683oie.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jul 2016 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HKd12ySQMXDptxorPijgp6KTZzhL/2xoNdGkPuY+7/8=;
	b=CgWPIJg9b0KKUZdCe+O6HeoSH8bCv/BbKSyzzWeocnHloE0CofuKqbCz5AP1qQ7sxX
	3s2Pn99XKS4tMubdHAYCQk1OGYIN6aZD82jK4Uky3gQSf398eVufwxn/G38qaOcCfRXR
	of4u5k5t1lFHUStcfSVWVb4VSlGd7s8l/w5OcY0bDCJWUTNGaQZO5aRqYUYil/6zynPy
	eXiEBFAPzhAEa5Fy2K4v53bCygC3iEkxIcBtNsPmoEz5jyn2qykb2cZpp3reqwSjD+MF
	RcCOV2c7BqvryIfGoVmElQ72Gi01KhYAdTbzKpVz4rjqrYny8dqPLJUMBlnegh8uwTtZ
	U2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HKd12ySQMXDptxorPijgp6KTZzhL/2xoNdGkPuY+7/8=;
	b=JOTa1ITfbkv+bUWeCIGLPtCqSX1bJLRo6ASuKiZEPD54jlK0gA2cHktGTeBkfkv3il
	04o3ZHDjbjdee4RY5QswO7qXdbjE22+OXNI+zzrNrUit+F0j/vbrfhsXofPi00ts3CPb
	JAazCXkgJSSmrBBcxGx8oLTOE+URkMRZQ7gL656UABz+d9+exgnjij194eLIvhpIDBFn
	n3ULiIGueK3UmjW9OC0930erQLpIPmPdaMOeVTF5MpY/6kqB5xbSxP2hM6+m7wh1XiyW
	Qrkkos7UpMHqTa6Ft1D/x83Jb1PCvL6cJgc2srJTrwPaFWswrPuaHKbyOQTpv7uZU5BJ
	i/3Q==
X-Gm-Message-State: ALyK8tKahCjcluBUOaF903e+U/R9IXU94LiBp4Qmh0sDmcLjaYeT2RYRXigrsJoYIKaAXQ4wzn4AnkG81Qcp/w==
X-Received: by 10.202.73.16 with SMTP id w16mr5504361oia.92.1468056503928;
	Sat, 09 Jul 2016 02:28:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.21.120 with HTTP; Sat, 9 Jul 2016 02:28:23 -0700 (PDT)
In-Reply-To: <1468055970-3187-1-git-send-email-max.krummenacher@toradex.com>
References: <1468055970-3187-1-git-send-email-max.krummenacher@toradex.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Sat, 9 Jul 2016 11:28:23 +0200
Message-ID: <CAEHkU3UpzL-7Be608wfjQC6=oTZuYuNhGRxYqtiyk7+SHzEjcg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-fsl-arm][PATCH] gstreamer1.0-plugins-bad: remove patch
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
X-List-Received-Date: Sat, 09 Jul 2016 09:28:24 -0000
Content-Type: text/plain; charset=UTF-8

Hi

Sorry, wrong list.
Please disregard.

Max

