Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 79D9360593
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 17:19:41 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id oy10so3339525veb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2013 10:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dgZ7N2Q0inSzbsyq9+hPlYmAEhLHy+HV374EH1VnbQY=;
	b=WnuMlM8f0zZFM2H8JCRB1+AlNP/2S+gglQXtu97o6rudwwX6Zcj/22RVseZRZPBsRj
	xbHslqS4BfV9Arn0JdXVt8YTcaCQbha8BWtoLfXn/PmrVpdS1bLLUOl/+qnmFXIkRvKp
	bDi+poHo/Ijuq3Eia1kHufI+SDsflAR0EjCM1Y+adL729S9kg27VqWYjy/9Anf5nECcV
	UgRMVpOIYEYcepVZP1XEoMrRRnlXdtOxfgMev3DefJfK/ZecvhJx4aUn/jIfiWmCgkzc
	0b1StElEmAsOsAy1L10K9Im4CipDL6O5prAqPbZTAVKWV0PKhTzNSdq7Wt4iml4tzW9m
	mTYQ==
X-Received: by 10.52.164.227 with SMTP id yt3mr5118436vdb.107.1375723182030;
	Mon, 05 Aug 2013 10:19:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 5 Aug 2013 10:19:21 -0700 (PDT)
In-Reply-To: <cover.1375714695.git.cristian.iorga@intel.com>
References: <cover.1375714695.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Aug 2013 18:19:21 +0100
Message-ID: <CAJTo0LYVq72WqJX6Maesw69KK5L0mH6A2yZqQhWOtq-Bwa_P0A@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQlhu1j2yuu1c/HpARUseY1Rg+A9+eXEJ/8Oymw1cAqSpbfTBGGGj3OjlexlKOPT9aPT4MzU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] various upgrades
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
X-List-Received-Date: Mon, 05 Aug 2013 17:19:41 -0000
Content-Type: text/plain; charset=UTF-8

On 5 August 2013 15:59, Cristian Iorga <cristian.iorga@intel.com> wrote:
> Cristian Iorga (4):
>   neon: upgrade to v0.30.0
>   gstreamer1.0-plugins-ugly: upgrade to v1.0.9
>   telepathy-glib: upgrade to v0.20.4
>   harfbuzz: upgrade to v0.9.19

I just sent a mail about harfbuzz, but
neon/gstreamer1.0-plugins-ugly/telepathy-glib look good.

Ross

